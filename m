Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QrULW-0006qc-KG
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 14:26:46 +0200
Received: by fxg11 with SMTP id 11so1810835fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+J+5GWrrA9yBZ3d/gK+tlOPvsCt+8hAKqmN6Y2U/6vg=;
	b=r2WkeWh9V1MJjqmiVffa62PzYEacbu1qodVIPYttUUR/LjXkeo94kaqtR5ZtPaEV0Y
	9UhQOFeiOCwWF21VGwMMInozEE3bKRcjlASlP/2v4RvQ8ETLMbnuGTgdB3/VvFOllwkf
	ttimcVBaHmVoIre3h3Vk0oxcssXDf3DmQLrxs=
Received: by 10.223.101.7 with SMTP id a7mr12817374fao.141.1313065291402;
	Thu, 11 Aug 2011 05:21:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y15sm1526766fah.11.2011.08.11.05.21.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 05:21:30 -0700 (PDT)
Date: Thu, 11 Aug 2011 14:21:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110811122122.GD2214@jama.jama.net>
References: <1309358918.2551.48.camel@phil-desktop>
	<1309359293.2551.49.camel@phil-desktop>
	<A0B5F234-A33C-47D6-AD2E-D6E37479333C@dominion.thruhere.net>
	<1309360040.2551.56.camel@phil-desktop>
	<1309360263.2551.59.camel@phil-desktop>
	<1312973314.6733.37.camel@phil-desktop>
	<20110811064438.GB2214@jama.jama.net>
	<1313064239.14274.414.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1313064239.14274.414.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bitbake -b busted again?
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
X-List-Received-Date: Thu, 11 Aug 2011 12:26:46 -0000
X-Groupsio-MsgNum: 7962
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline

--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2011 at 01:03:59PM +0100, Richard Purdie wrote:
> On Thu, 2011-08-11 at 08:44 +0200, Martin Jansa wrote:
> > On Wed, Aug 10, 2011 at 11:48:33AM +0100, Phil Blundell wrote:
> > > On Wed, 2011-06-29 at 16:11 +0100, Phil Blundell wrote:
> > > > Also, it does seem that "bitbake -e -b ..." really is broken.  I ge=
t:
> > > >=20
> > > > ERROR: Command execution failed: Traceback (most recent call last):
> > > >   File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in runAsy=
ncCommand
> > > >     commandmethod(self.cmds_async, self, options)
> > > >   File "/home/pb/oe/bitbake/lib/bb/command.py", line 272, in showEn=
vironment
> > > >     command.cooker.showEnvironment(bfile)
> > > >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 259, in showEnv=
ironment
> > > >     fn =3D self.matchFile(buildfile)
> > > >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 753, in matchFi=
le
> > > >     matches =3D self.matchFiles(buildfile)
> > > >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 736, in matchFi=
les
> > > >     filelist, masked =3D self.collect_bbfiles()
> > > >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in collect=
_bbfiles
> > > >     files.sort( key=3Dlambda fileitem: self.calc_bbfile_priority(fi=
leitem) )
> > > >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 997, in <lambda>
> > > >     files.sort( key=3Dlambda fileitem: self.calc_bbfile_priority(fi=
leitem) )
> > > >   File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in calc_bb=
file_priority
> > > >     for _, _, regex, pri in self.status.bbfile_config_priorities:
> > > > AttributeError: 'NoneType' object has no attribute 'bbfile_config_p=
riorities'
> > > >=20
> > > > Using an absolute path to the .bb file doesn't seem to help in this
> > > > case, and I also verified that it does build successfully without t=
he
> > > > -e.
> > >=20
> > > FWIW, I just re-tested with bitbake master from today and this still
> > > seems to be broken.
> >=20
> > RP's patch makes -e working again, but local files are still not found
> > when used with -b. Something like ignoring FILESDIR/FILESPATH..
>=20
> Can you provide some further details please as I don't understand
> exactly what you mean...

Sure

=2E. clean ..
NOTE: Running task 2 of 2 (ID: 1, openembedded-core/meta/recipes-core/base-=
files/base-files_3.0.14.bb, do_cleansstate)
NOTE: package base-files-3.0.14-r69: task do_cleansstate: Started
NOTE: package base-files-3.0.14-r69: task do_cleansstate: Succeeded
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun a=
nd 0 failed.

=2E. try to unpack some recipe with file:// in SRC_URI and -b
=2E. fetcher will complain that file does not exist ..
OE om-gta02@shr ~/shr-core $ bitbake -c unpack -b openembedded-core/meta/re=
cipes-core/base-files/base-files_3.0.14.bb
WARNING: Buildfile specified, dependencies will not be handled. If this is =
not what you want, do not use -b / --buildfile.

OE Build Configuration:
BB_VERSION        =3D "1.13.3"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "om-gta02"
DISTRO            =3D "shr"
DISTRO_VERSION    =3D "20110811"
TUNE_FEATURES     =3D "armv4 thumb arm920t"
TARGET_FPU        =3D "soft"
meta-jama         =3D "master:c9300f537bab3cf7a6400e9a0f799f8a54559784"
meta-shr
meta-fso
meta-nokia
meta-htc
meta-palm
meta-openmoko
meta-zaurus       =3D "master:b287197790ec4ac9ddbed185d4df1205a55531ac"
meta-oe
meta-efl
meta-gnome        =3D "shr:c5ba433b740fdb88f1a7631fa884ea39c03df35a"
meta              =3D "shr:fe056d9f1ebdf1b4ec5d423e2a6ea8cb7737d66c"

NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 2 (ID: 1, openembedded-core/meta/recipes-core/base-=
files/base-files_3.0.14.bb, do_fetch)
NOTE: package base-files-3.0.14-r69: task do_fetch: Started
ERROR: Function 'Fetcher failure for URL: 'file://rotation'. Unable to fetc=
h URL file://rotation from any source.' failed
ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/om_gta02-oe-linu=
x-gnueabi/base-files-3.0.14-r69/temp/log.do_fetch.28071
Log data follows:
| ERROR: Function 'Fetcher failure for URL: 'file://rotation'. Unable to fe=
tch URL file://rotation from any source.' failed
NOTE: package base-files-3.0.14-r69: task do_fetch: Failed
ERROR: Task 1 (openembedded-core/meta/recipes-core/base-files/base-files_3.=
0.14.bb, do_fetch) failed with exit code '1'
ERROR: 'openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb=
' failed

=2E. now without -b ...
OE om-gta02@shr ~/shr-core $ bitbake -c unpack base-files -v
Loading cache: 100% |######################################################=
###########################################################################=
########################################################################| T=
ime: 0:00:00
Loaded 1637 entries from dependency cache.
Parsing recipes: 100% |####################################################=
###########################################################################=
########################################################################| T=
ime: 0:00:24
Parsing of 1333 .bb files complete (1320 cached, 13 parsed). 1649 targets, =
55 skipped, 0 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_nokia-layer '^/OE/shr-core/meta=
-smartphone/meta-nokia/'
WARNING: No bb files matched BBFILE_PATTERN_htc-layer '^/OE/shr-core/meta-s=
martphone/meta-htc/'

OE Build Configuration....

NOTE: Resolving any missing task queue dependencies
NOTE: selecting pseudo-native to satisfy virtual/fakeroot-native due to PRE=
FERRED_PROVIDERS
NOTE: checking PREFERRED_PROVIDER_base-files (value None) against ['base-fi=
les']
=2E..
NOTE: checking PREFERRED_PROVIDER_expat-2.0.1-r0 (value None) against ['exp=
at']
NOTE: selecting gcc-cross-initial to satisfy virtual/arm-oe-linux-gnueabi-g=
cc-initial due to PREFERRED_PROVIDERS
NOTE: Preparing runqueue
NOTE: Marking Active Tasks
NOTE: Pruned 2219 inactive tasks, 2 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 2 (ID: 1, /OE/shr-core/openembedded-core/meta/recip=
es-core/base-files/base-files_3.0.14.bb, do_fetch)
NOTE: package base-files-3.0.14-r69: task do_fetch: Started
NOTE: package base-files-3.0.14-r69: task do_fetch: Succeeded
NOTE: Running task 2 of 2 (ID: 0, /OE/shr-core/openembedded-core/meta/recip=
es-core/base-files/base-files_3.0.14.bb, do_unpack)
NOTE: package base-files-3.0.14-r69: task do_unpack: Started
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/rotation to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/bas=
e-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/nsswitch.conf to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueab=
i/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/motd to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base-fi=
les-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/inputrc to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base=
-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/host.conf to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/ba=
se-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/profile to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base=
-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/shells to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base-=
files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/fstab to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base-f=
iles-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/filesystems to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/=
base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/issue.net to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/ba=
se-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/issue to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base-f=
iles-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/usbd to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/base-fi=
les-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/share/dot.bashrc to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnu=
eabi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/share/dot.profile to /OE/shr-core/tmp/work/om_gta02-oe-linux-gn=
ueabi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/BSD to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi=
/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/GPL-2 to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnuea=
bi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/GPL-3 to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnuea=
bi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/LGPL-2 to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnue=
abi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/LGPL-2.1 to /OE/shr-core/tmp/work/om_gta02-oe-linux-gn=
ueabi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/LGPL-3 to /OE/shr-core/tmp/work/om_gta02-oe-linux-gnue=
abi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/GFDL-1.2 to /OE/shr-core/tmp/work/om_gta02-oe-linux-gn=
ueabi/base-files-3.0.14-r69/
NOTE: Unpacking /OE/shr-core/openembedded-core/meta/recipes-core/base-files=
/base-files/licenses/Artistic to /OE/shr-core/tmp/work/om_gta02-oe-linux-gn=
ueabi/base-files-3.0.14-r69/
NOTE: package base-files-3.0.14-r69: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun a=
nd 0 failed.

And I cannot run bitbake from any other directory then where my conf/bblaye=
rs lives
OE om-gta02@shr ~/shr-core/openembedded-core/meta/recipes-core/base-files $=
 bitbake -c cleansstate -b base-files_3.0.14.bb
ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-core/bas=
e-files/meta-jama/conf/layer.conf: [Errno 2] No such file or directory: '/O=
E/shr-core/openembedded-core/meta/recipes-core/base-files/meta-jama/conf/la=
yer.conf'

but that's maybe something wrong with my setup..
BBLAYERS =3D " \
  ${TOPDIR}/meta-jama \
=2E..
"

OE om-gta02@shr ~/shr-core/openembedded-core/meta/recipes-core/base-files $=
 echo $TOPDIR
/OE/shr-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5DyUIACgkQN1Ujt2V2gByUywCgpyQIRq2OkCiITJVGBgmiNnDE
8rwAmwZKgu6PTwyced+Q9sILKQi0tN6v
=6ZBI
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
