Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW4pv-0002kp-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 12:29:55 +0100
Received: by eaad13 with SMTP id d13so2039482eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 03:23:14 -0800 (PST)
Received: by 10.14.9.130 with SMTP id 2mr850515eet.201.1322738594650;
	Thu, 01 Dec 2011 03:23:14 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 58sm11792652eet.11.2011.12.01.03.23.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 03:23:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 1 Dec 2011 12:23:08 +0100
Message-Id: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 11:29:55 -0000
X-Groupsio-MsgNum: 13419
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DD6682E9-BB66-4315-AFFC-72FF408384A0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DD6682E9-BB66-4315-AFFC-72FF408384A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

During the past month there have been a number of updates to OE-core =
recipes that triggered parsing errors due to bbappend in other layers. A =
small seleciton:

* netbase
* libdrm
* xserver-xorg
* clutter

My view is that layer maintainers need to keep an eye on potential =
breakage and have updates ready when patches land into OE-core. Looking =
back I can see that while the situation is improving a bit, it's still =
not working. The problem with slow updates to layers is that (with my =
angstrom hat on) users (and with my TI hat on) customers and coworkers =
can't do builds without rm'ing the bbappends or disabling the layer.

This is bad for a number of reasons:

1) It creates unmanaged local diffs
2) it can cause PR to fluctuate back and forth if you rm is a bit =
overzealous or if you disable the complete layer.

My proposal is that OE-core recipe upgrades with known bbappends look =
like this:

1) add new version with a warning about bbappends
2) wait a N days (2 < N < 7)
3) delete old version

To avoid stressing out RP and Sau! I would strongly urge layer =
maintainers to respond to recipe update patches with "I have a bbappend, =
but my review process needs time, please use the above proposal" if you =
need time to test and update  your bbappends.

We're all human in the end and timezone differences aren't always =
helping with these kinds of problems, so let's work together to minimize =
parsing breakage.

Related to that: Please include information on how to send patches =
upstream in your layer/repo README. The meta-intel/emenlow lacks that =
and the top level README doesn't mention that there are sublevel =
READMEs.

regards,

Koen=

--Apple-Mail=_DD6682E9-BB66-4315-AFFC-72FF408384A0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XY58ACgkQMkyGM64RGpHj4ACghE9jsX6XWGY3jgdZx6FI/LW1
HG0An2gZGJ8ubNBBQQHafuZupM0da4XT
=SpmZ
-----END PGP SIGNATURE-----

--Apple-Mail=_DD6682E9-BB66-4315-AFFC-72FF408384A0--
