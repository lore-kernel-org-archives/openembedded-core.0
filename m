Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E33876057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 15:01:53 +0000 (UTC)
Received: by wmec201 with SMTP id c201so260423594wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 07:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2EMbVT2tEXdUGBh2SBe5XRb14c7Ee8FDwxJvv3M3vFg=;
	b=kEbzOOUks8cMhpq2XvZ5Prnfd/zJNXQ+MF0jrloi6IO8+PHCox+4bgXQsE+qmPRje5
	lkNxkdCGAjJcElsUfILaNwHYMKo4Sg+QHdXBYx2+EHSPm7/INQmBBYDaU2cEu2bdIAHX
	ssFoHcsxwXUc/IokHlyciEeIb+oNGRNhDDrWoXPRPzlnX7lu5imymVs36LZ7Cmi1CFkN
	pJvhjUowS2jBGJnRLWFfgSM6/GbeAkJx1FCWf0aw6b5la+D23KJ+b4FtXQvvMzflpUVB
	k91W07Zd7URH1yaovqZTZr10ZTXYmez/+SvNyUDqdZ2Ut1VCR6uvZblQLGufex2naz4E
	QjEA==
X-Received: by 10.28.12.3 with SMTP id 3mr5279446wmm.84.1448463713958;
	Wed, 25 Nov 2015 07:01:53 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jh4sm23432006wjb.33.2015.11.25.07.01.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 07:01:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Nov 2015 16:02:27 +0100
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20151125150227.GQ17303@jama>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
	<dbc02d3db559f59b296f073f098bf24472092a67.1448455166.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <dbc02d3db559f59b296f073f098bf24472092a67.1448455166.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] gstreamer1.0-plugins-bad: Fix gudev dependency
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
X-List-Received-Date: Wed, 25 Nov 2015 15:01:54 -0000
X-Groupsio-MsgNum: 73953
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iiZKCn1f/U0ES2iY"
Content-Disposition: inline

--iiZKCn1f/U0ES2iY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 03:05:38PM +0200, Jussi Kukkonen wrote:
> libgudev is now it's own library (also provided by udev).

Duplicates: http://patchwork.openembedded.org/patch/107475/
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.i=
nc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index f94b12f..fe9ab97 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -40,7 +40,7 @@ PACKAGECONFIG[opus]            =3D "--enable-opus,--dis=
able-opus,libopus"
>  PACKAGECONFIG[flite]           =3D "--enable-flite,--disable-flite,flite=
-alsa"
>  PACKAGECONFIG[opencv]          =3D "--enable-opencv,--disable-opencv,ope=
ncv"
>  PACKAGECONFIG[wayland]         =3D "--enable-wayland --enable-egl,--disa=
ble-wayland --disable-egl,wayland virtual/egl"
> -PACKAGECONFIG[uvch264]         =3D "--enable-uvch264,--disable-uvch264,l=
ibusb1 udev"
> +PACKAGECONFIG[uvch264]         =3D "--enable-uvch264,--disable-uvch264,l=
ibusb1 libgudev"
>  PACKAGECONFIG[directfb]        =3D "--enable-directfb,--disable-directfb=
,directfb"
>  PACKAGECONFIG[neon]            =3D "--enable-neon,--disable-neon,neon"
>  PACKAGECONFIG[openal]          =3D "--enable-openal,--disable-openal,ope=
nal-soft"
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

--iiZKCn1f/U0ES2iY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZVzYIACgkQN1Ujt2V2gBx/vwCffAfljVyt3Uzq167IOnpXoqPg
S4cAn0CZDdQMDOaELuHmXWNSqVMvspFA
=FlX/
-----END PGP SIGNATURE-----

--iiZKCn1f/U0ES2iY--
