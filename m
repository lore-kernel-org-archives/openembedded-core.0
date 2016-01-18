Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2348160116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:52:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b14so17749913wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y1tYQXYJuwtIHIsifMgs2c5IxSdd7BU+ul0wvLMp4lM=;
	b=jVpNwMuaDEZlZrEX1DaAjeqVtsdFSHIXrHNvFkhXu5phpqq6HJkIIIdbdUl6c2J4sf
	mffem8ljlDFIJLeKBGYQ/UX/dX7JVvWh41tDTkMsdcGUGU38B6GH2JujYLilFQkcjCM4
	S1YRDwJIBKyz1a57UE+wxYzOw+hJfIvk36QSaVx3IlKpbNgKjP5s3kzue4rGjrs6LToK
	207YbMSKLyM5q9DVyEEA4xctDQM54fDYvMjlpOsryv+KNISdFwE0iFNQEn7Q2MYBfnMP
	UkGRCsPtmCme6m9cuFxLGPPdjlqzC3aYzUW3joUu5EJPbjVV1sUy90laAHD3H4d4z3fW
	jKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Y1tYQXYJuwtIHIsifMgs2c5IxSdd7BU+ul0wvLMp4lM=;
	b=eMecpV5HWTwrrHefINWSYTcqggkbRYvRGzNtewS5VyLNkL9SxlcfIgwYIFPVv28HIv
	uHTTXlDH3qmpioxMKJWu4X3DOqpB7wohOpdKr0H0hDuhBcmgVE+ia2GihSXm12kjmatY
	WULdGdzIKIpxIRxDCNPsdKr3xLP5vPEcixvnNQ95g27imyolRgH/Fpn3gN2qN2Gqiukp
	00DhKkUBD+dFZ/GNjUhCHYQd7XPK9iDKk2W9tL75VDE03UrjizMB3vIHgUP2ux27dB7L
	0uHOZQ2izLWjAwMbh6S+bv7IKqE4SBrIE9vwX9IR5TTc/oxnoMkxlDFN3LOvCVt9jvND
	Qxhw==
X-Gm-Message-State: AG10YORQJ4dcMovPlJkuXufmGPi+ShvAHNNCLwNkwAUAWEaIKuFw3KyCeSSxTHfXnAda3A==
X-Received: by 10.194.85.161 with SMTP id i1mr1151503wjz.95.1453135925057;
	Mon, 18 Jan 2016 08:52:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 79sm16608061wmo.7.2016.01.18.08.52.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 08:52:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Jan 2016 17:53:17 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160118165317.GC2614@jama>
References: <cover.1452848807.git.liezhi.yang@windriver.com>
	<85829b7950f74cb41f39b5f1fbd8541bcb7b6d1e.1452848807.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <85829b7950f74cb41f39b5f1fbd8541bcb7b6d1e.1452848807.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gstreamer1.0-plugins-good.inc: add gudev back to PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Jan 2016 16:52:05 -0000
X-Groupsio-MsgNum: 76347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2016 at 01:07:20AM -0800, Robert Yang wrote:
> The 66e32244aed8d33f1b49fbe78179f2442545c730 wrongly removed gudev from
> PACKAGECONFIG, now add it back.

It was removed intentionally, because for systemd images there isn't
libgudev provider in oe-core, only in meta-oe.

RP's fix:
http://git.openembedded.org/openembedded-core/commit/?h=3Djethro&id=3Dbc458=
ae9586b45b11b6908eadb31e94d892e698f

breaks the dependencies again, because when systemd is used there won't
be libgudev needed by gstreamer1.0-plugins-good

Please revert both "fixes"

Regards,

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good.inc        |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.=
inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> index edaafe8..2f987b4 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> @@ -11,7 +11,7 @@ inherit gettext
>  PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', =
'', d)} \
> -    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib v4l2\
> +    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
>      "
> =20
>  X11DEPENDS =3D "virtual/libx11 libsm libxrender libxfixes libxdamage"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAladGH0ACgkQN1Ujt2V2gBw7cwCfXhWSPJcmYpXfIe0VG/KNC2am
BBcAn2+wjCDy9CjHyrtZpMoX1FW9Dhe8
=1JLy
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
