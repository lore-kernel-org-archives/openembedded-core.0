Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4367570D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 06:30:35 +0000 (UTC)
Received: by qgg60 with SMTP id 60so13577550qgg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 23:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=x/7ggGa4ONgpZZfPUmk7860vZM7xe4siaHkulgFo4ao=;
	b=UB3iBHYtwgdzTwVvrF7UpRVQ1ONIUyPs+kTcjHL8+cI3j9VJ2DjQpRvR5qNxwZWgO3
	7hn9O/gif4SfZvFlwTokqV4K30l3JaCca8cYqH4SWd626tjcf5cdJQ7iKJbsgJd7pPr+
	0AIkeQx5f5oECfzZk1L5fodYP1ewpBH2rpe43NtVSAjfDCb/YNUGtDJQqRNRuCxGU7Dr
	80/KwjONybU5MsU8OHOEO3b/Fm+Vet97vKKlbgWXstM2hshBA+eczj6LPhP9yTOLuTxS
	Rv5445eq4O3hblfngKtoUdmbqpzE4j0xcc2hCz4LuKGgB6hNePrt9y1xiwBesYuMiITA
	rFCA==
X-Received: by 10.55.40.92 with SMTP id o89mr52677014qkh.74.1433399436403;
	Wed, 03 Jun 2015 23:30:36 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:243b:97d2:82f:b7e8?
	([2601:9:3580:84c:243b:97d2:82f:b7e8])
	by mx.google.com with ESMTPSA id o65sm1870042qge.34.2015.06.03.23.30.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 23:30:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 3 Jun 2015 23:30:28 -0700
Message-Id: <1640EBA1-D4F4-4878-810B-4F968E8D871C@gmail.com>
References: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] python-numpy: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 06:30:40 -0000
X-Groupsio-MsgNum: 66298
Content-Type: multipart/signed;
	boundary="Apple-Mail=_698FA549-4B5B-404E-BAB4-543B8AB522C0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_698FA549-4B5B-404E-BAB4-543B8AB522C0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2015, at 8:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/python/python-numpy_1.7.0.bb | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb =
b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
> index d4fd279..28ad97f 100644
> --- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
> +++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
> @@ -30,6 +30,10 @@ CONFIGFILESURI_i586 =3D " \
>     file://config.h \
>     file://numpyconfig.h \
> "
> +CONFIGFILESURI_i686 =3D " \
> +    file://config.h \
> +    file://numpyconfig.h \
> +=E2=80=9D


can we use x86 override instead ?

> CONFIGFILESURI_x86-64 =3D " \
>     file://config.h \
>     file://_numpyconfig.h \
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_698FA549-4B5B-404E-BAB4-543B8AB522C0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVv8IkACgkQuwUzVZGdMxQEKgCfTxTREkkICqkCgRLp9QPIstWR
/fYAnRuoLzlId0Nl/nQUGnhdtogQdsQv
=+88O
-----END PGP SIGNATURE-----

--Apple-Mail=_698FA549-4B5B-404E-BAB4-543B8AB522C0--
