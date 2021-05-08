Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.11325.1620507149853065689
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 13:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: aehs29@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id n22so9214005qtk.9
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 13:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmPAjapNZq54CPbFjqyMKwvmRphd0P7FZp+yn0Unru0=;
        b=pMEcqYFUX+7g/aNnA5L8/j/PugLlNBQ4z+OloZf9MLqnZCJSma0yNHbXffc3n/rIYE
         2Sp++FMOTAyOEVedCDngSG30jxHoYp7RYkaREjx3rWrQKw7eCyTAvHXYpVxNJdU56AlK
         MLE0OwN5im/q9946Mk0e+gesbGkinCcEbCAAYSDTtSnC2bc1FbizbapPEHRpziA+DkNo
         qEy6xr3X1RXtlomNn2PuBXfkXpgXSAX0CV37nAN4miECWKh0cxlWLkAzthiQ/RtGdNTl
         SVacld9M4LLNBkbLkGLixE89i/GBK1fbMIARKVkWsTM8ch6JCADzazKCvhuVVi9GWe+Z
         QBZA==
X-Gm-Message-State: AOAM5323s/GLQZT8QE602T08fkgcg8TKb8mw8+d610LxfavwGjxb2e9w
	Hl+fkyWSmWCCL60zAO4luS0Xh2hwW6SWGA==
X-Google-Smtp-Source: ABdhPJxBoE8P9SGdblJEeqR75kww5Ls1jqZW7sVZFSNA3TrQDwFKn9I1x1NvyF9phnHzLMexySeE/Q==
X-Received: by 2002:ac8:48cf:: with SMTP id l15mr14627049qtr.283.1620507148707;
        Sat, 08 May 2021 13:52:28 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d23sm3014019qtg.69.2021.05.08.13.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 13:52:28 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id t7so9246822qtn.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 13:52:28 -0700 (PDT)
X-Received: by 2002:ac8:4710:: with SMTP id f16mr11697276qtp.250.1620507148047;
 Sat, 08 May 2021 13:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210508083031.1448886-1-alejandro@enedino.org> <CAMKF1spzTGhbLjcx6sW_J51ADSDRFj3sPfnb6wa=VUqam_0H+g@mail.gmail.com>
In-Reply-To: <CAMKF1spzTGhbLjcx6sW_J51ADSDRFj3sPfnb6wa=VUqam_0H+g@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Sat, 8 May 2021 13:52:17 -0700
X-Gmail-Original-Message-ID: <CAHMutrYKj=5Ny6U5xfQEk-uqzE8mcB_hJMjc+JpNkurBeEkRJg@mail.gmail.com>
Message-ID: <CAHMutrYKj=5Ny6U5xfQEk-uqzE8mcB_hJMjc+JpNkurBeEkRJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Enable RISC-V 64 port
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ea5dfc05c1d7b857"

--000000000000ea5dfc05c1d7b857
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 May 2021 at 09:16, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, May 8, 2021 at 1:30 AM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Add support for MACHINE=3Dqemuriscv64.
> >
> > $ runqemu nographic
> >
> > BIOS:
> [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuriscv64.el=
f]
> > MACHINE: [qemuriscv64]
> >
> > runqemu - INFO - Running
> tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/us=
r/bin/qemu-system-riscv64
> >
> > Hello OpenEmbedded on RISC-V 64!
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../baremetal-examples/baremetal-helloworld_git.bb   | 12 ++++++++++-=
-
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
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "These are introductory examples to
> showcase the use of QEMU to ru
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f5=
6f4449"
> >
> > -SRCREV =3D "99f4fa4a3b266b42b52af302610b0f4f429ba5e3"
> > +SRCREV =3D "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
> >  PV =3D "0.1+git${SRCPV}"
> >
> >  SRC_URI =3D "git://
> github.com/aehs29/baremetal-helloqemu.git;protocol=3Dhttps;branch=3Dmast=
er"
> > @@ -28,12 +28,13 @@ inherit baremetal-image
> >  # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
> >  # but the examples can also be run on other architectures/machines
> >  # such as vexpress-a15 by overriding the setting on the machine.conf
> > -COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64"
> > +COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
> >
> >  BAREMETAL_QEMUARCH ?=3D ""
> >  BAREMETAL_QEMUARCH_qemuarmv5 =3D "versatile"
> >  BAREMETAL_QEMUARCH_qemuarm =3D "arm"
> >  BAREMETAL_QEMUARCH_qemuarm64 =3D "aarch64"
> > +BAREMETAL_QEMUARCH_qemuriscv64 =3D "riscv64"
> >
> >  EXTRA_OEMAKE_append =3D " QEMUARCH=3D${BAREMETAL_QEMUARCH} V=3D1"
> >
> > @@ -49,3 +50,10 @@ FILES_${PN} +=3D " \
> >      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
> >      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
> >  "
> > +
> > +# RISC-V tunes set the BIOS, redefine since runqemu jumps there
> > +QB_DEFAULT_BIOS_qemuriscv64 =3D "${IMAGE_LINK_NAME}.elf"
> > +
> > +# Use the medium-any code model for the RISC-V 64 bit implementation,
> > +# since medlow can only access addresses below 0x80000000
> > +CFLAGS_append_qemuriscv64 =3D " -mcmodel=3Dmedany"
>
> I would have thought medlow would be appropriate for baremetal apps.
> Since this is a sample app
> we should try to use good defaults as it will serve as template.
> having no access below 0x80000000
> should not be such a hard limitation or is it so ?
>

Hey Khem,

I'd usually agree on using defaults but it seems that it might be, for
Riscv64 the RAM address
starts at 0x80000000 [1], which is what we're setting the _start global
symbol to, as far as I
understand using medany switches the usage of lui for auipc instructions
making data accesses
pc-relative, making it possible to load pointers above 0x800000000 where
the RAM is.

The medany code model seems to be widely used: Riscv-probe [2],
libgloss-htif [3], and
riscv64-in-qemu [4], Zephyr had some problems with their SDK and enforced
it as well for
CONFIG_64 [5], and the RISC-V Large Code Model Software Workaround from
SiFive states
the following [6]:

In Summary:
    -mcmodel=3Dmedlow =E2=80=94 Used for 32-bit architectures, this code m=
odel
requires that the program
    and its statically defined symbols must lie between the absolute
addresses -2 GiB and +2 GiB,
    which covers the full 32-bit address range. Code is generally linked
around address 0x00000000,
    and instruction pairs lui and ld are used to generate addresses for
global symbols.

    -mcmodel=3Dmedany =E2=80=94 Used for 64-bit architectures, this code m=
odel also
generates a 32-bit signed
    offset to refer to global symbols. Linked code can reside at any
address, and instruction pairs auipc
    and ld are used to generate global symbol addresses in a +/- 2GiB
window from the code area.

There's currently an open issue on riscv-gcc to change the default code
model to medany for 64 bit targets [7].

My idea was to keep medlow for RISCV32 and use medany for RISCV64, but I'm
open to suggestions on
addressing the _start symbol for the RAM address while avoiding relocation
issues:

hello_baremetal_riscv64.c:(.text+0xe): relocation truncated to fit:
R_RISCV_HI20

[1] QEMU:
https://github.com/qemu/qemu/blob/d90f154867ec0ec22fd719164b88716e8fd48672=
/hw/riscv/virt.c#L60
[2]
https://github.com/michaeljclark/riscv-probe/blob/891ac1df30c3cc7f49c0ac17=
5ecb6d390ec5db34/Makefile#L5
[3]
https://github.com/ucb-bar/libgloss-htif/blob/290b605e4a7340b584602eda183e=
dab07f4bad45/util/htif.specs#L11
[4]
https://github.com/rtfb/riscv64-in-qemu/blob/93f7dbf85a5a45a492f324a7ccc3d=
29d96e8f238/Makefile#L92
[5]
https://github.com/zephyrproject-rtos/zephyr/blob/0c4e9d29bbc1b142ca738f86=
facb6e88218b629d/cmake/compiler/gcc/target_riscv.cmake#L10
[6]
https://sifive.cdn.prismic.io/sifive%2F15d1d90e-f60e-42a2-b6bf-c805c6c73b0=
d_riscv-large-code-model-workaround.pdf
[7] https://github.com/riscv/riscv-gcc/issues/164

Alejandro


> > --
> > 2.25.1
> >
> >
> >=20
> >
>

--000000000000ea5dfc05c1d7b857
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 8 May 2021 =
at 09:16, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sat, May 8, 2021 at 1:30 AM Alejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@e=
nedino.org</a>&gt; wrote:<br>
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
ailto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 .../baremetal-examples/<a href=3D"http://baremetal-helloworld_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</a>=
=
=C2=A0 =C2=A0| 12 ++++++++++--<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/<a hr=
ef=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">baremetal-helloworld_git.bb</a> b/meta-skeleton/recipes-baremetal/barem=
etal-examples/<a href=3D"http://baremetal-helloworld_git.bb" rel=3D"norefer=
rer" target=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; index ee945c1ff0..3b7b8193a7 100644<br>
&gt; --- a/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=3D"h=
ttp://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">bar=
emetal-helloworld_git.bb</a><br>
&gt; +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=3D"h=
ttp://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">bar=
emetal-helloworld_git.bb</a><br>
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
emetal-helloqemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/aehs29/baremetal-helloqemu.git;protocol=3Dhttps=
;branch=3Dmaster</a>&quot;<br>
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
&gt; +<br>
&gt; +# Use the medium-any code model for the RISC-V 64 bit implementation=
,<br>
&gt; +# since medlow can only access addresses below 0x80000000<br>
&gt; +CFLAGS_append_qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<br>
<br>
I would have thought medlow would be appropriate for baremetal apps.<br>
Since this is a sample app<br>
we should try to use good defaults as it will serve as template.<br>
having no access below <span class=3D"gmail_default" style=3D"font-family:=
arial,sans-serif;font-size:small"></span>0x80000000<br>
should not be such a hard limitation or is it so ?<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-family:arial,sans-s=
erif;font-size:small">Hey Khem,</div><div class=3D"gmail_default" style=3D"=
font-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-family:arial,sans-serif;font-size:small">I&#39;d us=
ually agree on using defaults but it seems that it might be, for Riscv64 th=
e RAM address</div><div class=3D"gmail_default" style=3D"font-family:arial,=
sans-serif;font-size:small">starts at=C2=A0<span class=3D"gmail_default"></=
span><span style=3D"font-family:Arial,Helvetica,sans-serif">0x80000000 [1],=
=
=C2=A0</span><span style=3D"font-family:Arial,Helvetica,sans-serif">which =
is what we&#39;re setting the _start global symbol to, as far as I</span></=
div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small"><span style=3D"font-family:Arial,Helvetica,sans-serif">underst=
and using=C2=A0</span><span style=3D"font-family:Arial,Helvetica,sans-serif=
">medany switches the usage of lui for auipc instructions making data acces=
ses</span></div><div class=3D"gmail_default" style=3D"font-family:arial,san=
s-serif;font-size:small"><span style=3D"font-family:Arial,Helvetica,sans-se=
rif">pc-relative,=C2=A0</span><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif">making it possible to load=C2=A0</span><span style=3D"font-family=
:Arial,Helvetica,sans-serif">pointers above 0x800000000 where the RAM is.</=
span></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-ser=
if;font-size:small"><span style=3D"font-family:Arial,Helvetica,sans-serif">=
<br></span></div><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small"><span style=3D"font-family:Arial,Helvetica,sans-s=
erif">The medany code model seems to be widely used: Riscv-probe [2], libgl=
oss-htif [3],=C2=A0</span><span style=3D"font-family:Arial,Helvetica,sans-s=
erif">and</span></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small"><span style=3D"font-family:Arial,Helvetica,s=
ans-serif">riscv64-in-qemu [4],=C2=A0</span><span style=3D"font-family:Aria=
l,Helvetica,sans-serif">Zephyr had some problems with their SDK and enforce=
d it as well for</span></div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,sans-serif;font-size:small"><span style=3D"font-family:Arial,Helv=
etica,sans-serif">CONFIG_64 [5],=C2=A0</span><span style=3D"font-family:Ari=
al,Helvetica,sans-serif">and the=C2=A0</span><span style=3D"font-family:Ari=
al,Helvetica,sans-serif">RISC-V Large Code Model Software Workaround from S=
iFive states</span></div><div class=3D"gmail_default" style=3D"font-family:=
arial,sans-serif;font-size:small"><span style=3D"font-family:Arial,Helvetic=
a,sans-serif">the following [6]:</span></div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,sans-serif;font-size:small"><span style=3D"font-f=
amily:Arial,Helvetica,sans-serif"><br></span></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,sans-serif;font-size:small">In Summary:=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-seri=
f;font-size:small">=C2=A0 =C2=A0 -mcmodel=3Dmedlow =E2=80=94 Used for 32-bi=
t architectures, this code model requires that the program</div><div class=
=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small">=
=
=C2=A0 =C2=A0 and its statically defined symbols must lie between the abso=
lute addresses -2 GiB and
+2 GiB,</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-=
serif;font-size:small">=C2=A0 =C2=A0 which covers the full 32-bit address r=
ange. Code is generally linked around address
0x00000000,</div><div class=3D"gmail_default" style=3D"font-family:arial,s=
ans-serif;font-size:small">=C2=A0 =C2=A0 and instruction pairs lui and ld a=
re used to generate addresses for global
symbols.</div><div class=3D"gmail_default" style=3D"font-family:arial,sans=
-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small">=C2=A0 =C2=A0 -mcmodel=3Dmedany =
=
=E2=80=94 Used for 64-bit architectures, this code model also generates a =
32-bit
signed</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-s=
erif;font-size:small">=C2=A0 =C2=A0 offset to refer to global symbols. Link=
ed code can reside at any address, and instruction pairs auipc</div><div cl=
ass=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small=
">=C2=A0 =C2=A0 and ld are used to generate global symbol addresses in a +/=
- 2GiB window
from the code area.<span style=3D"font-family:Arial,Helvetica,sans-serif">=
<br></span></div><br></div><div><div class=3D"gmail_default" style=3D"font-=
family:arial,sans-serif;font-size:small">There&#39;s currently an open issu=
e on riscv-gcc to change the default code model to medany for 64 bit target=
s [7].</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-se=
rif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,sans-serif;font-size:small">My idea was to keep medlow for RISC=
V32 and use medany for RISCV64, but I&#39;m open to suggestions on</div><di=
v class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:s=
mall">addressing the _start symbol for the RAM address while avoiding reloc=
ation issues:<br><br></div><div class=3D"gmail_default" style=3D"font-famil=
y:arial,sans-serif;font-size:small">hello_baremetal_riscv64.c:(.text+0xe): =
relocation truncated to fit: R_RISCV_HI20<br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,sans-serif;font-size:small"><br></div></div=
><div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;fo=
nt-size:small">[1] QEMU: <a href=3D"https://github.com/qemu/qemu/blob/d90f1=
54867ec0ec22fd719164b88716e8fd48672/hw/riscv/virt.c#L60">https://github.com=
/qemu/qemu/blob/d90f154867ec0ec22fd719164b88716e8fd48672/hw/riscv/virt.c#L6=
0</a></div></div><div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small">[2] <a href=3D"https://github.com/michaeljcl=
ark/riscv-probe/blob/891ac1df30c3cc7f49c0ac175ecb6d390ec5db34/Makefile#L5">=
https://github.com/michaeljclark/riscv-probe/blob/891ac1df30c3cc7f49c0ac175=
ecb6d390ec5db34/Makefile#L5</a></div><div class=3D"gmail_default" style=3D"=
font-family:arial,sans-serif;font-size:small">[3]=C2=A0<a href=3D"https://g=
ithub.com/ucb-bar/libgloss-htif/blob/290b605e4a7340b584602eda183edab07f4bad=
45/util/htif.specs#L11">https://github.com/ucb-bar/libgloss-htif/blob/290b6=
05e4a7340b584602eda183edab07f4bad45/util/htif.specs#L11</a></div><div class=
=
=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small">=
[4]=C2=A0<a href=3D"https://github.com/rtfb/riscv64-in-qemu/blob/93f7dbf85a=
5a45a492f324a7ccc3d29d96e8f238/Makefile#L92">https://github.com/rtfb/riscv6=
4-in-qemu/blob/93f7dbf85a5a45a492f324a7ccc3d29d96e8f238/Makefile#L92</a></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-=
size:small">[5]=C2=A0<a href=3D"https://github.com/zephyrproject-rtos/zephy=
r/blob/0c4e9d29bbc1b142ca738f86facb6e88218b629d/cmake/compiler/gcc/target_r=
iscv.cmake#L10">https://github.com/zephyrproject-rtos/zephyr/blob/0c4e9d29b=
bc1b142ca738f86facb6e88218b629d/cmake/compiler/gcc/target_riscv.cmake#L10</=
a></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;=
font-size:small">[6]=C2=A0<a href=3D"https://sifive.cdn.prismic.io/sifive%2=
F15d1d90e-f60e-42a2-b6bf-c805c6c73b0d_riscv-large-code-model-workaround.pdf=
">https://sifive.cdn.prismic.io/sifive%2F15d1d90e-f60e-42a2-b6bf-c805c6c73b=
0d_riscv-large-code-model-workaround.pdf</a></div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,sans-serif;font-size:small">[7] <a href=3D"h=
ttps://github.com/riscv/riscv-gcc/issues/164">https://github.com/riscv/risc=
v-gcc/issues/164</a></div><div class=3D"gmail_default" style=3D"font-family=
:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,sans-serif;font-size:small">Alejandro</div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000ea5dfc05c1d7b857--
