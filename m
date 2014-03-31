Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 858716F751
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 15:11:34 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so6125861wgh.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JLaFz/5twDEGnMAPj5Seot+iUkUoijzc/SVUTtSqw0I=;
	b=oOn+y/CmJGrPqWeCc2XpshbrHz9FE7nunj5pjJ1cIfo5KMZHn2mr5jNA9rLYu6XSis
	eZUDFvreg/3j+zR0fv6ydhv0uM/1nRNY1mlxJONvXZQ/YWLMRUWnS5+sMxw4w3lFepqP
	i1kTTwtkkpiscyhysAngnYTHXzfUuS99DJepTLthxdTqeQJpiA6uaR0L/SVIBNuH+4Ji
	9WbaAXXF7jNSI/BYmWcbaFSNN7OyGEOEuD8P4Ud3lr5zII0wTyqwWXlWczFc/uoFUqOi
	LHbBXp81TrkKnjTzlgxDCh9CjqDit2syeZfSk0brBmYw46cpC7NClC6TPwYIXP9DIzjO
	OFmA==
X-Received: by 10.180.19.69 with SMTP id c5mr13073921wie.7.1396278694405;
	Mon, 31 Mar 2014 08:11:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a42sm33667436ees.10.2014.03.31.08.11.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 08:11:33 -0700 (PDT)
Date: Mon, 31 Mar 2014 17:11:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20140331151132.GH2425@jama>
References: <1396254930-11013-1-git-send-email-kai.kang@windriver.com>
	<1396254930-11013-2-git-send-email-kai.kang@windriver.com>
	<20140331102446.GB2425@jama> <53397DB0.4060900@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53397DB0.4060900@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Mon, 31 Mar 2014 15:11:36 -0000
X-Groupsio-MsgNum: 51926
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZY5CS28jBCfb727c"
Content-Disposition: inline

--ZY5CS28jBCfb727c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 10:37:36PM +0800, Kang Kai wrote:
> On 2014=E5=B9=B403=E6=9C=8831=E6=97=A5 18:24, Martin Jansa wrote:
> > On Mon, Mar 31, 2014 at 04:35:30PM +0800, Kai Kang wrote:
> >> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
> >>
> >> When install command sets the created directory mode, pseudo will chan=
ge
> >> the mode of the directory to 0700 incorrectly. Backport patch to fix i=
t.
> >>
> >> Drop PR as well.
> >>
> >> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   .../files/pseudo-1.5.1-install-directory-mode.patch    | 18 ++++++++=
++++++++++
> >>   meta/recipes-devtools/pseudo/pseudo_1.5.1.bb           |  3 +--
> >>   2 files changed, 19 insertions(+), 2 deletions(-)
> >>   create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-i=
nstall-directory-mode.patch
> >>
> >> diff --git a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-d=
irectory-mode.patch b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-insta=
ll-directory-mode.patch
> >> new file mode 100644
> >> index 0000000..e8eaf13
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-director=
y-mode.patch
> >> @@ -0,0 +1,18 @@
> >> +Upstream-Status: Backport
> >> +
> >> +when install command sets the created directory mode, pseudo will cha=
nge
> >> +the mode of the directory to 0700 incorrectly.
> >> +
> >> +Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> +
> >> +--- a/ports/unix/guts/mkdirat.c
> >> ++++ b/ports/unix/guts/mkdirat.c
> >> +@@ -25,6 +25,7 @@
> >> + 		stat_rc =3D base_fstatat(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> >> + #endif
> >> + 		if (stat_rc !=3D -1) {
> >> ++			buf.st_mode =3D PSEUDO_DB_MODE(buf.st_mode, mode);
> >> + 			pseudo_client_op(OP_MKDIR, 0, -1, dirfd, path, &buf);
> >> + 		} else {
> >> + 			pseudo_debug(1, "mkdir of %s succeeded, but stat failed: %s\n",
> >> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recip=
es-devtools/pseudo/pseudo_1.5.1.bb
> >> index bc92856..c265017 100644
> >> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> >> +++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> >> @@ -1,11 +1,10 @@
> >>   require pseudo.inc
> >>  =20
> >> -PR =3D "r4"
> > You cannot drop PR when PV/PE is the same, version goes backward (you
> > should notice QA Error about that).
>=20
> Sorry, forget that. But I didn't meet the QA Error. When should it=20
> appear, parse recipes or do_package_qa?

do_package_qa (iirc it needs buildhistory enabled in order to detect it
between "clean" builds).

> I'll send V2.
>=20
> Thanks,
> Kai
>=20
> >
> >> -
> >>   SRC_URI =3D " \
> >>       http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz=
2 \
> >>       file://0001-pseudo_has_unload-add-function.patch \
> >>       file://shutdownping.patch \
> >> +    file://pseudo-1.5.1-install-directory-mode.patch \
> >>   "
> >>  =20
> >>   SRC_URI[md5sum] =3D "5ec67c7bff5fe68c56de500859c19172"
> >> --=20
> >> 1.8.4
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZY5CS28jBCfb727c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM5haQACgkQN1Ujt2V2gBywZQCdETBF2OEcpHulxqND5wo6KG6r
Lr4AoK6nNwTyTKhIKoC6Q1sfIswECscz
=LixP
-----END PGP SIGNATURE-----

--ZY5CS28jBCfb727c--
