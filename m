Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 86168751AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 10:31:19 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g33-v6so7113225wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0OzAHf3RyHlpTLhMRDVrOE/n2OI3wra/+HQh+jjRUUY=;
	b=pGSBbxPT+8L+Ll5pO8xN8Xr4QM+lYVDF7IvF+JHRHWdnnQdQ9s1mhN8cOFTm4+bUdw
	NtKasJwLPmxDZ8LiAVRx1XrQ7kPGeFEpibJ8srafanw/KyN66Cad8fKGFcT9A9qWos7k
	8rP3jvw2h0Mhxm9ulevUOSyL96VbxJEcraRMneZzazDaUl/zxtXLKX3teAlX5shm7TBv
	RAlimS+VD8vjFImkbVQoAP1ezrGh7b+V5Zkn4/BozIn1yxtK4A1DylAmev8bjTsOyhzv
	BDj5w52cQ8e2k3GFu1U/TdpmE9d5Eth1gy4oegdmLrdh74RxeQ8FbcwnXqMvfxNTUjxz
	4lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0OzAHf3RyHlpTLhMRDVrOE/n2OI3wra/+HQh+jjRUUY=;
	b=WeU98j204/qghk5/QT1ZZh/WAputhAkWe87IX3He+av6txNsHZbd549FwQtzWcJ6iy
	UJjbO8BCzxBZTQFzfUS+m+OmCQ0lkFAZWm3YibKXCr0H6jQNuXtBlB0Vl+VADgncxNfU
	mhpq/MKT09/lpqVz/x5Mn7GFj606Ck5jxike0qxxPTxzD/yK9i3qWicvhATudojAj6Tc
	3jGkNeDNaKOrAVyygR5OKuqF3EecvTTZ+SS/oMEcJElsS8j2c3OGBtb/HoMZQArM2+D9
	wi543vGoE/O3FW2ugKJ4Qf+qxZsRkMn03G7QFRZQ5X0K8ffsm0mvWJGu+hc74TfYvpYg
	OIcA==
X-Gm-Message-State: APzg51DMnYoSjs/8DAZvvZ5mmhQLF3WcJSF04LvqbispoVjLeB6MNIS3
	rfEQRIfdqumd3MhC+2B5SjM=
X-Google-Smtp-Source: ANB0Vdb5sZyb0kuK7uTMoKJL3EyzfcuLa+/X2ZNC3JktYFODdhK6Krhd0siNIfJ7x1Doxqwx0mcbUQ==
X-Received: by 2002:adf:dc88:: with SMTP id
	r8-v6mr25630627wrj.166.1536143480165; 
	Wed, 05 Sep 2018 03:31:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c15-v6sm1182716wmb.2.2018.09.05.03.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 03:31:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Sep 2018 12:31:22 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180905103122.GD1795@jama>
References: <20180904155000.3715-1-ross.burton@intel.com>
	<CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 10:31:19 -0000
X-Groupsio-MsgNum: 115838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 01:19:28PM -0700, Andre McCurdy wrote:
> On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.com> wrote:
> > From: Joshua Lock <joshua.g.lock@intel.com>
> >
> > os-release (5) recommends that the os-release file be installed in
> > /usr/lib/os-release and that /etc/os-release be a relative symlink to i=
t.
> >
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-core/os-release/os-release.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-=
core/os-release/os-release.bb
> > index f9887047561..c6e36001dc5 100644
> > --- a/meta/recipes-core/os-release/os-release.bb
> > +++ b/meta/recipes-core/os-release/os-release.bb
> > @@ -1,7 +1,7 @@
> >  inherit allarch
> >
> >  SUMMARY =3D "Operating system identification"
> > -DESCRIPTION =3D "The /etc/os-release file contains operating system id=
entification data."
> > +DESCRIPTION =3D "The /usr/lib/os-release file contains operating syste=
m identification data."
> >  LICENSE =3D "MIT"
> >  INHIBIT_DEFAULT_DEPS =3D "1"
> >
> > @@ -42,6 +42,7 @@ python do_compile () {
> >  do_compile[vardeps] +=3D "${OS_RELEASE_FIELDS}"
> >
> >  do_install () {
> > -    install -d ${D}${sysconfdir}
> > -    install -m 0644 os-release ${D}${sysconfdir}/
> > +    install -d ${D}${libdir}
> > +    install -m 0644 os-release ${D}${libdir}/
> > +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}
>=20
> This probably needs an "rm -f ${D}${sysconfdir}/os-release" too to
> prevent problems if install is run twice as lnr doesn't handle the
> case where the target already exists.

Why do we need ${D} in first place? Doesn't

ln -snf ${libdir}/os-release ${D}${sysconfdir}

solve both issues?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW4+weAAKCRA3VSO3ZXaA
HNYlAJ9zqPrLywOPzUEHwuMoeVAqbTs/9ACgpWJN9kdvttb7zoFQl0JKggULRHY=
=2FJG
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
