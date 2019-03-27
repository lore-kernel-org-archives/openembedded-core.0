Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 338CB7D08E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:20:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r4so11114850wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Q8lG4bGayt5xW1wu90xkKFa8ZDAz9QKPz6tv1zzdZb8=;
	b=Kdham2tc11/74QMilAs46BCT2fGLHjRqK0QJiK1jhGg96ryQqCj93X7byWyHE+KaBH
	VuxihvrEsBKuYY7xHgVnPsytVi1iC/HkFvyBEYucucePyt2WHIZSuOyuQc7KTIBkcz2u
	PB+R/i2yqcW9GmwOLIhSxUtel058PE/lTsqh/eHbdBT9Yj/UkxKTJXSP3Aomhu5sFDvw
	kZkNob8k5jVq+9fYS09vMXQ/wmQKudrgZ4ORjmB0GAUXcg3xc1d+7Bp8ymvCMirfl0l1
	X31J0r9IvTQJvpisDYJVUq36BkUxB8SjsGRbjHFlTNdvwKUsXcA4XImzAkpqlvW71GgK
	RGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Q8lG4bGayt5xW1wu90xkKFa8ZDAz9QKPz6tv1zzdZb8=;
	b=CVJXbFIs8y4O3jiiJk6WuOPXnmlg3ssy9jLURCowsB2vvaTGZYa4C9RbV7/RyUuDwI
	YPx24+aPwpnnnG+lwohqgtPDmKYq9HSyWfs4uMD6p445XQpNgvUIaL+avXE5YzftZM6I
	iRnd91uUgOFpYTPITNp8s9riuXJf5ThTdcQHEUMeAGFrB9ZxVIEtEdJjxhGrhVeubwL3
	9xkwy+OkgklJvMKyQ+F7uSA3H9zFxSK6eRso4fCD8ClMabmvoWw2aKmeutcW0vLZshow
	DOU6DlONWIeRrBHmrPKzOM73HTaUumqVqkuC4FTmnXaUmkwUbJDTTrO4SrIztOQHzP5F
	HP8w==
X-Gm-Message-State: APjAAAVkcqwgAdGCJktVSIy7e2Xqt/EqHcWmPWD98gVPtBez12d6q3p0
	aBgb1+Bc+Ph6uiYpEN/StRg=
X-Google-Smtp-Source: APXvYqxr65Sts6pGpIeZ+mEt4drYNX8WsFT2/XMkly9A3jpMv4EJho/hKVuAKBUU/sSwDG8CY6RRCg==
X-Received: by 2002:adf:f80d:: with SMTP id s13mr22424429wrp.38.1553696440874; 
	Wed, 27 Mar 2019 07:20:40 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w21sm206535wmc.4.2019.03.27.07.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 07:20:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Mar 2019 15:20:40 +0100
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190327142040.GB1598@jama>
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama> <20190326104212.GB19885@localhost>
	<20190327133314.GA1598@jama> <20190327140327.GA21936@localhost>
MIME-Version: 1.0
In-Reply-To: <20190327140327.GA21936@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Wed, 27 Mar 2019 14:20:40 -0000
X-Groupsio-MsgNum: 122661
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 04:03:27PM +0200, Adrian Bunk wrote:
> On Wed, Mar 27, 2019 at 02:33:14PM +0100, Martin Jansa wrote:
> > On Tue, Mar 26, 2019 at 12:42:12PM +0200, Adrian Bunk wrote:
> >...
> > > Not having the release there also loses the ability to use either
> > > gcc_%.bbappend or gcc_8.3.0.bbappend, which are suitable for
> > > different situations.
> >=20
> > There is usually just one version per recipe and even with _git.bb
> > suffix you can easily do gcc_7+git.bb and gcc_8+git.bb if you need to.
>=20
> Thud contains 8.2 today, but might have 8.3 tomorrow.
>=20
> A layer might want to append only to one of them,
> or have different appends for different versions.
>=20
> That's trivial with gcc_8.2.bb and gcc_8.3.bb,
> and harder with gcc_8+svn.bb.

If your layer has gcc_8.2.bbappend and the recipe in oe-core gets
renamed from gcc_8.2.bb to gcc_8.3.bb in newer thud revision, then your
bbappend will not apply and bitbake will complain that there is no
recipe for your gcc_8.2.bbappend.

Layer which doesn't even parse correctly with different revisions of
the same thud branch isn't really something we should encourage.

gcc_8%.bbappend with some logic inside (e.g. adding some .patch file
only when PV starts with 8.2) will be compatible with both newer and
older revision of thud.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJuGuAAKCRA3VSO3ZXaA
HLIRAJ9uYzsfuLUuVgeff38bcVzvpwxzQQCgj1e3sLbPsR2dv+cOzyIlsExtnC4=
=RBDJ
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
