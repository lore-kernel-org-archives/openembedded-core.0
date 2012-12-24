Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tn2oQ-0002fb-Hc; Mon, 24 Dec 2012 08:51:02 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so2722935eaa.19
	for <multiple recipients>; Sun, 23 Dec 2012 23:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ADCrkZg+OgV2fYIbQ2WQKesPlunDZ56R1fGr5s5Ke80=;
	b=LEx/7sYBwbqDDwo/eACwSkneBLcLUmXa3HRizDFBV8wWw6z43f+IN2mamamwF689Ui
	2Wdj6PiR9uLMeV2X/obvu5ZHgbbvuhDDHNORvuEjEli2K8BZtxOE21bWHkfTJjpPGaGG
	dvhboXcY18Fc+x+MbC+ZEGOgYCPN0wVh8zIBLXdax2/F36G0VhZNgt4NkkyfRHRvZdwW
	A4mzmkt1Bda1TSr2aflMPr1ZK2m0XQq1Pd6bSd/Ipn+XSayD5Fo4bUYoFvGA0gQ+i9Kb
	aexgc73fgn85bXL37/fGyi08u54KDXBw024zQgJ2abC1gT3aCUYRSvA+FBGLgBR3eepG
	zTnQ==
X-Received: by 10.14.2.196 with SMTP id 44mr53587779eef.25.1356334573087;
	Sun, 23 Dec 2012 23:36:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm39616705eed.10.2012.12.23.23.36.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 23:36:12 -0800 (PST)
Date: Mon, 24 Dec 2012 08:36:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20121224073611.GQ8988@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<CALbNGRQEu9f1KbGQTf9z2KAm8B12BbCr6HpT0Bqv6Cd9hdDizQ@mail.gmail.com>
	<20121224071135.GP8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121224071135.GP8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 07:51:03 -0000
X-Groupsio-MsgNum: 33039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xYeFQzU4VZLrHqxU"
Content-Disposition: inline

--xYeFQzU4VZLrHqxU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2012 at 08:11:35AM +0100, Martin Jansa wrote:
> On Sun, Dec 23, 2012 at 10:42:36PM +0100, Andreas M=FCller wrote:
> > On Sun, Dec 23, 2012 at 9:16 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > > On Thu, Dec 13, 2012 at 06:42:02PM +0100, Martin Jansa wrote:
> > >> Hi,
> > >>
> > >> I've sent a lot of small fixes to get world builds usable (to be abl=
e to
> > >> spot when there is more issues then usual).
> > >>
> > >> Now I'm down to ~ 43 recipes failing (+ maybe something what depends=
 on
> > >> them)
> > >
> > > Now I'm down to 19 failures with this patchset
> > > http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-December=
/043163.html
> > >   openembedded-core/meta/recipes-graphics/clutter/cogl_1.8.2.bb, do_c=
ompile
> > >   meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome=
-disk-utility_2.32.0.bb, do_compile
> > Builds fine here for very long time. Could you give details?
>=20
> That's one of those issues with libnotify(3)
> | notification-main.c:539:21: error: too many arguments to function 'noti=
fy_notification_new'
>=20
> The same does apply=20
> > >   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnom=
e-power-manager_2.32.0.bb, do_compile
> | gpm-manager.c:488:3: error: too many arguments to function 'notify_noti=
fication_new'
>=20
> > >   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6=
=2Ebb, do_compile
> | downloader-view.c:340:7: error: too many arguments to function 'notify_=
notification_new'
>=20
> > >   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb,=
 do_compile
> | notification.c:187: error: undefined reference to 'notify_notification_=
new_with_status_icon'

For more detals, link to log from pull-request
http://jenkins.nas-admin.org/job/shr-core-branches_world_qemuarm/22/console
should work without login, if it does not then you can use:
http://logs.nslu2-linux.org/buildlogs/oe/shr-core-branches/qemuarm/20121223=
174149.log
or newer distro-less world build (still running, now 20718 of 22299):
http://logs.nslu2-linux.org/buildlogs/oe/shr-core-branches/qemuarm/20121223=
193241.log

Cheers,

> > >   openembedded-core/meta/recipes-extended/sat-solver/sat-solver_git.b=
b, do_compile
> > >   meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_c=
ompile
> > >   openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.=
bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wir=
eless-all_0.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-connectivity/hostapd/hostap-daemo=
n_1.0.bb, do_compile
> > >   meta-openembedded/meta-networking/recipes-support/netcat/netcat_0.7=
=2E1.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.=
bb, do_fetch
> > >   meta-openembedded/meta-oe/recipes-graphics/slim/slim_1.3.2.bb, do_c=
ompile
> > >   meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.08.bb, do_=
compile
> > >   meta-openembedded/meta-gnome/recipes-gnome/system-tools/system-tool=
s-backends_2.10.2.bb, do_configure
> > >   meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5=
=2Ebb, do_compile
> > >   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb,=
 do_compile
> > >   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omap=
_git.bb, do_compile
> > >   meta-openembedded/meta-networking/recipes-support/traceroute/tracer=
oute_2.0.18.bb, do_install
> > >   meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.2=
6.3.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-support/fftw/benchfft_3.1.bb, do_=
configure
> > >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git=
=2Ebb, do_configure
> > >
> > > Except this patchset I've fix for zenity, f2fs-tools and
> > > SkipPackage for xf86-video-omap (without opengl DISTRO_FEATURE).
> > >
> > > And I've added the rest to PNBLACKLIST and EXCLUDE_FROM_WORLD
> > > (including recipes which depend on one of them)
> > > so don't wait for me to fix the rest.
> > >
> > > Maybe we should create nonworking directory to disable
> > > unmaintained recipes which does not even build like we had in OE-clas=
sic.
> > >
> > > Cheers,
> > >
> > >> and 5 recipes with QA warnings (recorded in qa.log - e.g. deprecated=
 use
> > >> of u-a.bbclass is not recorded there).
> > >>
> > >> Attaching list so that people which find some recipe they care about=
 can
> > >> step up and fix that..
> > >>
> > >> failures and qa issues from bitbake world with qemuarm.
> > >>
> > >> oe-core has Revert "ICU: add pkgconfig support" to build webkit-gtk =
and webkit-efl
> > >> all layers have some more fixes which I'm going to send soon
> > >>
> > >> included layers:
> > >> meta-shr
> > >> meta-aurora
> > >> meta-fso
> > >> meta-android      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf56=
8430c9"
> > >> meta-oe
> > >> meta-efl
> > >> meta-gnome
> > >> meta-gpe
> > >> meta-multimedia
> > >> meta-networking
> > >> meta-systemd      =3D "jansa/test:f6b59111bd40fad927cbde23e239231b4e=
07ea20"
> > >> meta-osmocombb
> > >> meta-nokia
> > >> meta-htc
> > >> meta-palm
> > >> meta-openmoko
> > >> meta-samsung      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf56=
8430c9"
> > >> meta-browser      =3D "jansa/test:1231ef3d166231c0426174077da64282db=
2645a6"
> > >> meta              =3D "jansa/test:6721eda317f98c673d1ac30362e4d454ab=
843586"
> > >>
> > >> $ cat world.log.qemuarm7.list | grep openembedded-core
> > >> ERROR: Task 13533 (/OE/jansa-test/shr-core/openembedded-core/meta/re=
cipes-graphics/clutter/cogl_1.8.2.bb, do_compile) failed with exit code '1'
> > >>   | {standard input}:542: Error: selected processor does not support=
 Thumb mode `clz r3,r0'
> > >> ERROR: Task 2074 (/OE/jansa-test/shr-core/openembedded-core/meta/rec=
ipes-extended/sat-solver/sat-solver_git.bb, do_compile) failed with exit co=
de '1'
> > >>   | /tmp/cc7QsEPB.s: Assembler messages:
> > >>   | /tmp/cc7QsEPB.s:1542: Error: invalid offset, value too big (0x00=
000400)
> > >>   | make[2]: *** [src/CMakeFiles/satsolver.dir/sha2.o] Error 1
> > >> ERROR: Task 20335 (virtual:native:/OE/jansa-test/shr-core/openembedd=
ed-core/meta/recipes-extended/ghostscript/ghostscript_9.05.bb, do_compile) =
failed with exit code '1'
> > >>   patch on ML
> > >>   | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib=
/libfontconfig.so: undefined reference to `FT_Get_Sfnt_Name'
> > >>   | collect2: error: ld returned 1 exit status
> > >>   | make: *** [obj/aux/mkromfs_0] Error 1
> > >> ERROR: Task 3453 (/OE/jansa-test/shr-core/openembedded-core/meta/rec=
ipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile) failed with exit code '1'
> > >>   | In file included from decoder_mpc.cpp:28:0:
> > >>   | decoder_mpc.h:27:24: fatal error: mpc/mpcdec.h: No such file or =
directory
> > >>   | compilation terminated.
> > >>   or
> > >>   | Project ERROR: Package wavpack not found
> > >> ERROR: Task 7843 (/OE/jansa-test/shr-core/openembedded-core/meta/rec=
ipes-graphics/xorg-driver/xf86-video-omap_git.bb, do_compile) failed with e=
xit code '1'
> > >>   | omap_driver.h:54:18: fatal error: dri2.h: No such file or direct=
ory
> > >>   incompatible with DISTRO_FEATURES without opengl
> > >> ERROR: Task 6463 (/OE/jansa-test/shr-core/openembedded-core/meta/rec=
ipes-multimedia/gstreamer/gst-openmax_0.10.1.bb, do_compile) failed with ex=
it code '1'
> > >>   reported on ML
> > >>   | gstomx_base_filter.c:846:3: error: 'g_mutex_new' is deprecated (=
declared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include=
/glib-2.0/glib/deprecated/gthread.h:271) [-Werror=3Ddeprecated-declarations]
> > >>   | cc1: all warnings being treated as errors
> > >>
> > >> $ cat world.log.qemuarm7.list | grep meta-openembedded
> > >> ERROR: Task 11018 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-connectivity/uhd/uhd_git.bb, do_configure) failed with exit code '=
1'
> > >>   | CMake Error at cmake/Modules/UHDPython.cmake:54 (MESSAGE):
> > >>   |   Error: Python interpretor required by the build system.
> > >> ERROR: Task 8798 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-qt/qwt/qwt-e_6.0.1.bb, do_compile) failed with exit code '1'
> > >>   this is OK, qwt-6.0.1 was built before
> > >>   | Project ERROR: local build will conflict with /OE/jansa-test/shr=
-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libqwt.*
> > >> ERROR: Task 468 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb, do_fetch) failed =
with exit code '1'
> > >>   WARNING: Failed to fetch URL ftp://ftp.nluug.nl/pub/gnu/libmicroht=
tpd//libmicrohttpd-0.4.6.tar.gz, attempting MIRRORS if available
> > >>   ERROR: Fetcher failure: Fetch command failed with exit code 8, out=
put:
> > >>   No such file 'libmicrohttpd-0.4.6.tar.gz'.
> > >> ERROR: Task 104 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome/libgnomecups_0.2.3.bb, do_compile) failed with exit c=
ode '1'
> > >>   | In file included from gnome-cups-init.h:4:0,
> > >>   |                  from gnome-cups-request.h:6,
> > >>   |                  from gnome-cups-util.c:7:
> > >>   | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/=
glib-2.0/glib/gtypes.h:28:2: error: #error "Only <glib.h> can be included d=
irectly."
> > >> ERROR: Task 5224 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile) failed with exit c=
ode '1'
> > >>   | graphicwindow.h:62:23: error: 'class QwtPlotZoomer' has no membe=
r named 'setSelectionFlags'
> > >>   | graphicwindow.h:62:42: error: 'DragSelection' is not a member of=
 'QwtPicker'
> > >>
> > >> ERROR: Task 19052 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-connectivity/networkmanager/modemmanager_0.5.bb, do_compile) faile=
d with exit code '1'
> > >>   patch on ML to upgrade it fixes this
> > >>   | mm-serial-port.c:1293:9: error: 'g_value_get_char' is deprecated=
 (declared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/inclu=
de/glib-2.0/gobject/gvaluetypes.h:184): Use 'g_value_get_schar' instead [-W=
error=3Ddeprecated-declarations]
> > >> ERROR: Task 18812 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-kernel/compat-wireless/compat-wireless-all_0.bb, do_compile) faile=
d with exit code '1'
> > >>   | /OE/jansa-test/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi=
/compat-wireless-all/3.5-rc5-1-r0/compat-wireless-3.5-rc5-1/include/linux/c=
ompat-3.5.h:76:8: error: redefinition of 'struct tc_fq_codel_qd_stats'
> > >> ERROR: Task 18643 (/OE/jansa-test/shr-core/meta-openembedded/meta-gn=
ome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile) failed with exit=
 code '1'
> > >>   | downloader-view.c:340:7: error: too many arguments to function '=
notify_notification_new'
> > >> ERROR: Task 16595 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-devtools/python/python-pyudev_0.11.bb, do_compile) failed with exi=
t code '1'
> > >>   |   File "/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux=
-gnueabi/python-pyudev/0.11-r3/pyudev-0.11/pyudev/_libudev.py", line 205, i=
n load_udev_library
> > >>   |     raise ImportError('No library named udev')
> > >>   | ImportError: No library named udev
> > >> ERROR: Task 16464 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-support/hddtemp/hddtemp_0.3-beta15.bb, do_patch) failed with exit =
code '1'
> > >>   ERROR: Command Error: exit status: 1  Output:
> > >>   Applying patch hddtemp-db.patch
> > >>   Ignoring potentially dangerous file name ../hddtemp.db
> > >>   can't find file to patch at input line 7
> > >> ERROR: Task 15665 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb, do_fetch) failed with exit co=
de '1'
> > >>   ERROR: Fetcher failure: Fetch command failed with exit code 8, out=
put:
> > >>   http://downloads.sourceforge.net/project/f2fs-tools/f2fs-tools-1.1=
=2E0.tar.gz:
> > >>   2012-12-13 05:06:20 ERROR 404: Not Found.
> > >> ERROR: Task 15569 (/OE/jansa-test/shr-core/meta-openembedded/meta-ne=
tworking/recipes-support/netcat/netcat_0.7.1.bb, do_compile) failed with ex=
it code '1'
> > >>   | intl.h:31:2: error: #error You must have locale.h in your system
> > >> ERROR: Task 13181 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-graphics/fbida/fbida_2.08.bb, do_compile) failed with exit code '1'
> > >>   | checking for libjpeg version ... <stdin>:1:21: fatal error: jpeg=
lib.h: No such file or directory
> > >>   | compilation terminated.
> > >>   | # 1 "<stdin>"
> > >>   | /bin/sh: stdin: No such file or directory
> > >>   | make: *** No rule to make target `jpeg//transupp.o', needed by `=
exiftran'.  Stop.
> > >>   | make: *** Waiting for unfinished jobs....
> > >>   |   CC    jpegtools.o
> > >>   | jpegtools.c:36:59: fatal error: transupp.h: No such file or dire=
ctory
> > >>   | compilation terminated.
> > >> ERROR: Task 10876 (/OE/jansa-test/shr-core/meta-openembedded/meta-gn=
ome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb, do_configur=
e) failed with exit code '1'
> > >>   | configure.in:8: error: version mismatch.  This is Automake 1.12.=
5,
> > >>   | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
> > >>   | configure.in:8: comes from Automake 1.11.1.  You should recreate
> > >>   | configure.in:8: aclocal.m4 with aclocal and run automake again.
> > >> ERROR: Task 10317 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe=
/recipes-support/syslog-ng/syslog-ng_3.2.5.bb, do_compile) failed with exit=
 code '1'
> > >>   | {standard input}:637: Error: bad instruction `rorw $8,'
> > >>   | make[3]: *** [misc.lo] Error 1
> > >> ERROR: Task 8769 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-multimedia/pulseaudio/pavucontrol_git.bb, do_compile) failed with e=
xit code '1'
> > >>   | make[2]: *** No rule to make target `README', needed by `all-am'=
=2E  Stop.
> > >>   | make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/w=
ork/armv5te-oe-linux-gnueabi/pavucontrol/0.9.10+git-r0/git/doc'
> > >> ERROR: Task 7983 (/OE/jansa-test/shr-core/meta-openembedded/meta-gno=
me/recipes-gnome/zenity/zenity_2.32.1.bb, do_compile) failed with exit code=
 '1'
> > >>   | notification.c:187: error: undefined reference to 'notify_notifi=
cation_new_with_status_icon'
> > >>   | collect2: error: ld returned 1 exit status
> > >> ERROR: Task 7852 (/OE/jansa-test/shr-core/meta-openembedded/meta-gno=
me/recipes-gnome/nautilus/nautilus3_3.0.2.bb, do_patch) failed with exit co=
de '1'
> > >>   Applying patch no-try-run-strftime.diff
> > >>   patching file configure.in
> > >>   Hunk #1 FAILED at 375.
> > >>   1 out of 1 hunk FAILED -- rejects in file configure.in
> > >> ERROR: Task 7712 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-extended/iotop/iotop_0.4.4.bb, do_install) failed with exit code '1'
> > >>   patch on ML
> > >>   | Writing /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux=
-gnueabi/iotop/0.4.4-r0/image//usr/lib/python2.7/site-packages/iotop-0.4.4-=
py2.7.egg-info
> > >>   | ERROR: Function failed: do_install (see /OE/jansa-test/shr-core/=
tmp-eglibc/work/armv5te-oe-linux-gnueabi/iotop/0.4.4-r0/temp/log.do_install=
=2E18090 for further information)
> > >> ERROR: Task 8067 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-devtools/glade/glade3_3.8.2.bb, do_compile) failed with exit code '=
1'
> > >>   patch on ML
> > >>   | http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1: =
parser error : Content error in the external subset
> > >>   | HTTP/1.1 200 OK
> > >> ERROR: Task 4056 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-support/fftw/benchfft_3.1.bb, do_configure) failed with exit code '=
1'
> > >>   | benchees/goedecker/Makefile.am: error: Fortran source seen but '=
FC' is undefined
> > >>   | benchees/goedecker/Makefile.am:   The usual way to define 'FC' i=
s to add 'AC_PROG_FC'
> > >>   | benchees/goedecker/Makefile.am:   to 'configure.ac' and run 'aut=
oconf' again.
> > >> ERROR: Task 2662 (/OE/jansa-test/shr-core/meta-openembedded/meta-gno=
me/recipes-gnome/gnome/gnome-terminal_2.26.3.bb, do_compile) failed with ex=
it code '1'
> > >>   | terminal-window.c: At top level:
> > >>   | terminal-window.c:2522:34: error: unknown type name 'GtkNotebook=
Page'
> > >> ERROR: Task 1591 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-devtools/libedit/libedit_20120601.bb, do_fetch) failed with exit co=
de '1'
> > >>   ERROR: Fetcher failure: Fetch command failed with exit code 8, out=
put:
> > >>   http://www.thrysoee.dk/editline/libedit-20120601-3.0.tar.gz:
> > >>   2012-12-13 06:29:21 ERROR 406: Not Acceptable.
> > >> ERROR: Task 372 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compi=
le) failed with exit code '1'
> > >>   | gpm-manager.c:488:3: error: too many arguments to function 'noti=
fy_notification_new'
> > >>
> > >> QA:
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bswscale/usr/lib/libswscale.so.2.1.0' has relocations in .text
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.0.0' has relocations in .text
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bavutil/usr/lib/libavutil.so.51.22.1' has relocations in .text
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bavformat/usr/lib/libavformat.so.53.21.0' has relocations in .text
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bavfilter/usr/lib/libavfilter.so.2.15.0' has relocations in .text
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text
> > >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binar=
y '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0=
=2E8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/li=
bavcodec/usr/lib/libavcodec.so.53.35.0' has relocations in .text
> > >> libpostproc-0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969: ELF=
 binary '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/l=
ibpostproc/0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969-r0/packages-=
split/libpostproc/usr/lib/libpostproc.so.52.0.100' has relocations in .text
> > >> tk-8.5.8: tk-lib: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/package=
s-split/tk-lib/usr/lib/libtk8.5.so.0 contains probably-redundant RPATH /usr=
/lib
> > >> tk-8.5.8: tk: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages-sp=
lit/tk/usr/bin/wish8.5 contains probably-redundant RPATH /usr/lib
> > >> php-5.3.19: php: Files/directories were installed but not shipped
> > >>   reported on ML
> > >>   /var
> > >>   /OE
> > >>   /etc/php-fpm.conf.default
> > >>   /var/run
> > >>   /var/log
> > >>   /OE/jansa-test
> > >>   /OE/jansa-test/shr-core
> > >>   /OE/jansa-test/shr-core/tmp-eglibc
> > >>   /OE/jansa-test/shr-core/tmp-eglibc/sysroots
> > >> fakeroot-1.12.4: fakeroot: Files/directories were installed but not =
shipped
> > >>   reported on ML
> > >>   /usr/lib/libfakeroot
> > >>   /usr/lib/libfakeroot/libfakeroot.a
> > >>   /usr/lib/libfakeroot/libfakeroot.la
> > >>   /usr/lib/libfakeroot/libfakeroot-0.so
> > >>   /usr/lib/libfakeroot/libfakeroot.so
> > >>   /usr/lib/libfakeroot/.debug
> > >>   /usr/lib/libfakeroot/.debug/libfakeroot-0.so
> > >>   /usr/lib/libfakeroot/.debug/libfakeroot.so
> > >> gnome-control-center-2.32.1: non -staticdev package contains static =
=2Ea library: gnome-control-center-dev path '/work/armv5te-oe-linux-gnueabi=
/gnome-control-center/2.32.1-r0/packages-split/gnome-control-center-dev/usr=
/lib/window-manager-settings/libmetacity.a'
> > >>   patch on ML
> > >> --
> > >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > >
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > >
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xYeFQzU4VZLrHqxU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDYBesACgkQN1Ujt2V2gBw4+ACdHzixZ+G6quYo4YnR7GsrTPgh
OqgAn0mJ7W2ndOHuZRd+SPu4VRGE1it2
=WmwP
-----END PGP SIGNATURE-----

--xYeFQzU4VZLrHqxU--
