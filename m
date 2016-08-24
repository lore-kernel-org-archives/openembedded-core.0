Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D1A5B6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 00:50:11 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so101192pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 17:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=qk7rLLfmLhsDnPp96r90JiYZWTtkL+XzvTokjpbmdy4=;
	b=fv5VtyHg0PE3i0z2cqbZbCGQ+/5yJ/UUm8MyiH4skT2WBcKzRUN2KiWRSL2+pUj8rL
	DYzB5q17f5urI61OpbsJL1BOoJD2YM9YvXLUjnR43hBBhNe1QsYhz6p7Css46LXkThVw
	i92AqxD40D5z/mjQIRBokCcZc7HDpe8QSUj73La6wQ2HYO7OV+qoAL2ujmnLa03FKdT6
	5C8sG2eftuy9RiQPtqZNAPDuAdHDLJMG5EMstfsSreJgvbVPC8lEJAqPuDKiUzu1piLY
	sCdHoI2E/LzfICSnL5Yf0EjiuDH8pV1W9qo6Z6Cwyu/Isy/QMihD6iUFoZ+Odsx1ORVq
	wdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qk7rLLfmLhsDnPp96r90JiYZWTtkL+XzvTokjpbmdy4=;
	b=Duv4kxvabqtYoVb/M9uxCCCxnJxR2q/gRWgSM6jijpVwq1Tq7vFPzJIWhAWSErMSiV
	LHpCc/trdymYBxmJx/MeQ78niDesUsCn/h4s3dglNKcvRXgyTCjVAto7pxr27TSnThQn
	TAp9gj9eCT0UPpdRCjCP82/VmdvAEAIkjHj9t9UbLlUgMFTXaVjgwgcAbrlJ/ocCaNmd
	FhT74hMPF62jEW5Q9LhU9DibMinZca+Nx2sbpmhQMxrb8T8yuIIUa884D+tsTB4ztkSQ
	MQw/BCS38IXdWPzd6mrTULRJaQHHFUNUv584Y3nOUe6/vkhlXG1FMtIvWHauFuKHO81+
	S0hg==
X-Gm-Message-State: AE9vXwMt/PEd9tdne78BzUxQ1HL4EExO1oRZtDOVbu9SeGHat/+2LUAgiLsx6tNcou76HA==
X-Received: by 10.98.60.217 with SMTP id b86mr453482pfk.129.1471999811061;
	Tue, 23 Aug 2016 17:50:11 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1187:df8a:ad13:273d?
	([2601:646:8882:b8c:1187:df8a:ad13:273d])
	by smtp.gmail.com with ESMTPSA id
	o80sm8448874pfa.67.2016.08.23.17.50.09
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 17:50:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <9bf820ce898dc5e0127b0108efb64f7095887732.1471936926.git-series.jeremy.rosen@smile.fr>
Date: Tue, 23 Aug 2016 17:50:27 -0700
Message-Id: <9301FDF2-F2EB-414C-A671-9B87ED5F0D3C@gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9bf820ce898dc5e0127b0108efb64f7095887732.1471936926.git-series.jeremy.rosen@smile.fr>
To: =?utf-8?Q?J=C3=A9r=C3=A9my_Rosen?= <jeremy.rosen@smile.fr>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] [autotools] export CCLD_FOR_BUILD
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
X-List-Received-Date: Wed, 24 Aug 2016 00:50:14 -0000
X-Groupsio-MsgNum: 86193
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BB48B67B-7DBC-40A8-A40B-BC0CF881B1A4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BB48B67B-7DBC-40A8-A40B-BC0CF881B1A4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 23, 2016, at 12:25 AM, J=C3=A9r=C3=A9my Rosen =
<jeremy.rosen@smile.fr> wrote:
>=20
> The autotools class already export most *_FOR_BUILD from bitbake's
> BUILD_* variables. Somehow the variable CCLD_FOR_BUILD was missing
>=20
> At least libpcre uses that variable and will use gcc instead of =
BUILD_CCLD
> to link binaries
>=20
> Signed-off-by: J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr>
> ---
> meta/classes/autotools.bbclass | 2 ++
> 1 file changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/autotools.bbclass =
b/meta/classes/autotools.bbclass
> index 076899c..9041021 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -49,6 +49,8 @@ export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLAGS}"
> export LD_FOR_BUILD =3D "${BUILD_LD}"
> export LDFLAGS_FOR_BUILD =3D "${BUILD_LDFLAGS}"
>=20
> +export CCLD_FOR_BUILD =3D "${BUILD_CCLD}=E2=80=9D

if its used by just one recipe then its not worth abstracting it out. =
Perhaps
fixing
=
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes=
-support/libpcre/libpcre/pcre-cross.patch
is another option ?

> +
> def append_libtool_sysroot(d):
>     # Only supply libtool sysroot option for non-native packages
>     if not bb.data.inherits_class('native', d):
> --
> git-series 0.8.9
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BB48B67B-7DBC-40A8-A40B-BC0CF881B1A4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAle871gACgkQuwUzVZGdMxTszQCfaMYP54MUmdMq9X+gzCgthEiY
DqoAl0Lre97hBwo3hzea61cIOXy35vs=
=Ews6
-----END PGP SIGNATURE-----

--Apple-Mail=_BB48B67B-7DBC-40A8-A40B-BC0CF881B1A4--
