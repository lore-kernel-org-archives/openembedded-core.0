Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rn58O-0002fd-5O
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 10:15:16 +0100
Received: by wgbdr11 with SMTP id dr11so2253457wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 01:07:35 -0800 (PST)
Received: by 10.181.13.208 with SMTP id fa16mr26513712wid.12.1326791255627;
	Tue, 17 Jan 2012 01:07:35 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm41863798wib.0.2012.01.17.01.07.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 01:07:34 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201201170143.46134.schnitzeltony@gmx.de>
Date: Tue, 17 Jan 2012 10:07:34 +0100
Message-Id: <55ACB0DC-90E8-4A61-89FC-D51A01B69FF2@dominion.thruhere.net>
References: <201201170143.46134.schnitzeltony@gmx.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: update-alternatives questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 09:15:16 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 17 jan. 2012, om 01:43 heeft Andreas M=FCller het volgende =
geschreven:

> Hi
>=20
> when starting a fresh image (angstrom/opkg) I see for xfwm4 (xfce =
window manager=20
> included in meta-oe)
>=20
> S98configure[285]: //var/lib/opkg/info/xfwm4.postinst: line 2: update-
> alternatives: command not found
>=20
> I checked:=20
>=20
> * there is no  update-alternatives in my image
> * update-alternatives is packed in update-alternatives-cworth (sub =
package of=20
> opkg) which is not part of my image
>=20
> Isn't it required to have update-alternatives on the target

Yes

> because it is used=20
> in postinst- / and postrm scripts?

Those should be executed offline during build, so it's only for packages =
you install later on. Have a look at =
https://github.com/koenkooi/meta-angstrom/blob/master/recipes-images/angst=
rom/systemd-image.bb. That recipe will not include packagemanagement and =
u-a if ONLINE_PACKAGE_MANAGEMENT is set to none.

regards,

Koen=


