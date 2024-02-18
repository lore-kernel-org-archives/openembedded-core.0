Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C279C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 15:50:03 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.20031.1708271393029352042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 07:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=XovuEVkb;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E6EC2240027
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 16:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708271390; bh=4qasjgBrV5eyjmS9HFGf9NJDHl/l5GE6uuAjafLDPmI=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version:
	 From;
	b=XovuEVkb1XrCorDLSDoWUJ57UoMVheiF0NdMCUNV1tn1GgkVHSJ7X484KWO+ZCs0a
	 1vTYM+WqARQAvX0YP7g7FSYc7z3tkVXEjmT1mRmzHph4bmnVWWWO/DLV+xiVC719bp
	 slyW8HkatkjAIxuGVYvdvy1AMqV8ZVHwZZWXDMLYDSE4YvlgSjrwm3voxkkDgXqr1h
	 BY37w2hbB+QKiPfpZrUyMArTkawu1zdC+VgJwlNff44QM+ZYG8ZY0rKu0mnwqUm98k
	 dTC4pty0QuqMbqExKMg8eMYvSDj4drniqCpY58Yymgt/d6iePMe1YTnPAtPc38IksX
	 U+ZWaeIKe8qfA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Td98t18yBz9rxB;
	Sun, 18 Feb 2024 16:49:50 +0100 (CET)
Message-ID: <57319fd20fe344b745561db21112654fc8c6d115.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.2130 -> 9.0.2142
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Tim Orling <ticotimo@gmail.com>, Simone =?ISO-8859-1?Q?Wei=DF?=
	 <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 18 Feb 2024 15:49:49 +0000
In-Reply-To: <CANx9H-AfpAq7A6-kWjYhQEcByop69ziqgRiTw99nGhsvgEmkrA@mail.gmail.com>
References: <20240218123250.1516996-1-simone.p.weiss@posteo.com>
	 <CANx9H-AfpAq7A6-kWjYhQEcByop69ziqgRiTw99nGhsvgEmkrA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-hzb0uKzgGLVl0FlKZjMh"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 15:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195835

--=-hzb0uKzgGLVl0FlKZjMh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2024-02-18 at 07:01 -0800, Tim Orling wrote:
>=20
>=20
> On Sun, Feb 18, 2024 at 4:33=E2=80=AFAM Simone Wei=C3=9F <simone.p.weiss@=
posteo.com>
> wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Changes:
> > https://github.com/vim/vim/compare/v9.0.2130...v9.0.2142
> >=20
> > This fixes CVE-2024-22667
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0meta/recipes-support/vim/vim.inc | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-
> > support/vim/vim.inc
> > index 6b440d8947..84af72472a 100644
> > --- a/meta/recipes-support/vim/vim.inc
> > +++ b/meta/recipes-support/vim/vim.inc
> > @@ -19,7 +19,7 @@ SRC_URI =3D
> > "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-path-adjust.patch \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> >=20
> > -PV .=3D ".2130"
> > +PV .=3D ".2142"
> > =C2=A0SRCREV =3D "075ad7047457debfeef13442c01e74088b461092"
> >=20
>=20
> You need to actually change the SRCREV to point to .2142
>=20
> https://github.com/vim/vim/commits/v9.0.2142
>=20
> b39b240c386a5a29241415541f1c99e2e6b8ce47
>=20
>=20
> And then ask yourself if we should take an even more recent version:
>=20
> https://github.com/vim/vim/commits/v9.1.0114

Thanks, will do so.
>=20
> >=20
> > =C2=A0# Do not consider .z in x.y.z, as that is updated with every comm=
it
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195831):
> > https://lists.openembedded.org/g/openembedded-core/message/195831
> > Mute This Topic: https://lists.openembedded.org/mt/104426571/8071792
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > simone.weiss@posteo.net]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


--=-hzb0uKzgGLVl0FlKZjMh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Sun, 2024-02-18 at 07:01 -0800, Tim Orling=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div><br></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 18, 2024=
 at 4:33=E2=80=AFAM Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@p=
osteo.com">simone.p.weiss@posteo.com</a>&gt; wrote:<br></div><blockquote ty=
pe=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddi=
ng-left:1ex"><div>From: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.wei=
ss@posteo.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br></div=
><div><br>Changes:<br></div><div><a href=3D"https://github.com/vim/vim/comp=
are/v9.0.2130...v9.0.2142" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/vim/vim/compare/v9.0.2130...v9.0.2142</a><br></div><div><br>This fi=
xes CVE-2024-22667<br></div><div><br>Signed-off-by: Simone Wei=C3=9F &lt;<a=
 href=3D"mailto:simone.p.weiss@posteo.com" target=3D"_blank">simone.p.weiss=
@posteo.com</a>&gt;<br>---<br>&nbsp;meta/recipes-support/vim/vim.inc | 2 +-=
<br>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br></div><div><br>d=
iff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim=
.inc<br>index 6b440d8947..84af72472a 100644<br>--- a/meta/recipes-support/v=
im/vim.inc<br>+++ b/meta/recipes-support/vim/vim.inc<br>@@ -19,7 +19,7 @@ S=
RC_URI =3D "git://<a href=3D"http://github.com/vim/vim.git;branch=3Dmaster;=
protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/vim/vim.g=
it;branch=3Dmaster;protocol=3Dhttps</a> \<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; file://no-path-adjust.patch \<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; "<br></div><div><br>-PV .=3D ".2130"<br>+PV .=3D ".2142"<br>&nb=
sp;SRCREV =3D "075ad7047457debfeef13442c01e74088b461092"<br></div><br></blo=
ckquote><div dir=3D"auto">You need to actually change the SRCREV to point t=
o .2142</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"=
https://github.com/vim/vim/commits/v9.0.2142">https://github.com/vim/vim/co=
mmits/v9.0.2142</a></div><br></div><div dir=3D"auto"><div><div>b39b240c386a=
5a29241415541f1c99e2e6b8ce47</div><br></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">And then ask yourself if we should take an even more r=
ecent version:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a h=
ref=3D"https://github.com/vim/vim/commits/v9.1.0114">https://github.com/vim=
/vim/commits/v9.1.0114</a></div></div></div></div></blockquote><div><br></d=
iv><div>Thanks, will do so.</div><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><div class=
=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote type=3D"cite" styl=
e=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><di=
v><br>&nbsp;# Do not consider .z in x.y.z, as that is updated with every co=
mmit<br></div><div><br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br></div><div>Links: You receive all messages sent to this group.<br><=
/div><div>View/Reply Online (#195831): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/195831">https://lists.openembedded.org/g/=
openembedded-core/message/195831</a><br></div><div>Mute This Topic: <a href=
=3D"https://lists.openembedded.org/mt/104426571/8071792">https://lists.open=
embedded.org/mt/104426571/8071792</a><br></div><div>Group Owner: <a href=3D=
"mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+o=
wner@lists.openembedded.org</a><br></div><div>Unsubscribe: <a href=3D"https=
://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a>&nbsp;[<a href=3D"mailto:simone.weiss=
@posteo.net">simone.weiss@posteo.net</a>]<br></div><div>-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div><br></div></blockquote></div></d=
iv></blockquote><div><br></div><div><span></span></div></body></html>

--=-hzb0uKzgGLVl0FlKZjMh--

