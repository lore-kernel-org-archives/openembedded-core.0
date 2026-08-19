Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B94C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:05:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.557.1787115890871420386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WcNjYoec;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 80B664E412C0
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:04:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 451EF604AA;
	Wed, 19 Aug 2026 05:04:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D685111C75279;
	Wed, 19 Aug 2026 07:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787115883; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5DxGtLYgOHKMrwVUqLEPC5ufg6U4VjmejNiQFLUzlus=;
	b=WcNjYoecc6AuzQ1jZguqdCNSels/XT7rYTww+GCULwMPSr38Sj8vO00NtZg90JuauXaiqW
	tbG5765TdQg2TpsvC2SbHtXemoLwFBIxJD7w9JrBCWr23ajimLhpxYaQxE66C9U6Zx/MS5
	4f+x9MoH8VF/i1g2t7jMG2MYALfeIXS8RRlq7e2XUREwMD0cqt0SdZSlCcikokrLwArlZO
	ezyi8aOgKe95PDx/XxTAQRMU3wXSjhnjEHwYdtZX09TFoZ0LlCGCMlH+6exC09RUy7CpQa
	J1HMKrDb3c3WhJwGNiE+SicgI0GCxY88kXX3Xi0Tdji6mos1jpQQweR2Zo0hKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 07:04:41 +0200
Message-Id: <DKSNPIA0U8TJ.2BL1NWUZH4PRP@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] elfutils: upgrade 0.195 -> 0.196
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818140212.55083-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260818140212.55083-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243696

On Tue Aug 18, 2026 at 4:02 PM CEST, Jaipaul Cheernam wrote:
> Source: NEWS
>
> Version 0.196 "Split Personality"
>
> debuginfod: The $DEBUGINFOD_TIMEOUT environment variable is now enforced
>             when establishing a connection to a server.
>
> libdw: New functions dwarf_begin_type, dwarf_begin_elf_type and
>        dwarf_get_type plus new enum Dwarf_Type.  Used to select between
>        plain DWARF, split DWARF (.dwo/.dwp) and GNU LTO when opening a
>        file.
>
>        Added support for DWARF5 supplementary files (.debug_sup) and
>        associated DW_FORM_ref_sup4/8 and DW_FORM_strp_sup forms.
>
>        Added support for split DWARF debug data when contained in the
>        same file as the skeleton.
>
> libdwelf: New functions dwelf_dwarf_debug_sup and dwelf_dwarf_debug_dwp
>           for querying .debug_sup and .debug_dwp section data.
>
> libdwfl: Now correctly handles Linux kernel module sections that are
>          not present in sysfs.
>
> libdwfl_stacktrace: New functions dwflst_arch_from_uname,
>                     dwflst_arch_expected_frame_nregs,
>                     dwflst_arch_sp_dwarf_reg and dwflst_arch_sp_perf_reg
>                     providing per-architecture constants.  The
>                     libdwfl_stacktrace interface is experimental and may
>                     be subject to API/ABI changes.
>
> stackprof: New profiling tool for collecting systemwide stacktrace
>            profiles.  Replaces the eu-stacktrace tool.  Requires
>            a C++20 capable compiler.
>
> stacktrace: This experimental tool has been removed and replaced with
>             eu-stackprof.
>
> srcfiles: Now handles CU names and files from split DWARF.
>
> strip: Fixed bug where a section's sh_link or sh_info reference could
>        be missing from the debug file.
>
> version.h: New macro _ELFUTILS_THREAD_SAFE added to <elfutils/version.h>.
>            Defined to 1 when the elfutils libraries are built with thread
>            safety support enabled.  Otherwise it is left undefined.
>            Thread safety support is experimental and is not yet officiall=
y
>            supported.
>
> Dropped patches:
> 0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
>   Backported in b4bd2a2bf6 for 0.192 from upstream commit [1].
>   A later upstream commit [2] replaced the $(AR) t approach with a
>   libeu.manifest file. Both [1] and [2] landed in upstream 0.193,
>   making the backport redundant since 0.193. Verified libelf.a
>   contains eu-search.o after build without the patch.
>
> [1] https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3Df5d6e088f=
84dd05278c4698a21cbf1ff4569978d
> [2] https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3D4eff110a6=
0cb9c7b77884c61f5925fe844c52acb
>
> Refreshed patches:
> 0003-musl-utils.patch
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for your patch.

It looks like this is breaking ptests:

Failed ptests:
{'elfutils': 'START: ptest-runner\n'
             '2026-08-18T20:10\n'
             'make  \\\n'
             '\tTESTS_ENVIRONMENT=3D"libdir=3D\'/usr/lib\'; bindir=3D\'/usr=
/bin\'; '
             "LC_ALL=3DC; LANG=3DC; VALGRIND_CMD=3D''; "
             "abs_srcdir=3D'/usr/lib/elfutils/ptest/tests'; "
             "abs_builddir=3D'/usr/lib/elfutils/ptest/tests'; "
             "abs_top_builddir=3D'/usr/lib/elfutils/ptest/tests/../'; expor=
t "
             'abs_srcdir; export abs_builddir; export abs_top_builddir; exp=
ort '
             'libdir; export bindir; export LC_ALL; export LANG; export '
             'VALGRIND_CMD; unset DEBUGINFOD_URLS; '
             "NM=3D'riscv64-poky-linux-gcc-nm'; export NM; CC=3D'gcc'; expo=
rt "
             'CC;" \\\n'
             '\tLOG_COMPILER=3D"/usr/lib/elfutils/ptest/tests/test-wrapper.=
sh '
             'installed no \'s,^,eu-,\'" check-TESTS\n'
             "make[1]: Entering directory '/usr/lib/elfutils/ptest/tests'\n=
"
             "make[1]: *** No rule to make target '../libdw/libdw.a', neede=
d "
             "by 'elf-from-memory'.\n"
             "make[1]: Target 'check-TESTS' not remade because of errors.\n=
"
             "make[1]: Leaving directory '/usr/lib/elfutils/ptest/tests'\n"
             'make: *** [Makefile:3473: installcheck-local] Error 2\n'
             '\n'
             'ERROR: Exit status is 2\n'
             'DURATION: 1\n'}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2197
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4329
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1002
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/983

Also, I've seen a build failure of elfutils itself, on qemuarm64
platform. A rebuild is in progress to see if it happens again:

ERROR: elfutils-native-0.196-r0 do_compile: Execution of '/srv/pokybuild/yo=
cto-worker/qemuarm64-ptest/build/build/tmp/work/aarch64-linux/elfutils-nati=
ve/0.196/temp/run.do_compile.861918' failed with exit code 1
...
| gcc  -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR=3D'"/srv/pokybuild/yocto-w=
orker/qemuarm64-ptest/build/build/tmp/work/aarch64-linux/elfutils-native/0.=
196/recipe-sysroot-native/usr/share/locale"' -I. -I../../sources/elfutils-0=
.196/backends -I..  -iquote. -iquote../../sources/elfutils-0.196/backends -=
I../../sources/elfutils-0.196/lib -I/srv/pokybuild/yocto-worker/qemuarm64-p=
test/build/build/tmp/work/aarch64-linux/elfutils-native/0.196/build -I../..=
/sources/elfutils-0.196/libebl -I../../sources/elfutils-0.196/libasm -I../.=
./sources/elfutils-0.196/libelf -I../../sources/elfutils-0.196/libdw -isyst=
em/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/build/tmp/work/aarch64-=
linux/elfutils-native/0.196/recipe-sysroot-native/usr/include -Wall -Wshado=
w -Wformat=3D2 -Wold-style-definition -Wstrict-prototypes -Wtrampolines -Wl=
ogical-op -Wduplicated-cond -Wnull-dereference -Wimplicit-fallthrough=3D5 -=
Wuse-after-free=3D3    -Wunused -Wextra -Wstack-usage=3D262144    -D_FORTIF=
Y_SOURCE=3D3 -isystem/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/buil=
d/tmp/work/aarch64-linux/elfutils-native/0.196/recipe-sysroot-native/usr/in=
clude -O2 -pipe -c -o sparc_initreg.o ../../sources/elfutils-0.196/backends=
/sparc_initreg.c
| In file included from ../../sources/elfutils-0.196/backends/aarch64_initr=
eg.c:36:
| /usr/include/linux/uio.h:17:8: error: redefinition of =E2=80=98struct iov=
ec=E2=80=99
|    17 | struct iovec
|       |        ^~~~~
| In file included from /usr/include/aarch64-linux-gnu/bits/fcntl-linux.h:3=
8,
|                  from /usr/include/aarch64-linux-gnu/bits/fcntl.h:61,
|                  from /usr/include/fcntl.h:35,
|                  from ../../sources/elfutils-0.196/lib/system.h:42,
|                  from ../../sources/elfutils-0.196/backends/aarch64_initr=
eg.c:33:
| /usr/include/aarch64-linux-gnu/bits/types/struct_iovec.h:26:8: note: orig=
inally defined here
|    26 | struct iovec
|       |        ^~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4312
rebuild: https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds=
/4314

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


