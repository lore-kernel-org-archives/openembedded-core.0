Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.9024.1620713303491234626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 23:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: aehs29@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id x8so17764030qkl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 23:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/0F/BU7bw6WsmP4iRbdor9wJQqkEU2TWFbbtJmVq2Q=;
        b=i0JrndOO1LdIwHwI2XW90HJT1ATjcWN4FUT/r0oOXxbxUnheYEEuG7sRqGO5tPOVmd
         /ZwPGUjT/deGjSrkutf1ycZNrwZc+yzhBd7ipG+9F75SwVTpVGAOu6wSoALAQgRZsNyE
         Ie7oP+XScIUhsPKOXI9Ha/bnKRyFLbeeOCmRPL9Bk+EQgMo0w4iGv4TAGj7eqyxr6HLi
         7bZH5xelQZrjOgc3DhXhBi+tf1o3K8ibrUzpU2QeQXve9a3NYvMti5sDqOV1TFHCxwl9
         AlWvQuNHFrxfMcdXGX5TIcTgPbIAKhjnZ4xiqXQGpxNe6JhXjLnxqyvGEuM/NzZN8Jhb
         drGA==
X-Gm-Message-State: AOAM533NDpcjz9Mv1ealfqNNp+p2lg3yiN3FpvXCw6jDK2QT3k+XN0sW
	Dc2lrYzpqfnz6bgNvnt0BE4BR0+b4cqINQ==
X-Google-Smtp-Source: ABdhPJz2Eq16yWak6ptQ4eNwVS3emWSs9suN1KPDBgjdnutvZ5IkRHv/C5hriERqKVlaW3bZBWW1MQ==
X-Received: by 2002:a05:620a:2282:: with SMTP id o2mr26012364qkh.479.1620713302382;
        Mon, 10 May 2021 23:08:22 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id x142sm4069993qkb.136.2021.05.10.23.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 23:08:22 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id t20so9559120qtx.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 23:08:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1789:: with SMTP id s9mr493121qtk.92.1620713301839;
 Mon, 10 May 2021 23:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210511053134.3353286-1-alejandro@enedino.org> <CAKmqyKPPOb6ZdqYnU=5Px6VVa365y-5k0qWgvV7Ot+wjsXUp=A@mail.gmail.com>
In-Reply-To: <CAKmqyKPPOb6ZdqYnU=5Px6VVa365y-5k0qWgvV7Ot+wjsXUp=A@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Tue, 11 May 2021 00:08:09 -0600
X-Gmail-Original-Message-ID: <CAHMutrZPynwbE2_rar_SSEfpZEbN6E5FWU7t0ogb88ht2Kv9fQ@mail.gmail.com>
Message-ID: <CAHMutrZPynwbE2_rar_SSEfpZEbN6E5FWU7t0ogb88ht2Kv9fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] baremetal-helloworld: Enable RISC-V 64 port
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a3956b05c207b858"

--000000000000a3956b05c207b858
Content-Type: text/plain; charset="UTF-8"

On Mon, May 10, 2021, 11:59 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, May 11, 2021 at 3:31 PM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Add support for MACHINE=qemuriscv64.
> >
> > $ runqemu nographic
> >
> > KERNEL:
> [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuriscv64.bin]
> > MACHINE: [qemuriscv64]
> > FSTYPE: [bin]
> >

> runqemu - INFO - Running
> tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv64
> >
> > Hello OpenEmbedded on RISC-V 64!
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../baremetal-examples/baremetal-helloworld_git.bb |  5 +++--
> >  meta/classes/baremetal-image.bbclass               | 14 +++++++++++++-
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> b/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > index ee945c1ff0..19ef16988f 100644
> > --- a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION = "These are introductory examples to
> showcase the use of QEMU to ru
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
> >
> > -SRCREV = "99f4fa4a3b266b42b52af302610b0f4f429ba5e3"
> > +SRCREV = "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
> >  PV = "0.1+git${SRCPV}"
> >
> >  SRC_URI = "git://
> github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
> > @@ -28,12 +28,13 @@ inherit baremetal-image
> >  # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
> >  # but the examples can also be run on other architectures/machines
> >  # such as vexpress-a15 by overriding the setting on the machine.conf
> > -COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64"
> > +COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
> >
> >  BAREMETAL_QEMUARCH ?= ""
> >  BAREMETAL_QEMUARCH_qemuarmv5 = "versatile"
> >  BAREMETAL_QEMUARCH_qemuarm = "arm"
> >  BAREMETAL_QEMUARCH_qemuarm64 = "aarch64"
> > +BAREMETAL_QEMUARCH_qemuriscv64 = "riscv64"
> >
> >  EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
> >
> > diff --git a/meta/classes/baremetal-image.bbclass
> b/meta/classes/baremetal-image.bbclass
> > index b0f5e885b5..319b61c7cd 100644
> > --- a/meta/classes/baremetal-image.bbclass
> > +++ b/meta/classes/baremetal-image.bbclass
> > @@ -73,7 +73,19 @@ QB_DEFAULT_KERNEL ?= "${IMAGE_LINK_NAME}.bin"
> >  QB_MEM ?= "-m 256"
> >  QB_DEFAULT_FSTYPE ?= "bin"
> >  QB_DTB ?= ""
> > -QB_OPT_APPEND = "-nographic"
> > +QB_OPT_APPEND_append = " -nographic"
> > +
> > +# RISC-V tunes set the BIOS, unset, and instruct QEMU to
> > +# ignore the BIOS and boot from -kernel
> > +QB_DEFAULT_BIOS_qemuriscv64 = ""
> > +QB_OPT_APPEND_append_qemuriscv64 = " -bios none"
>
> Sorry, I forgot to reply to the other thread.
>
> Can't you just set QB_DEFAULT_BIOS to "none"?
>
> Alistair


> > +


No problem, and nope, runqemu will behave the same way (doesn't pass -bios
at all) if QB_DEFAULT_BIOS is either set to an empty string or "none" which
means passing QB_OPT_APPEND is still required

> +
> > +# Use the medium-any code model for the RISC-V 64 bit implementation,
> > +# since medlow can only access addresses below 0x80000000 and RAM
> > +# starts at 0x80000000 on RISC-V 64
> > +CFLAGS_append_qemuriscv64 = " -mcmodel=medany"
> > +
> >
> >  # This next part is necessary to trick the build system into thinking
> >  # its building an image recipe so it generates the qemuboot.conf
> > --
> > 2.25.1
> >
> >
> > 
> >
>

--000000000000a3956b05c207b858
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, May 10, 2021, 11:59 PM Alistair Francis &lt;<a=
 href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Tue, May 11, 2021 at 3:31 PM Alej=
andro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"nore=
ferrer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Add support for MACHINE=3Dqemuriscv64.<br>
&gt;<br>
&gt; $ runqemu nographic<br>
&gt;<br>
&gt; KERNEL: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qem=
uriscv64.bin]<br>
&gt; MACHINE: [qemuriscv64]<br>
&gt; FSTYPE: [bin]<br>
&gt;</blockquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
&gt; runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0=
-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv64<br>
&gt;<br>
&gt; Hello OpenEmbedded on RISC-V 64!<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"m=
ailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro=
@enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../baremetal-examples/<a href=3D"http://baremetal-helloworld_g=
it.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld=
_git.bb</a> |=C2=A0 5 +++--<br>
&gt;=C2=A0 meta/classes/baremetal-image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++++++++-<br>
&gt;=C2=A0 2 files changed, 16 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/<a hr=
ef=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">baremetal-helloworld_git.bb</a> b/meta-skeleton/recipes-bare=
metal/baremetal-examples/<a href=3D"http://baremetal-helloworld_git.bb" rel=
=
=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</=
a><br>
&gt; index ee945c1ff0..19ef16988f 100644<br>
&gt; --- a/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=3D"h=
ttp://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">baremetal-helloworld_git.bb</a><br>
&gt; +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=3D"h=
ttp://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">baremetal-helloworld_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;These are introductory examples=
 to showcase the use of QEMU to ru<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D39346640a23c701=
e4f459e05f56f4449&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;99f4fa4a3b266b42b52af302610b0f4f429ba5e3&quot;<br>
&gt; +SRCREV =3D &quot;0bf9ea216e6f76be50726a3a74e527b7bbb0ad93&quot;<br>
&gt;=C2=A0 PV =3D &quot;0.1+git${SRCPV}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/aehs29/bar=
emetal-helloqemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer no=
referrer" target=3D"_blank">github.com/aehs29/baremetal-helloqemu.git;proto=
col=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt; @@ -28,12 +28,13 @@ inherit baremetal-image<br>
&gt;=C2=A0 # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-=
a57<br>
&gt;=C2=A0 # but the examples can also be run on other architectures/machi=
nes<br>
&gt;=C2=A0 # such as vexpress-a15 by overriding the setting on the machine=
.conf<br>
&gt; -COMPATIBLE_MACHINE =3D &quot;qemuarmv5|qemuarm|qemuarm64&quot;<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarmv5|qemuarm|qemuarm64|qemuriscv64=
&quot;<br>
&gt;<br>
&gt;=C2=A0 BAREMETAL_QEMUARCH ?=3D &quot;&quot;<br>
&gt;=C2=A0 BAREMETAL_QEMUARCH_qemuarmv5 =3D &quot;versatile&quot;<br>
&gt;=C2=A0 BAREMETAL_QEMUARCH_qemuarm =3D &quot;arm&quot;<br>
&gt;=C2=A0 BAREMETAL_QEMUARCH_qemuarm64 =3D &quot;aarch64&quot;<br>
&gt; +BAREMETAL_QEMUARCH_qemuriscv64 =3D &quot;riscv64&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OEMAKE_append =3D &quot; QEMUARCH=3D${BAREMETAL_QEMUARCH}=
 V=3D1&quot;<br>
&gt;<br>
&gt; diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/bare=
metal-image.bbclass<br>
&gt; index b0f5e885b5..319b61c7cd 100644<br>
&gt; --- a/meta/classes/baremetal-image.bbclass<br>
&gt; +++ b/meta/classes/baremetal-image.bbclass<br>
&gt; @@ -73,7 +73,19 @@ QB_DEFAULT_KERNEL ?=3D &quot;${IMAGE_LINK_NAME}.bi=
n&quot;<br>
&gt;=C2=A0 QB_MEM ?=3D &quot;-m 256&quot;<br>
&gt;=C2=A0 QB_DEFAULT_FSTYPE ?=3D &quot;bin&quot;<br>
&gt;=C2=A0 QB_DTB ?=3D &quot;&quot;<br>
&gt; -QB_OPT_APPEND =3D &quot;-nographic&quot;<br>
&gt; +QB_OPT_APPEND_append =3D &quot; -nographic&quot;<br>
&gt; +<br>
&gt; +# RISC-V tunes set the BIOS, unset, and instruct QEMU to<br>
&gt; +# ignore the BIOS and boot from -kernel<br>
&gt; +QB_DEFAULT_BIOS_qemuriscv64 =3D &quot;&quot;<br>
&gt; +QB_OPT_APPEND_append_qemuriscv64 =3D &quot; -bios none&quot;<br>
<br>
Sorry, I forgot to reply to the other thread.<br>
<br>
Can&#39;t you just set QB_DEFAULT_BIOS to &quot;none&quot;?<br>
<br>
Alistair</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
&gt; +</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"></div><div dir=3D"auto">No problem, and nope, runqemu will behave the sa=
me way (doesn&#39;t pass -bios at all) if QB_DEFAULT_BIOS is either set to =
an empty string or &quot;none&quot; which means passing QB_OPT_APPEND is st=
ill required</div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +<br>
&gt; +# Use the medium-any code model for the RISC-V 64 bit implementation=
,<br>
&gt; +# since medlow can only access addresses below 0x80000000 and RAM<br=
>
&gt; +# starts at 0x80000000 on RISC-V 64<br>
&gt; +CFLAGS_append_qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 # This next part is necessary to trick the build system into th=
inking<br>
&gt;=C2=A0 # its building an image recipe so it generates the qemuboot.con=
f<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div></div>

--000000000000a3956b05c207b858--
