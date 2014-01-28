Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCFE6E82D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 16:02:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2014 08:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,736,1384329600"; d="scan'208";a="473815154"
Received: from unknown (HELO [10.255.13.56]) ([10.255.13.56])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2014 08:01:01 -0800
Message-ID: <52E7D43D.5030208@linux.intel.com>
Date: Tue, 28 Jan 2014 08:01:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Mikhail_Durnev@mentor.com, openembedded-core@lists.openembedded.org
References: <1390894749-8639-1-git-send-email-Mikhail_Durnev@mentor.com>
In-Reply-To: <1390894749-8639-1-git-send-email-Mikhail_Durnev@mentor.com>
Subject: Re: [PATCH] unzip: Pass LDFLAGS to the linker
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
X-List-Received-Date: Tue, 28 Jan 2014 16:02:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2014 11:39 PM, Mikhail_Durnev@mentor.com wrote:
> From: Mikhail Durnev <Mikhail_Durnev@mentor.com>
>
> Change Makefile to use LDFLAGS
>
> Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
> ---
>   .../unzip/unzip/define-ldflags.patch               |   16 ++++++++++++++++
>   meta/recipes-extended/unzip/unzip_6.0.bb           |    5 +++--
>   2 files changed, 19 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/unzip/unzip/define-ldflags.patch
>
> diff --git a/meta/recipes-extended/unzip/unzip/define-ldflags.patch b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
> new file mode 100644
> index 0000000..a3e5178
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
> @@ -0,0 +1,16 @@
> +Pass LDFLAGS to the linker
> +
> +Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
> +
Additionally this needs an Upstream-Status:

Please review
http://openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!


> +diff -Naur old/unix/configure new/unix/configure
> +--- old/unix/configure	2014-01-13 21:59:27.000000000 +1100
> ++++ new/unix/configure	2014-01-14 16:36:02.000000000 +1100
> +@@ -16,7 +16,7 @@
> + CFLAGSR=${CFLAGS}
> + IZ_BZIP2=${3}
> + CFLAGS="${CFLAGS} -I. -DUNIX"
> +-LFLAGS1=""
> ++LFLAGS1=${LDFLAGS}
> + LFLAGS2=""
> + LN="ln -s"
> +
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
> index 584802a..33c20f8 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -4,10 +4,11 @@ SECTION = "console/utils"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
>   PE = "1"
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
> -	file://avoid-strip.patch"
> +	file://avoid-strip.patch \
> +	file://define-ldflags.patch"
>
>   SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
>   SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
>

