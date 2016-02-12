Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7052D75E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 13:10:05 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id 128so61576979wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tX9hXfgzpKpnFQ7/Od4BH2EhMQA90o1OSnPLScoMUsg=;
	b=zUOjVM1cDZTpRrHX22dQ85lnsg9hrRaTLS6LZwr5lpqX+GcZeRhDG4jckyCA5YLVY6
	Z129bnjIEpxJer8nhL9NRm+dBWknIsdXZNC9PgXDRmvlKikZeVRBqJSHC5PkSsvt8G+L
	if1gfqgiwr9H4D6vIGGmk32lsPLqZgKmIvFYjnsbblbroEYZf9a8qtNXYejEq9fXoiHB
	QGMj8p+DqiTUC8wvew/o/Icj49x5UO3o37vVVLOTaReBJ5BsnuqPVLoQKBkq2A65SmuP
	kq3Tm8oO3fyNpAQ3m1Mjx6+gd6ZS/1FaCNw2wVKyQa7RtR3rceZYxClHRr0OxeuLgQwr
	fBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=tX9hXfgzpKpnFQ7/Od4BH2EhMQA90o1OSnPLScoMUsg=;
	b=EFVn5PPCuXyQQN5tOZvCZELiTfrxAKu2Vul1QTvVc1Em9yVifwK5b8LVFN7jwOt3wN
	u6YqX20igL8iDdYGTt38eWjK6escMgHkg1odVHj05xgwHHBuc6KCtPB52A+Vfm29aCVX
	zFDZuBNzp4NFFzO7kqxCR5OVvcGADWW3nr6d+JYSIeOuJI3vAXT/r9v9w2KKdaivtqew
	z8jzXaAeW5REl0dKZnOTOPcPpNSQpmX3in1/ARMQ7fdgg4SC5JRzPVL+5gxwIFDKc7eh
	j8fRzOPrcE+E3BFri4pQs3FZyI5aYaxIK0seGnCOY+nM0hLXTlPxkrno2P4lCyhDhSlU
	bSZA==
X-Gm-Message-State: AG10YOQLsbZzHvVuwBg2OcKFTkFALTifUCw0usk3vafGfnuwtmwZW/zUDNNqOSQiS9jWxg==
X-Received: by 10.194.60.200 with SMTP id j8mr1648812wjr.124.1455282606074;
	Fri, 12 Feb 2016 05:10:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l2sm12057961wjf.15.2016.02.12.05.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Feb 2016 05:10:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Feb 2016 14:14:15 +0100
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20160212131415.GA2607@jama>
References: <1455236434-31029-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1455236434-31029-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [jethro][fido] libbsd: Secuirty fix CVE-2016-2090
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
X-List-Received-Date: Fri, 12 Feb 2016 13:10:06 -0000
X-Groupsio-MsgNum: 78069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 04:20:34PM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> CVE-2016-2090 Heap buffer overflow in fgetwln function of libbsd

typo in subject

>=20
> affects libbsd <=3D 0.8.1
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libbsd/files/CVE-2016-2090.patch               | 50 ++++++++++++++++=
++++++
>  meta/recipes-support/libbsd/libbsd_0.7.0.bb        |  4 +-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libbsd/files/CVE-2016-2090.patch
>=20
> diff --git a/meta/recipes-support/libbsd/files/CVE-2016-2090.patch b/meta=
/recipes-support/libbsd/files/CVE-2016-2090.patch
> new file mode 100644
> index 0000000..2eaae13
> --- /dev/null
> +++ b/meta/recipes-support/libbsd/files/CVE-2016-2090.patch
> @@ -0,0 +1,50 @@
> +From c8f0723d2b4520bdd6b9eb7c3e7976de726d7ff7 Mon Sep 17 00:00:00 2001
> +From: Hanno Boeck <hanno@hboeck.de>
> +Date: Wed, 27 Jan 2016 15:10:11 +0100
> +Subject: [PATCH] Fix heap buffer overflow in fgetwln()
> +
> +In the function fgetwln() there's a 4 byte heap overflow.
> +
> +There is a while loop that has this check to see whether there's still
> +enough space in the buffer:
> +
> +		if (!fb->len || wused > fb->len) {
> +
> +If this is true more memory gets allocated. However this test won't be
> +true if wused =3D=3D fb->len, but at that point wused already points out
> +of the buffer. Some lines later there's a write to the buffer:
> +
> +		fb->wbuf[wused++] =3D wc;
> +
> +This bug was found with the help of address sanitizer.
> +
> +Warned-by: ASAN
> +Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=3D93881
> +Signed-off-by: Guillem Jover <guillem@hadrons.org>
> +
> +Upstream-Status: Backport
> +http://cgit.freedesktop.org/libbsd/commit/?id=3Dc8f0723d2b4520bdd6b9eb7c=
3e7976de726d7ff7
> +
> +CVE: CVE-2016-2090
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/fgetwln.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/fgetwln.c b/src/fgetwln.c
> +index 9ee0776..aa3f927 100644
> +--- a/src/fgetwln.c
> ++++ b/src/fgetwln.c
> +@@ -60,7 +60,7 @@ fgetwln(FILE *stream, size_t *lenp)
> + 	fb->fp =3D stream;
> +=20
> + 	while ((wc =3D fgetwc(stream)) !=3D WEOF) {
> +-		if (!fb->len || wused > fb->len) {
> ++		if (!fb->len || wused >=3D fb->len) {
> + 			wchar_t *wp;
> +=20
> + 			if (fb->len)
> +--=20
> +2.3.5
> +
> diff --git a/meta/recipes-support/libbsd/libbsd_0.7.0.bb b/meta/recipes-s=
upport/libbsd/libbsd_0.7.0.bb
> index 902666d..8d9a708 100644
> --- a/meta/recipes-support/libbsd/libbsd_0.7.0.bb
> +++ b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
> @@ -13,7 +13,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df1530ea92aea=
a1c5e2547cfd43905d8c"
>  SECTION =3D "libs"
>  DEPENDS =3D ""
> =20
> -SRC_URI =3D "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> +SRC_URI =3D "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> +           file://CVE-2016-2090.patch \
> +           "
> =20
>  SRC_URI[md5sum] =3D "fcceb4e66fd448ca4ed42ba22a8babb0"
>  SRC_URI[sha256sum] =3D "0f3b0e17e5c34c038126e0a04351b11e23c6101a7d0ce3be=
eab29bb6415c10bb"
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

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla92qQACgkQN1Ujt2V2gBz7LgCgnf/XjHY2HUAoVaLt/NbnCWkO
unwAnA99kynZcdlsLxr/+4BfMtqwwP+6
=j+sV
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
