Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.3730.1605587712357215376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 20:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oNiexbkA;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id i17so21678164ljd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 20:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3kPkS4H+21C51EzWaIQfFK6JyTzrtaBHCd/klQdUlnU=;
        b=oNiexbkAqDeWy91AujerNFmuPIR2RFebHW96KklKJ+UzymdlWPVJXRMrV68Kd9d2cb
         dR17m4fhbcw+Yxr0oP/jhLoJJmfsUFkzL2TGyYmbued6lQHoxKPqtLTcVifw5gdOFg6K
         NcpUD6+ZMy2vOmBPGtxKl0Oc4On1AsAu5atIk8CPvKhRDAe6ueTFLoCCaJ8d8fTdBv0t
         NmSbvB4A7Wn5zXQU5LcAa5V0eJCgXe7bYX2AY+/BPc2b0ej8cFO9HLifOOOiya8xAK+/
         /oIEpNm1KOmssi/x/2tVXqrsnX6ENv3F5fhpkG5og/kTIYAldgafAcsGsmoF4z5na/hh
         0Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3kPkS4H+21C51EzWaIQfFK6JyTzrtaBHCd/klQdUlnU=;
        b=kV+ILTtE6RAJ6Jb6Xo+Y06ZHHmjdrQwK4BvwmhdbASl00xhpMh5y/S0fN3mnRzXUEN
         CU5Koegyh0vn5YtfCwqixo4wsZf0+C7xAxVYHADTWgVy81ldGirnibM+N2brjHw4/d5C
         hKpwL7TYr31WOluc0kVf4Bb+8HhA/9urEmK7SZpKWFNGm8AjN0BYL1m7wUrr0pScuKXx
         QTkkGYuSMMSo0iKFucVYy3jk943lPqJzDNdg6U3VM8GYrUzNll3J/DgxIRIQFFyIHtC7
         nMAPS7QyjkMcv2okUXDZoUQHc5t5fTpYyxyPlV1+eVArhHRyErq0TV3Sk2L2SBLfO99r
         d6KA==
X-Gm-Message-State: AOAM530ykN9xLXmM/h4gcZ8Za8us1Rh9R2Fe58P+EOe8m9x3BYvdbdMb
	prNtb2AkrKdseOmNQF/tpYGMq20WFSe5D43b38Q=
X-Google-Smtp-Source: ABdhPJxtCDLahKglfoHMvEMvUBELvumHd3V/X4fHk4XAYRa933bgf7leVSvSK8f8vvpqEIUoIf8RXE/+mn4X/Ba7rkc=
X-Received: by 2002:a2e:9811:: with SMTP id a17mr1187464ljj.164.1605587710500;
 Mon, 16 Nov 2020 20:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20201112172616.784945-1-yann@blade-group.com> <CAHSqoWsCZbE03tuDsfEnwxSCGddUuti_GAAF_ga6e-ozKXK3Ew@mail.gmail.com>
 <CA+4=imb5WUKYxKg1qwy-k0dUGApzCYwEskddGhVfyovGnSePew@mail.gmail.com> <CA+4=imZPuimbfuxLGnjYyy=sWoX3qWbavMk3+vnEqbJXizQWXQ@mail.gmail.com>
In-Reply-To: <CA+4=imZPuimbfuxLGnjYyy=sWoX3qWbavMk3+vnEqbJXizQWXQ@mail.gmail.com>
From: victor.kamensky7@gmail.com
Date: Mon, 16 Nov 2020 20:34:59 -0800
Message-ID: <CAHSqoWvtKw25wkT0a9Hpvp4T1Umg6OBB7fGrYq1SR+i_6b1Bpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/5] systemtap improvements
To: Yann Dirson <yann.dirson@blade-group.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, kamensky@cisco.com, 
	Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000023e47e05b44605b4"

--00000000000023e47e05b44605b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann and Richard,

On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson <yann.dirson@blade-group.com>
wrote:
>
> Oh I did not notice, shouldn't we be discussing this on-list ?

Very sorry about this. I did not notice that I've unintentionally removed
the mailing list.
Added it back.

I see that Richard added your patches to master-next. But I don't think
they should be
merged "as is". IMO we need to work more on them.

Richard, could you please hold off merging them?

Other thing that AUT done automatic upgrade to systemtap-4.4 and Zang have
sent patch
for it. IMO let's first merge 4.4 while we sort out what part of this
series should go in.

Let's go about slowly one issue at a time.

More responses inline.

> Another question: I can't really see what it brings, to be able to
disable the "monitor" feature.
> What should we write about this feature ?
>
> Le ven. 13 nov. 2020 =C3=A0 11:57, Yann Dirson <yann.dirson@blade-group.=
com> a
=C3=A9crit :
>>
>>
>>
>> Le jeu. 12 nov. 2020 =C3=A0 21:11, Victor Kamensky <victor.kamensky7@gm=
ail.com>
a =C3=A9crit :
>>>
>>> Hi Yann,
>>>
>>> I am not sure that I understand purpose of the series.
>>
>>
>> The goal was to be able to include a precompiled probe in a readonly
image, and to get
>> it loaded during execution of a boot script (I was hunting a but that
only shows during
>> target startup).

It is an interesting feature, do you plan to merge precompiled probes in
production image, or
you want to add one for some debug case. If it is latter one probably ther=
e
are ways to do
it just by adding file built crosstap just as additional payload to the
image.

In developper case I personally deal with it by stopping system boot very
early i.e using
systemd "emergency" parameter passed as kernel boot option, dropping into
the shell
mounting some storage with precompiled probe, copy and activate probe and
exiting
emergency shell.

Also if we do with supporting such a feature one should be able to build
probe not only for
kernel but for the whole user-land. Does your proposed patch series suppor=
t
probes for user-land
too? If so, how do you do that: chicken and egg problem - to build
user-land probe one need
complete sysroot of target, but since probe should be include in the image=
,
how do one
build sysroot first.

>>
>> It happens that I had not discovered the crosstap tool when I started
this, but it does not seem
>> to help much in my use-case.
>>
>> My approach was naturally integrated into the build, packaging the
cross-build of the .stp module,
>> finally giving birth to the systemtap.bbclass you can find in v1 of thi=
s
series (which I'm here postponing
>> to a further series).
>>
>> I also wanted to avoid installing unused stuff on target, and starting
disabling some PACKAGECONFIG
>> items, finding disabling some caused problems.
>>
>>>
>>> The current way to include SystemTap minimal runtime only into target
image
>>> that allow to run compiled on host scripts is to use
>>>
>>> PACKAGECONFIG_pn-systemtap =3D  openembedded-core@lists.openembedded.o=
rg
"monitor"

>>
>>
>> OK, for some reason I had missed that it does indeed achieve that.
Maybe we should add more doc about that.
>>
>> The split of a -runtime package, however, allows to still build the
"translator" part, not have it installed in the image
>> shipped on product, but still have the ability to install it from the
feed while developing, should someone prefer
>> this to cross-building the probes.  Not a big deal if you prefer not to
do that however, my own use-case would be
>> covered by the PACKAGECONFIG=3D"monitor".

Yes, I was thinking about this use case as well. But it is quite esoteric
for OE. Furthermore,
it kind of contradicts current PACKAGECONFIG structure. If we want to go
this route we need
to reshuffle the whole thing in a different way. I.e either use
PACKAGECONFIG to
control the content systemtap package or use subpackages. Using both looks
a bit convoluted.

>>
>> But as state above it does not build on master/gatesgarth/dunfell
because of the problem fixed by the "fix install when python3-probes is
disabled in PACKAGECONFIG"
>> patch in this series.
>>
>> Furthermore, this minimal package with just runtime support still pulls
python3-core without a need for it.
>> This is coming from "inherit distutils3-base", and we should probably
not pull this one unless "python3-probes"
>> is enabled.  I had missed this one, will add another patch for this.
>>
>> BTW, does it make any sense to select "python3-probes" but not
"translator" ?

I don't quite yet follow this issue and need to play more before answering
it. Could you
please post separate patch only for this?

Thanks,
Victor


On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson <yann.dirson@blade-group.com>
wrote:

> Oh I did not notice, shouldn't we be discussing this on-list ?
>
> Another question: I can't really see what it brings, to be able to disab=
le
> the "monitor" feature.
> What should we write about this feature ?
>
> Le ven. 13 nov. 2020 =C3=A0 11:57, Yann Dirson <yann.dirson@blade-group.=
com> a
> =C3=A9crit :
>
>>
>>
>> Le jeu. 12 nov. 2020 =C3=A0 21:11, Victor Kamensky <victor.kamensky7@gm=
ail.com>
>> a =C3=A9crit :
>>
>>> Hi Yann,
>>>
>>> I am not sure that I understand purpose of the series.
>>>
>>
>> The goal was to be able to include a precompiled probe in a readonly
>> image, and to get
>> it loaded during execution of a boot script (I was hunting a but that
>> only shows during
>> target startup).
>>
>> It happens that I had not discovered the crosstap tool when I started
>> this, but it does not seem
>> to help much in my use-case.
>>
>> My approach was naturally integrated into the build, packaging the
>> cross-build of the .stp module,
>> finally giving birth to the systemtap.bbclass you can find in v1 of thi=
s
>> series (which I'm here postponing
>> to a further series).
>>
>> I also wanted to avoid installing unused stuff on target, and starting
>> disabling some PACKAGECONFIG
>> items, finding disabling some caused problems.
>>
>>
>>> The current way to include SystemTap minimal runtime only into target
>>> image
>>> that allow to run compiled on host scripts is to use
>>>
>>> PACKAGECONFIG_pn-systemtap =3D "monitor"
>>>
>>
>> OK, for some reason I had missed that it does indeed achieve that.  May=
be
>> we should add more doc about that.
>>
>> The split of a -runtime package, however, allows to still build the
>> "translator" part, not have it installed in the image
>> shipped on product, but still have the ability to install it from the
>> feed while developing, should someone prefer
>> this to cross-building the probes.  Not a big deal if you prefer not to
>> do that however, my own use-case would be
>> covered by the PACKAGECONFIG=3D"monitor".
>>
>> But as state above it does not build on master/gatesgarth/dunfell becau=
se
>> of the problem fixed by the "fix install when python3-probes is disable=
d in
>> PACKAGECONFIG"
>> patch in this series.
>>
>> Furthermore, this minimal package with just runtime support still pulls
>> python3-core without a need for it.
>> This is coming from "inherit distutils3-base", and we should probably n=
ot
>> pull this one unless "python3-probes"
>> is enabled.  I had missed this one, will add another patch for this.
>>
>> BTW, does it make any sense to select "python3-probes" but not
>> "translator" ?
>>
>> Best regards,
>> --
>> Yann
>>
>>
>>> in your local conf/local.conf file or add proper bbappend where only
>>> monitor feature would be enabled for systemtap package.
>>>
>>> That is mentioned at in crosstap script help
>>>
>>> http://git.openembedded.org/openembedded-core/tree/scripts/crosstap#n3=
70
>>>
>>> Thanks,
>>> Victor
>>>
>>> On Thu, Nov 12, 2020 at 9:28 AM Yann Dirson <yann.dirson@blade-group.c=
om>
>>> wrote:
>>> >
>>> > From: Yann Dirson <yann@blade-group.com>
>>> >
>>> > The goal of this series is to make it possible to run compiled
>>> > systemtap probes on the target without all the tools otherwise
>>> > necessary to compile them.
>>> >
>>> > This series also includes unrelated fixes to the systemtap packaging=
,
>>> > on which I stumbled while on the main subject.
>>> >
>>> > Changes from v1:
>>> >
>>> > * the last 3 patches, whole goal is to provide a systemtap.bbclass
>>> >   will be rerolled into another series later and were removed
>>> > * the "split runtime material" changes the runtime test to use the
>>> >   smaller runtime package
>>> >
>>> >
>>> > Yann Dirson (5):
>>> >   systemtap: split examples and python scripts out of main package
>>> >   systemtap: remove extra dependencies
>>> >   systemtap: clarify the relation between exporter and python3-probe=
s
>>> >     feature
>>> >   systemtap: fix install when python3-probes is disabled in
>>> >     PACKAGECONFIG
>>> >   systemtap: split runtime material in its own package
>>> >
>>> >  meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 +-
>>> >  .../recipes-kernel/systemtap/systemtap_git.bb | 38
>>> ++++++++++++++++---
>>> >  2 files changed, 33 insertions(+), 7 deletions(-)
>>> >
>>> > --
>>> > 2.28.0
>>> >
>>> >
>>> >=20
>>> >
>>>
>>
>>
>> --
>> Yann Dirson <yann@blade-group.com>
>> Blade / Shadow -- http://shadow.tech
>>
>>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
>

--00000000000023e47e05b44605b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Yann and Richard,<br><br>On Fri, Nov 13, 2020 at 5:59 A=
M Yann Dirson &lt;<a href=3D"mailto:yann.dirson@blade-group.com">yann.dirso=
n@blade-group.com</a>&gt; wrote:<br>&gt;<br>&gt; Oh I did not notice, shoul=
dn&#39;t we be discussing this on-list ?<br><br>Very sorry about this. I di=
d not notice that I&#39;ve unintentionally removed the mailing list.<br>Add=
ed it back.<br><br>I see that Richard added your patches to master-next. Bu=
t I don&#39;t think they should be<br>merged &quot;as is&quot;. IMO we need=
 to work more on them.<br><br>Richard, could you please hold off merging th=
em?<br><br>Other thing that AUT done automatic upgrade to systemtap-4.4 and=
 Zang have sent patch<br>for it. IMO let&#39;s first merge 4.4 while we sor=
t out what part of this series should go in.<br><br>Let&#39;s go about slow=
ly one issue at a time.<br><br>More responses inline.<br><br>&gt; Another q=
uestion: I can&#39;t really see what it brings, to be able to disable the &=
quot;monitor&quot; feature.<br>&gt; What should we write about this feature=
 ?<br>&gt;<br>&gt; Le ven. 13 nov. 2020 =C3=A0 11:57, Yann Dirson &lt;<a hr=
ef=3D"mailto:yann.dirson@blade-group.com">yann.dirson@blade-group.com</a>&g=
t; a =C3=A9crit :<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Le jeu. 1=
2 nov. 2020 =C3=A0 21:11, Victor Kamensky &lt;<a href=3D"mailto:victor.kame=
nsky7@gmail.com">victor.kamensky7@gmail.com</a>&gt; a =C3=A9crit :<br>&gt;&=
gt;&gt;<br>&gt;&gt;&gt; Hi Yann,<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; I am not s=
ure that I understand purpose of the series.<br>&gt;&gt;<br>&gt;&gt;<br>&gt=
;&gt; The goal was to be able to include a precompiled probe in a readonly =
image, and to get<br>&gt;&gt; it loaded during execution of a boot script (=
I was hunting a but that only shows during<br>&gt;&gt; target startup).<br>=
<br>It is an interesting feature, do you plan to merge precompiled probes i=
n production image, or<br>you want to add one for some debug case. If it is=
 latter one probably there are ways to do<br>it just by adding file built c=
rosstap just as additional payload to the image.<br><br>In developper case =
I personally deal with it by stopping system boot very early i.e using<br>s=
ystemd &quot;emergency&quot; parameter passed as kernel boot option, droppi=
ng into the shell<br>mounting some storage with precompiled probe, copy and=
 activate probe and exiting<br>emergency shell.<br><br>Also if we do with s=
upporting such a feature one should be able to build probe not only for<br>=
kernel but for the whole user-land. Does your proposed patch series support=
 probes for user-land<br>too? If so, how do you do that: chicken and egg pr=
oblem - to build user-land probe one need<br>complete sysroot of target, bu=
t since probe should be include in the image, how do one<br>build sysroot f=
irst.<br><br>&gt;&gt;<br>&gt;&gt; It happens that I had not discovered the =
crosstap tool when I started this, but it does not seem<br>&gt;&gt; to help=
 much in my use-case.<br>&gt;&gt;<br>&gt;&gt; My approach was naturally int=
egrated into the build, packaging the cross-build of the .stp module,<br>&g=
t;&gt; finally giving birth to the systemtap.bbclass you can find in v1 of =
this series (which I&#39;m here postponing<br>&gt;&gt; to a further series)=
.<br>&gt;&gt;<br>&gt;&gt; I also wanted to avoid installing unused stuff on=
 target, and starting disabling some PACKAGECONFIG<br>&gt;&gt; items, findi=
ng disabling some caused problems.<br>&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&=
gt; The current way to include SystemTap minimal runtime only into target i=
mage<br>&gt;&gt;&gt; that allow to run compiled on host scripts is to use<b=
r>&gt;&gt;&gt;<br>&gt;&gt;&gt; PACKAGECONFIG_pn-systemtap =3D =C2=A0<a href=
=
=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-core@lis=
ts.openembedded.org</a>&quot;monitor&quot;<br><br>&gt;&gt;<br>&gt;&gt;<br>&=
gt;&gt; OK, for some reason I had missed that it does indeed achieve that.=
=C2=A0 Maybe we should add more doc about that.<br>&gt;&gt;<br>&gt;&gt; Th=
e split of a -runtime package, however, allows to still build the &quot;tra=
nslator&quot; part, not have it installed in the image<br>&gt;&gt; shipped =
on product, but still have the ability to install it from the feed while de=
veloping, should someone prefer<br>&gt;&gt; this to cross-building the prob=
es.=C2=A0 Not a big deal if you prefer not to do that however, my own use-c=
ase would be<br>&gt;&gt; covered by the PACKAGECONFIG=3D&quot;monitor&quot;=
.<br><br>Yes, I was thinking about this use case as well. But it is quite e=
soteric for OE. Furthermore,<div>it kind of contradicts current PACKAGECONF=
IG structure. If we want to go this route we need</div><div>to reshuffle th=
e whole thing in a different way. I.e either use PACKAGECONFIG to</div><div=
>control the content systemtap package or use subpackages. Using both looks=
 a bit convoluted.<br><br>&gt;&gt;<br>&gt;&gt; But as state above it does n=
ot build on master/gatesgarth/dunfell because of the problem fixed by the &=
quot;fix install when python3-probes is disabled in PACKAGECONFIG&quot;<br>=
&gt;&gt; patch in this series.<br>&gt;&gt;<br>&gt;&gt; Furthermore, this mi=
nimal package with just runtime support still pulls python3-core without a =
need for it.<br>&gt;&gt; This is coming from &quot;inherit distutils3-base&=
quot;, and we should probably not pull this one unless &quot;python3-probes=
&quot;<br>&gt;&gt; is enabled.=C2=A0 I had missed this one, will add anothe=
r patch for this.<br>&gt;&gt;<br>&gt;&gt; BTW, does it make any sense to se=
lect &quot;python3-probes&quot; but not &quot;translator&quot; ?<br><br>I d=
on&#39;t quite yet follow this issue and need to play more before answering=
 it. Could you<div>please post separate patch only for this?<br><br>Thanks,=
<br>Victor</div></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson &lt;<=
a href=3D"mailto:yann.dirson@blade-group.com">yann.dirson@blade-group.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div>Oh I did not notice, shouldn&#39;t we be discussing thi=
s on-list ?</div><div><br></div><div>Another question: I can&#39;t really s=
ee what it brings, to be able to disable the &quot;monitor&quot; feature.</=
div><div>What should we write about this feature ?<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 13=
 nov. 2020 =C3=A0=C2=A011:57, Yann Dirson &lt;<a href=3D"mailto:yann.dirson=
@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 12 nov. 2020 =C3=A0=
=C2=A021:11, Victor Kamensky &lt;<a href=3D"mailto:victor.kamensky7@gmail.=
com" target=3D"_blank">victor.kamensky7@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yann,<b=
r>
<br>
I am not sure that I understand purpose of the series.<br></blockquote><di=
v><br></div><div>The goal was to be able to include a precompiled probe in =
a readonly image, and to get</div><div>it loaded during execution of a boot=
 script (I was hunting a but that only shows during</div><div>target startu=
p).<br></div><div><br></div><div>It happens that I had not discovered the c=
rosstap tool when I started this, but it does not seem</div><div>to help mu=
ch in my use-case.</div><div><br></div><div>My approach was naturally integ=
rated into the build, packaging the cross-build of the .stp module,</div><d=
iv>finally giving birth to the systemtap.bbclass you can find in v1 of this=
 series (which I&#39;m here postponing</div><div>to a further series).<br><=
/div><div><br></div><div>I also wanted to avoid installing unused stuff on =
target, and starting disabling some PACKAGECONFIG</div><div>items, finding =
disabling some caused problems.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
The current way to include SystemTap minimal runtime only into target imag=
e<br>
that allow to run compiled on host scripts is to use<br>
<br>
PACKAGECONFIG_pn-systemtap =3D &quot;monitor&quot;<br></blockquote><div><b=
r></div><div>OK, for some reason I had missed that it does indeed achieve t=
hat.=C2=A0 Maybe we should add more doc about that.</div><div><br></div><di=
v>The split of a -runtime package, however, allows to still build the &quot=
;translator&quot; part, not have it installed in the image</div><div>shippe=
d on product, but still have the ability to install it from the feed while =
developing, should someone prefer</div><div>this to cross-building the prob=
es.=C2=A0 Not a big deal if you prefer not to do that however, my own use-c=
ase would be</div><div>covered by the PACKAGECONFIG=3D&quot;monitor&quot;.<=
/div><div><br></div><div>But as state above it does not build on master/gat=
esgarth/dunfell because of the problem fixed by the &quot;fix install when =
python3-probes is disabled in PACKAGECONFIG&quot;</div><div>patch in this s=
eries.</div><div><br></div><div>Furthermore, this minimal package with just=
 runtime support still pulls python3-core without a need for it.</div><div>=
This is coming from &quot;inherit distutils3-base&quot;, and we should prob=
ably not pull this one unless &quot;python3-probes&quot;</div><div>is enabl=
ed.=C2=A0 I had missed this one, will add another patch for this.<br></div>=
<div><br></div><div>BTW, does it make any sense to select &quot;python3-pro=
bes&quot; but not &quot;translator&quot; ?<br></div></div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote">Best regards,</div><div clas=
s=3D"gmail_quote">-- <br></div><div class=3D"gmail_quote">Yann</div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
in your local conf/local.conf file or add proper bbappend where only<br>
monitor feature would be enabled for systemtap package.<br>
<br>
That is mentioned at in crosstap script help<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core/tree/scripts/cros=
stap#n370" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/openembedded-core/tree/scripts/crosstap#n370</a><br>
<br>
Thanks,<br>
Victor<br>
<br>
On Thu, Nov 12, 2020 at 9:28 AM Yann Dirson &lt;<a href=3D"mailto:yann.dir=
son@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;<br>
&gt; The goal of this series is to make it possible to run compiled<br>
&gt; systemtap probes on the target without all the tools otherwise<br>
&gt; necessary to compile them.<br>
&gt;<br>
&gt; This series also includes unrelated fixes to the systemtap packaging,=
<br>
&gt; on which I stumbled while on the main subject.<br>
&gt;<br>
&gt; Changes from v1:<br>
&gt;<br>
&gt; * the last 3 patches, whole goal is to provide a systemtap.bbclass<br=
>
&gt;=C2=A0 =C2=A0will be rerolled into another series later and were remov=
ed<br>
&gt; * the &quot;split runtime material&quot; changes the runtime test to =
use the<br>
&gt;=C2=A0 =C2=A0smaller runtime package<br>
&gt;<br>
&gt;<br>
&gt; Yann Dirson (5):<br>
&gt;=C2=A0 =C2=A0systemtap: split examples and python scripts out of main =
package<br>
&gt;=C2=A0 =C2=A0systemtap: remove extra dependencies<br>
&gt;=C2=A0 =C2=A0systemtap: clarify the relation between exporter and pyth=
on3-probes<br>
&gt;=C2=A0 =C2=A0 =C2=A0feature<br>
&gt;=C2=A0 =C2=A0systemtap: fix install when python3-probes is disabled in=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG<br>
&gt;=C2=A0 =C2=A0systemtap: split runtime material in its own package<br>
&gt;<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 |=C2=A0 2 +-=
<br>
&gt;=C2=A0 .../recipes-kernel/systemtap/<a href=3D"http://systemtap_git.bb=
" rel=3D"noreferrer" target=3D"_blank">systemtap_git.bb</a> | 38 ++++++++++=
++++++---<br>
&gt;=C2=A0 2 files changed, 33 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Yann Dirs=
on &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade=
-group.com</a>&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" targ=
et=3D"_blank">http://shadow.tech</a><br><br></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Yann Dirs=
on &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade=
-group.com</a>&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" targ=
et=3D"_blank">http://shadow.tech</a><br><br></div>
</blockquote></div>

--00000000000023e47e05b44605b4--
