Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 8400 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 May 2015 20:05:33 UTC
Received: from 6.mo68.mail-out.ovh.net (6.mo68.mail-out.ovh.net
	[46.105.63.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA5973BB8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 20:05:33 +0000 (UTC)
Received: from mail626.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo68.mail-out.ovh.net (Postfix) with SMTP id 8E4D0FF9F99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:37:25 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 May 2015 19:37:25 +0200
Received: from cpc19-shep11-2-0-cust55.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@81.111.243.56)
	by ns0.ovh.net with SMTP; 5 May 2015 19:37:23 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 78D6D40533; Tue,  5 May 2015 18:39:05 +0100 (BST)
Date: Tue, 5 May 2015 18:39:05 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150505173905.GA9830@bang.betafive.co.uk>
References: <1430847181-11913-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1430847181-11913-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 18434077701239585730
X-Ovh-Remote: 81.111.243.56 (cpc19-shep11-2-0-cust55.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeektddrkeehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeektddrkeehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: Re: [dylan][PATCH] kernel.bbclass: Complete fix for modules symlink
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
X-List-Received-Date: Tue, 05 May 2015 20:05:36 -0000
X-Groupsio-MsgNum: 65163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 06:33:01PM +0100, Paul Barker wrote:
> From: Paul Barker <paul.barker@commagility.com>
>=20
> The fix backported in commit aa9fc551 of oe-core does not completely fix =
the
> issue (Yocto #4595) as intended. The modules symlink is still created in =
the
> working directory instead of in the deploy directory. To fix this, we jus=
t need
> to use an absolute path to ${DEPLOYDIR} when creating the symlink.
>=20
> Signed-off-by: Paul Barker <paul.barker@commagility.com>

This is a follow-up to my backport request in January, sorry it's took ages=
 to
get this one out. I've had to forward the email from my personal account as=
 the
email system at work would munch the patch.

This has been tested on our autobuilder and looks to be working as expected.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVSQA5AAoJEBwoJlo7UPQD28gIAIoIjNfcevjZXDDjnBgln03d
bB0ikQO5iH2qocABiIATt3DXznw9aocpPkow2LYnZeg7NUNV0PoCFlZ+Hq4YR/fr
Ypj4Bq1fJcLHqzsz5iwIO86BhZmv+30hGoOGuRlkeWe1Xq33XbcHWIZCfncVn5YQ
qrzRzCMeJ6xx1xfaTsgZY1FMYEvgLHFWGCEHiw3RyVJjg1HEur7XX84PdGtd2vIA
8/Ifrmm0S8X3BMv1DstX7hqWo+npabuWfufuCV0zusXRl+7ELvdxEGCsI0TfDhCe
Z7Kh6TalSeBVshsMibkVkNK49rVmojNZ+C28IXz6R6x/DazV5eYVmp4Fg6/kIr0=
=0fVo
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
