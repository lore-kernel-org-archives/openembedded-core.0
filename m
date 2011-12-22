Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rddk0-0006Pk-3p
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:11:04 +0100
Received: by wgbds11 with SMTP id ds11so13202569wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 00:03:52 -0800 (PST)
Received: by 10.227.206.129 with SMTP id fu1mr9459100wbb.22.1324541031261;
	Thu, 22 Dec 2011 00:03:51 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k5sm20225361wiz.9.2011.12.22.00.03.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 00:03:49 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 22 Dec 2011 09:03:46 +0100
In-Reply-To: <20111221074011.GB12791@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
	<20111220075952.GB3946@jama.jama.net>
	<20111221074011.GB12791@jama.jama.net>
Message-Id: <E6A4ABFF-7BBC-4D8F-97E7-42FEAD69E3B5@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Thu, 22 Dec 2011 08:11:04 -0000
X-Groupsio-MsgNum: 14650
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7BE29E04-3D66-4E13-9596-5C53BCBAA00B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7BE29E04-3D66-4E13-9596-5C53BCBAA00B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 21 dec. 2011, om 08:40 heeft Martin Jansa het volgende geschreven:

> On Tue, Dec 20, 2011 at 08:59:52AM +0100, Martin Jansa wrote:
>> On Thu, Dec 15, 2011 at 04:16:17PM +0100, Koen Kooi wrote:
>>> ping
>>=20
>> I've tried it with older midori-0.4.2 as well as with newer 0.4.3 =
(which
>> I'll send to meta-oe later) but both does segfault, probably not =
caused
>> by this newer webkit-gtk because even with older webkit-gtk 0.4.2 was
>> segfaulting (maybe gcc-4.6 issue if you're still using gcc-4.5).
>>=20
>> I've tried to get usable backtrace.. but webkit-gtk-dbg is huge =
(>300MB)
>> and opkg died twice already when I was waiting for midori-dbg to =
install
>> :/.
>>=20
>> BTW: it happens on armv4t as well as armv7a-vfp-neon.
>=20
> 627.8M  usr/lib/.debug/libwebkitgtk-1.0.so.0.11.2
> from libwebkitgtk-1.0-dbg (1.7.2+svnr101488-r0) wasn't=20
> really helpfull as it fails even before that on nokia900:

All this happens on both the old and the new version, right? If so, can =
this patch finally go in?=

--Apple-Mail=_7BE29E04-3D66-4E13-9596-5C53BCBAA00B
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7y5GQACgkQMkyGM64RGpH2NwCgq+C/+Lag1eU93WQ2Q7ysOmad
8ucAoILiEGs3kaXJTn6zAE3wIaK00ZM1
=ZsH+
-----END PGP SIGNATURE-----

--Apple-Mail=_7BE29E04-3D66-4E13-9596-5C53BCBAA00B--
