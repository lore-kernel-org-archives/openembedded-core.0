Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 12BCC6AB68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 17:12:59 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jun 2013 10:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,860,1363158000"; d="scan'208";a="254618145"
Received: from unknown (HELO [10.255.13.2]) ([10.255.13.2])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jun 2013 10:12:33 -0700
Message-ID: <51B9FD81.6030405@linux.intel.com>
Date: Thu, 13 Jun 2013 10:12:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Upgrade to 4.8.1
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
X-List-Received-Date: Thu, 13 Jun 2013 17:12:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 02:57 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.8.inc |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 80bd02c..6664f1c 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -6,7 +6,7 @@ require gcc-common.inc
>   # on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>   # to reflect that change
>
> -PV = "4.8.0"
> +PV = "4.8.1"
>

Khem, Otavio:

Not sure if it was this change or 4.8 in general, but there are a number 
of failures in the FSL-ARM and FSL-PPC builds:

PPC Issues (gettext / mfpr):
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc/builds/141/steps/Building%20Images/logs/stdio
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc-lsb/builds/139/steps/Building%20Images/logs/stdio

ARM Issues (both in perf):
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-arm/builds/140/steps/Building%20Images/logs/stdio

Can one or both of you look into this.

Thanks
	Sau!


>   # BINV should be incremented after updating to a revision
>   # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
> @@ -14,7 +14,7 @@ PV = "4.8.0"
>   # 4.7.1 then the value below will have 2 which will mean 4.7.2
>   # which will be next minor release and so on.
>
> -BINV = "4.8.0"
> +BINV = "4.8.1"
>
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.8' ], d)}"
>
> @@ -68,8 +68,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>   	   file://gcc-4.8-PR56797.patch \
>   	   file://gcc-4.8-build-args.patch \
>   	  "
> -SRC_URI[md5sum] = "e6040024eb9e761c3bea348d1fa5abb0"
> -SRC_URI[sha256sum] = "b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
> +SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
> +SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
>
>   S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>   B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>

