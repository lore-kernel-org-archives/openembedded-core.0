Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3F878607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 08:42:37 +0000 (UTC)
Received: by wmec201 with SMTP id c201so62742621wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RAO1NU64Kw30emk+mE/l0hl9Rn/07BiMO+enN1wmCRY=;
	b=QvusY+N2jtAcJrcVNk1ml/VQOBduv+tPuAlrPQN+QlJLgrUawTYOe4hLkmJOESDEAQ
	vD7GBvTy5O16CNwq+th2pNP48tPg4M7fUsdh0SlU1e8wO+KMFH/EMsUyLQcm8PyDJNW0
	a7xwdiRnUrxycEsA04kizh19a08awnujBi1D2+r/NDBxXFyUUgbWzNbHCWMjdrJ7+k4v
	B7VjpUQQNyu9V9OPYJRNOxcKZ4Qe/udFb7gh/3joab1XGjKp6QxsvRcKG7mycZN72nHu
	nzXD4z0ACBpO+fUUj7imdB91/7Ww6oNTe6EyJy5GfWElqRhDOsHOkwVR9PXSnJTQkqB3
	Sl1A==
X-Received: by 10.28.189.5 with SMTP id n5mr10029135wmf.76.1449650558225;
	Wed, 09 Dec 2015 00:42:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id f11sm7060980wmd.7.2015.12.09.00.42.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Dec 2015 00:42:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Dec 2015 09:44:20 +0100
To: "Burton, Ross" <ross.burton@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20151209084420.GB2246@jama>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<ec29713b1461de3b8dbcfaa19b8263ad959bcf7c.1447757562.git.Martin.Jansa@gmail.com>
	<CAJTo0LZhVh5g_C93KLP4oGXiZ48aHM+-iCphKuyZXGhb+dJLGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZhVh5g_C93KLP4oGXiZ48aHM+-iCphKuyZXGhb+dJLGw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 07/16] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Wed, 09 Dec 2015 08:42:38 -0000
X-Groupsio-MsgNum: 74511
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2015 at 02:08:35PM +0000, Burton, Ross wrote:
> On 17 November 2015 at 10:57, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > +PACKAGECONFIG[gudev]      =3D "--with-gudev,--without-gudev,libgudev"
> >
>=20
> Thats great but gudev is only in meta-oe.  Can you submit a move of the
> recipe to oe-core, or should I hold these back until someone else does?

Robert: are you going to backport gudev to jethro or should I resend
these gstreamer patches to disable gudev support in oe-core?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZn6eMACgkQN1Ujt2V2gBx7jwCgpyTLm2AlrSyzehMpVdXgAKlQ
8AgAni8CRER44lLnajsC3J55BSfXn0Us
=wfcZ
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
