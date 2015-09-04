Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3C67276FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:29:36 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so25168118pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=rcD1I6xqqEtsoEQDJM5FHLbjx5CX7CQpPT6nB0lVXSs=;
	b=ZlxCjrUWJu3rQr+12hO45OZZOmR05at3auKxqtDsozltvexFxHl5HObkVWoFNF0O43
	zSL3aiB57G1mvhaNGt+2Z4UBUvuvZFrgpZSYORzKk7RB7tO3OqwGsYRxoEImaY/BplNm
	2+1lJu7uDtL8PkiCXENveKPKnQYPOUlNYEANiJ7LpDm1unPfXLFBECYPZd8L49/Jkd2K
	eweyURNBsdeRGJxKDml3y5wuR0h7x7g0UL6l3NJq9NmUV/9kSDFGHz8t7vKbRgZXWgux
	yOR3fu5+uI3++s2ZkU2DrrtB64/SiwhaNeELsvb8/uE5aDBzgNhYEp57KUUUciQE3pDk
	3jCg==
X-Received: by 10.68.96.197 with SMTP id du5mr9501380pbb.32.1441380576661;
	Fri, 04 Sep 2015 08:29:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:9840:3a97:97d7:650a?
	([2601:646:8601:4580:9840:3a97:97d7:650a])
	by smtp.gmail.com with ESMTPSA id v8sm2904827pdm.35.2015.09.04.08.29.35
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Sep 2015 08:29:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441380461.24871.171.camel@linuxfoundation.org>
Date: Fri, 4 Sep 2015 08:29:30 -0700
Message-Id: <2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
References: <1441380461.24871.171.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: Set gcc 5.2 as the default
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
X-List-Received-Date: Fri, 04 Sep 2015 15:29:38 -0000
X-Groupsio-MsgNum: 70682
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5A260DEC-EA1C-4724-BCD8-3A6896C74FCD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5A260DEC-EA1C-4724-BCD8-3A6896C74FCD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 4, 2015, at 8:27 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> -GCCVERSION ?=3D "4.9%"
> +GCCVERSION ?=3D "5.2%"

a small nit. Make it 5.% to logically indicate that 5.x is a bug fix =
release and next big upgrade will be
6.x

--Apple-Mail=_5A260DEC-EA1C-4724-BCD8-3A6896C74FCD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXpuN4ACgkQuwUzVZGdMxSH/gCghldj5WABVH/KjnNlOX2XKBLs
O9gAnRckjZiKldBqH1hr6mJZChxfdYda
=4rLa
-----END PGP SIGNATURE-----

--Apple-Mail=_5A260DEC-EA1C-4724-BCD8-3A6896C74FCD--
