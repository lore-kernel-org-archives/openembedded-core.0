Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id D52CF6E8C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 20:07:44 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id d10so3881726eaj.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=3OV/IlmrTbHqTm0GN2W3iiuJa3jPFzgs9iG5PlEpkH8=;
	b=FyPmwpjRQzxcwYMqGCxEnmqN4JlNrkMTHOJUjtrV67HIAMhNiavX2aOXZ/VRa7tAEv
	xjkin9vHCVYL/8O35IIc8TjjkES5DJf9AhO3MYYAZ0+evtcaKiY9XFMuO+kPFgaxfvQq
	UmQulaMb3Uw0n/S0/kgnj61k04BYYDO+4RKx4HKQmVT32LEhxdCadsT6nEkH2U5ms0Xj
	ItcCjZB7gW/gHcHTqLShIGaeqq5u9QK9w7ZCNYEVYxvEff+x9Qbm5Lp6EkV8bsyrCeXO
	BDTHFXM9q2swSwYYxkuA3hleAiixmRTFIdGvugLU3WfxXTH9gTSG1tAgwo+WhlEIWmSR
	hM4g==
X-Received: by 10.14.87.129 with SMTP id y1mr22322191eee.38.1392149264983;
	Tue, 11 Feb 2014 12:07:44 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u6sm71568908eep.11.2014.02.11.12.07.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Feb 2014 12:07:44 -0800 (PST)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Tue, 11 Feb 2014 21:08:04 +0100
Resent-Message-ID: <20140211200804.GA3776@jama>
Resent-To: openembedded-core@lists.openembedded.org
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g1sm47008111eet.6.2014.02.09.14.59.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Feb 2014 14:59:51 -0800 (PST)
Date: Mon, 10 Feb 2014 00:00:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140209230009.GB3485@jama>
References: <20140209110150.9093150320@opal>
MIME-Version: 1.0
In-Reply-To: <20140209110150.9093150320@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-TUID: RUzVYSOUKGUG
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Christopher Larson : pulseaudio: fix RDEPENDS traversal for consolekit
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
X-List-Received-Date: Tue, 11 Feb 2014 20:07:46 -0000
X-Groupsio-MsgNum: 50040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline

--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2014 at 11:01:50AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: dora
> Commit: 029b225cd7491a1efdc42593460a57d9eb865427
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D029b225cd7491a1efdc42593460a57d9eb865427
>=20
> Author: Christopher Larson <chris_larson@mentor.com>
> Date:   Wed Nov 27 11:07:07 2013 -0700
>=20
> pulseaudio: fix RDEPENDS traversal for consolekit
>=20
> Include the console-kit module in PACKSGES explicitly so bitbake can map =
to
> the RDEPENDS we define for it in this recipe, and thereby ensure that when
> adding the console-kit module to an image, we also get the necessary
> consolekit package produced.
>=20
> (From OE-Core master rev: 7e7ff7d1e5e86f097ef40befcf00dd28657e26f8)
>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Robert, can you please cherry-pick fix for this from master as well?

This commit:
commit 3e148f863d55728bbfa2d94b602b03dc56b70d4c
Author: Christopher Larson <kergoth@gmail.com>
Date:   Fri Dec 13 07:47:11 2013 -0700

    pulseaudio: only package consolekit module when x11 is enabled

    As requested by Martin Jansa <martin.jansa@gmail.com>.

    Signed-off-by: Christopher Larson <kergoth@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


>=20
> ---
>=20
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index bb13f4b..b7a6eba 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -69,8 +69,12 @@ USERADD_PARAM_pulseaudio-server =3D "--system --home /=
var/run/pulse \
>                                --no-create-home --shell /bin/false \
>                                --groups audio,pulse --gid pulse pulse"
> =20
> +# The console-kit module is included here explicitly so bitbake can map =
to the
> +# RDEPENDS we define for it in this recipe, and thereby ensure that when
> +# adding the console-kit module to an image, we also get the necessary
> +# consolekit package produced.
>  PACKAGES =3D+ "libpulsecore libpulsecommon libpulse libpulse-simple libp=
ulse-mainloop-glib \
> -             pulseaudio-server pulseaudio-misc"
> +             pulseaudio-server pulseaudio-misc pulseaudio-module-console=
-kit"
> =20
>  #upgrade path:
>  RREPLACES_pulseaudio-server =3D "libpulse-bin libpulse-conf"
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL4CHkACgkQN1Ujt2V2gBxMGwCeJJv/MY2WdKYqvfHLdryKFVJB
NVQAn2SN+uk0HUOnqyj+m+cxjjP6yBUV
=9JHP
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
