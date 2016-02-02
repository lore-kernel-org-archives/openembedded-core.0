Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CC57D7719F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 11:56:33 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 128so114367445wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 03:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=egZpkdmu7k20G/HgHknrrHqfE3nvdAK5zwAeovS4j7U=;
	b=bBCPQYcdzi+6rjje8JA6N4K4hWDE3FLizJpcFRJhYH2xGV1mGSZL6tDeVqYrHekaaj
	m7OwsOEZfNBDHjHjPkBkMMJAD6DBxkBTLOyu86NqN96QMcMEGYgzdK3xHt+wkjc5qE+R
	1cTmLjeMc9u9dFexWXXLaScRIQjKyTYbM8FBcCq8QFtmnr+6QlZAQXl2/Cm0Vw/tYbgX
	Y1FzeieTmmX2Xfs4IPiy3fLjbwgAW4YXk+ToPqxQ/MrV+DLkDcfhMBYO8Cz2YU6nmgtQ
	qTdMPyZIFvj6Gm3Jm384jDBLDp79dTPZMlgDmeTI1GgUuNXz2MmcoK8yAeu+/Fr1C38I
	FVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=egZpkdmu7k20G/HgHknrrHqfE3nvdAK5zwAeovS4j7U=;
	b=avc0lRbaAQCaDVEx4c1jBXc5PDaSfqOiuj4aGjWtp60YhJFMypxsqrRca+lnqAvWDs
	wuBmCWdBBgwWTNf7dZvHV66RGG+2ip1aFKt8n+gfdngK/UXrBB2YjS4y0gmOZh9dD9q6
	ycTwux6Wub+30VN8ji63kxKro/ipNPjK5WLLYfG/qKBG64p7Zgf/danixFeLenZst5ol
	LLK3neqGzFTYfVtQu8N0msgMXgtFtfxLTh+Z7UtzbNK+FyIdlAEa/+A3rpv/ielO5ASB
	01QqCD8EitMN9OODagMbMCbSs+Lti/fGBSIHYL80LcY0n8CEX3MTP94XpI9m70DzLaHf
	543Q==
X-Gm-Message-State: AG10YORw753XjGmunpG9LY6ODUigmctzMmHnCIvUFKLEL1dLhANMw2aLuTVhpv9uRm07Vw==
X-Received: by 10.194.200.106 with SMTP id jr10mr31724072wjc.100.1454414193920;
	Tue, 02 Feb 2016 03:56:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y8sm2553958wmg.9.2016.02.02.03.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Feb 2016 03:56:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Feb 2016 12:59:26 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160202115926.GA2607@jama>
References: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
	<1454411051-15095-3-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1454411051-15095-3-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Tue, 02 Feb 2016 11:56:34 -0000
X-Groupsio-MsgNum: 77268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 01:04:11PM +0200, Maxin B. John wrote:
> We need machconfig file to automatically choose between physical and virt=
ual
> keyboards.

beaglebone has its own BSP layer, why it should be added in oe-core?

>=20
> [YOCTO #9027]
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-bsp/formfactor/files/beaglebone/machconfig | 10 ++++++++++
>  meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 ++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100755 meta/recipes-bsp/formfactor/files/beaglebone/machconf=
ig
>  create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/machconf=
ig
>=20
> diff --git a/meta/recipes-bsp/formfactor/files/beaglebone/machconfig b/me=
ta/recipes-bsp/formfactor/files/beaglebone/machconfig
> new file mode 100755
> index 0000000..56a2ae2
> --- /dev/null
> +++ b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> @@ -0,0 +1,10 @@
> +HAVE_TOUCHSCREEN=3D1
> +HAVE_KEYBOARD=3D1
> +=20
> +DISPLAY_CAN_ROTATE=3D0
> +DISPLAY_ORIENTATION=3D0
> +#DISPLAY_WIDTH_PIXELS=3D640
> +#DISPLAY_HEIGHT_PIXELS=3D480
> +#DISPLAY_BPP=3D16
> +DISPLAY_DPI=3D150
> +DISPLAY_SUBPIXEL_ORDER=3Dvrgb
> diff --git a/meta/recipes-bsp/formfactor/files/qemumips64/machconfig b/me=
ta/recipes-bsp/formfactor/files/qemumips64/machconfig
> new file mode 100755
> index 0000000..56777b6
> --- /dev/null
> +++ b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> @@ -0,0 +1,10 @@
> +HAVE_TOUCHSCREEN=3D1
> +HAVE_KEYBOARD=3D1
> +=20
> +DISPLAY_CAN_ROTATE=3D0
> +DISPLAY_ORIENTATION=3D0
> +DISPLAY_WIDTH_PIXELS=3D640
> +DISPLAY_HEIGHT_PIXELS=3D480
> +DISPLAY_BPP=3D16
> +DISPLAY_DPI=3D150
> +#DISPLAY_SUBPIXEL_ORDER=3Dvrgb
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlawmh0ACgkQN1Ujt2V2gBxkRQCfZP9Awt9mGW9iuMu1xXNVv0DI
InMAn3bGaBAjxyd2ukEtnbz5idERt2mU
=+8X0
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
