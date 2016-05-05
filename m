Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id F179B606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 22:30:26 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 77so42083170pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=JthNh+14OG80JITdlg0ytObHbdYWnIiMhTgCJAbCQDM=;
	b=rnzcEZ9lRAqCPM1UmipH85yZ6hn8f1+w+CR5gOWrQtYQMi3Q9vjsw1RjO2jlVmJT/O
	lbkd9iM2sHgbebhvocopbQArrhODQkJmdU76makxeAYExNbi7kHBbBlVUo2HK3oWCkNR
	I0ptFS984fyeawgX29a7BBggwczTKYNlvpqJh3SnYv0ZT+746BsTILan4Kti5oC2tQwx
	T1DXgxVA/tMRKjwIFctau9G79JhpG0JPh8qG4oYqT0K3YgJ5l99c8IRiFv9cF8OrX7Zl
	0BuP+eG2bL2luRhGifCy9w9OTtEPXksqu6eYt97R84NtLC61C2y69719VwBVXobb0ZTU
	6hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JthNh+14OG80JITdlg0ytObHbdYWnIiMhTgCJAbCQDM=;
	b=bUHdK+D9PxmEyxSrqE4MVxoPIz7Obb8GRbhkFLjL03TJHThHI21xHBEbfgjnOEsKfl
	P7OHjOK2JV9UT9OlACgB426cqf+KBmN0/gXorTAIYkwkkvZoJT0pRkF7oF+ujQhydtGD
	3w61DZwmagwSGKACVNYVt/0COecS7AP1KAhSn/nEFgfG3Mow5lY+COmZfZPeKmgnMdDS
	45dy7BqP1UafF0BaaPfWFulYUkEZBRPLbMaw1Z5wNa7d8AlEkVMvWryGY1K+8rEc9Bud
	4jgdoEJgV0nCnpJUcul1ZOexhzWg0Q//Zqd433oRrLn9r66OHMx6UUbtFUxettzUzHci
	eosg==
X-Gm-Message-State: AOPr4FXjKfI2y2Q80kIk2NhTprLsSqNBhTTzh1YbTEYIIwLV9e4KaH2awpsUakPnQAc6hw==
X-Received: by 10.98.18.195 with SMTP id 64mr24255367pfs.152.1462487427574;
	Thu, 05 May 2016 15:30:27 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:e855:e0cf:9b6c:1f91?
	([2601:646:8800:5a9a:e855:e0cf:9b6c:1f91])
	by smtp.gmail.com with ESMTPSA id
	ba9sm16023928pab.24.2016.05.05.15.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2016 15:30:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <46bd326e540e30daf021a489c4a1c30568712f39.1462476586.git.chris_larson@mentor.com>
Date: Thu, 5 May 2016 15:30:20 -0700
Message-Id: <769BD719-C37F-4A96-88B6-BB6EB87640D0@gmail.com>
References: <e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
	<cover.1462476586.git.chris_larson@mentor.com>
	<46bd326e540e30daf021a489c4a1c30568712f39.1462476586.git.chris_larson@mentor.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH 3/3] pong-clock: obey CFLAGS, LDFLAGS
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
X-List-Received-Date: Thu, 05 May 2016 22:30:29 -0000
X-Groupsio-MsgNum: 81647
Content-Type: multipart/signed;
	boundary="Apple-Mail=_622294CB-28EF-4627-ACAC-1EF66591C7A9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_622294CB-28EF-4627-ACAC-1EF66591C7A9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 5, 2016, at 12:30 PM, Christopher Larson <kergoth@gmail.com> =
wrote:
>=20
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> meta/recipes-graphics/pong-clock/pong-clock_1.0.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb =
b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> index 0e1a792..6c3bcd8 100644
> --- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> +++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D =
"file://pong-clock-no-flicker.c;beginline=3D1;endline=3D23;md5=3Ddd
> S =3D "${WORKDIR}"
>=20
> do_compile () {
> -	${CC} -o pong-clock pong-clock-no-flicker.c `pkg-config --cflags =
--libs x11 xau xdmcp`
> +	${CC} ${CFLAGS} ${LDFLAGS} -o pong-clock pong-clock-no-flicker.c =
`pkg-config --cflags --libs x11 xau xdmcl`

This could be improved if compile and link steps are done separately and =
you see the effect what I was making a point
from user point of view the toolchain is integrated.

$CC hello.c

should produce a a.out which can be executed.

> }
>=20
> do_install () {
> --
> 2.8.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_622294CB-28EF-4627-ACAC-1EF66591C7A9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcryYEACgkQuwUzVZGdMxSSSwCdHfyAEFy1N7/Lm43F+W/XSRl5
VDAAn1PlBu3ZERd4fISCp3Bes9EvxKV2
=/9IA
-----END PGP SIGNATURE-----

--Apple-Mail=_622294CB-28EF-4627-ACAC-1EF66591C7A9--
