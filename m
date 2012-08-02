Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SwrJ8-0002XN-SP
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:03:04 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 01:51:21 -0700
Received: by qabj34 with SMTP id j34so937387qab.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=K6C5ODVWD4KeOJFscicmiA+HFgaNVKt/8lQrP1wPB4g=;
	b=YSfKoJXrpBQN9D25gflyO4Hta4tqkwfsnLYCAgPF7ux1TiLkqmYt2FvGWyIVGuMF+N
	6i0HWAng/PXAwdGlDRtO8mhx7VEWdbKsg3fGyDJpk1APxTLObcO7jYNkOGLo0fXhEP9a
	7VtbTMRB8jfhHTsTBrwSFJteKc/hPbJftnM0mKVe+o+TLcTUNyp91GyKhHOmeizsKVs1
	ansctn7Cm3l1iZJCEvkmb7T9d2WPbxxlBK/R20pqPeW/Lih2WqT5AlRxCWxxGzgFdDjX
	OfHfx8FMkT+LHOup0fvaS5UZ33L8jlHIlCjPzHqlBnNgv01Rb4B56wXjwaZYGv7aWIOm
	w8kw==
MIME-Version: 1.0
Received: by 10.224.184.208 with SMTP id cl16mr40909019qab.39.1343897480383;
	Thu, 02 Aug 2012 01:51:20 -0700 (PDT)
Received: by 10.229.78.130 with HTTP; Thu, 2 Aug 2012 01:51:20 -0700 (PDT)
In-Reply-To: <5012F99B.6050809@linux.intel.com>
References: <1343374256-22697-1-git-send-email-fahad.usman@gmail.com>
	<CAJ2CSBsP1hcG=CJaWPxC2p19JM3YosJT9atyg7wtJTpeq6vvYQ@mail.gmail.com>
	<5012F99B.6050809@linux.intel.com>
Date: Thu, 2 Aug 2012 11:51:20 +0300
Message-ID: <CAJ2CSBtfvSJj_=Mgx5bBSmv1Wbm58Zx=6HRyjFL3FKqv3yJaRA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlegbjIHGRVbZ+/Xn9QvjARjkLiRMgrMxsyz6k94SAOa2uvPX3vBk+4JVVLQ9Q1rgNhywk9
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 Aug 2012 09:03:05 -0000
Content-Type: multipart/alternative; boundary=20cf303b410deece2404c6448300

--20cf303b410deece2404c6448300
Content-Type: text/plain; charset=ISO-8859-1

This page includes a patch for upgrading liburcu, this is why I commented.

Alex

On Fri, Jul 27, 2012 at 11:27 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/27/2012 01:39 AM, Damian, Alexandru wrote:
>
>> Hi,
>>
>> I recommend changing the liburcu licence as follows,  following a GPLv3
>> file addition in the build macros:
>>
>>
>> LICENSE = "LGPLv2.1+ & MIT-style & GPLv3"
>> LICENSE_${PN} = "LGPLv2.1+ & MIT-style"
>>
>>  Alex,
>
> Please what what you are replying to, I am not sure this has anything to
> do with the LTTNG update.
>
> Thanks
>         Sau!
>
>>
>> Cheers,
>> Alex
>>
>> On Fri, Jul 27, 2012 at 10:30 AM, <fahad.usman@gmail.com
>> <mailto:fahad.usman@gmail.com>**> wrote:
>>
>>     From: Fahad Usman <fahad_usman@mentor.com
>>     <mailto:fahad_usman@mentor.com**>>
>>
>>
>>     update lttng-modules-2.0, lttng-tools-2.0 lttng-ust-2.0 and liburcu
>>     to the
>>     latest stable released versions by lttng community
>>
>>     remove the
>>     lttng-sycalls-protect-is_**compat_task-from-redefiniti.**patch
>> because
>>     the problem is handled in the latest version of lttng-modules
>>
>>     Signed-off-by: Fahad Usman <fahad_usman@mentor.com
>>     <mailto:fahad_usman@mentor.com**>>
>>
>>     ---
>>       ...ls-protect-is_compat_task-**from-redefiniti.patch |   41
>>     --------------------
>>       .../lttng-2.0/lttng-modules_2.**0.4.bb<http://lttng-modules_2.0.4.bb>
>>     <http://lttng-modules_2.0.4.bb**>               |   26 ++++++++++++
>>       .../lttng-2.0/lttng-modules_2.**0.pre11.bb<http://lttng-modules_2.0.pre11.bb>
>>     <http://lttng-modules_2.0.**pre11.bb<http://lttng-modules_2.0.pre11.bb>>
>>           |   30 --------------
>>       meta/recipes-kernel/lttng-2.0/**lttng-tools_2.0.1.bb<http://lttng-tools_2.0.1.bb>
>>     <http://lttng-tools_2.0.1.bb> |   32 ---------------
>>       meta/recipes-kernel/lttng-2.0/**lttng-tools_2.0.3.bb<http://lttng-tools_2.0.3.bb>
>>     <http://lttng-tools_2.0.3.bb> |   30 ++++++++++++++
>>       meta/recipes-kernel/lttng-2.0/**lttng2-ust_2.0.2.bb<http://lttng2-ust_2.0.2.bb>
>>     <http://lttng2-ust_2.0.2.bb>  |   30 --------------
>>       meta/recipes-kernel/lttng-2.0/**lttng2-ust_2.0.4.bb<http://lttng2-ust_2.0.4.bb>
>>     <http://lttng2-ust_2.0.4.bb>  |   30 ++++++++++++++
>>       meta/recipes-support/liburcu/l**iburcu_0.6.7.bb<http://liburcu_0.6.7.bb>
>>     <http://liburcu_0.6.7.bb>      |   24 -----------
>>       meta/recipes-support/liburcu/l**iburcu_0.7.3.bb<http://liburcu_0.7.3.bb>
>>     <http://liburcu_0.7.3.bb>      |   24 +++++++++++
>>
>>       9 files changed, 110 insertions(+), 157 deletions(-)
>>       delete mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng-modules/lttng-sycalls-**
>> protect-is_compat_task-from-**redefiniti.patch
>>       create mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng-modules_2.0.4.bb<http://lttng-modules_2.0.4.bb>
>>     <http://lttng-modules_2.0.4.bb**>
>>       delete mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng-modules_2.0.pre11.bb<http://lttng-modules_2.0.pre11.bb>
>>     <http://lttng-modules_2.0.**pre11.bb<http://lttng-modules_2.0.pre11.bb>
>> >
>>       delete mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng-tools_2.0.1.bb<http://lttng-tools_2.0.1.bb>
>>     <http://lttng-tools_2.0.1.bb>
>>       create mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng-tools_2.0.3.bb<http://lttng-tools_2.0.3.bb>
>>     <http://lttng-tools_2.0.3.bb>
>>       delete mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng2-ust_2.0.2.bb<http://lttng2-ust_2.0.2.bb>
>>     <http://lttng2-ust_2.0.2.bb>
>>       create mode 100644
>>     meta/recipes-kernel/lttng-2.0/**lttng2-ust_2.0.4.bb<http://lttng2-ust_2.0.4.bb>
>>     <http://lttng2-ust_2.0.4.bb>
>>       delete mode 100644 meta/recipes-support/liburcu/l**iburcu_0.6.7.bb<http://liburcu_0.6.7.bb>
>>     <http://liburcu_0.6.7.bb>
>>       create mode 100644 meta/recipes-support/liburcu/l**iburcu_0.7.3.bb<http://liburcu_0.7.3.bb>
>>     <http://liburcu_0.7.3.bb>
>>
>>
>>     diff --git
>>     a/meta/recipes-kernel/lttng-2.**0/lttng-modules/lttng-sycalls-**
>> protect-is_compat_task-from-**redefiniti.patch
>>     b/meta/recipes-kernel/lttng-2.**0/lttng-modules/lttng-sycalls-**
>> protect-is_compat_task-from-**redefiniti.patch
>>     deleted file mode 100644
>>     index 0056633..0000000
>>     ---
>>     a/meta/recipes-kernel/lttng-2.**0/lttng-modules/lttng-sycalls-**
>> protect-is_compat_task-from-**redefiniti.patch
>>     +++ /dev/null
>>     @@ -1,41 +0,0 @@
>>     -From 415a1a678cb2fcf603f9777f2c7b71**c1e38f8101 Mon Sep 17 00:00:00
>> 2001
>>     -From: Bruce Ashfield <bruce.ashfield@windriver.com
>>     <mailto:bruce.ashfield@**windriver.com <bruce.ashfield@windriver.com>
>> >>
>>
>>     -Date: Mon, 19 Mar 2012 13:30:31 -0400
>>     -Subject: [PATCH] lttng-sycalls: protect is_compat_task from
>>     redefinition
>>     -
>>     -recent -stable kernels have their own fallback definition of
>>     is_compat_task
>>     -
>>     -   #define is_compat_task() (0)
>>     -
>>     -To protect against this double definition of is_compat_task we can
>>     check
>>     -to see if it is already defined, and skip the lttng variant.
>>     -
>>     -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>>     <mailto:bruce.ashfield@**windriver.com <bruce.ashfield@windriver.com>
>> >>
>>
>>     ----
>>     - lttng-syscalls.c |    4 ++++
>>     - 1 files changed, 4 insertions(+), 0 deletions(-)
>>     -
>>     -diff --git a/lttng-syscalls.c b/lttng-syscalls.c
>>     -index 9de3c07..80d0f05 100644
>>     ---- a/lttng-syscalls.c
>>     -+++ b/lttng-syscalls.c
>>     -@@ -17,12 +17,16 @@
>>     - #include "ltt-events.h"
>>     -
>>     - #ifndef CONFIG_COMPAT
>>     -+
>>     -+#ifndef is_compat_task
>>     - static inline int is_compat_task(void)
>>     - {
>>     -       return 0;
>>     - }
>>     - #endif
>>     -
>>     -+#endif
>>     -+
>>     - static
>>     - void syscall_entry_probe(void *__data, struct pt_regs *regs, long
>> id);
>>     -
>>     ---
>>     -1.7.5.4
>>     -
>>     diff --git a/meta/recipes-kernel/lttng-2.**0/lttng-modules_2.0.4.bb
>>     <http://lttng-modules_2.0.4.bb**>
>>     b/meta/recipes-kernel/lttng-2.**0/lttng-modules_2.0.4.bb
>>     <http://lttng-modules_2.0.4.bb**>
>>
>>     new file mode 100644
>>     index 0000000..d40c99b
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/lttng-2.**0/lttng-modules_2.0.4.bb
>>     <http://lttng-modules_2.0.4.bb**>
>>
>>     @@ -0,0 +1,26 @@
>>     +SECTION = "devel"
>>     +SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
>>     +DESCRIPTION = "The lttng-modules 2.0 package contains the kernel
>>     tracer modules"
>>     +LICENSE = "LGPLv2.1 & GPLv2"
>>     +LIC_FILES_CHKSUM =
>>     "file://LICENSE;md5=**1eb086682a7c65a45acd9bcdf6877b**3e \
>>     +
>>       file://gpl-2.0.txt;md5=**751419260aa954499f7abaabaa882b**be \
>>     +
>>       file://lgpl-2.1.txt;md5=**243b725d71bb5df4a1e5920b344b86**ad"
>>     +
>>     +DEPENDS = "virtual/kernel"
>>     +
>>     +inherit module
>>     +
>>     +PR = "r0"
>>     +
>>     +SRC_URI = "http://lttng.org/files/${PN}/**${PN}-${PV}.tar.bz2\<http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C>
>>     <http://lttng.org/files/$%**7BPN%7D/$%7BPN%7D-$%7BPV%7D.**tar.bz2%5C<http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2%5C>
>> >
>>
>>     +
>>     file://lttng-modules-replace-**KERNELDIR-with-KERNEL_SRC.**patch"
>>     +SRC_URI[md5sum] = "**e2f07c0eb40a0d8027de17f4dd7ebe**12"
>>     +SRC_URI[sha256sum] =
>>     "**f00116c388289192774c774581a651**832be094aeb6da2f2c0f9c9e275fed**
>> 2d14"
>>     +
>>     +export INSTALL_MOD_DIR="kernel/lttng-**modules"
>>     +export KERNEL_SRC="${STAGING_KERNEL_**DIR}"
>>     +
>>     +# Due to liburcu not building for MIPS currently this recipe needs to
>>     +# be limited also.
>>     +# So here let us first suppport x86/arm/powerpc platforms now.
>>     +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     diff --git
>>     a/meta/recipes-kernel/lttng-2.**0/lttng-modules_2.0.pre11.bb
>>     <http://lttng-modules_2.0.**pre11.bb<http://lttng-modules_2.0.pre11.bb>
>> >
>>     b/meta/recipes-kernel/lttng-2.**0/lttng-modules_2.0.pre11.bb
>>     <http://lttng-modules_2.0.**pre11.bb<http://lttng-modules_2.0.pre11.bb>
>> >
>>
>>     deleted file mode 100644
>>     index 4c78f36..0000000
>>     --- a/meta/recipes-kernel/lttng-2.**0/lttng-modules_2.0.pre11.bb
>>     <http://lttng-modules_2.0.**pre11.bb<http://lttng-modules_2.0.pre11.bb>
>> >
>>
>>     +++ /dev/null
>>     @@ -1,30 +0,0 @@
>>     -SECTION = "devel"
>>     -SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
>>     -DESCRIPTION = "The lttng-modules 2.0 package contains the kernel
>>     tracer modules"
>>     -LICENSE = "LGPLv2.1 & GPLv2"
>>     -LIC_FILES_CHKSUM =
>>     "file://LICENSE;md5=**1eb086682a7c65a45acd9bcdf6877b**3e \
>>     -
>>       file://gpl-2.0.txt;md5=**751419260aa954499f7abaabaa882b**be \
>>     -
>>       file://lgpl-2.1.txt;md5=**243b725d71bb5df4a1e5920b344b86**ad"
>>     -
>>     -DEPENDS = "virtual/kernel"
>>     -
>>     -inherit module
>>     -
>>     -SRCREV = "**4d3e89e379fc66480d729abe8daa5c**86eb585400"
>>     -PV = "2.0.pre11+git${SRCREV}"
>>     -PR = "r0"
>>     -
>>     -SRC_URI = "git://git.lttng.org/lttng-**modules.git;protocol=git<http://git.lttng.org/lttng-modules.git;protocol=git>
>>     <http://git.lttng.org/lttng-**modules.git;protocol=git<http://git.lttng.org/lttng-modules.git;protocol=git>>
>> \
>>
>>     -
>>     file://lttng-modules-replace-**KERNELDIR-with-KERNEL_SRC.**patch \
>>     -
>>     file://lttng-sycalls-protect-**is_compat_task-from-**
>> redefiniti.patch"
>>     -
>>     -export INSTALL_MOD_DIR="kernel/lttng-**modules"
>>     -export KERNEL_SRC="${STAGING_KERNEL_**DIR}"
>>     -
>>     -
>>     -S = "${WORKDIR}/git"
>>     -
>>     -# Due to liburcu not building for MIPS currently this recipe needs to
>>     -# be limited also.
>>     -# So here let us first suppport x86/arm/powerpc platforms now.
>>     -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     diff --git a/meta/recipes-kernel/lttng-2.**0/lttng-tools_2.0.1.bb
>>     <http://lttng-tools_2.0.1.bb>
>>     b/meta/recipes-kernel/lttng-2.**0/lttng-tools_2.0.1.bb
>>     <http://lttng-tools_2.0.1.bb>
>>
>>     deleted file mode 100644
>>     index e7f1016..0000000
>>     --- a/meta/recipes-kernel/lttng-2.**0/lttng-tools_2.0.1.bb
>>     <http://lttng-tools_2.0.1.bb>
>>
>>     +++ /dev/null
>>     @@ -1,32 +0,0 @@
>>     -SECTION = "devel"
>>     -SUMMARY = "Linux Trace Toolkit Control"
>>     -DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
>>     -to extract program execution details from the Linux operating system
>> \
>>     -and interpret them."
>>     -
>>     -LICENSE = "GPLv2 & LGPLv2.1"
>>     -LIC_FILES_CHKSUM =
>>     "file://LICENSE;md5=**61273c2e3f60dd38a74b01beb5f51f**bd \
>>     -
>>       file://gpl-2.0.txt;md5=**b234ee4d69f5fce4486a80fdaf4a42**63 \
>>     -
>>       file://lgpl-2.1.txt;md5=**0f0d71500e6a57fd24d825f33242b9**ca"
>>     -
>>     -DEPENDS = "liburcu popt lttng2-ust"
>>     -
>>     -SRCREV = "**8c3919ea2dc77fdd47fb1c90e41490**a20bb4d478"
>>     -PV = "v2.0.1+git${SRCREV}"
>>     -PR = "r0"
>>     -
>>     -SRC_URI = "git://git.lttng.org/lttng-**tools.git;protocol=git<http://git.lttng.org/lttng-tools.git;protocol=git>
>>     <http://git.lttng.org/lttng-**tools.git;protocol=git<http://git.lttng.org/lttng-tools.git;protocol=git>
>> >"
>>
>>     -
>>     -S = "${WORKDIR}/git"
>>     -
>>     -inherit autotools
>>     -
>>     -export KERNELDIR="${STAGING_KERNEL_**DIR}"
>>     -
>>     -FILES_${PN} += "${libdir}/lttng/libexec/*"
>>     -FILES_${PN}-dbg += "${libdir}/lttng/libexec/.**debug"
>>     -
>>     -# Due to liburcu not building for MIPS currently this recipe needs to
>>     -# be limited also.
>>     -# So here let us first suppport x86/arm/powerpc platforms now.
>>     -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     diff --git a/meta/recipes-kernel/lttng-2.**0/lttng-tools_2.0.3.bb
>>     <http://lttng-tools_2.0.3.bb>
>>     b/meta/recipes-kernel/lttng-2.**0/lttng-tools_2.0.3.bb
>>     <http://lttng-tools_2.0.3.bb>
>>
>>     new file mode 100644
>>     index 0000000..ef39b30
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/lttng-2.**0/lttng-tools_2.0.3.bb
>>     <http://lttng-tools_2.0.3.bb>
>>
>>     @@ -0,0 +1,30 @@
>>     +SECTION = "devel"
>>     +SUMMARY = "Linux Trace Toolkit Control"
>>     +DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
>>     +to extract program execution details from the Linux operating system
>> \
>>     +and interpret them."
>>     +
>>     +LICENSE = "GPLv2 & LGPLv2.1"
>>     +LIC_FILES_CHKSUM =
>>     "file://LICENSE;md5=**61273c2e3f60dd38a74b01beb5f51f**bd \
>>     +
>>       file://gpl-2.0.txt;md5=**b234ee4d69f5fce4486a80fdaf4a42**63 \
>>     +
>>       file://lgpl-2.1.txt;md5=**0f0d71500e6a57fd24d825f33242b9**ca"
>>     +
>>     +DEPENDS = "liburcu popt lttng2-ust"
>>     +
>>     +PR = "r0"
>>     +
>>     +SRC_URI = "http://lttng.org/files/${PN}/**${PN}-${PV}.tar.bz2<http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2>
>>     <http://lttng.org/files/$%**7BPN%7D/$%7BPN%7D-$%7BPV%7D.**tar.bz2<http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D.tar.bz2>
>> >"
>>
>>     +SRC_URI[md5sum] = "**360d0e0e70ed11eda5aa1570ebc9c1**55"
>>     +SRC_URI[sha256sum] =
>>     "**cc538f420bfe716220169e41b572d0**cb8a345afb552faef924bfb2c625d9**
>> 2b0d"
>>     +
>>     +inherit autotools
>>     +
>>     +export KERNELDIR="${STAGING_KERNEL_**DIR}"
>>     +
>>     +FILES_${PN} += "${libdir}/lttng/libexec/*"
>>     +FILES_${PN}-dbg += "${libdir}/lttng/libexec/.**debug"
>>     +
>>     +# Due to liburcu not building for MIPS currently this recipe needs to
>>     +# be limited also.
>>     +# So here let us first suppport x86/arm/powerpc platforms now.
>>     +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     diff --git a/meta/recipes-kernel/lttng-2.**0/lttng2-ust_2.0.2.bb
>>     <http://lttng2-ust_2.0.2.bb>
>>     b/meta/recipes-kernel/lttng-2.**0/lttng2-ust_2.0.2.bb
>>     <http://lttng2-ust_2.0.2.bb>
>>
>>     deleted file mode 100644
>>     index 8f650a4..0000000
>>     --- a/meta/recipes-kernel/lttng-2.**0/lttng2-ust_2.0.2.bb
>>     <http://lttng2-ust_2.0.2.bb>
>>
>>     +++ /dev/null
>>     @@ -1,30 +0,0 @@
>>     -SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
>>     -DESCRIPTION = "The LTTng UST 2.0 package contains the userspace
>>     tracer library to trace userspace codes."
>>     -HOMEPAGE = "http://lttng.org/lttng2.0"
>>     -BUGTRACKER = "n/a"
>>     -
>>     -LICENSE = "LGPLv2.1+ & BSD & GPLv2"
>>     -LIC_FILES_CHKSUM =
>>     "file://COPYING;md5=**c963eb366b781252b0bf0fdf1624d9**e9 \
>>     -
>>       file://snprintf/snprintf.c;**endline=32;md5=**
>> d3d544959d8a3782b2e07451be0a90**3c \
>>     -
>>       file://snprintf/various.h;**endline=31;md5=**
>> 89f2509b6b4682c4fc95255eec4abe**44"
>>     -
>>     -inherit autotools
>>     -
>>     -DEPENDS = "liburcu util-linux"
>>     -
>>     -SRCREV = "**a367ee66aad3ffd21ef64d1b24efc6**f862e09562"
>>     -PV = "2.0.2+git${SRCPV}"
>>     -PR = "r0"
>>     -
>>     -SRC_URI = "git://git.lttng.org/lttng-**ust.git;protocol=git<http://git.lttng.org/lttng-ust.git;protocol=git>
>>     <http://git.lttng.org/lttng-**ust.git;protocol=git<http://git.lttng.org/lttng-ust.git;protocol=git>
>> >"
>>
>>     -
>>     -S = "${WORKDIR}/git"
>>     -
>>     -do_configure_prepend () {
>>     -       ${S}/bootstrap
>>     -}
>>     -
>>     -# Due to liburcu not building for MIPS currently this recipe needs to
>>     -# be limited also.
>>     -# So here let us first suppport x86/arm/powerpc platforms now.
>>     -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     diff --git a/meta/recipes-kernel/lttng-2.**0/lttng2-ust_2.0.4.bb
>>     <http://lttng2-ust_2.0.4.bb>
>>     b/meta/recipes-kernel/lttng-2.**0/lttng2-ust_2.0.4.bb
>>     <http://lttng2-ust_2.0.4.bb>
>>
>>     new file mode 100644
>>     index 0000000..a5f8cec
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/lttng-2.**0/lttng2-ust_2.0.4.bb
>>     <http://lttng2-ust_2.0.4.bb>
>>
>>     @@ -0,0 +1,30 @@
>>     +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
>>     +DESCRIPTION = "The LTTng UST 2.0 package contains the userspace
>>     tracer library to trace userspace codes."
>>     +HOMEPAGE = "http://lttng.org/lttng2.0"
>>     +BUGTRACKER = "n/a"
>>     +
>>     +LICENSE = "LGPLv2.1+ & BSD & GPLv2"
>>     +LIC_FILES_CHKSUM =
>>     "file://COPYING;md5=**c963eb366b781252b0bf0fdf1624d9**e9 \
>>     +
>>       file://snprintf/snprintf.c;**endline=32;md5=**
>> d3d544959d8a3782b2e07451be0a90**3c \
>>     +
>>       file://snprintf/various.h;**endline=31;md5=**
>> 89f2509b6b4682c4fc95255eec4abe**44"
>>     +
>>     +inherit autotools
>>     +
>>     +DEPENDS = "liburcu util-linux"
>>     +
>>     +SRCREV = "**f8b934136d431621e3e85457ac2875**e8bd9c3387"
>>     +PV = "2.0.4+git${SRCPV}"
>>     +PR = "r0"
>>     +
>>     +SRC_URI = "git://git.lttng.org/lttng-**ust.git;protocol=git<http://git.lttng.org/lttng-ust.git;protocol=git>
>>     <http://git.lttng.org/lttng-**ust.git;protocol=git<http://git.lttng.org/lttng-ust.git;protocol=git>
>> >"
>>
>>     +
>>     +S = "${WORKDIR}/git"
>>     +
>>     +do_configure_prepend () {
>>     +       ${S}/bootstrap
>>     +}
>>     +
>>     +# Due to liburcu not building for MIPS currently this recipe needs to
>>     +# be limited also.
>>     +# So here let us first suppport x86/arm/powerpc platforms now.
>>     +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     diff --git a/meta/recipes-support/**liburcu/liburcu_0.6.7.bb
>>     <http://liburcu_0.6.7.bb>
>>     b/meta/recipes-support/**liburcu/liburcu_0.6.7.bb
>>     <http://liburcu_0.6.7.bb>
>>
>>     deleted file mode 100644
>>     index be73856..0000000
>>     --- a/meta/recipes-support/**liburcu/liburcu_0.6.7.bb
>>     <http://liburcu_0.6.7.bb>
>>
>>     +++ /dev/null
>>     @@ -1,24 +0,0 @@
>>     -DESCRIPTION = "The userspace read-copy update library by Mathieu
>>     Desnoyers"
>>     -HOMEPAGE = "http://lttng.org/urcu"
>>     -BUGTRACKER = "http://lttng.org/project/**issues<http://lttng.org/project/issues>
>> "
>>     -
>>     -LICENSE = "LGPLv2.1+ & MIT-style"
>>     -LIC_FILES_CHKSUM =
>>     "file://LICENSE;md5=**b472dc110d38774921e1d5ccb0065f**ff \
>>     -
>>       file://urcu.h;beginline=4;**endline=32;md5=**
>> 4de0d68d3a997643715036d2209ae1**d9 \
>>     -
>>       file://urcu/uatomic/x86.h;**beginline=4;endline=21;md5=**
>> 220552f72c55b102f2ee35929734ef**42"
>>     -
>>     -PR = "r0"
>>     -
>>     -SRC_URI = "http://lttng.org/files/urcu/**userspace-rcu-${PV}.tar.bz2<http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>
>>     <http://lttng.org/files/urcu/**userspace-rcu-$%7BPV%7D.tar.**bz2<http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>
>> >"
>>
>>     -
>>     -SRC_URI[md5sum] = "**2705dadd65beda8e8960472c082e44**b3"
>>     -SRC_URI[sha256sum] =
>>     "**b0b09aead6fbcb4d5efb4270e12f84**ffd115b99b55b2c745e052b2d87a47**
>> e75f"
>>     -
>>     -S = "${WORKDIR}/userspace-rcu-${**PV}"
>>     -CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>>     -inherit autotools
>>     -
>>     -# liburcu, which is only used by lttng-ust, may not build on other
>>     -# platforms, like MIPS.
>>     -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     -
>>     diff --git a/meta/recipes-support/**liburcu/liburcu_0.7.3.bb
>>     <http://liburcu_0.7.3.bb>
>>     b/meta/recipes-support/**liburcu/liburcu_0.7.3.bb
>>     <http://liburcu_0.7.3.bb>
>>
>>     new file mode 100644
>>     index 0000000..86f29be
>>     --- /dev/null
>>     +++ b/meta/recipes-support/**liburcu/liburcu_0.7.3.bb
>>     <http://liburcu_0.7.3.bb>
>>
>>     @@ -0,0 +1,24 @@
>>     +DESCRIPTION = "The userspace read-copy update library by Mathieu
>>     Desnoyers"
>>     +HOMEPAGE = "http://lttng.org/urcu"
>>     +BUGTRACKER = "http://lttng.org/project/**issues<http://lttng.org/project/issues>
>> "
>>     +
>>     +LICENSE = "LGPLv2.1+ & MIT-style"
>>     +LIC_FILES_CHKSUM =
>>     "file://LICENSE;md5=**95dfea59eeaa41a4057faa07a58f5f**89 \
>>     +
>>       file://urcu.h;beginline=4;**endline=32;md5=**
>> 4de0d68d3a997643715036d2209ae1**d9 \
>>     +
>>       file://urcu/uatomic/x86.h;**beginline=4;endline=21;md5=**
>> 220552f72c55b102f2ee35929734ef**42"
>>     +
>>     +PR = "r0"
>>     +
>>     +SRC_URI = "http://lttng.org/files/urcu/**userspace-rcu-${PV}.tar.bz2<http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>
>>     <http://lttng.org/files/urcu/**userspace-rcu-$%7BPV%7D.tar.**bz2<http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.tar.bz2>
>> >"
>>
>>     +
>>     +SRC_URI[md5sum] = "**c40b726f13bff80982c1ffa1bc2db3**1d"
>>     +SRC_URI[sha256sum] =
>>     "**63f540a5d3c947fa3739711099fb87**a66036d3c9560f26da763e500da296**
>> a1af"
>>     +
>>     +S = "${WORKDIR}/userspace-rcu-${**PV}"
>>     +CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>>     +inherit autotools
>>     +
>>     +# liburcu, which is only used by lttng-ust, may not build on other
>>     +# platforms, like MIPS.
>>     +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|**powerpc.*)-linux'
>>     +
>>     --
>>     1.7.1
>>
>>
>>     ______________________________**_________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>>     <mailto:Openembedded-core@**lists.openembedded.org<Openembedded-core@lists.openembedded.org>
>> >
>>     http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>
>>
>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>

--20cf303b410deece2404c6448300
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This page includes a patch for upgrading liburcu, this is why I commented.<=
br><br>Alex<br><br><div class=3D"gmail_quote">On Fri, Jul 27, 2012 at 11:27=
 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com"=
 target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 07/27/2012 01:39 AM, Da=
mian, Alexandru wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
I recommend changing the liburcu licence as follows, =A0following a GPLv3<b=
r>
file addition in the build macros:<br>
<br>
<br>
LICENSE =3D &quot;LGPLv2.1+ &amp; MIT-style &amp; GPLv3&quot;<br>
LICENSE_${PN} =3D &quot;LGPLv2.1+ &amp; MIT-style&quot;<br>
<br>
</blockquote></div>
Alex,<br>
<br>
Please what what you are replying to, I am not sure this has anything to do=
 with the LTTNG update.<br>
<br>
Thanks<br>
=A0 =A0 =A0 =A0 Sau!<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
Cheers,<br>
Alex<br>
<br>
On Fri, Jul 27, 2012 at 10:30 AM, &lt;<a href=3D"mailto:fahad.usman@gmail.c=
om" target=3D"_blank">fahad.usman@gmail.com</a><br></div><div class=3D"im">
&lt;mailto:<a href=3D"mailto:fahad.usman@gmail.com" target=3D"_blank">fahad=
.usman@gmail.com</a>&gt;<u></u>&gt; wrote:<br>
<br>
=A0 =A0 From: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com" tar=
get=3D"_blank">fahad_usman@mentor.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:fahad_usman@mentor.com" target=3D"_bla=
nk">fahad_usman@mentor.com</a><u></u>&gt;&gt;<div class=3D"im"><br>
<br>
=A0 =A0 update lttng-modules-2.0, lttng-tools-2.0 lttng-ust-2.0 and liburcu=
<br>
=A0 =A0 to the<br>
=A0 =A0 latest stable released versions by lttng community<br>
<br>
=A0 =A0 remove the<br>
=A0 =A0 lttng-sycalls-protect-is_<u></u>compat_task-from-redefiniti.<u></u>=
patch because<br>
=A0 =A0 the problem is handled in the latest version of lttng-modules<br>
<br>
=A0 =A0 Signed-off-by: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor=
.com" target=3D"_blank">fahad_usman@mentor.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:fahad_usman@mentor.com" target=3D"_bla=
nk">fahad_usman@mentor.com</a><u></u>&gt;&gt;<div class=3D"im"><br>
=A0 =A0 ---<br>
=A0 =A0 =A0 ...ls-protect-is_compat_task-<u></u>from-redefiniti.patch | =A0=
 41<br>
=A0 =A0 --------------------<br>
=A0 =A0 =A0 .../lttng-2.0/<a href=3D"http://lttng-modules_2.0.4.bb" target=
=3D"_blank">lttng-modules_2.<u></u>0.4.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank">htt=
p://lttng-modules_2.0.4.bb</a><u></u>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 26 ++++++++++++<br>
=A0 =A0 =A0 .../lttng-2.0/<a href=3D"http://lttng-modules_2.0.pre11.bb" tar=
get=3D"_blank">lttng-modules_2.<u></u>0.pre11.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D"_blank"=
>http://lttng-modules_2.0.<u></u>pre11.bb</a>&gt; =A0 =A0 =A0 =A0 =A0 | =A0=
 30 --------------<br>
=A0 =A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0=
.1.bb" target=3D"_blank"><u></u>lttng-tools_2.0.1.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.1.bb" target=3D"_blank">http:=
//lttng-tools_2.0.1.bb</a>&gt; | =A0 32 ---------------<br>
=A0 =A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0=
.3.bb" target=3D"_blank"><u></u>lttng-tools_2.0.3.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.3.bb" target=3D"_blank">http:=
//lttng-tools_2.0.3.bb</a>&gt; | =A0 30 ++++++++++++++<br>
=A0 =A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.=
2.bb" target=3D"_blank"><u></u>lttng2-ust_2.0.2.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.2.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.2.bb</a>&gt; =A0| =A0 30 --------------<br>
=A0 =A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.=
4.bb" target=3D"_blank"><u></u>lttng2-ust_2.0.4.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.4.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.4.bb</a>&gt; =A0| =A0 30 ++++++++++++++<br>
=A0 =A0 =A0 meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.6.7.bb=
" target=3D"_blank">l<u></u>iburcu_0.6.7.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.6.7.bb" target=3D"_blank">http://li=
burcu_0.6.7.bb</a>&gt; =A0 =A0 =A0| =A0 24 -----------<br>
=A0 =A0 =A0 meta/recipes-support/liburcu/<a href=3D"http://liburcu_0.7.3.bb=
" target=3D"_blank">l<u></u>iburcu_0.7.3.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.7.3.bb" target=3D"_blank">http://li=
burcu_0.7.3.bb</a>&gt; =A0 =A0 =A0| =A0 24 +++++++++++<div class=3D"im"><br=
>
=A0 =A0 =A0 9 files changed, 110 insertions(+), 157 deletions(-)<br>
=A0 =A0 =A0 delete mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<u></u>lttng-modules/lttng-sycalls-<u=
></u>protect-is_compat_task-from-<u></u>redefiniti.patch<br>
=A0 =A0 =A0 create mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-modules_2.0.4=
.bb" target=3D"_blank"><u></u>lttng-modules_2.0.4.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank">htt=
p://lttng-modules_2.0.4.bb</a><u></u>&gt;<br>
=A0 =A0 =A0 delete mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-modules_2.0.p=
re11.bb" target=3D"_blank"><u></u>lttng-modules_2.0.pre11.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D"_blank"=
>http://lttng-modules_2.0.<u></u>pre11.bb</a>&gt;<br>
=A0 =A0 =A0 delete mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0.1.b=
b" target=3D"_blank"><u></u>lttng-tools_2.0.1.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.1.bb" target=3D"_blank">http:=
//lttng-tools_2.0.1.bb</a>&gt;<br>
=A0 =A0 =A0 create mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng-tools_2.0.3.b=
b" target=3D"_blank"><u></u>lttng-tools_2.0.3.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.3.bb" target=3D"_blank">http:=
//lttng-tools_2.0.3.bb</a>&gt;<br>
=A0 =A0 =A0 delete mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.2.bb=
" target=3D"_blank"><u></u>lttng2-ust_2.0.2.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.2.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.2.bb</a>&gt;<br>
=A0 =A0 =A0 create mode 100644<br>
=A0 =A0 meta/recipes-kernel/lttng-2.0/<a href=3D"http://lttng2-ust_2.0.4.bb=
" target=3D"_blank"><u></u>lttng2-ust_2.0.4.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.4.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.4.bb</a>&gt;<br>
=A0 =A0 =A0 delete mode 100644 meta/recipes-support/liburcu/<a href=3D"http=
://liburcu_0.6.7.bb" target=3D"_blank">l<u></u>iburcu_0.6.7.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.6.7.bb" target=3D"_blank">http://li=
burcu_0.6.7.bb</a>&gt;<br>
=A0 =A0 =A0 create mode 100644 meta/recipes-support/liburcu/<a href=3D"http=
://liburcu_0.7.3.bb" target=3D"_blank">l<u></u>iburcu_0.7.3.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.7.3.bb" target=3D"_blank">http://li=
burcu_0.7.3.bb</a>&gt;<div class=3D"im"><br>
<br>
=A0 =A0 diff --git<br>
=A0 =A0 a/meta/recipes-kernel/lttng-2.<u></u>0/lttng-modules/lttng-sycalls-=
<u></u>protect-is_compat_task-from-<u></u>redefiniti.patch<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/lttng-modules/lttng-sycalls-=
<u></u>protect-is_compat_task-from-<u></u>redefiniti.patch<br>
=A0 =A0 deleted file mode 100644<br>
=A0 =A0 index 0056633..0000000<br>
=A0 =A0 ---<br>
=A0 =A0 a/meta/recipes-kernel/lttng-2.<u></u>0/lttng-modules/lttng-sycalls-=
<u></u>protect-is_compat_task-from-<u></u>redefiniti.patch<br>
=A0 =A0 +++ /dev/null<br>
=A0 =A0 @@ -1,41 +0,0 @@<br>
=A0 =A0 -From 415a1a678cb2fcf603f9777f2c7b71<u></u>c1e38f8101 Mon Sep 17 00=
:00:00 2001<br>
=A0 =A0 -From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com" target=3D"_blank">bruce.ashfield@windriver.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=
=3D"_blank">bruce.ashfield@<u></u>windriver.com</a>&gt;&gt;<div class=3D"im=
"><br>
=A0 =A0 -Date: Mon, 19 Mar 2012 13:30:31 -0400<br>
=A0 =A0 -Subject: [PATCH] lttng-sycalls: protect is_compat_task from<br>
=A0 =A0 redefinition<br>
=A0 =A0 -<br>
=A0 =A0 -recent -stable kernels have their own fallback definition of<br>
=A0 =A0 is_compat_task<br>
=A0 =A0 -<br>
=A0 =A0 - =A0 #define is_compat_task() (0)<br>
=A0 =A0 -<br>
=A0 =A0 -To protect against this double definition of is_compat_task we can=
<br>
=A0 =A0 check<br>
=A0 =A0 -to see if it is already defined, and skip the lttng variant.<br>
=A0 =A0 -<br>
=A0 =A0 -Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a><br></div=
>
=A0 =A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=
=3D"_blank">bruce.ashfield@<u></u>windriver.com</a>&gt;&gt;<div><div class=
=3D"h5"><br>
=A0 =A0 ----<br>
=A0 =A0 - lttng-syscalls.c | =A0 =A04 ++++<br>
=A0 =A0 - 1 files changed, 4 insertions(+), 0 deletions(-)<br>
=A0 =A0 -<br>
=A0 =A0 -diff --git a/lttng-syscalls.c b/lttng-syscalls.c<br>
=A0 =A0 -index 9de3c07..80d0f05 100644<br>
=A0 =A0 ---- a/lttng-syscalls.c<br>
=A0 =A0 -+++ b/lttng-syscalls.c<br>
=A0 =A0 -@@ -17,12 +17,16 @@<br>
=A0 =A0 - #include &quot;ltt-events.h&quot;<br>
=A0 =A0 -<br>
=A0 =A0 - #ifndef CONFIG_COMPAT<br>
=A0 =A0 -+<br>
=A0 =A0 -+#ifndef is_compat_task<br>
=A0 =A0 - static inline int is_compat_task(void)<br>
=A0 =A0 - {<br>
=A0 =A0 - =A0 =A0 =A0 return 0;<br>
=A0 =A0 - }<br>
=A0 =A0 - #endif<br>
=A0 =A0 -<br>
=A0 =A0 -+#endif<br>
=A0 =A0 -+<br>
=A0 =A0 - static<br>
=A0 =A0 - void syscall_entry_probe(void *__data, struct pt_regs *regs, long=
 id);<br>
=A0 =A0 -<br>
=A0 =A0 ---<br>
=A0 =A0 -1.7.5.4<br>
=A0 =A0 -<br>
=A0 =A0 diff --git a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http:/=
/lttng-modules_2.0.4.bb" target=3D"_blank">lttng-modules_2.0.4.bb</a><br></=
div></div>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank">htt=
p://lttng-modules_2.0.4.bb</a><u></u>&gt;<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-modu=
les_2.0.4.bb" target=3D"_blank">lttng-modules_2.0.4.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank">htt=
p://lttng-modules_2.0.4.bb</a><u></u>&gt;<div class=3D"im"><br>
=A0 =A0 new file mode 100644<br>
=A0 =A0 index 0000000..d40c99b<br>
=A0 =A0 --- /dev/null<br>
=A0 =A0 +++ b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-=
modules_2.0.4.bb" target=3D"_blank">lttng-modules_2.0.4.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.4.bb" target=3D"_blank">htt=
p://lttng-modules_2.0.4.bb</a><u></u>&gt;<div class=3D"im"><br>
=A0 =A0 @@ -0,0 +1,26 @@<br>
=A0 =A0 +SECTION =3D &quot;devel&quot;<br>
=A0 =A0 +SUMMARY =3D &quot;Linux Trace Toolkit KERNEL MODULE&quot;<br>
=A0 =A0 +DESCRIPTION =3D &quot;The lttng-modules 2.0 package contains the k=
ernel<br>
=A0 =A0 tracer modules&quot;<br>
=A0 =A0 +LICENSE =3D &quot;LGPLv2.1 &amp; GPLv2&quot;<br>
=A0 =A0 +LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://LICENSE;md5=3D<u></u>1eb086682a7c65a45acd9bcdf6877b<u>=
</u>3e \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://gpl-2.0.txt;md5=3D<u></u>751419260aa954499f7abaabaa882b<=
u></u>be \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://lgpl-2.1.txt;md5=3D<u></u>243b725d71bb5df4a1e5920b344b86=
<u></u>ad&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +DEPENDS =3D &quot;virtual/kernel&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +inherit module<br>
=A0 =A0 +<br>
=A0 =A0 +PR =3D &quot;r0&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/$%7BPN%7D/$%7B=
PN%7D-$%7BPV%7D.tar.bz2%5C" target=3D"_blank">http://lttng.org/files/${PN}/=
<u></u>${PN}-${PV}.tar.bz2\</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D=
.tar.bz2%5C" target=3D"_blank">http://lttng.org/files/$%<u></u>7BPN%7D/$%7B=
PN%7D-$%7BPV%7D.<u></u>tar.bz2%5C</a>&gt;<div class=3D"im"><br>
=A0 =A0 +<br>
=A0 =A0 file://lttng-modules-replace-<u></u>KERNELDIR-with-KERNEL_SRC.<u></=
u>patch&quot;<br>
=A0 =A0 +SRC_URI[md5sum] =3D &quot;<u></u>e2f07c0eb40a0d8027de17f4dd7ebe<u>=
</u>12&quot;<br>
=A0 =A0 +SRC_URI[sha256sum] =3D<br>
=A0 =A0 &quot;<u></u>f00116c388289192774c774581a651<u></u>832be094aeb6da2f2=
c0f9c9e275fed<u></u>2d14&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +export INSTALL_MOD_DIR=3D&quot;kernel/lttng-<u></u>modules&quot;<b=
r>
=A0 =A0 +export KERNEL_SRC=3D&quot;${STAGING_KERNEL_<u></u>DIR}&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +# Due to liburcu not building for MIPS currently this recipe needs=
 to<br>
=A0 =A0 +# be limited also.<br>
=A0 =A0 +# So here let us first suppport x86/arm/powerpc platforms now.<br>
=A0 =A0 +COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 diff --git<br>
=A0 =A0 a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-modu=
les_2.0.pre11.bb" target=3D"_blank">lttng-modules_2.0.pre11.bb</a><br></div=
>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D"_blank"=
>http://lttng-modules_2.0.<u></u>pre11.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-modu=
les_2.0.pre11.bb" target=3D"_blank">lttng-modules_2.0.pre11.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D"_blank"=
>http://lttng-modules_2.0.<u></u>pre11.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 deleted file mode 100644<br>
=A0 =A0 index 4c78f36..0000000<br>
=A0 =A0 --- a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-=
modules_2.0.pre11.bb" target=3D"_blank">lttng-modules_2.0.pre11.bb</a><br><=
/div>
=A0 =A0 &lt;<a href=3D"http://lttng-modules_2.0.pre11.bb" target=3D"_blank"=
>http://lttng-modules_2.0.<u></u>pre11.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 +++ /dev/null<br>
=A0 =A0 @@ -1,30 +0,0 @@<br>
=A0 =A0 -SECTION =3D &quot;devel&quot;<br>
=A0 =A0 -SUMMARY =3D &quot;Linux Trace Toolkit KERNEL MODULE&quot;<br>
=A0 =A0 -DESCRIPTION =3D &quot;The lttng-modules 2.0 package contains the k=
ernel<br>
=A0 =A0 tracer modules&quot;<br>
=A0 =A0 -LICENSE =3D &quot;LGPLv2.1 &amp; GPLv2&quot;<br>
=A0 =A0 -LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://LICENSE;md5=3D<u></u>1eb086682a7c65a45acd9bcdf6877b<u>=
</u>3e \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://gpl-2.0.txt;md5=3D<u></u>751419260aa954499f7abaabaa882b<=
u></u>be \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://lgpl-2.1.txt;md5=3D<u></u>243b725d71bb5df4a1e5920b344b86=
<u></u>ad&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -DEPENDS =3D &quot;virtual/kernel&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -inherit module<br>
=A0 =A0 -<br>
=A0 =A0 -SRCREV =3D &quot;<u></u>4d3e89e379fc66480d729abe8daa5c<u></u>86eb5=
85400&quot;<br>
=A0 =A0 -PV =3D &quot;2.0.pre11+git${SRCREV}&quot;<br>
=A0 =A0 -PR =3D &quot;r0&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-modu=
les.git;protocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-<u></u>module=
s.git;protocol=3Dgit</a><br></div>
=A0 =A0 &lt;<a href=3D"http://git.lttng.org/lttng-modules.git;protocol=3Dgi=
t" target=3D"_blank">http://git.lttng.org/lttng-<u></u>modules.git;protocol=
=3Dgit</a>&gt; \<div class=3D"im"><br>
=A0 =A0 -<br>
=A0 =A0 file://lttng-modules-replace-<u></u>KERNELDIR-with-KERNEL_SRC.<u></=
u>patch \<br>
=A0 =A0 -<br>
=A0 =A0 file://lttng-sycalls-protect-<u></u>is_compat_task-from-<u></u>rede=
finiti.patch&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -export INSTALL_MOD_DIR=3D&quot;kernel/lttng-<u></u>modules&quot;<b=
r>
=A0 =A0 -export KERNEL_SRC=3D&quot;${STAGING_KERNEL_<u></u>DIR}&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -<br>
=A0 =A0 -S =3D &quot;${WORKDIR}/git&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -# Due to liburcu not building for MIPS currently this recipe needs=
 to<br>
=A0 =A0 -# be limited also.<br>
=A0 =A0 -# So here let us first suppport x86/arm/powerpc platforms now.<br>
=A0 =A0 -COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 diff --git a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http:/=
/lttng-tools_2.0.1.bb" target=3D"_blank">lttng-tools_2.0.1.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.1.bb" target=3D"_blank">http:=
//lttng-tools_2.0.1.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-tool=
s_2.0.1.bb" target=3D"_blank">lttng-tools_2.0.1.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.1.bb" target=3D"_blank">http:=
//lttng-tools_2.0.1.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 deleted file mode 100644<br>
=A0 =A0 index e7f1016..0000000<br>
=A0 =A0 --- a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-=
tools_2.0.1.bb" target=3D"_blank">lttng-tools_2.0.1.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.1.bb" target=3D"_blank">http:=
//lttng-tools_2.0.1.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 +++ /dev/null<br>
=A0 =A0 @@ -1,32 +0,0 @@<br>
=A0 =A0 -SECTION =3D &quot;devel&quot;<br>
=A0 =A0 -SUMMARY =3D &quot;Linux Trace Toolkit Control&quot;<br>
=A0 =A0 -DESCRIPTION =3D &quot;The Linux trace toolkit is a suite of tools =
designed \<br>
=A0 =A0 -to extract program execution details from the Linux operating syst=
em \<br>
=A0 =A0 -and interpret them.&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=A0 =A0 -LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://LICENSE;md5=3D<u></u>61273c2e3f60dd38a74b01beb5f51f<u>=
</u>bd \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://gpl-2.0.txt;md5=3D<u></u>b234ee4d69f5fce4486a80fdaf4a42<=
u></u>63 \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://lgpl-2.1.txt;md5=3D<u></u>0f0d71500e6a57fd24d825f33242b9=
<u></u>ca&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -DEPENDS =3D &quot;liburcu popt lttng2-ust&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRCREV =3D &quot;<u></u>8c3919ea2dc77fdd47fb1c90e41490<u></u>a20bb=
4d478&quot;<br>
=A0 =A0 -PV =3D &quot;v2.0.1+git${SRCREV}&quot;<br>
=A0 =A0 -PR =3D &quot;r0&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-tool=
s.git;protocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-<u></u>tools.gi=
t;protocol=3Dgit</a><br></div>
=A0 =A0 &lt;<a href=3D"http://git.lttng.org/lttng-tools.git;protocol=3Dgit"=
 target=3D"_blank">http://git.lttng.org/lttng-<u></u>tools.git;protocol=3Dg=
it</a>&gt;&quot;<div class=3D"im"><br>
=A0 =A0 -<br>
=A0 =A0 -S =3D &quot;${WORKDIR}/git&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -inherit autotools<br>
=A0 =A0 -<br>
=A0 =A0 -export KERNELDIR=3D&quot;${STAGING_KERNEL_<u></u>DIR}&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -FILES_${PN} +=3D &quot;${libdir}/lttng/libexec/*&quot;<br>
=A0 =A0 -FILES_${PN}-dbg +=3D &quot;${libdir}/lttng/libexec/.<u></u>debug&q=
uot;<br>
=A0 =A0 -<br>
=A0 =A0 -# Due to liburcu not building for MIPS currently this recipe needs=
 to<br>
=A0 =A0 -# be limited also.<br>
=A0 =A0 -# So here let us first suppport x86/arm/powerpc platforms now.<br>
=A0 =A0 -COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 diff --git a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http:/=
/lttng-tools_2.0.3.bb" target=3D"_blank">lttng-tools_2.0.3.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.3.bb" target=3D"_blank">http:=
//lttng-tools_2.0.3.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-tool=
s_2.0.3.bb" target=3D"_blank">lttng-tools_2.0.3.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.3.bb" target=3D"_blank">http:=
//lttng-tools_2.0.3.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 new file mode 100644<br>
=A0 =A0 index 0000000..ef39b30<br>
=A0 =A0 --- /dev/null<br>
=A0 =A0 +++ b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng-=
tools_2.0.3.bb" target=3D"_blank">lttng-tools_2.0.3.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng-tools_2.0.3.bb" target=3D"_blank">http:=
//lttng-tools_2.0.3.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 @@ -0,0 +1,30 @@<br>
=A0 =A0 +SECTION =3D &quot;devel&quot;<br>
=A0 =A0 +SUMMARY =3D &quot;Linux Trace Toolkit Control&quot;<br>
=A0 =A0 +DESCRIPTION =3D &quot;The Linux trace toolkit is a suite of tools =
designed \<br>
=A0 =A0 +to extract program execution details from the Linux operating syst=
em \<br>
=A0 =A0 +and interpret them.&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=A0 =A0 +LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://LICENSE;md5=3D<u></u>61273c2e3f60dd38a74b01beb5f51f<u>=
</u>bd \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://gpl-2.0.txt;md5=3D<u></u>b234ee4d69f5fce4486a80fdaf4a42<=
u></u>63 \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://lgpl-2.1.txt;md5=3D<u></u>0f0d71500e6a57fd24d825f33242b9=
<u></u>ca&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +DEPENDS =3D &quot;liburcu popt lttng2-ust&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +PR =3D &quot;r0&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/$%7BPN%7D/$%7B=
PN%7D-$%7BPV%7D.tar.bz2" target=3D"_blank">http://lttng.org/files/${PN}/<u>=
</u>${PN}-${PV}.tar.bz2</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng.org/files/$%7BPN%7D/$%7BPN%7D-$%7BPV%7D=
.tar.bz2" target=3D"_blank">http://lttng.org/files/$%<u></u>7BPN%7D/$%7BPN%=
7D-$%7BPV%7D.<u></u>tar.bz2</a>&gt;&quot;<div class=3D"im"><br>
=A0 =A0 +SRC_URI[md5sum] =3D &quot;<u></u>360d0e0e70ed11eda5aa1570ebc9c1<u>=
</u>55&quot;<br>
=A0 =A0 +SRC_URI[sha256sum] =3D<br>
=A0 =A0 &quot;<u></u>cc538f420bfe716220169e41b572d0<u></u>cb8a345afb552faef=
924bfb2c625d9<u></u>2b0d&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +inherit autotools<br>
=A0 =A0 +<br>
=A0 =A0 +export KERNELDIR=3D&quot;${STAGING_KERNEL_<u></u>DIR}&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +FILES_${PN} +=3D &quot;${libdir}/lttng/libexec/*&quot;<br>
=A0 =A0 +FILES_${PN}-dbg +=3D &quot;${libdir}/lttng/libexec/.<u></u>debug&q=
uot;<br>
=A0 =A0 +<br>
=A0 =A0 +# Due to liburcu not building for MIPS currently this recipe needs=
 to<br>
=A0 =A0 +# be limited also.<br>
=A0 =A0 +# So here let us first suppport x86/arm/powerpc platforms now.<br>
=A0 =A0 +COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 diff --git a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http:/=
/lttng2-ust_2.0.2.bb" target=3D"_blank">lttng2-ust_2.0.2.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.2.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.2.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng2-ust=
_2.0.2.bb" target=3D"_blank">lttng2-ust_2.0.2.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.2.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.2.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 deleted file mode 100644<br>
=A0 =A0 index 8f650a4..0000000<br>
=A0 =A0 --- a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng2=
-ust_2.0.2.bb" target=3D"_blank">lttng2-ust_2.0.2.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.2.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.2.bb</a>&gt;<div><div class=3D"h5"><br>
=A0 =A0 +++ /dev/null<br>
=A0 =A0 @@ -1,30 +0,0 @@<br>
=A0 =A0 -SUMMARY =3D &quot;Linux Trace Toolkit Userspace Tracer 2.0&quot;<b=
r>
=A0 =A0 -DESCRIPTION =3D &quot;The LTTng UST 2.0 package contains the users=
pace<br>
=A0 =A0 tracer library to trace userspace codes.&quot;<br>
=A0 =A0 -HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/lttng2.0" target=3D=
"_blank">http://lttng.org/lttng2.0</a>&quot;<br>
=A0 =A0 -BUGTRACKER =3D &quot;n/a&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -LICENSE =3D &quot;LGPLv2.1+ &amp; BSD &amp; GPLv2&quot;<br>
=A0 =A0 -LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://COPYING;md5=3D<u></u>c963eb366b781252b0bf0fdf1624d9<u>=
</u>e9 \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://snprintf/snprintf.c;<u></u>endline=3D32;md5=3D<u></u>d3d=
544959d8a3782b2e07451be0a90<u></u>3c \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://snprintf/various.h;<u></u>endline=3D31;md5=3D<u></u>89f2=
509b6b4682c4fc95255eec4abe<u></u>44&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -inherit autotools<br>
=A0 =A0 -<br>
=A0 =A0 -DEPENDS =3D &quot;liburcu util-linux&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRCREV =3D &quot;<u></u>a367ee66aad3ffd21ef64d1b24efc6<u></u>f862e=
09562&quot;<br>
=A0 =A0 -PV =3D &quot;2.0.2+git${SRCPV}&quot;<br>
=A0 =A0 -PR =3D &quot;r0&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-ust.=
git;protocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-<u></u>ust.git;pr=
otocol=3Dgit</a><br></div></div>
=A0 =A0 &lt;<a href=3D"http://git.lttng.org/lttng-ust.git;protocol=3Dgit" t=
arget=3D"_blank">http://git.lttng.org/lttng-<u></u>ust.git;protocol=3Dgit</=
a>&gt;&quot;<div class=3D"im"><br>
=A0 =A0 -<br>
=A0 =A0 -S =3D &quot;${WORKDIR}/git&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -do_configure_prepend () {<br>
=A0 =A0 - =A0 =A0 =A0 ${S}/bootstrap<br>
=A0 =A0 -}<br>
=A0 =A0 -<br>
=A0 =A0 -# Due to liburcu not building for MIPS currently this recipe needs=
 to<br>
=A0 =A0 -# be limited also.<br>
=A0 =A0 -# So here let us first suppport x86/arm/powerpc platforms now.<br>
=A0 =A0 -COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 diff --git a/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http:/=
/lttng2-ust_2.0.4.bb" target=3D"_blank">lttng2-ust_2.0.4.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.4.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.4.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng2-ust=
_2.0.4.bb" target=3D"_blank">lttng2-ust_2.0.4.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.4.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.4.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 new file mode 100644<br>
=A0 =A0 index 0000000..a5f8cec<br>
=A0 =A0 --- /dev/null<br>
=A0 =A0 +++ b/meta/recipes-kernel/lttng-2.<u></u>0/<a href=3D"http://lttng2=
-ust_2.0.4.bb" target=3D"_blank">lttng2-ust_2.0.4.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng2-ust_2.0.4.bb" target=3D"_blank">http:/=
/lttng2-ust_2.0.4.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 @@ -0,0 +1,30 @@<br>
=A0 =A0 +SUMMARY =3D &quot;Linux Trace Toolkit Userspace Tracer 2.0&quot;<b=
r>
=A0 =A0 +DESCRIPTION =3D &quot;The LTTng UST 2.0 package contains the users=
pace<br>
=A0 =A0 tracer library to trace userspace codes.&quot;<br>
=A0 =A0 +HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/lttng2.0" target=3D=
"_blank">http://lttng.org/lttng2.0</a>&quot;<br>
=A0 =A0 +BUGTRACKER =3D &quot;n/a&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +LICENSE =3D &quot;LGPLv2.1+ &amp; BSD &amp; GPLv2&quot;<br>
=A0 =A0 +LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://COPYING;md5=3D<u></u>c963eb366b781252b0bf0fdf1624d9<u>=
</u>e9 \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://snprintf/snprintf.c;<u></u>endline=3D32;md5=3D<u></u>d3d=
544959d8a3782b2e07451be0a90<u></u>3c \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://snprintf/various.h;<u></u>endline=3D31;md5=3D<u></u>89f2=
509b6b4682c4fc95255eec4abe<u></u>44&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +inherit autotools<br>
=A0 =A0 +<br>
=A0 =A0 +DEPENDS =3D &quot;liburcu util-linux&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +SRCREV =3D &quot;<u></u>f8b934136d431621e3e85457ac2875<u></u>e8bd9=
c3387&quot;<br>
=A0 =A0 +PV =3D &quot;2.0.4+git${SRCPV}&quot;<br>
=A0 =A0 +PR =3D &quot;r0&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-ust.=
git;protocol=3Dgit" target=3D"_blank">git.lttng.org/lttng-<u></u>ust.git;pr=
otocol=3Dgit</a><br></div>
=A0 =A0 &lt;<a href=3D"http://git.lttng.org/lttng-ust.git;protocol=3Dgit" t=
arget=3D"_blank">http://git.lttng.org/lttng-<u></u>ust.git;protocol=3Dgit</=
a>&gt;&quot;<div class=3D"im"><br>
=A0 =A0 +<br>
=A0 =A0 +S =3D &quot;${WORKDIR}/git&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +do_configure_prepend () {<br>
=A0 =A0 + =A0 =A0 =A0 ${S}/bootstrap<br>
=A0 =A0 +}<br>
=A0 =A0 +<br>
=A0 =A0 +# Due to liburcu not building for MIPS currently this recipe needs=
 to<br>
=A0 =A0 +# be limited also.<br>
=A0 =A0 +# So here let us first suppport x86/arm/powerpc platforms now.<br>
=A0 =A0 +COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 diff --git a/meta/recipes-support/<u></u>liburcu/<a href=3D"http://=
liburcu_0.6.7.bb" target=3D"_blank">liburcu_0.6.7.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.6.7.bb" target=3D"_blank">http://li=
burcu_0.6.7.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-support/<u></u>liburcu/<a href=3D"http://liburcu_0.6=
.7.bb" target=3D"_blank">liburcu_0.6.7.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.6.7.bb" target=3D"_blank">http://li=
burcu_0.6.7.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 deleted file mode 100644<br>
=A0 =A0 index be73856..0000000<br>
=A0 =A0 --- a/meta/recipes-support/<u></u>liburcu/<a href=3D"http://liburcu=
_0.6.7.bb" target=3D"_blank">liburcu_0.6.7.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.6.7.bb" target=3D"_blank">http://li=
burcu_0.6.7.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 +++ /dev/null<br>
=A0 =A0 @@ -1,24 +0,0 @@<br>
=A0 =A0 -DESCRIPTION =3D &quot;The userspace read-copy update library by Ma=
thieu<br>
=A0 =A0 Desnoyers&quot;<br>
=A0 =A0 -HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/urcu" target=3D"_bl=
ank">http://lttng.org/urcu</a>&quot;<br>
=A0 =A0 -BUGTRACKER =3D &quot;<a href=3D"http://lttng.org/project/issues" t=
arget=3D"_blank">http://lttng.org/project/<u></u>issues</a>&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -LICENSE =3D &quot;LGPLv2.1+ &amp; MIT-style&quot;<br>
=A0 =A0 -LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://LICENSE;md5=3D<u></u>b472dc110d38774921e1d5ccb0065f<u>=
</u>ff \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://urcu.h;beginline=3D4;<u></u>endline=3D32;md5=3D<u></u>4d=
e0d68d3a997643715036d2209ae1<u></u>d9 \<br>
=A0 =A0 -<br>
=A0 =A0 =A0 file://urcu/uatomic/x86.h;<u></u>beginline=3D4;endline=3D21;md5=
=3D<u></u>220552f72c55b102f2ee35929734ef<u></u>42&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -PR =3D &quot;r0&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/urcu/userspace=
-rcu-$%7BPV%7D.tar.bz2" target=3D"_blank">http://lttng.org/files/urcu/<u></=
u>userspace-rcu-${PV}.tar.bz2</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.=
tar.bz2" target=3D"_blank">http://lttng.org/files/urcu/<u></u>userspace-rcu=
-$%7BPV%7D.tar.<u></u>bz2</a>&gt;&quot;<div class=3D"im"><br>
=A0 =A0 -<br>
=A0 =A0 -SRC_URI[md5sum] =3D &quot;<u></u>2705dadd65beda8e8960472c082e44<u>=
</u>b3&quot;<br>
=A0 =A0 -SRC_URI[sha256sum] =3D<br>
=A0 =A0 &quot;<u></u>b0b09aead6fbcb4d5efb4270e12f84<u></u>ffd115b99b55b2c74=
5e052b2d87a47<u></u>e75f&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -S =3D &quot;${WORKDIR}/userspace-rcu-${<u></u>PV}&quot;<br>
=A0 =A0 -CFLAGS_append_libc-uclibc =3D &quot; -D_GNU_SOURCE&quot;<br>
=A0 =A0 -inherit autotools<br>
=A0 =A0 -<br>
=A0 =A0 -# liburcu, which is only used by lttng-ust, may not build on other=
<br>
=A0 =A0 -# platforms, like MIPS.<br>
=A0 =A0 -COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 -<br>
=A0 =A0 diff --git a/meta/recipes-support/<u></u>liburcu/<a href=3D"http://=
liburcu_0.7.3.bb" target=3D"_blank">liburcu_0.7.3.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.7.3.bb" target=3D"_blank">http://li=
burcu_0.7.3.bb</a>&gt;<br>
=A0 =A0 b/meta/recipes-support/<u></u>liburcu/<a href=3D"http://liburcu_0.7=
.3.bb" target=3D"_blank">liburcu_0.7.3.bb</a><br>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.7.3.bb" target=3D"_blank">http://li=
burcu_0.7.3.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 new file mode 100644<br>
=A0 =A0 index 0000000..86f29be<br>
=A0 =A0 --- /dev/null<br>
=A0 =A0 +++ b/meta/recipes-support/<u></u>liburcu/<a href=3D"http://liburcu=
_0.7.3.bb" target=3D"_blank">liburcu_0.7.3.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://liburcu_0.7.3.bb" target=3D"_blank">http://li=
burcu_0.7.3.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 @@ -0,0 +1,24 @@<br>
=A0 =A0 +DESCRIPTION =3D &quot;The userspace read-copy update library by Ma=
thieu<br>
=A0 =A0 Desnoyers&quot;<br>
=A0 =A0 +HOMEPAGE =3D &quot;<a href=3D"http://lttng.org/urcu" target=3D"_bl=
ank">http://lttng.org/urcu</a>&quot;<br>
=A0 =A0 +BUGTRACKER =3D &quot;<a href=3D"http://lttng.org/project/issues" t=
arget=3D"_blank">http://lttng.org/project/<u></u>issues</a>&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +LICENSE =3D &quot;LGPLv2.1+ &amp; MIT-style&quot;<br>
=A0 =A0 +LIC_FILES_CHKSUM =3D<br>
=A0 =A0 &quot;file://LICENSE;md5=3D<u></u>95dfea59eeaa41a4057faa07a58f5f<u>=
</u>89 \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://urcu.h;beginline=3D4;<u></u>endline=3D32;md5=3D<u></u>4d=
e0d68d3a997643715036d2209ae1<u></u>d9 \<br>
=A0 =A0 +<br>
=A0 =A0 =A0 file://urcu/uatomic/x86.h;<u></u>beginline=3D4;endline=3D21;md5=
=3D<u></u>220552f72c55b102f2ee35929734ef<u></u>42&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +PR =3D &quot;r0&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +SRC_URI =3D &quot;<a href=3D"http://lttng.org/files/urcu/userspace=
-rcu-$%7BPV%7D.tar.bz2" target=3D"_blank">http://lttng.org/files/urcu/<u></=
u>userspace-rcu-${PV}.tar.bz2</a><br></div>
=A0 =A0 &lt;<a href=3D"http://lttng.org/files/urcu/userspace-rcu-$%7BPV%7D.=
tar.bz2" target=3D"_blank">http://lttng.org/files/urcu/<u></u>userspace-rcu=
-$%7BPV%7D.tar.<u></u>bz2</a>&gt;&quot;<div class=3D"im"><br>
=A0 =A0 +<br>
=A0 =A0 +SRC_URI[md5sum] =3D &quot;<u></u>c40b726f13bff80982c1ffa1bc2db3<u>=
</u>1d&quot;<br>
=A0 =A0 +SRC_URI[sha256sum] =3D<br>
=A0 =A0 &quot;<u></u>63f540a5d3c947fa3739711099fb87<u></u>a66036d3c9560f26d=
a763e500da296<u></u>a1af&quot;<br>
=A0 =A0 +<br>
=A0 =A0 +S =3D &quot;${WORKDIR}/userspace-rcu-${<u></u>PV}&quot;<br>
=A0 =A0 +CFLAGS_append_libc-uclibc =3D &quot; -D_GNU_SOURCE&quot;<br>
=A0 =A0 +inherit autotools<br>
=A0 =A0 +<br>
=A0 =A0 +# liburcu, which is only used by lttng-ust, may not build on other=
<br>
=A0 =A0 +# platforms, like MIPS.<br>
=A0 =A0 +COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|<u></u>powerpc.*)-=
linux&#39;<br>
=A0 =A0 +<br>
=A0 =A0 --<br>
=A0 =A0 1.7.1<br>
<br>
<br>
=A0 =A0 ______________________________<u></u>_________________<br>
=A0 =A0 Openembedded-core mailing list<br>
=A0 =A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.<u></u>openembedded.org</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">Openembedded-core@<u></u>lists.openembedded.org</a>&g=
t;<br>
=A0 =A0 <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/open=
embedded-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/=
mailman/listinfo/<u></u>openembedded-core</a><div class=3D"im"><br>
<br>
<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
</div></blockquote>
</blockquote></div><br>

--20cf303b410deece2404c6448300--
