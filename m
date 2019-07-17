Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF2857EC70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 14:43:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x4so25102034wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Bmu0wTJIddr79Kx6WvoREDfqMmdrbzOjIoOlRlvdbg4=;
	b=vL6RbMu88ByCxRRYEYjSo5+ZWYaWWLuKDOqXQJqKj7lBNS+bf/dn9h4lW96YVi+xEn
	qjxLvqcHsV901QF2/50xIHbfpTz48oPrbPRhFa4zujjraEBacgDF3niPHu/v1Z4+w08v
	KueOqW2TwQzmHRMTrO1nzs2YupK8eiN/vNGVF3A7x4lGNtBLxv7cNbAIB2swKyiWhbqV
	lyLNfgd9WN/cpWx8Jgevm52B3JQCMGgTCCPSN0521Ugo2vE7qwnd1cqdHrhc4KMmYQ6C
	s+CmNo161v+V3UD2QJtzJx6Fh26HBW3DqNQTi20dYNuuXqj15cGY+hrkEOlqMzzhtJvg
	1Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Bmu0wTJIddr79Kx6WvoREDfqMmdrbzOjIoOlRlvdbg4=;
	b=lc028YXhlhTgQVxn6zZbCjHg504Js3gUjNpq5EweidqQVk1s1qTmVy6YEA9hLznWhd
	sIaAOGVnqMlxHXEmp4A1nYAum6ozqKf1g8QxcpjyYZYIowS1f0fjhNbIfBjtcKjFezfp
	+9VScrWQMgboLSr3GqOGv+UNwqgiPNqw/UvgoNs1IscmycNUxTraVjtHYqAIqG/Kt+qU
	jEMH1k4/voel6iqH2iClo9SKVS+lP0sllib2ZXsvR/VwUQ0YuZPCxvLerQZ+z069HwAz
	qy1b21tqzYrxjNs3Fk4stmgKHt5Ym4HPYk1ODlqWIErvREtNmPpzB9fjVJTfAR6NT8ve
	PH3g==
X-Gm-Message-State: APjAAAXjwYValJ8ZzIb9NFRR5DjvgPz1TAMHU7m2TP6zWU19tO48S0ET
	UgFgcie40tOcTfcsv+rZNGLPUvwPw74=
X-Google-Smtp-Source: APXvYqyXmTHEljK0gdrhue8Kuu4gTHbiI+EQVWXNbhPfWs/ox0BjKAicyW75s1+nVcQM248fX2kiTw==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr45014634wrp.188.1563374608276; 
	Wed, 17 Jul 2019 07:43:28 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j6sm33575041wrx.46.2019.07.17.07.43.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 07:43:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Jul 2019 16:43:33 +0200
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20190717144333.GC2242@jama>
References: <20190716215558.23327-1-adrian.ratiu@collabora.com>
	<CA+chaQdO2xLQR6z+xNTXYaqj4fvppguu6iVBZsLUXZLBgqC8xg@mail.gmail.com>
	<87d0i8g9oq.fsf@collabora.com> <20190717121733.GA2242@jama>
	<87a7dcg2yt.fsf@collabora.com> <20190717144101.GB2242@jama>
MIME-Version: 1.0
In-Reply-To: <20190717144101.GB2242@jama>
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
X-List-Received-Date: Wed, 17 Jul 2019 14:43:28 -0000
X-Groupsio-MsgNum: 126886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline

--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 04:41:01PM +0200, Martin Jansa wrote:
> On Wed, Jul 17, 2019 at 05:17:30PM +0300, Adrian Ratiu wrote:
> > On Wed, 17 Jul 2019, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > On Wed, Jul 17, 2019 at 02:52:21PM +0300, Adrian Ratiu wrote:=20
> > >> Hi  On Wed, 17 Jul 2019, Martin Jansa <martin.jansa@gmail.com>=20
> > >> wrote:=20
> > >> > Why don't you overwrite it with an override? We're doing that=20
> > >> > for years without any issues.=20
> > >>  You mean a distro-wide override in a .conf?=20
> > >=20
> > > yes=20
> > >=20
> > >> Can you please point to an example?=20
> > >=20
> > > https://github.com/webosose/meta-webosose/blob/master/meta-webos/conf=
/distro/include/webos.inc#L256=20
> >=20
> > Thanks, I didn't know about the _forcevariable override.
> >=20
> > Is using _forcevariable the preferred method to do this though=20
> > instead of using ??=3D ?
> >=20
> > The reference manual says it's not recommended and a "worst case"=20
> > solution...
>=20
> You can use any other override from OVERRIDES variables which covers all
> cases you want to cover.
>=20
> I was using ${DISTRO} before, but switched to forcevariable later,
> because I needed to cover more DISTROs at the same time.
>=20
> https://github.com/openwebos/meta-webos/commit/8c79f89fac09364e5ce494ee5f=
ab133e7734583f#diff-e2b7938279c801074fb285c60acf2228
>=20
> forcevariable is OK as long as you know what you're doing, if your
> distro really enforces different OPKGLIBDIR for good reason, then the
> users probably won't ever need to override it again locally.
>=20
> Using ??=3D for every variable, just because someone somewhere might
> prefer different value doesn't look much better IMHO.

Also see first bullet point of the commit referenced above:
http://lists.openembedded.org/pipermail/openembedded-core/2013-February/192=
720.html
so making it easily to change this variable is just allowing more people
to break u-a more easily.

> Cheers,
>=20
> > >
> > >> > On Wed, Jul 17, 2019 at 12:01 AM Adrian Ratiu <adrian.ratiu@collab=
ora.com>
> > >> > wrote:
> > >> >
> > >> >> Some distributions for various reasons (like for example mounting=
 a
> > >> >> tmpfs over /var at runtime) can't use /var/lib to store the opkg
> > >> >> metadata, so a different path is required to have a functioning
> > >> >> package manager.
> > >> >>
> > >> >> ${localstatedir} can't be modified to something other than the
> > >> >> hardcoded value in bitbake.conf because other recipes depending o=
n it
> > >> >> will fail to install.
> > >> >>
> > >> >> So the only recourse, which is also the least invasive, is to all=
ow
> > >> >> distros to overwrite the OPKGLIBDIR variable just like they are a=
lso
> > >> >> allowed to overwrite OPKGBUILDCMD.
> > >> >>
> > >> >> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> > >> >> ---
> > >> >>  meta/classes/package_ipk.bbclass         | 2 +-
> > >> >>  meta/classes/rootfs_ipk.bbclass          | 2 +-
> > >> >>  meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
> > >> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> > >> >>
> > >> >> diff --git a/meta/classes/package_ipk.bbclass
> > >> >> b/meta/classes/package_ipk.bbclass
> > >> >> index d1b317b42b..9f9da2f91d 100644
> > >> >> --- a/meta/classes/package_ipk.bbclass
> > >> >> +++ b/meta/classes/package_ipk.bbclass
> > >> >> @@ -14,7 +14,7 @@ OPKG_ARGS +=3D "--force_postinstall
> > >> >> --prefer-arch-to-version"
> > >> >>  OPKG_ARGS +=3D "${@['',
> > >> >> '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") =3D=3D =
"1"]}"
> > >> >>  OPKG_ARGS +=3D "${@['', '--add-exclude ' + ' --add-exclude
> > >> >> '.join((d.getVar('PACKAGE_EXCLUDE') or
> > >> >> "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() !=3D ""=
]}"
> > >> >>
> > >> >> -OPKGLIBDIR =3D "${localstatedir}/lib"
> > >> >> +OPKGLIBDIR ??=3D "${localstatedir}/lib"
> > >> >>
> > >> >>  python do_package_ipk () {
> > >> >>      workdir =3D d.getVar('WORKDIR')
> > >> >> diff --git a/meta/classes/rootfs_ipk.bbclass
> > >> >> b/meta/classes/rootfs_ipk.bbclass
> > >> >> index aabc370cfc..e73d2bfdae 100644
> > >> >> --- a/meta/classes/rootfs_ipk.bbclass
> > >> >> +++ b/meta/classes/rootfs_ipk.bbclass
> > >> >> @@ -21,7 +21,7 @@ OPKG_PREPROCESS_COMMANDS =3D ""
> > >> >>
> > >> >>  OPKG_POSTPROCESS_COMMANDS =3D ""
> > >> >>
> > >> >> -OPKGLIBDIR =3D "${localstatedir}/lib"
> > >> >> +OPKGLIBDIR ??=3D "${localstatedir}/lib"
> > >> >>
> > >> >>  MULTILIBRE_ALLOW_REP =3D "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
> > >> >>
> > >> >> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> > >> >> b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> > >> >> index 8c48d3097c..c663eff13b 100644
> > >> >> --- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> > >> >> +++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> > >> >> @@ -28,7 +28,7 @@ PACKAGES =3D+ "libopkg"
> > >> >>  inherit autotools pkgconfig systemd ptest
> > >> >>
> > >> >>  target_localstatedir :=3D "${localstatedir}"
> > >> >> -OPKGLIBDIR =3D "${target_localstatedir}/lib"
> > >> >> +OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
> > >> >>
> > >> >>  PACKAGECONFIG ??=3D "libsolv"
> > >> >>
> > >> >> --
> > >> >> 2.22.0
> > >> >>
> > >> >> --
> > >> >> _______________________________________________
> > >> >> Openembedded-core mailing list
> > >> >> Openembedded-core@lists.openembedded.org
> > >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >> >>
> > >
> > > --=20
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXS80FQAKCRA3VSO3ZXaA
HOK1AJ4uoeoSIwiMvFeZhdYm7OiO+XhOQQCdEqVaBeEeiAJO9ZSgYe8wqXfrxtQ=
=STU+
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
