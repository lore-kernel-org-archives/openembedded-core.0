Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D06BB78AA0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:11:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id q27so8508662pgn.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Sayj5BMhrB1ITfcZ+rRcUOuquMYS3Ls0zzrhUQL0ars=;
	b=r6Agy4LkgIcTNhXOaf7B8j2r4JcKQ/cxgj2FO8f+RCLnHr3Rp3Dwek8cSJUS1H6j9E
	D0jPpLWrXRuaVAfVNDg+7kQO1knIZWZaIsUhhZtifW6YgrsIy8FsaMvE9BwLRbRnBph+
	sFhlQ29t5ezhUW0yRwyXbnhHFnACKLzCqlKtI3fbKsXwLbDYrHflsv5EVEJEZuOm/h0W
	EotPiYNvV6cX7IyasDH6Tg4p6UB8ff6DSdX0ckgPwgWWDSYkb1PINlTa5BNplTStVOR1
	4wlrljSOnexcxHWdprpSZwIunBIu0ZlMX3MHPDXNkm736R8f8NH+iBFaviulpdT2p1iw
	vS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Sayj5BMhrB1ITfcZ+rRcUOuquMYS3Ls0zzrhUQL0ars=;
	b=eiWpyWJNGZlzCny8+RBrR6o1kYwFV8NGnhWfXjgdCE66AmQ8tAUwH4VOljtXki+fCl
	kffpH+JDaLEtCP1duJ13d7HM/S8NhTEfDP7HALVsXdv8V9G4iotanGA34MHBt/WgkNmr
	5EJpuhSPaaW0iUzg8/Hdf+RquvldaXzAZFPOVV1kYnRZ/5P0wFMKolJ65Dn8w7aqjYhT
	TzSE7m4XX7i7SAHRu+pPZX7uq+mmCYclt4LpvbGBKtZUWRRcos825Y8DRCu+CIKBpBp/
	aDPR1yth4arKJEcqEb2o3JKSEBwQo0CoCsx1aPmpQg4wzG0+hHlEBjFcTE9eZYKC0GnM
	23nA==
X-Gm-Message-State: APf1xPDMZUHhpZAKhz6i/orhkz2n1XwRH9IaW3/QeRmTzXYZX20bFxxV
	KZYXkehnrudQxxCEV6LeUkDWYesRZ1NtjaAGXPM=
X-Google-Smtp-Source: AG47ELsmF5kp7RU0uKDC192P1BluSnIycC5pAcb7cD7Bu+GFCe/JizqwFD0fewWjKQyGW1Y3F7HA/pRagmfo1Yj3+08=
X-Received: by 10.98.18.70 with SMTP id a67mr19573704pfj.213.1520356298777;
	Tue, 06 Mar 2018 09:11:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Tue, 6 Mar 2018 09:11:08 -0800 (PST)
In-Reply-To: <1520351181-18084-1-git-send-email-daniel.diaz@linaro.org>
References: <1520051014-6587-1-git-send-email-daniel.diaz@linaro.org>
	<1520351181-18084-1-git-send-email-daniel.diaz@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Mar 2018 09:11:08 -0800
Message-ID: <CAMKF1spKDOks1PfYQBU1VgJyA3DUBO0c+sPWirLLeuvOdqZkEQ@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gdb: fix header ordering for TRAP_HWBKPT
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
X-List-Received-Date: Tue, 06 Mar 2018 17:11:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2018 at 7:46 AM, Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
> This error can appear in gdb/nat/linux-ptrace.c because of
> the order in which some headers are processed:
> | In file included from ../../gdb-7.11.1/gdb/nat/linux-ptrace.c:20:0:
> | ../../gdb-7.11.1/gdb/nat/linux-ptrace.h:175:22: error: expected identif=
ier before numeric constant
> |  # define TRAP_HWBKPT 4
> |                       ^
> | Makefile:2357: recipe for target 'linux-ptrace.o' failed
> | make[2]: *** [linux-ptrace.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory '/oe/build/tmp-rpb-glibc/work/aarch64-linaro=
-linux/gdb/7.11.1-r0/build-aarch64-linaro-linux/gdb'
> | Makefile:8822: recipe for target 'all-gdb' failed
> | make[1]: *** [all-gdb] Error 2
> | make[1]: Leaving directory '/oe/build/tmp-rpb-glibc/work/aarch64-linaro=
-linux/gdb/7.11.1-r0/build-aarch64-linaro-linux'
> | Makefile:846: recipe for target 'all' failed
> | make: *** [all] Error 2
>
> A patch from GDB's current master solves the issue.
>

LGTM

> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
> v2: Add signed-off-by tag to patch
>
>  meta/recipes-devtools/gdb/gdb-8.0.1.inc            |  1 +
>  ...4-defining-TRAP_HWBKPT-before-including-g.patch | 56 ++++++++++++++++=
++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-T=
RAP_HWBKPT-before-including-g.patch
>
> diff --git a/meta/recipes-devtools/gdb/gdb-8.0.1.inc b/meta/recipes-devto=
ols/gdb/gdb-8.0.1.inc
> index 83c08e5..4a5299b 100644
> --- a/meta/recipes-devtools/gdb/gdb-8.0.1.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
> @@ -17,6 +17,7 @@ SRC_URI =3D "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.x=
z \
>             file://0010-resolve-restrict-keyword-conflict.patch \
>             file://package_devel_gdb_patches_120-sigprocmask-invalid-call=
.patch \
>             file://0012-Unbreak-GDBserver-build-for-x32.patch \
> +           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.p=
atch \
>  "
>  SRC_URI[md5sum] =3D "48cac527e6f3018b865ece021e9723ac"
>  SRC_URI[sha256sum] =3D "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a5=
3f4c02d7d56295e3"
> diff --git a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWB=
KPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-d=
efining-TRAP_HWBKPT-before-including-g.patch
> new file mode 100644
> index 0000000..2cdeafc
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-bef=
ore-including-g.patch
> @@ -0,0 +1,56 @@
> +From c57122f94b1c749e4c12f6449b61a3b114f705cd Mon Sep 17 00:00:00 2001
> +From: James Clarke <jrtc27@jrtc27.com>
> +Date: Fri, 19 Jan 2018 17:22:49 +0000
> +Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
> + gdb_wait.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
> +contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
> +define TRAP_HWBKPT to 4 beforehand, and so gdb_wait.h must be included
> +earlier; include it from linux-ptrace.h so it can never come afterwards.
> +
> +gdb/ChangeLog:
> +
> +       * nat/linux-ptrace.c: Remove unnecessary reinclusion of
> +       gdb_ptrace.h, and move including gdb_wait.h ...
> +       * nat/linux-ptrace.h: ... to here.
> +
> +Upstream-Status: Accepted [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;a=3Dcommit;h=3D5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
> +
> +Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> +---
> + gdb/nat/linux-ptrace.c | 2 --
> + gdb/nat/linux-ptrace.h | 1 +
> + 2 files changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
> +index 3265b16..559c2de 100644
> +--- a/gdb/nat/linux-ptrace.c
> ++++ b/gdb/nat/linux-ptrace.c
> +@@ -21,8 +21,6 @@
> + #include "linux-procfs.h"
> + #include "linux-waitpid.h"
> + #include "buffer.h"
> +-#include "gdb_wait.h"
> +-#include "gdb_ptrace.h"
> + #ifdef HAVE_SYS_PROCFS_H
> + #include <sys/procfs.h>
> + #endif
> +diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
> +index 5954945..6faa89b 100644
> +--- a/gdb/nat/linux-ptrace.h
> ++++ b/gdb/nat/linux-ptrace.h
> +@@ -21,6 +21,7 @@
> + struct buffer;
> +
> + #include "nat/gdb_ptrace.h"
> ++#include "gdb_wait.h"
> +
> + #ifdef __UCLIBC__
> + #if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

