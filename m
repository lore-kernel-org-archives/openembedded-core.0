Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 4202 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 May 2015 20:44:18 UTC
Received: from 3.mo69.mail-out.ovh.net (3.mo69.mail-out.ovh.net
	[188.165.52.203])
	by mail.openembedded.org (Postfix) with ESMTP id 898496B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 20:44:18 +0000 (UTC)
Received: from mail603.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo69.mail-out.ovh.net (Postfix) with SMTP id 20E95100C4FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 19:07:43 +0200 (CEST)
Received: from localhost (HELO queueout) (127.0.0.1)
	by localhost with SMTP; 22 May 2015 19:07:43 +0200
Received: from cpc19-shep11-2-0-cust55.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@81.111.243.56)
	by ns0.ovh.net with AES256-GCM-SHA384 encrypted SMTP;
	22 May 2015 19:07:42 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 2447D40787; Fri, 22 May 2015 18:07:13 +0100 (BST)
Date: Fri, 22 May 2015 18:07:13 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150522170713.GA21241@bang.betafive.co.uk>
References: <555ED05A.6050102@topic.nl>
	<1755674.4xNgi4jax3@peggleto-mobl.ger.corp.intel.com>
	<555F0396.9050301@topic.nl>
	<1689615.oKpcRujCob@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1689615.oKpcRujCob@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 7087821389974977470
X-Ovh-Remote: 81.111.243.56 (cpc19-shep11-2-0-cust55.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekuddrvddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekuddrvddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: "packagegroup-core-qt4e" broken?
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
X-List-Received-Date: Fri, 22 May 2015 20:44:19 -0000
X-Groupsio-MsgNum: 65975
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 01:54:09PM +0100, Paul Eggleton wrote:
> On Friday 22 May 2015 12:23:18 Mike Looijmans wrote:
> > On 22-05-15 10:38, Paul Eggleton wrote:
> > > Hi Mike,
> > >=20
> > > On Friday 22 May 2015 08:44:42 Mike Looijmans wrote:
> > >> When building (just for having something on my display)
> > >> "qt4e-demo-image",
> > >>=20
> > >> it bailed out with the following error:
> > >>    * satisfy_dependencies_for: Cannot satisfy the following dependen=
cies
> > >>    for
> > >>=20
> > >> packagegroup-core-qt4e:
> > >>    * 	qt4-embedded-plugin-phonon-backend-gstreamer *
> > >>    * opkg_install_cmd: Cannot install package packagegroup-core-qt4e.
> > >>=20
> > >> I guess this is related to all the gstreamer changes lately?
> > >=20
> > > I've just sent a fix for this, thanks for the report.
> > >=20
> > > Cheers,
> > > Paul
> >=20
> > Strange thing was, after just manually removing that package line from =
the
> > packagegroup-core-qt4e recipe, do_rootfs kept failing with a checksum
> > mismatch on that package. I tried cleansstate and manually removing all
> > traces of the recipe, but that didn't help, it would rebuild the ipk and
> > then still fail on the checksum. Only removing 'tmp' finally got rid of
> > this failure.
>=20
> To be honest I don't understand this issue but it seems to be going wrong=
 for=20
> some people lately. Paul is this something you know about?
>=20

I'm not really sure - I don't think anything has changed on the checksum
verification side on opkg or on the checksum generation side in opkg-utils
recently.

If you run 'bitbake package-index' after observing this error does it resol=
ve
it? If so it would indicate that the 'Packages' file isn't being properly
updated when a new ipk file is created.

Also, I've not been following the discussion very closely lately. Has anyone
manually checked whether the Packages file contains an MD5Sum line for the
package which is causing the problem. If so does it match the actual md5sum=
 of
the corresponding ipk file?

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVX2JBAAoJEBwoJlo7UPQD8RAIAJMblQyZCmDHf64Rc/JIgEFm
aVyuyr/4hx0c5zKJgP7+49N4RI9rA0oy3Bm1S6fGRkLCPjv1ucHmSkl/jaDv4LPI
+a7BQcSPruchraAf0EN26Tdbqe4zjfPz9ymt556x2tRJNWc/nLrd5vxAGfjcfkec
K0k5f9Ry4bt6fr2vhLMFtVjhRzva3uJ9Jd8zSOQ/7fup3cw+/rOhSq5zjxLnPBoW
jpuUj8Zy6B8Ij80vMRX7tr2yRZWEIOBEHf0+8215CiS87ew6dO0hZdRZxlN8a0ZH
l8unAtdbdMNOVK4bk6fqElf9aAiOzA2jmx5AkeQC5ReRbJUevmY1j6k3lizjgXU=
=cjU8
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
