Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.36722.1589784129765339803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 23:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s+fgbH3q;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id e125so6230865lfd.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DV0yyzBMQ0DrmBiOPc6vy4z7JURVtg7jNfwwSMgacrc=;
        b=s+fgbH3qodQGwiHG8uQhlqlbcYdmB+2MhCcFSHePLK3xyMtzXcozGVxbcm13j0Afw+
         +ag6WohS/ni8M9k6Tgy/1EcBJPetHx8bgY40+t4PdJCeJv8xavKuWRGOA1vNAS3b+uBp
         RLGoKmEwJazD/+xnWP1MBiZU1142E5KopMxljFr1SI+q0BNBOTjlS6bdv1WV4OloZmfW
         tTLCUi5hNv56QqLMC1IQPZp6wM4olyoXvZ/aWtpF6b54iLqpBsBOpOONWrJw4HTWRnIP
         rpcr1IvuwUUIm3W5PsUEpl3aaExrDcytFr9vItp/2mMGPEPvYHsfIVKp9hykbq7ll6db
         pecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DV0yyzBMQ0DrmBiOPc6vy4z7JURVtg7jNfwwSMgacrc=;
        b=bPf60GQJL9TBtQIS+Nk6aqExq9I+EqEacMbyS0XIMALi4D71xPgGEHoRNA/l/VSREY
         DrkxKU66fUEtxT+susucj30D8QNdsAzyAmzN/IBcqWIrm2iHv8kwNgYXiV6W4y/gMESM
         w7Qc95diFt8mHd/OMtRUkM5AEk5M6fVTUSXY4dyZrE9EXUVkVN7mJtTx73SDE31rxl79
         X3YjTFA/ty19k1p/8iT9TBX0qqBSxtae+GRT86LWCu8XryeD8FNrFwfX0s20a47IuFcJ
         VdoBga5RrCbCrV0/IkW84MBbNRRroVnVYzbj/Yv4au0S6VIf+qMcvZ90ONFrg4U4gled
         uxcw==
X-Gm-Message-State: AOAM532BwmEsl7NeYQjCj428oW6rS7sQ6EFwa0VVINpiFRQFAf0k5/Fu
	EOsKAvjKdkdhSScN2GouyOvkgToXHdG8cE2xJDU=
X-Google-Smtp-Source: ABdhPJy59lCTjCGabSEgBm7OJ4MkPtfu+ihY8pyUk18Fn1nJxScwE9rAU0BuqgZ2++0W6auJ27gWS4wdUiv0ExG4qVo=
X-Received: by 2002:ac2:5de6:: with SMTP id z6mr10357205lfq.18.1589784127964;
 Sun, 17 May 2020 23:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost> <f528668e-4273-2070-3ff9-9fa0b1030ee9@gmail.com>
In-Reply-To: <f528668e-4273-2070-3ff9-9fa0b1030ee9@gmail.com>
From: "Alejandro Hernandez" <alejandro@enedino.org>
Date: Mon, 18 May 2020 00:41:53 -0600
Message-ID: <CAHMutrbRkTXu5fzsyVp=Dfye21eoCOUv74_XioCFD=CknAsJNQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, Andrey Zhizhikin <andrey.z@gmail.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Steve Sakoman <sakoman@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="000000000000378a2b05a5e67681"

--000000000000378a2b05a5e67681
Content-Type: text/plain; charset="UTF-8"

On Sun, May 17, 2020, 5:41 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/17/20 6:22 AM, Adrian Bunk wrote:
> > On Sat, May 16, 2020 at 10:24:04PM +0200, Andrey Zhizhikin wrote:
> >> On Sat, May 16, 2020 at 10:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> >>>
> >>> On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
> >>>>>
> >>>>> meta-openembedded/meta-python has a higher layer priority than
> OE-core.
> >>>>>
> >>>>> Adding higher upstream versions of these recipes to a lower-priority
> >>>>> layer in a stable series is a potential source for weird problems.
> >>>>
> >>>> I would assume they'd be removed from meta-python at the same time
> >>>> they are added to meta.
> >>>
> >>> "at the same time" is complicated since OE-core has releases,
> >>> but meta-openembedded is just a branch.
> >>>
> >>> I would also assume that not all users of stable series are updating
> >>> meta-openembedded to the latest on the dunfell branch at the same
> >>> time as OE-core, some users might end up updating one but never
> >>> updating the other one.
> >>
> >> That I believe would be a terrible mistake when people opt-in to take
> >> a layer, but never care about updating it... :(
> >
> > The typical Yocto user starts with whatever prehistoric Yocto release
> > came with the BSP distribution for the reference hardware, and then
> > develops a new product on top of that.
> >
> > I would not be surprised if someone will have the initial Yocto 2.7
> > release, but uses the latest from the corresponding  meta-openembedded
> > branch on top
>
> To be honest, we should not consider supporting such usecases IMO,
> somewhere we have to draw a line, mixing layer releases is not something
> upstream can even test those combos.
>

I think it should be pretty clear that the product owner has the
responsibility
to update whatever BSP distribution they're using, and make that available
to
their users.

At least IMO it was clear that users should maintain their distribution to
the
latest update of their stable branch, we can certainly put that on the docs
or
a wiki but I thought it was sort of given, since it simply makes sense, but
perhaps making that assumption was a mistake.

We can only do as much as bring updates after a certain release, wether its
a case like this or its a CVE. We cannot control what some products do, yet
we shouldn't let it stop us from doing changes that require updates in
multiple
layers if its a change that makes sense and most users will benefit from.


Alejandro


>
> >
> >> On the contrary, a quick run of "bitbake-layers show-overlayed"
> >> exhibits the following on the [master] of both OE-Core and
> >
> > Thanks a lot for this.
> >
> >> meta-openembedded:
> >> =================
> >> python3-cython:
> >>   meta-python          0.29.14
> >>   meta                 0.29.16
> >> python3-dbusmock:
> >>   meta-python          0.16.7
> >>   meta                 0.19
> >> python3-docutils:
> >>   meta-python          0.15.2
> >>   meta                 0.16
> >> python3-pyparsing:
> >>   meta-python          2.4.6
> >>   meta                 2.4.7
> >> =================
> >
> > I'll take care of getting these removed from meta-openembedded.
> >
> >> Judging be versions, it looks like OE-Core recipes are maintained, but
> >> in meta-openembedded they are left on the side...
> >
> > python3-docutils is ouch, since this problem is also in dunfell.
> >
> > On a more positive note 0.16 is already in OE-core in the initial
> > Yocto 3.1 release, so removing it from meta-openembedded will only
> > be like a 0.15.2 -> 0.16 upgrade for some users but cannot result
> > in losing the recipe in weird layer combinations.
> >
> >> Regards,
> >> Andrey.
> >
> > cu
> > Adrian
> >
>
> 
>

--000000000000378a2b05a5e67681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 17, 2020, 5:41 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
On 5/17/20 6:22 AM, Adrian Bunk wrote:<br>
&gt; On Sat, May 16, 2020 at 10:24:04PM +0200, Andrey Zhizhikin wrote:<br>
&gt;&gt; On Sat, May 16, 2020 at 10:10 PM Adrian Bunk &lt;<a href=3D"mailt=
o:bunk@stusta.de" target=3D"_blank" rel=3D"noreferrer">bunk@stusta.de</a>&g=
t; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; meta-openembedded/meta-python has a higher layer prio=
rity than OE-core.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Adding higher upstream versions of these recipes to a=
 lower-priority<br>
&gt;&gt;&gt;&gt;&gt; layer in a stable series is a potential source for we=
ird problems.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I would assume they&#39;d be removed from meta-python at =
the same time<br>
&gt;&gt;&gt;&gt; they are added to meta.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &quot;at the same time&quot; is complicated since OE-core has=
 releases,<br>
&gt;&gt;&gt; but meta-openembedded is just a branch.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I would also assume that not all users of stable series are u=
pdating<br>
&gt;&gt;&gt; meta-openembedded to the latest on the dunfell branch at the =
same<br>
&gt;&gt;&gt; time as OE-core, some users might end up updating one but nev=
er<br>
&gt;&gt;&gt; updating the other one.<br>
&gt;&gt;<br>
&gt;&gt; That I believe would be a terrible mistake when people opt-in to =
take<br>
&gt;&gt; a layer, but never care about updating it... :(<br>
&gt; <br>
&gt; The typical Yocto user starts with whatever prehistoric Yocto release=
 <br>
&gt; came with the BSP distribution for the reference hardware, and then <=
br>
&gt; develops a new product on top of that.<br>
&gt; <br>
&gt; I would not be surprised if someone will have the initial Yocto 2.7<b=
r>
&gt; release, but uses the latest from the corresponding=C2=A0 meta-openem=
bedded <br>
&gt; branch on top<br>
<br>
To be honest, we should not consider supporting such usecases IMO,<br>
somewhere we have to draw a line, mixing layer releases is not something<b=
r>
upstream can even test those combos.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think it should be pretty clear th=
at the product owner has the responsibility</div><div dir=3D"auto">to updat=
e whatever BSP distribution they&#39;re using, and make that available to</=
div><div dir=3D"auto">their users.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><span style=3D"font-family:sans-serif">At least IMO it was clear=
 that users should maintain their distribution to the</span></div><div dir=
=3D"auto"><span style=3D"font-family:sans-serif">latest update of their st=
able branch, we can certainly put that on the docs or</span></div><div dir=
=3D"auto"><span style=3D"font-family:sans-serif">a wiki but I thought it w=
as sort of given, since it simply makes sense, but</span></div><div dir=3D"=
auto"><span style=3D"font-family:sans-serif">perhaps making that assumption=
 was</span><span style=3D"font-family:sans-serif">=C2=A0a mistake.</span></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">We can only do as much as=
 bring updates after a certain release, wether its</div><div dir=3D"auto">a=
 case like this or its a CVE. We cannot control what some products do, yet<=
/div><div dir=3D"auto">we shouldn&#39;t let it stop us from doing changes t=
hat require updates in multiple</div><div dir=3D"auto">layers if its a chan=
ge that makes sense and most users will benefit from.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
<br>
&gt; <br>
&gt;&gt; On the contrary, a quick run of &quot;bitbake-layers show-overlay=
ed&quot;<br>
&gt;&gt; exhibits the following on the [master] of both OE-Core and<br>
&gt; <br>
&gt; Thanks a lot for this.<br>
&gt; <br>
&gt;&gt; meta-openembedded:<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; python3-cython:<br>
&gt;&gt;=C2=A0 =C2=A0meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.29.14=
<br>
&gt;&gt;=C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A00.29.16<br>
&gt;&gt; python3-dbusmock:<br>
&gt;&gt;=C2=A0 =C2=A0meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.16.7<=
br>
&gt;&gt;=C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A00.19<br>
&gt;&gt; python3-docutils:<br>
&gt;&gt;=C2=A0 =C2=A0meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.15.2<=
br>
&gt;&gt;=C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A00.16<br>
&gt;&gt; python3-pyparsing:<br>
&gt;&gt;=C2=A0 =C2=A0meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2.4.6<b=
r>
&gt;&gt;=C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A02.4.7<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; I&#39;ll take care of getting these removed from meta-openembedded.<b=
r>
&gt; <br>
&gt;&gt; Judging be versions, it looks like OE-Core recipes are maintained=
, but<br>
&gt;&gt; in meta-openembedded they are left on the side...<br>
&gt; <br>
&gt; python3-docutils is ouch, since this problem is also in dunfell.<br>
&gt; <br>
&gt; On a more positive note 0.16 is already in OE-core in the initial<br>
&gt; Yocto 3.1 release, so removing it from meta-openembedded will only<br=
>
&gt; be like a 0.15.2 -&gt; 0.16 upgrade for some users but cannot result<=
br>
&gt; in losing the recipe in weird layer combinations.<br>
&gt; <br>
&gt;&gt; Regards,<br>
&gt;&gt; Andrey.<br>
&gt; <br>
&gt; cu<br>
&gt; Adrian<br>
&gt; <br>
<br>
<br>
</blockquote></div></div></div>

--000000000000378a2b05a5e67681--
