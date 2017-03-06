Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3978872001
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 23:35:26 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id u30so7816260uau.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 15:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sxn84JkjubzQ5Mu+actpkWp5sS8UjA3Bdl6lTfGbBDk=;
	b=WRYraHHwk/jCyFKlMoCtrK+rXUi7e6yppxlSjtxrU23q4gQxwxxJPV38mKgF1LSSu2
	49lVWjuiGmJYZ0W4+R4M5Tbz16/grJ7r83nRhADkThD8Kwc/C1H44ZpofQvMffhjmJkJ
	Hn+vqFdjz7XFqkhYVjFC3HTOgZY4Cqr5uJITx/ZbWFhNEMmY+VGWeVELiWoWfomL32P7
	I7sGyI3GNF6GfVknomTCCY3nbHPdthlV5jLhtDzjpNgb5v53kkL7XR8fXo8LWJ/o+7wy
	54F5D1Zopt5rKI0vbPJ9tR+3tMBO+/Ahik6d+v1+Mb0/3R6XUH86laZSvy24tgP1G4OZ
	oUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sxn84JkjubzQ5Mu+actpkWp5sS8UjA3Bdl6lTfGbBDk=;
	b=aasXw7VdxWb65jSTNOB/0d2fcFLMFmOf1xURcVQsPRnxPl9knowitBlN1u18AcwKul
	axlKDkg39qHKeuExUxWuRwUTTLogGrFqlz1NBN91aR6oDF5ML2CjGIVG2muzR0Q4CtOD
	e8vs4XccJSATAxcqqMHFrY3ifreTDKA1/62bh8mdwjljXs+HSUlSxHl6IuPuxTvm+gip
	NHERvdJvRo5mfnhwClY3XXnHLajfPN5kIYn2PhPXdLCrOj4bq30cJAvS38ElOqbFfc9C
	z5SNRF88jYtb0+/LjXMWlMqH0pdzqOiKw7wecRFJWkKqR23JfxmVpW7zCUP8zRREbKGP
	GNVg==
X-Gm-Message-State: AMke39k8nbXe1yesWLHvnYDDqN4RLQEo9piYH4Xiky5QtU1liCZZy8Bd0zlqJQSfr1cLPPKKtITAuCnJCnLJWw==
X-Received: by 10.176.75.196 with SMTP id b4mr2971247uag.69.1488843328244;
	Mon, 06 Mar 2017 15:35:28 -0800 (PST)
MIME-Version: 1.0
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
	<CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
In-Reply-To: <CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 06 Mar 2017 23:35:17 +0000
Message-ID: <CAMKF1sp+Q6VX4zUWkH_JrV1THWV5oYo+LmEivz7uUiOC0Q48pQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Mon, 06 Mar 2017 23:35:27 -0000
Content-Type: multipart/alternative; boundary=f403045e1f6eb4da9e054a1859b2

--f403045e1f6eb4da9e054a1859b2
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 2:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Mar 6, 2017 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> Defaulting to softfp probably isn't the best choice anymore,
> >> especially as there are now ARM BSP layers which leave DEFAULTTUNE
> >> entirely up to the distro:
> >>
> >>
> https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html
> >>
> >
> > I like this patch and want to clarify that it changes the default ISA to
> thumb2
> > which we should use anyway due to size reasons and other distros use it
> as
> > default too.
>
> No, it doesn't.


That's right I wanted to say to make that default while you are at it

The choice between ARM and Thumb(2) is made by the
> ARM_INSTRUCTION_SET variable. Adding 't' to DEFAULTTUNE simply means
> that the ARM_INSTRUCTION_SET variable will not be ignored (it's really
> a long standing bug that we ever defined DEFAULTTUNE options for ARMv6
> and above which ignore ARM_INSTRUCTION_SET, but that's a separate
> topic).
>
> > I am not sure of we should change it for armv6 though. since some armv6
> > has t1 and some has t2 so lets leave that as it is.
>
> I'm not aware of any ARMv6 cores which don't support Thumb2. Do you
> have a reference?
>
> (But again, to be clear, this commit doesn't change the default in
> terms of instruction set - all builds will still use ARM).
>
> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
> >>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
> >>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
> >>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
> >>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
> >>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
> >>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
> >>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
> >>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
> >>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
> >>  10 files changed, 10 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
> b/meta/conf/machine/include/arm/arch-armv6.inc
> >> index 91f0f07..5e1f973 100644
> >> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> >> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv6"
> >> +DEFAULTTUNE ?= "armv6thf"
> >>
> >>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
> >>  TUNECONFLICTS[armv6] = "armv4 armv5"
> >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
> b/meta/conf/machine/include/arm/arch-armv7a.inc
> >> index 5446048..bad1c27 100644
> >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7a"
> >> +DEFAULTTUNE ?= "armv7athf"
> >>
> >>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
> >>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> >> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
> b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> index 42d8d04..4d9260f 100644
> >> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7ve"
> >> +DEFAULTTUNE ?= "armv7vethf"
> >>
> >>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
> >>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> >> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc
> b/meta/conf/machine/include/tune-arm1136jf-s.inc
> >> index 53994ef..2cadbee 100644
> >> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
> >> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv6"
> >> +DEFAULTTUNE ?= "armv6thf"
> >>
> >>  require conf/machine/include/arm/arch-armv6.inc
> >>
> >> diff --git a/meta/conf/machine/include/tune-cortexa15.inc
> b/meta/conf/machine/include/tune-cortexa15.inc
> >> index 03de602..25e99f9 100644
> >> --- a/meta/conf/machine/include/tune-cortexa15.inc
> >> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7ve-neon"
> >> +DEFAULTTUNE ?= "armv7vethf-neon"
> >>
> >>  require conf/machine/include/arm/arch-armv7ve.inc
> >>
> >> diff --git a/meta/conf/machine/include/tune-cortexa17.inc
> b/meta/conf/machine/include/tune-cortexa17.inc
> >> index f659a62..40392f9 100644
> >> --- a/meta/conf/machine/include/tune-cortexa17.inc
> >> +++ b/meta/conf/machine/include/tune-cortexa17.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7ve-neon"
> >> +DEFAULTTUNE ?= "armv7vethf-neon"
> >>
> >>  require conf/machine/include/arm/arch-armv7ve.inc
> >>
> >> diff --git a/meta/conf/machine/include/tune-cortexa5.inc
> b/meta/conf/machine/include/tune-cortexa5.inc
> >> index 93f9ca4..1f0cda6 100644
> >> --- a/meta/conf/machine/include/tune-cortexa5.inc
> >> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7a-neon"
> >> +DEFAULTTUNE ?= "armv7athf-neon"
> >>
> >>  require conf/machine/include/arm/arch-armv7a.inc
> >>
> >> diff --git a/meta/conf/machine/include/tune-cortexa7.inc
> b/meta/conf/machine/include/tune-cortexa7.inc
> >> index 52e06b8..52415d9 100644
> >> --- a/meta/conf/machine/include/tune-cortexa7.inc
> >> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7ve-neon"
> >> +DEFAULTTUNE ?= "armv7vethf-neon"
> >>
> >>  require conf/machine/include/arm/arch-armv7ve.inc
> >>
> >> diff --git a/meta/conf/machine/include/tune-cortexa8.inc
> b/meta/conf/machine/include/tune-cortexa8.inc
> >> index a831bd5..8ee8de9 100644
> >> --- a/meta/conf/machine/include/tune-cortexa8.inc
> >> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7a-neon"
> >> +DEFAULTTUNE ?= "armv7athf-neon"
> >>
> >>  require conf/machine/include/arm/arch-armv7a.inc
> >>
> >> diff --git a/meta/conf/machine/include/tune-cortexa9.inc
> b/meta/conf/machine/include/tune-cortexa9.inc
> >> index 8b84e60..0cf323c 100644
> >> --- a/meta/conf/machine/include/tune-cortexa9.inc
> >> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> >> @@ -1,4 +1,4 @@
> >> -DEFAULTTUNE ?= "armv7a-neon"
> >> +DEFAULTTUNE ?= "armv7athf-neon"
> >>
> >>  require conf/machine/include/arm/arch-armv7a.inc
> >>
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045e1f6eb4da9e054a1859b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Mon, Mar 6, 2017 at 2:51 PM And=
re McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Mar 6, 2017 a=
t 2:37 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" class=3D"gmai=
l_msg" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br class=3D"gmai=
l_msg">
&gt; On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com" class=3D"gmail_msg" target=3D"_blank">armccurdy@gmail.co=
m</a>&gt; wrote:<br class=3D"gmail_msg">
&gt;&gt; Defaulting to softfp probably isn&#39;t the best choice anymore,<b=
r class=3D"gmail_msg">
&gt;&gt; especially as there are now ARM BSP layers which leave DEFAULTTUNE=
<br class=3D"gmail_msg">
&gt;&gt; entirely up to the distro:<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://lists.yoctoproject.org/pipermail/yo=
cto/2017-February/034637.html" rel=3D"noreferrer" class=3D"gmail_msg" targe=
t=3D"_blank">https://lists.yoctoproject.org/pipermail/yocto/2017-February/0=
34637.html</a><br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I like this patch and want to clarify that it changes the default ISA =
to thumb2<br class=3D"gmail_msg">
&gt; which we should use anyway due to size reasons and other distros use i=
t as<br class=3D"gmail_msg">
&gt; default too.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
No, it doesn&#39;t. </blockquote><div><br></div><div>That&#39;s right I wan=
ted to say to make that default while you are at it</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">The choice between ARM and Thumb(2) is made by =
the<br class=3D"gmail_msg">
ARM_INSTRUCTION_SET variable. Adding &#39;t&#39; to DEFAULTTUNE simply mean=
s<br class=3D"gmail_msg">
that the ARM_INSTRUCTION_SET variable will not be ignored (it&#39;s really<=
br class=3D"gmail_msg">
a long standing bug that we ever defined DEFAULTTUNE options for ARMv6<br c=
lass=3D"gmail_msg">
and above which ignore ARM_INSTRUCTION_SET, but that&#39;s a separate<br cl=
ass=3D"gmail_msg">
topic).<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; I am not sure of we should change it for armv6 though. since some armv=
6<br class=3D"gmail_msg">
&gt; has t1 and some has t2 so lets leave that as it is.<br class=3D"gmail_=
msg">
<br class=3D"gmail_msg">
I&#39;m not aware of any ARMv6 cores which don&#39;t support Thumb2. Do you=
<br class=3D"gmail_msg">
have a reference?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
(But again, to be clear, this commit doesn&#39;t change the default in<br c=
lass=3D"gmail_msg">
terms of instruction set - all builds will still use ARM).<br class=3D"gmai=
l_msg">
<br class=3D"gmail_msg">
&gt;&gt; Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail=
.com" class=3D"gmail_msg" target=3D"_blank">armccurdy@gmail.com</a>&gt;<br =
class=3D"gmail_msg">
&gt;&gt; ---<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv6.inc=C2=A0 =C2=A0| 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv7a.inc=C2=A0 | 2 +-<b=
r class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-<br cla=
ss=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-<br cla=
ss=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-cortexa15.inc=C2=A0 =C2=A0| 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-cortexa17.inc=C2=A0 =C2=A0| 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-cortexa5.inc=C2=A0 =C2=A0 | 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-cortexa7.inc=C2=A0 =C2=A0 | 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-cortexa8.inc=C2=A0 =C2=A0 | 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/tune-cortexa9.inc=C2=A0 =C2=A0 | 2=
 +-<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 10 files changed, 10 insertions(+), 10 deletions(-)<br class=
=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/c=
onf/machine/include/arm/arch-armv6.inc<br class=3D"gmail_msg">
&gt;&gt; index 91f0f07..5e1f973 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv6.inc<br class=3D"gma=
il_msg">
&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv6.inc<br class=3D"gma=
il_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv6&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv6thf&quot;<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 TUNEVALID[armv6] =3D &quot;Enable instructions for ARMv6&quo=
t;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 TUNECONFLICTS[armv6] =3D &quot;armv4 armv5&quot;<br class=3D=
"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/=
conf/machine/include/arm/arch-armv7a.inc<br class=3D"gmail_msg">
&gt;&gt; index 5446048..bad1c27 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv7a.inc<br class=3D"gm=
ail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv7a.inc<br class=3D"gm=
ail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf&quot;<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 TUNEVALID[armv7a] =3D &quot;Enable instructions for ARMv7-a&=
quot;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 TUNECONFLICTS[armv7a] =3D &quot;armv4 armv5 armv6 armv7&quot=
;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta=
/conf/machine/include/arm/arch-armv7ve.inc<br class=3D"gmail_msg">
&gt;&gt; index 42d8d04..4d9260f 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv7ve.inc<br class=3D"g=
mail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc<br class=3D"g=
mail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf&quot;<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 TUNEVALID[armv7ve] =3D &quot;Enable instructions for ARMv7ve=
&quot;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 TUNECONFLICTS[armv7ve] =3D &quot;armv4 armv5 armv6 armv7 arm=
v7a&quot;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta=
/conf/machine/include/tune-arm1136jf-s.inc<br class=3D"gmail_msg">
&gt;&gt; index 53994ef..2cadbee 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-arm1136jf-s.inc<br class=3D"g=
mail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc<br class=3D"g=
mail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv6&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv6thf&quot;<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv6.inc<br class=3D"=
gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/c=
onf/machine/include/tune-cortexa15.inc<br class=3D"gmail_msg">
&gt;&gt; index 03de602..25e99f9 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-cortexa15.inc<br class=3D"gma=
il_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-cortexa15.inc<br class=3D"gma=
il_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf-neon&quot;<br class=3D"gmail_ms=
g">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7ve.inc<br class=
=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/c=
onf/machine/include/tune-cortexa17.inc<br class=3D"gmail_msg">
&gt;&gt; index f659a62..40392f9 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-cortexa17.inc<br class=3D"gma=
il_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-cortexa17.inc<br class=3D"gma=
il_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf-neon&quot;<br class=3D"gmail_ms=
g">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7ve.inc<br class=
=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/co=
nf/machine/include/tune-cortexa5.inc<br class=3D"gmail_msg">
&gt;&gt; index 93f9ca4..1f0cda6 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-cortexa5.inc<br class=3D"gmai=
l_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-cortexa5.inc<br class=3D"gmai=
l_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br class=3D"gmail_msg=
">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7a.inc<br class=3D=
"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/co=
nf/machine/include/tune-cortexa7.inc<br class=3D"gmail_msg">
&gt;&gt; index 52e06b8..52415d9 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-cortexa7.inc<br class=3D"gmai=
l_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-cortexa7.inc<br class=3D"gmai=
l_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf-neon&quot;<br class=3D"gmail_ms=
g">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7ve.inc<br class=
=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/co=
nf/machine/include/tune-cortexa8.inc<br class=3D"gmail_msg">
&gt;&gt; index a831bd5..8ee8de9 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-cortexa8.inc<br class=3D"gmai=
l_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-cortexa8.inc<br class=3D"gmai=
l_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br class=3D"gmail_msg=
">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7a.inc<br class=3D=
"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/co=
nf/machine/include/tune-cortexa9.inc<br class=3D"gmail_msg">
&gt;&gt; index 8b84e60..0cf323c 100644<br class=3D"gmail_msg">
&gt;&gt; --- a/meta/conf/machine/include/tune-cortexa9.inc<br class=3D"gmai=
l_msg">
&gt;&gt; +++ b/meta/conf/machine/include/tune-cortexa9.inc<br class=3D"gmai=
l_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br class=3D"gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br class=3D"gmail_msg=
">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7a.inc<br class=3D=
"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; --<br class=3D"gmail_msg">
&gt;&gt; 1.9.1<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; --<br class=3D"gmail_msg">
&gt;&gt; _______________________________________________<br class=3D"gmail_=
msg">
&gt;&gt; Openembedded-core mailing list<br class=3D"gmail_msg">
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=
=3D"gmail_msg" target=3D"_blank">Openembedded-core@lists.openembedded.org</=
a><br class=3D"gmail_msg">
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">http://=
lists.openembedded.org/mailman/listinfo/openembedded-core</a><br class=3D"g=
mail_msg">
</blockquote></div></div>

--f403045e1f6eb4da9e054a1859b2--
