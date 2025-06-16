Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914EDC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 10:51:14 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.27622.1750071067504085721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 03:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z09iSZQ8;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2fa3957661so3596368a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071067; x=1750675867; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=31bLhDcdc21HRs/2aDh77bd0qagDOVovlyISEzcBje0=;
        b=Z09iSZQ8XSAjHSZIEjgPJlpGvfVsPRMBbWBQ2KVM5kTTC6qRo6eeL84v7lYNk240SJ
         utaV2tdXjCfGw3xlFxuIl3XuQ3tVpysWujIE2np3j+0GK+Nq+hyGnyn7Ow3PazeOMekH
         ZszBFE7gxNoOAGA9XKizJsUCkAv8ChklzGEgospVmtQEhug70dJh09+6C1sQ9l4ACt1M
         UYpAxGWYre6Wu94H9pd/vLlSYcV2fGX7nVjx7mwJe8jfowk3u/455oErDYGZPQDcxpbh
         NMfUHKl1Dd2DXUX2zDgb+Hc/bFsevdCdvaBCUok7NyNqbonpQCx+qFnXiwi4bGvzEwV6
         ZeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071067; x=1750675867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31bLhDcdc21HRs/2aDh77bd0qagDOVovlyISEzcBje0=;
        b=aNyQns9UR2WQ/WY4bRTs0nHe+C0qs9j3XhxNbcOLDGyiJFxo4Lu371Epvw5OVnoyaf
         hVGpwhNkAXs85SU3d7BwwGiZJOzlHC0hzA8x7WfMRlIV5VtJNSQBI89c/UpoqwBGJLIV
         cB2mldZ7yrA4e9WNnDy/6JmDHeVldJMIHc1XjSnjdf4ACuElSiBTdo7NmFi7+HZqnMlM
         +81x6rHZhklwoZDujrlnAPP7u694CP+aNuzgZVMxheSHmmRDReTFipTIwF8MuOHWsF06
         oj3oYYwExzuzLvxVMBAEwykxKnDoX9aIJf+B1SVyTq1eQxXihr7D0C/FAsGjIDJ8AXRf
         RFNA==
X-Gm-Message-State: AOJu0Yzajx0KprqHLnJtdIZ+vBjTo5+C/3kCAmcsgFtJTJUatSf6twjr
	KPhCdcK2NCV3NAGctwAk6FuvwVQT4P9E97Y0rNHw3RyoJACOksuuwRH5SjiGWGf7XYI481tDxBt
	K40Nne4TF4WZUDKfH7IoWv0Ox3XxGMkc=
X-Gm-Gg: ASbGnctVlFd0UUW5XV7ibTJeLvPMr7oPI5cqL0UhMPUwhm4xsmhy8xQym8F9bHitaCG
	1V1bL3AAa68cyUAPhM20fauKAXonQpXVWm/QDviS/6xTg41F1FjDX3xAbJ0jq27oJXbG69ulAKD
	atD9XxaLiBvhuMfj6Mb8EwMu2st7UNIJ4wmLq44F2HERtq
X-Google-Smtp-Source: AGHT+IHLBp2hUQNy6ndXHLvXnTL4ySurOO+9wgQXPjWZE/0q1JrpE71IODNNwnm74913cwRiI50G8876LqeoXmosMuM=
X-Received: by 2002:a17:90b:2745:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-313f1c7b54dmr12556587a91.6.1750071066717; Mon, 16 Jun 2025
 03:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org> <1750040965-15015-3-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1750040965-15015-3-git-send-email-mark.hatle@kernel.crashing.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Jun 2025 06:50:55 -0400
X-Gm-Features: AX0GCFt-BPpdIKEoY_37dtyfH6p11suUWIFvsg79gm_aO36I_J1jzz6WONLzxJg
Message-ID: <CADkTA4MOF_HiEe8DUYuUvtD=BgXKfv-tdjxSQZHdWZxWhrW=6A@mail.gmail.com>
Subject: Re: [PATCH 2/6] linux-yocto: Enable risc-v TUNE_FEATURES ISA selections
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004371af0637ae2cdf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218811

--0000000000004371af0637ae2cdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 10:30=E2=80=AFPM Mark Hatle <mark.hatle@kernel.cras=
hing.org>
wrote:

> From: Mark Hatle <mark.hatle@amd.com>
>
> Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selection=
s
> in the kernel config via config fragments.
>
> This allows the following items to be selected dynamically:
>
>     CONFIG_ARCH_RV32I
>     CONFIG_ARCH_RV64I
>     CONFIG_FPU
>     CONFIG_RISCV_ISA_C
>     CONFIG_RISCV_ISA_V
>     CONFIG_RISCV_ISA_ZBB
>     CONFIG_RISCV_ISA_ZICBOM
>     CONFIG_RISCV_ISA_ZICBOZ
>     CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>

As you probably suspected, These need to be submitted to the kernel-cache
and enabled via KERNEL_FEATURES additions, not just added to the SRC_URI.

Cheers,

Bruce



>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
>  meta/recipes-kernel/linux/files/risc-v-isa-c.cfg   |  1 +
>  .../linux/files/risc-v-isa-clear.cfg               |  9 +++++++++
>  meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg |  1 +
>  .../linux/files/risc-v-isa-rv32i.cfg               |  2 ++
>  .../linux/files/risc-v-isa-rv64i.cfg               |  2 ++
>  meta/recipes-kernel/linux/files/risc-v-isa-v.cfg   |  1 +
>  meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg |  1 +
>  .../linux/files/risc-v-isa-zicbom.cfg              |  1 +
>  meta/recipes-kernel/linux/linux-yocto.inc          | 14 ++++++++++++++
>  9 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
>
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
> new file mode 100644
> index 0000000000..1cb459f636
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
> @@ -0,0 +1 @@
> +CONFIG_RISCV_ISA_C=3Dy
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
> new file mode 100644
> index 0000000000..ba18d7b9b5
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
> @@ -0,0 +1,9 @@
> +# CONFIG_ARCH_RV32I is not set
> +# CONFIG_ARCH_RV64I is not set
> +# CONFIG_FPU is not set
> +# CONFIG_RISCV_ISA_C is not set
> +# CONFIG_RISCV_ISA_V is not set
> +# CONFIG_RISCV_ISA_ZBB is not set
> +# CONFIG_RISCV_ISA_ZICBOM is not set
> +# CONFIG_RISCV_ISA_ZICBOZ is not set
> +# CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not set
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
> new file mode 100644
> index 0000000000..c099c8e81d
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
> @@ -0,0 +1 @@
> +CONFIG_FPU=3Dy
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
> new file mode 100644
> index 0000000000..4c6bac5138
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_ARCH_RV32I=3Dy
> +CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI=3Dy
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
> new file mode 100644
> index 0000000000..002b492e4c
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_ARCH_RV64I=3Dy
> +CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI=3Dy
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
> new file mode 100644
> index 0000000000..c29c97fc4a
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
> @@ -0,0 +1 @@
> +CONFIG_RISCV_ISA_V=3Dy
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
> new file mode 100644
> index 0000000000..2b71b016f8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
> @@ -0,0 +1 @@
> +CONFIG_RISCV_ISA_ZBB=3Dy
> diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
> b/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
> new file mode 100644
> index 0000000000..96daf04b20
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
> @@ -0,0 +1 @@
> +CONFIG_RISCV_ISA_ZICBOM=3Dy
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 389329030d..cdf2583698 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -37,6 +37,20 @@ KERNEL_FEATURES:append =3D "
> ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES',
> 'numa', 'features/numa/numa.scc', '', d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES',
> 'vfat', 'cfg/fs/vfat.scc', '', d)}"
>
> +SRC_URI_RISCV =3D "\
> +    file://risc-v-isa-clear.cfg \
> +    ${@bb.utils.contains(    "TUNE_FEATURES", "rv 32 i m a",
> "file://risc-v-isa-rv32i.cfg", "", d)} \
> +    ${@bb.utils.contains(    "TUNE_FEATURES", "rv 64 i m a",
> "file://risc-v-isa-rv64i.cfg", "", d)} \
> +    ${@bb.utils.contains(    "TUNE_FEATURES", "f d",
>  "file://risc-v-isa-fpu.cfg",   "", d)} \
> +    ${@bb.utils.contains(    "TUNE_FEATURES", "c",
>  "file://risc-v-isa-c.cfg",     "", d)} \
> +    ${@bb.utils.contains(    "TUNE_FEATURES", "v",
>  "file://risc-v-isa-v.cfg",     "", d)} \
> +    ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",
>  "file://risc-v-isa-zbb.cfg",   "", d)} \
> +    ${@bb.utils.contains(    "TUNE_FEATURES", "zicbom",
> "file://risc-v-isa-zicbom.cfg",   "", d)} \
> +    "
> +
> +SRC_URI:append:riscv32 =3D "${SRC_URI_RISCV}"
> +SRC_URI:append:riscv64 =3D "${SRC_URI_RISCV}"
> +
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004371af0637ae2cdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 15, 2025 at 10:30=
=E2=80=AFPM Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org=
">mark.hatle@kernel.crashing.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Mark Hatle &lt;<a href=3D"mailto:mar=
k.hatle@amd.com" target=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
<br>
Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections<=
br>
in the kernel config via config fragments.<br>
<br>
This allows the following items to be selected dynamically:<br>
<br>
=C2=A0 =C2=A0 CONFIG_ARCH_RV32I<br>
=C2=A0 =C2=A0 CONFIG_ARCH_RV64I<br>
=C2=A0 =C2=A0 CONFIG_FPU<br>
=C2=A0 =C2=A0 CONFIG_RISCV_ISA_C<br>
=C2=A0 =C2=A0 CONFIG_RISCV_ISA_V<br>
=C2=A0 =C2=A0 CONFIG_RISCV_ISA_ZBB<br>
=C2=A0 =C2=A0 CONFIG_RISCV_ISA_ZICBOM<br>
=C2=A0 =C2=A0 CONFIG_RISCV_ISA_ZICBOZ<br>
=C2=A0 =C2=A0 CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">As you probably suspected, These need to be submitted to the kernel-cache=
</div><div class=3D"gmail_default" style=3D"font-size:small">and enabled vi=
a KERNEL_FEATURES additions, not just added to the SRC_URI.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=
=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/files/risc-v-isa-c.cfg=C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../linux/files/risc-v-isa-clear.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++++<br>
=C2=A0meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg |=C2=A0 1 +<br>
=C2=A0.../linux/files/risc-v-isa-rv32i.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0.../linux/files/risc-v-isa-rv64i.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0meta/recipes-kernel/linux/files/risc-v-isa-v.cfg=C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg |=C2=A0 1 +<br>
=C2=A0.../linux/files/risc-v-isa-zicbom.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 14 ++++++++++++++<br>
=C2=A09 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-c.cfg<b=
r>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-clear.c=
fg<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg=
<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv32i.c=
fg<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv64i.c=
fg<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-v.cfg<b=
r>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg=
<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zicbom.=
cfg<br>
<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg b/meta/recipe=
s-kernel/linux/files/risc-v-isa-c.cfg<br>
new file mode 100644<br>
index 0000000000..1cb459f636<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_RISCV_ISA_C=3Dy<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg b/meta/re=
cipes-kernel/linux/files/risc-v-isa-clear.cfg<br>
new file mode 100644<br>
index 0000000000..ba18d7b9b5<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg<br>
@@ -0,0 +1,9 @@<br>
+# CONFIG_ARCH_RV32I is not set<br>
+# CONFIG_ARCH_RV64I is not set<br>
+# CONFIG_FPU is not set<br>
+# CONFIG_RISCV_ISA_C is not set<br>
+# CONFIG_RISCV_ISA_V is not set<br>
+# CONFIG_RISCV_ISA_ZBB is not set<br>
+# CONFIG_RISCV_ISA_ZICBOM is not set<br>
+# CONFIG_RISCV_ISA_ZICBOZ is not set<br>
+# CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not set<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg b/meta/reci=
pes-kernel/linux/files/risc-v-isa-fpu.cfg<br>
new file mode 100644<br>
index 0000000000..c099c8e81d<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_FPU=3Dy<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg b/meta/re=
cipes-kernel/linux/files/risc-v-isa-rv32i.cfg<br>
new file mode 100644<br>
index 0000000000..4c6bac5138<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg<br>
@@ -0,0 +1,2 @@<br>
+CONFIG_ARCH_RV32I=3Dy<br>
+CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI=3Dy<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg b/meta/re=
cipes-kernel/linux/files/risc-v-isa-rv64i.cfg<br>
new file mode 100644<br>
index 0000000000..002b492e4c<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg<br>
@@ -0,0 +1,2 @@<br>
+CONFIG_ARCH_RV64I=3Dy<br>
+CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI=3Dy<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg b/meta/recipe=
s-kernel/linux/files/risc-v-isa-v.cfg<br>
new file mode 100644<br>
index 0000000000..c29c97fc4a<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_RISCV_ISA_V=3Dy<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg b/meta/reci=
pes-kernel/linux/files/risc-v-isa-zbb.cfg<br>
new file mode 100644<br>
index 0000000000..2b71b016f8<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_RISCV_ISA_ZBB=3Dy<br>
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg b/meta/r=
ecipes-kernel/linux/files/risc-v-isa-zicbom.cfg<br>
new file mode 100644<br>
index 0000000000..96daf04b20<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_RISCV_ISA_ZICBOM=3Dy<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index 389329030d..cdf2583698 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -37,6 +37,20 @@ KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&=
#39;MACHINE_FEATURES&#39;, &#39;efi&#39;, &#39;cfg/<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;MACHINE_F=
EATURES&#39;, &#39;numa&#39;, &#39;features/numa/numa.scc&#39;, &#39;&#39;,=
 d)}&quot;<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;MACHINE_F=
EATURES&#39;, &#39;vfat&#39;, &#39;cfg/fs/vfat.scc&#39;, &#39;&#39;, d)}&qu=
ot;<br>
<br>
+SRC_URI_RISCV =3D &quot;\<br>
+=C2=A0 =C2=A0 file://risc-v-isa-clear.cfg \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &quot;TUNE_FEATURES&quot;=
, &quot;rv 32 i m a&quot;, &quot;file://risc-v-isa-rv32i.cfg&quot;, &quot;&=
quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &quot;TUNE_FEATURES&quot;=
, &quot;rv 64 i m a&quot;, &quot;file://risc-v-isa-rv64i.cfg&quot;, &quot;&=
quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &quot;TUNE_FEATURES&quot;=
, &quot;f d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;file://risc-v-isa=
-fpu.cfg&quot;,=C2=A0 =C2=A0&quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &quot;TUNE_FEATURES&quot;=
, &quot;c&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;file://risc-=
v-isa-c.cfg&quot;,=C2=A0 =C2=A0 =C2=A0&quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &quot;TUNE_FEATURES&quot;=
, &quot;v&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;file://risc-=
v-isa-v.cfg&quot;,=C2=A0 =C2=A0 =C2=A0&quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains_any(&quot;TUNE_FEATURES&quot;, &quot;b =
zbb&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;file://risc-v-isa-zbb.cfg&quot;,=
=C2=A0 =C2=A0&quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &quot;TUNE_FEATURES&quot;=
, &quot;zicbom&quot;,=C2=A0 =C2=A0 =C2=A0 &quot;file://risc-v-isa-zicbom.cf=
g&quot;,=C2=A0 =C2=A0&quot;&quot;, d)} \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI:append:riscv32 =3D &quot;${SRC_URI_RISCV}&quot;<br>
+SRC_URI:append:riscv64 =3D &quot;${SRC_URI_RISCV}&quot;<br>
+<br>
=C2=A0# A KMACHINE is the mapping of a yocto $MACHINE to what is built<br>
=C2=A0# by the kernel. This is typically the branch that should be built,<b=
r>
=C2=A0# and it can be specific to the machine or shared<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000004371af0637ae2cdf--

