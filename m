Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id DF36D76DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 15:58:46 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id r5so33986996pag.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Z/Ys6KwKAPkcAta6FmroH9bQ0TeBJI17LIfeRKxUGok=;
	b=OZp2UcVZkYNUM5SAL0WNrDRoTyl6WV7Eq1dG3+icuLxI7JZlYrT7/bhb3eMV9Iyn3E
	hxzVTCzPS19N+Q1pDMd7Sda/MIxPxWffzfffnizFIqlLm/oXHHyVabbueAW7D4WYdi53
	gXoWM+47Zk8Wok8+PjYAvhK1R44aT7K3t8InJ+7fh7BBtoK8hd+TefWTqfKE1f0FP2ES
	Irz132Nqf7+bB7gRIVPV7QDJZd7CibnZScgTuSpNHl+vuGSUgwA0Px5agzrMleP4kzBx
	+mfbe31CIEpMzZvVeq4Fn7o3ZhbpLHaHzarJHu3i/4x95KwY/4GCzk5Nh2lhHDb0YJeJ
	cakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Z/Ys6KwKAPkcAta6FmroH9bQ0TeBJI17LIfeRKxUGok=;
	b=dCXgWYcdG6OcSRe0zGfYcNog7YaJrk0WZzZ5szlvKeL/3ysPRdU+7WFv9Qmr+srVRY
	2HfGDxLGMIHs2yV+AhBwHQlSvMpGr/mrcs6EY/fC7ROzQZC89lww5ARjZ1UT41+5L3Xk
	mmhqB39EPl2HIe06JKFq9GApr/CafauxMqO9hKsh22rdJRmZ1CpZDeK6sZKr91/kcoSH
	rgw8JYttXwEV+cuqGf03C72H0J81ddKzJ2usoB3gglrLSOuQZx4h8ffIqoeR2PJqr+qU
	LprqAV1NLaRbzMJaTHygBW0rLs2gpbTbMw03KCVPfKWijMxplqOpv3hSJ0H4gwZc1ma5
	Hj2A==
X-Gm-Message-State: AOPr4FUIX5lmnqw8H3nK2FtyD6g3BPFVoO1/aD+VfTGJIR9qpNXNvCM+qu5mqFRG15Tx3A==
X-Received: by 10.66.63.98 with SMTP id f2mr21868280pas.123.1461859126894;
	Thu, 28 Apr 2016 08:58:46 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	rw2sm16377448pab.30.2016.04.28.08.58.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 08:58:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
Date: Thu, 28 Apr 2016 08:58:41 -0700
Message-Id: <996BAFC5-CEC6-4296-A8BD-E7EA383A754F@gmail.com>
References: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] security_flags: turn potential string format security issues into an error
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
X-List-Received-Date: Thu, 28 Apr 2016 15:58:48 -0000
X-Groupsio-MsgNum: 81372
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DFDE65F7-A100-43CF-BCFE-82AB07A56C9C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DFDE65F7-A100-43CF-BCFE-82AB07A56C9C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 28, 2016, at 6:27 AM, Joshua Lock <joshua.g.lock@intel.com> =
wrote:
>=20
> -SECURITY_CFLAGS ?=3D "-fstack-protector-strong -pie -fpie =
${lcl_maybe_fortify}"
> -SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong =
${lcl_maybe_fortify}"
> +# Error on use of format strings that represent possible security =
problems
> +SECURITY_STRINGFORMAT ?=3D "-Wformat -Wformat-security =
-Werror=3Dformat-security"
> +
> +SECURITY_CFLAGS ?=3D "-fstack-protector-strong -pie -fpie =
${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> +SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong =
${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>=20
> SECURITY_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro,-z,now"
> SECURITY_X_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro"
> @@ -92,6 +95,23 @@ SECURITY_CFLAGS_pn-zlib =3D =
"${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-ltp =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-pulseaudio =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> +# Recipes which fail to compile when elevating -Wformat-security to =
an error
> +SECURITY_STRINGFORMAT_pn-busybox =3D ""
> +SECURITY_STRINGFORMAT_pn-console-tools =3D ""
> +SECURITY_STRINGFORMAT_pn-cmake =3D ""
> +SECURITY_STRINGFORMAT_pn-expect =3D ""
> +SECURITY_STRINGFORMAT_pn-gcc =3D ""
> +SECURITY_STRINGFORMAT_pn-gettext =3D ""
> +SECURITY_STRINGFORMAT_pn-kexec-tools =3D ""
> +SECURITY_STRINGFORMAT_pn-leafpad =3D ""
> +SECURITY_STRINGFORMAT_pn-libuser =3D ""
> +SECURITY_STRINGFORMAT_pn-ltp =3D ""
> +SECURITY_STRINGFORMAT_pn-makedevs =3D ""
> +SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
> +SECURITY_STRINGFORMAT_pn-stat =3D ""
> +SECURITY_STRINGFORMAT_pn-unzip =3D ""
> +SECURITY_STRINGFORMAT_pn-zip =3D ""

Can we use _remove operation instead of introducing a new variable and =
emptying it out here.

--Apple-Mail=_DFDE65F7-A100-43CF-BCFE-82AB07A56C9C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlciMzUACgkQuwUzVZGdMxSTxQCfc5tG9onUZaZboQJcnyqykQmN
EYgAn3TnauPq+BJPUBY1hDSdSzIoS+Ad
=O7Tb
-----END PGP SIGNATURE-----

--Apple-Mail=_DFDE65F7-A100-43CF-BCFE-82AB07A56C9C--
