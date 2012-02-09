Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rvcdh-0006PY-56
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 23:38:53 +0100
Received: by eaal10 with SMTP id l10so600648eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 14:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NgDBCkdvaPSUe6KvFMjairGbwQJj7pdaMe3iBzXRWWM=;
	b=kCv8ff8lpSHfS+JZRedodPdOHlelIfLI1U9ySOH5HLE2aTXkzO6LXXjGUMPOoz/rlD
	RwNSkIY+uj/7KGLdTofuemh0rws9WvvWnLaf+kUbZE49rmu+XyO3UNwimucz5rC/E4gd
	Agj4bncrBjGSOYrz8oB4WLD8UuJfG1TB5XTB4=
Received: by 10.213.8.198 with SMTP id i6mr2516045ebi.41.1328826647780;
	Thu, 09 Feb 2012 14:30:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm14571824eeb.4.2012.02.09.14.30.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 14:30:46 -0800 (PST)
Date: Thu, 9 Feb 2012 23:30:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120209223044.GF10322@jama.jama.net>
References: <20120201151531.BE60410330@opal>
	<20120201153742.GA6969@jama.jama.net>
	<4F344389.7060005@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F344389.7060005@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Saul Wold : opkg-utils: convert to git repo at git.yoctoproject.org
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2012 22:38:53 -0000
X-Groupsio-MsgNum: 17356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Content-Disposition: inline

--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2012 at 02:07:05PM -0800, Saul Wold wrote:
> On 02/01/2012 07:37 AM, Martin Jansa wrote:
> > On Wed, Feb 01, 2012 at 03:15:31PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: b44717c29c4f50917570039adf896680d24bb216
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3Db44717c29c4f50917570039adf896680d24bb216
> >>
> >> Author: Saul Wold<sgw@linux.intel.com>
> >> Date:   Tue Jan 31 10:27:53 2012 -0800
> >>
> >> opkg-utils: convert to git repo at git.yoctoproject.org
> >>
> >> The svn.openmoko.org site seems to have become unstable, make a copy
> >> and convert to git at git.yoctoproject.org to preserve history
> >>
> >> [YOCTO #1867]
> >>
> >> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> >>
> >> ---
> >>
> >>   .../{opkg-utils_svn.bb =3D>  opkg-utils_git.bb}       |   10 +++++--=
---
> >>   1 files changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta=
/recipes-devtools/opkg-utils/opkg-utils_git.bb
> >> similarity index 82%
> >> rename from meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> >> rename to meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> >> index 9702131..d2dfda6 100644
> >> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> >> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> >> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512=
a9ba36caa9b7df079bae19f \
> >>                       file://opkg.py;beginline=3D1;endline=3D18;md5=3D=
15917491ad6bf7acc666ca5f7cc1e083"
> >>   RDEPENDS_${PN} =3D "python"
> >>   RDEPENDS_${PN}_virtclass-native =3D ""
> >> -SRCREV =3D "4747"
> >> -PV =3D "0.1.8+svnr${SRCPV}"
> >> -PR =3D "r7"
> >> +SRCREV =3D "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> >> +PV =3D "0.1.8+git${SRCPV}"
> >
> > Should this be +git or +gitr?
> >
> I believe that ultimately it should be +git, but we can't just changes=20
> these as it will cause the PV to go backwards.  I would suggest that as=
=20
> we move forward and PV's get updated we can move to +git instead of=20
> +gitr for oe-core

Why +git when we have +svnr not +svn? and both systems call it revision?

Wouldn't it be more consistent to use +gitr and then also we wouldn't
have this problem with PV going backwards..

I've another 137 recipes with +gitr in meta-smartphone where I'm not
going to wait for PV change..

Cheers,

> I would suggest the same for meta-oe and as we migrate other recipes=20
> from OE-classic and update PV they get converted.
>=20
> Sau!
>=20
> > in OE-classic we have mostly +gitr, +git is used only without SRCPV:
> > OE @ ~/oe $ git grep "+git\\$" | wc -l
> > 22
> > OE @ ~/oe $ git grep "+gitr\\$" | wc -l
> > 368
> >
> > meta-oe has always +gitr:
> > OE @ ~/meta-openembedded $ git grep "+gitr\\$" | wc -l
> > 24
> > OE @ ~/meta-openembedded $ git grep "+git\\$" | wc -l
> > 0
> >
> > and oe-core has mostly +git:
> > OE @ ~/openembedded-core $ git grep "+gitr\\$" | wc -l
> > 9
> > OE @ ~/openembedded-core $ git grep "+git\\$" | wc -l
> > 78
> >
> > It's only cosmetics but we should use one format if possible.
> >
> > http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manua=
l.html
> > doesn't say anything about SRCPV (only SRCREV) so nothing about prefered
> > +git(r).
> >
> > BTW: there are also 2 recipes not using SRCPV
> > meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb:PV =3D "2.0.pr=
e11+git${SRCREV}"
> > meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb:PV =3D "v2.0.pre=
16+git${SRCREV}"
> > 1 in meta-oe
> > meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb:PV =3D "3.4.0-${P=
R}+gitr${SRCREV}"
> >
> > Cheers,
> >
> >> +PR =3D "r0"
> >>
> >> -SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dopkg-uti=
ls;proto=3Dhttp \
> >> +SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
> >>              file://index-ignore-filenotfound.patch \
> >>              file://mtime-int.patch \
> >>              file://add-license-field.patch \
> >> @@ -18,7 +18,7 @@ SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;=
module=3Dopkg-utils;proto=3Dhttp \
> >>              file://shebang.patch \
> >>              "
> >>
> >> -S =3D "${WORKDIR}/opkg-utils"
> >> +S =3D "${WORKDIR}/git"
> >>
> >>   # Avoid circular dependencies from package_ipk.bbclass
> >>   PACKAGES_virtclass-native =3D ""
> >>
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk80SRQACgkQN1Ujt2V2gBxbfQCgjQeHXid4zKaT5EGqVirvITbf
bwAAnjL9b9i/xkarrNOoCa+8qFRtHvPA
=3YZY
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--
