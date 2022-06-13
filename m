Return-Path: <Sebastian.Suesens@baslerweb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E71C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 07:18:35 +0000 (UTC)
Subject: Re: [honister] test and patches for xwayland support
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?U8O8c2VucywgU2ViYXN0aWFu?= <Sebastian.Suesens@baslerweb.com>
X-Originating-Location: Ahrensbok, Schleswig-Holstein, DE (84.140.242.110)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jun 2022 00:18:34 -0700
References: 
 <CANNYZj_G0vR8nME0euHGLD0mODGA6nUiDEHQ3gE6KZng9_DC+w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_G0vR8nME0euHGLD0mODGA6nUiDEHQ3gE6KZng9_DC+w@mail.gmail.com>
Message-ID: <5284.1655104714025276648@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0eSd9Qa3JgUA2jl04hyc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 07:18:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166829

--0eSd9Qa3JgUA2jl04hyc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 10:19 AM, Alexander Kanavin wrote:

>=20
> You need to check which user and group weston runs as, and any needed
> directories should be writable for those.

Weston run as weston user and weston is in the video and input group.

How shall I change the permission and owner for the patch?

Proposal:
1.=C2=A0drwxr-xr-x=C2=A0 =C2=A0 weston=C2=A0 =C2=A0 =C2=A0weston=C2=A0 =C2=
=A0.X11-unix

or

2.drwxrwxr-x=C2=A0 =C2=A0 root=C2=A0 =C2=A0 =C2=A0video=C2=A0 =C2=A0 =C2=A0=
.X11-unix

--0eSd9Qa3JgUA2jl04hyc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 10:19 AM, Alexander Kanavin wrote:<br />
<blockquote>You need to check which user and group weston runs as, and any =
needed<br />directories should be writable for those.</blockquote>
<br />Weston run as weston user and weston is in the video and input group.=
<br /><br />How shall I change the permission and owner for the patch?<br /=
><br />Proposal:<br />1.&nbsp;drwxr-xr-x&nbsp; &nbsp; weston&nbsp; &nbsp; &=
nbsp;weston&nbsp; &nbsp;.X11-unix<br /><br />or<br /><br />2.drwxrwxr-x&nbs=
p; &nbsp; root&nbsp; &nbsp; &nbsp;video&nbsp; &nbsp; &nbsp;.X11-unix

--0eSd9Qa3JgUA2jl04hyc--

