Return-Path: <Sebastian.Suesens@baslerweb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F1CC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 16:43:10 +0000 (UTC)
Subject: Re: [honister] test and patches for xwayland support
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?U8O8c2VucywgU2ViYXN0aWFu?= <Sebastian.Suesens@baslerweb.com>
X-Originating-Location: Malente, Schleswig-Holstein, DE (84.140.255.212)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 10 Jun 2022 09:43:08 -0700
References: 
 <CANNYZj_-fR3=Hj7UayvQpYeMUstP+imD6S645=eGBHWS=oGejA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_-fR3=Hj7UayvQpYeMUstP+imD6S645=eGBHWS=oGejA@mail.gmail.com>
Message-ID: <11399.1654879388178215858@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EINPztrc44L8loEEjGbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 16:43:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166811

--EINPztrc44L8loEEjGbb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

If I start weston as root user, weston starts like expected.

When I start weston over the service /etc/init.d/weston start

I see following error message in westen.log, when the system come up.

failed to bind to /tmp/.X11-unix/X0: Permission denied

The folder has following rights:
drwxr-xr-x=C2=A0 =C2=A0 2 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 40 Jun 10 12:04 .X11-unix

If I change the rights to
drwxr-xrwx=C2=A0 =C2=A0 2 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 40 Jun 10 12:04 .X11-unix

then it worked like expected.

What is the right configuration for .X11-unix?

--EINPztrc44L8loEEjGbb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

If I start weston as root user, weston starts like expected.<br /><br />Whe=
n I start weston over the service /etc/init.d/weston start<br /><br />I see=
 following error message in westen.log, when the system come up.<br /><br /=
>failed to bind to /tmp/.X11-unix/X0: Permission denied<br />
<div><br />The folder has following rights:<br />drwxr-xr-x&nbsp; &nbsp; 2 =
root&nbsp; &nbsp; &nbsp;root&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 40 Ju=
n 10 12:04 .X11-unix<br /><br />If I change the rights to&nbsp;<br />drwxr-=
xrwx&nbsp; &nbsp; 2 root&nbsp; &nbsp; &nbsp;root&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 40 Jun 10 12:04 .X11-unix<br /><br />then it worked like exp=
ected.<br /><br />What is the right configuration for .X11-unix?</div>

--EINPztrc44L8loEEjGbb--

