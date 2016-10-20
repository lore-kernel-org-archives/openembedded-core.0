Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F1F1A71BEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:00:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r16so4068793pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=cZwZ9XS53X2akjFfCk4JdZhECZiaeZ2m6ooFDXvZtzE=;
	b=o6OFR/BPabp4aKi7ud//teTAujFMB8KXTQYAm1ZkBTiW3EYAGwLVmmwd3H150lOTBv
	G4I7UWQ3A7cowp/Y0wk6m5jcVusR26vLaZUnh7JpLvdb3G4PwLUEMLtC3Gte2xPcmdT5
	LmUOpq8ow0YnZtT+hVLlCw8z4KGCLy1DpX+edKBX2c4L3J3/XzrXbc+xCylivqLVOmq7
	H8ec/QAM6By4LDdcJrAkmO9Ccpn09cYyVqFdeRYx3tGrDuS+2KN+BsiFATMYWNasfVKg
	x20FcurKwfwDVJow4ZHqvJxD0KltXHr9wi+YDYD/T5mE8yRknLhZJj3tBdo9Ou6G8xZM
	65qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cZwZ9XS53X2akjFfCk4JdZhECZiaeZ2m6ooFDXvZtzE=;
	b=f8E3pBInE01pMysVJvE60R2WY9/euYNUz9WSEY+DLJkPFWGe0UYHY+N42A5LQsHke5
	Ww0D1kT0Fs6P5/FuFJ+kF3Ru2GMGtrQJt+ABL9KlhNKGlDmz/NlOhS5/tuFNcUUeIiNm
	vrbzdPwRD6KVNzBBI5XNJ9HQET3ucdXc6C5N7HzF3TB3pvD5EFp3eCP7Sm3jAirgY1g5
	UzyzkxF2VXlGXBaOctzlf9zrdcTxXMobgxm3FfSZqCos68F6wHis1FKOj4w08Tkgf/wn
	MlkO4ytCUXWhoVcDG2lIXcKxuaJuJeuRbmYfv3cDMwjBJ9CcI2/tr1L9GDJVqGf45H85
	TWWQ==
X-Gm-Message-State: AA6/9RkcT4YFr77F7gIPXmr/yzROdntRxpCxXnL+JhrA3iYSWXDuR2ZgH2jdaz+1mhu9Xg==
X-Received: by 10.99.115.18 with SMTP id o18mr14238073pgc.44.1476932416558;
	Wed, 19 Oct 2016 20:00:16 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:e0c4:8ac9:c93b:f22d?
	([2601:646:8882:b8c:e0c4:8ac9:c93b:f22d])
	by smtp.gmail.com with ESMTPSA id
	yu9sm7548504pab.15.2016.10.19.20.00.15
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Oct 2016 20:00:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Wed, 19 Oct 2016 20:00:12 -0700
Message-Id: <432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
References: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain and meta-toolchain-qt for specific image
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
X-List-Received-Date: Thu, 20 Oct 2016 03:00:16 -0000
X-Groupsio-MsgNum: 88405
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8336AB1C-9C25-43DF-86C2-AB80DC268A37";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8336AB1C-9C25-43DF-86C2-AB80DC268A37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 19, 2016, at 1:19 AM, thilo.cestonaro@ts.fujitsu.com wrote:
>=20
> Hey!
>=20
> I want to create such a nice toolchain installation package for my =
image recipe.
> The problem I currently hit is, that I need to do populate_sdk and =
populate_sdk_qt5 to have qt5 toolchain too.
>=20
> Now I had an idea to create a recipe for the SDK like:
>=20
> ----------
> SUMMARY =3D "Meta package for building an installable toolchain"
> LICENSE =3D "MIT"
>=20
> PR =3D "r0"
>=20
> inherit populate_sdk populate_sdk_qt5
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94


what is the advantage of such a recipe?
>=20
> But how can I tell the recipe to additionally install all the "*-dev" =
packages which my original image recipe installs.
> When I require the image recipe, the toolchain recipe does a do_rootfs =
task (which is not needed, as it is done by building the image).
>=20
> I read something about TOOLCHAIN_TARGET_TASK and adding all the =
"*-dev" packages I want to this. But that doesn't work.
>=20
> Any hints?
>=20
> cheers,
> Thilo--
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_8336AB1C-9C25-43DF-86C2-AB80DC268A37
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgIM0AACgkQuwUzVZGdMxSPYQCfVBCqnK1PLUPw4/UfVuhu+1S+
FLsAnj5/NyJTkfc5pEyw6BedxOvGsvvn
=wkLt
-----END PGP SIGNATURE-----

--Apple-Mail=_8336AB1C-9C25-43DF-86C2-AB80DC268A37--
