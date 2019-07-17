Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5A37ECAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 12:17:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so24584073wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 05:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2+FF90ffCMO3uwxI34KGcI8l11SM8dx5Bsz0G4EVgVc=;
	b=no6T6ItsZ5nBMu+Zm12BwIQ809rBPj2E0DynOVU3YlhFppumiR9jIvxqUSndfjFdCL
	JJrbjPx6+HMyGVXsHnlfX4EGNHyF3QDMi3+fM5c13uzXwTKLkTNeEpXus3XbrRd3x6u5
	86eF0myhS9WfAy8exYvLjtl90YnuDiW0knCeLQjQUnC8B8ADpWSZBptMwt4dhbKgEXgc
	WE/SHplF6YYyrktHLoEifPLMMCn7XRzxpZrMOf2ihYkvw6r4+Q9VWBrM5ncnApNjiR5a
	i9I0CvLlkDPX0//UiTqcvMJuXplDaBGzTz0SDTejmy3g9X/qLLDe6FqICaYsLTttMboV
	aYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2+FF90ffCMO3uwxI34KGcI8l11SM8dx5Bsz0G4EVgVc=;
	b=krUqnUGANZo1T6HkNj3wKzWqbjWxg+hdPx7sWHwvM3IpgLZxQmgD7qe6/UjG49/qIU
	XaVv2aO6WvXGq6kv53fDcmap6j68GLoxcUy7HuFyuog0LD7W1btKTF8SejMVZHdaMjVf
	56mAuAmZ/QwWNg5pHp4C6NVDEycuRFN83O/ZXSHYvfJjkGYjMtK+Pihe589LfAJP3yKQ
	vzdwKAgk0IExtfidyg27FSQjr1ad2qfpkQZ2IcYbxo5GGdfqIboRAZCzenWus/f/PRpM
	CRxZAlT9Pqb7IlNqm4O6Qi0yFvcfOzetNVIv7sVkvjoFV35nfWn8bzRu+DzKxhbqRnVm
	PFwQ==
X-Gm-Message-State: APjAAAW5qdUZuTS4LgLRwiDDJ0yPcShDIYyHStfmIJ5L5QpZlZhUGSud
	EL3PJIj98yBtjg+IyDHwHbw=
X-Google-Smtp-Source: APXvYqw4zVVFWlAMmi7+vGZTsSVJiirZIVyljwFz6duuoU5PPZu2IQTbePFN4Kmer5eYM/JdfUH5Uw==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr30801128wrp.199.1563365848337; 
	Wed, 17 Jul 2019 05:17:28 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t13sm28299484wrr.0.2019.07.17.05.17.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 05:17:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 Jul 2019 14:17:33 +0200
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20190717121733.GA2242@jama>
References: <20190716215558.23327-1-adrian.ratiu@collabora.com>
	<CA+chaQdO2xLQR6z+xNTXYaqj4fvppguu6iVBZsLUXZLBgqC8xg@mail.gmail.com>
	<87d0i8g9oq.fsf@collabora.com>
MIME-Version: 1.0
In-Reply-To: <87d0i8g9oq.fsf@collabora.com>
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
X-List-Received-Date: Wed, 17 Jul 2019 12:17:28 -0000
X-Groupsio-MsgNum: 126879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 02:52:21PM +0300, Adrian Ratiu wrote:
> Hi
>=20
> On Wed, 17 Jul 2019, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Why don't you overwrite it with an override? We're doing that=20
> > for years without any issues.
>=20
> You mean a distro-wide override in a .conf?

yes

> Can you please point to an example?

https://github.com/webosose/meta-webosose/blob/master/meta-webos/conf/distr=
o/include/webos.inc#L256

> > On Wed, Jul 17, 2019 at 12:01 AM Adrian Ratiu <adrian.ratiu@collabora.c=
om>
> > wrote:
> >
> >> Some distributions for various reasons (like for example mounting a
> >> tmpfs over /var at runtime) can't use /var/lib to store the opkg
> >> metadata, so a different path is required to have a functioning
> >> package manager.
> >>
> >> ${localstatedir} can't be modified to something other than the
> >> hardcoded value in bitbake.conf because other recipes depending on it
> >> will fail to install.
> >>
> >> So the only recourse, which is also the least invasive, is to allow
> >> distros to overwrite the OPKGLIBDIR variable just like they are also
> >> allowed to overwrite OPKGBUILDCMD.
> >>
> >> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> >> ---
> >>  meta/classes/package_ipk.bbclass         | 2 +-
> >>  meta/classes/rootfs_ipk.bbclass          | 2 +-
> >>  meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/classes/package_ipk.bbclass
> >> b/meta/classes/package_ipk.bbclass
> >> index d1b317b42b..9f9da2f91d 100644
> >> --- a/meta/classes/package_ipk.bbclass
> >> +++ b/meta/classes/package_ipk.bbclass
> >> @@ -14,7 +14,7 @@ OPKG_ARGS +=3D "--force_postinstall
> >> --prefer-arch-to-version"
> >>  OPKG_ARGS +=3D "${@['',
> >> '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") =3D=3D "1"]}"
> >>  OPKG_ARGS +=3D "${@['', '--add-exclude ' + ' --add-exclude
> >> '.join((d.getVar('PACKAGE_EXCLUDE') or
> >> "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() !=3D ""]}"
> >>
> >> -OPKGLIBDIR =3D "${localstatedir}/lib"
> >> +OPKGLIBDIR ??=3D "${localstatedir}/lib"
> >>
> >>  python do_package_ipk () {
> >>      workdir =3D d.getVar('WORKDIR')
> >> diff --git a/meta/classes/rootfs_ipk.bbclass
> >> b/meta/classes/rootfs_ipk.bbclass
> >> index aabc370cfc..e73d2bfdae 100644
> >> --- a/meta/classes/rootfs_ipk.bbclass
> >> +++ b/meta/classes/rootfs_ipk.bbclass
> >> @@ -21,7 +21,7 @@ OPKG_PREPROCESS_COMMANDS =3D ""
> >>
> >>  OPKG_POSTPROCESS_COMMANDS =3D ""
> >>
> >> -OPKGLIBDIR =3D "${localstatedir}/lib"
> >> +OPKGLIBDIR ??=3D "${localstatedir}/lib"
> >>
> >>  MULTILIBRE_ALLOW_REP =3D "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
> >>
> >> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> index 8c48d3097c..c663eff13b 100644
> >> --- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> +++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> >> @@ -28,7 +28,7 @@ PACKAGES =3D+ "libopkg"
> >>  inherit autotools pkgconfig systemd ptest
> >>
> >>  target_localstatedir :=3D "${localstatedir}"
> >> -OPKGLIBDIR =3D "${target_localstatedir}/lib"
> >> +OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
> >>
> >>  PACKAGECONFIG ??=3D "libsolv"
> >>
> >> --
> >> 2.22.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXS8R3AAKCRA3VSO3ZXaA
HIJ3AKCI8MvF3BKQwYfoCLWH2m+U4ZFHFgCfTaB7YGTOKoQK19wKBKYLWtIPgDM=
=3D2t
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
