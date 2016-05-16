Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 25AB9606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:50:13 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f74so88743628qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2HFCk7cMueYuAkTdwuyDgMeejejomEtfK4Yq5i9oZ3s=;
	b=kzMYZg8K57YC2V8b6CSDqJjLJk8m6ycxtcMvH0ecKxbiB0Wqw0mqSaJtnmTEAQUmDq
	EjlPcJYDXjj+MuMJ169qp62C/rax4Rf7daCwFgW/oM5pn2PqXb337YLCqAGbe58ENoy5
	h0B7RfqOL4lQdkyxJnAvB2hSss4VHLPLBryhPZCKU2uWu24Ehas8lh4uON8zbj/t/52J
	KS49RLD8Zmmc2NcOP4w4W6DO/uoJs/nOUGwPH1nstqNkzuj1V87g82Qdj3ySlpnm63iN
	0jkEEdHnL8We9c79xR+7o13ev6jUKz1BA7Q7Fu0rm7upuSZBBiWRk2gNlVxSPMBGjzeQ
	NOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2HFCk7cMueYuAkTdwuyDgMeejejomEtfK4Yq5i9oZ3s=;
	b=cifuLP/2RDfJLBXWvPCAFtqR5ppO2zIVe2qIZUmnhAbTihcrEydKvRi8IX4J6ZdPJf
	1UaQthMn4SRrYA95znFE8Ag5vyc2VNuaersKynd8HBxhMnEmcKxpsQnxGdP2VOGe8jZV
	Gx2No3XfpQYIdKYYE99cye7GhHtZQsL/nP+SobbZRoLbDWuqqVrmtTHlDSmh+M0DtcaC
	ZOmq3IaFH1MJuFlh3zMocNnVLuxPahsoqnQVqopAinE2U7HIEbndD2AExHlNBinHNbRE
	R9wYuXcB9jzCJJUDJypkcIXLah8LNk602YBGY8dUtMCYDsgA2USOHcOpUCxdgcsbu07x
	Qwzg==
X-Gm-Message-State: AOPr4FVwA5JbByoVgK3f8Lc6yYntmJBK50TOm1986L1/UoCnF0JYMKgb8NAl/7/tujYsAbDdZv4bwg1PGfWTLQ==
MIME-Version: 1.0
X-Received: by 10.140.92.175 with SMTP id b44mr28182743qge.104.1463406613729; 
	Mon, 16 May 2016 06:50:13 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 16 May 2016 06:50:13 -0700 (PDT)
In-Reply-To: <1463380077-2562-1-git-send-email-sgw@linux.intel.com>
References: <1463380077-2562-1-git-send-email-sgw@linux.intel.com>
Date: Mon, 16 May 2016 06:50:13 -0700
Message-ID: <CAMKF1socc-6t15wSfpMnFkBCtrqAOttHxLfsajD1+9WUf24WUA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH - Jethro ] gdb: Backport patch to changes with AVX and MPX
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
X-List-Received-Date: Mon, 16 May 2016 13:50:15 -0000
Content-Type: multipart/alternative; boundary=001a11399e2e5f9b940532f5e7c3

--001a11399e2e5f9b940532f5e7c3
Content-Type: text/plain; charset=UTF-8

On Sunday, May 15, 2016, Saul Wold <sgw@linux.intel.com> wrote:

> The current MPX target descriptions assume that MPX is always combined
> with AVX, however that's not correct.  We can have machines with MPX
> and without AVX; or machines with AVX and without MPX.
>
> This patch adds new target descriptions for machines that support
> both MPX and AVX, as duplicates of the existing MPX descriptions.
>
> The following commit will remove AVX from the MPX-only descriptions.
>
> This commit is backported from 7.12


Master branch should need this fix too

>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> This is Jethro Only since it has a different version of GDB and this
> patch is version specific.
>
>  meta/recipes-devtools/gdb/gdb.inc                  |    2 +
>  .../0001-Add-target-descriptions-for-AVX-MPX.patch | 2153
> ++++++++++++++++++++
>  2 files changed, 2155 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions-for-AVX-MPX.patch
>
> diff --git a/meta/recipes-devtools/gdb/gdb.inc
> b/meta/recipes-devtools/gdb/gdb.inc
> index 88c0213..58326a3 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -5,7 +5,9 @@ inherit gettext
>  SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
>              file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch
> \
>
>  file://fix-detection-of-64-bit-PPC-inferior-in-gdbserver.patch \
> +            file://0001-Add-target-descriptions-for-AVX-MPX.patch \
>             "
> +
>  #LDFLAGS_append = " -s"
>  #export CFLAGS_append=" -L${STAGING_LIBDIR}"
>
> diff --git
> a/meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions-for-AVX-MPX.patch
> b/meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions-for-AVX-MPX.patch
> new file mode 100644
> index 0000000..043ff45
> --- /dev/null
> +++
> b/meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions-for-AVX-MPX.patch
> @@ -0,0 +1,2153 @@
> +From 15c429945dc4674b62e6b956c0ba9059206055ed Mon Sep 17 00:00:00 2001
> +From: Walfred Tedeschi <walfred.tedeschi@intel.com>
> +Date: Fri, 13 May 2016 15:36:43 +0200
> +Subject: [PATCH 1/1] Add target descriptions for AVX + MPX
> +
> +The current MPX target descriptions assume that MPX is always combined
> +with AVX, however that's not correct.  We can have machines with MPX
> +and without AVX; or machines with AVX and without MPX.
> +
> +This patch adds new target descriptions for machines that support
> +both MPX and AVX, as duplicates of the existing MPX descriptions.
> +
> +The following commit will remove AVX from the MPX-only descriptions.
> +
> +2016-04-16  Walfred Tedeschi  <walfred.tedeschi@intel.com>
> +
> +gdb/ChangeLog:
> +
> +       * amd64-linux-tdep.c (features/i386/amd64-avx-mpx-linux.c):
> +       New include.
> +       (amd64_linux_core_read_description): Add case for
> +        X86_XSTATE_AVX_MPX_MASK.
> +       (_initialize_amd64_linux_tdep): Call
> initialize_tdesc_amd64_avx_mpx_linux.
> +       * amd64-linux-tdep.h (tdesc_amd64_avx_mpx_linux): New definition.
> +       * amd64-tdep.c (features/i386/amd64-avx-mpx.c): New include.
> +       (amd64_target_description): Add case for  X86_XSTATE_AVX_MPX_MASK.
> +       (_initialize_amd64_tdep): Call initialize_tdesc_amd64_avx_mpx.
> +       * common/x86-xstate.h (X86_XSTATE_MPX_MASK): Remove AVX bits.
> +       (X86_XSTATE_AVX_MPX_MASK): New case.
> +       * features/Makefile (i386/i386-avx-mpx, i386/i386-avx-mpx-linux)
> +       (i386/amd64-avx-mpx, i386/amd64-avx-mpx-linux): New rules.
> +       (i386/i386-avx-mpx-expedite, i386/i386-avx-mpx-linux-expedite)
> +       (i386/amd64-avx-mpx-expedite, i386/amd64-avx-mpx-linux-expedite):
> +       New expedites.
> +       * i386-linux-tdep.c (features/i386/i386-avx-mpx-linux.c): New
> +       include.
> +       (i386_linux_core_read_description): Add case
> +       X86_XSTATE_AVX_MPX_MASK.
> +       (_initialize_i386_linux_tdep): Call
> +       initialize_tdesc_i386_avx_mpx_linux.
> +       * i386-linux-tdep.h (tdesc_i386_avx_mpx_linux): New include.
> +       * i386-tdep.c (features/i386/i386-avx-mpx.c): New include.
> +       (i386_target_description): Add case for X86_XSTATE_AVX_MPX_MASK.
> +       * x86-linux-nat.c (x86_linux_read_description): Add case for
> +       X86_XSTATE_AVX_MPX_MASK.
> +       * features/i386/amd64-avx-mpx-linux.xml: New file.
> +       * features/i386/i386-avx-mpx-linux.xml: New file.
> +       * features/i386/i386-avx-mpx.xml: New file.
> +       * features/i386/amd64-avx-mpx.xml: New file.
> +       * features/i386/amd64-avx-mpx-linux.c: Generated.
> +       * features/i386/amd64-avx-mpx.c: Generated.
> +       * features/i386/i386-avx-mpx-linux.c: Generated.
> +       * features/i386/i386-avx-mpx.c: Generated.
> +       * regformats/i386/amd64-avx-mpx-linux.dat: Generated.
> +       * regformats/i386/amd64-avx-mpx.dat: Generated.
> +       * regformats/i386/i386-avx-mpx-linux.dat: Generated.
> +       * regformats/i386/i386-avx-mpx.dat: Generated.
> +
> +gdb/gdbserver/ChangeLog:
> +
> +       * Makefile.in (clean): Add removal for i386-avx-mpx.c,
> +       i386-avx-mpx-linux.c, amd64-avx-mpx.c and amd64-avx-mpx-linux.c.
> +       (i386-avx-mpx.c, i386-avx-mpx-linux.c, amd64-avx-mpx.c)
> +       (amd64-avx-mpx-linux.c): New rules.
> +       (amd64-avx-mpx-linux-ipa.o, i386-avx-mpx-linux-ipa.o): New rule.
> +       * configure.srv (srv_i386_regobj): Add i386-avx-mpx.o.
> +       (srv_i386_linux_regobj): Add i386-avx-mpx-linux.o.
> +       (srv_amd64_regobj): Add amd64-avx-mpx.o.
> +       (srv_amd64_linux_regobj): Add amd64-avx-mpx-linux.o.
> +       (srv_i386_xmlfiles): Add i386/i386-avx-mpx.xml.
> +       (srv_amd64_xmlfiles): Add i386/amd64-avx-mpx.xml.
> +       (srv_i386_linux_xmlfiles): Add i386/i386-avx-mpx-linux.xml.
> +       (srv_amd64_linux_xmlfiles): Add i386/amd64-avx-mpx-linux.xml.
> +       (ipa_i386_linux_regobj): Add i386-avx-mpx-linux-ipa.o.
> +       (ipa_amd64_linux_regobj): Add amd64-avx-mpx-linux-ipa.o.
> +       * linux-x86-low.c (x86_linux_read_description): Add case for
> +       X86_XSTATE_AVX_MPX_MASK.
> +       (x86_get_ipa_tdesc_idx): Add cases for avx_mpx.
> +       (initialize_low_arch): Call init_registers_amd64_avx_mpx_linux and
> +       init_registers_i386_avx_mpx_linux.
> +       * linux-i386-ipa.c (get_ipa_tdesc): Add case for avx_mpx.
> +       (initialize_low_tracepoint): Call
> +       init_registers_i386_avx_mpx_linux.
> +       * linux-amd64-ipa.c (get_ipa_tdesc):  Add case for avx_mpx.
> +       (initialize_low_tracepoint): Call
> +       init_registers_amd64_avx_mpx_linux.
> +       * linux-x86-tdesc.h (X86_TDESC_AVX_MPX): New enum value.
> +       (init_registers_amd64_avx_mpx_linux, tdesc_amd64_avx_mpx_linux)
> +       (init_registers_i386_avx_mpx_linux, tdesc_i386_avx_mpx_linux): New
> +       declarations.
> +
> +Change-Id: I7b0642263cfa3e47b626022796e5dd3627b92ba8
> +
> +# Conflicts:
> +#      gdb/amd64-tdep.c
> +#      gdb/i386-tdep.c
> +---
> + gdb/ChangeLog                               |  57 ++++++++
> + gdb/amd64-linux-tdep.c                      |   7 +
> + gdb/amd64-linux-tdep.h                      |   1 +
> + gdb/amd64-tdep.c                            |   2 +
> + gdb/common/x86-xstate.h                     |   5 +-
> + gdb/features/Makefile                       |  18 +++
> + gdb/features/i386/amd64-avx-mpx-linux.c     | 211
> ++++++++++++++++++++++++++++
> + gdb/features/i386/amd64-avx-mpx-linux.xml   |  19 +++
> + gdb/features/i386/amd64-avx-mpx.c           | 206
> +++++++++++++++++++++++++++
> + gdb/features/i386/amd64-avx-mpx.xml         |  17 +++
> + gdb/features/i386/amd64-mpx-linux.c         |  30 +---
> + gdb/features/i386/amd64-mpx-linux.xml       |   1 -
> + gdb/features/i386/amd64-mpx.c               |  30 +---
> + gdb/features/i386/amd64-mpx.xml             |   1 -
> + gdb/features/i386/i386-avx-mpx-linux.c      | 187
> ++++++++++++++++++++++++
> + gdb/features/i386/i386-avx-mpx-linux.xml    |  19 +++
> + gdb/features/i386/i386-avx-mpx.c            | 182
> ++++++++++++++++++++++++
> + gdb/features/i386/i386-avx-mpx.xml          |  17 +++
> + gdb/features/i386/i386-mpx-linux.c          |  22 +--
> + gdb/features/i386/i386-mpx-linux.xml        |   1 -
> + gdb/features/i386/i386-mpx.c                |  22 +--
> + gdb/features/i386/i386-mpx.xml              |   1 -
> + gdb/gdbserver/ChangeLog                     |  33 +++++
> + gdb/gdbserver/Makefile.in                   |  10 ++
> + gdb/gdbserver/configure.srv                 |  17 +--
> + gdb/gdbserver/linux-x86-low.c               |  16 +++
> + gdb/i386-linux-tdep.c                       |   4 +
> + gdb/i386-linux-tdep.h                       |   1 +
> + gdb/i386-tdep.c                             |   2 +
> + gdb/regformats/i386/amd64-avx-mpx-linux.dat |  85 +++++++++++
> + gdb/regformats/i386/amd64-avx-mpx.dat       |  84 +++++++++++
> + gdb/regformats/i386/amd64-mpx-linux.dat     |  16 ---
> + gdb/regformats/i386/amd64-mpx.dat           |  16 ---
> + gdb/regformats/i386/i386-avx-mpx-linux.dat  |  61 ++++++++
> + gdb/regformats/i386/i386-avx-mpx.dat        |  60 ++++++++
> + gdb/regformats/i386/i386-mpx-linux.dat      |   8 --
> + gdb/regformats/i386/i386-mpx.dat            |   8 --
> + gdb/x86-linux-nat.c                         |   7 +
> + 38 files changed, 1342 insertions(+), 142 deletions(-)
> + create mode 100644 gdb/features/i386/amd64-avx-mpx-linux.c
> + create mode 100644 gdb/features/i386/amd64-avx-mpx-linux.xml
> + create mode 100644 gdb/features/i386/amd64-avx-mpx.c
> + create mode 100644 gdb/features/i386/amd64-avx-mpx.xml
> + create mode 100644 gdb/features/i386/i386-avx-mpx-linux.c
> + create mode 100644 gdb/features/i386/i386-avx-mpx-linux.xml
> + create mode 100644 gdb/features/i386/i386-avx-mpx.c
> + create mode 100644 gdb/features/i386/i386-avx-mpx.xml
> + create mode 100644 gdb/regformats/i386/amd64-avx-mpx-linux.dat
> + create mode 100644 gdb/regformats/i386/amd64-avx-mpx.dat
> + create mode 100644 gdb/regformats/i386/i386-avx-mpx-linux.dat
> + create mode 100644 gdb/regformats/i386/i386-avx-mpx.dat
> +
> +Index: gdb-7.9.1/gdb/ChangeLog
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/ChangeLog
> ++++ gdb-7.9.1/gdb/ChangeLog
> +@@ -1,3 +1,60 @@
> ++2016-04-14  Walfred Tedeschi  <walfred.tedeschi@intel.com>
> ++
> ++      * features/i386/amd64-mpx-linux.xml: Remove AVX feature.
> ++      * features/i386/amd64-mpx.xml: Remove AVX feature.
> ++      * features/i386/i386-mpx-linux.xml: Remove AVX feature.
> ++      * features/i386/i386-mpx.xml: Remove AVX feature.
> ++      * features/i386/amd64-mpx-linux.c: Regenerate.
> ++      * features/i386/amd64-mpx.c: Regenerate.
> ++      * features/i386/i386-mpx-linux.c: Regenerate.
> ++      * features/i386/i386-mpx.c: Regenerate.
> ++      * regformats/i386/amd64-mpx-linux.dat: Regenerate.
> ++      * regformats/i386/amd64-mpx.dat: Regenerate.
> ++      * regformats/i386/i386-mpx-linux.dat: Regenerate.
> ++      * regformats/i386/i386-mpx.dat: Regenerate.
> ++
> ++2016-04-16  Walfred Tedeschi  <walfred.tedeschi@intel.com>
> ++
> ++      * amd64-linux-tdep.c (features/i386/amd64-avx-mpx-linux.c):
> ++      New include.
> ++      (amd64_linux_core_read_description): Add case for
> ++       X86_XSTATE_AVX_MPX_MASK.
> ++      (_initialize_amd64_linux_tdep): Call
> initialize_tdesc_amd64_avx_mpx_linux.
> ++      * amd64-linux-tdep.h (tdesc_amd64_avx_mpx_linux): New definition.
> ++      * amd64-tdep.c (features/i386/amd64-avx-mpx.c): New include.
> ++      (amd64_target_description): Add case for  X86_XSTATE_AVX_MPX_MASK.
> ++      (_initialize_amd64_tdep): Call initialize_tdesc_amd64_avx_mpx.
> ++      * common/x86-xstate.h (X86_XSTATE_MPX_MASK): Remove AVX bits.
> ++      (X86_XSTATE_AVX_MPX_MASK): New case.
> ++      * features/Makefile (i386/i386-avx-mpx, i386/i386-avx-mpx-linux)
> ++      (i386/amd64-avx-mpx, i386/amd64-avx-mpx-linux): New rules.
> ++      (i386/i386-avx-mpx-expedite, i386/i386-avx-mpx-linux-expedite)
> ++      (i386/amd64-avx-mpx-expedite, i386/amd64-avx-mpx-linux-expedite):
> ++      New expedites.
> ++      * i386-linux-tdep.c (features/i386/i386-avx-mpx-linux.c): New
> ++      include.
> ++      (i386_linux_core_read_description): Add case
> ++      X86_XSTATE_AVX_MPX_MASK.
> ++      (_initialize_i386_linux_tdep): Call
> ++      initialize_tdesc_i386_avx_mpx_linux.
> ++      * i386-linux-tdep.h (tdesc_i386_avx_mpx_linux): New include.
> ++      * i386-tdep.c (features/i386/i386-avx-mpx.c): New include.
> ++      (i386_target_description): Add case for X86_XSTATE_AVX_MPX_MASK.
> ++      * x86-linux-nat.c (x86_linux_read_description): Add case for
> ++      X86_XSTATE_AVX_MPX_MASK.
> ++      * features/i386/amd64-avx-mpx-linux.xml: New file.
> ++      * features/i386/i386-avx-mpx-linux.xml: New file.
> ++      * features/i386/i386-avx-mpx.xml: New file.
> ++      * features/i386/amd64-avx-mpx.xml: New file.
> ++      * features/i386/amd64-avx-mpx-linux.c: Generated.
> ++      * features/i386/amd64-avx-mpx.c: Generated.
> ++      * features/i386/i386-avx-mpx-linux.c: Generated.
> ++      * features/i386/i386-avx-mpx.c: Generated.
> ++      * regformats/i386/amd64-avx-mpx-linux.dat: Generated.
> ++      * regformats/i386/amd64-avx-mpx.dat: Generated.
> ++      * regformats/i386/i386-avx-mpx-linux.dat: Generated.
> ++      * regformats/i386/i386-avx-mpx.dat: Generated.
> ++
> + 2015-05-13  Joel Brobecker  <brobecker@adacore.com>
> +
> +       * version.in: Set GDB version number to 7.9.1.
> +Index: gdb-7.9.1/gdb/amd64-linux-tdep.c
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/amd64-linux-tdep.c
> ++++ gdb-7.9.1/gdb/amd64-linux-tdep.c
> +@@ -41,6 +41,7 @@
> + #include "features/i386/amd64-linux.c"
> + #include "features/i386/amd64-avx-linux.c"
> + #include "features/i386/amd64-mpx-linux.c"
> ++#include "features/i386/amd64-avx-mpx-linux.c"
> + #include "features/i386/amd64-avx512-linux.c"
> +
> + #include "features/i386/x32-linux.c"
> +@@ -1587,6 +1588,11 @@ amd64_linux_core_read_description (struc
> +       return tdesc_x32_avx_linux;  /* No x32 MPX falling back to AVX.  */
> +       else
> +       return tdesc_amd64_mpx_linux;
> ++    case X86_XSTATE_AVX_MPX_MASK:
> ++      if (gdbarch_ptr_bit (gdbarch) == 32)
> ++      return tdesc_x32_avx_linux;  /* No x32 MPX falling back to AVX.  */
> ++      else
> ++      return tdesc_amd64_avx_mpx_linux;
> +     case X86_XSTATE_AVX_MASK:
> +       if (gdbarch_ptr_bit (gdbarch) == 32)
> +       return tdesc_x32_avx_linux;
> +@@ -2134,6 +2140,7 @@ _initialize_amd64_linux_tdep (void)
> +   initialize_tdesc_amd64_linux ();
> +   initialize_tdesc_amd64_avx_linux ();
> +   initialize_tdesc_amd64_mpx_linux ();
> ++  initialize_tdesc_amd64_avx_mpx_linux ();
> +   initialize_tdesc_amd64_avx512_linux ();
> +
> +   initialize_tdesc_x32_linux ();
> +Index: gdb-7.9.1/gdb/amd64-linux-tdep.h
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/amd64-linux-tdep.h
> ++++ gdb-7.9.1/gdb/amd64-linux-tdep.h
> +@@ -35,6 +35,7 @@
> + extern struct target_desc *tdesc_amd64_linux;
> + extern struct target_desc *tdesc_amd64_avx_linux;
> + extern struct target_desc *tdesc_amd64_mpx_linux;
> ++extern struct target_desc *tdesc_amd64_avx_mpx_linux;
> + extern struct target_desc *tdesc_amd64_avx512_linux;
> +
> + extern struct target_desc *tdesc_x32_linux;
> +Index: gdb-7.9.1/gdb/amd64-tdep.c
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/amd64-tdep.c
> ++++ gdb-7.9.1/gdb/amd64-tdep.c
> +@@ -43,6 +43,7 @@
> + #include "features/i386/amd64.c"
> + #include "features/i386/amd64-avx.c"
> + #include "features/i386/amd64-mpx.c"
> ++#include "features/i386/amd64-avx-mpx.c"
> + #include "features/i386/amd64-avx512.c"
> +
> + #include "features/i386/x32.c"
> +@@ -3119,6 +3120,7 @@ _initialize_amd64_tdep (void)
> +   initialize_tdesc_amd64 ();
> +   initialize_tdesc_amd64_avx ();
> +   initialize_tdesc_amd64_mpx ();
> ++  initialize_tdesc_amd64_avx_mpx ();
> +   initialize_tdesc_amd64_avx512 ();
> +
> +   initialize_tdesc_x32 ();
> +Index: gdb-7.9.1/gdb/common/x86-xstate.h
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/common/x86-xstate.h
> ++++ gdb-7.9.1/gdb/common/x86-xstate.h
> +@@ -39,9 +39,10 @@
> + #define X86_XSTATE_X87_MASK   X86_XSTATE_X87
> + #define X86_XSTATE_SSE_MASK   (X86_XSTATE_X87 | X86_XSTATE_SSE)
> + #define X86_XSTATE_AVX_MASK   (X86_XSTATE_SSE_MASK | X86_XSTATE_AVX)
> +-#define X86_XSTATE_MPX_MASK   (X86_XSTATE_AVX_MASK | X86_XSTATE_MPX)
> ++#define X86_XSTATE_MPX_MASK   (X86_XSTATE_SSE_MASK | X86_XSTATE_MPX)
> ++#define X86_XSTATE_AVX_MPX_MASK       (X86_XSTATE_AVX_MASK |
> X86_XSTATE_MPX)
> + #define X86_XSTATE_AVX512_MASK        (X86_XSTATE_AVX_MASK |
> X86_XSTATE_AVX512)
> +-#define X86_XSTATE_MPX_AVX512_MASK (X86_XSTATE_MPX_MASK |
> X86_XSTATE_AVX512)
> ++#define X86_XSTATE_MPX_AVX512_MASK (X86_XSTATE_AVX_MPX_MASK |
> X86_XSTATE_AVX512)
> +
> + #define X86_XSTATE_ALL_MASK   (X86_XSTATE_MPX_AVX512_MASK)
> +
> +Index: gdb-7.9.1/gdb/features/Makefile
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/features/Makefile
> ++++ gdb-7.9.1/gdb/features/Makefile
> +@@ -50,9 +50,11 @@ WHICH = aarch64 \
> +       i386/amd64 i386/amd64-linux \
> +       i386/i386-avx i386/i386-avx-linux \
> +       i386/i386-mpx i386/i386-mpx-linux \
> ++      i386/i386-avx-mpx i386/i386-avx-mpx-linux \
> +       i386/i386-avx512 i386/i386-avx512-linux \
> +       i386/amd64-avx i386/amd64-avx-linux \
> +       i386/amd64-mpx i386/amd64-mpx-linux \
> ++      i386/amd64-avx-mpx i386/amd64-avx-mpx-linux \
> +       i386/amd64-avx512 i386/amd64-avx512-linux \
> +       i386/x32 i386/x32-linux \
> +       i386/x32-avx i386/x32-avx-linux \
> +@@ -82,7 +84,9 @@ i386/amd64-linux-expedite = rbp,rsp,rip
> + i386/i386-avx-expedite = ebp,esp,eip
> + i386/i386-avx-linux-expedite = ebp,esp,eip
> + i386/i386-mpx-expedite = ebp,esp,eip
> ++i386/i386-avx-mpx-expedite = ebp,esp,eip
> + i386/i386-mpx-linux-expedite = ebp,esp,eip
> ++i386/i386-avx-mpx-linux-expedite = ebp,esp,eip
> + i386/i386-avx512-expedite = ebp,esp,eip
> + i386/i386-avx512-linux-expedite = ebp,esp,eip
> + i386/i386-mmx-expedite = ebp,esp,eip
> +@@ -90,7 +94,9 @@ i386/i386-mmx-linux-expedite = ebp,esp,e
> + i386/amd64-avx-expedite = rbp,rsp,rip
> + i386/amd64-avx-linux-expedite = rbp,rsp,rip
> + i386/amd64-mpx-expedite = rbp,rsp,rip
> ++i386/amd64-avx-mpx-expedite = rbp,rsp,rip
> + i386/amd64-mpx-linux-expedite = rbp,rsp,rip
> ++i386/amd64-avx-mpx-linux-expedite = rbp,rsp,rip
> + i386/amd64-avx512-expedite = rbp,rsp,rip
> + i386/amd64-avx512-linux-expedite = rbp,rsp,rip
> + i386/x32-expedite = rbp,rsp,rip
> +@@ -151,6 +157,8 @@ XMLTOC = \
> +       i386/amd64-linux.xml \
> +       i386/amd64-mpx-linux.xml \
> +       i386/amd64-mpx.xml \
> ++      i386/amd64-avx-mpx-linux.xml \
> ++      i386/amd64-avx-mpx.xml \
> +       i386/amd64.xml \
> +       i386/i386-avx-linux.xml \
> +       i386/i386-avx.xml \
> +@@ -161,6 +169,8 @@ XMLTOC = \
> +       i386/i386-mmx.xml \
> +       i386/i386-mpx-linux.xml \
> +       i386/i386-mpx.xml \
> ++      i386/i386-avx-mpx-linux.xml \
> ++      i386/i386-avx-mpx.xml \
> +       i386/i386.xml \
> +       i386/x32-avx-linux.xml \
> +       i386/x32-avx.xml \
> +@@ -266,6 +276,10 @@ $(outdir)/i386/i386-mpx.dat: i386/32bit-
> +                              i386/32bit-mpx.xml
> + $(outdir)/i386/i386-mpx-linux.dat: i386/32bit-core.xml
> i386/32bit-avx.xml \
> +                              i386/32bit-linux.xml i386/32bit-mpx.xml
> ++$(outdir)/i386/i386-mpx-linux.dat: i386/32bit-core.xml \
> ++                             i386/32bit-linux.xml i386/32bit-mpx.xml
> ++$(outdir)/i386/i386-avx-mpx-linux.dat: i386/32bit-core.xml \
> ++                             i386/32bit-linux.xml i386/32bit-mpx.xml
> + $(outdir)/i386/i386-avx512.dat: i386/32bit-core.xml i386/32bit-avx.xml \
> +                              i386/32bit-mpx.xml i386/32bit-avx512.xml
> + $(outdir)/i386/i386-avx512-linux.dat: i386/32bit-core.xml
> i386/32bit-avx.xml \
> +@@ -277,8 +291,12 @@ $(outdir)/i386/amd64-avx-linux.dat: i386
> +                                   i386/64bit-linux.xml
> + $(outdir)/i386/amd64-mpx-linux.dat: i386/64bit-core.xml
> i386/64bit-avx.xml \
> +                              i386/64bit-linux.xml i386/64bit-mpx.xml
> ++$(outdir)/i386/amd64-avx-mpx-linux.dat: i386/64bit-core.xml \
> ++                             i386/64bit-linux.xml i386/64bit-mpx.xml
> + $(outdir)/i386/amd64-mpx.dat: i386/64bit-core.xml i386/64bit-avx.xml \
> +                              i386/64bit-mpx.xml
> ++$(outdir)/i386/amd64-avx-mpx.dat: i386/64bit-core.xml \
> ++                             i386/64bit-mpx.xml
> + $(outdir)/i386/amd64-avx512.dat: i386/64bit-core.xml i386/64bit-avx.xml \
> +                              i386/64bit-mpx.xml i386/64bit-avx512.xml
> + $(outdir)/i386/amd64-avx512-linux.dat: i386/64bit-core.xml
> i386/64bit-avx.xml \
> +Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.c
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.c
> +@@ -0,0 +1,211 @@
> ++/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
> ++  Original: amd64-avx-mpx-linux.xml */
> ++
> ++#include "defs.h"
> ++#include "osabi.h"
> ++#include "target-descriptions.h"
> ++
> ++struct target_desc *tdesc_amd64_avx_mpx_linux;
> ++static void
> ++initialize_tdesc_amd64_avx_mpx_linux (void)
> ++{
> ++  struct target_desc *result = allocate_target_description ();
> ++  struct tdesc_feature *feature;
> ++  struct tdesc_type *field_type;
> ++  struct tdesc_type *type;
> ++
> ++  set_tdesc_architecture (result, bfd_scan_arch ("i386:x86-64"));
> ++
> ++  set_tdesc_osabi (result, osabi_from_tdesc_string ("GNU/Linux"));
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
> ++  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
> ++  tdesc_add_flag (field_type, 0, "CF");
> ++  tdesc_add_flag (field_type, 1, "");
> ++  tdesc_add_flag (field_type, 2, "PF");
> ++  tdesc_add_flag (field_type, 4, "AF");
> ++  tdesc_add_flag (field_type, 6, "ZF");
> ++  tdesc_add_flag (field_type, 7, "SF");
> ++  tdesc_add_flag (field_type, 8, "TF");
> ++  tdesc_add_flag (field_type, 9, "IF");
> ++  tdesc_add_flag (field_type, 10, "DF");
> ++  tdesc_add_flag (field_type, 11, "OF");
> ++  tdesc_add_flag (field_type, 14, "NT");
> ++  tdesc_add_flag (field_type, 16, "RF");
> ++  tdesc_add_flag (field_type, 17, "VM");
> ++  tdesc_add_flag (field_type, 18, "AC");
> ++  tdesc_add_flag (field_type, 19, "VIF");
> ++  tdesc_add_flag (field_type, 20, "VIP");
> ++  tdesc_add_flag (field_type, 21, "ID");
> ++
> ++  tdesc_create_reg (feature, "rax", 0, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rbx", 1, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rcx", 2, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rdx", 3, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rsi", 4, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rdi", 5, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rbp", 6, 1, NULL, 64, "data_ptr");
> ++  tdesc_create_reg (feature, "rsp", 7, 1, NULL, 64, "data_ptr");
> ++  tdesc_create_reg (feature, "r8", 8, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r9", 9, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r10", 10, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r11", 11, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r12", 12, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r13", 13, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r14", 14, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r15", 15, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rip", 16, 1, NULL, 64, "code_ptr");
> ++  tdesc_create_reg (feature, "eflags", 17, 1, NULL, 32, "i386_eflags");
> ++  tdesc_create_reg (feature, "cs", 18, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ss", 19, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ds", 20, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "es", 21, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "fs", 22, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "gs", 23, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "st0", 24, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st1", 25, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st2", 26, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st3", 27, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st4", 28, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st5", 29, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st6", 30, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st7", 31, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "fctrl", 32, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fstat", 33, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "ftag", 34, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fiseg", 35, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fioff", 36, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "foseg", 37, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fooff", 38, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fop", 39, 1, "float", 32, "int");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
> ++  field_type = tdesc_named_type (feature, "ieee_single");
> ++  tdesc_create_vector (feature, "v4f", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "ieee_double");
> ++  tdesc_create_vector (feature, "v2d", field_type, 2);
> ++
> ++  field_type = tdesc_named_type (feature, "int8");
> ++  tdesc_create_vector (feature, "v16i8", field_type, 16);
> ++
> ++  field_type = tdesc_named_type (feature, "int16");
> ++  tdesc_create_vector (feature, "v8i16", field_type, 8);
> ++
> ++  field_type = tdesc_named_type (feature, "int32");
> ++  tdesc_create_vector (feature, "v4i32", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "int64");
> ++  tdesc_create_vector (feature, "v2i64", field_type, 2);
> ++
> ++  type = tdesc_create_union (feature, "vec128");
> ++  field_type = tdesc_named_type (feature, "v4f");
> ++  tdesc_add_field (type, "v4_float", field_type);
> ++  field_type = tdesc_named_type (feature, "v2d");
> ++  tdesc_add_field (type, "v2_double", field_type);
> ++  field_type = tdesc_named_type (feature, "v16i8");
> ++  tdesc_add_field (type, "v16_int8", field_type);
> ++  field_type = tdesc_named_type (feature, "v8i16");
> ++  tdesc_add_field (type, "v8_int16", field_type);
> ++  field_type = tdesc_named_type (feature, "v4i32");
> ++  tdesc_add_field (type, "v4_int32", field_type);
> ++  field_type = tdesc_named_type (feature, "v2i64");
> ++  tdesc_add_field (type, "v2_int64", field_type);
> ++  field_type = tdesc_named_type (feature, "uint128");
> ++  tdesc_add_field (type, "uint128", field_type);
> ++
> ++  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
> ++  tdesc_add_flag (field_type, 0, "IE");
> ++  tdesc_add_flag (field_type, 1, "DE");
> ++  tdesc_add_flag (field_type, 2, "ZE");
> ++  tdesc_add_flag (field_type, 3, "OE");
> ++  tdesc_add_flag (field_type, 4, "UE");
> ++  tdesc_add_flag (field_type, 5, "PE");
> ++  tdesc_add_flag (field_type, 6, "DAZ");
> ++  tdesc_add_flag (field_type, 7, "IM");
> ++  tdesc_add_flag (field_type, 8, "DM");
> ++  tdesc_add_flag (field_type, 9, "ZM");
> ++  tdesc_add_flag (field_type, 10, "OM");
> ++  tdesc_add_flag (field_type, 11, "UM");
> ++  tdesc_add_flag (field_type, 12, "PM");
> ++  tdesc_add_flag (field_type, 15, "FZ");
> ++
> ++  tdesc_create_reg (feature, "xmm0", 40, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm1", 41, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm2", 42, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm3", 43, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm4", 44, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm5", 45, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm6", 46, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm7", 47, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm8", 48, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm9", 49, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm10", 50, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm11", 51, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm12", 52, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm13", 53, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm14", 54, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm15", 55, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "mxcsr", 56, 1, "vector", 32, "i386_mxcsr");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
> ++  tdesc_create_reg (feature, "orig_rax", 57, 1, NULL, 64, "int");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
> ++  tdesc_create_reg (feature, "ymm0h", 58, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm1h", 59, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm2h", 60, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm3h", 61, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm4h", 62, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm5h", 63, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm6h", 64, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm7h", 65, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm8h", 66, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm9h", 67, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm10h", 68, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm11h", 69, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm12h", 70, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm13h", 71, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm14h", 72, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm15h", 73, 1, NULL, 128, "uint128");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
> ++  type = tdesc_create_struct (feature, "br128");
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "lbound", field_type);
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "ubound_raw", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndstatus");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "bde", 2, 63);
> ++  tdesc_add_bitfield (type, "error", 0, 1);
> ++
> ++  type = tdesc_create_union (feature, "status");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndstatus");
> ++  tdesc_add_field (type, "status", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndcfgu");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "base", 12, 63);
> ++  tdesc_add_bitfield (type, "reserved", 2, 11);
> ++  tdesc_add_bitfield (type, "preserved", 1, 1);
> ++  tdesc_add_bitfield (type, "enabled", 0, 0);
> ++
> ++  type = tdesc_create_union (feature, "cfgu");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndcfgu");
> ++  tdesc_add_field (type, "config", field_type);
> ++
> ++  tdesc_create_reg (feature, "bnd0raw", 74, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd1raw", 75, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd2raw", 76, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd3raw", 77, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bndcfgu", 78, 1, NULL, 64, "cfgu");
> ++  tdesc_create_reg (feature, "bndstatus", 79, 1, NULL, 64, "status");
> ++
> ++  tdesc_amd64_avx_mpx_linux = result;
> ++}
> +Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.xml
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.xml
> +@@ -0,0 +1,19 @@
> ++<?xml version="1.0"?>
> ++<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
> ++
> ++     Copying and distribution of this file, with or without modification,
> ++     are permitted in any medium without royalty provided the copyright
> ++     notice and this notice are preserved.  -->
> ++
> ++<!-- AMD64 with AVX and MPX - Includes Linux-only special "register".
> -->
> ++
> ++<!DOCTYPE target SYSTEM "gdb-target.dtd">
> ++<target>
> ++  <architecture>i386:x86-64</architecture>
> ++  <osabi>GNU/Linux</osabi>
> ++  <xi:include href="64bit-core.xml"/>
> ++  <xi:include href="64bit-sse.xml"/>
> ++  <xi:include href="64bit-linux.xml"/>
> ++  <xi:include href="64bit-avx.xml"/>
> ++  <xi:include href="64bit-mpx.xml"/>
> ++</target>
> +Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.c
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.c
> +@@ -0,0 +1,206 @@
> ++/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
> ++  Original: amd64-avx-mpx.xml */
> ++
> ++#include "defs.h"
> ++#include "osabi.h"
> ++#include "target-descriptions.h"
> ++
> ++struct target_desc *tdesc_amd64_avx_mpx;
> ++static void
> ++initialize_tdesc_amd64_avx_mpx (void)
> ++{
> ++  struct target_desc *result = allocate_target_description ();
> ++  struct tdesc_feature *feature;
> ++  struct tdesc_type *field_type;
> ++  struct tdesc_type *type;
> ++
> ++  set_tdesc_architecture (result, bfd_scan_arch ("i386:x86-64"));
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
> ++  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
> ++  tdesc_add_flag (field_type, 0, "CF");
> ++  tdesc_add_flag (field_type, 1, "");
> ++  tdesc_add_flag (field_type, 2, "PF");
> ++  tdesc_add_flag (field_type, 4, "AF");
> ++  tdesc_add_flag (field_type, 6, "ZF");
> ++  tdesc_add_flag (field_type, 7, "SF");
> ++  tdesc_add_flag (field_type, 8, "TF");
> ++  tdesc_add_flag (field_type, 9, "IF");
> ++  tdesc_add_flag (field_type, 10, "DF");
> ++  tdesc_add_flag (field_type, 11, "OF");
> ++  tdesc_add_flag (field_type, 14, "NT");
> ++  tdesc_add_flag (field_type, 16, "RF");
> ++  tdesc_add_flag (field_type, 17, "VM");
> ++  tdesc_add_flag (field_type, 18, "AC");
> ++  tdesc_add_flag (field_type, 19, "VIF");
> ++  tdesc_add_flag (field_type, 20, "VIP");
> ++  tdesc_add_flag (field_type, 21, "ID");
> ++
> ++  tdesc_create_reg (feature, "rax", 0, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rbx", 1, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rcx", 2, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rdx", 3, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rsi", 4, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rdi", 5, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rbp", 6, 1, NULL, 64, "data_ptr");
> ++  tdesc_create_reg (feature, "rsp", 7, 1, NULL, 64, "data_ptr");
> ++  tdesc_create_reg (feature, "r8", 8, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r9", 9, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r10", 10, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r11", 11, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r12", 12, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r13", 13, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r14", 14, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "r15", 15, 1, NULL, 64, "int64");
> ++  tdesc_create_reg (feature, "rip", 16, 1, NULL, 64, "code_ptr");
> ++  tdesc_create_reg (feature, "eflags", 17, 1, NULL, 32, "i386_eflags");
> ++  tdesc_create_reg (feature, "cs", 18, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ss", 19, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ds", 20, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "es", 21, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "fs", 22, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "gs", 23, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "st0", 24, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st1", 25, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st2", 26, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st3", 27, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st4", 28, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st5", 29, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st6", 30, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st7", 31, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "fctrl", 32, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fstat", 33, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "ftag", 34, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fiseg", 35, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fioff", 36, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "foseg", 37, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fooff", 38, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fop", 39, 1, "float", 32, "int");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
> ++  field_type = tdesc_named_type (feature, "ieee_single");
> ++  tdesc_create_vector (feature, "v4f", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "ieee_double");
> ++  tdesc_create_vector (feature, "v2d", field_type, 2);
> ++
> ++  field_type = tdesc_named_type (feature, "int8");
> ++  tdesc_create_vector (feature, "v16i8", field_type, 16);
> ++
> ++  field_type = tdesc_named_type (feature, "int16");
> ++  tdesc_create_vector (feature, "v8i16", field_type, 8);
> ++
> ++  field_type = tdesc_named_type (feature, "int32");
> ++  tdesc_create_vector (feature, "v4i32", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "int64");
> ++  tdesc_create_vector (feature, "v2i64", field_type, 2);
> ++
> ++  type = tdesc_create_union (feature, "vec128");
> ++  field_type = tdesc_named_type (feature, "v4f");
> ++  tdesc_add_field (type, "v4_float", field_type);
> ++  field_type = tdesc_named_type (feature, "v2d");
> ++  tdesc_add_field (type, "v2_double", field_type);
> ++  field_type = tdesc_named_type (feature, "v16i8");
> ++  tdesc_add_field (type, "v16_int8", field_type);
> ++  field_type = tdesc_named_type (feature, "v8i16");
> ++  tdesc_add_field (type, "v8_int16", field_type);
> ++  field_type = tdesc_named_type (feature, "v4i32");
> ++  tdesc_add_field (type, "v4_int32", field_type);
> ++  field_type = tdesc_named_type (feature, "v2i64");
> ++  tdesc_add_field (type, "v2_int64", field_type);
> ++  field_type = tdesc_named_type (feature, "uint128");
> ++  tdesc_add_field (type, "uint128", field_type);
> ++
> ++  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
> ++  tdesc_add_flag (field_type, 0, "IE");
> ++  tdesc_add_flag (field_type, 1, "DE");
> ++  tdesc_add_flag (field_type, 2, "ZE");
> ++  tdesc_add_flag (field_type, 3, "OE");
> ++  tdesc_add_flag (field_type, 4, "UE");
> ++  tdesc_add_flag (field_type, 5, "PE");
> ++  tdesc_add_flag (field_type, 6, "DAZ");
> ++  tdesc_add_flag (field_type, 7, "IM");
> ++  tdesc_add_flag (field_type, 8, "DM");
> ++  tdesc_add_flag (field_type, 9, "ZM");
> ++  tdesc_add_flag (field_type, 10, "OM");
> ++  tdesc_add_flag (field_type, 11, "UM");
> ++  tdesc_add_flag (field_type, 12, "PM");
> ++  tdesc_add_flag (field_type, 15, "FZ");
> ++
> ++  tdesc_create_reg (feature, "xmm0", 40, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm1", 41, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm2", 42, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm3", 43, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm4", 44, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm5", 45, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm6", 46, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm7", 47, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm8", 48, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm9", 49, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm10", 50, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm11", 51, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm12", 52, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm13", 53, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm14", 54, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm15", 55, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "mxcsr", 56, 1, "vector", 32, "i386_mxcsr");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
> ++  tdesc_create_reg (feature, "ymm0h", 57, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm1h", 58, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm2h", 59, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm3h", 60, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm4h", 61, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm5h", 62, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm6h", 63, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm7h", 64, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm8h", 65, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm9h", 66, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm10h", 67, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm11h", 68, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm12h", 69, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm13h", 70, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm14h", 71, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm15h", 72, 1, NULL, 128, "uint128");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
> ++  type = tdesc_create_struct (feature, "br128");
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "lbound", field_type);
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "ubound_raw", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndstatus");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "bde", 2, 63);
> ++  tdesc_add_bitfield (type, "error", 0, 1);
> ++
> ++  type = tdesc_create_union (feature, "status");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndstatus");
> ++  tdesc_add_field (type, "status", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndcfgu");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "base", 12, 63);
> ++  tdesc_add_bitfield (type, "reserved", 2, 11);
> ++  tdesc_add_bitfield (type, "preserved", 1, 1);
> ++  tdesc_add_bitfield (type, "enabled", 0, 0);
> ++
> ++  type = tdesc_create_union (feature, "cfgu");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndcfgu");
> ++  tdesc_add_field (type, "config", field_type);
> ++
> ++  tdesc_create_reg (feature, "bnd0raw", 73, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd1raw", 74, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd2raw", 75, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd3raw", 76, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bndcfgu", 77, 1, NULL, 64, "cfgu");
> ++  tdesc_create_reg (feature, "bndstatus", 78, 1, NULL, 64, "status");
> ++
> ++  tdesc_amd64_avx_mpx = result;
> ++}
> +Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.xml
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.xml
> +@@ -0,0 +1,17 @@
> ++<?xml version="1.0"?>
> ++<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
> ++
> ++     Copying and distribution of this file, with or without modification,
> ++     are permitted in any medium without royalty provided the copyright
> ++     notice and this notice are preserved.  -->
> ++
> ++<!-- AMD64 with AVX and MPX -->
> ++
> ++<!DOCTYPE target SYSTEM "gdb-target.dtd">
> ++<target>
> ++  <architecture>i386:x86-64</architecture>
> ++  <xi:include href="64bit-core.xml"/>
> ++  <xi:include href="64bit-sse.xml"/>
> ++  <xi:include href="64bit-avx.xml"/>
> ++  <xi:include href="64bit-mpx.xml"/>
> ++</target>
> +Index: gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.c
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx-linux.c
> ++++ gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.c
> +@@ -151,24 +151,6 @@ initialize_tdesc_amd64_mpx_linux (void)
> +   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
> +   tdesc_create_reg (feature, "orig_rax", 57, 1, NULL, 64, "int");
> +
> +-  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
> +-  tdesc_create_reg (feature, "ymm0h", 58, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm1h", 59, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm2h", 60, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm3h", 61, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm4h", 62, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm5h", 63, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm6h", 64, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm7h", 65, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm8h", 66, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm9h", 67, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm10h", 68, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm11h", 69, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm12h", 70, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm13h", 71, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm14h", 72, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm15h", 73, 1, NULL, 128, "uint128");
> +-
> +   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
> +   type = tdesc_create_struct (feature, "br128");
> +   field_type = tdesc_named_type (feature, "uint64");
> +@@ -200,12 +182,12 @@ initialize_tdesc_amd64_mpx_linux (void)
> +   field_type = tdesc_named_type (feature, "_bndcfgu");
> +   tdesc_add_field (type, "config", field_type);
> +
> +-  tdesc_create_reg (feature, "bnd0raw", 74, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bnd1raw", 75, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bnd2raw", 76, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bnd3raw", 77, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bndcfgu", 78, 1, NULL, 64, "cfgu");
> +-  tdesc_create_reg (feature, "bndstatus", 79, 1, NULL, 64, "status");
> ++  tdesc_create_reg (feature, "bnd0raw", 58, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd1raw", 59, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd2raw", 60, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd3raw", 61, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bndcfgu", 62, 1, NULL, 64, "cfgu");
> ++  tdesc_create_reg (feature, "bndstatus", 63, 1, NULL, 64, "status");
> +
> +   tdesc_amd64_mpx_linux = result;
> + }
> +Index: gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.xml
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx-linux.xml
> ++++ gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.xml
> +@@ -14,6 +14,5 @@
> +   <xi:include href="64bit-core.xml"/>
> +   <xi:include href="64bit-sse.xml"/>
> +   <xi:include href="64bit-linux.xml"/>
> +-  <xi:include href="64bit-avx.xml"/>
> +   <xi:include href="64bit-mpx.xml"/>
> + </target>
> +Index: gdb-7.9.1/gdb/features/i386/amd64-mpx.c
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx.c
> ++++ gdb-7.9.1/gdb/features/i386/amd64-mpx.c
> +@@ -146,24 +146,6 @@ initialize_tdesc_amd64_mpx (void)
> +   tdesc_create_reg (feature, "xmm15", 55, 1, NULL, 128, "vec128");
> +   tdesc_create_reg (feature, "mxcsr", 56, 1, "vector", 32, "i386_mxcsr");
> +
> +-  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
> +-  tdesc_create_reg (feature, "ymm0h", 57, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm1h", 58, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm2h", 59, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm3h", 60, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm4h", 61, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm5h", 62, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm6h", 63, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm7h", 64, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm8h", 65, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm9h", 66, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm10h", 67, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm11h", 68, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm12h", 69, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm13h", 70, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm14h", 71, 1, NULL, 128, "uint128");
> +-  tdesc_create_reg (feature, "ymm15h", 72, 1, NULL, 128, "uint128");
> +-
> +   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
> +   type = tdesc_create_struct (feature, "br128");
> +   field_type = tdesc_named_type (feature, "uint64");
> +@@ -195,12 +177,12 @@ initialize_tdesc_amd64_mpx (void)
> +   field_type = tdesc_named_type (feature, "_bndcfgu");
> +   tdesc_add_field (type, "config", field_type);
> +
> +-  tdesc_create_reg (feature, "bnd0raw", 73, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bnd1raw", 74, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bnd2raw", 75, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bnd3raw", 76, 1, NULL, 128, "br128");
> +-  tdesc_create_reg (feature, "bndcfgu", 77, 1, NULL, 64, "cfgu");
> +-  tdesc_create_reg (feature, "bndstatus", 78, 1, NULL, 64, "status");
> ++  tdesc_create_reg (feature, "bnd0raw", 57, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd1raw", 58, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd2raw", 59, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd3raw", 60, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bndcfgu", 61, 1, NULL, 64, "cfgu");
> ++  tdesc_create_reg (feature, "bndstatus", 62, 1, NULL, 64, "status");
> +
> +   tdesc_amd64_mpx = result;
> + }
> +Index: gdb-7.9.1/gdb/features/i386/amd64-mpx.xml
> +===================================================================
> +--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx.xml
> ++++ gdb-7.9.1/gdb/features/i386/amd64-mpx.xml
> +@@ -12,6 +12,5 @@
> +   <architecture>i386:x86-64</architecture>
> +   <xi:include href="64bit-core.xml"/>
> +   <xi:include href="64bit-sse.xml"/>
> +-  <xi:include href="64bit-avx.xml"/>
> +   <xi:include href="64bit-mpx.xml"/>
> + </target>
> +Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.c
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.c
> +@@ -0,0 +1,187 @@
> ++/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
> ++  Original: i386-avx-mpx-linux.xml */
> ++
> ++#include "defs.h"
> ++#include "osabi.h"
> ++#include "target-descriptions.h"
> ++
> ++struct target_desc *tdesc_i386_avx_mpx_linux;
> ++static void
> ++initialize_tdesc_i386_avx_mpx_linux (void)
> ++{
> ++  struct target_desc *result = allocate_target_description ();
> ++  struct tdesc_feature *feature;
> ++  struct tdesc_type *field_type;
> ++  struct tdesc_type *type;
> ++
> ++  set_tdesc_architecture (result, bfd_scan_arch ("i386"));
> ++
> ++  set_tdesc_osabi (result, osabi_from_tdesc_string ("GNU/Linux"));
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
> ++  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
> ++  tdesc_add_flag (field_type, 0, "CF");
> ++  tdesc_add_flag (field_type, 1, "");
> ++  tdesc_add_flag (field_type, 2, "PF");
> ++  tdesc_add_flag (field_type, 4, "AF");
> ++  tdesc_add_flag (field_type, 6, "ZF");
> ++  tdesc_add_flag (field_type, 7, "SF");
> ++  tdesc_add_flag (field_type, 8, "TF");
> ++  tdesc_add_flag (field_type, 9, "IF");
> ++  tdesc_add_flag (field_type, 10, "DF");
> ++  tdesc_add_flag (field_type, 11, "OF");
> ++  tdesc_add_flag (field_type, 14, "NT");
> ++  tdesc_add_flag (field_type, 16, "RF");
> ++  tdesc_add_flag (field_type, 17, "VM");
> ++  tdesc_add_flag (field_type, 18, "AC");
> ++  tdesc_add_flag (field_type, 19, "VIF");
> ++  tdesc_add_flag (field_type, 20, "VIP");
> ++  tdesc_add_flag (field_type, 21, "ID");
> ++
> ++  tdesc_create_reg (feature, "eax", 0, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ecx", 1, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "edx", 2, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ebx", 3, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "esp", 4, 1, NULL, 32, "data_ptr");
> ++  tdesc_create_reg (feature, "ebp", 5, 1, NULL, 32, "data_ptr");
> ++  tdesc_create_reg (feature, "esi", 6, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "edi", 7, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "eip", 8, 1, NULL, 32, "code_ptr");
> ++  tdesc_create_reg (feature, "eflags", 9, 1, NULL, 32, "i386_eflags");
> ++  tdesc_create_reg (feature, "cs", 10, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ss", 11, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ds", 12, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "es", 13, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "fs", 14, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "gs", 15, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "st0", 16, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st1", 17, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st2", 18, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st3", 19, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st4", 20, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st5", 21, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st6", 22, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st7", 23, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "fctrl", 24, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fstat", 25, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "ftag", 26, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fiseg", 27, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fioff", 28, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "foseg", 29, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fooff", 30, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fop", 31, 1, "float", 32, "int");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
> ++  field_type = tdesc_named_type (feature, "ieee_single");
> ++  tdesc_create_vector (feature, "v4f", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "ieee_double");
> ++  tdesc_create_vector (feature, "v2d", field_type, 2);
> ++
> ++  field_type = tdesc_named_type (feature, "int8");
> ++  tdesc_create_vector (feature, "v16i8", field_type, 16);
> ++
> ++  field_type = tdesc_named_type (feature, "int16");
> ++  tdesc_create_vector (feature, "v8i16", field_type, 8);
> ++
> ++  field_type = tdesc_named_type (feature, "int32");
> ++  tdesc_create_vector (feature, "v4i32", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "int64");
> ++  tdesc_create_vector (feature, "v2i64", field_type, 2);
> ++
> ++  type = tdesc_create_union (feature, "vec128");
> ++  field_type = tdesc_named_type (feature, "v4f");
> ++  tdesc_add_field (type, "v4_float", field_type);
> ++  field_type = tdesc_named_type (feature, "v2d");
> ++  tdesc_add_field (type, "v2_double", field_type);
> ++  field_type = tdesc_named_type (feature, "v16i8");
> ++  tdesc_add_field (type, "v16_int8", field_type);
> ++  field_type = tdesc_named_type (feature, "v8i16");
> ++  tdesc_add_field (type, "v8_int16", field_type);
> ++  field_type = tdesc_named_type (feature, "v4i32");
> ++  tdesc_add_field (type, "v4_int32", field_type);
> ++  field_type = tdesc_named_type (feature, "v2i64");
> ++  tdesc_add_field (type, "v2_int64", field_type);
> ++  field_type = tdesc_named_type (feature, "uint128");
> ++  tdesc_add_field (type, "uint128", field_type);
> ++
> ++  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
> ++  tdesc_add_flag (field_type, 0, "IE");
> ++  tdesc_add_flag (field_type, 1, "DE");
> ++  tdesc_add_flag (field_type, 2, "ZE");
> ++  tdesc_add_flag (field_type, 3, "OE");
> ++  tdesc_add_flag (field_type, 4, "UE");
> ++  tdesc_add_flag (field_type, 5, "PE");
> ++  tdesc_add_flag (field_type, 6, "DAZ");
> ++  tdesc_add_flag (field_type, 7, "IM");
> ++  tdesc_add_flag (field_type, 8, "DM");
> ++  tdesc_add_flag (field_type, 9, "ZM");
> ++  tdesc_add_flag (field_type, 10, "OM");
> ++  tdesc_add_flag (field_type, 11, "UM");
> ++  tdesc_add_flag (field_type, 12, "PM");
> ++  tdesc_add_flag (field_type, 15, "FZ");
> ++
> ++  tdesc_create_reg (feature, "xmm0", 32, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm1", 33, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm2", 34, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm3", 35, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm4", 36, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm5", 37, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm6", 38, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm7", 39, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "mxcsr", 40, 1, "vector", 32, "i386_mxcsr");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
> ++  tdesc_create_reg (feature, "orig_eax", 41, 1, NULL, 32, "int");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
> ++  tdesc_create_reg (feature, "ymm0h", 42, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm1h", 43, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm2h", 44, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm3h", 45, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm4h", 46, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm5h", 47, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm6h", 48, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm7h", 49, 1, NULL, 128, "uint128");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
> ++  type = tdesc_create_struct (feature, "br128");
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "lbound", field_type);
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "ubound_raw", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndstatus");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "bde", 2, 31);
> ++  tdesc_add_bitfield (type, "error", 0, 1);
> ++
> ++  type = tdesc_create_union (feature, "status");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndstatus");
> ++  tdesc_add_field (type, "status", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndcfgu");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "base", 12, 31);
> ++  tdesc_add_bitfield (type, "reserved", 2, 11);
> ++  tdesc_add_bitfield (type, "preserved", 1, 1);
> ++  tdesc_add_bitfield (type, "enabled", 0, 1);
> ++
> ++  type = tdesc_create_union (feature, "cfgu");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndcfgu");
> ++  tdesc_add_field (type, "config", field_type);
> ++
> ++  tdesc_create_reg (feature, "bnd0raw", 50, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd1raw", 51, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd2raw", 52, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd3raw", 53, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bndcfgu", 54, 1, NULL, 64, "cfgu");
> ++  tdesc_create_reg (feature, "bndstatus", 55, 1, NULL, 64, "status");
> ++
> ++  tdesc_i386_avx_mpx_linux = result;
> ++}
> +Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.xml
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.xml
> +@@ -0,0 +1,19 @@
> ++<?xml version="1.0"?>
> ++<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
> ++
> ++     Copying and distribution of this file, with or without modification,
> ++     are permitted in any medium without royalty provided the copyright
> ++     notice and this notice are preserved.  -->
> ++
> ++<!-- I386 with AVX and MPX- Includes Linux-only special "register".  -->
> ++
> ++<!DOCTYPE target SYSTEM "gdb-target.dtd">
> ++<target>
> ++  <architecture>i386</architecture>
> ++  <osabi>GNU/Linux</osabi>
> ++  <xi:include href="32bit-core.xml"/>
> ++  <xi:include href="32bit-sse.xml"/>
> ++  <xi:include href="32bit-linux.xml"/>
> ++  <xi:include href="32bit-avx.xml"/>
> ++  <xi:include href="32bit-mpx.xml"/>
> ++</target>
> +Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx.c
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx.c
> +@@ -0,0 +1,182 @@
> ++/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
> ++  Original: i386-avx-mpx.xml */
> ++
> ++#include "defs.h"
> ++#include "osabi.h"
> ++#include "target-descriptions.h"
> ++
> ++struct target_desc *tdesc_i386_avx_mpx;
> ++static void
> ++initialize_tdesc_i386_avx_mpx (void)
> ++{
> ++  struct target_desc *result = allocate_target_description ();
> ++  struct tdesc_feature *feature;
> ++  struct tdesc_type *field_type;
> ++  struct tdesc_type *type;
> ++
> ++  set_tdesc_architecture (result, bfd_scan_arch ("i386"));
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
> ++  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
> ++  tdesc_add_flag (field_type, 0, "CF");
> ++  tdesc_add_flag (field_type, 1, "");
> ++  tdesc_add_flag (field_type, 2, "PF");
> ++  tdesc_add_flag (field_type, 4, "AF");
> ++  tdesc_add_flag (field_type, 6, "ZF");
> ++  tdesc_add_flag (field_type, 7, "SF");
> ++  tdesc_add_flag (field_type, 8, "TF");
> ++  tdesc_add_flag (field_type, 9, "IF");
> ++  tdesc_add_flag (field_type, 10, "DF");
> ++  tdesc_add_flag (field_type, 11, "OF");
> ++  tdesc_add_flag (field_type, 14, "NT");
> ++  tdesc_add_flag (field_type, 16, "RF");
> ++  tdesc_add_flag (field_type, 17, "VM");
> ++  tdesc_add_flag (field_type, 18, "AC");
> ++  tdesc_add_flag (field_type, 19, "VIF");
> ++  tdesc_add_flag (field_type, 20, "VIP");
> ++  tdesc_add_flag (field_type, 21, "ID");
> ++
> ++  tdesc_create_reg (feature, "eax", 0, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ecx", 1, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "edx", 2, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ebx", 3, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "esp", 4, 1, NULL, 32, "data_ptr");
> ++  tdesc_create_reg (feature, "ebp", 5, 1, NULL, 32, "data_ptr");
> ++  tdesc_create_reg (feature, "esi", 6, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "edi", 7, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "eip", 8, 1, NULL, 32, "code_ptr");
> ++  tdesc_create_reg (feature, "eflags", 9, 1, NULL, 32, "i386_eflags");
> ++  tdesc_create_reg (feature, "cs", 10, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ss", 11, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "ds", 12, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "es", 13, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "fs", 14, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "gs", 15, 1, NULL, 32, "int32");
> ++  tdesc_create_reg (feature, "st0", 16, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st1", 17, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st2", 18, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st3", 19, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st4", 20, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st5", 21, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st6", 22, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "st7", 23, 1, NULL, 80, "i387_ext");
> ++  tdesc_create_reg (feature, "fctrl", 24, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fstat", 25, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "ftag", 26, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fiseg", 27, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fioff", 28, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "foseg", 29, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fooff", 30, 1, "float", 32, "int");
> ++  tdesc_create_reg (feature, "fop", 31, 1, "float", 32, "int");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
> ++  field_type = tdesc_named_type (feature, "ieee_single");
> ++  tdesc_create_vector (feature, "v4f", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "ieee_double");
> ++  tdesc_create_vector (feature, "v2d", field_type, 2);
> ++
> ++  field_type = tdesc_named_type (feature, "int8");
> ++  tdesc_create_vector (feature, "v16i8", field_type, 16);
> ++
> ++  field_type = tdesc_named_type (feature, "int16");
> ++  tdesc_create_vector (feature, "v8i16", field_type, 8);
> ++
> ++  field_type = tdesc_named_type (feature, "int32");
> ++  tdesc_create_vector (feature, "v4i32", field_type, 4);
> ++
> ++  field_type = tdesc_named_type (feature, "int64");
> ++  tdesc_create_vector (feature, "v2i64", field_type, 2);
> ++
> ++  type = tdesc_create_union (feature, "vec128");
> ++  field_type = tdesc_named_type (feature, "v4f");
> ++  tdesc_add_field (type, "v4_float", field_type);
> ++  field_type = tdesc_named_type (feature, "v2d");
> ++  tdesc_add_field (type, "v2_double", field_type);
> ++  field_type = tdesc_named_type (feature, "v16i8");
> ++  tdesc_add_field (type, "v16_int8", field_type);
> ++  field_type = tdesc_named_type (feature, "v8i16");
> ++  tdesc_add_field (type, "v8_int16", field_type);
> ++  field_type = tdesc_named_type (feature, "v4i32");
> ++  tdesc_add_field (type, "v4_int32", field_type);
> ++  field_type = tdesc_named_type (feature, "v2i64");
> ++  tdesc_add_field (type, "v2_int64", field_type);
> ++  field_type = tdesc_named_type (feature, "uint128");
> ++  tdesc_add_field (type, "uint128", field_type);
> ++
> ++  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
> ++  tdesc_add_flag (field_type, 0, "IE");
> ++  tdesc_add_flag (field_type, 1, "DE");
> ++  tdesc_add_flag (field_type, 2, "ZE");
> ++  tdesc_add_flag (field_type, 3, "OE");
> ++  tdesc_add_flag (field_type, 4, "UE");
> ++  tdesc_add_flag (field_type, 5, "PE");
> ++  tdesc_add_flag (field_type, 6, "DAZ");
> ++  tdesc_add_flag (field_type, 7, "IM");
> ++  tdesc_add_flag (field_type, 8, "DM");
> ++  tdesc_add_flag (field_type, 9, "ZM");
> ++  tdesc_add_flag (field_type, 10, "OM");
> ++  tdesc_add_flag (field_type, 11, "UM");
> ++  tdesc_add_flag (field_type, 12, "PM");
> ++  tdesc_add_flag (field_type, 15, "FZ");
> ++
> ++  tdesc_create_reg (feature, "xmm0", 32, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm1", 33, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm2", 34, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm3", 35, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm4", 36, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm5", 37, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm6", 38, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "xmm7", 39, 1, NULL, 128, "vec128");
> ++  tdesc_create_reg (feature, "mxcsr", 40, 1, "vector", 32, "i386_mxcsr");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
> ++  tdesc_create_reg (feature, "ymm0h", 41, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm1h", 42, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm2h", 43, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm3h", 44, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm4h", 45, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm5h", 46, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm6h", 47, 1, NULL, 128, "uint128");
> ++  tdesc_create_reg (feature, "ymm7h", 48, 1, NULL, 128, "uint128");
> ++
> ++  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
> ++  type = tdesc_create_struct (feature, "br128");
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "lbound", field_type);
> ++  field_type = tdesc_named_type (feature, "uint64");
> ++  tdesc_add_field (type, "ubound_raw", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndstatus");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "bde", 2, 31);
> ++  tdesc_add_bitfield (type, "error", 0, 1);
> ++
> ++  type = tdesc_create_union (feature, "status");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndstatus");
> ++  tdesc_add_field (type, "status", field_type);
> ++
> ++  type = tdesc_create_struct (feature, "_bndcfgu");
> ++  tdesc_set_struct_size (type, 8);
> ++  tdesc_add_bitfield (type, "base", 12, 31);
> ++  tdesc_add_bitfield (type, "reserved", 2, 11);
> ++  tdesc_add_bitfield (type, "preserved", 1, 1);
> ++  tdesc_add_bitfield (type, "enabled", 0, 1);
> ++
> ++  type = tdesc_create_union (feature, "cfgu");
> ++  field_type = tdesc_named_type (feature, "data_ptr");
> ++  tdesc_add_field (type, "raw", field_type);
> ++  field_type = tdesc_named_type (feature, "_bndcfgu");
> ++  tdesc_add_field (type, "config", field_type);
> ++
> ++  tdesc_create_reg (feature, "bnd0raw", 49, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd1raw", 50, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd2raw", 51, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bnd3raw", 52, 1, NULL, 128, "br128");
> ++  tdesc_create_reg (feature, "bndcfgu", 53, 1, NULL, 64, "cfgu");
> ++  tdesc_create_reg (feature, "bndstatus", 54, 1, NULL, 64, "status");
> ++
> ++  tdesc_i386_avx_mpx = result;
> ++}
> +Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx.xml
> +===================================================================
> +--- /dev/null
> ++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx.xml
> +@@ -0,0 +1,17 @@
> ++<?xml version="1.0"?>
> ++<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
> ++
> ++     Copying and distribution of this file, with or without modification,
> ++     are permitted in any medium without royalty provided the copyright
> ++     notice and this notice are preserved.  -->
> ++
> ++<!-- I386 with AVX and MPX -->
> ++
> ++<!DOCTYPE target SYSTEM "gdb-target.dtd">
> ++<target>
> ++  <architecture>i386</architecture>
> ++  <xi:include href="32bit-core.xml"/>
> ++  <xi:include href="32bit-sse.xml"/>
> ++  <xi:include href="32bit-avx.xml"/>
> ++  --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11399e2e5f9b940532f5e7c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, May 15, 2016, Saul Wold &lt;<a href=3D"mailto:sgw@linux.=
intel.com">sgw@linux.intel.com</a>&gt; wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">The current MPX target descriptions assume that MPX is always combined=
<br>
with AVX, however that&#39;s not correct.=C2=A0 We can have machines with M=
PX<br>
and without AVX; or machines with AVX and without MPX.<br>
<br>
This patch adds new target descriptions for machines that support<br>
both MPX and AVX, as duplicates of the existing MPX descriptions.<br>
<br>
The following commit will remove AVX from the MPX-only descriptions.<br>
<br>
This commit is backported from 7.12</blockquote><div><br></div><div>Master =
branch should need this fix too=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Saul Wold &lt;<a>sgw@linux.intel.com</a>&gt;<br>
---<br>
This is Jethro Only since it has a different version of GDB and this<br>
patch is version specific.<br>
<br>
=C2=A0meta/recipes-devtools/gdb/gdb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../0001-Add-target-descriptions-for-AVX-MPX.patch | 2153 +++++++++++=
+++++++++<br>
=C2=A02 files changed, 2155 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Add-target-desc=
riptions-for-AVX-MPX.patch<br>
<br>
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc<br>
index 88c0213..58326a3 100644<br>
--- a/meta/recipes-devtools/gdb/gdb.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb.inc<br>
@@ -5,7 +5,9 @@ inherit gettext<br>
=C2=A0SRC_URI +=3D &quot;file://0002-Change-order-of-CFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Add-support-for=
-Renesas-SH-sh4-architecture.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-detection-of-64-=
bit-PPC-inferior-in-gdbserver.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-target-descripti=
ons-for-AVX-MPX.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0#LDFLAGS_append =3D &quot; -s&quot;<br>
=C2=A0#export CFLAGS_append=3D&quot; -L${STAGING_LIBDIR}&quot;<br>
<br>
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions-for=
-AVX-MPX.patch b/meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions=
-for-AVX-MPX.patch<br>
new file mode 100644<br>
index 0000000..043ff45<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gdb/gdb/0001-Add-target-descriptions-for-AVX-MP=
X.patch<br>
@@ -0,0 +1,2153 @@<br>
+From 15c429945dc4674b62e6b956c0ba9059206055ed Mon Sep 17 00:00:00 2001<br>
+From: Walfred Tedeschi &lt;<a>walfred.tedeschi@intel.com</a>&gt;<br>
+Date: Fri, 13 May 2016 15:36:43 +0200<br>
+Subject: [PATCH 1/1] Add target descriptions for AVX + MPX<br>
+<br>
+The current MPX target descriptions assume that MPX is always combined<br>
+with AVX, however that&#39;s not correct.=C2=A0 We can have machines with =
MPX<br>
+and without AVX; or machines with AVX and without MPX.<br>
+<br>
+This patch adds new target descriptions for machines that support<br>
+both MPX and AVX, as duplicates of the existing MPX descriptions.<br>
+<br>
+The following commit will remove AVX from the MPX-only descriptions.<br>
+<br>
+2016-04-16=C2=A0 Walfred Tedeschi=C2=A0 &lt;<a>walfred.tedeschi@intel.com<=
/a>&gt;<br>
+<br>
+gdb/ChangeLog:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* amd64-linux-tdep.c (features/i386/amd64-avx-m=
px-linux.c):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0New include.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(amd64_linux_core_read_description): Add case f=
or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 X86_XSTATE_AVX_MPX_MASK.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(_initialize_amd64_linux_tdep): Call initialize=
_tdesc_amd64_avx_mpx_linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* amd64-linux-tdep.h (tdesc_amd64_avx_mpx_linux=
): New definition.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* amd64-tdep.c (features/i386/amd64-avx-mpx.c):=
 New include.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(amd64_target_description): Add case for=C2=A0 =
X86_XSTATE_AVX_MPX_MASK.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(_initialize_amd64_tdep): Call initialize_tdesc=
_amd64_avx_mpx.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* common/x86-xstate.h (X86_XSTATE_MPX_MASK): Re=
move AVX bits.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(X86_XSTATE_AVX_MPX_MASK): New case.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/Makefile (i386/i386-avx-mpx, i386/i3=
86-avx-mpx-linux)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(i386/amd64-avx-mpx, i386/amd64-avx-mpx-linux):=
 New rules.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(i386/i386-avx-mpx-expedite, i386/i386-avx-mpx-=
linux-expedite)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(i386/amd64-avx-mpx-expedite, i386/amd64-avx-mp=
x-linux-expedite):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0New expedites.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* i386-linux-tdep.c (features/i386/i386-avx-mpx=
-linux.c): New<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0include.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(i386_linux_core_read_description): Add case<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0X86_XSTATE_AVX_MPX_MASK.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(_initialize_i386_linux_tdep): Call<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0initialize_tdesc_i386_avx_mpx_linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* i386-linux-tdep.h (tdesc_i386_avx_mpx_linux):=
 New include.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* i386-tdep.c (features/i386/i386-avx-mpx.c): N=
ew include.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(i386_target_description): Add case for X86_XST=
ATE_AVX_MPX_MASK.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* x86-linux-nat.c (x86_linux_read_description):=
 Add case for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0X86_XSTATE_AVX_MPX_MASK.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/amd64-avx-mpx-linux.xml: New fi=
le.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/i386-avx-mpx-linux.xml: New fil=
e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/i386-avx-mpx.xml: New file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/amd64-avx-mpx.xml: New file.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/amd64-avx-mpx-linux.c: Generate=
d.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/amd64-avx-mpx.c: Generated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/i386-avx-mpx-linux.c: Generated=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* features/i386/i386-avx-mpx.c: Generated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* regformats/i386/amd64-avx-mpx-linux.dat: Gene=
rated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* regformats/i386/amd64-avx-mpx.dat: Generated.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* regformats/i386/i386-avx-mpx-linux.dat: Gener=
ated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* regformats/i386/i386-avx-mpx.dat: Generated.<=
br>
+<br>
+gdb/gdbserver/ChangeLog:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* Makefile.in (clean): Add removal for i386-avx=
-mpx.c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386-avx-mpx-linux.c, amd64-avx-mpx.c and amd64=
-avx-mpx-linux.c.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(i386-avx-mpx.c, i386-avx-mpx-linux.c, amd64-av=
x-mpx.c)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(amd64-avx-mpx-linux.c): New rules.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(amd64-avx-mpx-linux-ipa.o, i386-avx-mpx-linux-=
ipa.o): New rule.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* configure.srv (srv_i386_regobj): Add i386-avx=
-mpx.o.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_i386_linux_regobj): Add i386-avx-mpx-linux=
.o.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_amd64_regobj): Add amd64-avx-mpx.o.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_amd64_linux_regobj): Add amd64-avx-mpx-lin=
ux.o.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_i386_xmlfiles): Add i386/i386-avx-mpx.xml.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_amd64_xmlfiles): Add i386/amd64-avx-mpx.xm=
l.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_i386_linux_xmlfiles): Add i386/i386-avx-mp=
x-linux.xml.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(srv_amd64_linux_xmlfiles): Add i386/amd64-avx-=
mpx-linux.xml.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ipa_i386_linux_regobj): Add i386-avx-mpx-linux=
-ipa.o.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ipa_amd64_linux_regobj): Add amd64-avx-mpx-lin=
ux-ipa.o.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* linux-x86-low.c (x86_linux_read_description):=
 Add case for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0X86_XSTATE_AVX_MPX_MASK.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(x86_get_ipa_tdesc_idx): Add cases for avx_mpx.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(initialize_low_arch): Call init_registers_amd6=
4_avx_mpx_linux and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init_registers_i386_avx_mpx_linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* linux-i386-ipa.c (get_ipa_tdesc): Add case fo=
r avx_mpx.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(initialize_low_tracepoint): Call<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init_registers_i386_avx_mpx_linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* linux-amd64-ipa.c (get_ipa_tdesc):=C2=A0 Add =
case for avx_mpx.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(initialize_low_tracepoint): Call<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init_registers_amd64_avx_mpx_linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* linux-x86-tdesc.h (X86_TDESC_AVX_MPX): New en=
um value.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(init_registers_amd64_avx_mpx_linux, tdesc_amd6=
4_avx_mpx_linux)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(init_registers_i386_avx_mpx_linux, tdesc_i386_=
avx_mpx_linux): New<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0declarations.<br>
+<br>
+Change-Id: I7b0642263cfa3e47b626022796e5dd3627b92ba8<br>
+<br>
+# Conflicts:<br>
+#=C2=A0 =C2=A0 =C2=A0 gdb/amd64-tdep.c<br>
+#=C2=A0 =C2=A0 =C2=A0 gdb/i386-tdep.c<br>
+---<br>
+ gdb/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 57 ++++++++<br>
+ gdb/amd64-linux-tdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
+ gdb/amd64-linux-tdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
+ gdb/amd64-tdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
+ gdb/common/x86-xstate.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
+ gdb/features/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +++<br>
+ gdb/features/i386/amd64-avx-mpx-linux.c=C2=A0 =C2=A0 =C2=A0| 211 ++++++++=
++++++++++++++++++++<br>
+ gdb/features/i386/amd64-avx-mpx-linux.xml=C2=A0 =C2=A0|=C2=A0 19 +++<br>
+ gdb/features/i386/amd64-avx-mpx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 206 +++++++++++++++++++++++++++<br>
+ gdb/features/i386/amd64-avx-mpx.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 17 +++<br>
+ gdb/features/i386/amd64-mpx-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 30 +---<br>
+ gdb/features/i386/amd64-mpx-linux.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 -<br>
+ gdb/features/i386/amd64-mpx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 30 +---<br>
+ gdb/features/i386/amd64-mpx.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 -<br>
+ gdb/features/i386/i386-avx-mpx-linux.c=C2=A0 =C2=A0 =C2=A0 | 187 ++++++++=
++++++++++++++++<br>
+ gdb/features/i386/i386-avx-mpx-linux.xml=C2=A0 =C2=A0 |=C2=A0 19 +++<br>
+ gdb/features/i386/i386-avx-mpx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 182 ++++++++++++++++++++++++<br>
+ gdb/features/i386/i386-avx-mpx.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 17 +++<br>
+ gdb/features/i386/i386-mpx-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 22 +--<br>
+ gdb/features/i386/i386-mpx-linux.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 -<br>
+ gdb/features/i386/i386-mpx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 22 +--<br>
+ gdb/features/i386/i386-mpx.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 -<br>
+ gdb/gdbserver/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 33 +++++<br>
+ gdb/gdbserver/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
+ gdb/gdbserver/configure.srv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 17 +--<br>
+ gdb/gdbserver/linux-x86-low.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 16 +++<br>
+ gdb/i386-linux-tdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
+ gdb/i386-linux-tdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
+ gdb/i386-tdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
+ gdb/regformats/i386/amd64-avx-mpx-linux.dat |=C2=A0 85 +++++++++++<br>
+ gdb/regformats/i386/amd64-avx-mpx.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8=
4 +++++++++++<br>
+ gdb/regformats/i386/amd64-mpx-linux.dat=C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ---=
<br>
+ gdb/regformats/i386/amd64-mpx.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 16 ---<br>
+ gdb/regformats/i386/i386-avx-mpx-linux.dat=C2=A0 |=C2=A0 61 ++++++++<br>
+ gdb/regformats/i386/i386-avx-mpx.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6=
0 ++++++++<br>
+ gdb/regformats/i386/i386-mpx-linux.dat=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
8 --<br>
+ gdb/regformats/i386/i386-mpx.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A08 --<br>
+ gdb/x86-linux-nat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
+ 38 files changed, 1342 insertions(+), 142 deletions(-)<br>
+ create mode 100644 gdb/features/i386/amd64-avx-mpx-linux.c<br>
+ create mode 100644 gdb/features/i386/amd64-avx-mpx-linux.xml<br>
+ create mode 100644 gdb/features/i386/amd64-avx-mpx.c<br>
+ create mode 100644 gdb/features/i386/amd64-avx-mpx.xml<br>
+ create mode 100644 gdb/features/i386/i386-avx-mpx-linux.c<br>
+ create mode 100644 gdb/features/i386/i386-avx-mpx-linux.xml<br>
+ create mode 100644 gdb/features/i386/i386-avx-mpx.c<br>
+ create mode 100644 gdb/features/i386/i386-avx-mpx.xml<br>
+ create mode 100644 gdb/regformats/i386/amd64-avx-mpx-linux.dat<br>
+ create mode 100644 gdb/regformats/i386/amd64-avx-mpx.dat<br>
+ create mode 100644 gdb/regformats/i386/i386-avx-mpx-linux.dat<br>
+ create mode 100644 gdb/regformats/i386/i386-avx-mpx.dat<br>
+<br>
+Index: gdb-7.9.1/gdb/ChangeLog<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/ChangeLog<br>
++++ gdb-7.9.1/gdb/ChangeLog<br>
+@@ -1,3 +1,60 @@<br>
++2016-04-14=C2=A0 Walfred Tedeschi=C2=A0 &lt;<a>walfred.tedeschi@intel.com=
</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-mpx-linux.xml: Remove AVX feat=
ure.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-mpx.xml: Remove AVX feature.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-mpx-linux.xml: Remove AVX featu=
re.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-mpx.xml: Remove AVX feature.<br=
>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-mpx-linux.c: Regenerate.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-mpx.c: Regenerate.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-mpx-linux.c: Regenerate.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-mpx.c: Regenerate.<br>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/amd64-mpx-linux.dat: Regenerate.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/amd64-mpx.dat: Regenerate.<br>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/i386-mpx-linux.dat: Regenerate.<br=
>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/i386-mpx.dat: Regenerate.<br>
++<br>
++2016-04-16=C2=A0 Walfred Tedeschi=C2=A0 &lt;<a>walfred.tedeschi@intel.com=
</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 * amd64-linux-tdep.c (features/i386/amd64-avx-mpx-li=
nux.c):<br>
++=C2=A0 =C2=A0 =C2=A0 New include.<br>
++=C2=A0 =C2=A0 =C2=A0 (amd64_linux_core_read_description): Add case for<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0X86_XSTATE_AVX_MPX_MASK.<br>
++=C2=A0 =C2=A0 =C2=A0 (_initialize_amd64_linux_tdep): Call initialize_tdes=
c_amd64_avx_mpx_linux.<br>
++=C2=A0 =C2=A0 =C2=A0 * amd64-linux-tdep.h (tdesc_amd64_avx_mpx_linux): Ne=
w definition.<br>
++=C2=A0 =C2=A0 =C2=A0 * amd64-tdep.c (features/i386/amd64-avx-mpx.c): New =
include.<br>
++=C2=A0 =C2=A0 =C2=A0 (amd64_target_description): Add case for=C2=A0 X86_X=
STATE_AVX_MPX_MASK.<br>
++=C2=A0 =C2=A0 =C2=A0 (_initialize_amd64_tdep): Call initialize_tdesc_amd6=
4_avx_mpx.<br>
++=C2=A0 =C2=A0 =C2=A0 * common/x86-xstate.h (X86_XSTATE_MPX_MASK): Remove =
AVX bits.<br>
++=C2=A0 =C2=A0 =C2=A0 (X86_XSTATE_AVX_MPX_MASK): New case.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/Makefile (i386/i386-avx-mpx, i386/i386-av=
x-mpx-linux)<br>
++=C2=A0 =C2=A0 =C2=A0 (i386/amd64-avx-mpx, i386/amd64-avx-mpx-linux): New =
rules.<br>
++=C2=A0 =C2=A0 =C2=A0 (i386/i386-avx-mpx-expedite, i386/i386-avx-mpx-linux=
-expedite)<br>
++=C2=A0 =C2=A0 =C2=A0 (i386/amd64-avx-mpx-expedite, i386/amd64-avx-mpx-lin=
ux-expedite):<br>
++=C2=A0 =C2=A0 =C2=A0 New expedites.<br>
++=C2=A0 =C2=A0 =C2=A0 * i386-linux-tdep.c (features/i386/i386-avx-mpx-linu=
x.c): New<br>
++=C2=A0 =C2=A0 =C2=A0 include.<br>
++=C2=A0 =C2=A0 =C2=A0 (i386_linux_core_read_description): Add case<br>
++=C2=A0 =C2=A0 =C2=A0 X86_XSTATE_AVX_MPX_MASK.<br>
++=C2=A0 =C2=A0 =C2=A0 (_initialize_i386_linux_tdep): Call<br>
++=C2=A0 =C2=A0 =C2=A0 initialize_tdesc_i386_avx_mpx_linux.<br>
++=C2=A0 =C2=A0 =C2=A0 * i386-linux-tdep.h (tdesc_i386_avx_mpx_linux): New =
include.<br>
++=C2=A0 =C2=A0 =C2=A0 * i386-tdep.c (features/i386/i386-avx-mpx.c): New in=
clude.<br>
++=C2=A0 =C2=A0 =C2=A0 (i386_target_description): Add case for X86_XSTATE_A=
VX_MPX_MASK.<br>
++=C2=A0 =C2=A0 =C2=A0 * x86-linux-nat.c (x86_linux_read_description): Add =
case for<br>
++=C2=A0 =C2=A0 =C2=A0 X86_XSTATE_AVX_MPX_MASK.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-avx-mpx-linux.xml: New file.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-avx-mpx-linux.xml: New file.<br=
>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-avx-mpx.xml: New file.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-avx-mpx.xml: New file.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-avx-mpx-linux.c: Generated.<br=
>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/amd64-avx-mpx.c: Generated.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-avx-mpx-linux.c: Generated.<br>
++=C2=A0 =C2=A0 =C2=A0 * features/i386/i386-avx-mpx.c: Generated.<br>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/amd64-avx-mpx-linux.dat: Generated=
.<br>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/amd64-avx-mpx.dat: Generated.<br>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/i386-avx-mpx-linux.dat: Generated.=
<br>
++=C2=A0 =C2=A0 =C2=A0 * regformats/i386/i386-avx-mpx.dat: Generated.<br>
++<br>
+ 2015-05-13=C2=A0 Joel Brobecker=C2=A0 &lt;<a>brobecker@adacore.com</a>&gt=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"http://version.in" target=3D"_blan=
k">version.in</a>: Set GDB version number to 7.9.1.<br>
+Index: gdb-7.9.1/gdb/amd64-linux-tdep.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/amd64-linux-tdep.c<br>
++++ gdb-7.9.1/gdb/amd64-linux-tdep.c<br>
+@@ -41,6 +41,7 @@<br>
+ #include &quot;features/i386/amd64-linux.c&quot;<br>
+ #include &quot;features/i386/amd64-avx-linux.c&quot;<br>
+ #include &quot;features/i386/amd64-mpx-linux.c&quot;<br>
++#include &quot;features/i386/amd64-avx-mpx-linux.c&quot;<br>
+ #include &quot;features/i386/amd64-avx512-linux.c&quot;<br>
+<br>
+ #include &quot;features/i386/x32-linux.c&quot;<br>
+@@ -1587,6 +1588,11 @@ amd64_linux_core_read_description (struc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tdesc_x32_avx_linux;=C2=A0 /* No x32 MPX=
 falling back to AVX.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tdesc_amd64_mpx_linux;<br>
++=C2=A0 =C2=A0 case X86_XSTATE_AVX_MPX_MASK:<br>
++=C2=A0 =C2=A0 =C2=A0 if (gdbarch_ptr_bit (gdbarch) =3D=3D 32)<br>
++=C2=A0 =C2=A0 =C2=A0 return tdesc_x32_avx_linux;=C2=A0 /* No x32 MPX fall=
ing back to AVX.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 return tdesc_amd64_avx_mpx_linux;<br>
+=C2=A0 =C2=A0 =C2=A0case X86_XSTATE_AVX_MASK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gdbarch_ptr_bit (gdbarch) =3D=3D 32)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tdesc_x32_avx_linux;<br>
+@@ -2134,6 +2140,7 @@ _initialize_amd64_linux_tdep (void)<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_linux ();<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_avx_linux ();<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_mpx_linux ();<br>
++=C2=A0 initialize_tdesc_amd64_avx_mpx_linux ();<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_avx512_linux ();<br>
+<br>
+=C2=A0 =C2=A0initialize_tdesc_x32_linux ();<br>
+Index: gdb-7.9.1/gdb/amd64-linux-tdep.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/amd64-linux-tdep.h<br>
++++ gdb-7.9.1/gdb/amd64-linux-tdep.h<br>
+@@ -35,6 +35,7 @@<br>
+ extern struct target_desc *tdesc_amd64_linux;<br>
+ extern struct target_desc *tdesc_amd64_avx_linux;<br>
+ extern struct target_desc *tdesc_amd64_mpx_linux;<br>
++extern struct target_desc *tdesc_amd64_avx_mpx_linux;<br>
+ extern struct target_desc *tdesc_amd64_avx512_linux;<br>
+<br>
+ extern struct target_desc *tdesc_x32_linux;<br>
+Index: gdb-7.9.1/gdb/amd64-tdep.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/amd64-tdep.c<br>
++++ gdb-7.9.1/gdb/amd64-tdep.c<br>
+@@ -43,6 +43,7 @@<br>
+ #include &quot;features/i386/amd64.c&quot;<br>
+ #include &quot;features/i386/amd64-avx.c&quot;<br>
+ #include &quot;features/i386/amd64-mpx.c&quot;<br>
++#include &quot;features/i386/amd64-avx-mpx.c&quot;<br>
+ #include &quot;features/i386/amd64-avx512.c&quot;<br>
+<br>
+ #include &quot;features/i386/x32.c&quot;<br>
+@@ -3119,6 +3120,7 @@ _initialize_amd64_tdep (void)<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64 ();<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_avx ();<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_mpx ();<br>
++=C2=A0 initialize_tdesc_amd64_avx_mpx ();<br>
+=C2=A0 =C2=A0initialize_tdesc_amd64_avx512 ();<br>
+<br>
+=C2=A0 =C2=A0initialize_tdesc_x32 ();<br>
+Index: gdb-7.9.1/gdb/common/x86-xstate.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/common/x86-xstate.h<br>
++++ gdb-7.9.1/gdb/common/x86-xstate.h<br>
+@@ -39,9 +39,10 @@<br>
+ #define X86_XSTATE_X87_MASK=C2=A0 =C2=A0X86_XSTATE_X87<br>
+ #define X86_XSTATE_SSE_MASK=C2=A0 =C2=A0(X86_XSTATE_X87 | X86_XSTATE_SSE)=
<br>
+ #define X86_XSTATE_AVX_MASK=C2=A0 =C2=A0(X86_XSTATE_SSE_MASK | X86_XSTATE=
_AVX)<br>
+-#define X86_XSTATE_MPX_MASK=C2=A0 =C2=A0(X86_XSTATE_AVX_MASK | X86_XSTATE=
_MPX)<br>
++#define X86_XSTATE_MPX_MASK=C2=A0 =C2=A0(X86_XSTATE_SSE_MASK | X86_XSTATE=
_MPX)<br>
++#define X86_XSTATE_AVX_MPX_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(X86_XSTATE_AVX=
_MASK | X86_XSTATE_MPX)<br>
+ #define X86_XSTATE_AVX512_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 (X86_XSTATE_AVX=
_MASK | X86_XSTATE_AVX512)<br>
+-#define X86_XSTATE_MPX_AVX512_MASK (X86_XSTATE_MPX_MASK | X86_XSTATE_AVX5=
12)<br>
++#define X86_XSTATE_MPX_AVX512_MASK (X86_XSTATE_AVX_MPX_MASK | X86_XSTATE_=
AVX512)<br>
+<br>
+ #define X86_XSTATE_ALL_MASK=C2=A0 =C2=A0(X86_XSTATE_MPX_AVX512_MASK)<br>
+<br>
+Index: gdb-7.9.1/gdb/features/Makefile<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/features/Makefile<br>
++++ gdb-7.9.1/gdb/features/Makefile<br>
+@@ -50,9 +50,11 @@ WHICH =3D aarch64 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64 i386/amd64-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-avx i386/i386-avx-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-mpx i386/i386-mpx-linux \<br>
++=C2=A0 =C2=A0 =C2=A0 i386/i386-avx-mpx i386/i386-avx-mpx-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-avx512 i386/i386-avx512-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64-avx i386/amd64-avx-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64-mpx i386/amd64-mpx-linux \<br>
++=C2=A0 =C2=A0 =C2=A0 i386/amd64-avx-mpx i386/amd64-avx-mpx-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64-avx512 i386/amd64-avx512-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/x32 i386/x32-linux \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/x32-avx i386/x32-avx-linux \<br>
+@@ -82,7 +84,9 @@ i386/amd64-linux-expedite =3D rbp,rsp,rip<br>
+ i386/i386-avx-expedite =3D ebp,esp,eip<br>
+ i386/i386-avx-linux-expedite =3D ebp,esp,eip<br>
+ i386/i386-mpx-expedite =3D ebp,esp,eip<br>
++i386/i386-avx-mpx-expedite =3D ebp,esp,eip<br>
+ i386/i386-mpx-linux-expedite =3D ebp,esp,eip<br>
++i386/i386-avx-mpx-linux-expedite =3D ebp,esp,eip<br>
+ i386/i386-avx512-expedite =3D ebp,esp,eip<br>
+ i386/i386-avx512-linux-expedite =3D ebp,esp,eip<br>
+ i386/i386-mmx-expedite =3D ebp,esp,eip<br>
+@@ -90,7 +94,9 @@ i386/i386-mmx-linux-expedite =3D ebp,esp,e<br>
+ i386/amd64-avx-expedite =3D rbp,rsp,rip<br>
+ i386/amd64-avx-linux-expedite =3D rbp,rsp,rip<br>
+ i386/amd64-mpx-expedite =3D rbp,rsp,rip<br>
++i386/amd64-avx-mpx-expedite =3D rbp,rsp,rip<br>
+ i386/amd64-mpx-linux-expedite =3D rbp,rsp,rip<br>
++i386/amd64-avx-mpx-linux-expedite =3D rbp,rsp,rip<br>
+ i386/amd64-avx512-expedite =3D rbp,rsp,rip<br>
+ i386/amd64-avx512-linux-expedite =3D rbp,rsp,rip<br>
+ i386/x32-expedite =3D rbp,rsp,rip<br>
+@@ -151,6 +157,8 @@ XMLTOC =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64-linux.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64-mpx-linux.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64-mpx.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 i386/amd64-avx-mpx-linux.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 i386/amd64-avx-mpx.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/amd64.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-avx-linux.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-avx.xml \<br>
+@@ -161,6 +169,8 @@ XMLTOC =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-mmx.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-mpx-linux.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386-mpx.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 i386/i386-avx-mpx-linux.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 i386/i386-avx-mpx.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/i386.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/x32-avx-linux.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i386/x32-avx.xml \<br>
+@@ -266,6 +276,10 @@ $(outdir)/i386/i386-mpx.dat: i386/32bit-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i386/32bit-mpx.xml<br>
+ $(outdir)/i386/i386-mpx-linux.dat: i386/32bit-core.xml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 i386/32bit-avx.xml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i386/32bit-linux.xml i386/32bit-mpx.xml<br>
++$(outdir)/i386/i386-mpx-linux.dat: i386/32bit-core.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i386/32bit-linux.xml i386/32bit-mpx.xml<br>
++$(outdir)/i386/i386-avx-mpx-linux.dat: i386/32bit-core.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i386/32bit-linux.xml i386/32bit-mpx.xml<br>
+ $(outdir)/i386/i386-avx512.dat: i386/32bit-core.xml i386/32bit-avx.xml \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i386/32bit-mpx.xml i386/32bit-avx512.xml<br=
>
+ $(outdir)/i386/i386-avx512-linux.dat: i386/32bit-core.xml i386/32bit-avx.=
xml \<br>
+@@ -277,8 +291,12 @@ $(outdir)/i386/amd64-avx-linux.dat: i386<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i386/64bit-linux.xml<br=
>
+ $(outdir)/i386/amd64-mpx-linux.dat: i386/64bit-core.xml i386/64bit-avx.xm=
l \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i386/64bit-linux.xml i386/64bit-mpx.xml<br>
++$(outdir)/i386/amd64-avx-mpx-linux.dat: i386/64bit-core.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i386/64bit-linux.xml i386/64bit-mpx.xml<br>
+ $(outdir)/i386/amd64-mpx.dat: i386/64bit-core.xml i386/64bit-avx.xml \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i386/64bit-mpx.xml<br>
++$(outdir)/i386/amd64-avx-mpx.dat: i386/64bit-core.xml \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i386/64bit-mpx.xml<br>
+ $(outdir)/i386/amd64-avx512.dat: i386/64bit-core.xml i386/64bit-avx.xml \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i386/64bit-mpx.xml i386/64bit-avx512.xml<br=
>
+ $(outdir)/i386/amd64-avx512-linux.dat: i386/64bit-core.xml i386/64bit-avx=
.xml \<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.c<br>
+@@ -0,0 +1,211 @@<br>
++/* THIS FILE IS GENERATED.=C2=A0 -*- buffer-read-only: t -*- vi:set ro:<b=
r>
++=C2=A0 Original: amd64-avx-mpx-linux.xml */<br>
++<br>
++#include &quot;defs.h&quot;<br>
++#include &quot;osabi.h&quot;<br>
++#include &quot;target-descriptions.h&quot;<br>
++<br>
++struct target_desc *tdesc_amd64_avx_mpx_linux;<br>
++static void<br>
++initialize_tdesc_amd64_avx_mpx_linux (void)<br>
++{<br>
++=C2=A0 struct target_desc *result =3D allocate_target_description ();<br>
++=C2=A0 struct tdesc_feature *feature;<br>
++=C2=A0 struct tdesc_type *field_type;<br>
++=C2=A0 struct tdesc_type *type;<br>
++<br>
++=C2=A0 set_tdesc_architecture (result, bfd_scan_arch (&quot;i386:x86-64&q=
uot;));<br>
++<br>
++=C2=A0 set_tdesc_osabi (result, osabi_from_tdesc_string (&quot;GNU/Linux&=
quot;));<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.c=
ore&quot;);<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_eflags&quot=
;, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;CF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;PF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;AF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;ZF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;SF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;TF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;IF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;DF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;OF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 14, &quot;NT&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 16, &quot;RF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 17, &quot;VM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 18, &quot;AC&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 19, &quot;VIF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 20, &quot;VIP&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 21, &quot;ID&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rax&quot;, 0, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rbx&quot;, 1, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rcx&quot;, 2, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rdx&quot;, 3, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rsi&quot;, 4, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rdi&quot;, 5, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rbp&quot;, 6, 1, NULL, 64, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rsp&quot;, 7, 1, NULL, 64, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r8&quot;, 8, 1, NULL, 64, &quot;i=
nt64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r9&quot;, 9, 1, NULL, 64, &quot;i=
nt64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r10&quot;, 10, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r11&quot;, 11, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r12&quot;, 12, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r13&quot;, 13, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r14&quot;, 14, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r15&quot;, 15, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rip&quot;, 16, 1, NULL, 64, &quot=
;code_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eflags&quot;, 17, 1, NULL, 32, &q=
uot;i386_eflags&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;cs&quot;, 18, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ss&quot;, 19, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ds&quot;, 20, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;es&quot;, 21, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fs&quot;, 22, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;gs&quot;, 23, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st0&quot;, 24, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st1&quot;, 25, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st2&quot;, 26, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st3&quot;, 27, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st4&quot;, 28, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st5&quot;, 29, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st6&quot;, 30, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st7&quot;, 31, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fctrl&quot;, 32, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fstat&quot;, 33, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ftag&quot;, 34, 1, &quot;float&qu=
ot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fiseg&quot;, 35, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fioff&quot;, 36, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;foseg&quot;, 37, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fooff&quot;, 38, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fop&quot;, 39, 1, &quot;float&quo=
t;, 32, &quot;int&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.s=
se&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_single&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4f&quot;, field_type, 4);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_double&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2d&quot;, field_type, 2);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int8&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v16i8&quot;, field_type, 16);<=
br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int16&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v8i16&quot;, field_type, 8);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int32&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4i32&quot;, field_type, 4);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int64&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2i64&quot;, field_type, 2);<b=
r>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;vec128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4f&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_float&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2d&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_double&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v16i8&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v16_int8&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v8i16&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v8_int16&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4i32&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_int32&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2i64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_int64&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint128&quot;);<br=
>
++=C2=A0 tdesc_add_field (type, &quot;uint128&quot;, field_type);<br>
++<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_mxcsr&quot;=
, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;IE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;DE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;ZE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 3, &quot;OE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;UE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 5, &quot;PE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;DAZ&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;IM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;DM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;ZM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;OM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;UM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 12, &quot;PM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 15, &quot;FZ&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm0&quot;, 40, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm1&quot;, 41, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm2&quot;, 42, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm3&quot;, 43, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm4&quot;, 44, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm5&quot;, 45, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm6&quot;, 46, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm7&quot;, 47, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm8&quot;, 48, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm9&quot;, 49, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm10&quot;, 50, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm11&quot;, 51, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm12&quot;, 52, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm13&quot;, 53, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm14&quot;, 54, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm15&quot;, 55, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;mxcsr&quot;, 56, 1, &quot;vector&=
quot;, 32, &quot;i386_mxcsr&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.l=
inux&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;orig_rax&quot;, 57, 1, NULL, 64, =
&quot;int&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.a=
vx&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm0h&quot;, 58, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm1h&quot;, 59, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm2h&quot;, 60, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm3h&quot;, 61, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm4h&quot;, 62, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm5h&quot;, 63, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm6h&quot;, 64, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm7h&quot;, 65, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm8h&quot;, 66, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm9h&quot;, 67, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm10h&quot;, 68, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm11h&quot;, 69, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm12h&quot;, 70, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm13h&quot;, 71, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm14h&quot;, 72, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm15h&quot;, 73, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.m=
px&quot;);<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;br128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;lbound&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;ubound_raw&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndstatus&quot;);<br=
>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;bde&quot;, 2, 63);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;error&quot;, 0, 1);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;status&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndstatus&quot;);=
<br>
++=C2=A0 tdesc_add_field (type, &quot;status&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndcfgu&quot;);<br>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;base&quot;, 12, 63);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;reserved&quot;, 2, 11);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;preserved&quot;, 1, 1);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;enabled&quot;, 0, 0);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;cfgu&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndcfgu&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;config&quot;, field_type);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 74, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 75, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 76, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 77, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 78, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 79, 1, NULL, 64,=
 &quot;status&quot;);<br>
++<br>
++=C2=A0 tdesc_amd64_avx_mpx_linux =3D result;<br>
++}<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.xml<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx-linux.xml<br>
+@@ -0,0 +1,19 @@<br>
++&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
++&lt;!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0Copying and distribution of this file, with or withou=
t modification,<br>
++=C2=A0 =C2=A0 =C2=A0are permitted in any medium without royalty provided =
the copyright<br>
++=C2=A0 =C2=A0 =C2=A0notice and this notice are preserved.=C2=A0 --&gt;<br=
>
++<br>
++&lt;!-- AMD64 with AVX and MPX - Includes Linux-only special &quot;regist=
er&quot;.=C2=A0 --&gt;<br>
++<br>
++&lt;!DOCTYPE target SYSTEM &quot;gdb-target.dtd&quot;&gt;<br>
++&lt;target&gt;<br>
++=C2=A0 &lt;architecture&gt;i386:x86-64&lt;/architecture&gt;<br>
++=C2=A0 &lt;osabi&gt;GNU/Linux&lt;/osabi&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-core.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-sse.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-linux.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-avx.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-mpx.xml&quot;/&gt;<br>
++&lt;/target&gt;<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.c<br>
+@@ -0,0 +1,206 @@<br>
++/* THIS FILE IS GENERATED.=C2=A0 -*- buffer-read-only: t -*- vi:set ro:<b=
r>
++=C2=A0 Original: amd64-avx-mpx.xml */<br>
++<br>
++#include &quot;defs.h&quot;<br>
++#include &quot;osabi.h&quot;<br>
++#include &quot;target-descriptions.h&quot;<br>
++<br>
++struct target_desc *tdesc_amd64_avx_mpx;<br>
++static void<br>
++initialize_tdesc_amd64_avx_mpx (void)<br>
++{<br>
++=C2=A0 struct target_desc *result =3D allocate_target_description ();<br>
++=C2=A0 struct tdesc_feature *feature;<br>
++=C2=A0 struct tdesc_type *field_type;<br>
++=C2=A0 struct tdesc_type *type;<br>
++<br>
++=C2=A0 set_tdesc_architecture (result, bfd_scan_arch (&quot;i386:x86-64&q=
uot;));<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.c=
ore&quot;);<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_eflags&quot=
;, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;CF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;PF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;AF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;ZF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;SF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;TF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;IF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;DF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;OF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 14, &quot;NT&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 16, &quot;RF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 17, &quot;VM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 18, &quot;AC&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 19, &quot;VIF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 20, &quot;VIP&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 21, &quot;ID&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rax&quot;, 0, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rbx&quot;, 1, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rcx&quot;, 2, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rdx&quot;, 3, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rsi&quot;, 4, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rdi&quot;, 5, 1, NULL, 64, &quot;=
int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rbp&quot;, 6, 1, NULL, 64, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rsp&quot;, 7, 1, NULL, 64, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r8&quot;, 8, 1, NULL, 64, &quot;i=
nt64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r9&quot;, 9, 1, NULL, 64, &quot;i=
nt64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r10&quot;, 10, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r11&quot;, 11, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r12&quot;, 12, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r13&quot;, 13, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r14&quot;, 14, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;r15&quot;, 15, 1, NULL, 64, &quot=
;int64&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;rip&quot;, 16, 1, NULL, 64, &quot=
;code_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eflags&quot;, 17, 1, NULL, 32, &q=
uot;i386_eflags&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;cs&quot;, 18, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ss&quot;, 19, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ds&quot;, 20, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;es&quot;, 21, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fs&quot;, 22, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;gs&quot;, 23, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st0&quot;, 24, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st1&quot;, 25, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st2&quot;, 26, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st3&quot;, 27, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st4&quot;, 28, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st5&quot;, 29, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st6&quot;, 30, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st7&quot;, 31, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fctrl&quot;, 32, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fstat&quot;, 33, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ftag&quot;, 34, 1, &quot;float&qu=
ot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fiseg&quot;, 35, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fioff&quot;, 36, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;foseg&quot;, 37, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fooff&quot;, 38, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fop&quot;, 39, 1, &quot;float&quo=
t;, 32, &quot;int&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.s=
se&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_single&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4f&quot;, field_type, 4);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_double&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2d&quot;, field_type, 2);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int8&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v16i8&quot;, field_type, 16);<=
br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int16&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v8i16&quot;, field_type, 8);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int32&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4i32&quot;, field_type, 4);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int64&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2i64&quot;, field_type, 2);<b=
r>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;vec128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4f&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_float&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2d&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_double&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v16i8&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v16_int8&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v8i16&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v8_int16&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4i32&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_int32&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2i64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_int64&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint128&quot;);<br=
>
++=C2=A0 tdesc_add_field (type, &quot;uint128&quot;, field_type);<br>
++<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_mxcsr&quot;=
, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;IE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;DE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;ZE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 3, &quot;OE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;UE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 5, &quot;PE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;DAZ&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;IM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;DM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;ZM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;OM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;UM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 12, &quot;PM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 15, &quot;FZ&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm0&quot;, 40, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm1&quot;, 41, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm2&quot;, 42, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm3&quot;, 43, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm4&quot;, 44, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm5&quot;, 45, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm6&quot;, 46, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm7&quot;, 47, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm8&quot;, 48, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm9&quot;, 49, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm10&quot;, 50, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm11&quot;, 51, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm12&quot;, 52, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm13&quot;, 53, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm14&quot;, 54, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm15&quot;, 55, 1, NULL, 128, &q=
uot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;mxcsr&quot;, 56, 1, &quot;vector&=
quot;, 32, &quot;i386_mxcsr&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.a=
vx&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm0h&quot;, 57, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm1h&quot;, 58, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm2h&quot;, 59, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm3h&quot;, 60, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm4h&quot;, 61, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm5h&quot;, 62, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm6h&quot;, 63, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm7h&quot;, 64, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm8h&quot;, 65, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm9h&quot;, 66, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm10h&quot;, 67, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm11h&quot;, 68, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm12h&quot;, 69, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm13h&quot;, 70, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm14h&quot;, 71, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm15h&quot;, 72, 1, NULL, 128, &=
quot;uint128&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.m=
px&quot;);<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;br128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;lbound&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;ubound_raw&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndstatus&quot;);<br=
>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;bde&quot;, 2, 63);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;error&quot;, 0, 1);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;status&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndstatus&quot;);=
<br>
++=C2=A0 tdesc_add_field (type, &quot;status&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndcfgu&quot;);<br>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;base&quot;, 12, 63);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;reserved&quot;, 2, 11);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;preserved&quot;, 1, 1);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;enabled&quot;, 0, 0);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;cfgu&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndcfgu&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;config&quot;, field_type);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 73, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 74, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 75, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 76, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 77, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 78, 1, NULL, 64,=
 &quot;status&quot;);<br>
++<br>
++=C2=A0 tdesc_amd64_avx_mpx =3D result;<br>
++}<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.xml<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-avx-mpx.xml<br>
+@@ -0,0 +1,17 @@<br>
++&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
++&lt;!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0Copying and distribution of this file, with or withou=
t modification,<br>
++=C2=A0 =C2=A0 =C2=A0are permitted in any medium without royalty provided =
the copyright<br>
++=C2=A0 =C2=A0 =C2=A0notice and this notice are preserved.=C2=A0 --&gt;<br=
>
++<br>
++&lt;!-- AMD64 with AVX and MPX --&gt;<br>
++<br>
++&lt;!DOCTYPE target SYSTEM &quot;gdb-target.dtd&quot;&gt;<br>
++&lt;target&gt;<br>
++=C2=A0 &lt;architecture&gt;i386:x86-64&lt;/architecture&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-core.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-sse.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-avx.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;64bit-mpx.xml&quot;/&gt;<br>
++&lt;/target&gt;<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx-linux.c<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.c<br>
+@@ -151,24 +151,6 @@ initialize_tdesc_amd64_mpx_linux (void)<br>
+=C2=A0 =C2=A0feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i=
386.linux&quot;);<br>
+=C2=A0 =C2=A0tdesc_create_reg (feature, &quot;orig_rax&quot;, 57, 1, NULL,=
 64, &quot;int&quot;);<br>
+<br>
+-=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.a=
vx&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm0h&quot;, 58, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm1h&quot;, 59, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm2h&quot;, 60, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm3h&quot;, 61, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm4h&quot;, 62, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm5h&quot;, 63, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm6h&quot;, 64, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm7h&quot;, 65, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm8h&quot;, 66, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm9h&quot;, 67, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm10h&quot;, 68, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm11h&quot;, 69, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm12h&quot;, 70, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm13h&quot;, 71, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm14h&quot;, 72, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm15h&quot;, 73, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-<br>
+=C2=A0 =C2=A0feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i=
386.mpx&quot;);<br>
+=C2=A0 =C2=A0type =3D tdesc_create_struct (feature, &quot;br128&quot;);<br=
>
+=C2=A0 =C2=A0field_type =3D tdesc_named_type (feature, &quot;uint64&quot;)=
;<br>
+@@ -200,12 +182,12 @@ initialize_tdesc_amd64_mpx_linux (void)<br>
+=C2=A0 =C2=A0field_type =3D tdesc_named_type (feature, &quot;_bndcfgu&quot=
;);<br>
+=C2=A0 =C2=A0tdesc_add_field (type, &quot;config&quot;, field_type);<br>
+<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 74, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 75, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 76, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 77, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 78, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 79, 1, NULL, 64,=
 &quot;status&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 58, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 59, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 60, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 61, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 62, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 63, 1, NULL, 64,=
 &quot;status&quot;);<br>
+<br>
+=C2=A0 =C2=A0tdesc_amd64_mpx_linux =3D result;<br>
+ }<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.xml<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx-linux.xml<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-mpx-linux.xml<br>
+@@ -14,6 +14,5 @@<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-core.xml&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-sse.xml&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-linux.xml&quot;/&gt;<br>
+-=C2=A0 &lt;xi:include href=3D&quot;64bit-avx.xml&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-mpx.xml&quot;/&gt;<br>
+ &lt;/target&gt;<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-mpx.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx.c<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-mpx.c<br>
+@@ -146,24 +146,6 @@ initialize_tdesc_amd64_mpx (void)<br>
+=C2=A0 =C2=A0tdesc_create_reg (feature, &quot;xmm15&quot;, 55, 1, NULL, 12=
8, &quot;vec128&quot;);<br>
+=C2=A0 =C2=A0tdesc_create_reg (feature, &quot;mxcsr&quot;, 56, 1, &quot;ve=
ctor&quot;, 32, &quot;i386_mxcsr&quot;);<br>
+<br>
+-=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.a=
vx&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm0h&quot;, 57, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm1h&quot;, 58, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm2h&quot;, 59, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm3h&quot;, 60, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm4h&quot;, 61, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm5h&quot;, 62, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm6h&quot;, 63, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm7h&quot;, 64, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm8h&quot;, 65, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm9h&quot;, 66, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm10h&quot;, 67, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm11h&quot;, 68, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm12h&quot;, 69, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm13h&quot;, 70, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm14h&quot;, 71, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;ymm15h&quot;, 72, 1, NULL, 128, &=
quot;uint128&quot;);<br>
+-<br>
+=C2=A0 =C2=A0feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i=
386.mpx&quot;);<br>
+=C2=A0 =C2=A0type =3D tdesc_create_struct (feature, &quot;br128&quot;);<br=
>
+=C2=A0 =C2=A0field_type =3D tdesc_named_type (feature, &quot;uint64&quot;)=
;<br>
+@@ -195,12 +177,12 @@ initialize_tdesc_amd64_mpx (void)<br>
+=C2=A0 =C2=A0field_type =3D tdesc_named_type (feature, &quot;_bndcfgu&quot=
;);<br>
+=C2=A0 =C2=A0tdesc_add_field (type, &quot;config&quot;, field_type);<br>
+<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 73, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 74, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 75, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 76, 1, NULL, 128, =
&quot;br128&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 77, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
+-=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 78, 1, NULL, 64,=
 &quot;status&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 57, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 58, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 59, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 60, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 61, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 62, 1, NULL, 64,=
 &quot;status&quot;);<br>
+<br>
+=C2=A0 =C2=A0tdesc_amd64_mpx =3D result;<br>
+ }<br>
+Index: gdb-7.9.1/gdb/features/i386/amd64-mpx.xml<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gdb-7.9.1.orig/gdb/features/i386/amd64-mpx.xml<br>
++++ gdb-7.9.1/gdb/features/i386/amd64-mpx.xml<br>
+@@ -12,6 +12,5 @@<br>
+=C2=A0 =C2=A0&lt;architecture&gt;i386:x86-64&lt;/architecture&gt;<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-core.xml&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-sse.xml&quot;/&gt;<br>
+-=C2=A0 &lt;xi:include href=3D&quot;64bit-avx.xml&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;xi:include href=3D&quot;64bit-mpx.xml&quot;/&gt;<br>
+ &lt;/target&gt;<br>
+Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.c<br>
+@@ -0,0 +1,187 @@<br>
++/* THIS FILE IS GENERATED.=C2=A0 -*- buffer-read-only: t -*- vi:set ro:<b=
r>
++=C2=A0 Original: i386-avx-mpx-linux.xml */<br>
++<br>
++#include &quot;defs.h&quot;<br>
++#include &quot;osabi.h&quot;<br>
++#include &quot;target-descriptions.h&quot;<br>
++<br>
++struct target_desc *tdesc_i386_avx_mpx_linux;<br>
++static void<br>
++initialize_tdesc_i386_avx_mpx_linux (void)<br>
++{<br>
++=C2=A0 struct target_desc *result =3D allocate_target_description ();<br>
++=C2=A0 struct tdesc_feature *feature;<br>
++=C2=A0 struct tdesc_type *field_type;<br>
++=C2=A0 struct tdesc_type *type;<br>
++<br>
++=C2=A0 set_tdesc_architecture (result, bfd_scan_arch (&quot;i386&quot;));=
<br>
++<br>
++=C2=A0 set_tdesc_osabi (result, osabi_from_tdesc_string (&quot;GNU/Linux&=
quot;));<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.c=
ore&quot;);<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_eflags&quot=
;, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;CF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;PF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;AF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;ZF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;SF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;TF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;IF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;DF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;OF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 14, &quot;NT&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 16, &quot;RF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 17, &quot;VM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 18, &quot;AC&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 19, &quot;VIF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 20, &quot;VIP&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 21, &quot;ID&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eax&quot;, 0, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ecx&quot;, 1, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;edx&quot;, 2, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ebx&quot;, 3, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;esp&quot;, 4, 1, NULL, 32, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ebp&quot;, 5, 1, NULL, 32, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;esi&quot;, 6, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;edi&quot;, 7, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eip&quot;, 8, 1, NULL, 32, &quot;=
code_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eflags&quot;, 9, 1, NULL, 32, &qu=
ot;i386_eflags&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;cs&quot;, 10, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ss&quot;, 11, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ds&quot;, 12, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;es&quot;, 13, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fs&quot;, 14, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;gs&quot;, 15, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st0&quot;, 16, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st1&quot;, 17, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st2&quot;, 18, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st3&quot;, 19, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st4&quot;, 20, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st5&quot;, 21, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st6&quot;, 22, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st7&quot;, 23, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fctrl&quot;, 24, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fstat&quot;, 25, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ftag&quot;, 26, 1, &quot;float&qu=
ot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fiseg&quot;, 27, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fioff&quot;, 28, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;foseg&quot;, 29, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fooff&quot;, 30, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fop&quot;, 31, 1, &quot;float&quo=
t;, 32, &quot;int&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.s=
se&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_single&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4f&quot;, field_type, 4);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_double&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2d&quot;, field_type, 2);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int8&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v16i8&quot;, field_type, 16);<=
br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int16&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v8i16&quot;, field_type, 8);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int32&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4i32&quot;, field_type, 4);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int64&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2i64&quot;, field_type, 2);<b=
r>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;vec128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4f&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_float&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2d&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_double&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v16i8&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v16_int8&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v8i16&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v8_int16&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4i32&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_int32&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2i64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_int64&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint128&quot;);<br=
>
++=C2=A0 tdesc_add_field (type, &quot;uint128&quot;, field_type);<br>
++<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_mxcsr&quot;=
, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;IE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;DE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;ZE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 3, &quot;OE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;UE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 5, &quot;PE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;DAZ&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;IM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;DM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;ZM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;OM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;UM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 12, &quot;PM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 15, &quot;FZ&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm0&quot;, 32, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm1&quot;, 33, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm2&quot;, 34, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm3&quot;, 35, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm4&quot;, 36, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm5&quot;, 37, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm6&quot;, 38, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm7&quot;, 39, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;mxcsr&quot;, 40, 1, &quot;vector&=
quot;, 32, &quot;i386_mxcsr&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.l=
inux&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;orig_eax&quot;, 41, 1, NULL, 32, =
&quot;int&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.a=
vx&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm0h&quot;, 42, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm1h&quot;, 43, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm2h&quot;, 44, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm3h&quot;, 45, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm4h&quot;, 46, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm5h&quot;, 47, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm6h&quot;, 48, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm7h&quot;, 49, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.m=
px&quot;);<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;br128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;lbound&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;ubound_raw&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndstatus&quot;);<br=
>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;bde&quot;, 2, 31);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;error&quot;, 0, 1);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;status&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndstatus&quot;);=
<br>
++=C2=A0 tdesc_add_field (type, &quot;status&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndcfgu&quot;);<br>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;base&quot;, 12, 31);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;reserved&quot;, 2, 11);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;preserved&quot;, 1, 1);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;enabled&quot;, 0, 1);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;cfgu&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndcfgu&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;config&quot;, field_type);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 50, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 51, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 52, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 53, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 54, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 55, 1, NULL, 64,=
 &quot;status&quot;);<br>
++<br>
++=C2=A0 tdesc_i386_avx_mpx_linux =3D result;<br>
++}<br>
+Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.xml<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx-linux.xml<br>
+@@ -0,0 +1,19 @@<br>
++&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
++&lt;!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0Copying and distribution of this file, with or withou=
t modification,<br>
++=C2=A0 =C2=A0 =C2=A0are permitted in any medium without royalty provided =
the copyright<br>
++=C2=A0 =C2=A0 =C2=A0notice and this notice are preserved.=C2=A0 --&gt;<br=
>
++<br>
++&lt;!-- I386 with AVX and MPX- Includes Linux-only special &quot;register=
&quot;.=C2=A0 --&gt;<br>
++<br>
++&lt;!DOCTYPE target SYSTEM &quot;gdb-target.dtd&quot;&gt;<br>
++&lt;target&gt;<br>
++=C2=A0 &lt;architecture&gt;i386&lt;/architecture&gt;<br>
++=C2=A0 &lt;osabi&gt;GNU/Linux&lt;/osabi&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-core.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-sse.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-linux.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-avx.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-mpx.xml&quot;/&gt;<br>
++&lt;/target&gt;<br>
+Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx.c<br>
+@@ -0,0 +1,182 @@<br>
++/* THIS FILE IS GENERATED.=C2=A0 -*- buffer-read-only: t -*- vi:set ro:<b=
r>
++=C2=A0 Original: i386-avx-mpx.xml */<br>
++<br>
++#include &quot;defs.h&quot;<br>
++#include &quot;osabi.h&quot;<br>
++#include &quot;target-descriptions.h&quot;<br>
++<br>
++struct target_desc *tdesc_i386_avx_mpx;<br>
++static void<br>
++initialize_tdesc_i386_avx_mpx (void)<br>
++{<br>
++=C2=A0 struct target_desc *result =3D allocate_target_description ();<br>
++=C2=A0 struct tdesc_feature *feature;<br>
++=C2=A0 struct tdesc_type *field_type;<br>
++=C2=A0 struct tdesc_type *type;<br>
++<br>
++=C2=A0 set_tdesc_architecture (result, bfd_scan_arch (&quot;i386&quot;));=
<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.c=
ore&quot;);<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_eflags&quot=
;, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;CF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;PF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;AF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;ZF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;SF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;TF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;IF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;DF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;OF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 14, &quot;NT&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 16, &quot;RF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 17, &quot;VM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 18, &quot;AC&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 19, &quot;VIF&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 20, &quot;VIP&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 21, &quot;ID&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eax&quot;, 0, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ecx&quot;, 1, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;edx&quot;, 2, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ebx&quot;, 3, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;esp&quot;, 4, 1, NULL, 32, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ebp&quot;, 5, 1, NULL, 32, &quot;=
data_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;esi&quot;, 6, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;edi&quot;, 7, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eip&quot;, 8, 1, NULL, 32, &quot;=
code_ptr&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;eflags&quot;, 9, 1, NULL, 32, &qu=
ot;i386_eflags&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;cs&quot;, 10, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ss&quot;, 11, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ds&quot;, 12, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;es&quot;, 13, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fs&quot;, 14, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;gs&quot;, 15, 1, NULL, 32, &quot;=
int32&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st0&quot;, 16, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st1&quot;, 17, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st2&quot;, 18, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st3&quot;, 19, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st4&quot;, 20, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st5&quot;, 21, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st6&quot;, 22, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;st7&quot;, 23, 1, NULL, 80, &quot=
;i387_ext&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fctrl&quot;, 24, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fstat&quot;, 25, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ftag&quot;, 26, 1, &quot;float&qu=
ot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fiseg&quot;, 27, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fioff&quot;, 28, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;foseg&quot;, 29, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fooff&quot;, 30, 1, &quot;float&q=
uot;, 32, &quot;int&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;fop&quot;, 31, 1, &quot;float&quo=
t;, 32, &quot;int&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.s=
se&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_single&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4f&quot;, field_type, 4);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;ieee_double&quot;)=
;<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2d&quot;, field_type, 2);<br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int8&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v16i8&quot;, field_type, 16);<=
br>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int16&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v8i16&quot;, field_type, 8);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int32&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v4i32&quot;, field_type, 4);<b=
r>
++<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;int64&quot;);<br>
++=C2=A0 tdesc_create_vector (feature, &quot;v2i64&quot;, field_type, 2);<b=
r>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;vec128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4f&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_float&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2d&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_double&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v16i8&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v16_int8&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v8i16&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v8_int16&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v4i32&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v4_int32&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;v2i64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;v2_int64&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint128&quot;);<br=
>
++=C2=A0 tdesc_add_field (type, &quot;uint128&quot;, field_type);<br>
++<br>
++=C2=A0 field_type =3D tdesc_create_flags (feature, &quot;i386_mxcsr&quot;=
, 4);<br>
++=C2=A0 tdesc_add_flag (field_type, 0, &quot;IE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 1, &quot;DE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 2, &quot;ZE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 3, &quot;OE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 4, &quot;UE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 5, &quot;PE&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 6, &quot;DAZ&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 7, &quot;IM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 8, &quot;DM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 9, &quot;ZM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 10, &quot;OM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 11, &quot;UM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 12, &quot;PM&quot;);<br>
++=C2=A0 tdesc_add_flag (field_type, 15, &quot;FZ&quot;);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm0&quot;, 32, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm1&quot;, 33, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm2&quot;, 34, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm3&quot;, 35, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm4&quot;, 36, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm5&quot;, 37, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm6&quot;, 38, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;xmm7&quot;, 39, 1, NULL, 128, &qu=
ot;vec128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;mxcsr&quot;, 40, 1, &quot;vector&=
quot;, 32, &quot;i386_mxcsr&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.a=
vx&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm0h&quot;, 41, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm1h&quot;, 42, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm2h&quot;, 43, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm3h&quot;, 44, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm4h&quot;, 45, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm5h&quot;, 46, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm6h&quot;, 47, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;ymm7h&quot;, 48, 1, NULL, 128, &q=
uot;uint128&quot;);<br>
++<br>
++=C2=A0 feature =3D tdesc_create_feature (result, &quot;org.gnu.gdb.i386.m=
px&quot;);<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;br128&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;lbound&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;uint64&quot;);<br>
++=C2=A0 tdesc_add_field (type, &quot;ubound_raw&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndstatus&quot;);<br=
>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;bde&quot;, 2, 31);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;error&quot;, 0, 1);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;status&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndstatus&quot;);=
<br>
++=C2=A0 tdesc_add_field (type, &quot;status&quot;, field_type);<br>
++<br>
++=C2=A0 type =3D tdesc_create_struct (feature, &quot;_bndcfgu&quot;);<br>
++=C2=A0 tdesc_set_struct_size (type, 8);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;base&quot;, 12, 31);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;reserved&quot;, 2, 11);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;preserved&quot;, 1, 1);<br>
++=C2=A0 tdesc_add_bitfield (type, &quot;enabled&quot;, 0, 1);<br>
++<br>
++=C2=A0 type =3D tdesc_create_union (feature, &quot;cfgu&quot;);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;data_ptr&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;raw&quot;, field_type);<br>
++=C2=A0 field_type =3D tdesc_named_type (feature, &quot;_bndcfgu&quot;);<b=
r>
++=C2=A0 tdesc_add_field (type, &quot;config&quot;, field_type);<br>
++<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd0raw&quot;, 49, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd1raw&quot;, 50, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd2raw&quot;, 51, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bnd3raw&quot;, 52, 1, NULL, 128, =
&quot;br128&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndcfgu&quot;, 53, 1, NULL, 64, &=
quot;cfgu&quot;);<br>
++=C2=A0 tdesc_create_reg (feature, &quot;bndstatus&quot;, 54, 1, NULL, 64,=
 &quot;status&quot;);<br>
++<br>
++=C2=A0 tdesc_i386_avx_mpx =3D result;<br>
++}<br>
+Index: gdb-7.9.1/gdb/features/i386/i386-avx-mpx.xml<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ gdb-7.9.1/gdb/features/i386/i386-avx-mpx.xml<br>
+@@ -0,0 +1,17 @@<br>
++&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
++&lt;!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0Copying and distribution of this file, with or withou=
t modification,<br>
++=C2=A0 =C2=A0 =C2=A0are permitted in any medium without royalty provided =
the copyright<br>
++=C2=A0 =C2=A0 =C2=A0notice and this notice are preserved.=C2=A0 --&gt;<br=
>
++<br>
++&lt;!-- I386 with AVX and MPX --&gt;<br>
++<br>
++&lt;!DOCTYPE target SYSTEM &quot;gdb-target.dtd&quot;&gt;<br>
++&lt;target&gt;<br>
++=C2=A0 &lt;architecture&gt;i386&lt;/architecture&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-core.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-sse.xml&quot;/&gt;<br>
++=C2=A0 &lt;xi:include href=3D&quot;32bit-avx.xml&quot;/&gt;<br>
++=C2=A0 --<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--001a11399e2e5f9b940532f5e7c3--
