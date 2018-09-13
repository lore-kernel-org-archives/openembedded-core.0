Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F42476EBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 06:58:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8D6vxcQ021239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 23:58:09 -0700
Received: from pek-khao-d2 (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 12 Sep 2018 23:57:48 -0700
Date: Thu, 13 Sep 2018 14:57:00 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <20180913065700.GI2377@pek-khao-d2>
References: <20180912004446.11661-1-kexin.hao@windriver.com>
	<22102831-8c57-6584-88fa-937818a79349@intel.com>
MIME-Version: 1.0
In-Reply-To: <22102831-8c57-6584-88fa-937818a79349@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [147.11.105.121]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] wic: Introduce the --use-label partition parameter
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
X-List-Received-Date: Thu, 13 Sep 2018 06:58:33 -0000
X-Groupsio-MsgNum: 116224
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Content-Disposition: inline

--FUFe+yI/t+r3nyH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2018 at 10:38:09AM +0800, Anuj Mittal wrote:
> On 09/12/2018 08:44 AM, Kevin Hao wrote:
> > +         --use-label: This option is specific to wic. It makes wic to =
use the
> > +                      label in /etc/fstab to specify a partition. If t=
he
> > +                      --use-label and --use-uuid are used at the same =
time,
> > +                      we prefer the uuid because it is less likely to =
cause
> > +                      name confliction. We don't support using this pa=
rameter
> > +                      on the root partition since it requires an initr=
amfs to
> > +                      parse this value and we do not currently support=
 that.
> > +
> >           --active: Marks the partition as active.
>=20
> Would this also need a corresponding patch for yocto-docs as well?

Sure. Thanks for reminding me. I will compose a patch to update the docs.

Thanks,
Kevin

>=20
> Thanks,
>=20
> Anuj

--FUFe+yI/t+r3nyH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAluaCjwACgkQk1jtMN6u
sXHjIQf/QS0N1VJsC292L5Ko7QH52IiPo4EKMLRAgXve07e0STivL0VnFcrbQ03z
Epc2dqU3aqPb4xh/iBOvJrcTUXXfMJTgBouJkwHGTvYXyqz7r7VI5QoCHjgJkKnD
L3CrAm+p0Q2t99yeCh78li0otu7JyUXiyPLN248639OC6/noKtZOqQgWAG4ZXFbc
3Hg0jaevTpCKm0Y5zfoieEDMLOEYxkebiI1IYhAEQF9Heqdw5Xc9RGLYKUC8bxHQ
nVCSWZeXlg1uVEowfoCpI49nV72dWHPW0PAMPhN1fWTXBWqCQAfmHvVyJLyNtfqr
TwzDpYsGIi08Y59dGddjug2j8X0bpA==
=Em8a
-----END PGP SIGNATURE-----

--FUFe+yI/t+r3nyH4--
