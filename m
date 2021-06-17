Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.1419.1623890439307207205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 17:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E56ONdSZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id if15so768670qvb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 17:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3NcHqOsQEyP4E/o+N7Fhj8CwfVHXAigN8Lz/g7UFfVg=;
        b=E56ONdSZBR8kLpj1QdOrM9c3pyVmJti5qRCGAfUtUWPQevN+7UAqASePlZ6DF74j1O
         Embc+AfrRJir+a4u4mr1o3smWaizBOY/JGOekJtqBSI7OJVMwRHQwwjagZWCCtFClVD3
         s9Qftva7bUNvK9vwv3SE0FDOI7id/BT11H9iyxIX+FULapIWJFF2Z2j1wQJOGOWQ+WM/
         egY27PGQ9DzFxSR6UrxzEZEkzV26aaRGM+xRRNZiHbbJPkghW/DEzMoDSITQ/23mRED7
         q0vcbpivDJLVMIbhJDEJUhcQYA1ALRZRxXChb3kuoLmc2HZRKCpJdiEArHPuEnFRDGHb
         0TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3NcHqOsQEyP4E/o+N7Fhj8CwfVHXAigN8Lz/g7UFfVg=;
        b=HLDpYf8BiVTWdQYNQEkt4I5oaji1hXYxV5gwG0p45l3mSm/XYZPvZskuJmDybGknTa
         65rC/xDvvrkMEunXLKnz+W5Lt3eJ2q0g52m/S9N36MbWPzTYiC++7dqDv2bR7mg1ymQp
         OJXaA/qB/K/5ogomToO1Hs5SUwUp1hSe+Q3KTevaeLFc+BH8lTf/VMVCep3DkRQwuL/r
         jdFg0UXl3/6qV2xqpkee7QF6Zl+FbhzA/8GtStFAYGj0WTu7pO+j4EVztjPNIIufxzqP
         x0z92UvoeSxNiLp555R5S/GwVyjCdyyMv5e2i8/MOhI4piYYH3ON4r2Aug6V15n9mu4b
         0ltQ==
X-Gm-Message-State: AOAM5316Jilan5z2PrXr+y3lmL7QpaZ7rQ/Z4BM8S+LIcirNjcAFi1m2
	KJuoPPRfefX696Hh0uKoIHm4JHQh1JT256lwgWE=
X-Google-Smtp-Source: ABdhPJzzq47SPwLd14/3uCYaP0tD/zBiyOoofB/gWGmXL1GZl3g3/Cs+ypCQT7IRrzLfTNmCZ8ve5UVZrkYu/RVaNdY=
X-Received: by 2002:a0c:f249:: with SMTP id z9mr2962739qvl.55.1623890438382;
 Wed, 16 Jun 2021 17:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210610021705.3792040-1-raj.khem@gmail.com> <622b9813-f98f-2e2c-f42f-737a296c0889@windriver.com>
In-Reply-To: <622b9813-f98f-2e2c-f42f-737a296c0889@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 16 Jun 2021 17:40:27 -0700
Message-ID: <CAMKF1sq-Yy5WjadaA+qQNropbJSQ=XfDdduhvYBkoXMx9n+gGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] arch-armv4: Allow -march=armv4 --> remove qemuarmv5.conf ?
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Andrea Adami <andrea.adami@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bbeb2405c4eb74f9"

--000000000000bbeb2405c4eb74f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 4:59 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2021-06-09 10:17 p.m., Khem Raj wrote:
> > Even though it is deprecated in GCC 6 [1] it has not yet been
> > removed from gcc upstream. We do have active machines in OE
> > ecosystem which use armv4 ( SA11xx ) e.g. collie in meta-handheld
> > so until upstream gcc takes next step to remove them
> > lets support armv4 again, we are still carrying the relevant gcc patch
> > to support v4 BX fix.
> >
> > [1] https://gcc.gnu.org/gcc-6/changes.html#arm
>
>
> Huh, I was going to send an email about removing support for qemuarmv5.
> Do we follow gcc or drop older arches before that?
>

We use armv5te for default tune for that
Machine which is still supported and so is armv4t
Armv4 is a special case where I kept it even after it=E2=80=99s deprecated=
 since
there are users in OE community who are actively using it with master so w=
e
will stretch it to the point where gcc removes it and then perhaps remove
it so no immediate action is needed

As far as armv5 ( without t ) is concerned we can remove it


> Our current list of qemu machines on master is:
>
> meta/conf/machine/qemuarm64.conf
> meta/conf/machine/qemuarm.conf
> meta/conf/machine/qemuarmv5.conf
> meta/conf/machine/qemumips64.conf
> meta/conf/machine/qemumips.conf
> meta/conf/machine/qemuppc64.conf
> meta/conf/machine/qemuppc.conf
> meta/conf/machine/qemuriscv32.conf
> meta/conf/machine/qemuriscv64.conf
> meta/conf/machine/qemux86-64.conf
> meta/conf/machine/qemux86.conf
>
>
> qemuarmv5 was added in:
>
> commit 6fc70eb4f3494bee2be10ee24fe3ea1c8b5ff988
> Author: Jon Mason <jdmason@kudzu.us>
> Date:   Tue Mar 5 17:32:19 2019
>
>      qemuarm: Swap for an arm7ve (A15) configuration
>
>      Add new QEMU BSP for a Arm Cortex-A15 system and use this as qemuar=
m,
>      moving the old armv5te Versatile PB based machine to qemuarmv5.
>
>      The new machine uses the QEMU virt machine type, which should be
>      faster to emulate and updates the qemuarm support to a modern
>      architecture.
>
>      Signed-off-by: Jon Mason <jdmason@kudzu.us>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
> ../Randy
>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >   meta/conf/machine/include/arm/arch-armv4.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv4.inc
> b/meta/conf/machine/include/arm/arch-armv4.inc
> > index fac2bdf952..b71739c20a 100644
> > --- a/meta/conf/machine/include/arm/arch-armv4.inc
> > +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> > @@ -2,7 +2,7 @@ DEFAULTTUNE ?=3D "armv4"
> >
> >   TUNEVALID[arm] =3D "Enable ARM instruction set"
> >   TUNEVALID[armv4] =3D "Enable instructions for ARMv4"
> > -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
> -march=3Darmv4t', '', d)}"
> > +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
> -march=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
> >   # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then
> disable it when we have also armv5 or thumb
> >   # maybe we should extend bb.utils.contains to support check for any
> checkvalues in value, now it does
> >   # checkvalues.issubset(val) which cannot be used for negative test o=
f
> foo neither bar in value
> >
> >
> >
> >=20
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--000000000000bbeb2405c4eb74f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 16, 2021 at 4:59 PM Randy MacLeod &lt;<a href=
=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 2021-06-09 10:17 p.m., =
Khem Raj wrote:<br>
&gt; Even though it is deprecated in GCC 6 [1] it has not yet been<br>
&gt; removed from gcc upstream. We do have active machines in OE<br>
&gt; ecosystem which use armv4 ( SA11xx ) e.g. collie in meta-handheld<br>
&gt; so until upstream gcc takes next step to remove them<br>
&gt; lets support armv4 again, we are still carrying the relevant gcc patc=
h<br>
&gt; to support v4 BX fix.<br>
&gt; <br>
&gt; [1] <a href=3D"https://gcc.gnu.org/gcc-6/changes.html#arm" rel=3D"nor=
eferrer" target=3D"_blank">https://gcc.gnu.org/gcc-6/changes.html#arm</a><b=
r>
<br>
<br>
Huh, I was going to send an email about removing support for qemuarmv5.<br=
>
Do we follow gcc or drop older arches before that?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">We use armv5te =
for default tune for that=C2=A0</div><div dir=3D"auto">Machine which is sti=
ll supported and so is armv4t</div><div dir=3D"auto">Armv4 is a special cas=
e where I kept it even after it=E2=80=99s deprecated since there are users =
in OE community who are actively using it with master so we will stretch it=
 to the point where gcc removes it and then perhaps remove it so no immedia=
te action=C2=A0is needed</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>As far as armv5 ( without t ) is concerned we can remove it=C2=A0</div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Our current list of qemu machines on master is:<br>
<br>
meta/conf/machine/qemuarm64.conf<br>
meta/conf/machine/qemuarm.conf<br>
meta/conf/machine/qemuarmv5.conf<br>
meta/conf/machine/qemumips64.conf<br>
meta/conf/machine/qemumips.conf<br>
meta/conf/machine/qemuppc64.conf<br>
meta/conf/machine/qemuppc.conf<br>
meta/conf/machine/qemuriscv32.conf<br>
meta/conf/machine/qemuriscv64.conf<br>
meta/conf/machine/qemux86-64.conf<br>
meta/conf/machine/qemux86.conf<br>
<br>
<br>
qemuarmv5 was added in:<br>
<br>
commit 6fc70eb4f3494bee2be10ee24fe3ea1c8b5ff988<br>
Author: Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us" target=3D"_blank=
">jdmason@kudzu.us</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Mar 5 17:32:19 2019<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemuarm: Swap for an arm7ve (A15) configuration<br>
<br>
=C2=A0 =C2=A0 =C2=A0Add new QEMU BSP for a Arm Cortex-A15 system and use t=
his as qemuarm,<br>
=C2=A0 =C2=A0 =C2=A0moving the old armv5te Versatile PB based machine to q=
emuarmv5.<br>
<br>
=C2=A0 =C2=A0 =C2=A0The new machine uses the QEMU virt machine type, which=
 should be<br>
=C2=A0 =C2=A0 =C2=A0faster to emulate and updates the qemuarm support to a=
 modern<br>
=C2=A0 =C2=A0 =C2=A0architecture.<br>
<br>
=C2=A0 =C2=A0 =C2=A0Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jdmason=
@kudzu.us" target=3D"_blank">jdmason@kudzu.us</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfou=
ndation.org</a>&gt;<br>
<br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.com" target=
=
=3D"_blank">andrea.adami@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/machine/include/arm/arch-armv4.inc | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf=
/machine/include/arm/arch-armv4.inc<br>
&gt; index fac2bdf952..b71739c20a 100644<br>
&gt; --- a/meta/conf/machine/include/arm/arch-armv4.inc<br>
&gt; +++ b/meta/conf/machine/include/arm/arch-armv4.inc<br>
&gt; @@ -2,7 +2,7 @@ DEFAULTTUNE ?=3D &quot;armv4&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0TUNEVALID[arm] =3D &quot;Enable ARM instruction set&quot;=
<br>
&gt;=C2=A0 =C2=A0TUNEVALID[armv4] =3D &quot;Enable instructions for ARMv4&=
quot;<br>
&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;,=
 &#39;armv4&#39;, &#39; -march=3Darmv4t&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;,=
 &#39;armv4&#39;, &#39; -march=3Darmv4${ARMPKGSFX_THUMB}&#39;, &#39;&#39;, =
d)}&quot;<br>
&gt;=C2=A0 =C2=A0# enable --fix-v4bx when we have armv4 in TUNE_FEATURES, =
but then disable it when we have also armv5 or thumb<br>
&gt;=C2=A0 =C2=A0# maybe we should extend bb.utils.contains to support che=
ck for any checkvalues in value, now it does<br>
&gt;=C2=A0 =C2=A0# checkvalues.issubset(val) which cannot be used for nega=
tive test of foo neither bar in value<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div></div>

--000000000000bbeb2405c4eb74f9--
