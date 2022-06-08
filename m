Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD048C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:16:07 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web11.4278.1654679763722814959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 02:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from [10.0.0.147] ([31.10.206.125]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N1PGx-1nbWOX1jY3-012lHx;
 Wed, 08 Jun 2022 11:16:02 +0200
Message-ID: <7d53952453e887a95ad87144e0b8fb2567c063b8.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v2] gstreamer1.0-plugins-bad: add libavtp
 packageconfig
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 08 Jun 2022 11:15:59 +0200
In-Reply-To: <20220608095731.2b046446@booty>
References: <20220531213624.7414-1-marcel@ziswiler.com>
	 <523055072271ae397582baf881e279ee2268e5d3.camel@ziswiler.com>
	 <20220608095731.2b046446@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:jGMzLldDOBZl7RMOhH9+q7tkxzkngD8P2RX2cEmvlYFjDuYCWY3
 z2TEg3QyefhzLe13Pmjd/CC9GkEUj305Vu1eFB4zp8FC5BPc/j7MAxtD5E9VLhILVsmnkA9
 fqVEPPjlaoH/5S67hS/L71TbRSuWDdDbcaaCrQvvuxAxm2bBvSjgtkr8tmx7XWp71XodUCX
 acKN7r6h4PbCWUH2PFzyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7cEZQQQC/lI=:j9VFD+PO5QzR4uKVIS1kNv
 58s05OZZ0f2SHPwhg+/l94lF/HIBz6nly0VWrJ5llTgOSVIV7rxzbyfOAQZsy5O0C+xW1e1Cs
 oAd2HtkrBGdTM2bj1m1BX6Z9WtuoGZzv/bEgluxWgL/IUsq1/sJNuUhGCVHixt4gwUQV+MMAG
 MpE96WRyBbpXkJV03MprGExrmQYiu0Js36UaLgEpSWjwF2NLBxKIs3q9Um3H9foJN0RE2dIW/
 kr9EDwXt76n6jeRFHHfZpU5yFQvlFRHOnktq8uWct33IeFoQgTy0Q8Kk2ayGUx1R+wUPZFEK7
 m/HHRYoypE5bwuV5MOo1lec8apQF/9CtARO3nltViQ9RT50d53wN3b66exVIAT6qqmsXgMjSt
 6fKVBvEWJ3ZeYQ4EaDWA6+FFr6BimbEjae8/iQt0Lny0ejm25e/GLkdp8gvG6wNTyNXfnyoeU
 /5PAmdsJeY397tQHaeScmGO5IKy2AP5TCjD1Eeyx1pbpZjXAbMDMpliBxWY8QU9uqJ+U+rTJu
 XFPKcsnCqFvLo6SK4NGilC0ZJIUZovM0vBEQhsvEdS5TyCLv5LRTwvJ15UXu9fs2jkrjOYhAg
 +4efJdm+rATer8vyJESAy3xzwJgDa/QKEZqs/qfUUFm7PJ/MNbqKdxby+chanVJE7GxP5ZfNJ
 4fy6HM3RznNdi1qUvRE24bS3WuVg4KCcBDK669pFp/LuMYqNk8SePEOX7gbWvagg1ZQu5mFem
 Fz58FYCZkP16mY5zTr1LwAy96ZYYqu5OtsJVQA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 09:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166698

On Wed, 2022-06-08 at 09:57 +0200, Luca Ceresoli wrote:
> Hi Marcel,
>=20
> On Wed, 08 Jun 2022 09:07:17 +0200
> "Marcel Ziswiler" <marcel@ziswiler.com> wrote:
>=20
> > On Tue, 2022-05-31 at 23:36 +0200, Marcel Ziswiler wrote:
> > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >=20
> > > Add avtp resp. libavtp PACKAGECONFIG. This allows building them
> > > GStreamer Audio Video Transport Protocol (AVTP) Plugins which rely on
> > > Avnu's libavtp.=C2=A0=20
> >=20
> > Gentle ping on this one now with the other two related patches having b=
een pulled to master [1] resp. meta-
> > openembedded/master-next [2].
>=20
> Good news, this patch is on master since yesterday! :)

Indeed, sorry, missed that one resp. I checked earlier yesterday :)

Thanks!

