Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC9CA61334
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 11:45:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01FBj6GF023084
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 15 Feb 2020 03:45:16 -0800
Received: from pek-khao-d2.corp.ad.wrs.com (147.11.105.123) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.468.0; Sat, 15 Feb 2020 03:44:55 -0800
Date: Sat, 15 Feb 2020 19:44:50 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200215114450.GE499724@pek-khao-d2.corp.ad.wrs.com>
References: <20200213023141.1657-1-kexin.hao@windriver.com>
	<5cb5c42022e1032c871c13222e1279df6d6c46f0.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5cb5c42022e1032c871c13222e1279df6d6c46f0.camel@linuxfoundation.org>
X-Originating-IP: [147.11.105.123]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Honor APPEND
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
X-List-Received-Date: Sat, 15 Feb 2020 11:45:43 -0000
X-Groupsio-MsgNum: 135030
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline

--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2020 at 08:07:34AM +0000, Richard Purdie wrote:
> On Thu, 2020-02-13 at 10:31 +0800, Kevin Hao wrote:
> > APPEND is used to add additional parameters to kernel by features,
> > such
> > as read-only-rootfs. So we should honor this variable when we compose
> > the kernel parameter in wic. I know we also can resolve this kind of
> > issue by using the .wks.in template introduced by commit 42e870c5ed4b
> > ("image_types.bbclass: support template .wks.in files for wic"), but
> > the
> > APPEND is needed by all the wks, it would seems pretty ridiculous to
> > me
> > to change all the .wks to .wks.in and then foist the APPEND into
> > them.
> > So the APPEND is definitely deserved to export to the wic directly.
> >=20
> > [Yocto #12809]
> >=20
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > ---
> >  meta/classes/image_types_wic.bbclass | 2 +-
> >  scripts/lib/wic/ksparser.py          | 5 +++++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> This seems to cause a selftest failure:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/688
>=20
> oe-selftest -r wic.Wic2.test_image_env

The APPEND is optional, so I should add it in the optional variables list
in wic.Wic2.test_image_env. The fix is coming soon.

Thanks,
Kevin

>=20
> Cheers,
>=20
> Richard
>=20

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAl5H2bIACgkQk1jtMN6u
sXFLnAf/WFoGuKVBvJ7oDM17IXB/Za3KYjVc0+pdu9UPbkW4IdNPVuX5suAnLIkJ
xArrE+dAcsx3aETvfsV64qObhHraQmdfFy1M5vbXvolZWtVI7fzR8PLHVMF3h1td
HqRZqanAkk6ekppKg5G3QLL1R6bkL4jpq7vkjKk6S1Y0xc+XaGaKB4QPH+T6kTOZ
pEN5M5dUllP8AQkhuTpNY+DQWANhmm5qMeBOqG6boeQH9k+sMe6zMXvwF7ITRDWD
Za/d2sQKdIJCnXg4kP+Xa+iuvQjaU5nQfMoI2I5/u9WNyqydDTcQnYs16iZMVqyB
7wx4oivceHui9mk+VUSKo0lIo/Jq7Q==
=zb6L
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
