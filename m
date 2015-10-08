Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6D765CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:40:14 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so37683637pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=/QHaSXwk5fTqAClPCEwitd3/B5DaOgowQye2mzNcPcI=;
	b=U+kniL8gw0KVHtRZQxXvFcyCt7tu6nJl2BlfFoU7f1sbEnrfEXiaDncG0Pfvx0hK/o
	RBOGkShrtJ650fcqhJg4HpMaESK0Fy5Kz75XZgj3FosVkXRF11XzF3YJ8M6gsC5hkR4U
	9o21fyf4+9K1ouww6aoU0Tsbly/beZeJcWWeuH+AXmBhVcaCpx69HF0fqiNex4g3tjeb
	uWBIz+9LAci/EmMFGJ/Zikao84i3MoAvIviMJmx0hRwTafTg9TH8O1MwxUDRKAFof0bE
	n2A/oPr3Wm5ya6BjMmlwRYjoQ0UyfYVFyArxWEEZguQG031P1JsrwDAHtHYXiUwrZLAS
	N37Q==
X-Received: by 10.68.215.73 with SMTP id og9mr4805314pbc.122.1444268415202;
	Wed, 07 Oct 2015 18:40:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:787e:b3a8:cb23:6c63?
	([2601:646:8601:4580:787e:b3a8:cb23:6c63])
	by smtp.gmail.com with ESMTPSA id
	xz5sm41879003pbb.12.2015.10.07.18.40.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Oct 2015 18:40:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444176599-12228-1-git-send-email-alejandro.franco@linux.intel.com>
Date: Wed, 7 Oct 2015 18:40:14 -0700
Message-Id: <3F5512B1-A808-4FED-B73F-D33DA830749C@gmail.com>
References: <1444176599-12228-1-git-send-email-alejandro.franco@linux.intel.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
X-Mailer: Apple Mail (2.3095)
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] core-image: rename from core-image-empty
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
X-List-Received-Date: Thu, 08 Oct 2015 01:40:18 -0000
X-Groupsio-MsgNum: 71977
Content-Type: multipart/signed;
	boundary="Apple-Mail=_10493708-3937-401C-AC8D-11CF3866110F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_10493708-3937-401C-AC8D-11CF3866110F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 6, 2015, at 5:09 PM, Alex Franco =
<alejandro.franco@linux.intel.com> wrote:
>=20
> As the image isn't a "core=E2=80=9D image
>=20

whats the motivation for this change

> [YOCTO #7664]
>=20
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
> meta-selftest/recipes-test/images/core-image-empty.bb | 7 -------
> meta-selftest/recipes-test/images/empty-image.bb      | 7 +++++++
> 2 files changed, 7 insertions(+), 7 deletions(-)
> delete mode 100644 =
meta-selftest/recipes-test/images/core-image-empty.bb
> create mode 100644 meta-selftest/recipes-test/images/empty-image.bb
>=20
> diff --git a/meta-selftest/recipes-test/images/core-image-empty.bb =
b/meta-selftest/recipes-test/images/core-image-empty.bb
> deleted file mode 100644
> index 550567c..0000000
> --- a/meta-selftest/recipes-test/images/core-image-empty.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -SUMMARY =3D "An empty image."
> -IMAGE_INSTALL =3D ""
> -IMAGE_LINGUAS =3D ""
> -PACKAGE_INSTALL =3D ""
> -LICENSE =3D "MIT"
> -
> -inherit image
> diff --git a/meta-selftest/recipes-test/images/empty-image.bb =
b/meta-selftest/recipes-test/images/empty-image.bb
> new file mode 100644
> index 0000000..550567c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/images/empty-image.bb
> @@ -0,0 +1,7 @@
> +SUMMARY =3D "An empty image."
> +IMAGE_INSTALL =3D ""
> +IMAGE_LINGUAS =3D ""
> +PACKAGE_INSTALL =3D ""
> +LICENSE =3D "MIT"
> +
> +inherit image
> --
> 2.5.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_10493708-3937-401C-AC8D-11CF3866110F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYVyX4ACgkQuwUzVZGdMxTEWgCgjbA6Za7OdP2PyUN7/bKheom5
Vj8AnRXyeukIHcNtmNI38gssqm1PUTiR
=EaX/
-----END PGP SIGNATURE-----

--Apple-Mail=_10493708-3937-401C-AC8D-11CF3866110F--
