Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23778C25B75
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 03:32:53 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.53000.1716175966643022030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 May 2024 20:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e576057c06so28482901fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 20:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716175964; x=1716780764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTQKSBoDCCpDpPW29yZ5kephMqRfMEKcJMCltlQFAqE=;
        b=NQjMa3nz0rjjwsnK31C4JBeOaQbuVqFj4r481hXW7UlDcDSduD6H63FbqcqoeJEUg7
         CyYI2noPY/tj++W4SDUw7Iyw7+ApaBajMm7oUJAiIen4/WvgYkXAXUW0LuuGgEgqnAgH
         RyYyuYUjIVGzELBLOUiUbl44ftgRH3Grqp748aW2Irz+MFQxcHFmhH3iqOVGTg9aHGM6
         1dBuqS+REsR2E8r5Fh0PbMDEVuwII9xSx9RfMtWQZ+7QgR1IxTwQUnBv3sQFtcmG/88q
         D8r5FWH80cg5z7HO8xroJt4rK4ica6ayz4J46x04t6QMwfB6LkcmBD7hg5hUVOy9G1iV
         bTbA==
X-Gm-Message-State: AOJu0YzWgANpJikT9SiErF8q7uc5qU7yirD0+oO+umr/RVv758PDWz/9
	uHPGrgYtTrRn2HAZO+ogUp31qeDnvrSGUGwKA5zLpHbPRYKfSsNDrAugaCTG
X-Google-Smtp-Source: AGHT+IGciyl1wE6PuMDhv4Z5uGTywJavrXM0IXTT5JUdxL3a1wvb9JSQIBQnich3Qy8AQ2st2tS2CA==
X-Received: by 2002:a19:6410:0:b0:51a:d5d3:ee52 with SMTP id 2adb3069b0e04-5221006e6f8mr17827867e87.17.1716175963144;
        Sun, 19 May 2024 20:32:43 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d2b8esm4143303e87.247.2024.05.19.20.32.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 20:32:43 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e716e302d8so16619801fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 20:32:43 -0700 (PDT)
X-Received: by 2002:a2e:b894:0:b0:2e0:dc93:52ef with SMTP id
 38308e7fff4ca-2e6f9feefd6mr100787591fa.26.1716175962852; Sun, 19 May 2024
 20:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240519055050.2331637-1-alejandro@enedino.org> <CAMKF1spZk=ObXUyWaFk26inN25Pdwi71fuL55RdAOpw_GmHNjg@mail.gmail.com>
In-Reply-To: <CAMKF1spZk=ObXUyWaFk26inN25Pdwi71fuL55RdAOpw_GmHNjg@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sun, 19 May 2024 21:32:28 -0600
X-Gmail-Original-Message-ID: <CAHMutrajjZMpfgKAbsWRxRf3Ym-kPE1f=VkfT5TNMPzdCje_nw@mail.gmail.com>
Message-ID: <CAHMutrajjZMpfgKAbsWRxRf3Ym-kPE1f=VkfT5TNMPzdCje_nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] newlib: Use mcmodel=medany for RISCV64
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a35d580618da5abd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199554

--000000000000a35d580618da5abd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 19 May 2024 at 00:37, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, May 18, 2024 at 10:48=E2=80=AFPM Alejandro Hernandez Samaniego vi=
a
> lists.openembedded.org <alejandro=3Denedino.org@lists.openembedded.org>
> wrote:
> >
> > It was previously discovered that mcmodel=3Dmedany should be used for
> RISCV64,
> > however this was only being set for the applications themselves, but no=
t
> for
> > newlib, this meant that we ended up with C library that used a code
> model and
> > an application that used another one which is not something we want.
> >
> > Pass mcmodel=3Dmedany when building newlib for RISCV64 as well.
> >
> > Also, s/CFLAGS/TARGET_CFLAGS to standarize across recipes, the variable
> > expansion provides no functional difference at this point.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  meta/classes-recipe/baremetal-image.bbclass | 2 +-
> >  meta/recipes-core/newlib/newlib.inc         | 8 ++++++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/baremetal-image.bbclass
> b/meta/classes-recipe/baremetal-image.bbclass
> > index b9a584351a..4e7d413626 100644
> > --- a/meta/classes-recipe/baremetal-image.bbclass
> > +++ b/meta/classes-recipe/baremetal-image.bbclass
> > @@ -103,7 +103,7 @@ QB_OPT_APPEND:append:qemuriscv32 =3D " -bios none"
> >  # since medlow can only access addresses below 0x80000000 and RAM
> >  # starts at 0x80000000 on RISC-V 64
> >  # Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB=
)
> > -CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> > +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> >
> >
> >  ## Emulate image.bbclass
> > diff --git a/meta/recipes-core/newlib/newlib.inc
> b/meta/recipes-core/newlib/newlib.inc
> > index 6113f5e831..34b0f3f747 100644
> > --- a/meta/recipes-core/newlib/newlib.inc
> > +++ b/meta/recipes-core/newlib/newlib.inc
> > @@ -28,6 +28,14 @@ B =3D "${WORKDIR}/build"
> >  ## disable stdlib
> >  TARGET_CC_ARCH:append =3D " -nostdlib"
> >
> > +# Both the C library and the application should share the same mcmodel=
.
> > +# Use the medium-any code model for the RISC-V 64 bit implementation,
> > +# since medlow can only access addresses below 0x80000000 and RAM
> > +# starts at 0x80000000 on RISC-V 64
> > +# Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB=
)
> > +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> > +
> > +
>

> medany can be slow, and medlow is default on RISCV so I wonder if the
> ram address
> you are mentioning is so on all RV64 baremetal apps using newlib or is
> it specific to
> the hardware you are testing.
>

Hey Khem,

We actually sort of had this discussion before so I'm copy-pasting the
references I used the last time, but adding a few more datapoints :)

Original thread from when I brought in the initial riscv64 baremetal port:
https://lists.openembedded.org/g/openembedded-core/message/151483

For riscv64 (QEMU) the RAM address starts at 0x80000000 [1], which is what
we're setting the _start
global symbol to, as far as I understand using medany switches the usage of
lui for auipc instructions
making data accesses pc-relative, making it possible to load pointers above
0x800000000 where the RAM is.

The medany code model seems to be widely used: riscv-probe [2],
libgloss-htif [3], and
riscv64-in-qemu [4], Zephyr had some problems with their SDK and enforced
it as well for
CONFIG_64 [5], and the RISC-V Large Code Model Software Workaround from
SiFive states
the following [6]:

In Summary:
    -mcmodel=3Dmedlow =E2=80=94 Used for 32-bit architectures, this code mo=
del
requires that the program
    and its statically defined symbols must lie between the absolute
addresses -2 GiB and +2 GiB,
    which covers the full 32-bit address range. Code is generally linked
around address 0x00000000,
    and instruction pairs lui and ld are used to generate addresses for
global symbols.

    -mcmodel=3Dmedany =E2=80=94 Used for 64-bit architectures, this code mo=
del also
generates a 32-bit signed
    offset to refer to global symbols. Linked code can reside at any
address, and instruction pairs auipc
    and ld are used to generate global symbol addresses in a +/- 2GiB
window from the code area.

There's currently an open issue on riscv-gcc to change the default code
model to medany for 64 bit targets [7].

Also, this time I purposely didn't set this at the beginning to see if it
was required but I do get the following error if not using medany:

(.init+0x0): relocation truncated to fit: R_RISCV_HI20 against symbol
`__data_source' defined in *ABS* section in hello_picolibc_qemuriscv64.elf

This is happening on the picolibc example which is completely different
code than the other one I was using but its the exact same error,
unless there is an extra cmdline argument that I'm not aware of that can be
passed to the linker to bypass this, I don't know how this
would be solved.

I'm not sure, but perhaps medany needs to be used on 64 bits RISCV before
virtual addressing is set up? which to me it would explain
why it needs to be used for baremetal.

I also found a few other references from RTEMS [8] and risc-gnu-toolchain
[9] where medany its being used by default for riscv64.

Picolibc also uses medany by default for riscv64 specifically [10]

[1] QEMU:
https://github.com/qemu/qemu/blob/d90f154867ec0ec22fd719164b88716e8fd48672/=
hw/riscv/virt.c#L60
[2]
https://github.com/michaeljclark/riscv-probe/blob/891ac1df30c3cc7f49c0ac175=
ecb6d390ec5db34/Makefile#L5
[3]
https://github.com/ucb-bar/libgloss-htif/blob/290b605e4a7340b584602eda183ed=
ab07f4bad45/util/htif.specs#L11
[4]
https://github.com/rtfb/riscv64-in-qemu/blob/93f7dbf85a5a45a492f324a7ccc3d2=
9d96e8f238/Makefile#L92
[5]
https://github.com/zephyrproject-rtos/zephyr/blob/0c4e9d29bbc1b142ca738f86f=
acb6e88218b629d/cmake/compiler/gcc/target_riscv.cmake#L10
[6]
https://sifive.cdn.prismic.io/sifive%2F15d1d90e-f60e-42a2-b6bf-c805c6c73b0d=
_riscv-large-code-model-workaround.pdf
[7] https://github.com/riscv/riscv-gcc/issues/164
[8] https://docs.rtems.org/branches/master/user/bsps/bsps-riscv.html
[9] https://github.com/riscv-collab/riscv-gnu-toolchain/issues/733
[10]
https://github.com/picolibc/picolibc/blob/main/scripts/cross-riscv64-unknow=
n-elf.txt

Cheers,

Alejandro



>
> >  EXTRA_OECONF =3D " \
> >                  --build=3D${BUILD_SYS}  \
> >                  --target=3D${TARGET_SYS} \
> > --
> > 2.45.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199544):
> https://lists.openembedded.org/g/openembedded-core/message/199544
> > Mute This Topic: https://lists.openembedded.org/mt/106182788/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000a35d580618da5abd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 19 May 2024 =
at 00:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sat, May 18, 2024 at 10:48=E2=80=AFPM Alejandro Hernandez Samaniego =
via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alejandro=3D<a href=3D"mailto:enedino.or=
g@lists.openembedded.org" target=3D"_blank">enedino.org@lists.openembedded.=
org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; It was previously discovered that mcmodel=3Dmedany should be used for =
RISCV64,<br>
&gt; however this was only being set for the applications themselves, but n=
ot for<br>
&gt; newlib, this meant that we ended up with C library that used a code mo=
del and<br>
&gt; an application that used another one which is not something we want.<b=
r>
&gt;<br>
&gt; Pass mcmodel=3Dmedany when building newlib for RISCV64 as well.<br>
&gt;<br>
&gt; Also, s/CFLAGS/TARGET_CFLAGS to standarize across recipes, the variabl=
e<br>
&gt; expansion provides no functional difference at this point.<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/baremetal-image.bbclass | 2 +-<br>
&gt;=C2=A0 meta/recipes-core/newlib/newlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 8 ++++++++<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classe=
s-recipe/baremetal-image.bbclass<br>
&gt; index b9a584351a..4e7d413626 100644<br>
&gt; --- a/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; +++ b/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; @@ -103,7 +103,7 @@ QB_OPT_APPEND:append:qemuriscv32 =3D &quot; -bios =
none&quot;<br>
&gt;=C2=A0 # since medlow can only access addresses below 0x80000000 and RA=
M<br>
&gt;=C2=A0 # starts at 0x80000000 on RISC-V 64<br>
&gt;=C2=A0 # Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2=
GB:2GB)<br>
&gt; -CFLAGS:append:qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<br>
&gt; +TARGET_CFLAGS:append:qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<b=
r>
&gt;<br>
&gt;<br>
&gt;=C2=A0 ## Emulate image.bbclass<br>
&gt; diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/n=
ewlib/newlib.inc<br>
&gt; index 6113f5e831..34b0f3f747 100644<br>
&gt; --- a/meta/recipes-core/newlib/newlib.inc<br>
&gt; +++ b/meta/recipes-core/newlib/newlib.inc<br>
&gt; @@ -28,6 +28,14 @@ B =3D &quot;${WORKDIR}/build&quot;<br>
&gt;=C2=A0 ## disable stdlib<br>
&gt;=C2=A0 TARGET_CC_ARCH:append =3D &quot; -nostdlib&quot;<br>
&gt;<br>
&gt; +# Both the C library and the application should share the same mcmode=
l.<br>
&gt; +# Use the medium-any code model for the RISC-V 64 bit implementation,=
<br>
&gt; +# since medlow can only access addresses below 0x80000000 and RAM<br>
&gt; +# starts at 0x80000000 on RISC-V 64<br>
&gt; +# Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2G=
B)<br>
&gt; +TARGET_CFLAGS:append:qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<b=
r>
&gt; +<br>
&gt; +=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
medany can be slow, and medlow is default on RISCV so I wonder if the<br>
ram address<br>
you are mentioning is so on all RV64 baremetal apps using newlib or is<br>
it specific to<br>
the hardware you are testing.<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small">=
Hey Khem,</div><div><div class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,sans-serif">We actually sort of had this discussion before so I&#39;m c=
opy-pasting the references I used the last time, but adding a few more data=
points :)</div><div class=3D"gmail_default" style=3D"font-family:arial,sans=
-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,s=
ans-serif">Original thread from when I brought in the initial riscv64 barem=
etal port:=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/151483">https://lists.openembedded.org/g/openembedded-core/messa=
ge/151483</a></div><div class=3D"gmail_default" style=3D"font-family:arial,=
sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif">F<span style=3D"font-family:Arial,Helvetica,sans-serif">or r=
iscv64 (QEMU) the RAM address=C2=A0</span><span style=3D"font-family:Arial,=
Helvetica,sans-serif">starts at 0x80000000 [1], which is what we&#39;re set=
ting the _start</span></div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif"=
>global symbol to, as far as I=C2=A0</span><span style=3D"font-family:Arial=
,Helvetica,sans-serif">understand using medany switches the usage of lui fo=
r auipc instructions</span></div><div class=3D"gmail_default" style=3D"font=
-family:arial,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-s=
erif">making data accesses=C2=A0</span><span style=3D"font-family:Arial,Hel=
vetica,sans-serif">pc-relative, making it possible to load pointers above 0=
x800000000 where the RAM is.</span></div><br>The medany code model seems to=
 be widely used: <span class=3D"gmail_default" style=3D"font-family:arial,s=
ans-serif">r</span>iscv-probe [2], libgloss-htif [3], and<br>riscv64-in-qem=
u [4], Zephyr had some problems with their SDK and enforced it as well for<=
br>CONFIG_64 [5], and the RISC-V Large Code Model Software Workaround from =
SiFive states<br>the following [6]:<br><br>In Summary: <br>=C2=A0 =C2=A0 -m=
cmodel=3Dmedlow =E2=80=94 Used for 32-bit architectures, this code model re=
quires that the program<br>=C2=A0 =C2=A0 and its statically defined symbols=
 must lie between the absolute addresses -2 GiB and +2 GiB,<br>=C2=A0 =C2=
=A0 which covers the full 32-bit address range. Code is generally linked ar=
ound address 0x00000000,<br>=C2=A0 =C2=A0 and instruction pairs lui and ld =
are used to generate addresses for global symbols.<br><br>=C2=A0 =C2=A0 -mc=
model=3Dmedany =E2=80=94 Used for 64-bit architectures, this code model als=
o generates a 32-bit signed<br>=C2=A0 =C2=A0 offset to refer to global symb=
ols. Linked code can reside at any address, and instruction pairs auipc<br>=
=C2=A0 =C2=A0 and ld are used to generate global symbol addresses in a +/- =
2GiB window from the code area.<br><br>There&#39;s currently an open issue =
on riscv-gcc to change the default code model to medany for 64 bit targets =
[7].<br></div><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif">Also, this time I purposely didn&#39;t set this =
at the beginning to see if it was required but I do get the following error=
 if not using medany:<br>=C2=A0</div><div class=3D"gmail_default" style=3D"=
font-family:arial,sans-serif">(.init+0x0): relocation truncated to fit: R_R=
ISCV_HI20 against symbol `__data_source&#39; defined in *ABS* section in he=
llo_picolibc_qemuriscv64.elf</div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif"><br></div><div class=3D"gmail_default" style=3D"=
font-family:arial,sans-serif">This is happening on the picolibc example whi=
ch is completely different code than the other one I was using but its the =
exact same error,</div></div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,sans-serif">unless there is an extra cmdline argument that I&#39;=
m not aware of that can be passed to the linker to bypass this, I don&#39;t=
 know how this</div><div class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif">would be solved.</div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,sans-serif"><br></div><div class=3D"gmail_default" style=3D=
"font-family:arial,sans-serif">I&#39;m not sure, but perhaps medany needs t=
o be used on 64 bits RISCV=C2=A0before virtual addressing is set up? which=
=C2=A0to me it would explain</div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif">why it needs to be used for baremetal.</div><div=
 class=3D"gmail_default" style=3D"font-family:arial,sans-serif"><br></div><=
div class=3D"gmail_default" style=3D"font-family:arial,sans-serif">I also f=
ound a few other references from RTEMS [8] and risc-gnu-toolchain [9] where=
 medany its being used by default for riscv64.</div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,sans-serif"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,sans-serif">Picolibc also uses medany b=
y default for riscv64 specifically [10]</div><div><div style=3D"box-sizing:=
border-box"><div class=3D"gmail_default" style=3D"box-sizing:border-box;fon=
t-family:arial,sans-serif"><br class=3D"gmail-Apple-interchange-newline">[1=
] QEMU:=C2=A0<a href=3D"https://github.com/qemu/qemu/blob/d90f154867ec0ec22=
fd719164b88716e8fd48672/hw/riscv/virt.c#L60" rel=3D"nofollow noopener" targ=
et=3D"_blank" style=3D"box-sizing:border-box;background-color:transparent;c=
olor:rgb(125,168,212);text-decoration-line:none">https://github.com/qemu/qe=
mu/blob/d90f154867ec0ec22fd719164b88716e8fd48672/hw/riscv/virt.c#L60</a></d=
iv></div><div style=3D"box-sizing:border-box"><div class=3D"gmail_default" =
style=3D"box-sizing:border-box;font-family:arial,sans-serif">[2]=C2=A0<a hr=
ef=3D"https://github.com/michaeljclark/riscv-probe/blob/891ac1df30c3cc7f49c=
0ac175ecb6d390ec5db34/Makefile#L5" rel=3D"nofollow noopener" target=3D"_bla=
nk" style=3D"box-sizing:border-box;background-color:transparent;color:rgb(1=
25,168,212);text-decoration-line:none">https://github.com/michaeljclark/ris=
cv-probe/blob/891ac1df30c3cc7f49c0ac175ecb6d390ec5db34/Makefile#L5</a></div=
><div class=3D"gmail_default" style=3D"box-sizing:border-box;font-family:ar=
ial,sans-serif">[3]=C2=A0<a href=3D"https://github.com/ucb-bar/libgloss-hti=
f/blob/290b605e4a7340b584602eda183edab07f4bad45/util/htif.specs#L11" rel=3D=
"nofollow noopener" target=3D"_blank" style=3D"box-sizing:border-box;backgr=
ound-color:transparent;color:rgb(125,168,212);text-decoration-line:none">ht=
tps://github.com/ucb-bar/libgloss-htif/blob/290b605e4a7340b584602eda183edab=
07f4bad45/util/htif.specs#L11</a></div><div class=3D"gmail_default" style=
=3D"box-sizing:border-box;font-family:arial,sans-serif">[4]=C2=A0<a href=3D=
"https://github.com/rtfb/riscv64-in-qemu/blob/93f7dbf85a5a45a492f324a7ccc3d=
29d96e8f238/Makefile#L92" rel=3D"nofollow noopener" target=3D"_blank" style=
=3D"box-sizing:border-box;background-color:transparent;color:rgb(125,168,21=
2);text-decoration-line:none">https://github.com/rtfb/riscv64-in-qemu/blob/=
93f7dbf85a5a45a492f324a7ccc3d29d96e8f238/Makefile#L92</a></div><div class=
=3D"gmail_default" style=3D"box-sizing:border-box;font-family:arial,sans-se=
rif">[5]=C2=A0<a href=3D"https://github.com/zephyrproject-rtos/zephyr/blob/=
0c4e9d29bbc1b142ca738f86facb6e88218b629d/cmake/compiler/gcc/target_riscv.cm=
ake#L10" rel=3D"nofollow noopener" target=3D"_blank" style=3D"box-sizing:bo=
rder-box;background-color:transparent;color:rgb(125,168,212);text-decoratio=
n-line:none">https://github.com/zephyrproject-rtos/zephyr/blob/0c4e9d29bbc1=
b142ca738f86facb6e88218b629d/cmake/compiler/gcc/target_riscv.cmake#L10</a><=
/div><div class=3D"gmail_default" style=3D"box-sizing:border-box;font-famil=
y:arial,sans-serif">[6]=C2=A0<a href=3D"https://sifive.cdn.prismic.io/sifiv=
e%2F15d1d90e-f60e-42a2-b6bf-c805c6c73b0d_riscv-large-code-model-workaround.=
pdf" rel=3D"nofollow noopener" target=3D"_blank" style=3D"box-sizing:border=
-box;background-color:transparent;color:rgb(125,168,212);text-decoration-li=
ne:none">https://sifive.cdn.prismic.io/sifive%2F15d1d90e-f60e-42a2-b6bf-c80=
5c6c73b0d_riscv-large-code-model-workaround.pdf</a></div><div class=3D"gmai=
l_default" style=3D"box-sizing:border-box;font-family:arial,sans-serif">[7]=
=C2=A0<a href=3D"https://github.com/riscv/riscv-gcc/issues/164" rel=3D"nofo=
llow noopener" target=3D"_blank" style=3D"box-sizing:border-box;background-=
color:transparent;color:rgb(125,168,212);text-decoration-line:none">https:/=
/github.com/riscv/riscv-gcc/issues/164</a></div><div class=3D"gmail_default=
" style=3D"box-sizing:border-box;font-family:arial,sans-serif">[8]=C2=A0<a =
href=3D"https://docs.rtems.org/branches/master/user/bsps/bsps-riscv.html">h=
ttps://docs.rtems.org/branches/master/user/bsps/bsps-riscv.html</a></div><d=
iv class=3D"gmail_default" style=3D"box-sizing:border-box;font-family:arial=
,sans-serif">[9]=C2=A0<a href=3D"https://github.com/riscv-collab/riscv-gnu-=
toolchain/issues/733">https://github.com/riscv-collab/riscv-gnu-toolchain/i=
ssues/733</a></div></div><div class=3D"gmail_default" style=3D"font-family:=
arial,sans-serif">[10] <a href=3D"https://github.com/picolibc/picolibc/blob=
/main/scripts/cross-riscv64-unknown-elf.txt">https://github.com/picolibc/pi=
colibc/blob/main/scripts/cross-riscv64-unknown-elf.txt</a></div><br></div><=
div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small">Cheers,</div><br></div><div><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif">Alejandro</div></div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --build=
=3D${BUILD_SYS}=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --target=
=3D${TARGET_SYS} \<br>
&gt; --<br>
&gt; 2.45.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#199544): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/199544" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/199544</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10618278=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106182788/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000a35d580618da5abd--

