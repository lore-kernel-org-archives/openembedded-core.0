Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 90C8F6AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:45:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so13103273wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B5CibhLahXeIVpNjNqe62H6GEqk86oFbQr3JqOj14nA=;
	b=OTJi51DOevuGwYZXPNJloELUVR+fbsnpWHOLLATzMjvwJWJEp9mWwRVC3CSkJ76tYI
	32bLTWuCcGWVF8SsUkQkqApYgxIrYQRNG35ETX9LJlSYVPMNLFHFP1JEQgb3g/h+avnQ
	b05kmLensF2DtklDwol3jcfRJ24uKArde+7apMPNC2VtUnu9pEJTz9DiYPnht1PPPrPU
	cQjW/2/gNmjvk8EY2EP/0328spDXxaDnCBSPEa8HI2uypyGX4TcK0BP7D907IHvinsja
	9CiiV11evrFLz4NVNmnyXx3YxUwm6zrxFzYiJYY2qNk1V0PcKtYwb25Rb8T+tWqjuw5+
	YJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B5CibhLahXeIVpNjNqe62H6GEqk86oFbQr3JqOj14nA=;
	b=RoBT+bi3RgHZbPgjUSigDZ1IbC8j5J2HFMWaIyx1romqnuTJY1ZPmkeqCI2GwZVO83
	p4qsd73nTlxU5ieW5q6NTAXZc/IRy+XboUccO56G8rkPI0zrGdOFZx645uSsQVH+JeYk
	QHZyovfSc/IAWgw3U6+fyqCDwEvOKGHdTFthGFkbPgVKPnbz3EwzLpoeUSJXw8u/FX1l
	N4Mx3bOCwT7ym/tw1hO6v5erTyzBa2HgSqOQJ2NfxldNK2zdDIyTELom1NK1/4Fo5FCZ
	CoK5gqUkErVxC7dVFQZ5rZo8pfI5rWIlGpvR+7pKqJIxyBEgbihxRPcmSNbKOMEGmddl
	Gvtw==
X-Gm-Message-State: AD7BkJIL0TX4I9Gvyi5zFtc2SOBLAEglE67Ac8slf+1AzbbcME1uqRotgbLuRyi693tuzg==
X-Received: by 10.28.9.19 with SMTP id 19mr34947096wmj.87.1458830745682;
	Thu, 24 Mar 2016 07:45:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w203sm8073184wmg.14.2016.03.24.07.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 07:45:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Mar 2016 15:50:24 +0100
To: Peter Liu <peter.x.liu@external.atlascopco.com>
Message-ID: <20160324145024.GD2518@jama>
References: <1458742798-9890-1-git-send-email-liu.ming50@gmail.com>
	<20160323144107.GD2565@jama>
	<DB3PR03MB201ABA2E63F24B74C089EACE3820@DB3PR03MB201.eurprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB3PR03MB201ABA2E63F24B74C089EACE3820@DB3PR03MB201.eurprd03.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "yue.tao@windriver.com" <yue.tao@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH v1] libmad: avoid using legacy _thumb overrides
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
X-List-Received-Date: Thu, 24 Mar 2016 14:45:48 -0000
X-Groupsio-MsgNum: 80091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2016 at 02:38:04PM +0000, Peter Liu wrote:
>=20
>=20
> ________________________________________
> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: Wednesday, March 23, 2016 3:41 PM
> To: Ming Liu
> Cc: openembedded-core@lists.openembedded.org; yue.tao@windriver.com; Pete=
r Liu
> Subject: Re: [OE-core] [PATCH v1] libmad: avoid using legacy _thumb overr=
ides
>=20
> On Wed, Mar 23, 2016 at 03:19:58PM +0100, Ming Liu wrote:
> >> From: Peter Liu <peter.x.liu@external.atlascopco.com>
> >>
> >> _thumb had been dropped from overrides since commit 351443d7:
> >> [ feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-=
rides ]
> >>
> >> Change to set EXTRA_OECONF_append by checking ARM_INSTRUCTION_SET inst=
ead.
> >=20
> > This also isn't right, ARM_INSTRUCTION_SET can be set to "thumb" even
> > when MACHINE doesn't support it by having "thumb" in TUNE_FEATURES.
>=20
> OK, thanks for the correction.
>=20
> >=20
> > You'll need to replicate the conditionals which were used in the tune
> > files or just revert that cleanup if you find "thumb" override still
> > useful.
>=20
> Yes, then maybe reverting that commit could be a better fix considering t=
hat there is not a easy way for end users to override the thumb related set=
tings. I will send a V2 soon.

Andre already sent patch to remove this EXTRA_OECONF override completely.

If you think that it's still needed for whatever reason you should reply
on his patch.

>=20
> //Ming Liu=20
>=20
> >=20
> >> [YOCTO #9323]
> >>
> >> Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
> >> ---
> >>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/r=
ecipes-multimedia/libmad/libmad_0.15.1b.bb
> >> index 9e08b16..4c15db2 100644
> >> --- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> >> +++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> >> @@ -27,7 +27,7 @@ inherit autotools pkgconfig
> >>
> >>  EXTRA_OECONF =3D "-enable-speed --enable-shared"
> >>  # The ASO's don't take any account of thumb...
> >> -EXTRA_OECONF_append_thumb =3D " --disable-aso --enable-fpm=3Ddefault"
> >> +EXTRA_OECONF_append =3D " ${@['', '--disable-aso --enable-fpm=3Ddefau=
lt'][d.getVar('ARM_INSTRUCTION_SET', True) =3D=3D 'thumb']}"
> >>  EXTRA_OECONF_append_arm =3D " --enable-fpm=3Darm"
> >>
> >>  do_configure_prepend () {
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbz/q8ACgkQN1Ujt2V2gBy3LQCffK5PCaB5bUgzGkVqxsSoa41K
HU4An1V3o/VYYsrEjeeUGwn2v52d230m
=pwTB
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
