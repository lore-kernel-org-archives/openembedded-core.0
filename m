Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6CEC75411
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 17:08:06 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id q9-v6so1504207lfk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Kj7kQsCOuGZptE0klpTQGDXzV0Nx3zFwllOrYNxd/4U=;
	b=Wwo9fiDKyPDCwNOlvdeX3nFPSg4fK5/t0wnRNJvLe1ZbSgmhK/PZrojKqfmCGP5991
	bQHy/4OAJY791wMCUcTaQp1BrFqfyGR9m2hSMr3AfKfenXgZr35Iq/janwtR82qYjXzD
	w5l4tHbUDU/uM02+v0pWk072xb14hMpQQqW1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Kj7kQsCOuGZptE0klpTQGDXzV0Nx3zFwllOrYNxd/4U=;
	b=rU5BwXXqV3nMYP0KGZjuEcXPBSTO5hN+lnfsJYUt+G4B9GCHUm+cow/HyH637RZybl
	TMGCFhGUI9+uNXse8VlurCU3SV5c4Yi1dl5E3IFaL/JomwEe9xxWndw2zmXIbRIhkYJn
	apTdAE9TbGE+4OmWNQYW/VlOvNUQ8PAeNhyI62gFeZUm9vSQCyAq3YqzNXvtp0biuhNB
	F3Ah/1ONKE3Y8gEqiVGGsVFVXU4ygK1Ht0UGc4hgMoNpwWMiDd8guQrQkCfY6r3S/L6g
	s/fIkOjFeXq5vbX3jmbjHXodv1i6chXK3xcJBDiA1s/hGuPhK7Nj0cdkQHTmiKSSMIwB
	eflg==
X-Gm-Message-State: ALQs6tDVowu0iRj1pTJ0tS9lt3/G7lK3eIvyWx7D+WipjoD6njBf6EwS
	RU2Y3x4N2jyirPZyMczEIJQKYWQVAvYFJ6XVX0dXjnWQ
X-Google-Smtp-Source: AIpwx49jicrb/HHKcgYUMdyKfbBN9Ib/bLaAPuVH+W0NpGKs7r8VT1Zzb1LtZVgbI+DnldW/dENM5eBDNvF8MgnwAio=
X-Received: by 2002:a19:d720:: with SMTP id
	o32-v6mr16347098lfg.89.1523034485214; 
	Fri, 06 Apr 2018 10:08:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:f117:0:0:0:0:0 with HTTP;
	Fri, 6 Apr 2018 10:08:04 -0700 (PDT)
From: =?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?= <daniel.diaz@linaro.org>
Date: Fri, 6 Apr 2018 12:08:04 -0500
Message-ID: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Fri, 06 Apr 2018 17:08:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping on this series for Morty.

--=20
ddiaz


On 13 March 2018 at 11:17, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrote:
> From: Fathi Boudra <fathi.boudra@linaro.org>
>
> Patch submitted upstream, pending to be merged:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D21286
>
> (From OE-Core rev: 11ebb5054e5ec1171ade90249e3a30ac8174a35a)
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...o.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch | 69 ++++++++++++++++=
++++++
>  meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enu=
m-definition-for-TRAP_HWBKPT-is-mi.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-defin=
ition-for-TRAP_HWBKPT-is-mi.patch b/meta/recipes-core/glibc/glibc/0029-bits=
-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
> new file mode 100644
> index 0000000..fe22cc3
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-f=
or-TRAP_HWBKPT-is-mi.patch
> @@ -0,0 +1,69 @@
> +From af3054b3856379d353a779801678f330e1b58c9a Mon Sep 17 00:00:00 2001
> +Message-Id: <af3054b3856379d353a779801678f330e1b58c9a.1490183611.git.pan=
and@redhat.com>
> +From: Pratyush Anand <panand@redhat.com>
> +Date: Wed, 22 Mar 2017 17:02:38 +0530
> +Subject: [PATCH] bits/siginfo.h: enum definition for TRAP_HWBKPT is miss=
ing
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Compile following linux kernel test code with latest glibc:
> +
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
> +
> +and we get following error:
> +breakpoint_test_arm64.c: In function =E2=80=98run_test=E2=80=99:
> +breakpoint_test_arm64.c:171:25: error: =E2=80=98TRAP_HWBKPT=E2=80=99 und=
eclared (first use in this function)
> +  if (siginfo.si_code !=3D TRAP_HWBKPT) {
> +                         ^
> +I can compile test code by modifying my local
> +/usr/include/bits/siginfo.h and test works great. Therefore, this patch
> +will be needed in upstream glibc so that issue is fixed there as well.
> +
> +Signed-off-by: Pratyush Anand <panand@redhat.com>
> +
> +Upstream-Status : Submitted [https://sourceware.org/bugzilla/show_bug.cg=
i?id=3D21286]
> +---
> + bits/siginfo.h                         | 6 +++++-
> + sysdeps/unix/sysv/linux/bits/siginfo.h | 6 +++++-
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/bits/siginfo.h b/bits/siginfo.h
> +index 4919df543634..6dc714e8f30b 100644
> +--- a/bits/siginfo.h
> ++++ b/bits/siginfo.h
> +@@ -140,8 +140,12 @@ enum
> + {
> +   TRAP_BRKPT =3D 1,             /* Process breakpoint.  */
> + #  define TRAP_BRKPT  TRAP_BRKPT
> +-  TRAP_TRACE                  /* Process trace trap.  */
> ++  TRAP_TRACE,                 /* Process trace trap.  */
> + #  define TRAP_TRACE  TRAP_TRACE
> ++  TRAP_BRANCH,                        /* Process branch trap. */
> ++# define TRAP_BRANCH  TRAP_BRANCH
> ++  TRAP_HWBKPT                 /* hardware breakpoint/watchpoint  */
> ++# define TRAP_HWBKPT  TRAP_HWBKPT
> + };
> + # endif
> +
> +diff --git a/sysdeps/unix/sysv/linux/bits/siginfo.h b/sysdeps/unix/sysv/=
linux/bits/siginfo.h
> +index 7b0d4f62a331..9cdf42a42557 100644
> +--- a/sysdeps/unix/sysv/linux/bits/siginfo.h
> ++++ b/sysdeps/unix/sysv/linux/bits/siginfo.h
> +@@ -235,8 +235,12 @@ enum
> + {
> +   TRAP_BRKPT =3D 1,             /* Process breakpoint.  */
> + #  define TRAP_BRKPT  TRAP_BRKPT
> +-  TRAP_TRACE                  /* Process trace trap.  */
> ++  TRAP_TRACE,                 /* Process trace trap.  */
> + #  define TRAP_TRACE  TRAP_TRACE
> ++  TRAP_BRANCH,                        /* Process branch trap. */
> ++# define TRAP_BRANCH  TRAP_BRANCH
> ++  TRAP_HWBKPT                 /* hardware breakpoint/watchpoint  */
> ++# define TRAP_HWBKPT  TRAP_HWBKPT
> + };
> + # endif
> +
> +--
> +2.9.3
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/gl=
ibc/glibc_2.24.bb
> index 6ea4585..09694f2 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -38,6 +38,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};nam=
e=3Dglibc \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-build_local_scope.patch \
>             file://0028-Bug-20116-Fix-use-after-free-in-pthread_create.pa=
tch \
> +           file://0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is=
-mi.patch \
>             file://CVE-2016-6323.patch \
>             file://0001-Add-atomic_exchange_relaxed.patch \
>             file://0002-Add-atomic-operations-required-by-the-new-conditi=
on-.patch \
> --
> 2.7.4
>

