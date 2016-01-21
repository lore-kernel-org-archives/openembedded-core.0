Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA19A6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 04:18:51 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id q63so16773185pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 20:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qC89hbwcvwMbpDRk1eAUB+QOkrrBV659G06ATBFml5A=;
	b=aLChHMrIm52ctf5lmsfGO9CIoDnpVwx++Kj+Q50mkaokYwuV2Q62lEmA+VTNrXRaYD
	PWdo5NlDXc+zBVrSDUfcuBU5XZJhqc0pGrLuOK7WLunnfLx1A4UbhCRP6LKyZtkgtALy
	O5Dg9l78XBDQVVihh/bZbl9KPB/i1jFu3xdFcNm3Rpq9ORI1ZzlzXO2f6uUD46CzUTRp
	CcaD73iF8AthAHzGbsPT0LEllCL50mofkx1y9XiTdXS9q8gXVGJIe0upFyR1MLyTnEy3
	26yKmSoCtrYN9cvICXiVpOT+eH9Pq+mTbYO9GM5mExFzkeqjX6Cs1qymxXOEk5rWuGZD
	7wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=qC89hbwcvwMbpDRk1eAUB+QOkrrBV659G06ATBFml5A=;
	b=SchIwvMMD8ZzlYK27D+qYrU628mDqj0wcDgfkUI8+sSemXNJKLkfFA3DZcbgyhe/vc
	YBJZbKMzxfa8LQyz3XePfErNoe8P31kDMn6mB+ibxTSnfCqDkk20TdAhTvtrXwNvev0g
	BYVCeJBSmgbM/gm1dORM27xVMdAGpnFqWDaKqmpvbK5ZTSiQX8F7MQ7pdT1IS+ujofZn
	SwwDJ5c5UeraRDSLCHOQO3d7SPdrdjUhhK3cTlkWJHYj0WdWhczIpRQCwwMnNyRUfSzd
	nRO6845zBjz/8CRILaVVWJwQ+/yi5A89cpRZSJR6lqRcv5+QscHE/+TJrpOag6I6ODcn
	0k3g==
X-Gm-Message-State: ALoCoQkC1RcphVS6of7vQH4syEEcjYw8afoU2bCqT/HqTv9TPmU4MI7SmsQTOUG/LYPTjQybUo2hNp4BBECpvhbmcgxu7rWWTg==
X-Received: by 10.98.68.199 with SMTP id m68mr57797970pfi.6.1453349932231;
	Wed, 20 Jan 2016 20:18:52 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:a5aa:8559:d533:5d3e?
	([2601:646:8802:5d5c:a5aa:8559:d533:5d3e])
	by smtp.gmail.com with ESMTPSA id
	cf6sm52295044pad.41.2016.01.20.20.18.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 20:18:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453344203-7118-21-git-send-email-armccurdy@gmail.com>
Date: Wed, 20 Jan 2016 20:18:45 -0800
Message-Id: <55B24B65-AD91-4DE4-8BFD-7204F4033862@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
	<1453344203-7118-21-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/25] gstreamer1.0: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 04:18:53 -0000
X-Groupsio-MsgNum: 76565
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9BF785FC-5D92-44B8-B29E-869BEA601075";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9BF785FC-5D92-44B8-B29E-869BEA601075
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 20, 2016, at 6:43 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 15 =
++++++++++-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> index f7e2351..4fff533 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> @@ -5,14 +5,19 @@ include gstreamer1.0.inc
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D6762ed442b3822387a51c92d928ead0d \
>                     =
file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c07=
9c016d0d"
>=20
> -SRC_URI =3D =
"git://anongit.freedesktop.org/gstreamer/gstreamer;branch=3Dmaster"
> +SRC_URI =3D " \
> +    git://anongit.freedesktop.org/gstreamer/gstreamer;name=3Dbase \
> +    =
git://anongit.freedesktop.org/gstreamer/common;destsuffix=3Dgit/common;nam=
e=3Dcommon \
> +"
>=20
> -SRCREV =3D "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
> +PV =3D "1.7.1+git${SRCPV}"
> +
> +SRCREV_base =3D "2a188848eb2af3c3b357978ff7786a78aad9dd55"
> +SRCREV_common =3D "86e46630ed8af8d94796859db550a9c3d89c9f65"
> +SRCREV_FORMAT =3D "base"
>=20
> S =3D "${WORKDIR}/git"
>=20
> do_configure_prepend() {
> -	cd ${S}
> -	./autogen.sh --noconfigure
> -	cd ${B}
> +	${S}/autogen.sh =E2=80=94noconfigure


where does it generate the new autoconf files ( configure and friends) =
after
this change ? is it in S or in B

> }
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9BF785FC-5D92-44B8-B29E-869BEA601075
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlagXCoACgkQuwUzVZGdMxTV2ACcC2VHOIZ9XrL+X8NCMTLBhxDV
/5YAn3SkEXi+ChizrHukMA0ad8Q4281c
=6mDx
-----END PGP SIGNATURE-----

--Apple-Mail=_9BF785FC-5D92-44B8-B29E-869BEA601075--
