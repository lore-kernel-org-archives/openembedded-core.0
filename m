Return-Path: <dev-faha@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBCFC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 12:02:48 +0000 (UTC)
Subject: Re: Re: CVE-2022-24765 Git Errors with Bitbake
To: openembedded-core@lists.openembedded.org
From: dev-faha@t-online.de
X-Originating-Location: =?utf-8?b?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcs?=
 =?utf-8?b?IERFICg1LjE0Ni4xOTMuNTQp?=
X-Originating-Platform: Android Phone Firefox 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 May 2022 05:02:45 -0700
References: 
 <CANNYZj_68ACtcZxAqognRdHE_H8C8dAa2eMHmfHy6PUBDjq8Wg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_68ACtcZxAqognRdHE_H8C8dAa2eMHmfHy6PUBDjq8Wg@mail.gmail.com>
Message-ID: <29673.1651492965545397789@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="U0tyIJiQKzk3v91CFFje"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 12:02:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165164

--U0tyIJiQKzk3v91CFFje
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Ok thanks. I found the commit id:
https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d874e=
aa4a92fff0e5

Unfortunately,=C2=A0it will probably take some time until the solution is i=
ncluded on all our build machines.

Until then, we fixed our setup by using PSEUDO_UNLOAD=3D1 before any git co=
mmand.

--U0tyIJiQKzk3v91CFFje
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Ok thanks. I found the commit id:<br />https://git.yoctoproject.org/poky/co=
mmit/?id=3D21559199516a31c7635c5f2d874eaa4a92fff0e5<br /><br />Unfortunatel=
y,&nbsp;it will probably take some time until the solution is included on a=
ll our build machines. <br /><br />Until then, we fixed our setup by using =
PSEUDO_UNLOAD=3D1 before any git command.

--U0tyIJiQKzk3v91CFFje--

