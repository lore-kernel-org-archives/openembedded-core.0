Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id AEC8F6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 00:27:50 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n5so187656108pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 17:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=a7PLUps9S6hpnt9APOL1N+104WDRnyDLtJitgSvfxnQ=;
	b=eyzgNVo5CkbpxzOtvZDZuoQkO7WGytmGAta7RQidZIaqD+QpOCFdQcTGGYVCXSY2jn
	lMfthkJcqjuWSZoPqI0p+vzYp8QUaHw/Jvx1DeQSM5w6Qv3fQFDjtYX/P4SQ8jBTtaXU
	qQ0X3nbULzPaTHFEASl1u1dVGbeFA688L/KI7L9w0Hl6p+3UeBD1qrZaHmh+Y9QSYrgz
	+e1wXWUAWcf5QsJD4R/cFQP/54oLszYj05K+9EIg9hZSb4j0QSxdQshO1JiZYXq0l0ZB
	5lDoEwM6nj8MC79BKsCAZIeod19h0+yQSerfqcFm68/v9knkNG4YkPLZBoP1cW+5XvHF
	SGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=a7PLUps9S6hpnt9APOL1N+104WDRnyDLtJitgSvfxnQ=;
	b=S2aJCgRk0u3eJex1nb/ZGotmfBxEUkZAgHgawJeANs48WCOCgm7zMx13w9FBfbrgiP
	ryXeaa93F+0pwukLPeH96PBPNYTsrw95T5ImtD3zcrQTHKUbjmgjyt28Ut9vtOLa+cOV
	XMA/h+McUjwbtKn4O4PUlfChPYnKr8mSNGihfXebVWKxR2CJNbEsoy09i0ZbOJClk14L
	E9SVlfDPA5Sgt92smpHcmvHIt+jfokARecpILhFoygqmiQfnJuGgCISz4XPjfZWA55H0
	5m0uTTSNabWdOT1CSiQmLqOSd+fEXNtSTBg6zPKVIzCS6Sy9DYKy8HNW8M9aX10mtQN4
	yV+w==
X-Gm-Message-State: AD7BkJIXMC1jBxkulv/638yOna0ObLh6vIAHJHA64c1mabyHpLDzItfOZU2MKd0ZdLjvjQ==
X-Received: by 10.98.72.149 with SMTP id q21mr27867361pfi.148.1458347271161;
	Fri, 18 Mar 2016 17:27:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:79ad:121d:e03f:5232?
	([2601:646:8800:5a9a:79ad:121d:e03f:5232])
	by smtp.gmail.com with ESMTPSA id
	by3sm23570977pab.39.2016.03.18.17.27.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2016 17:27:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1458306806-17511-1-git-send-email-armccurdy@gmail.com>
Date: Fri, 18 Mar 2016 17:27:49 -0700
Message-Id: <F866595E-231E-48DD-B7FB-F0D3E89CC3DB@gmail.com>
References: <1458306806-17511-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-runtime.inc: set LICENSE for all gcc-runtime packages
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
X-List-Received-Date: Sat, 19 Mar 2016 00:27:50 -0000
X-Groupsio-MsgNum: 79824
Content-Type: multipart/signed;
	boundary="Apple-Mail=_520DA74D-2288-4303-AB97-BF0CBD9E63ED";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_520DA74D-2288-4303-AB97-BF0CBD9E63ED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 18, 2016, at 6:13 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> LICENSE_${PN} doesn't apply to all gcc-runtime packages. Set LICENSE
> instead. Without this fix, gcc-runtime packages such as libstdc++ are
> excluded from rootfs for builds which blacklist GPLv3.
>=20

this is ok

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 572396d..8639c1c 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -1,5 +1,9 @@
> require gcc-configure-common.inc
>=20
> +# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
> +# All gcc-runtime packages are now covered by the runtime exception.
> +LICENSE =3D "GPL-3.0-with-GCC-exception"
> +
> CXXFLAGS_remove =3D "-fvisibility-inlines-hidden"
>=20
> EXTRA_OECONF_PATHS =3D "\
> @@ -109,11 +113,6 @@ PACKAGES =3D "\
>     libitm-staticdev \
> "
>=20
> -LICENSE_${PN}-dbg =3D "GPL-3.0-with-GCC-exception"
> -LICENSE_${PN} =3D "GPL-3.0-with-GCC-exception"
> -LICENSE_${PN}-dev =3D "GPL-3.0-with-GCC-exception"
> -LICENSE_${PN}-staticdev =3D "GPL-3.0-with-GCC-exception"
> -
> # The base package doesn't exist, so we clear the recommends.
> RRECOMMENDS_${PN}-dbg =3D ""
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_520DA74D-2288-4303-AB97-BF0CBD9E63ED
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbsnQUACgkQuwUzVZGdMxQCygCcCgZ/YegmkAg87PKjEwKS2jHj
8N0An06rY7UiVz2+CtxuSV3yMMtQyGKK
=PLRO
-----END PGP SIGNATURE-----

--Apple-Mail=_520DA74D-2288-4303-AB97-BF0CBD9E63ED--
