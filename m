Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9185.1794472505593248258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 00:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=qaMqfWYt;
 spf=pass (domain: geanix.com, ip: 79.135.106.105, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794472502; x=1794731702;
	bh=caX72XoVV/dDVoCuL9Y9oZujhrAzrhXOeNjCeIB7sac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qaMqfWYtrjNt7cJ6bednVccFJXTEXMui8GpResJpacL5gQjsZK6yX1KitbO1Yrg24
	 OGlWpF5RS0IStatr3nIS9ufP776UMp3r+Pk/NTGL3zN0dyAwi+82Aw4MaGMNtMHcsf
	 LsN1r8SxNPbWfGI7DvEqCqKAxXcIro+Almdn4dZcDecq5yU8PGZW7s0TbxV/qFY+FH
	 DFIagS6G9rfSmHBiIjC1JTes4tM6PYvVEJTO/JJlFEUkuUiDIiSP+5YvGsx4SFzM0p
	 TnzBkpCF33SVLt59TDd33OyElFSHGx/FtYSeMeqss9Q6NNy/BZAQ9qh2EytuaiEQxp
	 F6POS3nwEbrzw==
Date: Thu, 12 Nov 2026 08:34:56 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
Message-ID: <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com>
In-Reply-To: <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com>
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com> <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 737ad731c64ec0e53f3d8e25a25d54397265c057
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 08:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250078



> On 12 Nov 2026, at 09.20, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Thu, 12 Nov 2026 at 08:17, Sean Nyekjaer via openembedded-core <sean=
=3Dgeanix.com@lists.openembedded.org> wrote:
> This works but is there a smarter solution?
>=20
> I'm slightly confused, where is INCOMPATIBLE_LICENSE specified exactly? I=
mage recipe or globally?

Globally in my distro conf.

I have tried:
INCOMPATIBLE_LICENSE:pn-os-rootfs =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=
=E2=80=9D

INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=E2=80=9D

INCOMPATIBLE_LICENSE:class-target =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*=
=E2=80=9D

/Sean

