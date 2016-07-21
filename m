Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 459D670178
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 03:22:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so4596198pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 20:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=7Lh51mmN6IfQ/lB5G36CekX9DybeFhbjkdRpGRLaKaI=;
	b=hqQFl/BTt4HvG+s5CM29Ie6RpFuSfHNdNPn0VkeCgOappFG4HXXM0H9XgQrcyIOcJz
	zoXmc7DtiTXuc4ghdPaZEdrtnNqPLLGe3RwmeAFoZxF5cIWz2dQNGEkdZNrnSRVKd5qe
	GQx1Etww5K8buw40WyvX1oS/O6MbHcHOYxNnBd8G7Jc+w3/ZHcmAUbldgakxB4RkJAYX
	XQfZhCEjnWVppb6RDuelk9mQoPI7qSUsiRzT9jnw1jrZrwGv7Q9FQDgdO94QWeDDyNN7
	7uOHtR3brajpWjf6DPztZDJvZhQBv3c5bKcVEuI8k9qIPo8A7GVl+dt6KHyRseLq5g9B
	2XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7Lh51mmN6IfQ/lB5G36CekX9DybeFhbjkdRpGRLaKaI=;
	b=GMmMWrCY3P4gvcLU4/3502Tg+nDRdoX/LFzV9QJxdZFqwivsjJhZlPGzkq+DAC5Uuo
	PNklYSU4+yeUzA7JhJn5jcQbVBo9XO8goDNJ4BBFLMBs4Ch78KeQ2OE9TCRmpeWreWYp
	91WFVYb3fxILMas7TdjFlC4ZhfBmWjxg+h8M6Wpqndc7cysHgjvz6ykY0fm2hk60cfbQ
	Ca0D5zzEIp9jmDmonXnMY1jdYlG6e3HJWQ7fp5VMeJiIO2jfM8MVPCrknH2oYN74cWQa
	7JFX4L7vCAuHRRHgzgJA6rSSKqZ+7/cLt7u0Q7ZO8kAT8w4wpVm12ETDrfDZvd7+pigw
	oKug==
X-Gm-Message-State: ALyK8tKF+U7TcJFM/0b3Vj/orQaz/ynuuqwJnvDmxW6AoM8gcxJ+MaDaN4Qu2TODWWSWmQ==
X-Received: by 10.98.201.138 with SMTP id l10mr34286076pfk.77.1469071347128;
	Wed, 20 Jul 2016 20:22:27 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:e800:ab06:7d73:85ce?
	([2601:646:8882:b8c:e800:ab06:7d73:85ce])
	by smtp.gmail.com with ESMTPSA id q4sm7663968pfb.18.2016.07.20.20.22.26
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 20:22:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469071188-26218-1-git-send-email-git@andred.net>
Date: Wed, 20 Jul 2016 20:22:21 -0700
Message-Id: <76D6B136-02D8-404A-8AB1-3F236ABAB58D@gmail.com>
References: <1469071188-26218-1-git-send-email-git@andred.net>
To: git@andred.net
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] musl: don't compile in mips16e mode
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
X-List-Received-Date: Thu, 21 Jul 2016 03:22:28 -0000
X-Groupsio-MsgNum: 84745
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B8378625-D4B1-482C-9541-9E5012BB9DE6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B8378625-D4B1-482C-9541-9E5012BB9DE6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 20, 2016, at 8:19 PM, git@andred.net wrote:
>=20
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>=20
> musl contains hand-written assembly which is not compatible with
> the MIPS16e mode.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
> meta/recipes-core/musl/musl.inc | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/musl/musl.inc =
b/meta/recipes-core/musl/musl.inc
> index 5e6cd01..276b00f 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -24,3 +24,6 @@ FILES_SOLIBSDEV =3D ""
> FILES_${PN} +=3D "${libdir}/lib*${SOLIBSDEV}"
> INSANE_SKIP_${PN} =3D "dev-so"
>=20
> +# Doesn't compile in MIPS16e mode due to use of hand-written
> +# assembly
> +MIPS_INSTRUCTION_SET =3D =E2=80=9Cmips"

Looks ok. However, does it make sense to have it compiled with mips ISA =
for a mips16e
part ? will it work in all cases or only certain SOCs

> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B8378625-D4B1-482C-9541-9E5012BB9DE6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleQP/EACgkQuwUzVZGdMxQjswCcCqh/Nmt03H1FQQleSadlQXtY
ArUAn2Zhm/gAsplmjARp//oQ5aLsy6C6
=yHMb
-----END PGP SIGNATURE-----

--Apple-Mail=_B8378625-D4B1-482C-9541-9E5012BB9DE6--
