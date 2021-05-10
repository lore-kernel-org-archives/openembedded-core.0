Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.33565.1620660991161479352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 08:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: aehs29@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id q136so15690198qka.7
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 08:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s1mv5Lp6swMbE4f6VOJS3Vj84CmjbeNsmoRmbYq7ssA=;
        b=QD0/wOGO3BN/coDWvbuM2fEdY7o0smLR2yFsOql2Xv6eKjLnWm5y9z/FNBMrYBUJPN
         d7QNyLaYGvGHEGg0xBRo59XV9q4RaTj3Z16PrkbOY8uGK5tnmecsP5Fl9i2ElfCcDnE5
         mvjemXfZlNlXZvOJP4nYIgl0JbWNpyN9taMfVoLSZ3H4dZ1iWjSsM9GiAGMniu4Zx3Gb
         geaiifwCVhTWaxtiyf3sTkY9BqoTpT0xm5gxxBb6TYsMBIDZN83o+KZi4XS3gABvLNUn
         Q31qi80V/JKX4gtS74aZDYrKReHmkY3Yt2ecWiLLvs911dYBPmwkJhwV+PG1Vxx178dF
         dkYQ==
X-Gm-Message-State: AOAM532ndzyvAeo6hoc0eccM8lIs0vU3gM9NklN9sX8/x2BDM9Hge+FK
	jzKiC4Vqo+tQV3clG8/3BRtnXGNwYSuFbA==
X-Google-Smtp-Source: ABdhPJxQGgmVTTR07NG/UTh2K06Z7gVDHat4b0YMW0kefQ2GoluRMR/1fnH2k06c6QXHTYeFz1ag6w==
X-Received: by 2002:a37:7bc5:: with SMTP id w188mr9164467qkc.148.1620660990068;
        Mon, 10 May 2021 08:36:30 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id b8sm11920856qtj.37.2021.05.10.08.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 08:36:29 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id x8so15724660qkl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 08:36:29 -0700 (PDT)
X-Received: by 2002:a37:f604:: with SMTP id y4mr3273941qkj.207.1620660989408;
 Mon, 10 May 2021 08:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210508083031.1448886-1-alejandro@enedino.org> <CAKmqyKNVQQf6fsKaHT=_T_5GFOnNytqaXoisYQ7eDiFLK_1N5A@mail.gmail.com>
In-Reply-To: <CAKmqyKNVQQf6fsKaHT=_T_5GFOnNytqaXoisYQ7eDiFLK_1N5A@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Mon, 10 May 2021 09:36:17 -0600
X-Gmail-Original-Message-ID: <CAHMutrYTzT4ouvQw2HAY1KjiwuOwYfRUuLyE2HePTSR+HC4KrQ@mail.gmail.com>
Message-ID: <CAHMutrYTzT4ouvQw2HAY1KjiwuOwYfRUuLyE2HePTSR+HC4KrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Enable RISC-V 64 port
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000933a1005c1fb8a7f"

--000000000000933a1005c1fb8a7f
Content-Type: text/plain; charset="UTF-8"

On Sun, May 9, 2021, 7:25 PM Alistair Francis <alistair23@gmail.com> wrote:

> On Sat, May 8, 2021 at 6:30 PM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Add support for MACHINE=qemuriscv64.
> >
> > $ runqemu nographic
> >
> > BIOS:
> [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuriscv64.elf]
> > MACHINE: [qemuriscv64]
> >
> > runqemu - INFO - Running
> tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv64
> >
> > Hello OpenEmbedded on RISC-V 64!
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../baremetal-examples/baremetal-helloworld_git.bb   | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> b/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > index ee945c1ff0..3b7b8193a7 100644
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
> > @@ -49,3 +50,10 @@ FILES_${PN} += " \
> >      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
> >      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
> >  "
> > +
> > +# RISC-V tunes set the BIOS, redefine since runqemu jumps there
> > +QB_DEFAULT_BIOS_qemuriscv64 = "${IMAGE_LINK_NAME}.elf"
>
>
>
> Hey Alistair,

The issue here is that the runqemu script doesn't have wiring to pass
"-bios none", if a Bios isn't defined the bios paremeter isn't passed at
all and it ends up booting to opensbi, if it makes more sense I can force
"-bios none" using QB_OPT_APPEND and unset QB_DEFAULT_BIOS

Cheers,

Alejandro


> You should also just be able to say `-bios none` and then use the
> -kernel argument as normal.
>
> Alistair
>
> > +
> > +# Use the medium-any code model for the RISC-V 64 bit implementation,
> > +# since medlow can only access addresses below 0x80000000
> > +CFLAGS_append_qemuriscv64 = " -mcmodel=medany"
> > --
> > 2.25.1
> >
> >
> > 
> >
>

--000000000000933a1005c1fb8a7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 9, 2021, 7:25 PM Alistair Francis &lt;<a h=
ref=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Sat, May 8, 2021 at 6:30 PM Alejand=
ro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"nore=
ferrer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Add support for MACHINE=3Dqemuriscv64.<br>
&gt;<br>
&gt; $ runqemu nographic<br>
&gt;<br>
&gt; BIOS: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemur=
iscv64.elf]<br>
&gt; MACHINE: [qemuriscv64]<br>
&gt;<br>
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
_git.bb</a>=C2=A0 =C2=A0| 12 ++++++++++--<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/<a hr=
ef=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">baremetal-helloworld_git.bb</a> b/meta-skeleton/recipes-bare=
metal/baremetal-examples/<a href=3D"http://baremetal-helloworld_git.bb" rel=
=
=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</=
a><br>
&gt; index ee945c1ff0..3b7b8193a7 100644<br>
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
&gt; @@ -49,3 +50,10 @@ FILES_${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf =
\<br>
&gt;=C2=A0 &quot;<br>
&gt; +<br>
&gt; +# RISC-V tunes set the BIOS, redefine since runqemu jumps there<br>
&gt; +QB_DEFAULT_BIOS_qemuriscv64 =3D &quot;${IMAGE_LINK_NAME}.elf&quot;<b=
r>
<br><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div=
></div><div dir=3D"auto">Hey Alistair,</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">The issue here is that the runqemu script doesn&#39;t have w=
iring to pass &quot;-bios none&quot;, if a Bios isn&#39;t defined the bios =
paremeter isn&#39;t passed at all and it ends up booting to opensbi, if it =
makes more sense I can force &quot;-bios none&quot; using QB_OPT_APPEND and=
 unset QB_DEFAULT_BIOS</div><div dir=3D"auto"><br></div><div dir=3D"auto">C=
heers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><br>
You should also just be able to say `-bios none` and then use the<br>
-kernel argument as normal.<br>
<br>
Alistair<br>
<br>
&gt; +<br>
&gt; +# Use the medium-any code model for the RISC-V 64 bit implementation=
,<br>
&gt; +# since medlow can only access addresses below 0x80000000<br>
&gt; +CFLAGS_append_qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div></div>

--000000000000933a1005c1fb8a7f--
