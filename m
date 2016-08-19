Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80AB27706D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:51:30 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so3652956pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=K2+W4h/RPD38OVzmC5wE6yyxOlfiGEhoMFfYb6Spy9k=;
	b=xjOezMI30PlJJS9EB77VbudkVweUSsz+V0oNvGaGBtBV4FVGnm8WyyOtnBBMjnqjlM
	P+1jMj6YnMziwyK+i0UbRYM5v9QlaEjiLqZuQ5NF3gWGuBDujJR8QrqXWLkCHULYJo91
	zxIRA8Zjgmpi6dqFe9XeHT/SBlF9JXg5WQw7OZJ12se+F47AK0ZI+PWMnO7kyrwZrUMG
	cEnchjLuNdEn36D3L+oJWiLbqB6Jo2qfRVINtQUNKQ+ZChQrnSG7Lh7O58EarbHrPFJc
	l0TX3BYq6cHJexIHp342XKOhEVsKiv7ss7kqQrZDeoGiarqJG7zfKOUlmggN8foG57K3
	Pxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=K2+W4h/RPD38OVzmC5wE6yyxOlfiGEhoMFfYb6Spy9k=;
	b=kSomQrN3HthA5/wuknn7BTRRa1rEbOVR6liB3y93B9aVWKbqx2YqRJjHmPTSbkrKKY
	iGxhigpOs87Pra97em3HYwR1WkgH4dTQNGWALatHTaf27iHw/VG77ZRgKQ7bhPtFwyhd
	thopO/oxox2WT1QnlGockrSYzBPmH/7djMZiVkxsM6UqWRz3yagTfyi0pGXi79PJlwJn
	UtG5dp6z/Oe8UKw+/jjesEcHuSd2jAZE1vD/dWZ41mQAAhkNdQjWAVy7ZuQjpHaixjuY
	NUyMOIVDmVL2NUo2k6H007Qzk/vID/SbDwUXiWCGCivNFbzjqmjDayyjHQkPdMUCTyS0
	uRcw==
X-Gm-Message-State: AEkoousSEh6p8rNDXnAPhzOya6q2IZjIXEQMrh2EHEImGgCYyjcXTQa950FQhZ7LDM9mzQ==
X-Received: by 10.66.100.162 with SMTP id ez2mr15280721pab.123.1471625491832; 
	Fri, 19 Aug 2016 09:51:31 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	n10sm12855113pap.16.2016.08.19.09.51.31
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 09:51:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471604893-5003-1-git-send-email-awais_belal@mentor.com>
Date: Fri, 19 Aug 2016 09:51:33 -0700
Message-Id: <8C181B3D-740A-4AA4-8619-2CB5E1CE3250@gmail.com>
References: <1471604893-5003-1-git-send-email-awais_belal@mentor.com>
To: Awais Belal <awais_belal@mentor.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] asciidoc-native: add dependency on docbook-xml-dtd4-native
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
X-List-Received-Date: Fri, 19 Aug 2016 16:51:32 -0000
X-Groupsio-MsgNum: 85988
Content-Type: multipart/signed;
	boundary="Apple-Mail=_39D73F40-0EA4-4032-9A51-BE2EB3F8AC9B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_39D73F40-0EA4-4032-9A51-BE2EB3F8AC9B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 19, 2016, at 4:08 AM, Awais Belal <awais_belal@mentor.com> =
wrote:
>=20
> During the compilation phase asciidoc runs a2x for validation
> of some xmls which in turn invokes xmllint with --nonet
> parameter that requires DTDs to be available locally in order
> to succeed otherwise the do_compile fails.
> We now add a direct dependency on docbook-xml-dtd4 so the
> DTDs are always available locally.
>=20
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
> meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb =
b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> index 1500b0a..7597c0e 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> @@ -16,5 +16,6 @@ SRC_URI[sha256sum] =3D =
"78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323ca
> inherit distutils autotools-brokensep
>=20
> export DESTDIR =3D "${D}"
> +DEPENDS_class-native =3D "docbook-xml-dtd4-native=E2=80=9D

Make it DEPENDS_append_class-native

> RDEPENDS_${PN} +=3D "python"
> BBCLASSEXTEND =3D "native"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_39D73F40-0EA4-4032-9A51-BE2EB3F8AC9B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3ORYACgkQuwUzVZGdMxSwTwCcDz+zG6neoVRElZkWLHdWJDu2
0qQAoIuZ936wZPrVIzBTDJ0el4WfA4yP
=r8wD
-----END PGP SIGNATURE-----

--Apple-Mail=_39D73F40-0EA4-4032-9A51-BE2EB3F8AC9B--
