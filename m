Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYxkN-00030o-KD
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:32:07 +0100
Received: by wgbds11 with SMTP id ds11so4640427wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 02:25:17 -0800 (PST)
Received: by 10.216.132.142 with SMTP id o14mr60855wei.35.1323426316672;
	Fri, 09 Dec 2011 02:25:16 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fg15sm12119680wbb.7.2011.12.09.02.25.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 02:25:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 9 Dec 2011 11:25:11 +0100
In-Reply-To: <1323425298.26081.409.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
	<1323363345.5309.42.camel@ted>
	<1323364334.26081.383.camel@phil-desktop>
	<1323381564.5309.65.camel@ted>
	<CB3A9DC8-124F-4314-A7B5-17C34B59E9D0@dominion.thruhere.net>
	<1323425298.26081.409.camel@phil-desktop>
Message-Id: <F51D9870-839E-4A3F-8B95-5B22B288BF46@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Fri, 09 Dec 2011 10:32:07 -0000
X-Groupsio-MsgNum: 13926
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8AFBDF97-53C6-4763-8A83-B31C246DDAD6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8AFBDF97-53C6-4763-8A83-B31C246DDAD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 dec. 2011, om 11:08 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-12-09 at 07:51 +0100, Koen Kooi wrote:
>> So to be safe and give other directfb implementations a change, can
>> this PACKAGECONFIG option be named 'gtk-directfb' in DISTRO_FEATURES?
>=20
> I don't think I quite understand what you're saying there.  Can you
> expand on why this would be a good thing?

gtk 2.x is one of the few places where directfb/x11/whatever conflict, =
so if I want directfb support for sane things (gtk 3.x, qt, etc) the =
current patch will make me jump through a ton of hoops. Unless OE-core =
really wants a distro to select either directfb or x11, but not both. In =
that case it should BBMASK out directfb if 'x11' is in distro features =
and vice versa.=

--Apple-Mail=_8AFBDF97-53C6-4763-8A83-B31C246DDAD6
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7h4goACgkQMkyGM64RGpG/1ACfYoy1niatPUm+z/abMaVNeY7x
I18AnjoPYWSkt9kc2rM32iYPwjkozvZ5
=mlLT
-----END PGP SIGNATURE-----

--Apple-Mail=_8AFBDF97-53C6-4763-8A83-B31C246DDAD6--
