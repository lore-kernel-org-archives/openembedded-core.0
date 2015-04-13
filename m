Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id A18AE73D66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 20:16:46 +0000 (UTC)
Received: by widjs5 with SMTP id js5so73141429wid.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZE5ivBF7vSva5Cc22Dyr382v/uI6n4Jet5OFnYUdEmc=;
	b=WVV6kzGMYxu/CpZoQxTE7vhz3QdT3PAQRo2j4G3l4ky4ODWGS6M/bpAgHoIkbok2a2
	TAc7npnHiXV5X9IZYVK0hfVMf0Y5OAr2oU82x+Z5NoBWyX/lfKEN4oTFFKWfzfjAtgm/
	zRFWSd4yF+QAC0V2gW7mSQ6zmoV7OfQhaPxpkvGUnO7OkE712dQMltxMdeh3TdVTv+il
	JEuDdaPUHSoiv/kocooKEMvY3afRHGINPaJYr/W9ZeDXq+KpQesQ01gco9vLTDUWkqWC
	O3STFBy1slSgNUYy6ewLljEduwgztKKgtaIC5ESVrAITO7rHYpZ7vvRbxvepcou8FMea
	uIOg==
X-Received: by 10.181.11.137 with SMTP id ei9mr24292510wid.48.1428956207835;
	Mon, 13 Apr 2015 13:16:47 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id bi3sm4515765wib.5.2015.04.13.13.16.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 13:16:47 -0700 (PDT)
Message-ID: <552C2433.8000704@gmail.com>
Date: Mon, 13 Apr 2015 22:16:51 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1428939671.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1428939671.git.patrick.ohly@intel.com>
Subject: Re: [PATCH 0/1] ssh host key
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2015 20:16:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Patrick,

you should have a look at HAVEGED. It's an entropy generator for
headless machines. It should also help you on qemu devices.

Regards,
Sven

Am 13.04.2015 um 17:44 schrieb Patrick Ohly:
> I had problems under qemu with getting the ssh host key generated (not enough
> entropy). That problem still persists, but perhaps is less severe on real
> hardware and for me. Having the same ssh host key for the qemu test machine
> was good enough for me and potentially also others, so here's an utility
> class which helps achieving that.
> 
> The following changes since commit a7d8eaef04c9dd6ede8d4efd8c4b776efbe3c767:
> 
>   shadow: split files needed for PAM use into separate package (2015-04-09 19:48:04 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/pohly/openembedded-core master
>   https://github.com/pohly/openembedded-core/tree/master
> 
> Patrick Ohly (1):
>   rootfsdebugfiles.bbclass: quick-and-dirty installation of additional
>     files
> 
>  meta/classes/rootfsdebugfiles.bbclass | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta/classes/rootfsdebugfiles.bbclass
> 

