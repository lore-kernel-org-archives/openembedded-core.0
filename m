Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcaHj-0005Re-Tf
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:45:15 +0200
Received: by wyg30 with SMTP id 30so2353203wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 02:41:31 -0700 (PDT)
Received: by 10.227.29.150 with SMTP id q22mr2645191wbc.78.1309513291090;
	Fri, 01 Jul 2011 02:41:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm2217960wbb.50.2011.07.01.02.41.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 02:41:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
Date: Fri, 1 Jul 2011 11:41:28 +0200
Message-Id: <57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
	<1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
	<BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Fri, 01 Jul 2011 09:45:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 11:26 heeft Frans Meulenbroeks het volgende =
geschreven:

>=20
>=20
> 2011/7/1 Koen Kooi <koen@dominion.thruhere.net>
>=20
> Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende =
geschreven:
>=20
> >
> > Good idea.
> > Personally I'd like to also bring footprint into the equation. If a =
feature drags in lots of additional packages, it is interesting to make =
it configurable.
> > My favourite example: bluez dragging in all kind of rendering stuff =
(through DEPENDS) even though the hardware functionality might not be =
there (e.g. you have BT but not audio).
>=20
> Which is a great example, since that doesn't impact footprint at all, =
it's an alsa *plugin* that will get produced.
>=20
>=20
> bluez.inc:DEPENDS =3D "gstreamer gst-plugins-base dbus glib-2.0"
>=20
> I don't think gstreamer is really needed or desired if you e.g. just =
want to do some tethering over bluetooth, or in my case, connect to a BT =
HID, and they do contribute to both the build time and the footprint.

Again, a plugin, so no footprint issues.=


