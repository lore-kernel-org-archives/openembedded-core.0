Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SzMBe-0002HK-Ex
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 08:25:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2012 23:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,738,1336374000"; d="scan'208";a="183470869"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2012 23:13:47 -0700
Message-ID: <5023551A.8070406@linux.intel.com>
Date: Thu, 09 Aug 2012 09:13:46 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343374256-22697-1-git-send-email-fahad.usman@gmail.com>
In-Reply-To: <1343374256-22697-1-git-send-email-fahad.usman@gmail.com>
Cc: Fahad Usman <fahad_usman@mentor.com>
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
X-List-Received-Date: Thu, 09 Aug 2012 06:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2012 10:30 AM, fahad.usman@gmail.com wrote:
> From: Fahad Usman <fahad_usman@mentor.com>
>
> update lttng-modules-2.0, lttng-tools-2.0 lttng-ust-2.0 and liburcu to the
> latest stable released versions by lttng community
>
> remove the lttng-sycalls-protect-is_compat_task-from-redefiniti.patch because
> the problem is handled in the latest version of lttng-modules
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>   ...ls-protect-is_compat_task-from-redefiniti.patch |   41 --------------------
>   .../lttng-2.0/lttng-modules_2.0.4.bb               |   26 ++++++++++++
>   .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   30 --------------
>   meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb |   32 ---------------
>   meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb |   30 ++++++++++++++
>   meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb  |   30 --------------
>   meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb  |   30 ++++++++++++++
>   meta/recipes-support/liburcu/liburcu_0.6.7.bb      |   24 -----------
>   meta/recipes-support/liburcu/liburcu_0.7.3.bb      |   24 +++++++++++
>   9 files changed, 110 insertions(+), 157 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>   delete mode 100644 meta/recipes-support/liburcu/liburcu_0.6.7.bb
>   create mode 100644 meta/recipes-support/liburcu/liburcu_0.7.3.bb
>
As has already been noted, this patch should really be split into at 
least 4 individual commits representing each recipe update, also there 
is an issue with the licensing in liburcu, Alex D. has worked on this 
patch and you can take his suggestion or let him update it directly.

Thanks
	Sau!

> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> deleted file mode 100644
> index 0056633..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Mon, 19 Mar 2012 13:30:31 -0400
> -Subject: [PATCH] lttng-sycalls: protect is_compat_task from redefinition
> -
> -recent -stable kernels have their own fallback definition of is_compat_task
> -
> -   #define is_compat_task() (0)
> -
> -To protect against this double definition of is_compat_task we can check
> -to see if it is already defined, and skip the lttng variant.
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ----
> - lttng-syscalls.c |    4 ++++
> - 1 files changed, 4 insertions(+), 0 deletions(-)
> -
> -diff --git a/lttng-syscalls.c b/lttng-syscalls.c
> -index 9de3c07..80d0f05 100644
> ---- a/lttng-syscalls.c
> -+++ b/lttng-syscalls.c
> -@@ -17,12 +17,16 @@
> - #include "ltt-events.h"
> -
> - #ifndef CONFIG_COMPAT
> -+
> -+#ifndef is_compat_task
> - static inline int is_compat_task(void)
> - {
> - 	return 0;
> - }
> - #endif
> -
> -+#endif
> -+
> - static
> - void syscall_entry_probe(void *__data, struct pt_regs *regs, long id);
> -
> ---
> -1.7.5.4
> -
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
> new file mode 100644
> index 0000000..d40c99b
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
> @@ -0,0 +1,26 @@
> +SECTION = "devel"
> +SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
> +DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
> +LICENSE = "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
> +                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
> +                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
> +
> +DEPENDS = "virtual/kernel"
> +
> +inherit module
> +
> +PR = "r0"
> +
> +SRC_URI = "http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2\
> +           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
> +SRC_URI[md5sum] = "e2f07c0eb40a0d8027de17f4dd7ebe12"
> +SRC_URI[sha256sum] = "f00116c388289192774c774581a651832be094aeb6da2f2c0f9c9e275fed2d14"
> +
> +export INSTALL_MOD_DIR="kernel/lttng-modules"
> +export KERNEL_SRC="${STAGING_KERNEL_DIR}"
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
> deleted file mode 100644
> index 4c78f36..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SECTION = "devel"
> -SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
> -DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
> -LICENSE = "LGPLv2.1 & GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
> -                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
> -
> -DEPENDS = "virtual/kernel"
> -
> -inherit module
> -
> -SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
> -PV = "2.0.pre11+git${SRCREV}"
> -PR = "r0"
> -
> -SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
> -           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> -           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
> -
> -export INSTALL_MOD_DIR="kernel/lttng-modules"
> -export KERNEL_SRC="${STAGING_KERNEL_DIR}"
> -
> -
> -S = "${WORKDIR}/git"
> -
> -# Due to liburcu not building for MIPS currently this recipe needs to
> -# be limited also.
> -# So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
> deleted file mode 100644
> index e7f1016..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SECTION = "devel"
> -SUMMARY = "Linux Trace Toolkit Control"
> -DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
> -to extract program execution details from the Linux operating system \
> -and interpret them."
> -
> -LICENSE = "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
> -                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
> -
> -DEPENDS = "liburcu popt lttng2-ust"
> -
> -SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
> -PV = "v2.0.1+git${SRCREV}"
> -PR = "r0"
> -
> -SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools
> -
> -export KERNELDIR="${STAGING_KERNEL_DIR}"
> -
> -FILES_${PN} += "${libdir}/lttng/libexec/*"
> -FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
> -
> -# Due to liburcu not building for MIPS currently this recipe needs to
> -# be limited also.
> -# So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
> new file mode 100644
> index 0000000..ef39b30
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
> @@ -0,0 +1,30 @@
> +SECTION = "devel"
> +SUMMARY = "Linux Trace Toolkit Control"
> +DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
> +to extract program execution details from the Linux operating system \
> +and interpret them."
> +
> +LICENSE = "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
> +                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
> +
> +DEPENDS = "liburcu popt lttng2-ust"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "360d0e0e70ed11eda5aa1570ebc9c155"
> +SRC_URI[sha256sum] = "cc538f420bfe716220169e41b572d0cb8a345afb552faef924bfb2c625d92b0d"
> +
> +inherit autotools
> +
> +export KERNELDIR="${STAGING_KERNEL_DIR}"
> +
> +FILES_${PN} += "${libdir}/lttng/libexec/*"
> +FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
> deleted file mode 100644
> index 8f650a4..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> -DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
> -HOMEPAGE = "http://lttng.org/lttng2.0"
> -BUGTRACKER = "n/a"
> -
> -LICENSE = "LGPLv2.1+ & BSD & GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
> -                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
> -                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
> -
> -inherit autotools
> -
> -DEPENDS = "liburcu util-linux"
> -
> -SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
> -PV = "2.0.2+git${SRCPV}"
> -PR = "r0"
> -
> -SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -do_configure_prepend () {
> -	${S}/bootstrap
> -}
> -
> -# Due to liburcu not building for MIPS currently this recipe needs to
> -# be limited also.
> -# So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
> new file mode 100644
> index 0000000..a5f8cec
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> +DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
> +HOMEPAGE = "http://lttng.org/lttng2.0"
> +BUGTRACKER = "n/a"
> +
> +LICENSE = "LGPLv2.1+ & BSD & GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
> +                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
> +                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
> +
> +inherit autotools
> +
> +DEPENDS = "liburcu util-linux"
> +
> +SRCREV = "f8b934136d431621e3e85457ac2875e8bd9c3387"
> +PV = "2.0.4+git${SRCPV}"
> +PR = "r0"
> +
> +SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure_prepend () {
> +	${S}/bootstrap
> +}
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> deleted file mode 100644
> index be73856..0000000
> --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
> -HOMEPAGE = "http://lttng.org/urcu"
> -BUGTRACKER = "http://lttng.org/project/issues"
> -
> -LICENSE = "LGPLv2.1+ & MIT-style"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
> -                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
> -                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
> -SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
> -
> -S = "${WORKDIR}/userspace-rcu-${PV}"
> -CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
> -inherit autotools
> -
> -# liburcu, which is only used by lttng-ust, may not build on other
> -# platforms, like MIPS.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> -
> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> new file mode 100644
> index 0000000..86f29be
> --- /dev/null
> +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
> +HOMEPAGE = "http://lttng.org/urcu"
> +BUGTRACKER = "http://lttng.org/project/issues"
> +
> +LICENSE = "LGPLv2.1+ & MIT-style"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
> +                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
> +                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
> +SRC_URI[sha256sum] = "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
> +
> +S = "${WORKDIR}/userspace-rcu-${PV}"
> +CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
> +inherit autotools
> +
> +# liburcu, which is only used by lttng-ust, may not build on other
> +# platforms, like MIPS.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +
>


