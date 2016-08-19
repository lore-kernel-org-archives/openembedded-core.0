Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 617BD731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 17:05:59 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ez1so3682342pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=lRgxlks6IJSJeP07JR74KRFxtrlw9SMVjYXJCy29BA4=;
	b=fUwFqe7LRtNC3w9jRb6zFmIYZjaKX4JO6Erym9jyjyNJRYEUagWFBRKP8dd1ItUmJA
	IJlymtmcaNdpnMDoI7aCsB9bUQlRsWHxvPeKRsnKW2Zjh2OA6BEgTNjVTH0ykI9U1lxK
	9FmW4RNKXfVmEUPpPUb7bYwxqdivX2aYBnJlKStNufKMdD1iGwlJuDczVQJWgkizOZXI
	1/B0CGhJp+Ku/VUTtQ+2bZFfspWjkgWo/1y7DK3mcJVK3td+fLyUXUoDKFANEad1KhlF
	ViN6OZrq3LViTdpQD78TtHZ4wVA8rpMrpObf6Pb8CcxztMGX1w6+K2fty6ahyWlICYUQ
	U/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lRgxlks6IJSJeP07JR74KRFxtrlw9SMVjYXJCy29BA4=;
	b=UEZI6OBfqLGMr85pEeydejuMy7IG2A1gQUNgMJE+WnYBZR4BROAhlvJ58WPBLq8jUd
	gJMxZNJhA/nJOy9PSoPWqILzoLITj48mdhzpJjUQcDVEnuNybRsE97lQgytqZAUoFk43
	zgqRWGcAg9OdvMK3hqL3gf81YRx9wpvihZLoldraL94lmW7IUrycwrOBKRxVG/8zgbxA
	uqoLEpV5iB42YHlPEzOkEKrDFZJMJhFp8G1tf/CSv61tO533ev7Bu6DrGOkm16ene/As
	FYaXMSowGFHPupnKnej2ASCal0tdyPGAHoxUmNQVnktTMJHzqKjvpEwFVwisGlwtcDUX
	zc/Q==
X-Gm-Message-State: AEkoousJg/rwDmtfRAVIkAMvY9lWl1Y1O9L6UIKB7qZl2S9fEVytbgOR+HD+iLXfMPzKtA==
X-Received: by 10.66.145.73 with SMTP id ss9mr14602954pab.82.1471626359559;
	Fri, 19 Aug 2016 10:05:59 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	t126sm7935458pfd.28.2016.08.19.10.05.58
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 10:05:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3d0c1a2e16f3e7d08d2be97a4b9540f0ba713e94.1471620482.git.joshua.g.lock@intel.com>
Date: Fri, 19 Aug 2016 10:05:57 -0700
Message-Id: <BC909AA0-A8C7-4B7F-B23F-4090F5E13A85@gmail.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<cover.1471620482.git.joshua.g.lock@intel.com>
	<3d0c1a2e16f3e7d08d2be97a4b9540f0ba713e94.1471620482.git.joshua.g.lock@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] security_flags: remove invalid linker option
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
X-List-Received-Date: Fri, 19 Aug 2016 17:05:59 -0000
X-Groupsio-MsgNum: 85990
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0710259F-E00A-4D58-A618-3B0DC3C73776";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0710259F-E00A-4D58-A618-3B0DC3C73776
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 19, 2016, at 8:34 AM, Joshua Lock <joshua.g.lock@intel.com> =
wrote:
>=20
> -fstack-protector-* is a compiler option, not a linker option.

IIRC There are packages
who do not use CFLAGS in linker cmdline which case this fails

what issues do you see with this option appearing in ldflags ?

This should be tested with world builds on both musl and glibc


>=20
> [YOCTO #9948]
>=20
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
> meta/conf/distro/include/security_flags.inc | 9 ++-------
> 1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> index 20f48de..77fade6 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -15,8 +15,8 @@ SECURITY_STRINGFORMAT ?=3D "-Wformat =
-Wformat-security -Werror=3Dformat-security"
> SECURITY_CFLAGS ?=3D "-fstack-protector-strong -pie -fpie =
${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong =
${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>=20
> -SECURITY_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro,-z,now"
> -SECURITY_X_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro"
> +SECURITY_LDFLAGS ?=3D "-Wl,-z,relro,-z,now"
> +SECURITY_X_LDFLAGS ?=3D "-Wl,-z,relro"
>=20
> # powerpc does not get on with pie for reasons not looked into as yet
> SECURITY_CFLAGS_powerpc =3D "-fstack-protector-strong =
${lcl_maybe_fortify}"
> @@ -100,11 +100,6 @@ SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
> TARGET_CFLAGS_append_class-target =3D " ${SECURITY_CFLAGS}"
> TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
>=20
> -SECURITY_LDFLAGS_remove_pn-gcc-runtime =3D "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-glibc =3D "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-glibc-initial =3D =
"-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-uclibc =3D "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-uclibc-initial =3D =
"-fstack-protector-strong"
> SECURITY_LDFLAGS_pn-xf86-video-fbdev =3D "${SECURITY_X_LDFLAGS}"
> SECURITY_LDFLAGS_pn-xf86-video-intel =3D "${SECURITY_X_LDFLAGS}"
> SECURITY_LDFLAGS_pn-xf86-video-omapfb =3D "${SECURITY_X_LDFLAGS}"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0710259F-E00A-4D58-A618-3B0DC3C73776
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3PHkACgkQuwUzVZGdMxStgACcDcdvIAGVNZxf+k9AgKkFj3JJ
W98An1U72Z3Pv6PmkpjR0G9CajggrScK
=QbC5
-----END PGP SIGNATURE-----

--Apple-Mail=_0710259F-E00A-4D58-A618-3B0DC3C73776--
