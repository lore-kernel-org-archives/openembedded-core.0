Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYBtk-0001oT-BM
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 08:26:36 +0100
Received: by eaao14 with SMTP id o14so145410eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 23:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r+iLEIkgvRzjkg1b92cMJ/DXh+x0sxlbNCw1NatH4Fc=;
	b=vb2OKi6W6jN1kvc2v0dpje0YDsy3LQTDgQC8w7lkEQ8FjNwP1cDn2gbTNbAe/Ft10W
	uOGOMq4ywMab5jnhdV9QYxcsW2fpck7CWwCDsWZWC6eMeT2Nyhy6x1XEfqWnqpLjtZVw
	5pLuwf6F8adj8UwoAGXT96mk95Z5e9Ak22PLA=
Received: by 10.213.3.214 with SMTP id 22mr3118336ebo.60.1323242388086;
	Tue, 06 Dec 2011 23:19:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 65sm2534575eeg.8.2011.12.06.23.19.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 23:19:46 -0800 (PST)
Date: Wed, 7 Dec 2011 08:19:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207071944.GB3897@jama.jama.net>
References: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANk4oH-dDHDZHW+ioRi13AXCS3rBNiUeUZGRZisg56fQfw@mail.gmail.com>
	<20111206172306.GC5456@jama.jama.net>
	<1323210242.19363.46.camel@ted>
	<20111207071516.GA3897@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111207071516.GA3897@jama.jama.net>
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
X-List-Received-Date: Wed, 07 Dec 2011 07:26:36 -0000
X-Groupsio-MsgNum: 13707
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 08:15:16AM +0100, Martin Jansa wrote:
> On Tue, Dec 06, 2011 at 10:24:02PM +0000, Richard Purdie wrote:
> > On Tue, 2011-12-06 at 18:23 +0100, Martin Jansa wrote:
> > > On Tue, Dec 06, 2011 at 07:15:57AM -0700, Chris Larson wrote:
> > > > On Tue, Dec 6, 2011 at 2:28 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> > > > > * there are newest as well as older releases, so the SRC_URIs are=
 valid longer
> > > > > * someone with fast line should try to redownload world to see if=
 the
> > > > >  structure is the same for all projects (checked for subversion)
> > > >=20
> > > > Would it not be better to do what we do for other projects, and add
> > > > the archive URI to either the global MIRRORS for fallback, or prepe=
nd
> > > > to MIRRORS in the appropriate .inc?
> > >=20
> > > You're right, it's even there already (I didn't know).. but it didn't=
 work for me with subversion...
> > >=20
> > > somehow it managed to append subversion-1.7.1.tar.bz2 twice
> >=20
> > Try:
> >=20
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drpur=
die/useradd4&id=3D1b4003386bb1849d115f9b2f90594a60fbbf56cc
> >=20
> > We really need a regression test for that function, its horrible...
>=20
> OE om-gta02@shr ~/shr-core $ bitbake -D -b openembedded-core/meta/recipes=
-devtools/subversion/subversion_1.7.1.bb -c fetch
> DEBUG: Removed the following variables from the environment: PSEUDO_BINDI=
R, PSEUDO_LOCALSTATEDIR, LESS, LESSOPEN, PSEUDO_LIBDIR, HG, INFOPATH, SHLVL=
, CONFIG_PROTECT_MASK, WINDOW, EDITOR, MANPATH, BBFETCH2, LD_PRELOAD, GCC_S=
PECS, STY, PSEUDO_OPTS, TERMCAP, LD_LIBRARY_PATH, BUILDDIR, PSEUDO_PREFIX, =
LS_COLORS, PAGER, OPENGL_PROFILE
> DEBUG: Clearing SRCREV cache due to cache policy of: clear
> DEBUG: Using cache in '/OE/shr-core/tmp-eglibc/cache/bb_codeparser.dat' f=
or codeparser cache
> WARNING: Buildfile specified, dependencies will not be handled. If this i=
s not what you want, do not use -b / --buildfile.
> DEBUG: collecting .bb files
> DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
64', 'x86_64-linux', 'common']
> DEBUG: providers for subversion are: ['subversion']
> DEBUG: selecting openembedded-core/meta/recipes-devtools/subversion/subve=
rsion_1.7.1.bb as PREFERRED_VERSION 1.7.% of package subversion (for item s=
ubversion)
> DEBUG: sorted providers for subversion are: ['openembedded-core/meta/reci=
pes-devtools/subversion/subversion_1.7.1.bb']
>=20
> OE Build Configuration:
> BB_VERSION        =3D "1.15.0"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "om-gta02"
> DISTRO            =3D "shr"
> DISTRO_VERSION    =3D "20111207"
> TUNE_FEATURES     =3D "armv4 thumb arm920t"
> TARGET_FPU        =3D "soft"
> meta-jama         =3D "master:9c3e2ddc68f9dc96c3a1f700226954027771aa0d"
> meta-shr
> meta-aurora
> meta-fso          =3D "master:4678b2f7ff38261f6b0bb7ed34b0c25c0ad204e6"
> meta-efl
> meta-oe
> meta-gnome
> meta-gpe          =3D "jansa/test:c6cc32c7466cf85c9c515717afe5eb25e2d773b=
3"
> meta-nokia
> meta-htc
> meta-palm
> meta-openmoko
> meta-samsung      =3D "master:4678b2f7ff38261f6b0bb7ed34b0c25c0ad204e6"
> meta-handheld     =3D "jansa/spitz:d31a0ccb76559fbf19d7320814a4aff3dca214=
77"
> meta              =3D "jansa/test:644e9c55686133a3214fb17b8501195a951d4c7=
3"
>=20
> NOTE: Preparing runqueue
> NOTE: Marking Active Tasks
> NOTE: Pruned 26 inactive tasks, 1 left
> NOTE: Assign Weightings
> NOTE: Compute totals (have 1 endpoint(s))
> NOTE: Executing RunQueue Tasks
> DEBUG: Skip list (pre setsceneverify) []
> DEBUG: Full skip list set([])
> DEBUG: Using runqueue scheduler 'completion'
> NOTE: Running task 1 of 1 (ID: 0, openembedded-core/meta/recipes-devtools=
/subversion/subversion_1.7.1.bb, do_fetch)
> NOTE: package subversion-1.7.1-r0: task do_fetch: Started
> WARNING: Fetcher failure for URL: 'None'. Fetch command export HOME=3D"/O=
E"; export GIT_CONFIG=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
etc/gitconfig"; export PATH=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/armv4t-oe-linux-gnueabi:/OE/shr-core/tmp-eglibc/sysroots/om-gta02=
/usr/bin/crossscripts:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/sbi=
n:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/OE/shr-core/tmp-eg=
libc/sysroots/x86_64-linux/sbin:/OE/shr-core/tmp-eglibc/sysroots/x86_64-lin=
ux//bin:/OE/shr-core/openembedded-core/scripts:/OE/bin:/usr/local/bin:/usr/=
bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.2:/OE/shr-core/opene=
mbedded-core/scripts"; /usr/bin/env wget -t 5 -q --passive-ftp --no-check-c=
ertificate -P /OE/shr-core/downloads 'http://www.apache.org/dist/subversion=
/subversion-1.7.1.tar.bz2' failed with signal 8, output:
>=20
> ERROR: http
> ERROR: ftp
> ERROR: ftp
> ERROR: ftp
> ERROR: ftp
> ERROR: ftp
> ERROR: http
> ERROR: ftp
> ERROR: http
> ERROR: archive.apache.org
> ERROR: /dist/subversion/subversion-1.7.1.tar.bz2
> ERROR:
> ERROR:
>=20
> and now it hangs... but wget (in ps output) seems to be trying right url..

Sorry I was too impatient because I have to go, but now it finished,
only checksums are wrong, because to test I've just reverted APACHE_MIRROR
change and renamed subversion recipe back to 1.7.1.

| DEBUG: For url http://www.apache.org/dist/subversion/subversion-1.7.1.tar=
=2Ebz2 returning http://archive.apache.org/dist/subversion/subversion-1.7.1=
=2Etar.bz2

rest of log:

ERROR: Function 'Fetcher failure for URL: 'http://www.apache.org/dist/subve=
rsion/subversion-1.7.1.tar.bz2'. Checksum mismatch!
File: '/OE/shr-core/downloads/subversion-1.7.1.tar.bz2' has md5 checksum 8a=
4fa74385df85a9702141b6b68b8307 when 1e5dfffd27be080672e5a042564368a8 was ex=
pected (from URL: 'http://www.apache.org/dist/subversion/subversion-1.7.1.t=
ar.bz2')
File: '/OE/shr-core/downloads/subversion-1.7.1.tar.bz2' has sha256 checksum=
 d34bde626fac1aa553f5c9aeedf961999a77cc31540ace18da5aeacdd03d6608 when 7eb3=
e1ae2b0385e1cc20ca9e1839e0ef0ac98a7455dc52ba4cdf567547bfc517 was expected (=
=66rom URL: 'http://www.apache.org/dist/subversion/subversion-1.7.1.tar.bz2=
')' failed
ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/armv4t-oe=
-linux-gnueabi/subversion-1.7.1-r0/temp/log.do_fetch.20657
Log data follows:
| DEBUG: Trying PREMIRRORS
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['cvs', '.*', '/.*', '', '', {}] to ['h=
ttp', 'build.shr-project.org', '/sources/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['svn', '.*', '/.*', '', '', {}] to ['h=
ttp', 'build.shr-project.org', '/sources/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['git', '.*', '/.*', '', '', {}] to ['h=
ttp', 'build.shr-project.org', '/sources/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['hg', '.*', '/.*', '', '', {}] to ['ht=
tp', 'build.shr-project.org', '/sources/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['bzr', '.*', '/.*', '', '', {}] to ['h=
ttp', 'build.shr-project.org', '/sources/', '', '', {}]
| DEBUG: Trying Upstream
| NOTE: fetch http://www.apache.org/dist/subversion/subversion-1.7.1.tar.bz2
| DEBUG: executing /usr/bin/env wget -t 5 -q --passive-ftp --no-check-certi=
ficate -P /OE/shr-core/downloads 'http://www.apache.org/dist/subversion/sub=
version-1.7.1.tar.bz2'
| DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t=
 5 -q --passive-ftp --no-check-certificate -P /OE/shr-core/downloads 'http:=
//www.apache.org/dist/subversion/subversion-1.7.1.tar.bz2'
| DEBUG: Running export HOME=3D"/OE"; export GIT_CONFIG=3D"/OE/shr-core/tmp=
-eglibc/sysroots/x86_64-linux/usr/etc/gitconfig"; export PATH=3D"/OE/shr-co=
re/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv4t-oe-linux-gnueabi:/OE/shr=
-core/tmp-eglibc/sysroots/om-gta02/usr/bin/crossscripts:/OE/shr-core/tmp-eg=
libc/sysroots/x86_64-linux/usr/sbin:/OE/shr-core/tmp-eglibc/sysroots/x86_64=
-linux/usr/bin:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/sbin:/OE/shr-c=
ore/tmp-eglibc/sysroots/x86_64-linux//bin:/OE/shr-core/openembedded-core/sc=
ripts:/OE/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gn=
u/gcc-bin/4.6.2:/OE/shr-core/openembedded-core/scripts"; /usr/bin/env wget =
-t 5 -q --passive-ftp --no-check-certificate -P /OE/shr-core/downloads 'htt=
p://www.apache.org/dist/subversion/subversion-1.7.1.tar.bz2'
| WARNING: Fetcher failure for URL: 'None'. Fetch command export HOME=3D"/O=
E"; export GIT_CONFIG=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
etc/gitconfig"; export PATH=3D"/OE/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/armv4t-oe-linux-gnueabi:/OE/shr-core/tmp-eglibc/sysroots/om-gta02=
/usr/bin/crossscripts:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/sbi=
n:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/OE/shr-core/tmp-eg=
libc/sysroots/x86_64-linux/sbin:/OE/shr-core/tmp-eglibc/sysroots/x86_64-lin=
ux//bin:/OE/shr-core/openembedded-core/scripts:/OE/bin:/usr/local/bin:/usr/=
bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.2:/OE/shr-core/opene=
mbedded-core/scripts"; /usr/bin/env wget -t 5 -q --passive-ftp --no-check-c=
ertificate -P /OE/shr-core/downloads 'http://www.apache.org/dist/subversion=
/subversion-1.7.1.tar.bz2' failed with signal 8, output:
|
| DEBUG: Trying MIRRORS
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
/main', '', '', {}] to ['http', 'snapshot.debian.net', '/archive/pool', '',=
 '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.de.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.au.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.cl.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.hr.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.fi.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.hk.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.hu.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.ie.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.it.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.jp.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.no.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.pl.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.ro.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.si.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.es.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.se.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.debian.org', '/debian/pool=
', '', '', {}] to ['ftp', 'ftp.tr.debian.org', '/debian/pool', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnu.org', '/gnu', '', '', =
{}] to ['ftp', 'mirrors.kernel.org', '/gnu', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnu.org', '/gnu', '', '', =
{}] to ['ftp', 'ftp.matrix.com.br', '/pub/gnu', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnu.org', '/gnu', '', '', =
{}] to ['ftp', 'ftp.cs.ubc.ca', '/mirror2/gnu', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnu.org', '/gnu', '', '', =
{}] to ['ftp', 'sunsite.ust.hk', '/pub/gnu', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnu.org', '/gnu', '', '', =
{}] to ['ftp', 'ftp.ayamura.org', '/pub/gnu', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'kernel.org', '/pub', '', '', =
{}] to ['http', 'www.kernel.org', '/pub', '', '', {}]
| ERROR: http
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'kernel.org', '/pub', '', '', =
{}] to ['ftp', 'ftp.us.kernel.org', '/pub', '', '', {}]
| ERROR: ftp
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'kernel.org', '/pub', '', '', =
{}] to ['ftp', 'ftp.uk.kernel.org', '/pub', '', '', {}]
| ERROR: ftp
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'kernel.org', '/pub', '', '', =
{}] to ['ftp', 'ftp.hk.kernel.org', '/pub', '', '', {}]
| ERROR: ftp
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'kernel.org', '/pub', '', '', =
{}] to ['ftp', 'ftp.au.kernel.org', '/pub', '', '', {}]
| ERROR: ftp
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'kernel.org', '/pub', '', '', =
{}] to ['ftp', 'ftp.jp.kernel.org', '/pub', '', '', {}]
| ERROR: ftp
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnupg.org', '/gcrypt/', ''=
, '', {}] to ['ftp', 'ftp.franken.de', '/pub/crypt/mirror/ftp.gnupg.org/gcr=
ypt/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnupg.org', '/gcrypt/', ''=
, '', {}] to ['ftp', 'ftp.surfnet.nl', '/pub/security/gnupg/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnupg.org', '/gcrypt/', ''=
, '', {}] to ['http', 'gulus.USherbrooke.ca', '/pub/appl/GnuPG/', '', '', {=
}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'dante.ctan.org', '/tex-archive=
', '', '', {}] to ['ftp', 'ftp.fu-berlin.de', '/tex/CTAN', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'dante.ctan.org', '/tex-archive=
', '', '', {}] to ['http', 'sunsite.sut.ac.jp', '/pub/archives/ctan/', '', =
'', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'dante.ctan.org', '/tex-archive=
', '', '', {}] to ['http', 'ctan.unsw.edu.au', '/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnutls.org', '/pub/gnutls'=
, '', '', {}] to ['ftp', 'ftp.gnutls.org', '/pub/gnutls/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnutls.org', '/pub/gnutls'=
, '', '', {}] to ['ftp', 'ftp.gnupg.org', '/gcrypt/gnutls/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnutls.org', '/pub/gnutls'=
, '', '', {}] to ['http', 'www.mirrors.wiretapped.net', '/security/network-=
security/gnutls/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnutls.org', '/pub/gnutls'=
, '', '', {}] to ['ftp', 'ftp.mirrors.wiretapped.net', '/pub/security/netwo=
rk-security/gnutls/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'ftp.gnutls.org', '/pub/gnutls'=
, '', '', {}] to ['http', 'josefsson.org', '/gnutls/releases/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'ftp.info-zip.org', '/pub/info=
zip/src/', '', '', {}] to ['http', 'mirror.switch.ch', '/ftp/mirror/infozip=
/src/', '', '', {}]
| ERROR: http
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'ftp.info-zip.org', '/pub/info=
zip/src/', '', '', {}] to ['ftp', 'sunsite.icm.edu.pl', '/pub/unix/archivin=
g/info-zip/src/', '', '', {}]
| ERROR: ftp
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.cerias.purdue.edu', '/pub/too=
ls/unix/sysutils/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tau.ac.il', '/pub/unix/admin/=
', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.cert.dfn.de', '/pub/tools/adm=
in/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.fu-berlin.de', '/pub/unix/too=
ls/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.kaizo.org', '/pub/lsof/', '',=
 '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tu-darmstadt.de', '/pub/sysad=
min/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tux.org', '/pub/sites/vic.cc.=
purdue.edu/tools/unix/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'gd.tuwien.ac.at', '/utils/admin-t=
ools/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'sunsite.ualberta.ca', '/pub/Mirro=
r/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/t=
ools/unix/lsof/', '', '', {}] to ['ftp', 'the.wiretapped.net', '/pub/securi=
ty/host-security/lsof/', '', '', {}]
| DEBUG: For url ['http', 'www.apache.org', '/dist/subversion/subversion-1.=
7.1.tar.bz2', '', '', {}] comparing ['http', 'www.apache.org', '/dist', '',=
 '', {}] to ['http', 'archive.apache.org', '/dist', '', '', {}]
| ERROR: http
| ERROR: archive.apache.org
| ERROR: /dist/subversion/subversion-1.7.1.tar.bz2
| ERROR:
| ERROR:
| DEBUG: For url http://www.apache.org/dist/subversion/subversion-1.7.1.tar=
=2Ebz2 returning http://archive.apache.org/dist/subversion/subversion-1.7.1=
=2Etar.bz2
| NOTE: fetch http://archive.apache.org/dist/subversion/subversion-1.7.1.ta=
r.bz2
| DEBUG: executing /usr/bin/env wget -t 5 -q --passive-ftp --no-check-certi=
ficate -P /OE/shr-core/downloads 'http://archive.apache.org/dist/subversion=
/subversion-1.7.1.tar.bz2'
| DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t=
 5 -q --passive-ftp --no-check-certificate -P /OE/shr-core/downloads 'http:=
//archive.apache.org/dist/subversion/subversion-1.7.1.tar.bz2'
| DEBUG: Running export HOME=3D"/OE"; export GIT_CONFIG=3D"/OE/shr-core/tmp=
-eglibc/sysroots/x86_64-linux/usr/etc/gitconfig"; export PATH=3D"/OE/shr-co=
re/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv4t-oe-linux-gnueabi:/OE/shr=
-core/tmp-eglibc/sysroots/om-gta02/usr/bin/crossscripts:/OE/shr-core/tmp-eg=
libc/sysroots/x86_64-linux/usr/sbin:/OE/shr-core/tmp-eglibc/sysroots/x86_64=
-linux/usr/bin:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/sbin:/OE/shr-c=
ore/tmp-eglibc/sysroots/x86_64-linux//bin:/OE/shr-core/openembedded-core/sc=
ripts:/OE/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gn=
u/gcc-bin/4.6.2:/OE/shr-core/openembedded-core/scripts"; /usr/bin/env wget =
-t 5 -q --passive-ftp --no-check-certificate -P /OE/shr-core/downloads 'htt=
p://archive.apache.org/dist/subversion/subversion-1.7.1.tar.bz2'
| ERROR: Function 'Fetcher failure for URL: 'http://www.apache.org/dist/sub=
version/subversion-1.7.1.tar.bz2'. Checksum mismatch!
| File: '/OE/shr-core/downloads/subversion-1.7.1.tar.bz2' has md5 checksum =
8a4fa74385df85a9702141b6b68b8307 when 1e5dfffd27be080672e5a042564368a8 was =
expected (from URL: 'http://www.apache.org/dist/subversion/subversion-1.7.1=
=2Etar.bz2')
| File: '/OE/shr-core/downloads/subversion-1.7.1.tar.bz2' has sha256 checks=
um d34bde626fac1aa553f5c9aeedf961999a77cc31540ace18da5aeacdd03d6608 when 7e=
b3e1ae2b0385e1cc20ca9e1839e0ef0ac98a7455dc52ba4cdf567547bfc517 was expected=
 (from URL: 'http://www.apache.org/dist/subversion/subversion-1.7.1.tar.bz2=
')' failed
NOTE: package subversion-1.7.1-r0: task do_fetch: Failed
ERROR: Task 0 (openembedded-core/meta/recipes-devtools/subversion/subversio=
n_1.7.1.bb, do_fetch) failed with exit code '1'
ERROR: 'openembedded-core/meta/recipes-devtools/subversion/subversion_1.7.1=
=2Ebb' failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fE5AACgkQN1Ujt2V2gBz+rACfcMML30oUrfMRxZKyp+oxd86t
n/MAn3kCE6RYh69IU/l2ZxUXf5ujmfrF
=r0wt
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
