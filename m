Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web09.5777.1605606650607056987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 01:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=oxsl5WSL;
 spf=pass (domain: blade-group.com, ip: 209.85.210.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f51.google.com with SMTP id y22so18817403oti.10
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aHdYnbc4udelu+/69lcHLZ/rZ7dVoxXnVv/jb7ntVes=;
        b=oxsl5WSLZiwWaQKXXwlhi/DlmraQnI0Du1ZTPC9eBCg14C2MOfvVfYFtOuOoKJN6XL
         EYGPV0a/EkZGo4AgVmWxKUg2DYqMH+hjcWunfwyDrr4oawRW8qazkGJkXDkz+CER8kZD
         B+r+5pFeAjVqntpwqGL2uJJmeJCgJ1MHjuUpUqQoXITbb5q8ba1wridCY38FM73SFRN5
         Ky2m6orsHDghSV5qrJrZSRvzmVny0/rAUQGfcl0N3XZNYSaRCcu5mhZqPpdr76DNCHs2
         YTp/f9Eui05dK1nlvh3TVj82VQ77r7DSbymxW/RcxknWmC49opE0shYF7iawM5Tr/yyG
         QG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHdYnbc4udelu+/69lcHLZ/rZ7dVoxXnVv/jb7ntVes=;
        b=aHcNqLiu16xW9wnLIB0iM9UmWTXvvEUiWHAEHBh50m4Z7dymKR/eQSKckmrgyK5j8r
         UERmTBGuBORrk61aRuZaQYZ3Xsza6jkAQgnqcfDpdHm0fKF9JoYeuJNGzftNBLG0e4Tw
         Wf6axVaimo4fiKsXFh3TkOXoRjPSQCqzYJybpUupt8R/og6hpbLucAFCwQQTTMGJIQT7
         O/r7FKZ95VWzbMstaBWBfnrw/eUkM3z2dErBGdIK6CldJhf9ZdE/1Z3HfshF+DNphuUG
         qVhIIFdF+nZgxF2V/qcPokxA6GqMBUog2O3wbVm5VRKtvpOy2y9mtoIYfGJI3k3Qvoxd
         s3gg==
X-Gm-Message-State: AOAM532QeQJN9N6fG3yeUOg6XScZ3VMGk/U/eAPdYE/WB6LdhgVK9zxr
	xqKnkN3Jg26dP4Jln7ty3xsY6yLNL+9FG+Yh1/qodw==
X-Google-Smtp-Source: ABdhPJwrBKDMc4Y5FDf1at1CgNeaL+fpxYG9Pwf6cuJxwtZmn9vPQ7FYngcMXRppkXKcU1uHnWpzCVYN1WJTf+HK8t8=
X-Received: by 2002:a05:6830:3151:: with SMTP id c17mr2364671ots.336.1605606649934;
 Tue, 17 Nov 2020 01:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20201112172616.784945-1-yann@blade-group.com> <CAHSqoWsCZbE03tuDsfEnwxSCGddUuti_GAAF_ga6e-ozKXK3Ew@mail.gmail.com>
 <CA+4=imb5WUKYxKg1qwy-k0dUGApzCYwEskddGhVfyovGnSePew@mail.gmail.com>
 <CA+4=imZPuimbfuxLGnjYyy=sWoX3qWbavMk3+vnEqbJXizQWXQ@mail.gmail.com> <CAHSqoWvtKw25wkT0a9Hpvp4T1Umg6OBB7fGrYq1SR+i_6b1Bpg@mail.gmail.com>
In-Reply-To: <CAHSqoWvtKw25wkT0a9Hpvp4T1Umg6OBB7fGrYq1SR+i_6b1Bpg@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 17 Nov 2020 10:50:38 +0100
Message-ID: <CA+4=imYTH2yn4cuF=1391QeaQ8P28=d17pwYGRaihP0wqRmUNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/5] systemtap improvements
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, kamensky@cisco.com, 
	Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000004c68b05b44a6e39"

--00000000000004c68b05b44a6e39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mar. 17 nov. 2020 =C3=A0 05:35, Victor Kamensky <victor.kamensky7@gmail=
.com>
a =C3=A9crit :

> Hi Yann and Richard,
>
> On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson <yann.dirson@blade-group.com=
>
> wrote:
> >
> > Oh I did not notice, shouldn't we be discussing this on-list ?
>
> Very sorry about this. I did not notice that I've unintentionally remove=
d
> the mailing list.
> Added it back.
>
> I see that Richard added your patches to master-next. But I don't think
> they should be
> merged "as is". IMO we need to work more on them.
>
> Richard, could you please hold off merging them?
>
> Other thing that AUT done automatic upgrade to systemtap-4.4 and Zang ha=
ve
> sent patch
> for it. IMO let's first merge 4.4 while we sort out what part of this
> series should go in.
>
> Let's go about slowly one issue at a time.
>
> More responses inline.
>
> > Another question: I can't really see what it brings, to be able to
> disable the "monitor" feature.
> > What should we write about this feature ?
> >
> > Le ven. 13 nov. 2020 =C3=A0 11:57, Yann Dirson <yann.dirson@blade-grou=
p.com>
> a =C3=A9crit :
> >>
> >>
> >>
> >> Le jeu. 12 nov. 2020 =C3=A0 21:11, Victor Kamensky <
> victor.kamensky7@gmail.com> a =C3=A9crit :
> >>>
> >>> Hi Yann,
> >>>
> >>> I am not sure that I understand purpose of the series.
> >>
> >>
> >> The goal was to be able to include a precompiled probe in a readonly
> image, and to get
> >> it loaded during execution of a boot script (I was hunting a but that
> only shows during
> >> target startup).
>
> It is an interesting feature, do you plan to merge precompiled probes in
> production image, or
> you want to add one for some debug case.
>

The idea is to be able to get probes in production images, at least shippe=
d
to select customers
or even just internal users when we need to hunt for particulary rare
problems, and having to modify
the build chain makes things quite more painful (we use the same image
signing and publication
process for all).


> If it is latter one probably there are ways to do
> it just by adding file built crosstap just as additional payload to the
> image.
>

I'm curious how would you do that with standard tools ?  One coworker wrot=
e
for this kind of test
an unsquashfs-stuff-resquashfs that kinda does this kind of work

In developper case I personally deal with it by stopping system boot very
> early i.e using
> systemd "emergency" parameter passed as kernel boot option, dropping int=
o
> the shell
> mounting some storage with precompiled probe, copy and activate probe an=
d
> exiting
> emergency shell.
>

That would not have worked for the particular problem for which I worked o=
n
this, where the
bug did not appear on every boot, and is probably linked to a race
condition exacerbated by
loading times from squashfs :)

Also if we do with supporting such a feature one should be able to build
> probe not only for
> kernel but for the whole user-land. Does your proposed patch series
> support probes for user-land
> too? If so, how do you do that: chicken and egg problem - to build
> user-land probe one need
> complete sysroot of target, but since probe should be include in the
> image, how do one
> build sysroot first.
>

I admit I have not started to look into userland probes, as the system
probe I deployed had
already given valuable information.

>>
> >> It happens that I had not discovered the crosstap tool when I started
> this, but it does not seem
> >> to help much in my use-case.
> >>
> >> My approach was naturally integrated into the build, packaging the
> cross-build of the .stp module,
> >> finally giving birth to the systemtap.bbclass you can find in v1 of
> this series (which I'm here postponing
> >> to a further series).
> >>
> >> I also wanted to avoid installing unused stuff on target, and startin=
g
> disabling some PACKAGECONFIG
> >> items, finding disabling some caused problems.
> >>
> >>>
> >>> The current way to include SystemTap minimal runtime only into targe=
t
> image
> >>> that allow to run compiled on host scripts is to use
> >>>
> >>> PACKAGECONFIG_pn-systemtap =3D  openembedded-core@lists.openembedded=
.org
> "monitor"
>
> >>
> >>
> >> OK, for some reason I had missed that it does indeed achieve that.
> Maybe we should add more doc about that.
> >>
> >> The split of a -runtime package, however, allows to still build the
> "translator" part, not have it installed in the image
> >> shipped on product, but still have the ability to install it from the
> feed while developing, should someone prefer
> >> this to cross-building the probes.  Not a big deal if you prefer not =
to
> do that however, my own use-case would be
> >> covered by the PACKAGECONFIG=3D"monitor".
>
> Yes, I was thinking about this use case as well. But it is quite esoteri=
c
> for OE. Furthermore,
> it kind of contradicts current PACKAGECONFIG structure. If we want to go
> this route we need
> to reshuffle the whole thing in a different way. I.e either use
> PACKAGECONFIG to
> control the content systemtap package or use subpackages. Using both loo=
ks
> a bit convoluted.
>

This would make sense, yes.


> >>
> >> But as state above it does not build on master/gatesgarth/dunfell
> because of the problem fixed by the "fix install when python3-probes is
> disabled in PACKAGECONFIG"
> >> patch in this series.
> >>
> >> Furthermore, this minimal package with just runtime support still pul=
ls
> python3-core without a need for it.
> >> This is coming from "inherit distutils3-base", and we should probably
> not pull this one unless "python3-probes"
> >> is enabled.  I had missed this one, will add another patch for this.
> >>
> >> BTW, does it make any sense to select "python3-probes" but not
> "translator" ?
>
> I don't quite yet follow this issue and need to play more before answeri=
ng
> it. Could you
> please post separate patch only for this?
>

Sending in a few minutes after rebasing (just saw Richard's email)


> Thanks,
> Victor
>
>
> On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson <yann.dirson@blade-group.com=
>
> wrote:
>
>> Oh I did not notice, shouldn't we be discussing this on-list ?
>>
>> Another question: I can't really see what it brings, to be able to
>> disable the "monitor" feature.
>> What should we write about this feature ?
>>
>> Le ven. 13 nov. 2020 =C3=A0 11:57, Yann Dirson <yann.dirson@blade-group=
.com>
>> a =C3=A9crit :
>>
>>>
>>>
>>> Le jeu. 12 nov. 2020 =C3=A0 21:11, Victor Kamensky <
>>> victor.kamensky7@gmail.com> a =C3=A9crit :
>>>
>>>> Hi Yann,
>>>>
>>>> I am not sure that I understand purpose of the series.
>>>>
>>>
>>> The goal was to be able to include a precompiled probe in a readonly
>>> image, and to get
>>> it loaded during execution of a boot script (I was hunting a but that
>>> only shows during
>>> target startup).
>>>
>>> It happens that I had not discovered the crosstap tool when I started
>>> this, but it does not seem
>>> to help much in my use-case.
>>>
>>> My approach was naturally integrated into the build, packaging the
>>> cross-build of the .stp module,
>>> finally giving birth to the systemtap.bbclass you can find in v1 of th=
is
>>> series (which I'm here postponing
>>> to a further series).
>>>
>>> I also wanted to avoid installing unused stuff on target, and starting
>>> disabling some PACKAGECONFIG
>>> items, finding disabling some caused problems.
>>>
>>>
>>>> The current way to include SystemTap minimal runtime only into target
>>>> image
>>>> that allow to run compiled on host scripts is to use
>>>>
>>>> PACKAGECONFIG_pn-systemtap =3D "monitor"
>>>>
>>>
>>> OK, for some reason I had missed that it does indeed achieve that.
>>> Maybe we should add more doc about that.
>>>
>>> The split of a -runtime package, however, allows to still build the
>>> "translator" part, not have it installed in the image
>>> shipped on product, but still have the ability to install it from the
>>> feed while developing, should someone prefer
>>> this to cross-building the probes.  Not a big deal if you prefer not t=
o
>>> do that however, my own use-case would be
>>> covered by the PACKAGECONFIG=3D"monitor".
>>>
>>> But as state above it does not build on master/gatesgarth/dunfell
>>> because of the problem fixed by the "fix install when python3-probes i=
s
>>> disabled in PACKAGECONFIG"
>>> patch in this series.
>>>
>>> Furthermore, this minimal package with just runtime support still pull=
s
>>> python3-core without a need for it.
>>> This is coming from "inherit distutils3-base", and we should probably
>>> not pull this one unless "python3-probes"
>>> is enabled.  I had missed this one, will add another patch for this.
>>>
>>> BTW, does it make any sense to select "python3-probes" but not
>>> "translator" ?
>>>
>>> Best regards,
>>> --
>>> Yann
>>>
>>>
>>>> in your local conf/local.conf file or add proper bbappend where only
>>>> monitor feature would be enabled for systemtap package.
>>>>
>>>> That is mentioned at in crosstap script help
>>>>
>>>> http://git.openembedded.org/openembedded-core/tree/scripts/crosstap#n=
370
>>>>
>>>> Thanks,
>>>> Victor
>>>>
>>>> On Thu, Nov 12, 2020 at 9:28 AM Yann Dirson <
>>>> yann.dirson@blade-group.com> wrote:
>>>> >
>>>> > From: Yann Dirson <yann@blade-group.com>
>>>> >
>>>> > The goal of this series is to make it possible to run compiled
>>>> > systemtap probes on the target without all the tools otherwise
>>>> > necessary to compile them.
>>>> >
>>>> > This series also includes unrelated fixes to the systemtap packagin=
g,
>>>> > on which I stumbled while on the main subject.
>>>> >
>>>> > Changes from v1:
>>>> >
>>>> > * the last 3 patches, whole goal is to provide a systemtap.bbclass
>>>> >   will be rerolled into another series later and were removed
>>>> > * the "split runtime material" changes the runtime test to use the
>>>> >   smaller runtime package
>>>> >
>>>> >
>>>> > Yann Dirson (5):
>>>> >   systemtap: split examples and python scripts out of main package
>>>> >   systemtap: remove extra dependencies
>>>> >   systemtap: clarify the relation between exporter and python3-prob=
es
>>>> >     feature
>>>> >   systemtap: fix install when python3-probes is disabled in
>>>> >     PACKAGECONFIG
>>>> >   systemtap: split runtime material in its own package
>>>> >
>>>> >  meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 +-
>>>> >  .../recipes-kernel/systemtap/systemtap_git.bb | 38
>>>> ++++++++++++++++---
>>>> >  2 files changed, 33 insertions(+), 7 deletions(-)
>>>> >
>>>> > --
>>>> > 2.28.0
>>>> >
>>>> >
>>>> >=20
>>>> >
>>>>
>>>
>>>
>>> --
>>> Yann Dirson <yann@blade-group.com>
>>> Blade / Shadow -- http://shadow.tech
>>>
>>>
>>
>> --
>> Yann Dirson <yann@blade-group.com>
>> Blade / Shadow -- http://shadow.tech
>>
>>

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--00000000000004c68b05b44a6e39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 17 nov. 2020 =C3=A0=C2=A005:35,=
 Victor Kamensky &lt;<a href=3D"mailto:victor.kamensky7@gmail.com">victor.k=
amensky7@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Yann and Richard,<br>=
<br>On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson &lt;<a href=3D"mailto:yann.=
dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&g=
t; wrote:<br>&gt;<br>&gt; Oh I did not notice, shouldn&#39;t we be discussi=
ng this on-list ?<br><br>Very sorry about this. I did not notice that I&#39=
;ve unintentionally removed the mailing list.<br>Added it back.<br><br>I se=
e that Richard added your patches to master-next. But I don&#39;t think the=
y should be<br>merged &quot;as is&quot;. IMO we need to work more on them.<=
br><br>Richard, could you please hold off merging them?<br><br>Other thing =
that AUT done automatic upgrade to systemtap-4.4 and Zang have sent patch<b=
r>for it. IMO let&#39;s first merge 4.4 while we sort out what part of this=
 series should go in.<br><br>Let&#39;s go about slowly one issue at a time.=
<br><br>More responses inline.<br><br>&gt; Another question: I can&#39;t re=
ally see what it brings, to be able to disable the &quot;monitor&quot; feat=
ure.<br>&gt; What should we write about this feature ?<br>&gt;<br>&gt; Le v=
en. 13 nov. 2020 =C3=A0 11:57, Yann Dirson &lt;<a href=3D"mailto:yann.dirso=
n@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; a =
=
=C3=A9crit :<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Le jeu. 12 no=
v. 2020 =C3=A0 21:11, Victor Kamensky &lt;<a href=3D"mailto:victor.kamensky=
7@gmail.com" target=3D"_blank">victor.kamensky7@gmail.com</a>&gt; a =C3=A9c=
rit :<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Hi Yann,<br>&gt;&gt;&gt;<br>&gt;&gt;&=
gt; I am not sure that I understand purpose of the series.<br>&gt;&gt;<br>&=
gt;&gt;<br>&gt;&gt; The goal was to be able to include a precompiled probe =
in a readonly image, and to get<br>&gt;&gt; it loaded during execution of a=
 boot script (I was hunting a but that only shows during<br>&gt;&gt; target=
 startup).<br><br>It is an interesting feature, do you plan to merge precom=
piled probes in production image, or<br>you want to add one for some debug =
case. </div></blockquote><div><div><br></div><div>The idea is to be able to=
 get probes in production images, at least shipped to select customers</div=
><div>or even just internal users when we need to hunt for particulary rare=
 problems, and having to modify</div><div>the build chain makes things quit=
e more painful (we use the same image signing and publication</div><div> pr=
ocess for all).<br></div><div> </div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">If it is latter one probably there=
 are ways to do<br>it just by adding file built crosstap just as additional=
 payload to the image.<br></div></blockquote><div><br></div><div>I&#39;m cu=
rious how would you do that with standard tools ?=C2=A0 One coworker wrote =
for this kind of test</div><div>an unsquashfs-stuff-resquashfs that kinda d=
oes this kind of work<br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">In developper case I personally deal =
with it by stopping system boot very early i.e using<br>systemd &quot;emerg=
ency&quot; parameter passed as kernel boot option, dropping into the shell<=
br>mounting some storage with precompiled probe, copy and activate probe an=
d exiting<br>emergency shell.<br></div></blockquote><div><br></div><div>Tha=
t would not have worked for the particular problem for which I worked on th=
is, where the</div><div>bug did not appear on every boot, and is probably l=
inked to a race condition exacerbated by</div><div>loading times from squas=
hfs :)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Also if we do with supporting such a feature one sho=
uld be able to build probe not only for<br>kernel but for the whole user-la=
nd. Does your proposed patch series support probes for user-land<br>too? If=
 so, how do you do that: chicken and egg problem - to build user-land probe=
 one need<br>complete sysroot of target, but since probe should be include =
in the image, how do one<br>build sysroot first.<br></div></blockquote><div=
><br></div><div>I admit I have not started to look into userland probes, as=
 the system probe I deployed had</div><div>already given valuable informati=
on.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">&gt;&gt;<br>&gt;&gt; It happens that I had not discover=
ed the crosstap tool when I started this, but it does not seem<br>&gt;&gt; =
to help much in my use-case.<br>&gt;&gt;<br>&gt;&gt; My approach was natura=
lly integrated into the build, packaging the cross-build of the .stp module=
,<br>&gt;&gt; finally giving birth to the systemtap.bbclass you can find in=
 v1 of this series (which I&#39;m here postponing<br>&gt;&gt; to a further =
series).<br>&gt;&gt;<br>&gt;&gt; I also wanted to avoid installing unused s=
tuff on target, and starting disabling some PACKAGECONFIG<br>&gt;&gt; items=
, finding disabling some caused problems.<br>&gt;&gt;<br>&gt;&gt;&gt;<br>&g=
t;&gt;&gt; The current way to include SystemTap minimal runtime only into t=
arget image<br>&gt;&gt;&gt; that allow to run compiled on host scripts is t=
o use<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; PACKAGECONFIG_pn-systemtap =3D =C2=A0=
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a>&quot;monitor&quot;<br><br>&=
gt;&gt;<br>&gt;&gt;<br>&gt;&gt; OK, for some reason I had missed that it do=
es indeed achieve that.=C2=A0 Maybe we should add more doc about that.<br>&=
gt;&gt;<br>&gt;&gt; The split of a -runtime package, however, allows to sti=
ll build the &quot;translator&quot; part, not have it installed in the imag=
e<br>&gt;&gt; shipped on product, but still have the ability to install it =
from the feed while developing, should someone prefer<br>&gt;&gt; this to c=
ross-building the probes.=C2=A0 Not a big deal if you prefer not to do that=
 however, my own use-case would be<br>&gt;&gt; covered by the PACKAGECONFIG=
=
=3D&quot;monitor&quot;.<br><br>Yes, I was thinking about this use case as =
well. But it is quite esoteric for OE. Furthermore,<div>it kind of contradi=
cts current PACKAGECONFIG structure. If we want to go this route we need</d=
iv><div>to reshuffle the whole thing in a different way. I.e either use PAC=
KAGECONFIG to</div><div>control the content systemtap package or use subpac=
kages. Using both looks a bit convoluted.<br></div></div></blockquote><div>=
<br></div><div>This would make sense, yes.</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br>&gt;&gt;<b=
r>&gt;&gt; But as state above it does not build on master/gatesgarth/dunfel=
l because of the problem fixed by the &quot;fix install when python3-probes=
 is disabled in PACKAGECONFIG&quot;<br>&gt;&gt; patch in this series.<br>&g=
t;&gt;<br>&gt;&gt; Furthermore, this minimal package with just runtime supp=
ort still pulls python3-core without a need for it.<br>&gt;&gt; This is com=
ing from &quot;inherit distutils3-base&quot;, and we should probably not pu=
ll this one unless &quot;python3-probes&quot;<br>&gt;&gt; is enabled.=C2=A0=
 I had missed this one, will add another patch for this.<br>&gt;&gt;<br>&gt=
;&gt; BTW, does it make any sense to select &quot;python3-probes&quot; but =
not &quot;translator&quot; ?<br><br>I don&#39;t quite yet follow this issue=
 and need to play more before answering it. Could you<div>please post separ=
ate patch only for this?<br></div></div></div></blockquote><div><br></div><=
div>Sending in a few minutes after rebasing (just saw Richard&#39;s email)<=
/div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div><div><br>Thanks,<br>Victor</div></div></div><br><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 13,=
 2020 at 5:59 AM Yann Dirson &lt;<a href=3D"mailto:yann.dirson@blade-group.=
com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Oh =
I did not notice, shouldn&#39;t we be discussing this on-list ?</div><div><=
br></div><div>Another question: I can&#39;t really see what it brings, to b=
e able to disable the &quot;monitor&quot; feature.</div><div>What should we=
 write about this feature ?<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 13 nov. 2020 =C3=A0=C2=A0=
11:57, Yann Dirson &lt;<a href=3D"mailto:yann.dirson@blade-group.com" targe=
t=3D"_blank">yann.dirson@blade-group.com</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">Le=C2=A0jeu. 12 nov. 2020 =C3=A0=C2=A021:11, Victor Kamens=
ky &lt;<a href=3D"mailto:victor.kamensky7@gmail.com" target=3D"_blank">vict=
or.kamensky7@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Yann,<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--00000000000004c68b05b44a6e39--
