Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S11Pc-0001FR-GI
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 21:06:40 +0100
Received: by eaal10 with SMTP id l10so1297303eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 11:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.130.208 as permitted sender) client-ip=10.14.130.208; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.130.208 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.130.208])
	by 10.14.130.208 with SMTP id k56mr2272297eei.123.1330113497858
	(num_hops = 1); Fri, 24 Feb 2012 11:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5W/2gpEEBkgksZJ/ml7uJRJxPVUU78aQn83OtMqhARg=;
	b=SO8+AlRknQ+CsUD3fJlgs9BNQowWxnIqWzQ5XkQI4ymMlVCukzra+lR4NL49kt/klz
	q8XeiIVI4sxtY1EGW9I6C/AJ+VcxpxzKFfDltVTz0V3XN7ltyUSNXoXIVfR6aoSUwz8K
	ekGXKC1c4FLI/k73+QOTOUyD/D53kVfgW306s=
Received: by 10.14.130.208 with SMTP id k56mr1698912eei.123.1330113497755;
	Fri, 24 Feb 2012 11:58:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm21788398eea.5.2012.02.24.11.58.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 11:58:14 -0800 (PST)
Date: Fri, 24 Feb 2012 20:58:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120224195812.GM3769@jama.jama.net>
References: <cover.1330109787.git.sgw@linux.intel.com>
	<e8916ebbe105cd17ac91f389787dabddf78028e7.1330109787.git.sgw@linux.intel.com>
	<20120224190842.GL3769@jama.jama.net>
	<4F47E6E7.6050808@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F47E6E7.6050808@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gnupg: Update checksum, fix configure and compliation issues
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
X-List-Received-Date: Fri, 24 Feb 2012 20:06:40 -0000
X-Groupsio-MsgNum: 17944
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qwymS7QpGZeA8tRa"
Content-Disposition: inline

--qwymS7QpGZeA8tRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 11:37:11AM -0800, Saul Wold wrote:
> On 02/24/2012 11:08 AM, Martin Jansa wrote:
> > On Fri, Feb 24, 2012 at 10:59:20AM -0800, Saul Wold wrote:
> >> This recipe was added, but did not have the correct
> >> checksum information for the LIC_FILES_CHKSUM or the
> >> SRC_URI.  Also disable Documetnation for now due to
> >> older autotools issue.
> >
> > BTW: those checksums matches gnupg_1.4.10 which is available in
> > oe-classic and there is also similar patch (like mpfr from today)
> > for thumb issues in gnupg/mpi/longlong.h.
> >
> I am kind of suprised and confused by this, how could the 1.4.10 which=20
> is a GPLv3 license have the same checksum as the 1.4.7 version.  I just=
=20
> verified (again) the md5sum of the 1.4.7 version and it's correct.

I meant that those old (wrong) checksums were from 1.4.10 version, so I
wanted to point it out in case someone wanted to actually upgrade gnupg
recipe and forgot "git mv", but if 1.4.7 is last GPLv2 then someone
probably downgraded recipe from 1.4.10 to 1.4.7 and just forgot to
update checksums.

> I also have the long-long-thumb.patch in this version, or is the same as=
=20
> the oe-classic version.

Ah sorry I haven't looked carefully enough.. yeah it's the same as
oe-classic has.

> Are you suggesting I need something else?

You're fine.. I need coffee or sleep :).

> > Maybe it would be worth updating from there if there isn't reason to
> > hold on 1.4.7.
> >
> We need 1.4.7 because it's the last GPLv2 version.

Cheers,

> >> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> >> ---
> >>   .../gnupg/gnupg-1.4.7/configure.patch              |   17 ++++++++++=
+++++++
> >>   meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   17 +++++++++-=
-------
> >>   2 files changed, 26 insertions(+), 8 deletions(-)
> >>   create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/configure.=
patch
> >>
> >> diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch b/=
meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
> >> new file mode 100644
> >> index 0000000..e005ac6
> >> --- /dev/null
> >> +++ b/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
> >> @@ -0,0 +1,17 @@
> >> +
> >> +Upstream-Status: Inappropriate [configuration]
> >> +
> >> +Signed-off-by: Saul Wold<sgw@linux.intel.com>
> >> +
> >> +Index: gnupg-1.4.7/configure.ac
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- gnupg-1.4.7.orig/configure.ac
> >> ++++ gnupg-1.4.7/configure.ac
> >> +@@ -827,7 +827,6 @@ else
> >> +   AC_SUBST(USE_NLS)
> >> +   AC_SUBST(USE_INCLUDED_LIBINTL)
> >> +   AC_SUBST(BUILD_INCLUDED_LIBINTL)
> >> +-  AM_PO_SUBDIRS
> >> + fi
> >> +
> >> + if test "$try_extensions" =3D yes || test x"$card_support" =3D xyes =
; then
> >> diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-=
support/gnupg/gnupg_1.4.7.bb
> >> index daea5aa..f033659 100644
> >> --- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> >> +++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> >> @@ -5,18 +5,18 @@ SECTION =3D "console/utils"
> >>
> >>   LICENSE =3D "GPLv2"
> >>
> >> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68=
b5c50a"
> >>
> >> -PR =3D "r4"
> >> +PR =3D "r5"
> >>
> >>   SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
> >>              file://long-long-thumb.patch \
> >> -           file://mips_gcc4.4.patch"
> >> +           file://configure.patch \
> >> +           file://mips_gcc4.4.patch \
> >> +           file://curl_typeof_fix_backport.patch"
> >>
> >> -SRC_URI[md5sum] =3D "dcf7ed712997888d616e029637bfc303"
> >> -SRC_URI[sha256sum] =3D "a2907f4432d67894e425e48ae85785dd60ecb01658c96=
82bcd96f5e91043bb38"
> >> -
> >> -S =3D "${WORKDIR}/gnupg-${PV}"
> >> +SRC_URI[md5sum] =3D "b06a141cca5cd1a55bbdd25ab833303c"
> >> +SRC_URI[sha256sum] =3D "69d18b7d193f62ca27ed4febcb4c9044aa0c95305d325=
8fe902e2fae5fc6468d"
> >>
> >>   inherit autotools gettext
> >>
> >> @@ -73,7 +73,8 @@ EXTRA_OECONF =3D "--disable-ldap \
> >>   		--with-bzip2=3D${STAGING_LIBDIR}/.. \
> >>   		--disable-selinux-support \
> >>                   --with-readline=3D${STAGING_LIBDIR}/.. \
> >> -                ac_cv_sys_symbol_underscore=3Dyes"
> >> +                ac_cv_sys_symbol_underscore=3Dno \
> >> +		"
> >>
> >>   do_install () {
> >>   	autotools_do_install
> >> --
> >> 1.7.7.6
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qwymS7QpGZeA8tRa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9H69QACgkQN1Ujt2V2gBwvHgCfRGOltFx0ULBO9Y/PwApkaEfv
iJcAoJ3/0Zm8/qv5sK478nzNJUHP21/V
=4NRq
-----END PGP SIGNATURE-----

--qwymS7QpGZeA8tRa--
