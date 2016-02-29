Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 098FD731C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 18:39:22 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id yy13so96178678pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Y0d0qOwHfeyZvZG/mRE/qB8QjIx5OrGyOq7j/1G9++k=;
	b=xUWR15wS7g+hx49e0Obhd2u4or+X6q/1+9aSa+HDT9UgclAQFvS60VFmABWkiNduv5
	9Hz+EMLrFRLcNonGjiSNK4B6lU3f+ZKzMrkpgh1I1rShify+e2nu23mbv+5clr863PpA
	CdxUbRRdk6az0nAezHDxDg1tC5o3WS69PvQOvGJVhawEkpBRdHmZNEHN+x9r4aVkT2I0
	kf8l9ro9A4KgdHFagXSw7AUaGEEes2+yvnyHWusown0uOegMphrGE08JwaJy9JLIHQJu
	W8SOnlKeE+9ERJIWodY4RcbQfWjxVg45vSWEhJ8CsUvwOZdHoKPzKv2a6o60WoZdD7yn
	3F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Y0d0qOwHfeyZvZG/mRE/qB8QjIx5OrGyOq7j/1G9++k=;
	b=Jx1Eo2nVyLBsKHGdZdGel1ciyIDLMK9xk68T8VK7b2khf3KiKzjZcCkcTqaO98Y6T8
	zyJiuwt8dlpxz4urlJB4OC/R9DHo3WsRmYddZLBkVB4RAeSRr+hROKXeEo/pQOqY8fR1
	P9w3WKo1Cp6IhTjLGBGvwxlvf0NaIyGQei5m2a8EfpC+Ehk0bqr5gBGLVI1WSlBBrhtU
	5u1/tubO0wktTt6/9bMO8Pkx51sizidNLfWAbS3tyhQkA3i6Xfmt4/PA9MB1HjrMyjwJ
	CgUz9hWjsH/ilXBCyZ0VeM/msLiEjYsEuVQaxECC5uVj8VJwmh7YUsUPO+Q1BrtQH7Wz
	JxOA==
X-Gm-Message-State: AD7BkJIButusvb5/NKxKaOE+CLQebRxo3TaaaaTSVn9S+tCkZsXzs9arbSVc3E+70w6BEg==
X-Received: by 10.66.251.194 with SMTP id zm2mr24403149pac.131.1456771163217; 
	Mon, 29 Feb 2016 10:39:23 -0800 (PST)
Received: from ?IPv6:2601:646:8800:5a9a:f8ff:6a25:60d4:e553?
	([2601:646:8800:5a9a:f8ff:6a25:60d4:e553])
	by smtp.gmail.com with ESMTPSA id 67sm39784666pfi.2.2016.02.29.10.39.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 10:39:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
Date: Mon, 29 Feb 2016 10:39:13 -0800
Message-Id: <89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Mon, 29 Feb 2016 18:39:23 -0000
X-Groupsio-MsgNum: 78916
Content-Type: multipart/signed;
	boundary="Apple-Mail=_85BBB8F4-B3DB-40E2-9642-90F431FE9B3C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_85BBB8F4-B3DB-40E2-9642-90F431FE9B3C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This broke musl builds see


http://errors.yoctoproject.org/Errors/Details/38154/



> On Feb 25, 2016, at 7:59 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> meta/recipes-support/nspr/{nspr_4.11.bb =3D> nspr_4.12.bb} | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-support/nspr/{nspr_4.11.bb =3D> nspr_4.12.bb} =
(96%)
>=20
> diff --git a/meta/recipes-support/nspr/nspr_4.11.bb =
b/meta/recipes-support/nspr/nspr_4.12.bb
> similarity index 96%
> rename from meta/recipes-support/nspr/nspr_4.11.bb
> rename to meta/recipes-support/nspr/nspr_4.12.bb
> index a38e20c..2fd801f 100644
> --- a/meta/recipes-support/nspr/nspr_4.11.bb
> +++ b/meta/recipes-support/nspr/nspr_4.12.bb
> @@ -26,8 +26,8 @@ SRC_URI_append_libc-musl =3D "\
> UPSTREAM_CHECK_URI =3D "http://ftp.mozilla.org/pub/nspr/releases/"
> UPSTREAM_CHECK_REGEX =3D "v(?P<pver>\d+(\.\d+)+)/"
>=20
> -SRC_URI[md5sum] =3D "4f24b2fb88ca03b5d6d6931d6a67ef9a"
> -SRC_URI[sha256sum] =3D =
"cb320a9eee7028275ac0fce7adc39dee36f14f02fd8432fce1b7e1aa5e3685c2"
> +SRC_URI[md5sum] =3D "0de760c1e00a92e180e611cf06ce9589"
> +SRC_URI[sha256sum] =3D =
"e0b10a1e569153668ff8bdea6c7e491b389fab69c2f18285a1ebf7c2ea4269de"
>=20
> S =3D "${WORKDIR}/nspr-${PV}/nspr"
>=20
> --
> 2.7.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_85BBB8F4-B3DB-40E2-9642-90F431FE9B3C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbUkFkACgkQuwUzVZGdMxSylACaAuSDe2dMOqVILlwp3RmXjSE8
QDsAmwSQjw/7ufK1bgE5ED25RPJVSu1p
=w5yg
-----END PGP SIGNATURE-----

--Apple-Mail=_85BBB8F4-B3DB-40E2-9642-90F431FE9B3C--
