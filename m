Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7DB6093B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:52:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so2408434wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kM40ovSIBq1gdxcj4Lz9o9HFF+f0O5WaP0HcU1/Sseo=;
	b=evRrGRJ+N0hY+eS2+FSvcbWeVnu01XUb5f5PFXDXK8nLHIjWarofnMZviW3sXab34H
	8Bd6WHJHjT49Jj+0MWlg+G9ON29RTZS6USUm8buEWch/An/DB80N0nglyk6CHpIblZZ0
	wLbu7zjLpKwIn5U+Gna+yr1j3ec6/HcPIOwZ9MfhQ/tZ4aajJRsGzFpECAXSYRW4qWuc
	BCaDuo25HxRVvrtFt6y4XND2B1uHOl5A+6AZCxgrmaif3kuWtmYXh6RI0xagEJ551JI9
	qOwx59mKu2tbi/4LYCT9jSIDI+6oeFDIaNNyUaxa+5sS+2wf87pO6rP9wB4iBAEsHdkF
	45Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kM40ovSIBq1gdxcj4Lz9o9HFF+f0O5WaP0HcU1/Sseo=;
	b=iiLtIVTbvtbNNSQBaEILdERhisCj6AkskuFuDhUcZSfp8OUWt8Q1P51olUCW4UwkQ8
	+IOh2S1Eyx246qAn92XtJIvnK5+17Zts6MZ22hA8CFaRZ63JvNPApROGO5jXZFH7V7S+
	7Sa4rPFA7SFDS9miO2Z1V4vkGt7Pt1bf0qAZ8lLEeM7uvVpDQrTy/1q7H0zYG1SHSiXs
	b4K30EODwVqd38FjFHqrtrMh7VN6E4Dzm8Ly4LNnhdl0PeqgMrcfsLJ226lMdDEk8Nre
	zbSI+Frow3Pbf6A/GALE+FrVLJuYWpwAFyPMfzE80kaR2sPuJ6tEy3+qzIqm5cIkfpAn
	iHkg==
X-Gm-Message-State: AA6/9RnsPMH2gahAvEGx1a8xgNqQ1joGJw0A9UhDetko6R4FSaQ7TRk3He/5CpRmjV9UDw==
X-Received: by 10.194.84.134 with SMTP id z6mr6468830wjy.204.1474631559439;
	Fri, 23 Sep 2016 04:52:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i127sm2772448wmf.4.2016.09.23.04.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Sep 2016 04:52:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 23 Sep 2016 13:52:38 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160923115238.GA2631@jama>
References: <1474631301-1249-1-git-send-email-jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <1474631301-1249-1-git-send-email-jussi.kukkonen@intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnutls: Skip QA check for text relocation on x86
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
X-List-Received-Date: Fri, 23 Sep 2016 11:52:38 -0000
X-Groupsio-MsgNum: 87459
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2016 at 02:48:21PM +0300, Jussi Kukkonen wrote:
> Current release has relocations in .text on x86. Silence the
> warning for now: Upcoming release should have a real fix.
>=20
> [YOCTO #10290]
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.5.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.5.3.bb
> index 1bdca6a..2010889 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> @@ -7,3 +7,6 @@ SRC_URI +=3D "file://correct_rpl_gettimeofday_signature.p=
atch \
>             "
>  SRC_URI[md5sum] =3D "6c2c7f40ddf52933ee3ca474cb8cb63c"
>  SRC_URI[sha256sum] =3D "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b=
5eae74881bdb1fef"
> +
> +# x86 .text relocations should be fixed from 3.5.5 onwards
> +INSANE_SKIP_${PN}_append_x86 =3D "textrel"

You need leading space.

> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlflF4QACgkQN1Ujt2V2gBy99wCgqijh55ycyRqDYKvtLKEiPD0l
HI4AnRKyelMOA4ixTbsQ98mVbaVoQdHi
=4KdK
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
