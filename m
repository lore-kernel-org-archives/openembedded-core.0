Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 29EE373167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:15:32 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a17so183483986wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TS8hEUXfZEvmL9x8Li1qeve7pssFy83PZ08kQ/EU0NQ=;
	b=U+6LXF2if64P7RaG8vWEdk0npi1r07fPBEQbjfqPma+4tJry8cpNUq4+ut8Xf2MmRb
	u5LGb1LO72bcFDfYZcNuWNmsfBKzKUk60nOjj6Lw7SGj6PA6rg2McLx/SExlIYmZPq9G
	jbseobO0cDAfeNd7amqGExv9RX9mf4QR2+71MjRf1aPIpEhFQo+iczfYLRYCLWdkBy8O
	MznNHZz1+OdjPzaT29oCov7U+qD35yjYCK12eg2Jzuc9DX2d25BlLCKmIoAlQf6FmxfM
	SiABUqcoWsZhmf5geqGUDOCg3fHxetPDwB5Tf9Hc7MTy+eg5jrFESlbdXabzLiCE+wn0
	7EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TS8hEUXfZEvmL9x8Li1qeve7pssFy83PZ08kQ/EU0NQ=;
	b=agXyLSWxz0BCMWxlpZSVWAyTvatM6VTjhhH7ioBmdh2DpCkr1sOS4CAkiNSNfsYevq
	INM9f/kBdQAGZwkaPp3B0QM1urBGtQdT5kws755yCdkbCBFRj7WTjc5lF+0M4i6LpEWO
	y2pHDCMXo2f42Y/G4I1S9hlHU2ahElU5PrlruHgL7WRUgESrroKrYYmS/1cxz9BLNKZU
	6oT0jk5CtGlfG8xtTkv6JooRrr47fs65MoMg/TPW8jFQ8hpCdodavVhK8l2TK4oaIHo0
	Da7OhQ4qZNfXDgF9WSxf8q1xBh+fSNWJPsDPXZctQs+uSaVuCRAVJmNV2fLHs+0QG+GB
	YVZg==
X-Gm-Message-State: AOPr4FVsGfAjXfNG/SyGaaalv8k5ZBnMEqmy+pPVOyJy7D3Ib7m7EHoEd/NP7TYHT8Ti8w==
X-Received: by 10.28.45.216 with SMTP id t207mr10617319wmt.40.1462796133308;
	Mon, 09 May 2016 05:15:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v143sm24193598wmv.4.2016.05.09.05.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 May 2016 05:15:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 May 2016 14:15:41 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20160509121541.GA2560@jama>
References: <1461109862-23840-1-git-send-email-akuster808@gmail.com>
	<1461109862-23840-2-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1461109862-23840-2-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master][krogoth][jethro][fido 2/2] tzdata: update to 2016d
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
X-List-Received-Date: Mon, 09 May 2016 12:15:34 -0000
X-Groupsio-MsgNum: 81736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 04:51:02PM -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> Changes affecting future time stamps
>=20

Please get this into jethro soon, now version in fido is newer (2016d)
than in jethro (2016c)

> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-extended/tzdata/{tzdata_2016c.bb =3D> tzdata_2016d.bb} | 4 =
++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/tzdata/{tzdata_2016c.bb =3D> tzdata_2016d.b=
b} (98%)
>=20
> diff --git a/meta/recipes-extended/tzdata/tzdata_2016c.bb b/meta/recipes-=
extended/tzdata/tzdata_2016d.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2016c.bb
> rename to meta/recipes-extended/tzdata/tzdata_2016d.bb
> index 5eb85b7..627a31a 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2016c.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2016d.bb
> @@ -8,8 +8,8 @@ DEPENDS =3D "tzcode-native"
> =20
>  SRC_URI =3D "http://www.iana.org/time-zones/repository/releases/tzdata${=
PV}.tar.gz;name=3Dtzdata"
> =20
> -SRC_URI[tzdata.md5sum] =3D "0330ccd16140d3b6438a18dae9b34b93"
> -SRC_URI[tzdata.sha256sum] =3D "8700d981e6f2007ac037dabb5d2b12f390e8629bb=
c30e564bc21cf0c069a2d48"
> +SRC_URI[tzdata.md5sum] =3D "14bf84b6c2cdab0a9428991e0150ebe6"
> +SRC_URI[tzdata.sha256sum] =3D "d9554dfba0efd76053582bd89e8c7036ef12eee14=
fdd506675b08a5b59f0a1b4"
> =20
>  inherit allarch
> =20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcwf2oACgkQN1Ujt2V2gByJGQCdEbU5L2h7VI/fGPCWAITzXSAa
7dkAn0cOfhBWlmkxhDuJfbGOmzma1uYw
=K1eK
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
