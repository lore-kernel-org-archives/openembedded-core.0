Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pv83c-0007Ow-UK
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 13:55:05 +0100
Received: by wyb38 with SMTP id 38so983059wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 04:53:35 -0800 (PST)
Received: by 10.216.245.11 with SMTP id n11mr425616wer.108.1299156403059;
	Thu, 03 Mar 2011 04:46:43 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id 16sm558265wet.8.2011.03.03.04.46.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 04:46:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D6E7EB1.5080602@windriver.com>
Date: Thu, 3 Mar 2011 13:46:41 +0100
Message-Id: <41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 12:55:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt 2011, om 18:30 heeft Mark Hatle het volgende geschreven:

> I finally got a chance to look at the oe-core and where it currently =
is..  Some
> suggestions below:
>=20
> LICENSE file, this may need to be cleaned up to only cover the =
components
> actually in the oe-core.
>=20
> README likely needs some revision
>=20
> README.hardware needs a lot of revision.  Anything outside of support =
for QEMU
> should be removed.

Agreed on the above

> The meta-demoapps

That has a lot of GNOME bits I need, so I would suggest meta-oe, a =
seperate gnome layer or the easiest way, keep it as a seperate layer, =
but outside of yocto. I think a GNOME (2) layer would make a lot of =
sense, but I don't know how many people will be looking after it.
With my beagleboard.org hat on, a full GNOME desktop is one of our =
deliverables to go on the SD card included with the board at the =
factory, so sorting out the duplication between the layers for GNOME =
components would be nice.

> and meta-rt components, will those be staying or going?

I don't have a real opinion on that.

> The meta/recipes.txt needs to be verified as still what we want -- I =
assume it
> is at this point..

It looks OK to me

> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?

See above for GNOME layer, QT is likely a similar case. Layers would =
also benefit from having their own git repository, but I can see the =
combinatorial explosion that could bring.

> Do the items in the "scripts" need to be renamed or is Poky being kept =
in the
> naming?  Same with the poky-init-build-env?

I would suggest renaming by doing s/poky/oecore/g for the build scripts.

> Then I also assume the items in the documentation directory need to be =
cleaned
> up as well...

It would be nice to use 'oe-core' or 'oecore' for everything related to =
building, instead of 'poky', since poky is a distro, not a buildsystem =
(anymore).

regards,

Koen=


