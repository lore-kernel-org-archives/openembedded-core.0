Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA0E460720
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 18:20:53 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id d1so10124390edd.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pQ1EaLcrdY8N6d0cILlTXeWRi6P24/qU0n1ejAwHGWk=;
	b=WoiwIxDNPMLPIL8n5Vej/U46bnbroisXV3DqJ18jyHvNKgx0XGMEYSYvVxiZL87p65
	mTkZMSTJAtwGRN4amp8sPcOsYQgzeCwqJnrYz8oauF3g7W8b0Cfqhz0qznBTMghY4XPL
	mR1w7cIBWIRsDq3rz/GyWIw704X9phJbnOAUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pQ1EaLcrdY8N6d0cILlTXeWRi6P24/qU0n1ejAwHGWk=;
	b=NoOv+LrrSCumqkW9lavsjEnxm6bD3aBDDCB2Vx0QSjlbYztSCR7OjarDK6CIyBxR/l
	i4ltz0DXdsQ80T74bVDvygDiHWlRbq1VB609jTQJgAT2XjkBfEicIis2a1coTqOGaMi1
	R8iRGImAw0ba7QSO7dvHrHUkFXjdI3dWr0T7xB55voHl5BiCg4vn6c+wUlDQs6e7ZB4F
	kwl1YBkRx8Lbvh2I3QoYIk+efBdhEB3jLtcmYb9ZlPvI3Eh0FUElIlH2LtQerYUek84B
	Fyz5Yf203/CfhmkRm01WMl4hM/rTmxujD17pvy9JVZVe62pJerT67H8bnSDs7DWe9ahM
	/nHQ==
X-Gm-Message-State: APjAAAV66whVeREwPt4wLrbNDw0ursaR1ZyhX3OTTF9cypC//EnKSUDV
	KQW5EnF9KQzAOsIqnhl4h5BSEg==
X-Google-Smtp-Source: APXvYqxKTD9PEeci+L71sP+2u0xND8VNsybcwH0t4XMI0hQxrTFwEjyaOS9P+LXKh56yXPBGgOc4mA==
X-Received: by 2002:aa7:c803:: with SMTP id a3mr1844323edt.24.1555957254797;
	Mon, 22 Apr 2019 11:20:54 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id u1sm3794675edx.69.2019.04.22.11.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 11:20:53 -0700 (PDT)
Date: Mon, 22 Apr 2019 14:20:49 -0400
From: Tom Rini <trini@konsulko.com>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20190422182049.GP4664@bill-the-cat>
References: <SL2P216MB028292C44E997FA682A1C8DADD260@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
	<CANNYZj_nwJpa_Yj-8_YYnu194c_3GSdb1iCg5EkDhXOCjh_ZzQ@mail.gmail.com>
	<307926a6c77f2ab0af46fa2f668b73bf4ddf0731.camel@gmail.com>
	<CAKmqyKNqNRumrm6Bf0EnSCQVKViZnF5buDG9TAuzz8rCMJLxpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNqNRumrm6Bf0EnSCQVKViZnF5buDG9TAuzz8rCMJLxpA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Mon, 22 Apr 2019 18:20:55 -0000
X-Groupsio-MsgNum: 123584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tNFNhJy5qXpRqqCt"
Content-Disposition: inline

--tNFNhJy5qXpRqqCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2019 at 07:37:27AM -0700, Alistair Francis wrote:
> On Thu, Apr 18, 2019 at 7:29 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > On Thu, 2019-04-18 at 14:16 +0200, Alexander Kanavin wrote:
> > > Can we take this opportunity to teach u-boot to use Python 3.x
> > > instead? oe-core is trying to eliminate Python 2.x dependencies
> > > everywhere.
> >
> > It looks like the libfdt code in u-boot currently requires Python 2, so
> > it would be an unstream change to convert it to Python 3. It also
> > appears to be compiling a C module to work with Python 2 so its
> > probably not as simple as "convert the script".
>=20
> Agreed, the u-boot Maintainers added a patch to specifically use
> Python2 recently so I think we are stuck with Python2 here until
> upstream u-boot is updated.

For which help would be greatly appreciated as we have a fair amount of
python2 stuff.

--=20
Tom

--tNFNhJy5qXpRqqCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcvgYBAAoJEIf59jXTHXZStKsP/AiwDf7Zkxdois7aOY5rJEA4
8cVgoUjMYPlupTBbym2Geb9jATI9EyYkZzclUxnMKNAiaozrN0F0YBNRZRJ8jkL+
N4btNqJ2PWcfZ+3wuv7rzNKExUC29UMpO5FkNup3FmcboEB3wlfY8a4JoHIJspbc
CcEU0xbv9gVpJ0sfvzohGOSywzoPs1+7MErSZ4DakV5VUSV4tLazSD0ZKmO+UW9v
5iQoBpKMAFiyO5/iUBbzD8daxeOw9lwttUfvX7YeNLzoMb4A5FfiU+ODnrRHrwko
APz10W/koj6qytI0sj2aXqLNgdggV4yNGvXBikhNMVQ/xvpanPOMalc0Botpm7z2
oLXZsOKkgfxvLgT0O8tjT4GLtwZ7fpbIiS1r/qaEaFzOQLgU80eQ6YkyIgp9LqSm
+crOeJD25IsAdCSirIb3CqEqtrAb0gF1T8zN89cYM5ba23QsT9OExqlac9zsRPxF
GZ4QijX7OL58/a2DSowsKSIkxYymqBghWlROi6VIji2llGQePtRx016VJ2UaTEJy
MucCjG6xSq71WHWU9vsz+Ng2Ueeb10hmngBFkp950tmmlLTn9lv6b8krQm+HvMGD
k6Nb/AhKo4lC451OYcVOp/8G4Vr0SItHj6YSQo3tgSwzRW+ILxazFOk3CoJhr2DG
vuEcUjBwiQRMV1WYgvLY
=vUWY
-----END PGP SIGNATURE-----

--tNFNhJy5qXpRqqCt--
