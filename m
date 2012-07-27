Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SugGF-0007v0-0C
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 10:51:03 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 01:39:29 -0700
Received: by qabj34 with SMTP id j34so1571071qab.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 01:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=RJQt12CBy8L4HEYSpRJReqvW2p5OXZT7N3z1R9ZHGRc=;
	b=BmB+BrmwokQ0BIzaCCdQzV9ngdInid+N2Rn3OHQpAf1lgZ8k/Eo1NcBmETdLUFQLYx
	zC7qunoab06tAuPaE7G6uI8y3CQXc3DLpWQXrTr59Z9+4Vv6hTq/DgQWl/VWj7JBC2Eq
	dDB0FeleRssCDRGlc4vOnzb8FE/mRyEyj4WDsqSr6xEU5k3k32nTgAjTZgJrvjV2aZ7C
	gO3taIdxNf3xATZW6x1Sud70vtOVl1JuWp+3ZaQG3xDJExk0cdKxLdz1rND0QSEYq03J
	uimmIPf1OVzB4jVKQwc7/zMXnhnaVmWCTBq3KEDZx/Q6ew4vvcdu6sw2W4rg71ODEN9t
	yZzQ==
MIME-Version: 1.0
Received: by 10.224.78.198 with SMTP id m6mr7433978qak.30.1343378368435; Fri,
	27 Jul 2012 01:39:28 -0700 (PDT)
Received: by 10.229.78.130 with HTTP; Fri, 27 Jul 2012 01:39:28 -0700 (PDT)
In-Reply-To: <1343374256-22697-1-git-send-email-fahad.usman@gmail.com>
References: <1343374256-22697-1-git-send-email-fahad.usman@gmail.com>
Date: Fri, 27 Jul 2012 11:39:28 +0300
Message-ID: <CAJ2CSBsP1hcG=CJaWPxC2p19JM3YosJT9atyg7wtJTpeq6vvYQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkP/iHC9aqnmfgXp1ysmDCP/WvGgn5i7rOQDN9VaSoNoEnfof578MJ90nprCHcWnlQJjOI3
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
X-List-Received-Date: Fri, 27 Jul 2012 08:51:04 -0000
Content-Type: multipart/alternative; boundary=20cf3074d99673168804c5cba6a4

--20cf3074d99673168804c5cba6a4
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I recommend changing the liburcu licence as follows,  following a GPLv3
file addition in the build macros:


LICENSE = "LGPLv2.1+ & MIT-style & GPLv3"
LICENSE_${PN} = "LGPLv2.1+ & MIT-style"


Cheers,
Alex

On Fri, Jul 27, 2012 at 10:30 AM, <fahad.usman@gmail.com> wrote:

> From: Fahad Usman <fahad_usman@mentor.com>
>
> update lttng-modules-2.0, lttng-tools-2.0 lttng-ust-2.0 and liburcu to the
> latest stable released versions by lttng community
>
> remove the lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> because
> the problem is handled in the latest version of lttng-modules
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  ...ls-protect-is_compat_task-from-redefiniti.patch |   41
> --------------------
>  .../lttng-2.0/lttng-modules_2.0.4.bb               |   26 ++++++++++++
>  .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   30 --------------
>  meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb |   32 ---------------
>  meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb |   30 ++++++++++++++
>  meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb  |   30 --------------
>  meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb  |   30 ++++++++++++++
>  meta/recipes-support/liburcu/liburcu_0.6.7.bb      |   24 -----------
>  meta/recipes-support/liburcu/liburcu_0.7.3.bb      |   24 +++++++++++
>  9 files changed, 110 insertions(+), 157 deletions(-)
>  delete mode 100644
> meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
>  delete mode 100644 meta/recipes-kernel/lttng-2.0/
> lttng-modules_2.0.pre11.bb
>  delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bb
>  delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
>  delete mode 100644 meta/recipes-support/liburcu/liburcu_0.6.7.bb
>  create mode 100644 meta/recipes-support/liburcu/liburcu_0.7.3.bb
>
> diff --git
> a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> deleted file mode 100644
> index 0056633..0000000
> ---
> a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Mon, 19 Mar 2012 13:30:31 -0400
> -Subject: [PATCH] lttng-sycalls: protect is_compat_task from redefinition
> -
> -recent -stable kernels have their own fallback definition of
> is_compat_task
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
> -       return 0;
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
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bbb/meta/recipes-kernel/lttng-2.0/
> lttng-modules_2.0.4.bb
> new file mode 100644
> index 0000000..d40c99b
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.4.bb
> @@ -0,0 +1,26 @@
> +SECTION = "devel"
> +SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
> +DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer
> modules"
> +LICENSE = "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
> +
>  file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
> +
>  file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
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
> +SRC_URI[sha256sum] =
> "f00116c388289192774c774581a651832be094aeb6da2f2c0f9c9e275fed2d14"
> +
> +export INSTALL_MOD_DIR="kernel/lttng-modules"
> +export KERNEL_SRC="${STAGING_KERNEL_DIR}"
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bbb/meta/recipes-kernel/lttng-2.0/
> lttng-modules_2.0.pre11.bb
> deleted file mode 100644
> index 4c78f36..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SECTION = "devel"
> -SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
> -DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer
> modules"
> -LICENSE = "LGPLv2.1 & GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
> -
>  file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
> -
>  file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
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
> -
> file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
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
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bbb/meta/recipes-kernel/lttng-2.0/
> lttng-tools_2.0.1.bb
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
> -
>  file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -
>  file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
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
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.3.bbb/meta/recipes-kernel/lttng-2.0/
> lttng-tools_2.0.3.bb
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
> +
>  file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +
>  file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
> +
> +DEPENDS = "liburcu popt lttng2-ust"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://lttng.org/files/${PN}/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "360d0e0e70ed11eda5aa1570ebc9c155"
> +SRC_URI[sha256sum] =
> "cc538f420bfe716220169e41b572d0cb8a345afb552faef924bfb2c625d92b0d"
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
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bbb/meta/recipes-kernel/lttng-2.0/
> lttng2-ust_2.0.2.bb
> deleted file mode 100644
> index 8f650a4..0000000
> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> -DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer
> library to trace userspace codes."
> -HOMEPAGE = "http://lttng.org/lttng2.0"
> -BUGTRACKER = "n/a"
> -
> -LICENSE = "LGPLv2.1+ & BSD & GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
> -
>  file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c
> \
> -
>  file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
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
> -       ${S}/bootstrap
> -}
> -
> -# Due to liburcu not building for MIPS currently this recipe needs to
> -# be limited also.
> -# So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bbb/meta/recipes-kernel/lttng-2.0/
> lttng2-ust_2.0.4.bb
> new file mode 100644
> index 0000000..a5f8cec
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.4.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> +DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer
> library to trace userspace codes."
> +HOMEPAGE = "http://lttng.org/lttng2.0"
> +BUGTRACKER = "n/a"
> +
> +LICENSE = "LGPLv2.1+ & BSD & GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
> +
>  file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c
> \
> +
>  file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
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
> +       ${S}/bootstrap
> +}
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bbb/meta/recipes-support/liburcu/
> liburcu_0.6.7.bb
> deleted file mode 100644
> index be73856..0000000
> --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "The userspace read-copy update library by Mathieu
> Desnoyers"
> -HOMEPAGE = "http://lttng.org/urcu"
> -BUGTRACKER = "http://lttng.org/project/issues"
> -
> -LICENSE = "LGPLv2.1+ & MIT-style"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
> -
>  file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
> -
>  file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
> -SRC_URI[sha256sum] =
> "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
> -
> -S = "${WORKDIR}/userspace-rcu-${PV}"
> -CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
> -inherit autotools
> -
> -# liburcu, which is only used by lttng-ust, may not build on other
> -# platforms, like MIPS.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> -
> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bbb/meta/recipes-support/liburcu/
> liburcu_0.7.3.bb
> new file mode 100644
> index 0000000..86f29be
> --- /dev/null
> +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "The userspace read-copy update library by Mathieu
> Desnoyers"
> +HOMEPAGE = "http://lttng.org/urcu"
> +BUGTRACKER = "http://lttng.org/project/issues"
> +
> +LICENSE = "LGPLv2.1+ & MIT-style"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
> +
>  file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
> +
>  file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
> +SRC_URI[sha256sum] =
> "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
> +
> +S = "${WORKDIR}/userspace-rcu-${PV}"
> +CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
> +inherit autotools
> +
> +# liburcu, which is only used by lttng-ust, may not build on other
> +# platforms, like MIPS.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--20cf3074d99673168804c5cba6a4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>I recommend changing the liburcu licence as follows,=A0 followin=
g a GPLv3 file addition in the build macros:<br><br><br>LICENSE =3D &quot;L=
GPLv2.1+ &amp; MIT-style &amp; GPLv3&quot;<br>LICENSE_${PN} =3D &quot;LGPLv=
2.1+ &amp; MIT-style&quot;<br>
<br><br>Cheers,<br>Alex<br><br><div class=3D"gmail_quote">On Fri, Jul 27, 2=
012 at 10:30 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:fahad.usman@gmail=
.com" target=3D"_blank">fahad.usman@gmail.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
From: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fahad_usman=
@mentor.com</a>&gt;<br>
<br>
update lttng-modules-2.0, lttng-tools-2.0 lttng-ust-2.0 and liburcu to the<=
br>
latest stable released versions by lttng community<br>
<br>
remove the lttng-sycalls-protect-is_compat_task-from-redefiniti.patch becau=
se<br>
the problem is handled in the latest version of lttng-modules<br>
<br>
Signed-off-by: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fa=
had_usman@mentor.com</a>&gt;<br>
---<br>
=A0...ls-protect-is_compat_task-from-redefiniti.patch | =A0 41 ------------=
--------<br>
=A0.../lttng-2.0/<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank=
">lttng-modules_2.0.4.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 26 +++++++++=
+++<br>
=A0.../lttng-2.0/<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D"_b=
lank">lttng-modules_2.0.pre11.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 30 ---------=
-----<br>
=A0meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0.1.bb" ta=
rget=3D"_blank">lttng-tools_2.0.1.bb</a> | =A0 32 ---------------<br>
=A0meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0.3.bb" ta=
rget=3D"_blank">lttng-tools_2.0.3.bb</a> | =A0 30 ++++++++++++++<br>
=A0meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.2.bb" tar=
get=3D"_blank">lttng2-ust_2.0.2.bb</a> =A0| =A0 30 --------------<br>
=A0meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.4.bb" tar=
get=3D"_blank">lttng2-ust_2.0.4.bb</a> =A0| =A0 30 ++++++++++++++<br>
=A0meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.6.7.bb" target=
=3D"_blank">liburcu_0.6.7.bb</a> =A0 =A0 =A0| =A0 24 -----------<br>
=A0meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.7.3.bb" target=
=3D"_blank">liburcu_0.7.3.bb</a> =A0 =A0 =A0| =A0 24 +++++++++++<br>
=A09 files changed, 110 insertions(+), 157 deletions(-)<br>
=A0delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-syc=
alls-protect-is_compat_task-from-redefiniti.patch<br>
=A0create mode 100644 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng=
-modules_2.0.4.bb" target=3D"_blank">lttng-modules_2.0.4.bb</a><br>
=A0delete mode 100644 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng=
-modules_2.0.pre11.bb" target=3D"_blank">lttng-modules_2.0.pre11.bb</a><br>
=A0delete mode 100644 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng=
-tools_2.0.1.bb" target=3D"_blank">lttng-tools_2.0.1.bb</a><br>
=A0create mode 100644 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng=
-tools_2.0.3.bb" target=3D"_blank">lttng-tools_2.0.3.bb</a><br>
=A0delete mode 100644 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng=
2-ust_2.0.2.bb" target=3D"_blank">lttng2-ust_2.0.2.bb</a><br>
=A0create mode 100644 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng=
2-ust_2.0.4.bb" target=3D"_blank">lttng2-ust_2.0.4.bb</a><br>
=A0delete mode 100644 meta/recipes-support/liburcu/<a href=3D"http://liburc=
u_0.6.7.bb" target=3D"_blank">liburcu_0.6.7.bb</a><br>
=A0create mode 100644 meta/recipes-support/liburcu/<a href=3D"http://liburc=
u_0.7.3.bb" target=3D"_blank">liburcu_0.7.3.bb</a><br>
<br>
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-prot=
ect-is_compat_task-from-redefiniti.patch b/meta/recipes-kernel/lttng-2.0/lt=
tng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch<br>

deleted file mode 100644<br>
index 0056633..0000000<br>
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_=
compat_task-from-redefiniti.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17 00:00:00 2001<br>
-From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">b=
ruce.ashfield@windriver.com</a>&gt;<br>
-Date: Mon, 19 Mar 2012 13:30:31 -0400<br>
-Subject: [PATCH] lttng-sycalls: protect is_compat_task from redefinition<b=
r>
-<br>
-recent -stable kernels have their own fallback definition of is_compat_tas=
k<br>
-<br>
- =A0 #define is_compat_task() (0)<br>
-<br>
-To protect against this double definition of is_compat_task we can check<b=
r>
-to see if it is already defined, and skip the lttng variant.<br>
-<br>
-Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriv=
er.com">bruce.ashfield@windriver.com</a>&gt;<br>
----<br>
- lttng-syscalls.c | =A0 =A04 ++++<br>
- 1 files changed, 4 insertions(+), 0 deletions(-)<br>
-<br>
-diff --git a/lttng-syscalls.c b/lttng-syscalls.c<br>
-index 9de3c07..80d0f05 100644<br>
---- a/lttng-syscalls.c<br>
-+++ b/lttng-syscalls.c<br>
-@@ -17,12 +17,16 @@<br>
- #include &quot;ltt-events.h&quot;<br>
-<br>
- #ifndef CONFIG_COMPAT<br>
-+<br>
-+#ifndef is_compat_task<br>
- static inline int is_compat_task(void)<br>
- {<br>
- =A0 =A0 =A0 return 0;<br>
- }<br>
- #endif<br>
-<br>
-+#endif<br>
-+<br>
- static<br>
- void syscall_entry_probe(void *__data, struct pt_regs *regs, long id);<br=
>
-<br>
---<br>
-1.7.5.4<br>
-<br>
diff --git a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-modules_=
2.0.4.bb" target=3D"_blank">lttng-modules_2.0.4.bb</a> b/meta/recipes-kerne=
l/lttng-2.0/<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank">ltt=
ng-modules_2.0.4.bb</a><br>

new file mode 100644<br>
index 0000000..d40c99b<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-modules_2.0.4.b=
b" target=3D"_blank">lttng-modules_2.0.4.bb</a><br>
@@ -0,0 +1,26 @@<br>
+SECTION =3D &quot;devel&quot;<br>
+SUMMARY =3D &quot;Linux Trace Toolkit KERNEL MODULE&quot;<br>
+DESCRIPTION =3D &quot;The lttng-modules 2.0 package contains the kernel tr=
acer modules&quot;<br>
+LICENSE =3D &quot;LGPLv2.1 &amp; GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1eb086682a7c65a45acd9bcdf6=
877b3e \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://gpl-2.0.txt;md5=3D751419260=
aa954499f7abaabaa882bbe \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://lgpl-2.1.txt;md5=3D243b725d=
71bb5df4a1e5920b344b86ad&quot;<br>
+<br>
+DEPENDS =3D &quot;virtual/kernel&quot;<br>
+<br>
+inherit module<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%=
7BPV%7D.tar.bz2%5C" target=3D"_blank">http://lttng.org/files/${PN}/${PN}-${=
PV}.tar.bz2\</a><br>
+ =A0 =A0 =A0 =A0 =A0 file://lttng-modules-replace-KERNELDIR-with-KERNEL_SR=
C.patch&quot;<br>
+SRC_URI[md5sum] =3D &quot;e2f07c0eb40a0d8027de17f4dd7ebe12&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f00116c388289192774c774581a651832be094aeb6da2=
f2c0f9c9e275fed2d14&quot;<br>
+<br>
+export INSTALL_MOD_DIR=3D&quot;kernel/lttng-modules&quot;<br>
+export KERNEL_SRC=3D&quot;${STAGING_KERNEL_DIR}&quot;<br>
+<br>
+# Due to liburcu not building for MIPS currently this recipe needs to<br>
+# be limited also.<br>
+# So here let us first suppport x86/arm/powerpc platforms now.<br>
+COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
diff --git a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-modules_=
2.0.pre11.bb" target=3D"_blank">lttng-modules_2.0.pre11.bb</a> b/meta/recip=
es-kernel/lttng-2.0/<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D=
"_blank">lttng-modules_2.0.pre11.bb</a><br>

deleted file mode 100644<br>
index 4c78f36..0000000<br>
--- a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-modules_2.0.pre=
11.bb" target=3D"_blank">lttng-modules_2.0.pre11.bb</a><br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-SECTION =3D &quot;devel&quot;<br>
-SUMMARY =3D &quot;Linux Trace Toolkit KERNEL MODULE&quot;<br>
-DESCRIPTION =3D &quot;The lttng-modules 2.0 package contains the kernel tr=
acer modules&quot;<br>
-LICENSE =3D &quot;LGPLv2.1 &amp; GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1eb086682a7c65a45acd9bcdf6=
877b3e \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://gpl-2.0.txt;md5=3D751419260=
aa954499f7abaabaa882bbe \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://lgpl-2.1.txt;md5=3D243b725d=
71bb5df4a1e5920b344b86ad&quot;<br>
-<br>
-DEPENDS =3D &quot;virtual/kernel&quot;<br>
-<br>
-inherit module<br>
-<br>
-SRCREV =3D &quot;4d3e89e379fc66480d729abe8daa5c86eb585400&quot;<br>
-PV =3D &quot;2.0.pre11+git${SRCREV}&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-modules.git;=
protocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-modules.git;protocol=
=3Dgit</a> \<br>
- =A0 =A0 =A0 =A0 =A0 file://lttng-modules-replace-KERNELDIR-with-KERNEL_SR=
C.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://lttng-sycalls-protect-is_compat_task-from-rede=
finiti.patch&quot;<br>
-<br>
-export INSTALL_MOD_DIR=3D&quot;kernel/lttng-modules&quot;<br>
-export KERNEL_SRC=3D&quot;${STAGING_KERNEL_DIR}&quot;<br>
-<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-# Due to liburcu not building for MIPS currently this recipe needs to<br>
-# be limited also.<br>
-# So here let us first suppport x86/arm/powerpc platforms now.<br>
-COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
diff --git a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.=
0.1.bb" target=3D"_blank">lttng-tools_2.0.1.bb</a> b/meta/recipes-kernel/lt=
tng-2.0/<a href=3D"http://lttng-tools_2.0.1.bb" target=3D"_blank">lttng-too=
ls_2.0.1.bb</a><br>

deleted file mode 100644<br>
index e7f1016..0000000<br>
--- a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0.1.bb"=
 target=3D"_blank">lttng-tools_2.0.1.bb</a><br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-SECTION =3D &quot;devel&quot;<br>
-SUMMARY =3D &quot;Linux Trace Toolkit Control&quot;<br>
-DESCRIPTION =3D &quot;The Linux trace toolkit is a suite of tools designed=
 \<br>
-to extract program execution details from the Linux operating system \<br>
-and interpret them.&quot;<br>
-<br>
-LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D61273c2e3f60dd38a74b01beb5=
f51fbd \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://gpl-2.0.txt;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://lgpl-2.1.txt;md5=3D0f0d7150=
0e6a57fd24d825f33242b9ca&quot;<br>
-<br>
-DEPENDS =3D &quot;liburcu popt lttng2-ust&quot;<br>
-<br>
-SRCREV =3D &quot;8c3919ea2dc77fdd47fb1c90e41490a20bb4d478&quot;<br>
-PV =3D &quot;v2.0.1+git${SRCREV}&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-tools.git;pr=
otocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-tools.git;protocol=3Dgi=
t</a>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-inherit autotools<br>
-<br>
-export KERNELDIR=3D&quot;${STAGING_KERNEL_DIR}&quot;<br>
-<br>
-FILES_${PN} +=3D &quot;${libdir}/lttng/libexec/*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/lttng/libexec/.debug&quot;<br>
-<br>
-# Due to liburcu not building for MIPS currently this recipe needs to<br>
-# be limited also.<br>
-# So here let us first suppport x86/arm/powerpc platforms now.<br>
-COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
diff --git a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.=
0.3.bb" target=3D"_blank">lttng-tools_2.0.3.bb</a> b/meta/recipes-kernel/lt=
tng-2.0/<a href=3D"http://lttng-tools_2.0.3.bb" target=3D"_blank">lttng-too=
ls_2.0.3.bb</a><br>

new file mode 100644<br>
index 0000000..ef39b30<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0.3.bb"=
 target=3D"_blank">lttng-tools_2.0.3.bb</a><br>
@@ -0,0 +1,30 @@<br>
+SECTION =3D &quot;devel&quot;<br>
+SUMMARY =3D &quot;Linux Trace Toolkit Control&quot;<br>
+DESCRIPTION =3D &quot;The Linux trace toolkit is a suite of tools designed=
 \<br>
+to extract program execution details from the Linux operating system \<br>
+and interpret them.&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D61273c2e3f60dd38a74b01beb5=
f51fbd \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://gpl-2.0.txt;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://lgpl-2.1.txt;md5=3D0f0d7150=
0e6a57fd24d825f33242b9ca&quot;<br>
+<br>
+DEPENDS =3D &quot;liburcu popt lttng2-ust&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%=
7BPV%7D.tar.bz2" target=3D"_blank">http://lttng.org/files/${PN}/${PN}-${PV}=
.tar.bz2</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;360d0e0e70ed11eda5aa1570ebc9c155&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cc538f420bfe716220169e41b572d0cb8a345afb552fa=
ef924bfb2c625d92b0d&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+export KERNELDIR=3D&quot;${STAGING_KERNEL_DIR}&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${libdir}/lttng/libexec/*&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libdir}/lttng/libexec/.debug&quot;<br>
+<br>
+# Due to liburcu not building for MIPS currently this recipe needs to<br>
+# be limited also.<br>
+# So here let us first suppport x86/arm/powerpc platforms now.<br>
+COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
diff --git a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0=
.2.bb" target=3D"_blank">lttng2-ust_2.0.2.bb</a> b/meta/recipes-kernel/lttn=
g-2.0/<a href=3D"http://lttng2-ust_2.0.2.bb" target=3D"_blank">lttng2-ust_2=
.0.2.bb</a><br>

deleted file mode 100644<br>
index 8f650a4..0000000<br>
--- a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.2.bb" =
target=3D"_blank">lttng2-ust_2.0.2.bb</a><br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-SUMMARY =3D &quot;Linux Trace Toolkit Userspace Tracer 2.0&quot;<br>
-DESCRIPTION =3D &quot;The LTTng UST 2.0 package contains the userspace tra=
cer library to trace userspace codes.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/lttng2.0" target=3D"_blank"=
>http://lttng.org/lttng2.0</a>&quot;<br>
-BUGTRACKER =3D &quot;n/a&quot;<br>
-<br>
-LICENSE =3D &quot;LGPLv2.1+ &amp; BSD &amp; GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc963eb366b781252b0bf0fdf16=
24d9e9 \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://snprintf/snprintf.c;endline=
=3D32;md5=3Dd3d544959d8a3782b2e07451be0a903c \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://snprintf/various.h;endline=
=3D31;md5=3D89f2509b6b4682c4fc95255eec4abe44&quot;<br>
-<br>
-inherit autotools<br>
-<br>
-DEPENDS =3D &quot;liburcu util-linux&quot;<br>
-<br>
-SRCREV =3D &quot;a367ee66aad3ffd21ef64d1b24efc6f862e09562&quot;<br>
-PV =3D &quot;2.0.2+git${SRCPV}&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-ust.git;prot=
ocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-ust.git;protocol=3Dgit</a=
>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-do_configure_prepend () {<br>
- =A0 =A0 =A0 ${S}/bootstrap<br>
-}<br>
-<br>
-# Due to liburcu not building for MIPS currently this recipe needs to<br>
-# be limited also.<br>
-# So here let us first suppport x86/arm/powerpc platforms now.<br>
-COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
diff --git a/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0=
.4.bb" target=3D"_blank">lttng2-ust_2.0.4.bb</a> b/meta/recipes-kernel/lttn=
g-2.0/<a href=3D"http://lttng2-ust_2.0.4.bb" target=3D"_blank">lttng2-ust_2=
.0.4.bb</a><br>

new file mode 100644<br>
index 0000000..a5f8cec<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.4.bb" =
target=3D"_blank">lttng2-ust_2.0.4.bb</a><br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;Linux Trace Toolkit Userspace Tracer 2.0&quot;<br>
+DESCRIPTION =3D &quot;The LTTng UST 2.0 package contains the userspace tra=
cer library to trace userspace codes.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/lttng2.0" target=3D"_blank"=
>http://lttng.org/lttng2.0</a>&quot;<br>
+BUGTRACKER =3D &quot;n/a&quot;<br>
+<br>
+LICENSE =3D &quot;LGPLv2.1+ &amp; BSD &amp; GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc963eb366b781252b0bf0fdf16=
24d9e9 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://snprintf/snprintf.c;endline=
=3D32;md5=3Dd3d544959d8a3782b2e07451be0a903c \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://snprintf/various.h;endline=
=3D31;md5=3D89f2509b6b4682c4fc95255eec4abe44&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+DEPENDS =3D &quot;liburcu util-linux&quot;<br>
+<br>
+SRCREV =3D &quot;f8b934136d431621e3e85457ac2875e8bd9c3387&quot;<br>
+PV =3D &quot;2.0.4+git${SRCPV}&quot;<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-ust.git;prot=
ocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-ust.git;protocol=3Dgit</a=
>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+do_configure_prepend () {<br>
+ =A0 =A0 =A0 ${S}/bootstrap<br>
+}<br>
+<br>
+# Due to liburcu not building for MIPS currently this recipe needs to<br>
+# be limited also.<br>
+# So here let us first suppport x86/arm/powerpc platforms now.<br>
+COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
diff --git a/meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.6.7.b=
b" target=3D"_blank">liburcu_0.6.7.bb</a> b/meta/recipes-support/liburcu/<a=
 href=3D"http://liburcu_0.6.7.bb" target=3D"_blank">liburcu_0.6.7.bb</a><br=
>
deleted file mode 100644<br>
index be73856..0000000<br>
--- a/meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.6.7.bb" targ=
et=3D"_blank">liburcu_0.6.7.bb</a><br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-DESCRIPTION =3D &quot;The userspace read-copy update library by Mathieu De=
snoyers&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/urcu" target=3D"_blank">htt=
p://lttng.org/urcu</a>&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"http://lttng.org/project/issues" target=3D=
"_blank">http://lttng.org/project/issues</a>&quot;<br>
-<br>
-LICENSE =3D &quot;LGPLv2.1+ &amp; MIT-style&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db472dc110d38774921e1d5ccb0=
065fff \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://urcu.h;beginline=3D4;endlin=
e=3D32;md5=3D4de0d68d3a997643715036d2209ae1d9 \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://urcu/uatomic/x86.h;beginlin=
e=3D4;endline=3D21;md5=3D220552f72c55b102f2ee35929734ef42&quot;<br>
-<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/urcu/userspace-rcu-$%7=
BPV%7D.tar.bz2" target=3D"_blank">http://lttng.org/files/urcu/userspace-rcu=
-${PV}.tar.bz2</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;2705dadd65beda8e8960472c082e44b3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c=
745e052b2d87a47e75f&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/userspace-rcu-${PV}&quot;<br>
-CFLAGS_append_libc-uclibc =3D &quot; -D_GNU_SOURCE&quot;<br>
-inherit autotools<br>
-<br>
-# liburcu, which is only used by lttng-ust, may not build on other<br>
-# platforms, like MIPS.<br>
-COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
-<br>
diff --git a/meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.7.3.b=
b" target=3D"_blank">liburcu_0.7.3.bb</a> b/meta/recipes-support/liburcu/<a=
 href=3D"http://liburcu_0.7.3.bb" target=3D"_blank">liburcu_0.7.3.bb</a><br=
>
new file mode 100644<br>
index 0000000..86f29be<br>
--- /dev/null<br>
+++ b/meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.7.3.bb" targ=
et=3D"_blank">liburcu_0.7.3.bb</a><br>
@@ -0,0 +1,24 @@<br>
+DESCRIPTION =3D &quot;The userspace read-copy update library by Mathieu De=
snoyers&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/urcu" target=3D"_blank">htt=
p://lttng.org/urcu</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"http://lttng.org/project/issues" target=3D=
"_blank">http://lttng.org/project/issues</a>&quot;<br>
+<br>
+LICENSE =3D &quot;LGPLv2.1+ &amp; MIT-style&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D95dfea59eeaa41a4057faa07a5=
8f5f89 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://urcu.h;beginline=3D4;endlin=
e=3D32;md5=3D4de0d68d3a997643715036d2209ae1d9 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://urcu/uatomic/x86.h;beginlin=
e=3D4;endline=3D21;md5=3D220552f72c55b102f2ee35929734ef42&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/urcu/userspace-rcu-$%7=
BPV%7D.tar.bz2" target=3D"_blank">http://lttng.org/files/urcu/userspace-rcu=
-${PV}.tar.bz2</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;c40b726f13bff80982c1ffa1bc2db31d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;63f540a5d3c947fa3739711099fb87a66036d3c9560f2=
6da763e500da296a1af&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/userspace-rcu-${PV}&quot;<br>
+CFLAGS_append_libc-uclibc =3D &quot; -D_GNU_SOURCE&quot;<br>
+inherit autotools<br>
+<br>
+# liburcu, which is only used by lttng-ust, may not build on other<br>
+# platforms, like MIPS.<br>
+COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|powerpc.*)-linux&#39;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.1<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--20cf3074d99673168804c5cba6a4--
