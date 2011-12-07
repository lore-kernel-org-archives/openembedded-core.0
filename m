Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYBpe-0001h4-Jr
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 08:22:22 +0100
Received: by eaao14 with SMTP id o14so143429eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 23:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rGIRQD0W87yKAZf5bqY5iFDYPHPySiXT+oIaivl1yM4=;
	b=ZUmOxX44W4iUs9rC8238z4LbZAll5XCtRH1IrjLVPH3pDNm5ydvAUZqMEh9LX0vmT+
	LWDzpSXOB7oUzU0ZPTiGIdLr7I4ZIQ+3PYVCqIsrCrJ6nm4mp6uYph+7v5WH8qF8wqHW
	Hk07tlC4toGtcznSk3TituhJy5+U4n4rL14Yk=
Received: by 10.213.35.194 with SMTP id q2mr200770ebd.86.1323242130580;
	Tue, 06 Dec 2011 23:15:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c9sm2561710eeb.0.2011.12.06.23.15.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 23:15:28 -0800 (PST)
Date: Wed, 7 Dec 2011 08:15:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207071516.GA3897@jama.jama.net>
References: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANk4oH-dDHDZHW+ioRi13AXCS3rBNiUeUZGRZisg56fQfw@mail.gmail.com>
	<20111206172306.GC5456@jama.jama.net>
	<1323210242.19363.46.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1323210242.19363.46.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: change APACHE_MIRROR to use archive site
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
X-List-Received-Date: Wed, 07 Dec 2011 07:22:22 -0000
X-Groupsio-MsgNum: 13705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2011 at 10:24:02PM +0000, Richard Purdie wrote:
> On Tue, 2011-12-06 at 18:23 +0100, Martin Jansa wrote:
> > On Tue, Dec 06, 2011 at 07:15:57AM -0700, Chris Larson wrote:
> > > On Tue, Dec 6, 2011 at 2:28 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> > > > * there are newest as well as older releases, so the SRC_URIs are v=
alid longer
> > > > * someone with fast line should try to redownload world to see if t=
he
> > > >  structure is the same for all projects (checked for subversion)
> > >=20
> > > Would it not be better to do what we do for other projects, and add
> > > the archive URI to either the global MIRRORS for fallback, or prepend
> > > to MIRRORS in the appropriate .inc?
> >=20
> > You're right, it's even there already (I didn't know).. but it didn't w=
ork for me with subversion...
> >=20
> > somehow it managed to append subversion-1.7.1.tar.bz2 twice
>=20
> Try:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drpurdi=
e/useradd4&id=3D1b4003386bb1849d115f9b2f90594a60fbbf56cc
>=20
> We really need a regression test for that function, its horrible...

OE om-gta02@shr ~/shr-core $ bitbake -D -b openembedded-core/meta/recipes-d=
evtools/subversion/subversion_1.7.1.bb -c fetch
DEBUG: Removed the following variables from the environment: PSEUDO_BINDIR,=
 PSEUDO_LOCALSTATEDIR, LESS, LESSOPEN, PSEUDO_LIBDIR, HG, INFOPATH, SHLVL, =
CONFIG_PROTECT_MASK, WINDOW, EDITOR, MANPATH, BBFETCH2, LD_PRELOAD, GCC_SPE=
CS, STY, PSEUDO_OPTS, TERMCAP, LD_LIBRARY_PATH, BUILDDIR, PSEUDO_PREFIX, LS=
_COLORS, PAGER, OPENGL_PROFILE
DEBUG: Clearing SRCREV cache due to cache policy of: clear
DEBUG: Using cache in '/OE/shr-core/tmp-eglibc/cache/bb_codeparser.dat' for=
 codeparser cache
WARNING: Buildfile specified, dependencies will not be handled. If this is =
not what you want, do not use -b / --buildfile.
DEBUG: collecting .bb files
DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux',=
 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux',=
 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']
DEBUG: providers for subversion are: ['subversion']
DEBUG: selecting openembedded-core/meta/recipes-devtools/subversion/subvers=
ion_1.7.1.bb as PREFERRED_VERSION 1.7.% of package subversion (for item sub=
version)
DEBUG: sorted providers for subversion are: ['openembedded-core/meta/recipe=
s-devtools/subversion/subversion_1.7.1.bb']

OE Build Configuration:
BB_VERSION        =3D "1.15.0"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "om-gta02"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "20111207"
TUNE_FEATURES     =3D "armv4 thumb arm920t"
TARGET_FPU        =3D "soft"
meta-jama         =3D "master:9c3e2ddc68f9dc96c3a1f700226954027771aa0d"
meta-shr
meta-aurora
meta-fso          =3D "master:4678b2f7ff38261f6b0bb7ed34b0c25c0ad204e6"
meta-efl
meta-oe
meta-gnome
meta-gpe          =3D "jansa/test:c6cc32c7466cf85c9c515717afe5eb25e2d773b3"
meta-nokia
meta-htc
meta-palm
meta-openmoko
meta-samsung      =3D "master:4678b2f7ff38261f6b0bb7ed34b0c25c0ad204e6"
meta-handheld     =3D "jansa/spitz:d31a0ccb76559fbf19d7320814a4aff3dca21477"
meta              =3D "jansa/test:644e9c55686133a3214fb17b8501195a951d4c73"

NOTE: Preparing runqueue
NOTE: Marking Active Tasks
NOTE: Pruned 26 inactive tasks, 1 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
NOTE: Executing RunQueue Tasks
DEBUG: Skip list (pre setsceneverify) []
DEBUG: Full skip list set([])
DEBUG: Using runqueue scheduler 'completion'
NOTE: Running task 1 of 1 (ID: 0, openembedded-core/meta/recipes-devtools/s=
ubversion/subversion_1.7.1.bb, do_fetch)
NOTE: package subversion-1.7.1-r0: task do_fetch: Started
WARNING: Fetcher failure for URL: 'None'. Fetch command export HOME=3D"/OE"=
; export GIT_CONFIG=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/et=
c/gitconfig"; export PATH=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/=
usr/bin/armv4t-oe-linux-gnueabi:/OE/shr-core/tmp-eglibc/sysroots/om-gta02/u=
sr/bin/crossscripts:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/sbin:=
/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/OE/shr-core/tmp-egli=
bc/sysroots/x86_64-linux/sbin:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux=
//bin:/OE/shr-core/openembedded-core/scripts:/OE/bin:/usr/local/bin:/usr/bi=
n:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.2:/OE/shr-core/openemb=
edded-core/scripts"; /usr/bin/env wget -t 5 -q --passive-ftp --no-check-cer=
tificate -P /OE/shr-core/downloads 'http://www.apache.org/dist/subversion/s=
ubversion-1.7.1.tar.bz2' failed with signal 8, output:

ERROR: http
ERROR: ftp
ERROR: ftp
ERROR: ftp
ERROR: ftp
ERROR: ftp
ERROR: http
ERROR: ftp
ERROR: http
ERROR: archive.apache.org
ERROR: /dist/subversion/subversion-1.7.1.tar.bz2
ERROR:
ERROR:

and now it hangs... but wget (in ps output) seems to be trying right url..

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fEoQACgkQN1Ujt2V2gBzViwCfYjGn4MgfeeTCgV9Q02vxLFDs
MC4AoIRzYBL6Xgy1Nu/RXGGYlydRjTFc
=HasX
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
