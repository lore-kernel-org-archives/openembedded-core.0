Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SuTgG-0008GZ-KP
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:25:04 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 12:12:23 -0700
Received: by pbbro8 with SMTP id ro8so3679819pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=tGzWj10cEu5/aWh6JxnvHPJAqijjy0mEnfdQrd7fiI8=;
	b=lpfw6nrBC3LSHF0baelglNiZpsX8ck52eqU6hwuGGbWJlQ0n/7Kiqj/dtE4Us9JYuz
	hVQGmRG1NzqJWzXsjeQ0NDiztgFksb5fZ0L7wDzI648tX8AqvNB0/Rx+4a/i59VCHvgC
	R/Z1TWVlKRbRhD09pxkbaixaItXcn/u61pncRIZ2oIbICnfgy/ULMnbK19V5d6bzUppO
	M3dPaPtYxUynzg4O7ZQIA5qYMAgPbykiOamt7X+xJp1sL9pBqPYwycSgHl2TyrqpnMdQ
	7/jXaqZgskV8oj8Ia5neHspaxYqcmyU9SLG2+zdeEw8cMQXqwfn0gvTJE5BUY9Fp/8NG
	ilYg==
Received: by 10.68.226.102 with SMTP id rr6mr7385653pbc.99.1343329942915;
	Thu, 26 Jul 2012 12:12:22 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id tj4sm244898pbc.33.2012.07.26.12.12.21
	(version=SSLv3 cipher=OTHER); Thu, 26 Jul 2012 12:12:21 -0700 (PDT)
Message-ID: <50119694.40906@intel.com>
Date: Thu, 26 Jul 2012 12:12:20 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343209283.git.kai.kang@windriver.com>
In-Reply-To: <cover.1343209283.git.kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQllt8bJJ+rI23GovnbHhPxvXL35brDVN8uHufVe36FR5xzs2hiXV74wBEvzX6AD9QDaqtff
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/3] Update packages
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
X-List-Received-Date: Thu, 26 Jul 2012 19:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 02:42 AM, Kang Kai wrote:
> Hi Saul,
>
> These patches update liburi-perl, qmmp and ltp.
>
> Regards,
> Kai
>
> The following changes since commit 0ffb02eec2beaea27ff0ec9d3d31b0a09e675a4c:
>
>    documentation: Updated the h6 style to use a larger font (2012-07-24 10:35:34 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs
>
> Kang Kai (3):
>    ltp: update to version 20120614
>    qmmp: update 0.6.1
>    liburi-perl: update to 1.60
>
>   .../{liburi-perl_1.59.bb => liburi-perl_1.60.bb}   |    7 +++----
>   .../ltp/ltp/fix_building_fom_archive.patch         |   13 -------------
>   .../ltp/{ltp_20120401.bb => ltp_20120614.bb}       |   12 +++++-------
>   .../qt-apps/{qmmp_0.5.2.bb => qmmp_0.6.1.bb}       |    8 ++++----
>   4 files changed, 12 insertions(+), 28 deletions(-)
>   rename meta/recipes-devtools/perl/{liburi-perl_1.59.bb => liburi-perl_1.60.bb} (81%)
>   delete mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>   rename meta/recipes-extended/ltp/{ltp_20120401.bb => ltp_20120614.bb} (91%)
>   rename meta/recipes-qt/qt-apps/{qmmp_0.5.2.bb => qmmp_0.6.1.bb} (90%)
>

Merged into OE-Core

Thanks	
	Sau!





