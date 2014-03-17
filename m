Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id D88996EF77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 07:37:16 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w62so4238169wes.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=9IMN5NB8SYjsbY8jkWUPFF/zBV9GmeUcFGoN0kpZQ5Y=;
	b=IaqULjqbIDdPfTjXrlkb72ZE5alOkBgBlVw/b5ZK8MDcIwAZBpTBoILzCDWx8hKvxo
	ZZhRHcm+fphoLJgmS1isPBR15wMbxOpHKS9OVfONY6rZkWrYVxlsjBU7QFkQWxgAMNn2
	c/WSdvWGQw02oCvHb/MBAKZFp6MFFxnLAnt+0meGEW4rXbYpdIrRXsYe5YCOAdlbRoaf
	/dD+dD2EIRpIW0uXVClQfg4ZwGfVHpJ0+3m9EU3mHbtvFbNt1sPBYEVhep0Arb2CrBup
	PrYhKjcYih7p2VWRK9YScF/CeAuBh/g4T5uCfT3U5W3V7wmnUWZLZDm7CHPX4HwtE/M8
	2EFg==
X-Gm-Message-State: ALoCoQkfIB9QIhEio0jXHG8+C5hbL7X2wlLqYt3LBn6j3VCq78C/0A6lO+2mER52Wq9RPX9t88sY
X-Received: by 10.180.106.134 with SMTP id gu6mr8202388wib.61.1395041836763;
	Mon, 17 Mar 2014 00:37:16 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d080:8319:5f23:9bd7?
	([2001:610:612:0:d080:8319:5f23:9bd7])
	by mx.google.com with ESMTPSA id w10sm21594507wiy.9.2014.03.17.00.37.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 00:37:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16D63376@IRSMSX105.ger.corp.intel.com>
Date: Mon, 17 Mar 2014 08:37:12 +0100
Message-Id: <17035415-79DD-4EA9-80C6-4C855B49F853@dominion.thruhere.net>
References: <1394636069-6139-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16D63376@IRSMSX105.ger.corp.intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] musicpd: upgrade to 0.18.9
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
X-List-Received-Date: Mon, 17 Mar 2014 07:37:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Wrong list, you need openembedded-devel for this one

Op 17 mrt. 2014, om 08:26 heeft Iorga, Cristian =
<cristian.iorga@intel.com> het volgende geschreven:

> Ping!
>=20
> -----Original Message-----
> From: Iorga, Cristian=20
> Sent: Wednesday, March 12, 2014 4:54 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Iorga, Cristian
> Subject: [meta-multimedia][PATCH] musicpd: upgrade to 0.18.9
>=20
> - Upgrade fixes a crash with libvorbis 1.3.4;
> - Simplified SRC_URI;
> - Reference for S no longer necessary.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
> .../recipes-multimedia/musicpd/{mpd_0.18.4.bb =3D> mpd_0.18.9.bb}  | 9 =
+++------
> 1 file changed, 3 insertions(+), 6 deletions(-)  rename =
meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.4.bb =3D> =
mpd_0.18.9.bb} (89%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb =
b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> similarity index 89%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> index 77ccc1f..349ccbb 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> @@ -6,14 +6,11 @@ HOMEPAGE =3D"http://sourceforge.net/projects/musicpd"
> DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg =
faad2 ffmpeg curl sqlite bzip2 pulseaudio"
>=20
> SRC_URI =3D " \
> -    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
> +    http://www.musicpd.org/download/${PN}/stable/${BP}.tar.xz \
>     file://mpd.conf.in \
> "
> -
> -SRC_URI[md5sum] =3D "0d881fb32f9d31afcdb0bb13cb78b9ab"
> -SRC_URI[sha256sum] =3D =
"6b171985f192603150c879d105dc4d05d701ac60a2db41630a4dce823e068388"
> -
> -S =3D "${WORKDIR}/${PN}-0.18"
> +SRC_URI[md5sum] =3D "0e5156a831d4302d2032998bcfd5c36f"
> +SRC_URI[sha256sum] =3D =
"0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be5346f19de5f699a68de"
>=20
> inherit autotools useradd systemd
>=20
> --
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


