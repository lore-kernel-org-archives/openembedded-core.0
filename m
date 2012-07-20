Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss51l-0004sL-Dl
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:41:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jul 2012 21:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181052587"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2012 21:29:57 -0700
Message-ID: <5008DEC5.6050701@linux.intel.com>
Date: Thu, 19 Jul 2012 21:29:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342609472-5729-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1342609472-5729-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] binutils: package ld.gold symlink
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
X-List-Received-Date: Fri, 20 Jul 2012 04:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2012 04:04 AM, Martin Jansa wrote:
> * fixes:
>    NOTE: package binutils-2.22-r11: task do_package: Started
>    WARNING: QA Issue: binutils: Files/directories were installed but not shipped
>      /usr/bin/ld.gold
>    NOTE: package binutils-2.22-r11: task do_package: Succeeded
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.22.inc |    2 +-
>   meta/recipes-devtools/binutils/binutils.inc      |    1 +
>   2 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
> index ca2d30e..e776985 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.22.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
> @@ -1,4 +1,4 @@
> -PR = "r11"
> +PR = "r12"
>
>   LIC_FILES_CHKSUM="\
>       file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 5c8e55b..cd923bd 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -36,6 +36,7 @@ FILES_${PN}-symlinks = " \
>   	${bindir}/gprof \
>   	${bindir}/ld \
>   	${bindir}/ld.bfd \
> +	${bindir}/ld.gold \
>   	${bindir}/nm \
>   	${bindir}/objcopy \
>   	${bindir}/objdump \
>


Merged into OE-Core

Thanks
	Sau!


