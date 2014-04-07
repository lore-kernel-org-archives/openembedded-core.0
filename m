Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4D86F6F911
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 00:22:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Apr 2014 15:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,813,1389772800"; d="scan'208";a="488861164"
Received: from unknown (HELO [10.255.12.20]) ([10.255.12.20])
	by orsmga001.jf.intel.com with ESMTP; 07 Apr 2014 15:13:14 -0700
Message-ID: <534322FA.6090404@linux.intel.com>
Date: Mon, 07 Apr 2014 15:13:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
References: <1396837755-4659-1-git-send-email-denis@denix.org>
	<1396837755-4659-3-git-send-email-denis@denix.org>
In-Reply-To: <1396837755-4659-3-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 3/4] cryptodev-module: recipe for out-of-tree cryptodev device driver
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
X-List-Received-Date: Tue, 08 Apr 2014 00:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2014 07:29 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Depends on cryptodev-linux for providing a header file
>

I am seeing failure on the Autobuilder with multilib enabled (lib32), I 
am not sure if this is a multilib issue, but it shows up here


> NOTE: Running task 14174 of 19826 (ID: 13044, virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/libcgroup/libcgroup_0.41.bb, do_configure)
> ERROR: Function failed: do_compile (log file is located at /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/temp/log.do_compile.19322)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/temp/log.do_compile.19322
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 KERNEL_DIR=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/src/kernel PREFIX=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/image KERNEL_PATH=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/src/kernel KERNEL_SRC=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/src/kernel KERNEL_VERSION=3.14.0-yocto-standard CC=i586-poky-linux-gcc  LD=i586-poky-linux-ld.bfd  AR=i586-poky-linux-ar
> | make -C /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/src/kernel SUBDIRS=`pwd` modules
> | make[1]: Entering directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/src/kernel'
> | make[1]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
> |   CC [M]  /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/ioctl.o
> | /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/ioctl.c:710:21: warning: 'is_known_accelerated' defined but not used [-Wunused-function]
> |  static unsigned int is_known_accelerated(struct crypto_tfm *tfm)
> |                      ^
> |   CC [M]  /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/main.o
> |   CC [M]  /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/cryptlib.o
> | /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/cryptlib.c: In function 'cryptodev_cipher_encrypt':
> | /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/cryptlib.c:223:2: error: implicit declaration of function 'INIT_COMPLETION' [-Werror=implicit-function-declaration]
> |   INIT_COMPLETION(cdata->async.result->completion);
> |   ^
> | cc1: some warnings being treated as errors
> | make[2]: *** [/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/cryptlib.o] Error 1
> | make[1]: *** [_module_/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6] Error 2
> | make[1]: Leaving directory `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/src/kernel'
> | make: *** [build] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/temp/run.do_compile.19322:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/qemux86-poky-linux/cryptodev-module/1.6-r0/temp/log.do_compile.19322)
> NOTE: recipe cryptodev-module-1.6-r0: task do_compile: Failed
> ERROR: Task 13808 (/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb, do_compile) failed with exit code '1'
> NOTE: Running task 14175 of 19826 (ID: 13002, virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-devtools/python/python-mako_0.9.1.bb, do_configure)
> NOTE: recipe liburcu-0.8.1-r0: task do_package_write_deb: Succeeded



> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../cryptodev/cryptodev-module_1.6.bb              | 15 ++++++++++++
>   ...talling-header-file-provided-by-another-p.patch | 28 ++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
> new file mode 100644
> index 0000000..fdf07b2
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
> @@ -0,0 +1,15 @@
> +require cryptodev_${PV}.inc
> +
> +SUMMARY = "A /dev/crypto device driver kernel module"
> +
> +inherit module
> +
> +# Header file provided by a separate package
> +DEPENDS += "cryptodev-linux"
> +
> +SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch"
> +
> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> +
> +RCONFLICTS_${PN} = "ocf-linux"
> +RREPLACES_${PN} = "ocf-linux"
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
> new file mode 100644
> index 0000000..a580fc6
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
> @@ -0,0 +1,28 @@
> +From 8a884f55bd1527baa82fab68c186ba546273860c Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Sun, 6 Apr 2014 19:51:39 -0400
> +Subject: [PATCH] Disable installing header file provided by another package
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +
> +Upstream-Status: Inappropriate [ OE specific ]
> +---
> + Makefile | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d66ef26..8e97c6a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -23,8 +23,6 @@ install: modules_install
> +
> + modules_install:
> + 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
> +-	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
> +-	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
> +
> + clean:
> + 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
> +--
> +1.9.1
> +
>

