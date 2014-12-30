Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D89C765CA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:38:32 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so23535476wid.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 00:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EQM5n+3DurN9fp4T20eGWmnP3MTxqNoSK8Bn8jn4jyw=;
	b=Zgi7fFteDDzuiNBpwIlvslPhxo3YepWL8/aysRMvyxZNZ3ALtEmEPiYWU2bBjhkI/u
	cWLo678j9q1jEhruMTZHk88I8KSn4SALiJcfSKp3DWLbDGXdj3TCfvl1qCWTS8xvJyuX
	p/PTZj9pss/NLlYzKQKWo+/eFTtcn7LKfBQuwG3vv7uHq/QBlw8cE7lDIJRAM4sg/B40
	9gMUmPJg//sqp9R1l+JHWQFzeSB/Butpo6CdOulJ/q4uNVPp/nYGRGkMZbnCkb/9fV7n
	1jG/Ns0oUFTHZDaxAKetFInpyh43W4ozQdXkd7MDTizn0fN4tdMUaEEzOW7jm5GL4wXF
	ZsGw==
X-Received: by 10.180.82.137 with SMTP id i9mr106177309wiy.38.1419928712611;
	Tue, 30 Dec 2014 00:38:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e7sm52973880wjx.31.2014.12.30.00.38.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 00:38:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Dec 2014 09:38:32 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20141230083832.GC2469@jama>
References: <1419918611-33216-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1419918611-33216-1-git-send-email-liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH 1/2] esmtp: use BPN in SRC_URI
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
X-List-Received-Date: Tue, 30 Dec 2014 08:38:44 -0000
X-Groupsio-MsgNum: 60896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2014 at 09:50:10PM -0800, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Wrong ML

> ---
>  meta-networking/recipes-support/esmtp/esmtp_1.2.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-ne=
tworking/recipes-support/esmtp/esmtp_1.2.bb
> index 46d468c..60d34e1 100644
> --- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> +++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "libesmtp"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -SRC_URI =3D "http://nchc.dl.sourceforge.net/project/${PN}/${PN}/${PV}/${=
PN}-${PV}.tar.bz2"
> +SRC_URI =3D "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/=
${BPN}-${PV}.tar.bz2"
> =20
>  # Have to set this or we get -L/lib in LDFLAGS
>  EXTRA_OECONF =3D "--with-libesmtp=3D${STAGING_EXECPREFIXDIR}"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSiZIgACgkQN1Ujt2V2gByeHgCgjDU2RJivhSFpw4oTm2pw3kVI
jPEAoLDuIKj7vcbc4RX0XBrTIH7V6vL2
=lVSS
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
