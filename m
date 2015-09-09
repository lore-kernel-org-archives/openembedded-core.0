Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id C5F11763CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 07:52:23 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so2670522pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=b1LE/3pigkg4z1VFN/ndQcyhq6SST/HQmOfa1F3O4wk=;
	b=GX7bBffsRJVUC1qUB5fovKPFa2NM1m0ApkfBNvveLt9SYfhuqkOsLaxw5PhZY850PG
	+8IiPupI1kvg7nfOi2GFIJA/XerY9hg34hXbQLyaQCZn47P0k7A5OJKgIhbTe+pnh6/h
	xQDGCgRsxjc5ELeJVP2pS8wtZmXCHPWyE47cr6e9HMkFLL4qhRut3lemt9byCZrtN3+i
	3gw5mtv9T1tp1qLUiIvBraOzQHg0JL9fe0USvkpOUBywEsccH/BXrQaMi4W/6WotV2UB
	FJLtZJ8d2iEJ3b4qwP/ngkO38sjceg1X87hFk+Kx2WxZc0TUxHA5Fpa3R9XLJh5tIgXr
	P1xA==
X-Received: by 10.66.235.226 with SMTP id up2mr28597174pac.89.1441785143914;
	Wed, 09 Sep 2015 00:52:23 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:17f:93e:50e6:541c?
	([2601:646:8601:4580:17f:93e:50e6:541c])
	by smtp.gmail.com with ESMTPSA id
	f11sm5955225pdl.73.2015.09.09.00.52.22
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Sep 2015 00:52:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71Wjw8W61iC_anLZCb2BFQxo0uxTRgKNnHpWYAJn-1xpizow@mail.gmail.com>
Date: Wed, 9 Sep 2015 00:52:18 -0700
Message-Id: <92D7A469-14E6-4E5F-835E-C90FF3300346@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
	<c89abf81c424d620a687f0c7bda8f74fcc0f5faa.1441753511.git.raj.khem@gmail.com>
	<CAP71Wjw8W61iC_anLZCb2BFQxo0uxTRgKNnHpWYAJn-1xpizow@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/16] xorg-driver: Fix logical && with bitwise and operation
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
X-List-Received-Date: Wed, 09 Sep 2015 07:52:24 -0000
X-Groupsio-MsgNum: 70888
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8B6E90A4-59D4-4233-AD2A-ECC81EF1C954";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8B6E90A4-59D4-4233-AD2A-ECC81EF1C954
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 9, 2015, at 12:44 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
>=20
> why are you adding a patch sent to freedreno mailing list (so I would
> assume against xf86-video-freedreno), in the xf86-video-omap recipe,
> is that a typo?

thats where it was sent to. since thats the same list omap driver is =
using as well.


--Apple-Mail=_8B6E90A4-59D4-4233-AD2A-ECC81EF1C954
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXv5TUACgkQuwUzVZGdMxTQSwCePLnTFxVcVUR993kSyQWeBZxx
KXUAoIxsiuZna6Ge72gaXRJuEMSSoaaR
=7ZyJ
-----END PGP SIGNATURE-----

--Apple-Mail=_8B6E90A4-59D4-4233-AD2A-ECC81EF1C954--
