Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id B76886E994
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:57:42 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id o10so2437390eaj.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8MBeJlV1d/4ojxlj9YseYoX4Ej1jqeAPkgaVjQmCaJ0=;
	b=FFQMO/ZZ4olsyNKQyDBs5tqcIZuvtdD41YE31n+Fc+GcopbnZkkdQuO9GBIiqEY78r
	Dc1p+KzQwDmAKiUte/fJcNS+P95vX5hDhYhMFo+OGMxOtjCAmC4V6XQLgoAG6IfPUfmb
	eYwFriT7O9KG4LSLAaq+Wifk3uwOX0+2/8XD/dO9GQ5pKokEy2ULz6PWNgf9ydFxf2rl
	tEeJeWSwb5ZrDmKhTmCeQAmgk3coZs1P5ZR6a2RUeeWbzyCF/Ioux+KpTtzSHO7x/I7c
	tScJ+Ta9BGoZt0wkFGfGW4dz1ff+yD9Vm48EHdJyduq7KTSZc6q70Xh79KcHAAxFFjdN
	Nqgw==
X-Received: by 10.14.29.6 with SMTP id h6mr4617344eea.84.1391183863082;
	Fri, 31 Jan 2014 07:57:43 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm38009158een.7.2014.01.31.07.57.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 07:57:41 -0800 (PST)
Date: Fri, 31 Jan 2014 16:57:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140131155740.GU3718@jama>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140115165513.GB3742@jama> <52D74086.4030602@windriver.com>
	<20140116092556.GD3742@jama> <52D7A760.4040804@windriver.com>
	<20140118122657.GU3742@jama> <52DE4EC0.0@windriver.com>
	<20140121123748.GB4100@jama> <52DF33F9.60202@windriver.com>
	<52DF99D1.9080706@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52DF99D1.9080706@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Fri, 31 Jan 2014 15:57:45 -0000
X-Groupsio-MsgNum: 49730
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S5Rg6oz6PtEXgjQf"
Content-Disposition: inline

--S5Rg6oz6PtEXgjQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 06:13:37PM +0800, Robert Yang wrote:
>=20
> On 01/22/2014 10:59 AM, Robert Yang wrote:
> >
> >
> > On 01/21/2014 08:37 PM, Martin Jansa wrote:
> >> On Tue, Jan 21, 2014 at 06:41:04PM +0800, Robert Yang wrote:
> >>>
> >>> Hi Martin,
> >>>
>=20
> I've talked with Martin, the difference is that he tried it on dylan,
> this is only for master, I'd like to backport if for dora, we may also
> backport it for dylan, but this may need more discussions.

Have you tried multi-machine build as suggested? In master I see the
same behavior, these tasks are reexecuted after MACHINE switch causing
not only rebuild of everything (probably caused by combination with
rm_work), but also warnings like this:

NOTE: recipe gcc-cross-4.8.2-r0: task do_deploy_archives: Started
WARNING: The recipe gcc-cross is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:
   /OE/build/oe-core/tmp-eglibc/deploy/sources/i586-oe-linux/gcc-cross-4.8.=
2-r0/gcc-cross-4.8.2-r0-log.tar.gz
   Matched in manifest-x86_64_qemux86-gcc-cross.deploy_archives
   /OE/build/oe-core/tmp-eglibc/deploy/sources/i586-oe-linux/gcc-cross-4.8.=
2-r0/gcc-cross-4.8.2-r0-showdata.dump
   Matched in manifest-x86_64_qemux86-gcc-cross.deploy_archives
   /OE/build/oe-core/tmp-eglibc/deploy/sources/i586-oe-linux/gcc-cross-4.8.=
2-r0/gcc-cross-4.8.2-r0-recipe.tar.gz
   Matched in manifest-x86_64_qemux86-gcc-cross.deploy_archives
Please verify which package should provide the above files.
NOTE: recipe gcc-cross-4.8.2-r0: task do_deploy_archives: Succeeded

and in some cases enabling archiver (or changing its configuration)
causes not only archiver-related tasks to be executed (do_dumpdata,
do_ar_recipe, do_ar_log, do_deploy_archives) but triggers also another
do_patch task in already patched ${S} (probably because of changed
prefunc signature), causing do_patch errors.

(I haven't found simple reproducer, maybe its related
to cache as well, because repeating the failing setup in the same tmpdir
doesn't work - but also doesn't work when I delete cache and
tmp-eglibc/cache between steps).

Interestingly bitbake -S doesn't show different signatures when compared
with:
oe-core/scripts/sstate-diff-machines.sh --tmpdir=3Dtmp-eglibc --targets=3D"=
libffi" --machines=3D"qemux86 qemux86copy"

you can cherry-pick qemux86copy test MACHINE from:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-=
test

I'm testing it on libffi recipe, because it has extra patch in SRC_URI
and exists also in -native version which is even faster to build.

OE qemux86@ ~/build/oe-core $ bitbake libffi | tee log.qemux86.prepatch
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,=
 IP: 127.0.0.1, PORT: 47743, PID: 8217
Parsing recipes...WARNING: Unable to get checksum for cogl-1.0 SRC_URI entr=
y kms-include-stddef.h-before-drm.h.patch: file could not be found
done.
Parsing of 847 .bb files complete (0 cached, 847 parsed). 1203 targets, 35 =
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.21.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Gentoo-2.2"
TARGET_SYS        =3D "i586-oe-linux"
MACHINE           =3D "qemux86"
DISTRO            =3D "nodistro"
DISTRO_VERSION    =3D "nodistro.0"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta              =3D "jansa/test:9d7f81bc7257b9e5f902daa11ce63c84046256d2"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 121 of 128 (/OE/build/oe-core/openembedded-core=
/meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_populate_lic_setscene)
NOTE: Running setscene task 122 of 128 (/OE/build/oe-core/openembedded-core=
/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_populate_lic_sets=
cene)
NOTE: recipe libffi-3.0.13-r0: task do_populate_lic_setscene: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_populate_lic_setscene: Start=
ed
=2E...
NOTE: Running task 725 of 728 (ID: 17, /OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_deploy_archives)
NOTE: recipe libffi-3.0.13-r0: task do_deploy_archives: Started
NOTE: recipe libffi-3.0.13-r0: task do_deploy_archives: Succeeded
NOTE: Running noexec task 726 of 728 (ID: 11, /OE/build/oe-core/openembedde=
d-core/meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_build)
NOTE: Running task 727 of 728 (ID: 12, /OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_rm_work)
NOTE: recipe libffi-3.0.13-r0: task do_rm_work: Started
NOTE: recipe libffi-3.0.13-r0: task do_rm_work: Succeeded
NOTE: Running task 728 of 728 (ID: 13, /OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_rm_work_all)
NOTE: recipe libffi-3.0.13-r0: task do_rm_work_all: Started
NOTE: recipe libffi-3.0.13-r0: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 728 tasks of which 74 didn't need to be reru=
n and all succeeded.
NOTE: Writing buildhistory

Summary: There was 1 WARNING message shown.
OE qemux86@ ~/build/oe-core $ export MACHINE=3Dqemux86copy
OE qemux86copy@ ~/build/oe-core $ bitbake libffi | tee log.qemux86.prepatch2
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,=
 IP: 127.0.0.1, PORT: 55093, PID: 7136
Parsing recipes...WARNING: Unable to get checksum for cogl-1.0 SRC_URI entr=
y kms-include-stddef.h-before-drm.h.patch: file could not be found
done.
Parsing of 847 .bb files complete (0 cached, 847 parsed). 1203 targets, 35 =
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
=20
Build Configuration:
BB_VERSION        =3D "1.21.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Gentoo-2.2"
TARGET_SYS        =3D "i586-oe-linux"
MACHINE           =3D "qemux86copy"
DISTRO            =3D "nodistro"
DISTRO_VERSION    =3D "nodistro.0"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta              =3D "jansa/test:9d7f81bc7257b9e5f902daa11ce63c84046256d2"
=20
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 99 of 128 (/OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_populate_sysroot_setscene)
NOTE: Running setscene task 100 of 128 (/OE/build/oe-core/openembedded-core=
/meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_package_write_ipk_setscene)
NOTE: recipe libffi-3.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.0.13-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libffi-3.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 101 of 128 (/OE/build/oe-core/openembedded-core=
/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_write_ipk=
_setscene)
=2E..
NOTE: Running task 725 of 728 (ID: 17, /OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_deploy_archives)
NOTE: recipe libffi-3.0.13-r0: task do_deploy_archives: Started
NOTE: recipe libffi-3.0.13-r0: task do_deploy_archives: Succeeded
NOTE: Running noexec task 726 of 728 (ID: 11, /OE/build/oe-core/openembedde=
d-core/meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_build)
NOTE: Running task 727 of 728 (ID: 12, /OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_rm_work)
NOTE: recipe libffi-3.0.13-r0: task do_rm_work: Started
NOTE: recipe libffi-3.0.13-r0: task do_rm_work: Succeeded
NOTE: Running task 728 of 728 (ID: 13, /OE/build/oe-core/openembedded-core/=
meta/recipes-gnome/libffi/libffi_3.0.13.bb, do_rm_work_all)
NOTE: recipe libffi-3.0.13-r0: task do_rm_work_all: Started
NOTE: recipe libffi-3.0.13-r0: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 728 tasks of which 110 didn't need to be rer=
un and all succeeded.
NOTE: Writing buildhistory

Summary: There were 4 WARNING messages shown.

Normally this should reuse everything from sstate and build only kernel and=
 very few MACHINE_ARCH recipes.

conf/local.conf:
INHERIT +=3D "rm_work"

INHERIT +=3D "archiver"
ARCHIVER_MODE[src] =3D "prepatch"
ARCHIVER_MODE[diff] =3D "1"
ARCHIVER_MODE[diff-exclude] ?=3D ".pc autom4te.cache patches no yes"
ARCHIVER_MODE[dumpdata] =3D "1"
ARCHIVER_MODE[recipe] =3D "1"
ARCHIVER_MODE[log] =3D "1"

> >>> I've tested the archiver.bbclass with rm_work.bbclasss again, it work=
s for me,
> >>> it seems that you only downloaded the archiver.bbclass was not enough=
, would
> >>> you please try this PULL? It is based on oe-core and on oe-core-contr=
ib now:-)
> >>> And if the error occurs, would you please show the configuration and =
error
> >>> logs ?
> >>
> >> I've tried to enable "everything" to test it properly, so my config
> >> looks like this (BTW: it would be nice to show in local.conf.sample
> >> what are the default values):
> >>
> >> # Create source archive for complience with the licenses
> >> # Enable all to properly test newer archiver backported from oe-core/m=
aster
> >> INHERIT_DISTRO +=3D "archiver"
> >
> > I changed it to INHERIT +=3D "archiver" since the INHERIT_DISTRO will o=
verride
> > this:
> >
> > meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?=3D "debian devshell=
 sstate
> > license"
> >
> > Everything works fine to me, I'm afraid that set INHERIT_DISTRO +=3D "a=
rchiver"
> > may override other INHERIT_DISTRO's settings.
> >
> > I also added INHERIT +=3D "rm_work"
> >
> > And please see my comments below.
> >
> >> ARCHIVER_MODE[src] =3D "prepatch"
> >> ARCHIVER_MODE[diff] =3D "1"
> >> ARCHIVER_MODE[diff-exclude] ?=3D ".pc autom4te.cache patches"
> >> ARCHIVER_MODE[dumpdata] =3D "1"
> >> ARCHIVER_MODE[recipe] =3D "1"
> >> ARCHIVER_MODE[log] =3D "1"
> >>
> >> And error in do_patch:
> >>
> >> NOTE: recipe perf-1.0-r8: task do_patch: Started
> >> ERROR: Error executing a python function in
> >> /OE/openembedded-core/meta/recipes-kernel/perf/perf.bb:
> >> OSError: [Errno 2] No such file or directory:
> >> '/OE/tmp-eglibc/sysroots/qemux86/usr/src'
> >
> > The perf's ${S} is sysroots/qemux86/usr/src/kernel, but the problem is =
that why
> > the /OE/tmp-eglibc/sysroots/qemux86/usr/src doesn't exist ? The rm_work=
 doesn't
> > remove it, no matter how many times I tried, it still works.
> >
> > So, please:
> >
> > 1) Check whether your other INHERIT_DISTRO settings have been overrided=
 or not,
> >     and try to use INHERIT rather than INHERIT_DISTRO ?
> >
> > 2) If it still fails, would you please provide more info ? For example,=
 how to
> >     reproduce it, exactly ?
> >
> > 3) It would be great if we can talk oneline, how about gtalk ? I will t=
ry to
> >     reach you there.
> >
> > 4) It would be great if others can help me to test it.
> >
> > // Robert
> >
> >>
> >> ERROR: The stack trace of python calls that resulted in this exception=
/failure
> >> was:
> >> ERROR:   File "do_ar_prepatch", line 6, in <module>
> >> ERROR:
> >> ERROR:   File "do_ar_prepatch", line 3, in do_ar_prepatch
> >> ERROR:
> >> ERROR:   File "archiver.bbclass", line 17, in create_tarball
> >> ERROR:
> >> ERROR: The code that was being executed was:
> >> ERROR:      0002:def do_ar_prepatch(d):
> >> ERROR:      0003:    create_tarball(d, d.getVar('S', True), 'prepatch')
> >> ERROR:      0004:
> >> ERROR:      0005:
> >> ERROR:  *** 0006:do_ar_prepatch(d)
> >> ERROR:      0007:
> >> ERROR: [From file: 'do_ar_prepatch', lineno: 6, function: <module>]
> >> ERROR:      0001:
> >> ERROR:      0002:def do_ar_prepatch(d):
> >> ERROR:  *** 0003:    create_tarball(d, d.getVar('S', True), 'prepatch')
> >> ERROR:      0004:
> >> ERROR:      0005:
> >> ERROR:      0006:do_ar_prepatch(d)
> >> ERROR:      0007:
> >> ERROR: [From file: 'do_ar_prepatch', lineno: 3, function: do_ar_prepat=
ch]
> >> ERROR:      0013:    srcdir =3D srcdir.rstrip('/')
> >> ERROR:      0014:    dirname =3D os.path.dirname(srcdir)
> >> ERROR:      0015:    basename =3D os.path.basename(srcdir)
> >> ERROR:      0016:    olddir =3D os.getcwd()
> >> ERROR:  *** 0017:    os.chdir(dirname)
> >> ERROR:      0018:    bb.note("Creating %s" % tarname)
> >> ERROR:      0019:    if (len(os.listdir(basename))) !=3D 0:
> >> ERROR:      0020:        tar =3D tarfile.open(tarname, "w:gz")
> >> ERROR:      0021:        tar.add(basename)
> >> ERROR: [From file: 'archiver.bbclass', lineno: 17, function: create_ta=
rball]
> >> ERROR: Function failed: do_ar_prepatch
> >> ERROR: Logfile of failure stored in:
> >> /OE/tmp-eglibc/work/i586-oe-linux/perf/1.0-r8/temp/log.do_patch.28364
> >> NOTE: recipe perf-1.0-r8: task do_patch: Failed
> >> ERROR: Task 20159 (/OE/openembedded-core/meta/recipes-kernel/perf/perf=
=2Ebb,
> >> do_patch) failed with exit code '1'
> >>
> >>> git://git.openembedded.org/openembedded-core-contrib rbt/archiver
> >>>
> >>> // Robert
> >>>
> >>> On 01/18/2014 08:26 PM, Martin Jansa wrote:
> >>>> On Thu, Jan 16, 2014 at 05:33:20PM +0800, Robert Yang wrote:
> >>>>>
> >>>>>
> >>>>> On 01/16/2014 05:25 PM, Martin Jansa wrote:
> >>>>>> On Thu, Jan 16, 2014 at 10:14:30AM +0800, Robert Yang wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 01/16/2014 12:55 AM, Martin Jansa wrote:
> >>>>>>>> On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> >>>>>>>>> * The archive*.bbclass didn't work, and there were a few proble=
ms, for
> >>>>>>>>>       example:
> >>>>>>>>>       1) There were a few duplicated code
> >>>>>>>>>       2) There was no src_dir.org (or orig), but the diff comma=
nd still
> >>>>>>>>> use
> >>>>>>>>>          it, and it is not easy to fix this issue if we don't c=
hange a lot
> >>>>>>>>>          of the code.
> >>>>>>>>>       3) It didn't archive the source for the native or gcc
> >>>>>>>>>       4) The work flow is not very well
> >>>>>>>>>       5) The "subprocess.call('fakeroot cp xxxx'" should be rem=
oved
> >>>>>>>>>       6) And others ...
> >>>>>>>>>
> >>>>>>>>> * So that we have to refactor it, the benefits are:
> >>>>>>>>>       1) Fix the problems and make it work well.
> >>>>>>>>>       2) Reduce more than 400 lines in total.
> >>>>>>>>>       3) Make it easy to use.
> >>>>>>>>>
> >>>>>>>>> // Robert
> >>>>>>>>>
> >>>>>>>>> The following changes since commit
> >>>>>>>>> 1b636173ca88e5ccca1992f9a12367a1189fa674:
> >>>>>>>>>
> >>>>>>>>>       bitbake: toaster: Toaster GUI, generic search, filter and=
 order
> >>>>>>>>> (2014-01-10 15:20:26 +0000)
> >>>>>>>>>
> >>>>>>>>> are available in the git repository at:
> >>>>>>>>>
> >>>>>>>>>       git://git.pokylinux.org/poky-contrib rbt/archiver
> >>>>>>>>>       http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dr=
bt/archiver
> >>>>>>>>
> >>>>>>>> Can you send pull-request for oe-core?
> >>>>>>>>
> >>>>>>>
> >>>>>>> Here it is:
> >>>>>>> git://git.pokylinux.org/poky-contrib rbt/ar_oe
> >>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dr=
bt/ar_oe
> >>>>>>
> >>>>>> This still looks like poky-contrib (so it will download whole
> >>>>>> poky-contrib when I add it as remote to oe-core repo).
> >>>>>>
> >>>>>
> >>>>> Sorry, I can't create repo on oe-contrib, seems that I lost my key.
> >>>>
> >>>> That's sad, you should send new one to khem to replace it, before
> >>>> someone else finds your old key.
> >>>>
> >>>>> How about:
> >>>>>
> >>>>> git fetch git://git.pokylinux.org/poky-contrib rbt/ar_oe
> >>>>
> >>>> That still fetches whole poky repo I'm not interested in.
> >>>>
> >>>> So I've downloaded just archiver.bbclass manually and tested it on my
> >>>> use-case, I can confirm that it doesn't remove required file anymore,
> >>>> but it seems that there is something terribly broken when used in
> >>>> combination with rm_work or multimachine builds.
> >>>>
> >>>> I haven't debugged it yet, but 2nd build (in the same directory) with
> >>>> this new archiver included almost every recipe failed in do_patch ta=
sk.
> >>>>
> >>>>>>> // Robert
> >>>>>>>
> >>>>>>>>> Robert Yang (5):
> >>>>>>>>>       classes/archive*.bbclass: remove archive-*-source.bbclass
> >>>>>>>>>       archiver.bbclass: refactor it
> >>>>>>>>>       package_rpm.bbclass: archive the source to srpm package
> >>>>>>>>>       archiver.bbclass: move a few code to copyleft_compliance.=
bbclass
> >>>>>>>>>       local.conf.sample.extended: update for the archiver
> >>>>>>>>>
> >>>>>>>>>      meta-yocto/conf/local.conf.sample.extended     |  72 +--
> >>>>>>>>>      meta/classes/archive-configured-source.bbclass |  65 ---
> >>>>>>>>>      meta/classes/archive-original-source.bbclass   |  65 ---
> >>>>>>>>>      meta/classes/archive-patched-source.bbclass    |  65 ---
> >>>>>>>>>      meta/classes/archiver.bbclass                  | 723
> >>>>>>>>> ++++++++-----------------
> >>>>>>>>>      meta/classes/copyleft_compliance.bbclass       |  55 +-
> >>>>>>>>>      meta/classes/package_rpm.bbclass               |  31 +-
> >>>>>>>>>      7 files changed, 316 insertions(+), 760 deletions(-)
> >>>>>>>>>      delete mode 100644 meta/classes/archive-configured-source.=
bbclass
> >>>>>>>>>      delete mode 100644 meta/classes/archive-original-source.bb=
class
> >>>>>>>>>      delete mode 100644 meta/classes/archive-patched-source.bbc=
lass
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> 1.8.3.1
> >>>>>>>>>
> >>>>>>>>> _______________________________________________
> >>>>>>>>> Openembedded-core mailing list
> >>>>>>>>> Openembedded-core@lists.openembedded.org
> >>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S5Rg6oz6PtEXgjQf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLrx/QACgkQN1Ujt2V2gBwxLgCfRifzfMmH7JVc5VKhrG+AVuTL
+ScAnR4Ze3GKWfxZ2UsFN39594poOCEM
=TZ1k
-----END PGP SIGNATURE-----

--S5Rg6oz6PtEXgjQf--
