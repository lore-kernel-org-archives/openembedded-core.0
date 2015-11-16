Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Nov 2015 07:49:31 UTC
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF62773C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:49:31 +0000 (UTC)
Received: from mail629.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id B3910FF8876
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:29:44 +0100 (CET)
Received: from localhost (HELO queueout) (127.0.0.1)
	by localhost with SMTP; 16 Nov 2015 09:29:43 +0200
Received: from cpc2-shep11-2-0-cust17.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@86.26.192.18)
	by ns0.ovh.net with AES256-GCM-SHA384 encrypted SMTP;
	16 Nov 2015 09:29:43 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 7049040A4F; Mon, 16 Nov 2015 07:31:38 +0000 (GMT)
Date: Mon, 16 Nov 2015 07:31:38 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: leonardo.sandoval.gonzalez@linux.intel.com
Message-ID: <20151116073138.GA5453@bang.betafive.co.uk>
References: <1446852308-19752-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1446852308-19752-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 9648680728171821915
X-Ovh-Remote: 86.26.192.18 (cpc2-shep11-2-0-cust17.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekhedrheeiucetufdoteggodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekhedrheeiucetufdoteggodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] terminal: Open a new window instead of split on older tmux versions (<1.9)
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
X-List-Received-Date: Mon, 16 Nov 2015 07:49:36 -0000
X-Groupsio-MsgNum: 73465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2015 at 05:25:08PM -0600, leonardo.sandoval.gonzalez@linux.=
intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>=20
> If an old version is detected (<1.9), create a new window instead of spli=
t:
> the reason is that there is no easy way to get the active pane height if =
no
> nested formats are supported.
>=20
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.=
com>

I gave the new release a spin over the weekend on Centos 7 which uses tmux =
1.8.
I couldn't run 'bitbake linux-yocto -c menuconfig' inside my tmux session d=
ue to
this issue. Applying this patch fixed it though so I'd definitely recommend=
 this
for jethro as well as master.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJWSYZaAAoJEBwoJlo7UPQDKIEH/0IKA5+vnBSTopxAwZ9lq+gV
zOCyNj91CGAVjnU428KyDpL2Tw83dou46oizrELOrPca5jCAACiDMH4ttLgeabtX
IJAoYlnuTJwfZH2FlaUdiVdUhflW3CSFljT9fMdRNMaoQx8K5FGTzQ5VCTehXioJ
1eF+9tKIk3ATmpI+IQCM+P/43SQIfMn2CayPwI5+v6NZBSLqejgtqUwSl5k+wT9L
rwE/7ab/Vd1jtXa4zHqSyQs+Bm9+B6Uu15net63UeCNk1jEcYBSF3PffDB4EVeZY
rB9PXNAFzlxvms+aj7TAD624P/9HHsskG87R9eCuMhrfa3JIrXuW+VJ1p6eJMws=
=q+5B
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
