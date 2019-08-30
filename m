Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C07917F3DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:03:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U33QII029635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 20:03:27 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 29 Aug 2019 20:03:26 -0700
To: Adrian Bunk <bunk@stusta.de>, <openembedded-core@lists.openembedded.org>
References: <20190825172116.23759-2-bunk@stusta.de>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <3023c089-61bf-dfc0-bc7e-1a5864febcb9@windriver.com>
Date: Fri, 30 Aug 2019 11:04:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190825172116.23759-2-bunk@stusta.de>
Subject: Re: [PATCH] Remove LSB support
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
X-List-Received-Date: Fri, 30 Aug 2019 03:03:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Adrian,

On 8/26/19 1:21 AM, Adrian Bunk wrote:
> The only part with some (marginal) usage is lsb_release,
> which is split from the lsb package into an own lsb-release
> package.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
> https://github.com/AdrianBunk/meta-lsb contains a preliminary

Do you have a plan to move it to git.yoctoproject.org or git.openembedded.org, 
please?

// Robert

> meta-lsb layer, looking for a maintainer.
> ---
>   README.LSB                                    |  29 -
>   meta/conf/distro/include/distro_alias.inc     |   6 -
>   meta/conf/distro/include/maintainers.inc      |   6 +-
>   meta/lib/oeqa/manual/bsp-hw.json              |   2 +-
>   meta/lib/oeqa/manual/compliance-test.json     |  32 +-
>   .../lib/oeqa/manual/toaster-managed-mode.json |  14 +-
>   .../packagegroups/packagegroup-self-hosted.bb |   2 +-
>   .../bootchart2/bootchart2_0.14.8.bb           |   2 +-
>   .../images/core-image-lsb-dev.bb              |   7 -
>   .../images/core-image-lsb-sdk.bb              |  12 -
>   .../recipes-extended/images/core-image-lsb.bb |  14 -
>   ...e-to-work-with-busybox-head-and-find.patch |   0
>   meta/recipes-extended/lsb/lsb-release_1.4.bb  |  37 ++
>   meta/recipes-extended/lsb/lsb/init-functions  |  44 --
>   meta/recipes-extended/lsb/lsb/lsb_killproc    |   6 -
>   meta/recipes-extended/lsb/lsb/lsb_log_message |  27 -
>   meta/recipes-extended/lsb/lsb/lsb_pidofproc   |   6 -
>   .../recipes-extended/lsb/lsb/lsb_start_daemon |  45 --
>   meta/recipes-extended/lsb/lsb_5.0.bb          | 136 -----
>   ...exit-1-which-causes-init-scripts-to-.patch |  21 -
>   .../lsb/lsbinitscripts/functions.patch        |  33 --
>   .../lsb/lsbinitscripts_9.79.bb                |  31 --
>   meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 525 ------------------
>   .../lsb/lsbtest/packages_list                 |  49 --
>   meta/recipes-extended/lsb/lsbtest/session     | 176 ------
>   meta/recipes-extended/lsb/lsbtest_1.0.bb      |  49 --
>   .../packagegroups/packagegroup-core-lsb.bb    | 240 --------
>   meta/recipes.txt                              |   2 +-
>   28 files changed, 50 insertions(+), 1503 deletions(-)
>   delete mode 100644 README.LSB
>   delete mode 100644 meta/recipes-extended/images/core-image-lsb-dev.bb
>   delete mode 100644 meta/recipes-extended/images/core-image-lsb-sdk.bb
>   delete mode 100644 meta/recipes-extended/images/core-image-lsb.bb
>   rename meta/recipes-extended/lsb/{lsb => lsb-release}/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch (100%)
>   create mode 100644 meta/recipes-extended/lsb/lsb-release_1.4.bb
>   delete mode 100755 meta/recipes-extended/lsb/lsb/init-functions
>   delete mode 100755 meta/recipes-extended/lsb/lsb/lsb_killproc
>   delete mode 100755 meta/recipes-extended/lsb/lsb/lsb_log_message
>   delete mode 100755 meta/recipes-extended/lsb/lsb/lsb_pidofproc
>   delete mode 100755 meta/recipes-extended/lsb/lsb/lsb_start_daemon
>   delete mode 100644 meta/recipes-extended/lsb/lsb_5.0.bb
>   delete mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
>   delete mode 100644 meta/recipes-extended/lsb/lsbinitscripts/functions.patch
>   delete mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
>   delete mode 100644 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
>   delete mode 100644 meta/recipes-extended/lsb/lsbtest/packages_list
>   delete mode 100644 meta/recipes-extended/lsb/lsbtest/session
>   delete mode 100644 meta/recipes-extended/lsb/lsbtest_1.0.bb
>   delete mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> 
> diff --git a/README.LSB b/README.LSB
> deleted file mode 100644
> index fecbe548b7..0000000000
> --- a/README.LSB
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -OE-Core aims to be able to provide basic LSB compatible images. There
> -are some challenges for OE as LSB isn't always 100% relevant to its
> -target embedded and IoT audiences.
> -
> -One challenge is that the LSB spec is no longer being actively
> -developed [https://github.com/LinuxStandardBase/lsb] and has
> -components which are end of life or significantly dated. OE
> -therefore provides compatibility with the following caveats:
> -
> -* Qt4 is provided by the separate meta-qt4 layer. Its noted that Qt4
> -  is end of life and this isn't something the core project regularly
> -  tests any longer. Users are recommended to group together to support
> -  maintenance of that layer. [http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/]
> -
> -* GTK+ 2 is provided by meta-oe.  It is noted that GTK+ 2 is end of life
> -  and use of GTK+ 2 isn't recommended.
> -
> -* mailx has been dropped since its no longer being developed upstream
> -  and there are better, more modern replacements such as s-nail
> -  (http://sdaoden.eu/code.html) or mailutils (http://mailutils.org/).
> -
> -* A few perl modules that were required by LSB 4.x aren't provided:
> -  libclass-isa, libenv, libdumpvalue, libfile-checktree,
> -  libi18n-collate, libpod-plainer.
> -
> -* libpng 1.2 isn't provided; oe-core includes the latest release of libpng
> -  instead.
> -
> -* pax (POSIX standard archive) tool is not provided.
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
> index ab6ebdb899..7ab3b12cd5 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -43,9 +43,6 @@ DISTRO_PN_ALIAS_pn-core-image-base = "OE-Core"
>   DISTRO_PN_ALIAS_pn-core-image-clutter = "OE-Core"
>   DISTRO_PN_ALIAS_pn-core-image-full-cmdline = "OE-Core"
>   DISTRO_PN_ALIAS_pn-core-image-kernel-dev = "OE-Core"
> -DISTRO_PN_ALIAS_pn-core-image-lsb = "OE-Core"
> -DISTRO_PN_ALIAS_pn-core-image-lsb-dev = "OE-Core"
> -DISTRO_PN_ALIAS_pn-core-image-lsb-sdk = "OE-Core"
>   DISTRO_PN_ALIAS_pn-core-image-minimal = "OE-Core"
>   DISTRO_PN_ALIAS_pn-core-image-minimal-dev = "OE-Core"
>   DISTRO_PN_ALIAS_pn-core-image-minimal-initramfs = "OE-Core"
> @@ -202,8 +199,6 @@ DISTRO_PN_ALIAS_pn-linux-libc-headers-yocto = "Debian=linux-kernel-headers Ubunt
>   DISTRO_PN_ALIAS_pn-linux-yocto = "Debian=linux-base Ubuntu=linux"
>   DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
>   DISTRO_PN_ALIAS_pn-linux-yocto-tiny = "OSPDT"
> -DISTRO_PN_ALIAS_pn-lsbinitscripts = "Windriver"
> -DISTRO_PN_ALIAS_pn-lsbtest = "Windriver"
>   DISTRO_PN_ALIAS_pn-ltp = "Mandriva=ltp Ubuntu=ltp"
>   DISTRO_PN_ALIAS_pn-lttng-modules = "OSPDT upstream=http://lttng.org/"
>   DISTRO_PN_ALIAS_pn-lttng-tools = "OSPDT upstream=http://lttng.org/"
> @@ -265,7 +260,6 @@ DISTRO_PN_ALIAS_pn-packagegroup-core-clutter = "OE-Core"
>   DISTRO_PN_ALIAS_pn-packagegroup-core-device-devel = "OE-Core"
>   DISTRO_PN_ALIAS_pn-packagegroup-core-eclipse-debug = "OE-Core"
>   DISTRO_PN_ALIAS_pn-packagegroup-core-full-cmdline = "OE-Core"
> -DISTRO_PN_ALIAS_pn-packagegroup-core-lsb = "OE-Core"
>   DISTRO_PN_ALIAS_pn-packagegroup-core-nfs = "OE-Core"
>   DISTRO_PN_ALIAS_pn-packagegroup-core-sdk = "OE-Core"
>   DISTRO_PN_ALIAS_pn-packagegroup-core-ssh-dropbear = "OE-Core"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 6a2308d13c..0757230b1a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -114,8 +114,6 @@ RECIPE_MAINTAINER_pn-core-image-full-cmdline = "Richard Purdie <richard.purdie@l
>   RECIPE_MAINTAINER_pn-core-image-kernel-dev = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-core-image-sato = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-core-image-sato-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> -RECIPE_MAINTAINER_pn-core-image-lsb = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> -RECIPE_MAINTAINER_pn-core-image-lsb-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-core-image-testmaster-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-core-image-testmaster = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-core-image-clutter = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> @@ -455,9 +453,7 @@ RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
>   RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
>   RECIPE_MAINTAINER_pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER_pn-lsb = "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER_pn-lsbinitscripts = "Ross Burton <ross.burton@intel.com>"
> -RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
> +RECIPE_MAINTAINER_pn-lsb-release = "Hongxu Jia <hongxu.jia@windriver.com>"
>   RECIPE_MAINTAINER_pn-lsof = "Ross Burton <ross.burton@intel.com>"
>   RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
>   RECIPE_MAINTAINER_pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
> index 4b7c76f70f..18cec222fc 100644
> --- a/meta/lib/oeqa/manual/bsp-hw.json
> +++ b/meta/lib/oeqa/manual/bsp-hw.json
> @@ -526,7 +526,7 @@
>                       "expected_results": ""
>                   },
>                   "4": {
> -                    "action": "check ping status  \n\nNote: This TC apply only for core-image-full-cmd and core-image-lsb .",
> +                    "action": "check ping status  \n\nNote: This TC apply only for core-image-full-cmd.",
>                       "expected_results": "ping should always work before/after standby"
>                   }
>               },
> diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
> index 8c13b68ec3..367a416f01 100644
> --- a/meta/lib/oeqa/manual/compliance-test.json
> +++ b/meta/lib/oeqa/manual/compliance-test.json
> @@ -1,34 +1,4 @@
>   [
> -    {
> -        "test": {
> -            "@alias": "compliance-test.compliance-test.LSB_subset_test_suite",
> -            "author": [
> -                {
> -                    "email": "corneliux.stoicescu@intel.com",
> -                    "name": "corneliux.stoicescu@intel.com"
> -                }
> -            ],
> -            "execution": {
> -                "1": {
> -                    "action": "Get lsd-sdk image and install it on target device or start the image(if it is QEMU) with option \"-m 512M\"",
> -                    "expected_results": ""
> -                },
> -                "2": {
> -                    "action": "Comment in /opt/lsb-test/session any tests you don't want to run.",
> -                    "expected_results": ""
> -                },
> -                "3": {
> -                    "action": "Run /usr/bin/LSB_Test.sh which should download the LSB suite and set it up. Some packages may fail to download because their location changed on ftp.linuxfoundation.org. You need to manually update /opt/lsb-test/packages_list",
> -                    "expected_results": ""
> -                },
> -                "4": {
> -                    "action": "Tests should start automatically, you can use the web interface to reconfigure the setup. ",
> -                    "expected_results": "Check the result on wiki https://wiki.yoctoproject.org/wiki/LSB_Result No regression failures should be met."
> -                }
> -            },
> -            "summary": "LSB_subset_test_suite"
> -        }
> -    },
>       {
>           "test": {
>               "@alias": "compliance-test.compliance-test.stress_test_-_Genericx86-64",
> @@ -40,7 +10,7 @@
>               ],
>               "execution": {
>                   "1": {
> -                    "action": "Bootup with core-image-lsb-sdk image",
> +                    "action": "Bootup with core-image-sato-sdk image",
>                       "expected_results": ""
>                   },
>                   "2": {
> diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
> index 812f57da34..12374c7c64 100644
> --- a/meta/lib/oeqa/manual/toaster-managed-mode.json
> +++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
> @@ -1494,7 +1494,7 @@
>             "expected_results": "A type in form appears. \n\n\t"
>           },
>           "6": {
> -          "action": "Change distro (ex: poky-lsb). \n\n\t",
> +          "action": "Change distro (ex: poky-tiny). \n\n\t",
>             "expected_results": "Distro has changed. \n\n\t"
>           },
>           "7": {
> @@ -1503,7 +1503,7 @@
>           },
>           "8": {
>             "action": " Build a recipe (ex: core-image-minimal) and wait until build finish.",
> -          "expected_results": "Build finishes successfully. \n\nThe 'success' criteria for this one should be that the build is reported as using the poky-lsb distro in the build summary page, and that the DISTRO variable value in the bitbake variables table is set to the value specified in toaster (poky-lsb again)."
> +          "expected_results": "Build finishes successfully. \n\nThe 'success' criteria for this one should be that the build is reported as using the poky-tiny distro in the build summary page, and that the DISTRO variable value in the bitbake variables table is set to the value specified in toaster (poky-tiny again)."
>           }
>         },
>         "summary": "Build_a_recipe_with_different_distro"
> @@ -1612,7 +1612,7 @@
>             "expected_results": ""
>           },
>           "3": {
> -          "action": "Check that the table is populated with the list of image recipes (eg. core-image minimal, core-image-lsb) \n\n\n",
> +          "action": "Check that the table is populated with the list of image recipes (eg. core-image minimal) \n\n\n",
>             "expected_results": ""
>           },
>           "4": {
> @@ -1670,7 +1670,7 @@
>             "expected_results": ""
>           },
>           "7": {
> -          "action": "Sort the table by \"Layer\" and then navigate away by selecting an image (such as core-image-lsb). When you click the \"back\" button in the web-browser to go back, the \"New custom image\" table should still be sorted by \"Layer\".  \nThis should apply also by navigating back to the page by any other means. \n\n",
> +          "action": "Sort the table by \"Layer\" and then navigate away by selecting an image. When you click the \"back\" button in the web-browser to go back, the \"New custom image\" table should still be sorted by \"Layer\".  \nThis should apply also by navigating back to the page by any other means. \n\n",
>             "expected_results": ""
>           },
>           "8": {
> @@ -2348,7 +2348,7 @@
>             "expected_results": ""
>           },
>           "3": {
> -          "action": "Build 6 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-lsb, core-image-clutter) to name a few. ",
> +          "action": "Build 6 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-clutter) to name a few. ",
>             "expected_results": " All recipes are built correctly \n\n"
>           },
>           "4": {
> @@ -2382,7 +2382,7 @@
>             "expected_results": ""
>           },
>           "3": {
> -          "action": "Build 6 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-lsb, core-image-clutter) to name a few. \n\n",
> +          "action": "Build 6 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-clutter) to name a few. \n\n",
>             "expected_results": "All recipes are built correctly \n\n"
>           },
>           "4": {
> @@ -2420,7 +2420,7 @@
>             "expected_results": ""
>           },
>           "3": {
> -          "action": "Build 4 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-lsb, core-image-clutter) to name a few. \n\n",
> +          "action": "Build 4 recipes example (core-image-sato, core-image-minimal, core-image-base, core-image-clutter) to name a few. \n\n",
>             "expected_results": " All recipes are built correctly \n\n"
>           },
>           "4": {
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index f206cee373..9b0ae0d1c2 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -37,7 +37,7 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
>       e2fsprogs-tune2fs \
>       hdparm \
>       iptables \
> -    lsb \
> +    lsb-release \
>       mc \
>       mc-fish \
>       mc-helpers \
> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> index 396d0ec0a1..f9a98d4509 100644
> --- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> +++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> @@ -141,7 +141,7 @@ PACKAGES =+ "pybootchartgui"
>   FILES_pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
>   RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-shell python3-compression python3-codecs"
>   RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
> -RDEPENDS_${PN}_class-target += "lsb"
> +RDEPENDS_${PN}_class-target += "lsb-release"
>   DEPENDS_append_class-native = " python3-pycairo-native"
>   
>   PACKAGES =+ "bootchartd-stop-initscript"
> diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
> deleted file mode 100644
> index d2dc9e2b53..0000000000
> --- a/meta/recipes-extended/images/core-image-lsb-dev.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require core-image-lsb.bb
> -
> -DESCRIPTION = "Basic image without X support suitable for development work. It \
> -can be used for customization and implementations that conform to Linux \
> -Standard Base (LSB)."
> -
> -IMAGE_FEATURES += "dev-pkgs"
> diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
> deleted file mode 100644
> index a3d602edd6..0000000000
> --- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require core-image-lsb.bb
> -
> -DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
> -(LSB) implementations. It includes the full meta-toolchain, plus development \
> -headers and libraries to form a standalone SDK."
> -
> -IMAGE_FEATURES += "tools-sdk dev-pkgs tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
> -
> -IMAGE_INSTALL += "kernel-devsrc"
> -
> -# Reduce this to try and keep below the 4GB image size for now
> -IMAGE_OVERHEAD_FACTOR = "1.2"
> diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
> deleted file mode 100644
> index ab61c6e6df..0000000000
> --- a/meta/recipes-extended/images/core-image-lsb.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "An image containing packages that are required to conform \
> -to the Linux Standard Base (LSB) specification."
> -
> -IMAGE_FEATURES += "splash ssh-server-openssh hwcodecs package-management"
> -
> -IMAGE_INSTALL = "\
> -    ${CORE_IMAGE_BASE_INSTALL} \
> -    packagegroup-core-full-cmdline \
> -    packagegroup-core-lsb \
> -    "
> -
> -inherit core-image distro_features_check
> -
> -REQUIRED_DISTRO_FEATURES = "pam"
> diff --git a/meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch b/meta/recipes-extended/lsb/lsb-release/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
> similarity index 100%
> rename from meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
> rename to meta/recipes-extended/lsb/lsb-release/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
> diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
> new file mode 100644
> index 0000000000..4d8b3d3d3c
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "lsb_release support for OpenEmbedded"
> +SECTION = "console/utils"
> +HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
> +LICENSE = "GPLv2+"
> +
> +# lsb_release needs getopt
> +RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"
> +
> +LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
> +           file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
> +           "
> +UPSTREAM_VERSION_UNKNOWN = "1"
> +
> +SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
> +SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
> +
> +UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
> +UPSTREAM_CHECK_REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
> +
> +CLEANBROKEN = "1"
> +
> +do_install() {
> +	oe_runmake install prefix=${D}${root_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
> +
> +	mkdir -p ${D}${sysconfdir}/lsb-release.d
> +
> +	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
> +	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
> +	if [ -n "${DISTRO_CODENAME}" ]; then
> +		echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
> +	fi
> +	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
> +}
> +
> +FILES_${PN} += "${base_libdir}"
> diff --git a/meta/recipes-extended/lsb/lsb/init-functions b/meta/recipes-extended/lsb/lsb/init-functions
> deleted file mode 100755
> index 7c1dce24cf..0000000000
> --- a/meta/recipes-extended/lsb/lsb/init-functions
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -#!/bin/sh
> -
> -# LSB initscript functions, as defined in the LSB Spec 1.1.0
> -#
> -# Lawrence Lim <llim@core.com> - Tue, 26 June 2007
> -# Updated to the latest LSB 3.1 spec
> -# http://refspecs.freestandards.org/LSB_3.1.0/LSB-Core-generic/LSB-Core-generic_lines.txt
> -
> -start_daemon () {
> -	/etc/core-lsb/lsb_start_daemon "$@"
> -}
> -
> -killproc () {
> -	/etc/core-lsb/lsb_killproc "$@"
> -}
> -
> -pidofproc () {
> -	/etc/core-lsb/lsb_pidofproc "$@"
> -}
> -
> -log_success_msg () {
> -	/etc/core-lsb/lsb_log_message success "$@"
> -}
> -
> -log_failure_msg () {
> -	/etc/core-lsb/lsb_log_message failure "$@"
> -}
> -
> -log_warning_msg () {
> -	/etc/core-lsb/lsb_log_message warning "$@"
> -}
> -
> -# int log_begin_message (char *message)
> -log_begin_msg () {
> -	if [ -z "$1" ]; then
> -		return 1
> -	fi
> -	echo " * $@"
> -}
> -
> -
> -log_end_msg () {
> -	/etc/core-lsb/lsb_log_message end "$@"
> -}
> diff --git a/meta/recipes-extended/lsb/lsb/lsb_killproc b/meta/recipes-extended/lsb/lsb/lsb_killproc
> deleted file mode 100755
> index 866c1a9c63..0000000000
> --- a/meta/recipes-extended/lsb/lsb/lsb_killproc
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -
> -. /etc/init.d/functions
> -
> -LSB=LSB-1.1 killproc $*
> -exit $?
> diff --git a/meta/recipes-extended/lsb/lsb/lsb_log_message b/meta/recipes-extended/lsb/lsb/lsb_log_message
> deleted file mode 100755
> index 10343b0819..0000000000
> --- a/meta/recipes-extended/lsb/lsb/lsb_log_message
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -#!/bin/sh
> -
> -. /etc/init.d/functions
> -
> -ACTION=$1
> -shift
> -
> -case "$ACTION" in
> -  success)
> -  	echo -n $*
> -	success "$*"
> -	echo
> -	;;
> -  failure)
> -  	echo -n $*
> -	failure "$*"
> -	echo
> -	;;
> -  warning)
> -  	echo -n $*
> -	warning "$*"
> -	echo
> -	;;
> -  *)
> -  	;;
> -esac
> -exit 0
> diff --git a/meta/recipes-extended/lsb/lsb/lsb_pidofproc b/meta/recipes-extended/lsb/lsb/lsb_pidofproc
> deleted file mode 100755
> index 6d1fd0f249..0000000000
> --- a/meta/recipes-extended/lsb/lsb/lsb_pidofproc
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -
> -. /etc/init.d/functions
> -
> -pidofproc $*
> -exit $?
> diff --git a/meta/recipes-extended/lsb/lsb/lsb_start_daemon b/meta/recipes-extended/lsb/lsb/lsb_start_daemon
> deleted file mode 100755
> index de62c2344d..0000000000
> --- a/meta/recipes-extended/lsb/lsb/lsb_start_daemon
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -#!/bin/sh
> -
> -. /etc/init.d/functions
> -
> -nice=
> -force=
> -pidfile=
> -user=
> -check=
> -RETVAL=
> -while [ "$1" != "${1##[-+]}" ]; do
> -	case $1 in
> -	     -f)
> -	     	force="--force"
> -		shift
> -		;;
> -	     -n)
> -	     	nice=$2
> -		shift 2
> -		;;
> -	     -p)
> -		pidfile="--pidfile $2"
> -		shift 2
> -		;;
> -	     -u)
> -	        user="--user $2"
> -		shift 2
> -		;;
> -	     -c)
> -	        check="--check $2"
> -		shift 2
> -		;;
> -	      *)
> - 		echo "Unknown Option $1"
> - 		echo "Options are:"
> - 		echo "-f"
> -		echo "-p {pidfile}"
> -		echo "-n [+/-nicelevel]"
> -		echo "-u {user}"
> -		echo "-c {base}"
> -	        exit 1;;	
> -	esac
> -done
> -LSB=LSB-1.1 daemon ${force:-} ${nice:-} ${pidfile:-} ${user:-} ${check:-} $*
> -exit $?
> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
> deleted file mode 100644
> index d1de334008..0000000000
> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
> +++ /dev/null
> @@ -1,136 +0,0 @@
> -SUMMARY = "LSB support for OpenEmbedded"
> -SECTION = "console/utils"
> -HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
> -LICENSE = "GPLv2+"
> -
> -LSB_CORE = "lsb-core-${TARGET_ARCH}"
> -LSB_CORE_x86 = "lsb-core-ia32"
> -LSB_CORE_x86-64 = "lsb-core-amd64"
> -RPROVIDES_${PN} += "${LSB_CORE}"
> -
> -# lsb_release needs getopt, lsbinitscripts
> -RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
> -
> -LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
> -           file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
> -           file://init-functions \
> -           file://lsb_killproc \
> -           file://lsb_log_message \
> -           file://lsb_pidofproc \
> -           file://lsb_start_daemon \
> -           "
> -UPSTREAM_VERSION_UNKNOWN = "1"
> -
> -SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
> -SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
> -
> -UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
> -UPSTREAM_CHECK_REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
> -
> -S = "${WORKDIR}/lsb-release-1.4"
> -
> -CLEANBROKEN = "1"
> -
> -do_install() {
> -	oe_runmake install prefix=${D}${root_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
> -
> -	# these two dirs are needed by package lsb-dist-checker
> -	mkdir -p ${D}${sysconfdir}/opt
> -	mkdir -p ${D}${localstatedir}/opt
> -
> -	mkdir -p ${D}${base_libdir}
> -	mkdir -p ${D}${sysconfdir}/lsb-release.d
> -	printf "LSB_VERSION=\"core-5.0-noarch:" > ${D}${sysconfdir}/lsb-release
> -
> -	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
> -		printf "core-5.0-ia32" >>  ${D}${sysconfdir}/lsb-release
> -	else
> -		printf "core-5.0-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
> -	fi
> -	echo "\"" >> ${D}${sysconfdir}/lsb-release
> -	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
> -	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
> -	if [ -n "${DISTRO_CODENAME}" ]; then
> -		echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
> -	fi
> -	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
> -
> -	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
> -		mkdir -p ${D}${sysconfdir}/lsb-release.d
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
> -		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-noarch
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ia32
> -		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ia32
> -	elif [ "${TARGET_ARCH}" = "x86_64" ]; then
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-amd64
> -		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-amd64
> -	fi
> -	if [ "${TARGET_ARCH}" = "powerpc" ]; then
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc32
> -		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc32
> -	elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
> -		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc64
> -		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
> -	fi
> -}
> -
> -do_install_append() {
> -       install -d ${D}${sysconfdir}/core-lsb
> -       for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
> -       do
> -           install -m 0755 ${WORKDIR}/$i ${D}${sysconfdir}/core-lsb
> -       done
> -
> -       install -d ${D}${nonarch_base_libdir}/lsb
> -       install -m 0755 ${WORKDIR}/init-functions ${D}${nonarch_base_libdir}/lsb
> -
> -       # create links for LSB test
> -       if [ -e ${sbindir}/chkconfig ]; then
> -               if [ "${nonarch_base_libdir}" != "${nonarch_libdir}" ] ; then
> -                       install -d ${D}${nonarch_libdir}/lsb
> -               fi
> -               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/install_initd
> -               ln -sf ${sbindir}/chkconfig ${D}${nonarch_libdir}/lsb/remove_initd
> -       fi
> -
> -       if [ "${TARGET_ARCH}" = "x86_64" ]; then
> -       	       # don't symlink if usrmerge is in DISTRO_FEATURES as it manages the symlink
> -               if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)} && \
> -	       	  [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
> -                   lnr ${D}${base_libdir} ${D}${base_prefix}/lib64
> -               fi
> -	       cd ${D}${base_libdir}
> -               ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
> -               ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
> -       fi
> -       if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
> -	       cd ${D}${base_libdir}
> -               ln -sf ld-linux.so.2 ld-lsb.so.2
> -               ln -sf ld-linux.so.2 ld-lsb.so.3
> -       fi
> -
> -       if [ "${TARGET_ARCH}" = "powerpc64" ]; then
> -               if [ "${base_libdir}" != "${base_prefix}/lib64" ]; then
> -                   lnr ${D}${base_libdir} ${D}${base_prefix}/lib64
> -               fi
> -               cd ${D}${base_libdir}
> -               ln -sf ld64.so.1 ld-lsb-ppc64.so.2
> -               ln -sf ld64.so.1 ld-lsb-ppc64.so.3
> -       fi
> -       if [ "${TARGET_ARCH}" = "powerpc" ]; then
> -	       cd ${D}${base_libdir}
> -               ln -sf ld.so.1 ld-lsb-ppc32.so.2
> -               ln -sf ld.so.1 ld-lsb-ppc32.so.3
> -       fi
> -}
> -
> -FILES_${PN} += "${@'${base_prefix}/lib64' if d.getVar('TARGET_ARCH') == ('x86_64' or 'powerpc64') and '${base_libdir}' != '${base_prefix}/lib64' else ''} \
> -                ${base_libdir} \
> -                ${nonarch_libdir}/lsb \
> -                ${nonarch_base_libdir}/lsb/* \
> -                "
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
> deleted file mode 100644
> index c0076453f2..0000000000
> --- a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Upstream-Status: Pending
> -
> -Subject: functions: avoid exit 1 which causes init scripts to fail
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - rc.d/init.d/functions | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: initscripts-9.72/rc.d/init.d/functions
> -===================================================================
> ---- initscripts-9.72.orig/rc.d/init.d/functions
> -+++ initscripts-9.72/rc.d/init.d/functions
> -@@ -686,6 +686,6 @@ if [ "$_use_systemctl" = "1" ]; then
> -     fi
> - fi
> -
> --strstr "$(cat /proc/cmdline)" "rc.debug" && set -x
> -+strstr "$(cat /proc/cmdline)" "rc.debug" && set -x || true
> - return 0
> -
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
> deleted file mode 100644
> index e912daa701..0000000000
> --- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From e46b056282c8420f096d5c34d78c00f816788784 Mon Sep 17 00:00:00 2001
> -From: Fan Xin <fan.xin@jp.fujitsu.com>
> -Date: Mon, 5 Jun 2017 16:26:47 +0900
> -Subject: [PATCH 1/2] Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Rebase on 9.72
> -
> -Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> -Upstream-Status: Pending
> -
> ----
> - rc.d/init.d/functions | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
> -index 2e3da964..1a204dec 100644
> ---- a/rc.d/init.d/functions
> -+++ b/rc.d/init.d/functions
> -@@ -59,7 +59,7 @@ systemctl_redirect () {
> - [ -z "${COLUMNS:-}" ] && COLUMNS=80
> -
> - if [ -z "${CONSOLETYPE:-}" ]; then
> --    if [ -c "/dev/stderr" ] && [ -r "/dev/stderr" ]; then
> -+    if [ -c "/dev/stderr" ] && [ -r "/dev/stderr" ] && [ -e /sbin/consoletype ]; then
> -         CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
> -     else
> -         CONSOLETYPE="serial"
> ---
> -2.15.1
> -
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
> deleted file mode 100644
> index 6d3fcf13dd..0000000000
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY = "SysV init scripts which are only used in an LSB image"
> -HOMEPAGE = "https://wiki.debian.org/LSBInitScripts"
> -SECTION = "base"
> -LICENSE = "GPLv2"
> -
> -RPROVIDES_${PN} += "initd-functions"
> -RDEPENDS_${PN} += "util-linux"
> -RCONFLICTS_${PN} = "initscripts-functions"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
> -
> -S = "${WORKDIR}/git"
> -SRC_URI = "git://github.com/fedora-sysv/initscripts \
> -           file://functions.patch \
> -           file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
> -          "
> -SRCREV = "a51c1b4f7dcf55b568b2ee4c2b18078849943469"
> -UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)"
> -
> -SRC_URI[md5sum] = "d6c798f40dceb117e12126d94cb25a9a"
> -SRC_URI[sha256sum] = "1793677bdd1f7ee4cb00878ce43346196374f848a4c8e4559e086040fc7487db"
> -
> -# Since we are only taking the patched version of functions, no need to
> -# configure or compile anything so do not execute these
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> -
> -do_install(){
> -	install -d ${D}${sysconfdir}/init.d/
> -	install -m 0644 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
> -}
> diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
> deleted file mode 100644
> index 073e247a58..0000000000
> --- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
> +++ /dev/null
> @@ -1,525 +0,0 @@
> -#!/bin/sh
> -
> -# Copyright (C) 2012 Wind River Systems, Inc.
> -#
> -# This program is free software; you can redistribute it and/or modify
> -# it under the terms of the GNU General Public License version 2 as
> -# published by the Free Software Foundation.
> -#
> -# This program is distributed in the hope that it will be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -# See the GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write to the Free Software
> -# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> -
> -
> -WORK_DIR="/opt/lsb-test"
> -
> -if [ `id -u` -ne 0 ]
> -then
> -	cat << EOF
> -	In order to install and run LSB testsuite, you need administrator privileges.
> -	You are currently running this script as an unprivileged user.
> -
> -EOF
> -	exit 1
> -fi
> -
> -ARCH=`uname -m`
> -if [ ${ARCH} != "i686" ] && [ ${ARCH} != "x86_64" ] && [ ${ARCH} != "ppc" ] && [ ${ARCH} != "ppc64" ]
> -then
> -	echo "Error: Unsupported architecture"
> -	exit 1
> -fi
> -
> -which rpm
> -if [ $? -ne 0 ]
> -then
> -	echo "No rpm command found"
> -	exit 1
> -fi
> -
> -RET=0
> -
> -cd ${WORK_DIR} || exit 1
> -# Step 1: Download the LSB Packages
> -echo ""
> -echo "Download LSB packages..."
> -echo ""
> -
> -if [ ! -e ./packages_list ]
> -then
> -	echo "Error: Could not find packages list" >&2
> -	exit 1
> -fi
> -
> -. ./packages_list
> -
> -PACKAGES_DIR="/var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb"
> -
> -BASE_PACKAGES_DIR="${PACKAGES_DIR}/base/released-all/binary"
> -RUNTIME_BASE_PACKAGES_DIR="${PACKAGES_DIR}/test_suites/released-all/binary/runtime"
> -RUNTIME_PACKAGES_DIR="${PACKAGES_DIR}/test_suites/${LSB_RELEASE}/binary/runtime"
> -APP_PACKAGES_DIR="${PACKAGES_DIR}/app-battery/${LSB_RELEASE}/${LSB_ARCH}"
> -APP_TESTFILES_DIR="${PACKAGES_DIR}/app-battery/tests"
> -SNAPSHOTS_TESTFILES_DIR="${PACKAGES_DIR}/snapshots/appbat/tests"
> -
> -if [ ! -d ${PACKAGES_DIR} ]
> -then
> -	mkdir -p ${PACKAGES_DIR}
> -fi
> -
> -if [ ! -d ${BASE_PACKAGES_DIR} ]
> -then
> -	mkdir -p ${BASE_PACKAGES_DIR}
> -fi
> -
> -if [ ! -d ${RUNTIME_BASE_PACKAGES_DIR} ]
> -then
> -	mkdir -p ${RUNTIME_BASE_PACKAGES_DIR}
> -fi
> -
> -if [ ! -d ${RUNTIME_PACKAGES_DIR} ]
> -then
> -	mkdir -p ${RUNTIME_PACKAGES_DIR}
> -fi
> -
> -if [ ! -d ${APP_PACKAGES_DIR} ]
> -then
> -	mkdir -p ${APP_PACKAGES_DIR}
> -fi
> -
> -if [ ! -d ${APP_TESTFILES_DIR} ]
> -then
> -	mkdir -p ${APP_TESTFILES_DIR}
> -fi
> -
> -# Official download server list. You can replace them with your own server.
> -SERVER_IPADDR="140.211.169.28"
> -SERVER_NAME="ftp.linuxfoundation.org"
> -
> -if ! `grep -F -q "${SERVER_NAME}" /etc/hosts`; then
> -	echo "${SERVER_IPADDR}	${SERVER_NAME}	${SERVER_NAME}" >> /etc/hosts
> -fi
> -
> -#ping -c 5 ${SERVER_NAME}
> -#if [ $? -ne 0 ]
> -#then
> -#	echo "The server: ${SERVER_NAME} is unreachable"
> -#	exit 1
> -#fi
> -
> -SERVER1="\
> -	http://${SERVER_NAME}/pub/lsb/base/released-all/binary"	
> -SERVER2="\
> -	http://${SERVER_NAME}/pub/lsb/test_suites/released-all/binary/runtime"
> -SERVER3="\
> -	http://${SERVER_NAME}/pub/lsb/test_suites/${LSB_RELEASE}/binary/runtime"
> -SERVER4="\
> -	http://${SERVER_NAME}/pub/lsb/app-battery/${LSB_RELEASE}/${LSB_ARCH}"
> -SERVER5="\
> -	http://${SERVER_NAME}/pub/lsb/app-battery/tests"
> -
> -# We using "curl" as a download tool, "wget" is an alternative.
> -CURL=`which curl`
> -WGET=`which wget`
> -if [ ! -z ${CURL} ]
> -then
> -	DOWNLOAD_CMD="${CURL} -R -L -f --retry 3 --retry-delay 4 --connect-timeout 180 --compressed -C - -o"
> -elif [ ! -z ${WGET} ]
> -then
> -	DOWNLOAD_CMD="${WGET} -c -t 5 -O"
> -else
> -	echo "Can not find a download tool, please install curl or wget."
> -	exit 1
> -fi
> -
> -cd ${BASE_PACKAGES_DIR}
> -for pkg in ${BASE_PACKAGES_LIST}; do
> -	if [ ! -f ${pkg} ]
> -	then
> -		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER1}/${pkg} > /dev/null 2>&1
> -		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER1}/${pkg}
> -		if [ $? -eq 0 ]
> -		then
> -			mv -f ${pkg}".#part" ${pkg}
> -			echo "Download ${pkg} successfully."
> -		else
> -			echo "Download ${pkg} failed."
> -			RET=1
> -		fi
> -	fi
> -done
> -
> -cd ${RUNTIME_BASE_PACKAGES_DIR}
> -for pkg in ${RUNTIME_BASE_PACKAGES_LIST}; do
> -	if [ ! -f ${pkg} ]
> -	then
> -		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER2}/${pkg} > /dev/null 2>&1
> -		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER2}/${pkg}
> -		if [ $? -eq 0 ]
> -		then
> -			mv -f ${pkg}".#part" ${pkg}
> -			echo "Download ${pkg} successfully."
> -		else
> -			echo "Download ${pkg} failed."
> -			RET=1
> -		fi
> -	fi
> -done
> -
> -cd ${RUNTIME_PACKAGES_DIR}
> -for pkg in ${RUNTIME_PACKAGES_LIST}; do
> -	if [ ! -f ${pkg} ]
> -	then
> -		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER3}/${pkg} > /dev/null 2>&1
> -		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER3}/${pkg}
> -		if [ $? -eq 0 ]
> -		then
> -			mv -f ${pkg}".#part" ${pkg}
> -			echo "Download ${pkg} successfully."
> -		else
> -			echo "Download ${pkg} failed."
> -			RET=1
> -		fi
> -	fi
> -done
> -
> -cd ${APP_PACKAGES_DIR}
> -for pkg in ${APP_PACKAGES_LIST}; do
> -	if [ ! -f ${pkg} ]
> -	then
> -		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER4}/${pkg} > /dev/null 2>&1
> -		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER4}/${pkg}
> -		if [ $? -eq 0 ]
> -		then
> -			mv -f ${pkg}".#part" ${pkg}
> -			echo "Download ${pkg} successfully."
> -		else
> -			echo "Download ${pkg} failed."
> -			RET=1
> -		fi
> -	fi
> -done
> -
> -cd ${APP_TESTFILES_DIR}
> -for pkg in ${APP_TESTFILES_LIST}; do
> -	if [ ! -f ${pkg} ]
> -	then
> -		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER5}/${pkg} > /dev/null 2>&1
> -		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER5}/${pkg}
> -		if [ $? -eq 0 ]
> -		then
> -			mv -f ${pkg}".#part" ${pkg}
> -			echo "Download ${pkg} successfully."
> -		else
> -			echo "Download ${pkg} failed."
> -			RET=1
> -		fi
> -	fi
> -done
> -
> -if [ ${RET} -ne 0 ]
> -then
> -	echo "Download some packages failed. Please download them again."
> -	exit 1
> -fi
> -
> -# Step 2: Install the LSB Packages
> -echo ""
> -echo "Install LSB packages..."
> -echo ""
> -
> -# Kill lighttpd
> -ps aux | grep "lighttpd" | grep -v -q "grep"
> -if [ $? -eq 0 ]
> -then
> -	killall lighttpd >/dev/null 2>&1
> -fi
> -
> -# Start avahi-daemon
> -ps aux | grep "avahi-daemon" | grep -v -q "grep"
> -if [ $? -ne 0 ]
> -then
> -	/etc/init.d/avahi-daemon start >/dev/null 2>&1
> -fi
> -
> -LSB_START_CMD="/opt/lsb/test/manager/bin/dist-checker-start.pl"
> -LSB_STOP_CMD="/opt/lsb/test/manager/bin/dist-checker-stop.pl"
> -
> -PLATFORM_FILE="/etc/rpm/platform"
> -
> -RPM_INSTALL_CMD="rpm --quiet --nodeps --replacepkgs --nosignature -i --ignoreos"
> -RPM_INSTALL_CMD_NOSCRIPTS="rpm --quiet --nodeps --replacepkgs --noscripts --nosignature -i --ignoreos"
> -
> -# If the lsb has been started, stop it first.
> -if [ -x ${LSB_STOP_CMD} ]
> -then
> -	${LSB_STOP_CMD}
> -fi
> -
> -if [ ! -d /etc/rpm ]
> -then
> -	mkdir -p /etc/rpm
> -fi
> -
> -if [ ! -f ${PLATFORM_FILE} ]
> -then
> -	touch ${PLATFORM_FILE}
> -fi
> -
> -if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
> -	if [ ${ARCH} = i686 ];then
> -		echo "i486-suse" >> ${PLATFORM_FILE}
> -		echo "i486-noarch" >> ${PLATFORM_FILE}
> -		echo "i486-pc" >> ${PLATFORM_FILE}
> -		echo "noarch-suse" >> ${PLATFORM_FILE}
> -	elif [ ${ARCH} = x86_64 ]; then
> -		echo "i486-suse" >> ${PLATFORM_FILE}
> -		echo "i486-noarch" >> ${PLATFORM_FILE}
> -		echo "i486-pc" >> ${PLATFORM_FILE}
> -		echo "i486-.*-linux.*" >> ${PLATFORM_FILE}
> -		echo "noarch-suse" >> ${PLATFORM_FILE}
> -		echo "${ARCH}-suse" >> ${PLATFORM_FILE}
> -		echo "${ARCH}-noarch" >> ${PLATFORM_FILE}
> -		echo "${ARCH}-pc" >> ${PLATFORM_FILE}
> -	else
> -		echo "${ARCH}-suse" >> ${PLATFORM_FILE}
> -		echo "${ARCH}-noarch" >> ${PLATFORM_FILE}
> -		echo "${ARCH}-pc" >> ${PLATFORM_FILE}
> -		echo "noarch-suse" >> ${PLATFORM_FILE}
> -	fi
> -fi
> -
> -if [ -d ${BASE_PACKAGES_DIR} ]
> -then
> -	cd ${BASE_PACKAGES_DIR}
> -	for pkg in ${BASE_PACKAGES_LIST}
> -	do
> -		rpm --quiet -q ${pkg%\.*}
> -		if [ $? -ne 0 ]; then
> -			$RPM_INSTALL_CMD ${pkg}
> -		fi
> -	done
> -fi
> -
> -if [ -d ${RUNTIME_BASE_PACKAGES_DIR} ]
> -then
> -	cd ${RUNTIME_BASE_PACKAGES_DIR}
> -	for pkg in ${RUNTIME_BASE_PACKAGES_LIST}
> -	do
> -		rpm --quiet -q ${pkg%\.*}
> -		if [ $? -ne 0 ]; then
> -			$RPM_INSTALL_CMD ${pkg}
> -		fi
> -	done
> -fi
> -
> -if [ -d ${RUNTIME_PACKAGES_DIR} ]
> -then
> -	cd ${RUNTIME_PACKAGES_DIR}
> -	for pkg in ${RUNTIME_PACKAGES_LIST}
> -	do
> -		rpm --quiet -q ${pkg%\.*}
> -		if [ $? -ne 0 ]; then
> -			$RPM_INSTALL_CMD ${pkg}
> -		fi
> -	done
> -fi
> -
> -if [ -d ${APP_PACKAGES_DIR} ]
> -then
> -	cd ${APP_PACKAGES_DIR}
> -	for pkg in ${APP_PACKAGES_LIST}
> -	do
> -		echo "${pkg}" | grep -q "apache\|xpdf"
> -		if [ $? -eq 0 ]
> -		then
> -			rpm --quiet -q ${pkg%\.*}
> -			if [ $? -ne 0 ]; then
> -				$RPM_INSTALL_CMD_NOSCRIPTS ${pkg}
> -			fi
> -		else
> -			rpm --quiet -q ${pkg%\.*}
> -			if [ $? -ne 0 ]; then
> -				$RPM_INSTALL_CMD ${pkg}
> -			fi
> -		fi
> -	done
> -fi
> -
> -if [ ! -d ${SNAPSHOTS_TESTFILES_DIR} ]
> -then
> -	mkdir -p ${SNAPSHOTS_TESTFILES_DIR}
> -fi
> -
> -if [ -d ${APP_TESTFILES_DIR} ]
> -then
> -	cd ${APP_TESTFILES_DIR}
> -	for pkg in ${APP_TESTFILES_LIST}
> -	do
> -		cp -f ${pkg} ${SNAPSHOTS_TESTFILES_DIR}
> -	done
> -fi
> -
> -cd ${WORK_DIR}
> -
> -# Step 3: Set environment
> -echo ""
> -echo "Set environment..."
> -echo ""
> -
> -check ()
> -{
> -	if [ $? -eq 0 ]
> -	then
> -		echo "PASS"
> -	else
> -		echo "FAIL"
> -		exit 1
> -	fi
> -}
> -
> -echo ""
> -echo "---------------------------------"
> -echo "Create the Dirnames on target"
> -
> -if [ ! -d /etc/rpm/sysinfo ]
> -then
> -	mkdir -p /etc/rpm/sysinfo
> -fi
> -
> -cat > /etc/rpm/sysinfo/Dirnames << EOF
> -/etc/opt/lsb
> -/home/tet/LSB.tools
> -/opt/lsb-tet3-lite/lib/ksh
> -/opt/lsb-tet3-lite/lib/perl
> -/opt/lsb-tet3-lite/lib/posix_sh
> -/opt/lsb-tet3-lite/lib/tet3
> -/opt/lsb-tet3-lite/lib/xpg3sh
> -/opt/lsb/appbat/lib/python2.4/site-packages/qm
> -/opt/lsb/appbat/lib/python2.4/site-packages/qm/external
> -/opt/lsb/appbat/lib/python2.4/site-packages/qm/external/DocumentTemplate
> -/opt/lsb/appbat/lib/python2.4/site-packages/qm/test
> -/opt/lsb/appbat/lib/python2.4/site-packages/qm/test/classes
> -/opt/lsb/appbat/lib/python2.4/site-packages/qm/test/web
> -/opt/lsb/test/doc
> -/opt/lsb/test/lib
> -/opt/lsb/test/qm/diagnostics
> -/opt/lsb/test/qm/doc
> -/opt/lsb/test/qm/doc/test/html
> -/opt/lsb/test/qm/doc/test/print
> -/opt/lsb/test/qm/dtml
> -/opt/lsb/test/qm/dtml/test
> -/opt/lsb/test/qm/messages/test
> -/opt/lsb/test/qm/tutorial/test/tdb
> -/opt/lsb/test/qm/tutorial/test/tdb/QMTest
> -/opt/lsb/test/qm/web
> -/opt/lsb/test/qm/web/images
> -/opt/lsb/test/qm/web/stylesheets
> -/opt/lsb/test/qm/xml
> -/opt/lsb/test/share
> -/usr/share/doc/lsb-runtime-test
> -/var/opt/lsb
> -/opt/lsb/test/desktop
> -/opt/lsb/test/desktop/fontconfig
> -/opt/lsb/test/desktop/freetype
> -/opt/lsb/test/desktop/gtkvts
> -/opt/lsb/test/desktop/libpng
> -/opt/lsb/test/desktop/xft
> -/opt/lsb/test/desktop/xml
> -/opt/lsb/test/desktop/xrender
> -
> -
> -EOF
> -
> -if [ -f /etc/rpm/sysinfo/Dirnames ]
> -then
> -	echo "Success to creat Dirnames file"
> -else
> -	echo "Fail to creat Dirnames file"
> -fi
> -
> -[ -x /sbin/ldconfig ] && {
> -echo ""
> -echo "---------------------------------"
> -echo "Update cache"
> -/sbin/ldconfig
> -check;
> -}
> -
> -# Check loop device
> -if [ ! -b /dev/loop0 ]
> -then
> -	insmod /lib/modules/`uname -r`/kernel/drivers/block/loop.ko
> -	if [ $? != 0 ];then
> -		echo "Insmod loop.ko failed."
> -	fi
> -fi
> -
> -# Resolve localhost
> -LOCALHOST=`hostname`
> -if ! `grep -F -q "$LOCALHOST" /etc/hosts`; then
> -	echo "127.0.0.1	$LOCALHOST" >> /etc/hosts
> -fi
> -
> -# Workaround to add part of locales for LSB test
> -localedef -i de_DE -f ISO-8859-1 de_DE
> -localedef -i de_DE -f ISO-8859-15 de_DE.ISO-8859-15
> -localedef -i de_DE -f UTF-8 de_DE.UTF-8
> -localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
> -localedef -i en_HK -f ISO-8859-1 en_HK
> -localedef -i en_PH -f ISO-8859-1 en_PH
> -localedef -i en_US -f ISO-8859-15 en_US.ISO-8859-15
> -localedef -i en_US -f ISO-8859-1 en_US.ISO-8859-1
> -localedef -i en_US -f ISO-8859-1 en_US
> -localedef -i en_US -f UTF-8 en_US.UTF-8
> -localedef -i en_US -f ISO-8859-1 en_US.ISO8859-1
> -localedef -i es_MX -f ISO-8859-1 es_MX
> -localedef -i fr_FR -f ISO-8859-1 fr_FR
> -localedef -i it_IT -f ISO-8859-1 it_IT
> -localedef -i ja_JP -f EUC-JP ja_JP.eucjp
> -localedef -i se_NO -f UTF-8 se_NO.UTF-8
> -localedef -i ta_IN -f UTF-8 ta_IN
> -localedef -i es_ES -f ISO-8859-1 es_ES
> -localedef -i fr_FR@euro -f ISO-8859-1 fr_FR@euro
> -localedef -i is_IS -f UTF-8 is_IS.UTF-8
> -localedef -i zh_TW -f BIG5 zh_TW.BIG5
> -localedef -i en_US -f ISO-8859-15 en_US.ISO-8859-15
> -
> -echo ""
> -echo "Installation done!"
> -echo ""
> -
> -# Step 4: Start LSB test
> -if [ -x ${LSB_START_CMD} ]
> -then
> -	${LSB_START_CMD}
> -fi
> -
> -echo "---------------------------------"
> -echo "Run all the certification version of LSB Tests"
> -echo "---------------------------------"
> -
> -LSB_DIST_CHECKER="/opt/lsb/test/manager/utils/dist-checker.pl"
> -SESSION="${WORK_DIR}/session"
> -if [ ! -e ${SESSION} ]
> -then
> -	echo "Error: Could not find session file."
> -	echo "You must run LSB test from webbrower."
> -	exit 1
> -fi
> -
> -if [ -x ${LSB_DIST_CHECKER} ]
> -then
> -	${LSB_DIST_CHECKER} -v2 -f ${SESSION}
> -	check
> -fi
> -
> -echo ""
> -echo "LSB test complete. Please check the log file in /var/opt/lsb/test/manager/results/"
> -echo ""
> -
> diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
> deleted file mode 100644
> index 1a6c11699a..0000000000
> --- a/meta/recipes-extended/lsb/lsbtest/packages_list
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -LSB_RELEASE="released-5.0"
> -LSB_ARCH="lsbarch"
> -
> -BASE_PACKAGES_LIST="lsb-setup-5.0.0-2.noarch.rpm"
> -
> -RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-5.0.0.1-1.targetarch.rpm \
> -	lsb-tet3-lite-3.7-27.lsb5.targetarch.rpm \
> -	lsb-tet3-lite-devel-3.7-27.lsb5.targetarch.rpm \
> -	lsb-xvfb-1.2.0-22.targetarch.rpm \
> -	"
> -
> -RUNTIME_PACKAGES_LIST="lsb-cmdchk-5.0.3-1.targetarch.rpm \
> -	lsb-libchk-5.0.3-1.targetarch.rpm \
> -	lsb-qm-2.2-1.lsb5.targetarch.rpm \
> -	lsb-task-dist-testkit-5.0.0-2.noarch.rpm \
> -	lsb-test-core-5.0.1-1.targetarch.rpm \
> -	lsb-test-cpp-t2c-5.0.0-1.targetarch.rpm \
> -	lsb-test-desktop-5.0.0-1.targetarch.rpm \
> -	lsb-test-desktop-t2c-5.0.0-1.targetarch.rpm \
> -	lsb-test-libstdcpp-4.1.0-22.lsb1.targetarch.rpm \
> -	lsb-test-olver-core-5.0.0-1.targetarch.rpm \
> -	lsb-test-perl-5.0.2-1.noarch.rpm \
> -	lsb-test-printing-5.0.1-1.targetarch.rpm \
> -	lsb-test-python-5.0.0-1.targetarch.rpm \
> -	lsb-test-qt4-azov-5.0.0-1.targetarch.rpm \
> -	lsb-test-xts5-5.1.5-47.lsb5.targetarch.rpm \
> -	lsb-test-alsa-t2c-5.1.91-4.targetarch.rpm \
> -	lsb-test-core-t2c-5.0.1-1.targetarch.rpm \
> -	lsb-test-xml2-azov-5.0.0-1.targetarch.rpm \
> -	"
> -
> -APP_PACKAGES_LIST="lsb-python-2.4.6-10.lsb5.targetarch.rpm \
> -	lsb-apache-2.2.19-5.lsb5.targetarch.rpm \
> -	lsb-tcl-8.5.9-21.lsb5.targetarch.rpm \
> -	lsb-expect-5.43.0-21.lsb5.targetarch.rpm \
> -	lsb-groff-1.20.1-9.lsb5.targetarch.rpm \
> -	lsb-raptor-1.4.21-4.lsb5.targetarch.rpm \
> -	lsb-xpdf-1.01-17.lsb5.targetarch.rpm \
> -	lsb-samba-3.5.9-5.lsb5.targetarch.rpm \
> -	lsb-rsync-3.0.8-3.lsb5.targetarch.rpm \
> -	"
> -
> -APP_TESTFILES_LIST="expect-tests.tar \
> -	tcl-tests.tar \
> -	raptor-tests.tar \
> -	test1.pdf \
> -	test2.pdf \
> -	"
> -
> diff --git a/meta/recipes-extended/lsb/lsbtest/session b/meta/recipes-extended/lsb/lsbtest/session
> deleted file mode 100644
> index 4d47e40f7d..0000000000
> --- a/meta/recipes-extended/lsb/lsbtest/session
> +++ /dev/null
> @@ -1,176 +0,0 @@
> -[GENERAL]
> -VERBOSE_LEVEL:   1
> -ARCHITECTURE:    targetarch
> -USE_INTERNET:    1
> -STD_VERSION:     LSB 5.0
> -STD_PROFILE:     no
> -[cmdchk]
> -RUN: 1
> -VERSION: local|*
> -
> -[libchk]
> -RUN: 1
> -VERSION: local|*
> -
> -[alsa-t2c]
> -RUN: 1
> -VERSION: local|*
> -
> -[alsa-t2c|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/alsa-t2c
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/alsa-t2c/results
> -
> -[core]
> -RUN: 1
> -VERSION: local|*
> -
> -[core|local|*]
> -AUTOREPLY_PROVIDES_BASH: n
> -AUTOREPLY_TESTRUN_PATH: /home/tet/test_sets
> -AUTOREPLY_PERSON: Automated
> -AUTOREPLY_KERNEL_NAME: vmlinuz
> -AUTOREPLY_INSTALL_LSBPAM_CONF: y
> -AUTOREPLY_PROVIDES_C_SHELL: n
> -AUTOREPLY_ORGANISATION: N/A
> -AUTOREPLY_SET_PASS_MIN_DAYS: y
> -AUTOREPLY_PROVIDES_SYSV_INIT:
> -AUTOREPLY_ISNTALL_DEVS: y
> -AUTOREPLY_SUPPORTS_FILE_CMD: y
> -AUTOREPLY_TEST_SYSTEM: Distribution Checker
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/core/tet/test_sets
> -AUTOREPLY_SUPPORTS_NLS: n
> -AUTOREPLY_SUPPORTS_PROCESS_ACCOUNTING: n
> -AUTOREPLY_PATH_TO_RC.D:
> -AUTOREPLY_ALLOWS_MAKEDEV: n
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/core/tet/test_sets/results
> -
> -[core-t2c]
> -RUN: 1
> -VERSION: local|*
> -
> -[core-t2c|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/core-t2c
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/core-t2c/results
> -
> -[cpp-t2c]
> -RUN: 1
> -VERSION: local|*
> -
> -[cpp-t2c|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/cpp-t2c
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/cpp-t2c/results
> -
> -[desktop]
> -RUN: 1
> -VERSION: local|*
> -
> -[desktop|local|*]
> -AUTOREPLY_DESKTOP_ENVIRONMENT: [default]
> -AUTOREPLY_PERSON: Automated
> -AUTOREPLY_X_CLIENT_HOSTNAME:
> -AUTOREPLY_TEST_SYSTEM: Distribution Checker
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/desktop
> -AUTOREPLY_X11_FONT_PATH: [default]
> -AUTOREPLY_SHOW_SUMMARY_REPORT:
> -AUTOREPLY_ORGANISATION: N/A
> -AUTOREPLY_XVFB_DISPLAY: [default]
> -
> -[desktop-t2c]
> -RUN: 1
> -VERSION: local|*
> -
> -[desktop-t2c|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/desktop-t2c
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/desktop-t2c/results
> -
> -[libstdcpp]
> -RUN: 1
> -VERSION: local|*
> -
> -[libstdcpp|local|*]
> -AUTOREPLY_TEST_SYSTEM: Distribution Checker
> -AUTOREPLY_PERSON: Automated
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/libstdcpp_4.1.0
> -AUTOREPLY_ORGANISATION: N/A
> -AUTOREPLY_GNU_TRIPLET:
> -
> -[olver]
> -RUN: 1
> -VERSION: local|*
> -
> -[olver|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/olver-core
> -AUTOREPLY_RESULTS_DIR: /var/opt/lsb/test/olver-core
> -
> -[perl]
> -RUN: 1
> -VERSION: local|*
> -
> -[perl|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/perl
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/perl/results
> -
> -[printing]
> -RUN: 1
> -VERSION: local|*
> -
> -[printing|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/printing
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/printing/results
> -
> -[python]
> -RUN: 1
> -VERSION: local|*
> -
> -[python|local|*]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/python
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/python/results
> -
> -[xml2-azov]
> -RUN: 1
> -VERSION: local|*
> -
> -[xts5]
> -RUN: 1
> -VERSION: local|*
> -
> -[xts5|local|*]
> -AUTOREPLY_XT_FONTPATH_GOOD: [default]
> -AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/xts5
> -AUTOREPLY_XVFB_DISPLAY: [default]
> -AUTOREPLY_RESULTS_DIR: /opt/lsb/test/xts5/xts5/results
> -AUTOREPLY_XT_FONTPATH: [default]
> -AUTOREPLY_X_CLIENT_HOSTNAME:
> -
> -[apache]
> -RUN: 1
> -VERSION: local|*
> -
> -[expect]
> -RUN: 1
> -VERSION: local|*
> -
> -[groff]
> -RUN: 1
> -VERSION: local|*
> -
> -[raptor]
> -RUN: 1
> -VERSION: local|*
> -
> -[rsync]
> -RUN: 1
> -VERSION: local|*
> -
> -[samba]
> -RUN: 1
> -VERSION: local|*
> -
> -[tcl]
> -RUN: 1
> -VERSION: local|*
> -
> -[xpdf]
> -RUN: 1
> -VERSION: local|*
> -
> diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
> deleted file mode 100644
> index a90c023d52..0000000000
> --- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -SUMMARY = "Automates Linux Standard Base (LSB) tests"
> -HOMEPAGE = "https://wiki.debian.org/LSBInitScripts"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -PR = "r3"
> -
> -LIC_FILES_CHKSUM = "file://LSB_Test.sh;beginline=3;endline=16;md5=7063bb54b04719df0716b513447f4fc0"
> -
> -SRC_URI = "file://LSB_Test.sh \
> -		   file://packages_list \
> -		   file://session \
> -		   "
> -RDEPENDS_${PN} = "lsb rpm"
> -
> -S = "${WORKDIR}"
> -
> -do_install() {
> -	install -d  ${D}/opt/lsb-test
> -	install -m 0755 ${S}/LSB_Test.sh ${D}/opt/lsb-test/LSB_Test.sh
> -	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
> -	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
> -	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
> -		sed -i -e 's/lsbarch/ia32/g' -e 's/targetarch/i486/g' ${D}/opt/lsb-test/packages_list
> -		sed -i -e 's/targetarch/x86/g' ${D}/opt/lsb-test/session
> -	fi
> -	if [ "${TARGET_ARCH}" = "x86_64" ];then
> -		sed -i -e 's/lsbarch/amd64/g' -e 's/targetarch/x86_64/g' ${D}/opt/lsb-test/packages_list
> -		sed -i -e 's/targetarch/x86-64/g' ${D}/opt/lsb-test/session
> -	fi
> -	if [ "${TARGET_ARCH}" = "powerpc" ];then
> -		sed -i -e 's/lsbarch/ppc32/g' -e 's/targetarch/ppc/g' ${D}/opt/lsb-test/packages_list
> -		sed -i -e 's/targetarch/PPC32/g' ${D}/opt/lsb-test/session
> -	fi
> -
> -	# For a ppc64 target. the default userspace is 32b.
> -	# Therefore, only change the lsbarch and targetarch
> -	# in the package_list when MLIB=lib64 is being used.
> -	# Otherwise, by default, the ppc32 LSB packages
> -	# will be downloaded by LSB_Test.sh
> -	if [ "${TARGET_ARCH}" = "powerpc64" ];then
> -		if [ "${PN}" != "${BPN}" ];then
> -			sed -i -e 's/lsbarch/ppc64/g' -e 's/targetarch/ppc64/g' ${D}/opt/lsb-test/packages_list
> -			sed -i -e 's/targetarch/PPC64/g' ${D}/opt/lsb-test/session
> -		fi
> -	fi
> -}
> -
> -FILES_${PN} += "/opt/lsb-test/* \
> -               "
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> deleted file mode 100644
> index a821fd8bf3..0000000000
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ /dev/null
> @@ -1,240 +0,0 @@
> -#
> -# Copyright (C) 2010 Intel Corporation
> -#
> -
> -SUMMARY = "Linux Standard Base (LSB)"
> -DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specification"
> -PR = "r10"
> -
> -inherit packagegroup distro_features_check
> -
> -# The libxt, libxtst and others require x11 in DISTRO_FEATURES
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
> -# libglu needs virtual/libgl, which requires opengl in DISTRO_FEATURES
> -REQUIRED_DISTRO_FEATURES += "opengl"
> -
> -# libpam, pam-plugin-wheel requires pam in DISTRO_FEATURES
> -REQUIRED_DISTRO_FEATURES += "pam"
> -
> -#
> -# We will skip parsing this packagegeoup for non-glibc systems
> -#
> -python __anonymous () {
> -    if d.getVar('TCLIBC') != "glibc":
> -        raise bb.parse.SkipRecipe("incompatible with %s C library" %
> -                                   d.getVar('TCLIBC'))
> -}
> -
> -PACKAGES = "\
> -    packagegroup-core-lsb \
> -    packagegroup-core-sys-extended \
> -    packagegroup-core-db \
> -    packagegroup-core-perl \
> -    packagegroup-core-python \
> -    packagegroup-core-tcl \
> -    packagegroup-core-lsb-misc \
> -    packagegroup-core-lsb-core \
> -    packagegroup-core-lsb-perl \
> -    packagegroup-core-lsb-python \
> -    packagegroup-core-lsb-desktop \
> -    packagegroup-core-lsb-runtime-add \
> -    "
> -
> -
> -RDEPENDS_packagegroup-core-lsb = "\
> -    packagegroup-core-sys-extended \
> -    packagegroup-core-db \
> -    packagegroup-core-perl \
> -    packagegroup-core-python \
> -    packagegroup-core-tcl \
> -    packagegroup-core-lsb-misc \
> -    packagegroup-core-lsb-core \
> -    packagegroup-core-lsb-perl \
> -    packagegroup-core-lsb-python \
> -    packagegroup-core-lsb-desktop \
> -    packagegroup-core-lsb-runtime-add \
> -    "
> -
> -
> -RDEPENDS_packagegroup-core-sys-extended = "\
> -    curl \
> -    dhcp-client \
> -    hdparm \
> -    lighttpd \
> -    libaio \
> -    lrzsz \
> -    lzo \
> -    mc \
> -    mc-fish \
> -    mc-helpers \
> -    mc-helpers-perl \
> -    mdadm \
> -    minicom \
> -    parted \
> -    quota \
> -    screen \
> -    setserial \
> -    sysstat \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'udev-extraconf', d)} \
> -    unzip \
> -    watchdog \
> -    wget \
> -    which \
> -    xinetd \
> -    zip \
> -    "
> -
> -RDEPENDS_packagegroup-core-db = "\
> -    db \
> -    sqlite3 \
> -    "
> -
> -RDEPENDS_packagegroup-core-perl = "\
> -    gdbm \
> -    perl \
> -    zlib \
> -    "
> -
> -
> -RDEPENDS_packagegroup-core-python = "\
> -    expat \
> -    gdbm \
> -    gmp \
> -    ncurses \
> -    openssl \
> -    python \
> -    readline \
> -    zip \
> -    "
> -
> -RDEPENDS_packagegroup-core-tcl = "\
> -    tcl \
> -    "
> -
> -# Miscellaneous packages required by LSB (or LSB tests)
> -RDEPENDS_packagegroup-core-lsb-misc = "\
> -    chkconfig \
> -    gettext \
> -    gettext-runtime \
> -    groff \
> -    lsbinitscripts \
> -    lsbtest \
> -    lsof \
> -    strace \
> -    libusb1 \
> -    usbutils \
> -    rpm \
> -    "
> -
> -SUMMARY_packagegroup-core-lsb-core = "LSB Core"
> -DESCRIPTION_packagegroup-core-lsb-core = "Packages required to support commands/libraries \
> -    specified in the LSB Core specification"
> -RDEPENDS_packagegroup-core-lsb-core = "\
> -    at \
> -    bash \
> -    bc \
> -    binutils \
> -    binutils-symlinks \
> -    bzip2 \
> -    coreutils \
> -    cpio \
> -    cronie \
> -    cups \
> -    diffutils \
> -    ed \
> -    glibc-utils \
> -    elfutils \
> -    file \
> -    findutils \
> -    fontconfig-utils \
> -    foomatic-filters \
> -    gawk \
> -    ghostscript \
> -    grep \
> -    gzip \
> -    localedef \
> -    lsb \
> -    m4 \
> -    make \
> -    man \
> -    man-pages \
> -    msmtp \
> -    patch \
> -    procps \
> -    psmisc \
> -    sed \
> -    shadow \
> -    tar \
> -    time \
> -    util-linux \
> -    xdg-utils \
> -    \
> -    glibc \
> -    libgcc \
> -    libpam \
> -    libxml2 \
> -    ncurses \
> -    zlib \
> -    nspr \
> -    nss \
> -"
> -
> -SUMMARY_packagegroup-core-lsb-perl = "LSB Runtime Languages (Perl)"
> -DESCRIPTION_packagegroup-core-lsb-perl = "Packages required to support libraries \
> -    specified in the LSB Runtime languages specification (Perl parts)"
> -RDEPENDS_packagegroup-core-lsb-perl = "\
> -    perl \
> -    perl-modules \
> -    perl-misc \
> -    perl-pod \
> -    perl-dev \
> -    perl-doc \
> -"
> -
> -SUMMARY_packagegroup-core-lsb-python = "LSB Runtime Languages (Python)"
> -DESCRIPTION_packagegroup-core-lsb-python = "Packages required to support libraries \
> -    specified in the LSB Runtime languages specification (Python parts)"
> -RDEPENDS_packagegroup-core-lsb-python = "\
> -    python \
> -    python-modules \
> -    python-misc \
> -"
> -
> -SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
> -DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
> -    specified in the LSB Desktop specification"
> -RDEPENDS_packagegroup-core-lsb-desktop = "\
> -    libxt \
> -    libxxf86vm \
> -    libdrm \
> -    libglu \
> -    libxi \
> -    libxtst \
> -    libx11-locale \
> -    xorg-minimal-fonts \
> -    gdk-pixbuf-loader-ico \
> -    gdk-pixbuf-loader-bmp \
> -    gdk-pixbuf-loader-ani \
> -    gdk-pixbuf-xlib \
> -    liberation-fonts \
> -    alsa-lib \
> -"
> -
> -RDEPENDS_packagegroup-core-lsb-runtime-add = "\
> -    ldd \
> -    pam-plugin-wheel \
> -    e2fsprogs-mke2fs \
> -    mkfontdir \
> -    liburi-perl \
> -    libxml-parser-perl \
> -    libxml-perl \
> -    libxml-sax-perl \
> -    glibc-localedatas \
> -    glibc-gconvs \
> -    glibc-charmaps \
> -    glibc-binaries \
> -    glibc-localedata-posix \
> -    glibc-extra-nss \
> -    glibc-pcprofile \
> -"
> diff --git a/meta/recipes.txt b/meta/recipes.txt
> index 2439357876..fb2c25014d 100644
> --- a/meta/recipes.txt
> +++ b/meta/recipes.txt
> @@ -3,7 +3,7 @@ recipes-connectivity - Libraries and applications related to communication with
>   recipes-core         - What's needed to build a basic working Linux image including commonly used dependencies
>   recipes-devtools     - Tools primarily used by the build system (but can also be used on targets)
>   recipes-extended     - Applications which whilst not essential add features compared to the alternatives in
> -                       core. May be needed for full tool functionality or LSB compliance.
> +                       core. May be needed for full tool functionality.
>   recipes-gnome        - All things related to the GTK+ application framework
>   recipes-graphics     - X and other graphically related system libraries
>   recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
> 

