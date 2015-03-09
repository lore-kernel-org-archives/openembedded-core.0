Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8A49973943
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 15:59:52 +0000 (UTC)
Received: by pabrd3 with SMTP id rd3so40098632pab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=qYFAbQTAWt4rIED4BInHo5PkZRkrHwqRZv2Bo3LJJJ0=;
	b=Q/cJEPMH9ScuKIpZAAnKAWK+I1/hH7eQM+3ik80smVGW4BhqQ78MnzqUCf9RxuIBWK
	Js40hN93KAtFtyJpgMF58h6Y0yhhho5VW6L4nttwkUUePTjCklIlO2asXVd42mSo8wth
	DA3IlS5bNM2/fT1nNt1p/OUc1x1CY6kuPlv/RukyLIRbONISyTzy8A2TznonM0XtOqTe
	n3s0/leZs9wN8QpgWiq3YuOFclgE5Zv5W+cvn0hirIa6bEU6I0aPuKpt0WPsVTeVeO8I
	FiBnf/PR+iropk5vxsQfbUX44zdnw3hZ4Awwwx57+o5c3VOjpQS1G9TFM3vttPI1FqW7
	x6aQ==
X-Received: by 10.70.133.197 with SMTP id pe5mr55452513pdb.64.1425916792639;
	Mon, 09 Mar 2015 08:59:52 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:5dec:324d:fc8d:ab4d?
	([2601:9:3580:84c:5dec:324d:fc8d:ab4d])
	by mx.google.com with ESMTPSA id
	fk15sm3975350pdb.19.2015.03.09.08.59.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 08:59:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cd62f62acc964a2d896fd7a7e2a26372589f40a0.1425885208.git.liezhi.yang@windriver.com>
Date: Mon, 9 Mar 2015 08:59:50 -0700
Message-Id: <E0AC5CCC-475C-413E-BB70-1ABB120235BF@gmail.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
	<cd62f62acc964a2d896fd7a7e2a26372589f40a0.1425885208.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 15:59:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 9, 2015, at 12:15 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> The www.xinetd.org is not available, use github as the HOMEPAGE and
> pkgs.fedoraproject.org as the SRC_URI.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb =
b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> index 288186e..f07a33f 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> @@ -1,5 +1,5 @@
> SUMMARY =3D "Socket-based service activation daemon"
> -HOMEPAGE =3D "http://www.xinetd.org"
> +HOMEPAGE =3D "https://github.com/xinetd-org/xinetd"
>=20
> # xinetd is a BSD-like license
> # Apple and Gentoo say BSD here.
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYRIGHT;md5=3D8ad8615198542444f84d28a6cf226dd8"
> DEPENDS =3D ""
> PR =3D "r2"
>=20
> -SRC_URI =3D "http://www.xinetd.org/xinetd-${PV}.tar.gz \
> +SRC_URI =3D =
"http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/77358478fd58e=
fa6366accae99b8b04c/${BP}.tar.gz \

This snapshot can go away too. I would be more comfortable if you just =
checked it out from github straight.

>       file://xinetd.init \
>       file://xinetd.conf \
>       file://xinetd.default \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


