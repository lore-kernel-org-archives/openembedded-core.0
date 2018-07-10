Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09756755B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:49:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c4-v6so1215172wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hh9oc3lKG/ePCCORaV3vc9jFtvpLCX56sXd9/tkz++o=;
	b=fDnNZTCUc6NlemqPj4nJSlHXUrtWpF8U+eDHajFgAV1UB2PU05IJTT45MhksjoT2lQ
	hydSI1YMXfG5oLdNaN0wjP4ChwakDkl5j7QUC9zqwAO9Iy24CZVyaky5sqrm/6DHGxe2
	c28lDT2WE9Fns/d1Tp9Ex102w6kCLAuS3bv1cHZUKLRExAgeppC5So/FXQn+owLAC5q9
	ANngJHqqvbpFLYhuCXzpwA038RIWdVL0rEtr+W4rEH6ioX8HGac2z4TEMll243AHEJJv
	rC5nMTFILvSiMOxEGOz95P7GmFXxQHBGz+H5kCXUV+DHIy+OYHMs5gvDNopqMKzvghNB
	00Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hh9oc3lKG/ePCCORaV3vc9jFtvpLCX56sXd9/tkz++o=;
	b=b0C5wp1DMM/973i+IybBszRam+Aail/o8lfVhc9F4tZOPiQ55NZ/NbPlmTJtwvRm6E
	2TCz4W201ZXaH+IsgxN2onAmhrUtQ8NztQ8KUYCeQgFSwDjMRDeC1/L4Qi3CETTtHPC5
	bYGFvl+mFk9XtsV08Q0djh9svBEwkAwRA6exLDrnIyYjGRmcTPxbMOXVTZqwcE51+9E7
	E6zjKDARo/ihe+N7r3biEt1JkNehvfnVmcJesnkUj4IYO7gDkclIyOX+f9Vt+kzCSiK5
	2nlR1Fe/6m96rBq4YVdfbYPC0VWiFk3ynawZ9J30dDgS17+w4QJe8/BXoi3ej6gkN063
	5a6A==
X-Gm-Message-State: APt69E2Pz0KiVFN3dlUtMsvsFimNAaO6EP/sj46C1iXHP+ZGwCUBuMwR
	njaMH+V3a8krP6SWRDnE2yV56A==
X-Google-Smtp-Source: AAOMgpfs4IiSSJtu2SuiaKyzo+s7dC9A6EwBIxkZxCIiLy+AcZpJZ8wCeFPd8AS9IU8EB2GlRAgNow==
X-Received: by 2002:adf:dbc3:: with SMTP id
	e3-v6mr16702567wrj.217.1531216168754; 
	Tue, 10 Jul 2018 02:49:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w2-v6sm28268003wme.45.2018.07.10.02.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Jul 2018 02:49:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jul 2018 11:49:36 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180710094936.GB1825@jama>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
	<20180710080702.20527-2-Martin.Jansa@gmail.com>
	<05aaa19a3bf9bcf837150745d1ee17deaa41304f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <05aaa19a3bf9bcf837150745d1ee17deaa41304f.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libdrm: allow to build native and nativesdk
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
X-List-Received-Date: Tue, 10 Jul 2018 09:49:28 -0000
X-Groupsio-MsgNum: 113336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2018 at 09:45:45AM +0100, Richard Purdie wrote:
> Normally I don't mind native/nativesdk variants but libdrm starts to
> worry me as its a short step away from mesa and when we've tried native
> or nativesdk versions in the past its been a nightmare, particularly
> around GL.
>=20
> Could you explain a little more about why we need libdrm-native?

It's for mesa and nativesdk-mesa indeed and qemu-native with spice,
virglrenderer and opengl support enabled.

http://lists.openembedded.org/pipermail/openembedded-core/2017-September/14=
2349.html

> On Tue, 2018-07-10 at 08:07 +0000, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/drm/libdrm_2.4.92.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> > b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> > index 1526553254..b4d06d19a6 100644
> > --- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> > +++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> > @@ -56,3 +56,5 @@ FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
> >  FILES_${PN}-freedreno =3D "${libdir}/libdrm_freedreno.so.*"
> >  FILES_${PN}-amdgpu =3D "${libdir}/libdrm_amdgpu.so.*"
> >  FILES_${PN}-etnaviv =3D "${libdir}/libdrm_etnaviv.so.*"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --=20
> > 2.17.1
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW0SBLwAKCRA3VSO3ZXaA
HGcsAJ9QtJVZNsn9AjqtJYRb2xlV6ekZ2QCgmnD4nq0KGUIlFM51+SpTUUWYk3I=
=DY4N
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
