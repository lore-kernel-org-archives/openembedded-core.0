Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.7454.1587248013607987533
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 15:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cE1IGOED;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: kergoth@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id kb16so2846585pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 15:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version;
        bh=pmfRuaYD7goauxkHVWbd0Cy5XMZ5hzUtjvjteUPeTRE=;
        b=cE1IGOEDuDA9UTsckGbCwcVXq2RmIJPc1ZGEwaswrS9kYDkUOtuYeQcQWbeMJYwrHT
         0TbSoKXE+N64YSx59zA0aA1m8OJUCc4AsIPumneYRPax3Nlod3EQQwXN0Cy/Ku9Ymysi
         hXFBIC2f1CMqS5ffHWIYpDyzVy/SFeZK4hp3yqeM8WMrdxfruhkdw1iG0OVwSoZYf7y0
         Vf6iK8UZpBw857UQnL6DLXVeoi0qLz5TC1iZRuwrbzG65r+aPek9EiKARlU0Ji4Yhhnq
         M7aLgl2asXwgsPt5YBwyPdVtINyJ5MveV0g4wzMDO5AthlnjPzKaai9iFOgaURCOGfa+
         xK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version;
        bh=pmfRuaYD7goauxkHVWbd0Cy5XMZ5hzUtjvjteUPeTRE=;
        b=eODHwo5RKoRFd0A3Xo0y+CSYxB5/8AOYN6pa3aFCL5ANJc8QE2yddWsVVmvlFbjpxQ
         FtAG8UBJU9LrgQ4q2+bhjdBlKOfgY2WJ5kvJ5PXkuZz9J8L0P6v38fzx7OwDft4pN5tp
         UaW/aCcXCAjQfzXCqOSdXG43TNKcyz+hdEJtwyiQwN9Xm0aobEp33i0PJ5lFi0Ce5Xtm
         /HHeObo3w4y47GI5WxCIyg0L/1WVUAiZfpdmXoTViIRjWP4Q8kIenXTgQL3W0A6VFOQl
         /vhsvuy8COdRL6iFXElkPABWq1+zrQuaYNrkmOF1dbcREOwSOKbIcJwXAUommrRo9SlM
         bONQ==
X-Gm-Message-State: AGi0PubiD8FHcuT+7fZZOC+9JYXw2zOCXsC7nsBPgVFOtuP+pqTPEGdy
	iVozmluPMTUpCXDNkrA6FtM=
X-Google-Smtp-Source: APiQypIgkgoexjs1ah8f+jsmk6T2uyUuF0V7Vmf2OOCujfuk5XRaSw9YXK3Fc7P8DR4HgAU32+NZzg==
X-Received: by 2002:a17:90a:2fc8:: with SMTP id n8mr11948557pjm.159.1587248012967;
        Sat, 18 Apr 2020 15:13:32 -0700 (PDT)
Return-Path: <kergoth@gmail.com>
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
        by smtp.gmail.com with ESMTPSA id e66sm19430492pfa.69.2020.04.18.15.13.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Apr 2020 15:13:31 -0700 (PDT)
Date: Sat, 18 Apr 2020 15:13:24 -0700
From: "Christopher Larson" <kergoth@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>
Cc: "=?utf-8?Q?chris.laplante=40agilent.com?="
 <chris.laplante@agilent.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, OE Core mailing list
 <openembedded-core@lists.openembedded.org>
Message-ID: <d1b1bb06-3222-4073-831d-7f25e2566ed5@Spark>
In-Reply-To: <alpine.LFD.2.21.2004181605480.8183@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
 <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
 <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>
 <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
 <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain>
 <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com>
 <alpine.LFD.2.21.2004181605480.8183@localhost.localdomain>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
X-Readdle-Message-ID: d1b1bb06-3222-4073-831d-7f25e2566ed5@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5e9b7b89_2eb141f2_4e7"

--5e9b7b89_2eb141f2_4e7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Apr 18, 2020, 1:10 PM -0700, Robert P. J. Day <rpjday=40crashcourse.ca=
>, wrote:
> On Sat, 18 Apr 2020, Peter Kjellerstedt wrote:
>
> > > -----Original Message-----
> > > =46rom: openembedded-core=40lists.openembedded.org <openembedded-
> > > core=40lists.openembedded.org> On Behalf Of Robert P. J. Day
> > > Sent: den 18 april 2020 19:24
> > > To: chris.laplante=40agilent.com
> > > Cc: Richard Purdie <richard.purdie=40linuxfoundation.org>; OE Core =
mailing
> > > list <openembedded-core=40lists.openembedded.org>
> > > Subject: Re: =5BOE-core=5D why does oe-buildenv-internal check for =
-z
> > > =22=24BDIR=22=3F
> > >
> > > On Sat, 18 Apr 2020, chris.laplante=40agilent.com wrote:
> > >
> > > > > i know that -- in fact, it's the only way i use it -- the quest=
ion
> > > > > is the purpose for checking if =24BDIR is zero length first. th=
at is,
> > > > > under what circumstances could it *not* be=3F even invoking the=
 way you
> > > > > demonstrate, that variable is empty when tested, and i see noth=
ing
> > > > > that could cause it to have a value before that test.
> > > >
> > > > =46WIW I was curious/bored and looked to see if 'BDIR' was ever u=
sed
> > > > in poky (outside of the script of course), and I found no results=
.
> > > >
> > > > git rev-list --all =7C xargs git grep -w BDIR -- './*' ':=21scrip=
ts/oe-
> > > buildenv-internal'
> > >
> > > that's kind of the point i was making ... that variable appeared ou=
t
> > > of nowhere, clearly seemed like a local variable, and is even =22un=
set=22
> > > after it's used in that script. i poked around, trying to figure if=

> > > there was some other flow of control that got you into that script
> > > from another direction, but i didn't find one.
> > >
> > > and, yes, it seems trivial to obsess over it, but it's just those
> > > sorts of things that make me wonder, =22hmmmmm ... maybe i *don't*
> > > really understand how this script can be used.=22
> > >
> > > anyway, moving on ...
> > >
> > > rday
> >
> > When it comes to understanding why the code looks like it does in a
> > case like this, it is often better to look at the history than the
> > current state.
> >
> > If you go back to when the test was introduced (commit
> > 5d5fab77cf9616bf62023c202b38f309f8bbf189 in Poky), you will see that
> > BDIR could be set in a script called poky-autobuild at that time.
> > The poky-autobuild script was removed 12 years ago, but the test in
> > oe-buildenv-internal remained.
>
> additional observation, but same script also contains:
>
> if =5B -n =22=242=22 =5D; then
> BITBAKEDIR=3D=22=242=22
> fi
>
> clearly implying a second argument pointing at bitbake directory,
> which is nowhere documented, and is followed by:
>
> if =5B -z =22=24BITBAKEDIR=22 =5D; then
> BITBAKEDIR=3D=22=24OEROOT/bitbake=24BBEXTRA=22
> test -d =22=24BITBAKEDIR=22 =7C=7C BITBAKEDIR=3D=22=24OEROOT/../bitbake=
=24BBEXTRA=22
> fi
>
> this also seems out of date, but i won't flog it any further.


I don=E2=80=99t think this is out of date. It=E2=80=99s allowing the user=
 to specify the path to bitbake (which I=E2=80=99ve done =C2=A0in unusual=
 layouts or just to be explicit), falling back to either under OEROOT (po=
ky-style) or in its parent (more typical).

It=E2=80=99s also worth noting that oe-init-build-env and oe-buildenv-int=
ernal are not just used directly, but many other setup scripts build on t=
op of them, so this particular flexibility is useful. BDIR still seems li=
ke it can be dropped regardless of the BITBAKEDIR logic.

-Chris

--5e9b7b89_2eb141f2_4e7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageReplySection=22>On Apr 18, 2020, 1:10 PM -0700, Rob=
ert P. J. Day &lt;rpjday=40crashcourse.ca&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>On=
 Sat, 18 Apr 2020, Peter Kjellerstedt wrote:<br />
<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =23e67e22;=22>
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =233498db;=22>--=
---Original Message-----<br />
=46rom: openembedded-core=40lists.openembedded.org &lt;openembedded-<br /=
>
core=40lists.openembedded.org&gt; On Behalf Of Robert P. J. Day<br />
Sent: den 18 april 2020 19:24<br />
To: chris.laplante=40agilent.com<br />
Cc: Richard Purdie &lt;richard.purdie=40linuxfoundation.org&gt;; OE Core =
mailing<br />
list &lt;openembedded-core=40lists.openembedded.org&gt;<br />
Subject: Re: =5BOE-core=5D why does oe-buildenv-internal check for -z<br =
/>
=22=24BDIR=22=3F<br />
<br />
On Sat, 18 Apr 2020, chris.laplante=40agilent.com wrote:<br />
<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =23d35400;=22>
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =2334495e;=22>i =
know that -- in fact, it's the only way i use it -- the question<br />
is the purpose for checking if =24BDIR is zero length first. that is,<br =
/>
under what circumstances could it *not* be=3F even invoking the way you<b=
r />
demonstrate, that variable is empty when tested, and i see nothing<br />
that could cause it to have a value before that test.<br /></blockquote>
<br />
=46WIW I was curious/bored and looked to see if 'BDIR' was ever used<br /=
>
in poky (outside of the script of course), and I found no results.<br />
<br />
git rev-list --all =7C xargs git grep -w BDIR -- './*' ':=21scripts/oe-<b=
r /></blockquote>
buildenv-internal'<br />
<br />
that's kind of the point i was making ... that variable appeared out<br /=
>
of nowhere, clearly seemed like a local variable, and is even =22unset=22=
<br />
after it's used in that script. i poked around, trying to figure if<br />=

there was some other flow of control that got you into that script<br />
from another direction, but i didn't find one.<br />
<br />
and, yes, it seems trivial to obsess over it, but it's just those<br />
sorts of things that make me wonder, =22hmmmmm ... maybe i *don't*<br />
really understand how this script can be used.=22<br />
<br />
anyway, moving on ...<br />
<br />
rday<br /></blockquote>
<br />
When it comes to understanding why the code looks like it does in a<br />=

case like this, it is often better to look at the history than the<br />
current state.<br />
<br />
If you go back to when the test was introduced (commit<br />
5d5fab77cf9616bf62023c202b38f309f8bbf189 in Poky), you will see that<br /=
>
BDIR could be set in a script called poky-autobuild at that time.<br />
The poky-autobuild script was removed 12 years ago, but the test in<br />=

oe-buildenv-internal remained.<br /></blockquote>
<br />
additional observation, but same script also contains:<br />
<br />
if =5B -n =22=242=22 =5D; then<br />
BITBAKEDIR=3D=22=242=22<br />
fi<br />
<br />
clearly implying a second argument pointing at bitbake directory,<br />
which is nowhere documented, and is followed by:<br />
<br />
if =5B -z =22=24BITBAKEDIR=22 =5D; then<br />
BITBAKEDIR=3D=22=24OEROOT/bitbake=24BBEXTRA=22<br />
test -d =22=24BITBAKEDIR=22 =7C=7C BITBAKEDIR=3D=22=24OEROOT/../bitbake=24=
BBEXTRA=22<br />
fi<br />
<br />
this also seems out of date, but i won't flog it any further.&=23160;<br =
/></blockquote>
<br />
<div><br /></div>
<div dir=3D=22auto=22>I don=E2=80=99t think this is out of date. It=E2=80=
=99s allowing the user to specify the path to bitbake (which I=E2=80=99ve=
 done &=23160;in unusual layouts or just to be explicit), falling back to=
 either under OEROOT (poky-style) or in its parent (more typical).</div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>It=E2=80=99s also worth noting that oe-init-build-e=
nv and oe-buildenv-internal are not just used directly, but many other se=
tup scripts build on top of them, so this particular flexibility is usefu=
l. BDIR still seems like it can be dropped regardless of the BITBAKEDIR l=
ogic.</div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>-Chris</div>
</div>
</body>
</html>

--5e9b7b89_2eb141f2_4e7--
