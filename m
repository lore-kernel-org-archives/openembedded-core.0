Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1S7UGY-0004hW-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:08:02 +0100
Received: from mail-bk0-f52.google.com ([209.85.214.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Mar 2012 08:59:16 -0700
Received: by bkcjm19 with SMTP id jm19so569598bkc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 08:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=NcwmBh541cXMa9YyhxK7ijDNZD+BcHWhrE+tGYtC3eE=;
	b=GDLAwi+OMx6wDof/Rd7dmLXK9A1bqtN5ih0yOYm3voLkzDHjDnIs4k924DNkihBzMT
	WEIjIoXpZZj83FH9zEBze+lFAT+QEzSpXgIyZIj008eOKHhw0cooGvoiIXM1HGIdAXAr
	Zq3AfU8GmESh6WhE92vDxiyMx32yg73F/XClAKyQ8STGt7MHsfnhuPq2tTsZWdoKHVqr
	fi2EULheErJowNPPgLQ6If6zt+fR6xXAFspKNQBzPjj8GPHEuAutMlauVM23ODmuzAIt
	GX4i2gH55ByYKBGII63Pc8XQahLUkqJbzInROxpFIPTILGgmsuqnzkVaguITf2x9MhgR
	KofQ==
Received: by 10.204.154.139 with SMTP id o11mr6458734bkw.4.1331654354721;
	Tue, 13 Mar 2012 08:59:14 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id je3sm2321757bkb.15.2012.03.13.08.59.12
	(version=SSLv3 cipher=OTHER); Tue, 13 Mar 2012 08:59:13 -0700 (PDT)
Message-ID: <4F5F6ECF.6080000@intel.com>
Date: Tue, 13 Mar 2012 08:59:11 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331047183.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1331047183.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQlMaIHmqSMMLBu5tRm4RqjV1OOWhoUKgr4kZjfzzCl0xMba/pOW7lZIY9e6iaB/h4c813MX
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/2] linux-yocto/3.2: minor -rt increment and fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 16:08:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 07:24 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> This is another kernel SRCREV update that should be stacked on the
> end of my other pending patches. I've kept everything separate so
> we can track the incremental changes.
>
> This one is a minor update to the 3.2 tree.
>
>    - there were a few config files that moved between 3.0 and 3.2
>      and I'm adjusting the BSPs to match
>    - 3.2.9-rt16 came out with a fix we want, so I've bumped the
>      3.2 rt BSPs to pick it up.
>
> cc: Darren Hart<dvhart@linux.intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 3e07ca64df8b16348520fa72d88f0ef54b5fee77:
>
>    linux-yocto/meta-yocto: v3.2.9, v3.0.23 + fixes and updates (2012-03-06 10:18:11 -0500)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-3.2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-3.2
>
> Bruce Ashfield (2):
>    linux-yocto/meta: fix incorrect config references
>    linux-yocto/rt: udpate SRCREVs to 3.2.9-rt16
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    6 +++---
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!




