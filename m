Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7F5E60107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 14:40:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so25182668wru.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Q9pxCQKzRRk9nNqopYmspvadwxm/ekCGNidqSxUeMv0=;
	b=Uqo0PXdlApPCBv5GQ5k1Y7THcDYgGz+SP1EVetWvlB1f0bQozZ6oQEiBfyDmPSqfVI
	aSyF8M0XaBCssRq8dtBFahAKHZc0aIPOSZl/8O9iB6TUbz84fM3PBnCptJYsG1eBCZCG
	Ke0/OIRma0OrRREq+sCjFDA+1HnbsOa7jBy1dXuMacpEZvD+l1+14QcifHQUj4zOE5Vf
	xM7XPzcxwd5dyXC/jaDUpMhdPqyIIfkBp7107NGs8/KFGob00FqqMgKZnr7DVUB39YWJ
	6syDiC2EHdJqb0tjhqY9AIWI1bG8h24sq5Jp4yRupbHYOvblQBA/vAwDw8/NahKA4IVd
	qDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Q9pxCQKzRRk9nNqopYmspvadwxm/ekCGNidqSxUeMv0=;
	b=IqErleqVAMBEXKc1Gfp/AQKRVCpiPmFSV0FHUBwU9edKY4BVuCYievUhTzeV2cNUx7
	UNfqmsBBDvboDrebdoAvhCFHkepMfmb3boBkr6xd9NQaoUhvKwNk8vybfn5vAEZQQDW+
	Fmyr6bjXkrHBE0A5jJlfJGs2+MiHB6LYc4VLzp13Fqdx70nyzK+fsCeibr2L/rBE9aFY
	Pd0ju+FuJWx/J0rFT3r/wxqv7FwPAcI88w++wB9jw3BcO71ifIOqlE4smEVa+koxc+Lm
	d4WIzkxs1rJ7ntrkcq+y+0FHZCGNoaKezBU73cYjU+keckgdLFeui1buuDvQfqJXOxbw
	EmEg==
X-Gm-Message-State: APjAAAU1QGb1E53jikLT7amuFO64pPT6FTB00x+RwCXM6E+K5xpmDYJE
	+yXX1LjjzYdkmlfkbuthTXQ=
X-Google-Smtp-Source: APXvYqyjN2tPlECTlFQnb2kvfnbFNSh/QvKHysZ1DV5Of4bjRngcQI6n1PK9vOMWAdNB+5OmXfqjag==
X-Received: by 2002:adf:e504:: with SMTP id j4mr42346888wrm.222.1563374457178; 
	Wed, 17 Jul 2019 07:40:57 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	g131sm16405781wmf.37.2019.07.17.07.40.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 07:40:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Jul 2019 16:41:01 +0200
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20190717144101.GB2242@jama>
References: <20190716215558.23327-1-adrian.ratiu@collabora.com>
	<CA+chaQdO2xLQR6z+xNTXYaqj4fvppguu6iVBZsLUXZLBgqC8xg@mail.gmail.com>
	<87d0i8g9oq.fsf@collabora.com> <20190717121733.GA2242@jama>
	<87a7dcg2yt.fsf@collabora.com>
MIME-Version: 1.0
In-Reply-To: <87a7dcg2yt.fsf@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg/package/rootfs_ipk: allow overwriting OPKGLIBDIR
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
X-List-Received-Date: Wed, 17 Jul 2019 14:40:57 -0000
X-Groupsio-MsgNum: 126885
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline

--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 05:17:30PM +0300, Adrian Ratiu wrote:
> On Wed, 17 Jul 2019, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Wed, Jul 17, 2019 at 02:52:21PM +0300, Adrian Ratiu wrote:=20
> >> Hi  On Wed, 17 Jul 2019, Martin Jansa <martin.jansa@gmail.com>=20
> >> wrote:=20
> >> > Why don't you overwrite it with an override? We're doing that=20
> >> > for years without any issues.=20
> >>  You mean a distro-wide override in a .conf?=20
> >=20
> > yes=20
> >=20
> >> Can you please point to an example?=20
> >=20
> > https://github.com/webosose/meta-webosose/blob/master/meta-webos/conf/d=
istro/include/webos.inc#L256=20
>=20
> Thanks, I didn't know about the _forcevariable override.
>=20
> Is using _forcevariable the preferred method to do this though=20
> instead of using ??=3D ?
>=20
> The reference manual says it's not recommended and a "worst case"=20
> solution...

You can use any other override from OVERRIDES variables which covers all
cases you want to cover.

I was using ${DISTRO} before, but switched to forcevariable later,
because I needed to cover more DISTROs at the same time.

https://github.com/openwebos/meta-webos/commit/8c79f89fac09364e5ce494ee5fab=
133e7734583f#diff-e2b7938279c801074fb285c60acf2228

forcevariable is OK as long as you know what you're doing, if your
distro really enforces different OPKGLIBDIR for good reason, then the
users probably won't ever need to override it again locally.

Using ??=3D for every variable, just because someone somewhere might
prefer different value doesn't look much better IMHO.

Cheers,

> >
> >> > On Wed, Jul 17, 2019 at 12:01 AM Adrian Ratiu <adrian.ratiu@collabor=
a.com>
> >> > wrote:
> >> >
> >> >> Some distributions for various reasons (like for example mounting a
> >> >> tmpfs over /var at runtime) can't use /var/lib to store the opkg
> >> >> metadata, so a different path is required to have a functioning
> >> >> package manager.
> >> >>
> >> >> ${localstatedir} can't be modified to something other than the
> >> >> hardcoded value in bitbake.conf because other recipes depending on =
it
> >> >> will fail to install.
> >> >>
> >> >> So the only recourse, which is also the least invasive, is to allow
> >> >> distros to overwrite the OPKGLIBDIR variable just like they are also
> >> >> allowed to overwrite OPKGBUILDCMD.
> >> >>
> >> >> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> >> >> ---
> >> >>  meta/classes/package_ipk.bbclass         | 2 +-
> >> >>  meta/classes/rootfs_ipk.bbclass          | 2 +-
> >> >>  meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
> >> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >> >>
> >> >> diff --git a/meta/classes/package_ipk.bbclass
> >> >> b/meta/classes/package_ipk.bbclass
> >> >> index d1b317b42b..9f9da2f91d 100644
> >> >> --- a/meta/classes/package_ipk.bbclass
> >> >> +++ b/meta/classes/package_ipk.bbclass
> >> >> @@ -14,7 +14,7 @@ OPKG_ARGS +=3D "--force_postinstall
> >> >> --prefer-arch-to-version"
> >> >>  OPKG_ARGS +=3D "${@['',
> >> >> '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") =3D=3D "1=
"]}"
> >> >>  OPKG_ARGS +=3D "${@['', '--add-exclude ' + ' --add-exclude
> >> >> '.join((d.getVar('PACKAGE_EXCLUDE') or
> >> >> "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() !=3D ""]}"
> >> >>
> >> >> -OPKGLIBDIR =3D "${localstatedir}/lib"
> >> >> +OPKGLIBDIR ??=3D "${localstatedir}/lib"
> >> >>
> >> >>  python do_package_ipk () {
> >> >>      workdir =3D d.getVar('WORKDIR')
> >> >> diff --git a/meta/classes/rootfs_ipk.bbclass
> >> >> b/meta/classes/rootfs_ipk.bbclass
> >> >> index aabc370cfc..e73d2bfdae 100644
> >> >> --- a/meta/classes/rootfs_ipk.bbclass
> >> >> +++ b/meta/classes/rootfs_ipk.bbclass
> >> >> @@ -21,7 +21,7 @@ OPKG_PREPROCESS_COMMANDS =3D ""
> >> >>
> >> >>  OPKG_POSTPROCESS_COMMANDS =3D ""
> >> >>
> >> >> -OPKGLIBDIR =3D "${localstatedir}/lib"
> >> >> +OPKGLIBDIR ??=3D "${localstatedir}/lib"
> >> >>
> >> >>  MULTILIBRE_ALLOW_REP =3D "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
> >> >>
> >> >> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> >> b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> >> index 8c48d3097c..c663eff13b 100644
> >> >> --- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> >> +++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> >> @@ -28,7 +28,7 @@ PACKAGES =3D+ "libopkg"
> >> >>  inherit autotools pkgconfig systemd ptest
> >> >>
> >> >>  target_localstatedir :=3D "${localstatedir}"
> >> >> -OPKGLIBDIR =3D "${target_localstatedir}/lib"
> >> >> +OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
> >> >>
> >> >>  PACKAGECONFIG ??=3D "libsolv"
> >> >>
> >> >> --
> >> >> 2.22.0
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >>
> >
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXS8zfAAKCRA3VSO3ZXaA
HEPTAKCKy8Ie6qklodlYDTJ5wVPLhwm0EACaA06de7jBHy2fYqEtkUlK28I8Fa8=
=3MaE
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
