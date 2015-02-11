Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 17321 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Feb 2015 13:03:01 UTC
Received: from 13.mo6.mail-out.ovh.net (13.mo6.mail-out.ovh.net
	[188.165.56.124])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4E6609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 13:03:01 +0000 (UTC)
Received: from mail601.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo6.mail-out.ovh.net (Postfix) with SMTP id 14ADCFFA390
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 09:14:18 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Feb 2015 10:14:18 +0200
Received: from cpc19-shep11-2-0-cust55.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@81.111.243.56)
	by ns0.ovh.net with SMTP; 11 Feb 2015 10:14:16 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 3B016412AC; Wed, 11 Feb 2015 08:14:46 +0000 (GMT)
Date: Wed, 11 Feb 2015 08:14:46 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Richard Tollerton <rich.tollerton@ni.com>
Message-ID: <20150211081446.GA28568@bang.betafive.co.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
	<1421446529-24888-8-git-send-email-paul@paulbarker.me.uk>
	<87bnl1tgzt.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <87bnl1tgzt.fsf@weregild.amer.corp.natinst.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 1105633710475033538
X-Ovh-Remote: 81.111.243.56 (cpc19-shep11-2-0-cust55.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -200
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrjeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdengfhvvghrhghhihhtvgdqqdetucdlqddutddtmd
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrjeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdengfhvvghrhghhihhtvgdqqdetucdlqddutddtmd
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 7/7] opkg-keyrings: New recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 13:03:06 -0000
X-Groupsio-MsgNum: 62289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2015 at 06:43:34PM -0600, Richard Tollerton wrote:
> Paul Barker <paul@paulbarker.me.uk> writes:
>=20
> > This recipe wraps package and package feed verification keys into a pac=
kage,
> > making the management and deployment of verification keys much easier. =
Comments
> > on how to select keys for inclusion in this package are provided in the=
 recipe
> > file.
>=20
> Would you be receptive to this package being extended to support OpenSSL
> keys?

I wouldn't advise it.

There is no 'OpenSSL exception' in the opkg license and so a few people have
been worried that shipping binaries of opkg linked against OpenSSL is a bre=
ach
of the respective licenses. IANAL, but people have been concerned.

OpenSSL support is probably less tested than gpg support as well.

However, if it's something you're already using, have tested and are comfor=
table
with the licensing implications then go for it.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU2w92AAoJEBwoJlo7UPQDhgQH/i4uBJ7dqbek9CRFmC5ISN5P
JqhVf/fdLzG5IVijwvXBruS7vHiLGvYTppor08ys5PnXQdIoZ6QGRyhy5xid4mA8
js5Hls8NaiiX9Q2fkflPNTGjMeXuREm0Stf8iwttUmxlHmnD2wAZvaF93NRIUjQ8
0IMBsdec8ja7zYpx/sYok/Hj2djoj6ThYdepDuO9KDWBaH6hn1bWOdUVTOksgqIX
Z7SP4F/DkMFHaq8Tv+M1hpQZMZ0m9iveR7Ow3tPfE13SeXUw89ZkVKii7iGSfFS5
gTZQguRlYxl8vCy5EEzWX7LS13uRQ3CGe+nTw46zHlGqjfzQfj4LQ/JYcNcse/Y=
=EcV6
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
