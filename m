Return-Path: <tobias.jakobi@compleo-cs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228AAC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:20:47 +0000 (UTC)
Subject: Re: [Kirkstone] joe editor broken with current ncurses
To: openembedded-core@lists.openembedded.org
From: tobias.jakobi@compleo-cs.com
X-Originating-Location: Dortmund, North Rhine-Westphalia, DE (84.60.164.225)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 02:20:44 -0800
References: <CANNYZj9g0uu40tyH9+QY-W7s7ND+6OoUOwhDHVxsfF3=1vhikQ@mail.gmail.com>
In-Reply-To: <CANNYZj9g0uu40tyH9+QY-W7s7ND+6OoUOwhDHVxsfF3=1vhikQ@mail.gmail.com>
Message-ID: <31510.1700648444824257996@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Qok8WE6UjGgVkpzrSUfj"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191053

--Qok8WE6UjGgVkpzrSUfj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I verified this by:
- copying the recipe from master verbatim into our layer
- building our image
- putting image on hardware
- firing up joe

Joe then shows the same broken behaviour that it does with the ncurses 6.3 =
snapshot in kirkstone.

Or do you want me to replace our kirkstone oe-core layer with master oe-cor=
e? I don't think this is going to work anyway, since some of our support la=
yers (we are using a Toradex SoM powered by a NXP i.MX7) are not compatible=
 with master.

--Qok8WE6UjGgVkpzrSUfj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I verified this by:<br />- copying the recipe from master verbatim into our=
 layer<br />- building our image<br />- putting image on hardware<br />- fi=
ring up joe<br /><br />Joe then shows the same broken behaviour that it doe=
s with the ncurses 6.3 snapshot in kirkstone.<br /><br />Or do you want me =
to replace our kirkstone oe-core layer with master oe-core? I don't think t=
his is going to work anyway, since some of our support layers (we are using=
 a Toradex SoM powered by a NXP i.MX7) are not compatible with master.

--Qok8WE6UjGgVkpzrSUfj--

