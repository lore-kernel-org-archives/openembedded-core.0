Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmptB-0003D6-31
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:30:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2012 10:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167441952"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:19:43 -0700
Message-ID: <4FF5CCAF.9040509@linux.intel.com>
Date: Thu, 05 Jul 2012 10:19:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Paul Gortmaker <paul.gortmaker@windriver.com>
References: <4FF33085.1070703@linux.intel.com>
	<1341415425-16073-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1341415425-16073-1-git-send-email-paul.gortmaker@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: make FILESDIR a shared setting via FILESPATH
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
X-List-Received-Date: Thu, 05 Jul 2012 17:30:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 08:23 AM, Paul Gortmaker wrote:
> The setting is the same in all recipes, so move it to
> the shared settings in u-boot.inc
>
> Since FILESDIR is also being phased out, use the FILESPATH
> setting as suggested by Richard Purdie.
>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>
> [ PG: Retested builds for 8315 and beagleboard ]
>
>   meta/recipes-bsp/u-boot/u-boot.inc           |    1 +
>   meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
>   meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
>   meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
>   4 files changed, 1 insertion(+), 6 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 5de3583..664c2e6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -59,6 +59,7 @@ do_install () {
>   }
>
>   FILES_${PN} = "/boot"
> +FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
>
>   do_deploy () {
>       install -d ${DEPLOYDIR}
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> index e99bc2c..ed38f54 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> @@ -10,8 +10,6 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>                       file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
>
> -FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> -
>   # This revision corresponds to the tag "v2011.03"
>   # We use the revision in order to avoid having to fetch it from the repo during parse
>   SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> index 680401f..da61852 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> @@ -10,8 +10,6 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>                       file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
>
> -FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> -
>   # This revision corresponds to the tag "v2011.06"
>   # We use the revision in order to avoid having to fetch it from the repo during parse
>   SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> index dbdc663..25cc8c9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> @@ -14,8 +14,6 @@ DEFAULT_PREFERENCE = "-1"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
>
> -FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> -
>   # This revision corresponds to the tag "v2012.04.01"
>   # We use the revision in order to avoid having to fetch it from the
>   # repo during parse
>



