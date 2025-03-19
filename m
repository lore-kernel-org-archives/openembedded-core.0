Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBF5C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:21:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.12412.1742401279754971974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PWiyNFxE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BAB744536;
	Wed, 19 Mar 2025 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742401277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fn3tS4kqkfPFnnOYEVLLdOAhxtgDKG3ZQ0AsM7S9yJE=;
	b=PWiyNFxEdc7f9s10IJ5aI/FgYxvCBiiBw2hxjMHivpMCf0gLLCDBGgTksI7NXEKgOBk8Dy
	IOgkaVbgnxppFcGjOlI/oHbzf9YDtot1MwGb+9QeZs1n6Zx6Yp661kCUoJo3iw8RsObwvo
	SMQxLTTWVwr7m02ZXGwKq4jXTSvMqmMRUKddHlNJ0bKMVCgsAbxr5us2KMu3RvRAjHUBPV
	DcGyfizDVvR8ZO5vN6UGZfq5oZBklZqQYzJGpwnn2l/rGd7XsLmaeme/A1jUjt1JDodxLX
	MbMgNFs5H2vo2gEL0veX2LS93EuI7bS7YVXP8+oRWsgiXGpg5eAG4oaRT+UwpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 17:21:17 +0100
Message-Id: <D8KDPCF66QTR.16Z4JHM4GTJVY@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 08/12] python3-dbus: upgrade 1.3.2 -> 1.4.0
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
 <1742278912-2989-8-git-send-email-wangmy@fujitsu.com>
 <D8JAZBGJQKHC.ODYN6REYX2KP@bootlin.com>
In-Reply-To: <D8JAZBGJQKHC.ODYN6REYX2KP@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevffetueehffffhfevgfelueetledutedvvefhtddtleettdevgfekveeihfegieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 16:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213344

On Tue Mar 18, 2025 at 11:00 AM CET, Mathieu Dubois-Briand wrote:
> On Tue Mar 18, 2025 at 7:21 AM CET, wangmy via lists.openembedded.org wro=
te:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../python/{python3-dbus_1.3.2.bb =3D> python3-dbus_1.4.0.bb}   | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-dbus_1.3.2.bb =3D> python=
3-dbus_1.4.0.bb} (85%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-dbus_1.3.2.bb b/meta/=
recipes-devtools/python/python3-dbus_1.4.0.bb
> > similarity index 85%
> > rename from meta/recipes-devtools/python/python3-dbus_1.3.2.bb
> > rename to meta/recipes-devtools/python/python3-dbus_1.4.0.bb
> > index e0cf64c70e..057c97f656 100644
> > --- a/meta/recipes-devtools/python/python3-dbus_1.3.2.bb
> > +++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
> > @@ -5,9 +5,9 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97f58951300aa52a9f9e3a62bd5=
c846c"
> >  DEPENDS =3D "expat dbus glib-2.0 virtual/libintl"
> > =20
> > -SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus-pyt=
hon-${PV}.tar.gz"
> > +SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus-pyt=
hon-${PV}.tar.xz"
> > =20
> > -SRC_URI[sha256sum] =3D "ad67819308618b5069537be237f8e68ca1c7fcc95ee4a1=
21fe6845b1418248f8"
> > +SRC_URI[sha256sum] =3D "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b89=
04381b4077766043d5"
> > =20
> >  S =3D "${WORKDIR}/dbus-python-${PV}"
> > =20
>
> Hi,
>
> I'm dropping this patch for now, as the freedesktop gits are down and
> the file cannot be retrieved from our mirrors: I will try to remember to
> take it in a few days.

Back in the queue, it looks like we managed to fetch it this time.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


