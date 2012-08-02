Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwrQl-0002e4-Mc
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:10:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 01:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="129545995"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 01:59:13 -0700
Message-ID: <501A41CC.70307@intel.com>
Date: Thu, 02 Aug 2012 12:01:00 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343374256-22697-1-git-send-email-fahad.usman@gmail.com>
	<CAJ2CSBsP1hcG=CJaWPxC2p19JM3YosJT9atyg7wtJTpeq6vvYQ@mail.gmail.com>
	<5012F99B.6050809@linux.intel.com>
	<CAJ2CSBtfvSJj_=Mgx5bBSmv1Wbm58Zx=6HRyjFL3FKqv3yJaRA@mail.gmail.com>
In-Reply-To: <CAJ2CSBtfvSJj_=Mgx5bBSmv1Wbm58Zx=6HRyjFL3FKqv3yJaRA@mail.gmail.com>
Subject: Re: [PATCH] lttng-2.0: update to the latest version
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
X-List-Received-Date: Thu, 02 Aug 2012 09:10:57 -0000
Content-Type: multipart/alternative;
	boundary="------------050206050200070705010809"

--------------050206050200070705010809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Wasn't a commit policy about having each package upgrade in a separate 
patch?

Radu

On 08/02/2012 11:51 AM, Damian, Alexandru wrote:
> This page includes a patch for upgrading liburcu, this is why I commented.
>
> Alex
>
> On Fri, Jul 27, 2012 at 11:27 PM, Saul Wold <sgw@linux.intel.com 
> <mailto:sgw@linux.intel.com>> wrote:
>
>     On 07/27/2012 01:39 AM, Damian, Alexandru wrote:
>
>         Hi,
>
>         I recommend changing the liburcu licence as follows,
>          following a GPLv3
>         file addition in the build macros:
>
>
>         LICENSE = "LGPLv2.1+ & MIT-style & GPLv3"
>         LICENSE_${PN} = "LGPLv2.1+ & MIT-style"
>
>     Alex,
>
>     Please what what you are replying to, I am not sure this has
>     anything to do with the LTTNG update.
>
>     Thanks
>             Sau!
>
>
>         Cheers,
>         Alex
>
>         On Fri, Jul 27, 2012 at 10:30 AM, <fahad.usman@gmail.com
>         <mailto:fahad.usman@gmail.com>
>         <mailto:fahad.usman@gmail.com <mailto:fahad.usman@gmail.com>>>
>         wrote:
>
>             From: Fahad Usman <fahad_usman@mentor.com
>         <mailto:fahad_usman@mentor.com>
>             <mailto:fahad_usman@mentor.com
>         <mailto:fahad_usman@mentor.com>>>
>
>
>             update lttng-modules-2.0, lttng-tools-2.0 lttng-ust-2.0
>         and liburcu
>             to the
>             latest stable released versions by lttng community
>
>             remove the
>             lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>         because
>             the problem is handled in the latest version of lttng-modules
>
>             Signed-off-by: Fahad Usman <fahad_usman@mentor.com
>         <mailto:fahad_usman@mentor.com>
>             <mailto:fahad_usman@mentor.com
>         <mailto:fahad_usman@mentor.com>>>
>
>             ---
>               ...ls-protect-is_compat_task-from-redefiniti.patch |   41
>             --------------------
>               .../lttng-2.0/lttng-modules_2.0.4.bb
>         <http://lttng-modules_2.0.4.bb>
>             <http://lttng-modules_2.0.4.bb>               |   26
>         ++++++++++++
>               .../lttng-2.0/lttng-modules_2.0.pre11.bb
>         <http://lttng-modules_2.0.pre11.bb>
>             <http://lttng-modules_2.0.pre11.bb>           |   30
>         --------------
>               meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>         <http://lttng-tools_2.0.1.bb>
>             <http://lttng-tools_2.0.1.bb> |   32 ---------------
>               meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>         <http://lttng-tools_2.0.3.bb>
>             <http://lttng-tools_2.0.3.bb> |   30 ++++++++++++++
>               meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>         <http://lttng2-ust_2.0.2.bb>
>             <http://lttng2-ust_2.0.2.bb>  |   30 --------------
>               meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>         <http://lttng2-ust_2.0.4.bb>
>             <http://lttng2-ust_2.0.4.bb>  |   30 ++++++++++++++
>               meta/recipes-support/liburcu/liburcu_0.6.7.bb
>         <http://liburcu_0.6.7.bb>
>             <http://liburcu_0.6.7.bb>      |   24 -----------
>               meta/recipes-support/liburcu/liburcu_0.7.3.bb
>         <http://liburcu_0.7.3.bb>
>             <http://liburcu_0.7.3.bb>      |   24 +++++++++++
>
>               9 files changed, 110 insertions(+), 157 deletions(-)
>               delete mode 100644
>            
>         meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>               create mode 100644
>             meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
>         <http://lttng-modules_2.0.4.bb>
>             <http://lttng-modules_2.0.4.bb>
>               delete mode 100644
>             meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>         <http://lttng-modules_2.0.pre11.bb>
>             <http://lttng-modules_2.0.pre11.bb>
>               delete mode 100644
>             meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>         <http://lttng-tools_2.0.1.bb>
>             <http://lttng-tools_2.0.1.bb>
>               create mode 100644
>             meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>         <http://lttng-tools_2.0.3.bb>
>             <http://lttng-tools_2.0.3.bb>
>               delete mode 100644
>             meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>         <http://lttng2-ust_2.0.2.bb>
>             <http://lttng2-ust_2.0.2.bb>
>               create mode 100644
>             meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>         <http://lttng2-ust_2.0.4.bb>
>             <http://lttng2-ust_2.0.4.bb>
>               delete mode 100644
>         meta/recipes-support/liburcu/liburcu_0.6.7.bb
>         <http://liburcu_0.6.7.bb>
>             <http://liburcu_0.6.7.bb>
>               create mode 100644
>         meta/recipes-support/liburcu/liburcu_0.7.3.bb
>         <http://liburcu_0.7.3.bb>
>             <http://liburcu_0.7.3.bb>
>
>
>             diff --git
>            
>         a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>            
>         b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>             deleted file mode 100644
>             index 0056633..0000000
>             ---
>            
>         a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>             +++ /dev/null
>             @@ -1,41 +0,0 @@
>             -From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17
>         00:00:00 2001
>             -From: Bruce Ashfield <bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>
>             <mailto:bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>>>
>
>             -Date: Mon, 19 Mar 2012 13:30:31 -0400
>             -Subject: [PATCH] lttng-sycalls: protect is_compat_task from
>             redefinition
>             -
>             -recent -stable kernels have their own fallback definition of
>             is_compat_task
>             -
>             -   #define is_compat_task() (0)
>             -
>             -To protect against this double definition of
>         is_compat_task we can
>             check
>             -to see if it is already defined, and skip the lttng variant.
>             -
>             -Signed-off-by: Bruce Ashfield
>         <bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>
>             <mailto:bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>>>
>
>             ----
>             - lttng-syscalls.c |    4 ++++
>             - 1 files changed, 4 insertions(+), 0 deletions(-)
>             -
>             -diff --git a/lttng-syscalls.c b/lttng-syscalls.c
>             -index 9de3c07..80d0f05 100644
>             ---- a/lttng-syscalls.c
>             -+++ b/lttng-syscalls.c
>             -@@ -17,12 +17,16 @@
>             - #include "ltt-events.h"
>             -
>             - #ifndef CONFIG_COMPAT
>             -+
>             -+#ifndef is_compat_task
>             - static inline int is_compat_task(void)
>             - {
>             -       return 0;
>             - }
>             - #endif
>             -
>             -+#endif
>             -+
>             - static
>             - void syscall_entry_probe(void *__data, struct pt_regs
>         *regs, long id);
>             -
>             ---
>             -1.7.5.4
>             -
>             diff --git
>         a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
>         <http://lttng-modules_2.0.4.bb>
>             <http://lttng-modules_2.0.4.bb>
>             b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
>         <http://lttng-modules_2.0.4.bb>
>             <http://lttng-modules_2.0.4.bb>
>
>             new file mode 100644
>             index 0000000..d40c99b
>             --- /dev/null
>             +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
>         <http://lttng-modules_2.0.4.bb>
>             <http://lttng-modules_2.0.4.bb>
>
>             @@ -0,0 +1,26 @@
>             +SECTION = "devel"
>             +SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
>             +DESCRIPTION = "The lttng-modules 2.0 package contains the
>         kernel
>             tracer modules"
>             +LICENSE = "LGPLv2.1 & GPLv2"
>             +LIC_FILES_CHKSUM =
>             "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
>             +
>               file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
>             +
>               file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
>             +
>             +DEPENDS = "virtual/kernel"
>             +
>             +inherit module
>             +
>             +PR = "r0"
>             +
>             +SRC_URI =
>         "http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2\
>         <http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C>
>            
>         <http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C>
>
>             +
>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
>             +SRC_URI[md5sum] = "e2f07c0eb40a0d8027de17f4dd7ebe12"
>             +SRC_URI[sha256sum] =
>            
>         "f00116c388289192774c774581a651832be094aeb6da2f2c0f9c9e275fed2d14"
>             +
>             +export INSTALL_MOD_DIR="kernel/lttng-modules"
>             +export KERNEL_SRC="${STAGING_KERNEL_DIR}"
>             +
>             +# Due to liburcu not building for MIPS currently this
>         recipe needs to
>             +# be limited also.
>             +# So here let us first suppport x86/arm/powerpc platforms
>         now.
>             +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             diff --git
>             a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>         <http://lttng-modules_2.0.pre11.bb>
>             <http://lttng-modules_2.0.pre11.bb>
>             b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>         <http://lttng-modules_2.0.pre11.bb>
>             <http://lttng-modules_2.0.pre11.bb>
>
>             deleted file mode 100644
>             index 4c78f36..0000000
>             ---
>         a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>         <http://lttng-modules_2.0.pre11.bb>
>             <http://lttng-modules_2.0.pre11.bb>
>
>             +++ /dev/null
>             @@ -1,30 +0,0 @@
>             -SECTION = "devel"
>             -SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
>             -DESCRIPTION = "The lttng-modules 2.0 package contains the
>         kernel
>             tracer modules"
>             -LICENSE = "LGPLv2.1 & GPLv2"
>             -LIC_FILES_CHKSUM =
>             "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
>             -
>               file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
>             -
>               file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
>             -
>             -DEPENDS = "virtual/kernel"
>             -
>             -inherit module
>             -
>             -SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
>             -PV = "2.0.pre11+git${SRCREV}"
>             -PR = "r0"
>             -
>             -SRC_URI =
>         "git://git.lttng.org/lttng-modules.git;protocol=git
>         <http://git.lttng.org/lttng-modules.git;protocol=git>
>             <http://git.lttng.org/lttng-modules.git;protocol=git> \
>
>             -
>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>             -
>            
>         file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
>             -
>             -export INSTALL_MOD_DIR="kernel/lttng-modules"
>             -export KERNEL_SRC="${STAGING_KERNEL_DIR}"
>             -
>             -
>             -S = "${WORKDIR}/git"
>             -
>             -# Due to liburcu not building for MIPS currently this
>         recipe needs to
>             -# be limited also.
>             -# So here let us first suppport x86/arm/powerpc platforms
>         now.
>             -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             diff --git
>         a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>         <http://lttng-tools_2.0.1.bb>
>             <http://lttng-tools_2.0.1.bb>
>             b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>         <http://lttng-tools_2.0.1.bb>
>             <http://lttng-tools_2.0.1.bb>
>
>             deleted file mode 100644
>             index e7f1016..0000000
>             --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>         <http://lttng-tools_2.0.1.bb>
>             <http://lttng-tools_2.0.1.bb>
>
>             +++ /dev/null
>             @@ -1,32 +0,0 @@
>             -SECTION = "devel"
>             -SUMMARY = "Linux Trace Toolkit Control"
>             -DESCRIPTION = "The Linux trace toolkit is a suite of
>         tools designed \
>             -to extract program execution details from the Linux
>         operating system \
>             -and interpret them."
>             -
>             -LICENSE = "GPLv2 & LGPLv2.1"
>             -LIC_FILES_CHKSUM =
>             "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
>             -
>               file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>             -
>               file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
>             -
>             -DEPENDS = "liburcu popt lttng2-ust"
>             -
>             -SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
>             -PV = "v2.0.1+git${SRCREV}"
>             -PR = "r0"
>             -
>             -SRC_URI =
>         "git://git.lttng.org/lttng-tools.git;protocol=git
>         <http://git.lttng.org/lttng-tools.git;protocol=git>
>             <http://git.lttng.org/lttng-tools.git;protocol=git>"
>
>             -
>             -S = "${WORKDIR}/git"
>             -
>             -inherit autotools
>             -
>             -export KERNELDIR="${STAGING_KERNEL_DIR}"
>             -
>             -FILES_${PN} += "${libdir}/lttng/libexec/*"
>             -FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
>             -
>             -# Due to liburcu not building for MIPS currently this
>         recipe needs to
>             -# be limited also.
>             -# So here let us first suppport x86/arm/powerpc platforms
>         now.
>             -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             diff --git
>         a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>         <http://lttng-tools_2.0.3.bb>
>             <http://lttng-tools_2.0.3.bb>
>             b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>         <http://lttng-tools_2.0.3.bb>
>             <http://lttng-tools_2.0.3.bb>
>
>             new file mode 100644
>             index 0000000..ef39b30
>             --- /dev/null
>             +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>         <http://lttng-tools_2.0.3.bb>
>             <http://lttng-tools_2.0.3.bb>
>
>             @@ -0,0 +1,30 @@
>             +SECTION = "devel"
>             +SUMMARY = "Linux Trace Toolkit Control"
>             +DESCRIPTION = "The Linux trace toolkit is a suite of
>         tools designed \
>             +to extract program execution details from the Linux
>         operating system \
>             +and interpret them."
>             +
>             +LICENSE = "GPLv2 & LGPLv2.1"
>             +LIC_FILES_CHKSUM =
>             "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
>             +
>               file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>             +
>               file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
>             +
>             +DEPENDS = "liburcu popt lttng2-ust"
>             +
>             +PR = "r0"
>             +
>             +SRC_URI =
>         "http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2
>         <http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2>
>            
>         <http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2>"
>
>             +SRC_URI[md5sum] = "360d0e0e70ed11eda5aa1570ebc9c155"
>             +SRC_URI[sha256sum] =
>            
>         "cc538f420bfe716220169e41b572d0cb8a345afb552faef924bfb2c625d92b0d"
>             +
>             +inherit autotools
>             +
>             +export KERNELDIR="${STAGING_KERNEL_DIR}"
>             +
>             +FILES_${PN} += "${libdir}/lttng/libexec/*"
>             +FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
>             +
>             +# Due to liburcu not building for MIPS currently this
>         recipe needs to
>             +# be limited also.
>             +# So here let us first suppport x86/arm/powerpc platforms
>         now.
>             +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             diff --git
>         a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>         <http://lttng2-ust_2.0.2.bb>
>             <http://lttng2-ust_2.0.2.bb>
>             b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>         <http://lttng2-ust_2.0.2.bb>
>             <http://lttng2-ust_2.0.2.bb>
>
>             deleted file mode 100644
>             index 8f650a4..0000000
>             --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>         <http://lttng2-ust_2.0.2.bb>
>             <http://lttng2-ust_2.0.2.bb>
>
>             +++ /dev/null
>             @@ -1,30 +0,0 @@
>             -SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
>             -DESCRIPTION = "The LTTng UST 2.0 package contains the
>         userspace
>             tracer library to trace userspace codes."
>             -HOMEPAGE = "http://lttng.org/lttng2.0"
>             -BUGTRACKER = "n/a"
>             -
>             -LICENSE = "LGPLv2.1+ & BSD & GPLv2"
>             -LIC_FILES_CHKSUM =
>             "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
>             -
>              
>         file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c
>         \
>             -
>              
>         file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
>             -
>             -inherit autotools
>             -
>             -DEPENDS = "liburcu util-linux"
>             -
>             -SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
>             -PV = "2.0.2+git${SRCPV}"
>             -PR = "r0"
>             -
>             -SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git
>         <http://git.lttng.org/lttng-ust.git;protocol=git>
>             <http://git.lttng.org/lttng-ust.git;protocol=git>"
>
>             -
>             -S = "${WORKDIR}/git"
>             -
>             -do_configure_prepend () {
>             -       ${S}/bootstrap
>             -}
>             -
>             -# Due to liburcu not building for MIPS currently this
>         recipe needs to
>             -# be limited also.
>             -# So here let us first suppport x86/arm/powerpc platforms
>         now.
>             -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             diff --git
>         a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>         <http://lttng2-ust_2.0.4.bb>
>             <http://lttng2-ust_2.0.4.bb>
>             b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>         <http://lttng2-ust_2.0.4.bb>
>             <http://lttng2-ust_2.0.4.bb>
>
>             new file mode 100644
>             index 0000000..a5f8cec
>             --- /dev/null
>             +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>         <http://lttng2-ust_2.0.4.bb>
>             <http://lttng2-ust_2.0.4.bb>
>
>             @@ -0,0 +1,30 @@
>             +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
>             +DESCRIPTION = "The LTTng UST 2.0 package contains the
>         userspace
>             tracer library to trace userspace codes."
>             +HOMEPAGE = "http://lttng.org/lttng2.0"
>             +BUGTRACKER = "n/a"
>             +
>             +LICENSE = "LGPLv2.1+ & BSD & GPLv2"
>             +LIC_FILES_CHKSUM =
>             "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
>             +
>              
>         file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c
>         \
>             +
>              
>         file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
>             +
>             +inherit autotools
>             +
>             +DEPENDS = "liburcu util-linux"
>             +
>             +SRCREV = "f8b934136d431621e3e85457ac2875e8bd9c3387"
>             +PV = "2.0.4+git${SRCPV}"
>             +PR = "r0"
>             +
>             +SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git
>         <http://git.lttng.org/lttng-ust.git;protocol=git>
>             <http://git.lttng.org/lttng-ust.git;protocol=git>"
>
>             +
>             +S = "${WORKDIR}/git"
>             +
>             +do_configure_prepend () {
>             +       ${S}/bootstrap
>             +}
>             +
>             +# Due to liburcu not building for MIPS currently this
>         recipe needs to
>             +# be limited also.
>             +# So here let us first suppport x86/arm/powerpc platforms
>         now.
>             +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
>         <http://liburcu_0.6.7.bb>
>             <http://liburcu_0.6.7.bb>
>             b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
>         <http://liburcu_0.6.7.bb>
>             <http://liburcu_0.6.7.bb>
>
>             deleted file mode 100644
>             index be73856..0000000
>             --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
>         <http://liburcu_0.6.7.bb>
>             <http://liburcu_0.6.7.bb>
>
>             +++ /dev/null
>             @@ -1,24 +0,0 @@
>             -DESCRIPTION = "The userspace read-copy update library by
>         Mathieu
>             Desnoyers"
>             -HOMEPAGE = "http://lttng.org/urcu"
>             -BUGTRACKER = "http://lttng.org/project/issues"
>             -
>             -LICENSE = "LGPLv2.1+ & MIT-style"
>             -LIC_FILES_CHKSUM =
>             "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
>             -
>              
>         file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9
>         \
>             -
>              
>         file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
>             -
>             -PR = "r0"
>             -
>             -SRC_URI =
>         "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2
>         <http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>
>            
>         <http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>"
>
>             -
>             -SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
>             -SRC_URI[sha256sum] =
>            
>         "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
>             -
>             -S = "${WORKDIR}/userspace-rcu-${PV}"
>             -CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>             -inherit autotools
>             -
>             -# liburcu, which is only used by lttng-ust, may not build
>         on other
>             -# platforms, like MIPS.
>             -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             -
>             diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb
>         <http://liburcu_0.7.3.bb>
>             <http://liburcu_0.7.3.bb>
>             b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
>         <http://liburcu_0.7.3.bb>
>             <http://liburcu_0.7.3.bb>
>
>             new file mode 100644
>             index 0000000..86f29be
>             --- /dev/null
>             +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
>         <http://liburcu_0.7.3.bb>
>             <http://liburcu_0.7.3.bb>
>
>             @@ -0,0 +1,24 @@
>             +DESCRIPTION = "The userspace read-copy update library by
>         Mathieu
>             Desnoyers"
>             +HOMEPAGE = "http://lttng.org/urcu"
>             +BUGTRACKER = "http://lttng.org/project/issues"
>             +
>             +LICENSE = "LGPLv2.1+ & MIT-style"
>             +LIC_FILES_CHKSUM =
>             "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
>             +
>              
>         file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9
>         \
>             +
>              
>         file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
>             +
>             +PR = "r0"
>             +
>             +SRC_URI =
>         "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2
>         <http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>
>            
>         <http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>"
>
>             +
>             +SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
>             +SRC_URI[sha256sum] =
>            
>         "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
>             +
>             +S = "${WORKDIR}/userspace-rcu-${PV}"
>             +CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>             +inherit autotools
>             +
>             +# liburcu, which is only used by lttng-ust, may not build
>         on other
>             +# platforms, like MIPS.
>             +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
>             +
>             --
>             1.7.1
>
>
>             _______________________________________________
>             Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>             <mailto:Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>>
>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
>
>
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------050206050200070705010809
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Wasn't a commit policy about having each package upgrade in a
    separate patch?<br>
    <br>
    Radu<br>
    <br>
    <div class="moz-cite-prefix">On 08/02/2012 11:51 AM, Damian,
      Alexandru wrote:<br>
    </div>
    <blockquote
cite="mid:CAJ2CSBtfvSJj_=Mgx5bBSmv1Wbm58Zx=6HRyjFL3FKqv3yJaRA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      This page includes a patch for upgrading liburcu, this is why I
      commented.<br>
      <br>
      Alex<br>
      <br>
      <div class="gmail_quote">On Fri, Jul 27, 2012 at 11:27 PM, Saul
        Wold <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:sgw@linux.intel.com" target="_blank">sgw@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div class="im">On 07/27/2012 01:39 AM, Damian, Alexandru
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              Hi,<br>
              <br>
              I recommend changing the liburcu licence as follows,
              &nbsp;following a GPLv3<br>
              file addition in the build macros:<br>
              <br>
              <br>
              LICENSE = "LGPLv2.1+ &amp; MIT-style &amp; GPLv3"<br>
              LICENSE_${PN} = "LGPLv2.1+ &amp; MIT-style"<br>
              <br>
            </blockquote>
          </div>
          Alex,<br>
          <br>
          Please what what you are replying to, I am not sure this has
          anything to do with the LTTNG update.<br>
          <br>
          Thanks<br>
          &nbsp; &nbsp; &nbsp; &nbsp; Sau!<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div class="im">
              <br>
              Cheers,<br>
              Alex<br>
              <br>
              On Fri, Jul 27, 2012 at 10:30 AM, &lt;<a
                moz-do-not-send="true"
                href="mailto:fahad.usman@gmail.com" target="_blank">fahad.usman@gmail.com</a><br>
            </div>
            <div class="im">
              &lt;mailto:<a moz-do-not-send="true"
                href="mailto:fahad.usman@gmail.com" target="_blank">fahad.usman@gmail.com</a>&gt;&gt;
              wrote:<br>
              <br>
              &nbsp; &nbsp; From: Fahad Usman &lt;<a moz-do-not-send="true"
                href="mailto:fahad_usman@mentor.com" target="_blank">fahad_usman@mentor.com</a><br>
            </div>
            &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
              href="mailto:fahad_usman@mentor.com" target="_blank">fahad_usman@mentor.com</a>&gt;&gt;
            <div class="im"><br>
              <br>
              &nbsp; &nbsp; update lttng-modules-2.0, lttng-tools-2.0
              lttng-ust-2.0 and liburcu<br>
              &nbsp; &nbsp; to the<br>
              &nbsp; &nbsp; latest stable released versions by lttng community<br>
              <br>
              &nbsp; &nbsp; remove the<br>
              &nbsp; &nbsp; lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
              because<br>
              &nbsp; &nbsp; the problem is handled in the latest version of
              lttng-modules<br>
              <br>
              &nbsp; &nbsp; Signed-off-by: Fahad Usman &lt;<a
                moz-do-not-send="true"
                href="mailto:fahad_usman@mentor.com" target="_blank">fahad_usman@mentor.com</a><br>
            </div>
            &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
              href="mailto:fahad_usman@mentor.com" target="_blank">fahad_usman@mentor.com</a>&gt;&gt;
            <div class="im"><br>
              &nbsp; &nbsp; ---<br>
              &nbsp; &nbsp; &nbsp; ...ls-protect-is_compat_task-from-redefiniti.patch |
              &nbsp; 41<br>
              &nbsp; &nbsp; --------------------<br>
              &nbsp; &nbsp; &nbsp; .../lttng-2.0/<a moz-do-not-send="true"
                href="http://lttng-modules_2.0.4.bb" target="_blank">lttng-modules_2.0.4.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.4.bb" target="_blank">http://lttng-modules_2.0.4.bb</a>&gt;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 26 ++++++++++++<br>
            &nbsp; &nbsp; &nbsp; .../lttng-2.0/<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">lttng-modules_2.0.pre11.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">http://lttng-modules_2.0.pre11.bb</a>&gt;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 30 --------------<br>
            &nbsp; &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng-tools_2.0.1.bb"
              target="_blank">lttng-tools_2.0.1.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.1.bb" target="_blank">http://lttng-tools_2.0.1.bb</a>&gt;
            | &nbsp; 32 ---------------<br>
            &nbsp; &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng-tools_2.0.3.bb"
              target="_blank">lttng-tools_2.0.3.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.3.bb" target="_blank">http://lttng-tools_2.0.3.bb</a>&gt;
            | &nbsp; 30 ++++++++++++++<br>
            &nbsp; &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng2-ust_2.0.2.bb"
              target="_blank">lttng2-ust_2.0.2.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.2.bb" target="_blank">http://lttng2-ust_2.0.2.bb</a>&gt;
            &nbsp;| &nbsp; 30 --------------<br>
            &nbsp; &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng2-ust_2.0.4.bb"
              target="_blank">lttng2-ust_2.0.4.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.4.bb" target="_blank">http://lttng2-ust_2.0.4.bb</a>&gt;
            &nbsp;| &nbsp; 30 ++++++++++++++<br>
            &nbsp; &nbsp; &nbsp; meta/recipes-support/liburcu/<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">liburcu_0.6.7.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">http://liburcu_0.6.7.bb</a>&gt;
            &nbsp; &nbsp; &nbsp;| &nbsp; 24 -----------<br>
            &nbsp; &nbsp; &nbsp; meta/recipes-support/liburcu/<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">liburcu_0.7.3.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">http://liburcu_0.7.3.bb</a>&gt;
            &nbsp; &nbsp; &nbsp;| &nbsp; 24 +++++++++++
            <div class="im"><br>
              &nbsp; &nbsp; &nbsp; 9 files changed, 110 insertions(+), 157 deletions(-)<br>
              &nbsp; &nbsp; &nbsp; delete mode 100644<br>
              &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch<br>
              &nbsp; &nbsp; &nbsp; create mode 100644<br>
              &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-modules_2.0.4.bb" target="_blank">lttng-modules_2.0.4.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.4.bb" target="_blank">http://lttng-modules_2.0.4.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; delete mode 100644<br>
            &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">lttng-modules_2.0.pre11.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">http://lttng-modules_2.0.pre11.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; delete mode 100644<br>
            &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.1.bb" target="_blank">lttng-tools_2.0.1.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.1.bb" target="_blank">http://lttng-tools_2.0.1.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; create mode 100644<br>
            &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.3.bb" target="_blank">lttng-tools_2.0.3.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.3.bb" target="_blank">http://lttng-tools_2.0.3.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; delete mode 100644<br>
            &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.2.bb" target="_blank">lttng2-ust_2.0.2.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.2.bb" target="_blank">http://lttng2-ust_2.0.2.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; create mode 100644<br>
            &nbsp; &nbsp; meta/recipes-kernel/lttng-2.0/<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.4.bb" target="_blank">lttng2-ust_2.0.4.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.4.bb" target="_blank">http://lttng2-ust_2.0.4.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; delete mode 100644 meta/recipes-support/liburcu/<a
              moz-do-not-send="true" href="http://liburcu_0.6.7.bb"
              target="_blank">liburcu_0.6.7.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">http://liburcu_0.6.7.bb</a>&gt;<br>
            &nbsp; &nbsp; &nbsp; create mode 100644 meta/recipes-support/liburcu/<a
              moz-do-not-send="true" href="http://liburcu_0.7.3.bb"
              target="_blank">liburcu_0.7.3.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">http://liburcu_0.7.3.bb</a>&gt;
            <div class="im"><br>
              <br>
              &nbsp; &nbsp; diff --git<br>
              &nbsp; &nbsp; a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch<br>
              &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch<br>
              &nbsp; &nbsp; deleted file mode 100644<br>
              &nbsp; &nbsp; index 0056633..0000000<br>
              &nbsp; &nbsp; ---<br>
              &nbsp; &nbsp; a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch<br>
              &nbsp; &nbsp; +++ /dev/null<br>
              &nbsp; &nbsp; @@ -1,41 +0,0 @@<br>
              &nbsp; &nbsp; -From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep
              17 00:00:00 2001<br>
              &nbsp; &nbsp; -From: Bruce Ashfield &lt;<a moz-do-not-send="true"
                href="mailto:bruce.ashfield@windriver.com"
                target="_blank">bruce.ashfield@windriver.com</a><br>
            </div>
            &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
              href="mailto:bruce.ashfield@windriver.com" target="_blank">bruce.ashfield@windriver.com</a>&gt;&gt;
            <div class="im"><br>
              &nbsp; &nbsp; -Date: Mon, 19 Mar 2012 13:30:31 -0400<br>
              &nbsp; &nbsp; -Subject: [PATCH] lttng-sycalls: protect
              is_compat_task from<br>
              &nbsp; &nbsp; redefinition<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -recent -stable kernels have their own fallback
              definition of<br>
              &nbsp; &nbsp; is_compat_task<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; - &nbsp; #define is_compat_task() (0)<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -To protect against this double definition of
              is_compat_task we can<br>
              &nbsp; &nbsp; check<br>
              &nbsp; &nbsp; -to see if it is already defined, and skip the lttng
              variant.<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -Signed-off-by: Bruce Ashfield &lt;<a
                moz-do-not-send="true"
                href="mailto:bruce.ashfield@windriver.com"
                target="_blank">bruce.ashfield@windriver.com</a><br>
            </div>
            &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
              href="mailto:bruce.ashfield@windriver.com" target="_blank">bruce.ashfield@windriver.com</a>&gt;&gt;
            <div>
              <div class="h5"><br>
                &nbsp; &nbsp; ----<br>
                &nbsp; &nbsp; - lttng-syscalls.c | &nbsp; &nbsp;4 ++++<br>
                &nbsp; &nbsp; - 1 files changed, 4 insertions(+), 0 deletions(-)<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -diff --git a/lttng-syscalls.c b/lttng-syscalls.c<br>
                &nbsp; &nbsp; -index 9de3c07..80d0f05 100644<br>
                &nbsp; &nbsp; ---- a/lttng-syscalls.c<br>
                &nbsp; &nbsp; -+++ b/lttng-syscalls.c<br>
                &nbsp; &nbsp; -@@ -17,12 +17,16 @@<br>
                &nbsp; &nbsp; - #include "ltt-events.h"<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; - #ifndef CONFIG_COMPAT<br>
                &nbsp; &nbsp; -+<br>
                &nbsp; &nbsp; -+#ifndef is_compat_task<br>
                &nbsp; &nbsp; - static inline int is_compat_task(void)<br>
                &nbsp; &nbsp; - {<br>
                &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; return 0;<br>
                &nbsp; &nbsp; - }<br>
                &nbsp; &nbsp; - #endif<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -+#endif<br>
                &nbsp; &nbsp; -+<br>
                &nbsp; &nbsp; - static<br>
                &nbsp; &nbsp; - void syscall_entry_probe(void *__data, struct
                pt_regs *regs, long id);<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; ---<br>
                &nbsp; &nbsp; -1.7.5.4<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; diff --git a/meta/recipes-kernel/lttng-2.0/<a
                  moz-do-not-send="true"
                  href="http://lttng-modules_2.0.4.bb" target="_blank">lttng-modules_2.0.4.bb</a><br>
              </div>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.4.bb" target="_blank">http://lttng-modules_2.0.4.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true"
              href="http://lttng-modules_2.0.4.bb" target="_blank">lttng-modules_2.0.4.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.4.bb" target="_blank">http://lttng-modules_2.0.4.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; new file mode 100644<br>
              &nbsp; &nbsp; index 0000000..d40c99b<br>
              &nbsp; &nbsp; --- /dev/null<br>
              &nbsp; &nbsp; +++ b/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-modules_2.0.4.bb" target="_blank">lttng-modules_2.0.4.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.4.bb" target="_blank">http://lttng-modules_2.0.4.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; @@ -0,0 +1,26 @@<br>
              &nbsp; &nbsp; +SECTION = "devel"<br>
              &nbsp; &nbsp; +SUMMARY = "Linux Trace Toolkit KERNEL MODULE"<br>
              &nbsp; &nbsp; +DESCRIPTION = "The lttng-modules 2.0 package contains
              the kernel<br>
              &nbsp; &nbsp; tracer modules"<br>
              &nbsp; &nbsp; +LICENSE = "LGPLv2.1 &amp; GPLv2"<br>
              &nbsp; &nbsp; +LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e">file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e</a> \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe">file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe</a>
              \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad">file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad</a>"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +DEPENDS = "virtual/kernel"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +inherit module<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +PR = "r0"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +SRC_URI = "<a moz-do-not-send="true"
                href="http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C"
                target="_blank">http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2\</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C"
              target="_blank">http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch">file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch</a>"<br>
              &nbsp; &nbsp; +SRC_URI[md5sum] = "e2f07c0eb40a0d8027de17f4dd7ebe12"<br>
              &nbsp; &nbsp; +SRC_URI[sha256sum] =<br>
              &nbsp; &nbsp; "f00116c388289192774c774581a651832be094aeb6da2f2c0f9c9e275fed2d14"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +export INSTALL_MOD_DIR="kernel/lttng-modules"<br>
              &nbsp; &nbsp; +export KERNEL_SRC="${STAGING_KERNEL_DIR}"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +# Due to liburcu not building for MIPS currently this
              recipe needs to<br>
              &nbsp; &nbsp; +# be limited also.<br>
              &nbsp; &nbsp; +# So here let us first suppport x86/arm/powerpc
              platforms now.<br>
              &nbsp; &nbsp; +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; diff --git<br>
              &nbsp; &nbsp; a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-modules_2.0.pre11.bb" target="_blank">lttng-modules_2.0.pre11.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">http://lttng-modules_2.0.pre11.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">lttng-modules_2.0.pre11.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">http://lttng-modules_2.0.pre11.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; deleted file mode 100644<br>
              &nbsp; &nbsp; index 4c78f36..0000000<br>
              &nbsp; &nbsp; --- a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-modules_2.0.pre11.bb" target="_blank">lttng-modules_2.0.pre11.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-modules_2.0.pre11.bb" target="_blank">http://lttng-modules_2.0.pre11.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; +++ /dev/null<br>
              &nbsp; &nbsp; @@ -1,30 +0,0 @@<br>
              &nbsp; &nbsp; -SECTION = "devel"<br>
              &nbsp; &nbsp; -SUMMARY = "Linux Trace Toolkit KERNEL MODULE"<br>
              &nbsp; &nbsp; -DESCRIPTION = "The lttng-modules 2.0 package contains
              the kernel<br>
              &nbsp; &nbsp; tracer modules"<br>
              &nbsp; &nbsp; -LICENSE = "LGPLv2.1 &amp; GPLv2"<br>
              &nbsp; &nbsp; -LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e">file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e</a> \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe">file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe</a>
              \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad">file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad</a>"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -DEPENDS = "virtual/kernel"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -inherit module<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"<br>
              &nbsp; &nbsp; -PV = "2.0.pre11+git${SRCREV}"<br>
              &nbsp; &nbsp; -PR = "r0"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -SRC_URI = "git://<a moz-do-not-send="true"
                href="http://git.lttng.org/lttng-modules.git;protocol=git"
                target="_blank">git.lttng.org/lttng-modules.git;protocol=git</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://git.lttng.org/lttng-modules.git;protocol=git"
              target="_blank">http://git.lttng.org/lttng-modules.git;protocol=git</a>&gt;
            \
            <div class="im"><br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch">file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch</a>
              \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch">file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch</a>"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -export INSTALL_MOD_DIR="kernel/lttng-modules"<br>
              &nbsp; &nbsp; -export KERNEL_SRC="${STAGING_KERNEL_DIR}"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -S = "${WORKDIR}/git"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -# Due to liburcu not building for MIPS currently this
              recipe needs to<br>
              &nbsp; &nbsp; -# be limited also.<br>
              &nbsp; &nbsp; -# So here let us first suppport x86/arm/powerpc
              platforms now.<br>
              &nbsp; &nbsp; -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; diff --git a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-tools_2.0.1.bb" target="_blank">lttng-tools_2.0.1.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.1.bb" target="_blank">http://lttng-tools_2.0.1.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng-tools_2.0.1.bb"
              target="_blank">lttng-tools_2.0.1.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.1.bb" target="_blank">http://lttng-tools_2.0.1.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; deleted file mode 100644<br>
              &nbsp; &nbsp; index e7f1016..0000000<br>
              &nbsp; &nbsp; --- a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-tools_2.0.1.bb" target="_blank">lttng-tools_2.0.1.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.1.bb" target="_blank">http://lttng-tools_2.0.1.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; +++ /dev/null<br>
              &nbsp; &nbsp; @@ -1,32 +0,0 @@<br>
              &nbsp; &nbsp; -SECTION = "devel"<br>
              &nbsp; &nbsp; -SUMMARY = "Linux Trace Toolkit Control"<br>
              &nbsp; &nbsp; -DESCRIPTION = "The Linux trace toolkit is a suite of
              tools designed \<br>
              &nbsp; &nbsp; -to extract program execution details from the Linux
              operating system \<br>
              &nbsp; &nbsp; -and interpret them."<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -LICENSE = "GPLv2 &amp; LGPLv2.1"<br>
              &nbsp; &nbsp; -LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd">file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd</a> \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263">file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263</a>
              \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca">file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca</a>"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -DEPENDS = "liburcu popt lttng2-ust"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"<br>
              &nbsp; &nbsp; -PV = "v2.0.1+git${SRCREV}"<br>
              &nbsp; &nbsp; -PR = "r0"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -SRC_URI = "git://<a moz-do-not-send="true"
                href="http://git.lttng.org/lttng-tools.git;protocol=git"
                target="_blank">git.lttng.org/lttng-tools.git;protocol=git</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://git.lttng.org/lttng-tools.git;protocol=git"
              target="_blank">http://git.lttng.org/lttng-tools.git;protocol=git</a>&gt;"
            <div class="im"><br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -S = "${WORKDIR}/git"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -inherit autotools<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -export KERNELDIR="${STAGING_KERNEL_DIR}"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -FILES_${PN} += "${libdir}/lttng/libexec/*"<br>
              &nbsp; &nbsp; -FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -# Due to liburcu not building for MIPS currently this
              recipe needs to<br>
              &nbsp; &nbsp; -# be limited also.<br>
              &nbsp; &nbsp; -# So here let us first suppport x86/arm/powerpc
              platforms now.<br>
              &nbsp; &nbsp; -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; diff --git a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-tools_2.0.3.bb" target="_blank">lttng-tools_2.0.3.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.3.bb" target="_blank">http://lttng-tools_2.0.3.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng-tools_2.0.3.bb"
              target="_blank">lttng-tools_2.0.3.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.3.bb" target="_blank">http://lttng-tools_2.0.3.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; new file mode 100644<br>
              &nbsp; &nbsp; index 0000000..ef39b30<br>
              &nbsp; &nbsp; --- /dev/null<br>
              &nbsp; &nbsp; +++ b/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true"
                href="http://lttng-tools_2.0.3.bb" target="_blank">lttng-tools_2.0.3.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng-tools_2.0.3.bb" target="_blank">http://lttng-tools_2.0.3.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; @@ -0,0 +1,30 @@<br>
              &nbsp; &nbsp; +SECTION = "devel"<br>
              &nbsp; &nbsp; +SUMMARY = "Linux Trace Toolkit Control"<br>
              &nbsp; &nbsp; +DESCRIPTION = "The Linux trace toolkit is a suite of
              tools designed \<br>
              &nbsp; &nbsp; +to extract program execution details from the Linux
              operating system \<br>
              &nbsp; &nbsp; +and interpret them."<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +LICENSE = "GPLv2 &amp; LGPLv2.1"<br>
              &nbsp; &nbsp; +LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd">file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd</a> \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263">file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263</a>
              \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca">file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca</a>"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +DEPENDS = "liburcu popt lttng2-ust"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +PR = "r0"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +SRC_URI = "<a moz-do-not-send="true"
                href="http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2"
                target="_blank">http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2"
              target="_blank">http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2</a>&gt;"
            <div class="im"><br>
              &nbsp; &nbsp; +SRC_URI[md5sum] = "360d0e0e70ed11eda5aa1570ebc9c155"<br>
              &nbsp; &nbsp; +SRC_URI[sha256sum] =<br>
              &nbsp; &nbsp; "cc538f420bfe716220169e41b572d0cb8a345afb552faef924bfb2c625d92b0d"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +inherit autotools<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +export KERNELDIR="${STAGING_KERNEL_DIR}"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +FILES_${PN} += "${libdir}/lttng/libexec/*"<br>
              &nbsp; &nbsp; +FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +# Due to liburcu not building for MIPS currently this
              recipe needs to<br>
              &nbsp; &nbsp; +# be limited also.<br>
              &nbsp; &nbsp; +# So here let us first suppport x86/arm/powerpc
              platforms now.<br>
              &nbsp; &nbsp; +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; diff --git a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true" href="http://lttng2-ust_2.0.2.bb"
                target="_blank">lttng2-ust_2.0.2.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.2.bb" target="_blank">http://lttng2-ust_2.0.2.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng2-ust_2.0.2.bb"
              target="_blank">lttng2-ust_2.0.2.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.2.bb" target="_blank">http://lttng2-ust_2.0.2.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; deleted file mode 100644<br>
              &nbsp; &nbsp; index 8f650a4..0000000<br>
              &nbsp; &nbsp; --- a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true" href="http://lttng2-ust_2.0.2.bb"
                target="_blank">lttng2-ust_2.0.2.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.2.bb" target="_blank">http://lttng2-ust_2.0.2.bb</a>&gt;
            <div>
              <div class="h5"><br>
                &nbsp; &nbsp; +++ /dev/null<br>
                &nbsp; &nbsp; @@ -1,30 +0,0 @@<br>
                &nbsp; &nbsp; -SUMMARY = "Linux Trace Toolkit Userspace Tracer
                2.0"<br>
                &nbsp; &nbsp; -DESCRIPTION = "The LTTng UST 2.0 package contains
                the userspace<br>
                &nbsp; &nbsp; tracer library to trace userspace codes."<br>
                &nbsp; &nbsp; -HOMEPAGE = "<a moz-do-not-send="true"
                  href="http://lttng.org/lttng2.0" target="_blank">http://lttng.org/lttng2.0</a>"<br>
                &nbsp; &nbsp; -BUGTRACKER = "n/a"<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -LICENSE = "LGPLv2.1+ &amp; BSD &amp; GPLv2"<br>
                &nbsp; &nbsp; -LIC_FILES_CHKSUM =<br>
                &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9">file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9</a>
                \<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c">file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c</a>
                \<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44">file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44</a>"<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -inherit autotools<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -DEPENDS = "liburcu util-linux"<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"<br>
                &nbsp; &nbsp; -PV = "2.0.2+git${SRCPV}"<br>
                &nbsp; &nbsp; -PR = "r0"<br>
                &nbsp; &nbsp; -<br>
                &nbsp; &nbsp; -SRC_URI = "git://<a moz-do-not-send="true"
                  href="http://git.lttng.org/lttng-ust.git;protocol=git"
                  target="_blank">git.lttng.org/lttng-ust.git;protocol=git</a><br>
              </div>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://git.lttng.org/lttng-ust.git;protocol=git"
              target="_blank">http://git.lttng.org/lttng-ust.git;protocol=git</a>&gt;"
            <div class="im"><br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -S = "${WORKDIR}/git"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -do_configure_prepend () {<br>
              &nbsp; &nbsp; - &nbsp; &nbsp; &nbsp; ${S}/bootstrap<br>
              &nbsp; &nbsp; -}<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -# Due to liburcu not building for MIPS currently this
              recipe needs to<br>
              &nbsp; &nbsp; -# be limited also.<br>
              &nbsp; &nbsp; -# So here let us first suppport x86/arm/powerpc
              platforms now.<br>
              &nbsp; &nbsp; -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; diff --git a/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true" href="http://lttng2-ust_2.0.4.bb"
                target="_blank">lttng2-ust_2.0.4.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.4.bb" target="_blank">http://lttng2-ust_2.0.4.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-kernel/lttng-2.0/<a
              moz-do-not-send="true" href="http://lttng2-ust_2.0.4.bb"
              target="_blank">lttng2-ust_2.0.4.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.4.bb" target="_blank">http://lttng2-ust_2.0.4.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; new file mode 100644<br>
              &nbsp; &nbsp; index 0000000..a5f8cec<br>
              &nbsp; &nbsp; --- /dev/null<br>
              &nbsp; &nbsp; +++ b/meta/recipes-kernel/lttng-2.0/<a
                moz-do-not-send="true" href="http://lttng2-ust_2.0.4.bb"
                target="_blank">lttng2-ust_2.0.4.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng2-ust_2.0.4.bb" target="_blank">http://lttng2-ust_2.0.4.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; @@ -0,0 +1,30 @@<br>
              &nbsp; &nbsp; +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"<br>
              &nbsp; &nbsp; +DESCRIPTION = "The LTTng UST 2.0 package contains the
              userspace<br>
              &nbsp; &nbsp; tracer library to trace userspace codes."<br>
              &nbsp; &nbsp; +HOMEPAGE = "<a moz-do-not-send="true"
                href="http://lttng.org/lttng2.0" target="_blank">http://lttng.org/lttng2.0</a>"<br>
              &nbsp; &nbsp; +BUGTRACKER = "n/a"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +LICENSE = "LGPLv2.1+ &amp; BSD &amp; GPLv2"<br>
              &nbsp; &nbsp; +LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9">file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9</a> \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c">file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c</a>
              \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44">file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44</a>"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +inherit autotools<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +DEPENDS = "liburcu util-linux"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +SRCREV = "f8b934136d431621e3e85457ac2875e8bd9c3387"<br>
              &nbsp; &nbsp; +PV = "2.0.4+git${SRCPV}"<br>
              &nbsp; &nbsp; +PR = "r0"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +SRC_URI = "git://<a moz-do-not-send="true"
                href="http://git.lttng.org/lttng-ust.git;protocol=git"
                target="_blank">git.lttng.org/lttng-ust.git;protocol=git</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://git.lttng.org/lttng-ust.git;protocol=git"
              target="_blank">http://git.lttng.org/lttng-ust.git;protocol=git</a>&gt;"
            <div class="im"><br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +S = "${WORKDIR}/git"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +do_configure_prepend () {<br>
              &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; ${S}/bootstrap<br>
              &nbsp; &nbsp; +}<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +# Due to liburcu not building for MIPS currently this
              recipe needs to<br>
              &nbsp; &nbsp; +# be limited also.<br>
              &nbsp; &nbsp; +# So here let us first suppport x86/arm/powerpc
              platforms now.<br>
              &nbsp; &nbsp; +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; diff --git a/meta/recipes-support/liburcu/<a
                moz-do-not-send="true" href="http://liburcu_0.6.7.bb"
                target="_blank">liburcu_0.6.7.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">http://liburcu_0.6.7.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-support/liburcu/<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">liburcu_0.6.7.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">http://liburcu_0.6.7.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; deleted file mode 100644<br>
              &nbsp; &nbsp; index be73856..0000000<br>
              &nbsp; &nbsp; --- a/meta/recipes-support/liburcu/<a
                moz-do-not-send="true" href="http://liburcu_0.6.7.bb"
                target="_blank">liburcu_0.6.7.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.6.7.bb" target="_blank">http://liburcu_0.6.7.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; +++ /dev/null<br>
              &nbsp; &nbsp; @@ -1,24 +0,0 @@<br>
              &nbsp; &nbsp; -DESCRIPTION = "The userspace read-copy update library
              by Mathieu<br>
              &nbsp; &nbsp; Desnoyers"<br>
              &nbsp; &nbsp; -HOMEPAGE = "<a moz-do-not-send="true"
                href="http://lttng.org/urcu" target="_blank">http://lttng.org/urcu</a>"<br>
              &nbsp; &nbsp; -BUGTRACKER = "<a moz-do-not-send="true"
                href="http://lttng.org/project/issues" target="_blank">http://lttng.org/project/issues</a>"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -LICENSE = "LGPLv2.1+ &amp; MIT-style"<br>
              &nbsp; &nbsp; -LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff">file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff</a> \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9">file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9</a>
              \<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42">file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42</a>"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -PR = "r0"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -SRC_URI = "<a moz-do-not-send="true"
                href="http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2"
                target="_blank">http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2"
              target="_blank">http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2</a>&gt;"
            <div class="im"><br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"<br>
              &nbsp; &nbsp; -SRC_URI[sha256sum] =<br>
              &nbsp; &nbsp; "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -S = "${WORKDIR}/userspace-rcu-${PV}"<br>
              &nbsp; &nbsp; -CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"<br>
              &nbsp; &nbsp; -inherit autotools<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; -# liburcu, which is only used by lttng-ust, may not
              build on other<br>
              &nbsp; &nbsp; -# platforms, like MIPS.<br>
              &nbsp; &nbsp; -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; -<br>
              &nbsp; &nbsp; diff --git a/meta/recipes-support/liburcu/<a
                moz-do-not-send="true" href="http://liburcu_0.7.3.bb"
                target="_blank">liburcu_0.7.3.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">http://liburcu_0.7.3.bb</a>&gt;<br>
            &nbsp; &nbsp; b/meta/recipes-support/liburcu/<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">liburcu_0.7.3.bb</a><br>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">http://liburcu_0.7.3.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; new file mode 100644<br>
              &nbsp; &nbsp; index 0000000..86f29be<br>
              &nbsp; &nbsp; --- /dev/null<br>
              &nbsp; &nbsp; +++ b/meta/recipes-support/liburcu/<a
                moz-do-not-send="true" href="http://liburcu_0.7.3.bb"
                target="_blank">liburcu_0.7.3.bb</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://liburcu_0.7.3.bb" target="_blank">http://liburcu_0.7.3.bb</a>&gt;
            <div class="im"><br>
              &nbsp; &nbsp; @@ -0,0 +1,24 @@<br>
              &nbsp; &nbsp; +DESCRIPTION = "The userspace read-copy update library
              by Mathieu<br>
              &nbsp; &nbsp; Desnoyers"<br>
              &nbsp; &nbsp; +HOMEPAGE = "<a moz-do-not-send="true"
                href="http://lttng.org/urcu" target="_blank">http://lttng.org/urcu</a>"<br>
              &nbsp; &nbsp; +BUGTRACKER = "<a moz-do-not-send="true"
                href="http://lttng.org/project/issues" target="_blank">http://lttng.org/project/issues</a>"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +LICENSE = "LGPLv2.1+ &amp; MIT-style"<br>
              &nbsp; &nbsp; +LIC_FILES_CHKSUM =<br>
              &nbsp; &nbsp; "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89">file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89</a> \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9">file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9</a>
              \<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42">file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42</a>"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +PR = "r0"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +SRC_URI = "<a moz-do-not-send="true"
                href="http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2"
                target="_blank">http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2</a><br>
            </div>
            &nbsp; &nbsp; &lt;<a moz-do-not-send="true"
              href="http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2"
              target="_blank">http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2</a>&gt;"
            <div class="im"><br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"<br>
              &nbsp; &nbsp; +SRC_URI[sha256sum] =<br>
              &nbsp; &nbsp; "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +S = "${WORKDIR}/userspace-rcu-${PV}"<br>
              &nbsp; &nbsp; +CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"<br>
              &nbsp; &nbsp; +inherit autotools<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; +# liburcu, which is only used by lttng-ust, may not
              build on other<br>
              &nbsp; &nbsp; +# platforms, like MIPS.<br>
              &nbsp; &nbsp; +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'<br>
              &nbsp; &nbsp; +<br>
              &nbsp; &nbsp; --<br>
              &nbsp; &nbsp; 1.7.1<br>
              <br>
              <br>
              &nbsp; &nbsp; _______________________________________________<br>
              &nbsp; &nbsp; Openembedded-core mailing list<br>
              &nbsp; &nbsp; <a moz-do-not-send="true"
                href="mailto:Openembedded-core@lists.openembedded.org"
                target="_blank">Openembedded-core@lists.openembedded.org</a><br>
            </div>
            &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
              href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank">Openembedded-core@lists.openembedded.org</a>&gt;<br>
            &nbsp; &nbsp; <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
              target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
            <div class="im"><br>
              <br>
              <br>
              <br>
              <br>
              _______________________________________________<br>
              Openembedded-core mailing list<br>
              <a moz-do-not-send="true"
                href="mailto:Openembedded-core@lists.openembedded.org"
                target="_blank">Openembedded-core@lists.openembedded.org</a><br>
              <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
              <br>
            </div>
          </blockquote>
        </blockquote>
      </div>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050206050200070705010809--
