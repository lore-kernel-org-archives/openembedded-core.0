Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TnQXT-0002p4-TN; Tue, 25 Dec 2012 10:11:09 +0100
Received: by mail-wg0-f46.google.com with SMTP id dr13so3425066wgb.25
	for <multiple recipients>; Tue, 25 Dec 2012 00:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yD7k+x1bygmYPhj8BmA/QDmCEfeV0sQjUqzL1Ltpd2w=;
	b=dv1v2EO3OM4SUT/IO4lUW+y/E5Bttde5cerRw22hHLIbezESha3wgddwBFrIoGlDdz
	mChlVnYohUSfoB7wZ22h174bO/U2N7HlQuKeB3D94XJhB4sTRbAEdsmBBN29TZ1p3qcb
	5qFzkjuFC5oelUpXQBeK/v4ZBoVG+XOYAnmOYiMpigQimPi8SMWmUeVvw3RAAqDYTfie
	mS//fobOZDRd6D3gq59u1gu4tiE15o75RzRorGRd1qBo64MPwO4wqkMZs6/POAfEHThn
	IaWcE40SJaswRLKXoSzJDPR2vGOd9NJcvKxvOomFhewYUOcJTl5KDL9GZrA9zwmfJhMQ
	doIA==
X-Received: by 10.180.73.202 with SMTP id n10mr38214618wiv.17.1356425776872;
	Tue, 25 Dec 2012 00:56:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dm3sm46782726wib.9.2012.12.25.00.56.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Dec 2012 00:56:16 -0800 (PST)
Date: Tue, 25 Dec 2012 09:56:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20121225085616.GV8988@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121224091242.GS8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 25 Dec 2012 09:11:14 -0000
X-Groupsio-MsgNum: 33085
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MLcyhLwX/7AHNQNx"
Content-Disposition: inline

--MLcyhLwX/7AHNQNx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2012 at 10:12:42AM +0100, Martin Jansa wrote:
> On Sun, Dec 23, 2012 at 09:16:34PM +0100, Martin Jansa wrote:
> > On Thu, Dec 13, 2012 at 06:42:02PM +0100, Martin Jansa wrote:
> > > Hi,=20
> > >=20
> > > I've sent a lot of small fixes to get world builds usable (to be able=
 to
> > > spot when there is more issues then usual).
> > >=20
> > > Now I'm down to ~ 43 recipes failing (+ maybe something what depends =
on
> > > them)
> >=20
> > Now I'm down to 19 failures with this patchset
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-December/0=
43163.html
> >   openembedded-core/meta/recipes-graphics/clutter/cogl_1.8.2.bb, do_com=
pile
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-d=
isk-utility_2.32.0.bb, do_compile
> >   openembedded-core/meta/recipes-extended/sat-solver/sat-solver_git.bb,=
 do_compile
> >   meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_com=
pile
> >   openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
> >   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirel=
ess-all_0.bb, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.b=
b, do_compile
> >   meta-openembedded/meta-oe/recipes-connectivity/hostapd/hostap-daemon_=
1.0.bb, do_compile
> >   meta-openembedded/meta-networking/recipes-support/netcat/netcat_0.7.1=
=2Ebb, do_compile
> >   meta-openembedded/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb=
, do_fetch
> >   meta-openembedded/meta-oe/recipes-graphics/slim/slim_1.3.2.bb, do_com=
pile
> >   meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.08.bb, do_co=
mpile
> >   meta-openembedded/meta-gnome/recipes-gnome/system-tools/system-tools-=
backends_2.10.2.bb, do_configure
> >   meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.b=
b, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, d=
o_compile
> >   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omap_g=
it.bb, do_compile
> >   meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_install
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.=
3.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-support/fftw/benchfft_3.1.bb, do_co=
nfigure
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_compile
> >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
>=20
> Few more are failing when it's built without DISTRO setting (and also wit=
hout gold)
> http://jenkins.nas-admin.org/job/shr-core-branches_world_qemuarm/28/conso=
leFull
>   meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb, do_=
package_write_ipk
>   meta-smartphone/meta-shr/recipes-multimedia/mplayer/mplayer_svn.bb, do_=
compile
>   meta-openembedded/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb=
, do_compile
>   virtual:native:meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs=
_0.6.20.bb, do_populate_sysroot
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb, do=
_compile
>   meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb, do_=
install
>   meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5=
=2Ebb, do_configure
>   meta-openembedded/meta-networking/recipes-support/traceroute/traceroute=
_2.0.18.bb, do_install
>=20
> Systemd issues seems the same as Eric reported from denzil:
> 09:51:56 < JaMa|Off> this is with latest master and I've reported it too =
while ago.. looks like some conflict in bitbake
>                      cache or something like that
> 09:52:44 < JaMa|Off> ERROR: Error executing a python function in=20
> /home/jenkins/shr/shr-core-branches/shr-core/meta-openembedded/meta-syste=
md/recipes-core/systemd/systemd_git.bb:
> 09:52:45 < JaMa|Off> OSError: [Errno 2] No such file or directory:=20
> '/home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/udev/182-r3/packages-split/udev-systemd'
> 09:53:09 < ericben> JaMa|Off: I also have this one yes during build.=20
> 09:53:09 < JaMa|Off> python task from systemd recipe is trying to use wor=
kdir from udev recipe

And few more issues when building without usable MIRRORs/PREMIRRORs:
  meta-openembedded/meta-oe/recipes-devtools/python/python-sip_4.13.3.bb, d=
o_fetch
  meta-openembedded/meta-oe/recipes-multimedia/live555/live555_20110314.bb,=
 do_fetch
  meta-openembedded/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb, do_f=
etch
  meta-openembedded/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb, do_f=
etch
  meta-smartphone/meta-shr/recipes-shr/3rdparty/vagalume_0.8.3.bb, do_fetch
  meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb, =
do_fetch
  meta-openembedded/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb,=
 do_fetch
  meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb, do_=
fetch
  meta-smartphone/meta-shr/recipes-shr/3rdparty/om-neon_svn.bb, do_fetch
  meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb, =
do_fetch
  meta-openembedded/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-=
10.bb, do_fetch

Log is here:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/qemuarm/20121=
225084538.log

Log from complete world build (without tmpdir and sstate-cache)
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/qemuarm/20121=
224090423.log
2nd part after running out of space:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/qemuarm/20121=
224204907.log

Cheers,

> > Except this patchset I've fix for zenity, f2fs-tools and=20
> > SkipPackage for xf86-video-omap (without opengl DISTRO_FEATURE).
> >=20
> > And I've added the rest to PNBLACKLIST and EXCLUDE_FROM_WORLD
> > (including recipes which depend on one of them)
> > so don't wait for me to fix the rest.
> >=20
> > Maybe we should create nonworking directory to disable=20
> > unmaintained recipes which does not even build like we had in OE-classi=
c.
> >=20
> > Cheers,
> >=20
> > > and 5 recipes with QA warnings (recorded in qa.log - e.g. deprecated =
use
> > > of u-a.bbclass is not recorded there).
> > >=20
> > > Attaching list so that people which find some recipe they care about =
can
> > > step up and fix that..
> > >=20
> > > failures and qa issues from bitbake world with qemuarm.
> > >=20
> > > oe-core has Revert "ICU: add pkgconfig support" to build webkit-gtk a=
nd webkit-efl
> > > all layers have some more fixes which I'm going to send soon
> > >=20
> > > included layers:
> > > meta-shr
> > > meta-aurora
> > > meta-fso
> > > meta-android      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf568=
430c9"
> > > meta-oe
> > > meta-efl
> > > meta-gnome
> > > meta-gpe
> > > meta-multimedia
> > > meta-networking
> > > meta-systemd      =3D "jansa/test:f6b59111bd40fad927cbde23e239231b4e0=
7ea20"
> > > meta-osmocombb
> > > meta-nokia
> > > meta-htc
> > > meta-palm
> > > meta-openmoko
> > > meta-samsung      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf568=
430c9"
> > > meta-browser      =3D "jansa/test:1231ef3d166231c0426174077da64282db2=
645a6"
> > > meta              =3D "jansa/test:6721eda317f98c673d1ac30362e4d454ab8=
43586"
> > >=20
> > > $ cat world.log.qemuarm7.list | grep openembedded-core
> > > ERROR: Task 13533 (/OE/jansa-test/shr-core/openembedded-core/meta/rec=
ipes-graphics/clutter/cogl_1.8.2.bb, do_compile) failed with exit code '1'
> > >   | {standard input}:542: Error: selected processor does not support =
Thumb mode `clz r3,r0'
> > > ERROR: Task 2074 (/OE/jansa-test/shr-core/openembedded-core/meta/reci=
pes-extended/sat-solver/sat-solver_git.bb, do_compile) failed with exit cod=
e '1'
> > >   | /tmp/cc7QsEPB.s: Assembler messages:
> > >   | /tmp/cc7QsEPB.s:1542: Error: invalid offset, value too big (0x000=
00400)
> > >   | make[2]: *** [src/CMakeFiles/satsolver.dir/sha2.o] Error 1
> > > ERROR: Task 20335 (virtual:native:/OE/jansa-test/shr-core/openembedde=
d-core/meta/recipes-extended/ghostscript/ghostscript_9.05.bb, do_compile) f=
ailed with exit code '1'
> > >   patch on ML
> > >   | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/=
libfontconfig.so: undefined reference to `FT_Get_Sfnt_Name'
> > >   | collect2: error: ld returned 1 exit status
> > >   | make: *** [obj/aux/mkromfs_0] Error 1
> > > ERROR: Task 3453 (/OE/jansa-test/shr-core/openembedded-core/meta/reci=
pes-qt/qt-apps/qmmp_0.6.1.bb, do_compile) failed with exit code '1'
> > >   | In file included from decoder_mpc.cpp:28:0:
> > >   | decoder_mpc.h:27:24: fatal error: mpc/mpcdec.h: No such file or d=
irectory
> > >   | compilation terminated.
> > >   or
> > >   | Project ERROR: Package wavpack not found
> > > ERROR: Task 7843 (/OE/jansa-test/shr-core/openembedded-core/meta/reci=
pes-graphics/xorg-driver/xf86-video-omap_git.bb, do_compile) failed with ex=
it code '1'
> > >   | omap_driver.h:54:18: fatal error: dri2.h: No such file or directo=
ry
> > >   incompatible with DISTRO_FEATURES without opengl
> > > ERROR: Task 6463 (/OE/jansa-test/shr-core/openembedded-core/meta/reci=
pes-multimedia/gstreamer/gst-openmax_0.10.1.bb, do_compile) failed with exi=
t code '1'
> > >   reported on ML
> > >   | gstomx_base_filter.c:846:3: error: 'g_mutex_new' is deprecated (d=
eclared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/=
glib-2.0/glib/deprecated/gthread.h:271) [-Werror=3Ddeprecated-declarations]
> > >   | cc1: all warnings being treated as errors
> > > =20
> > > $ cat world.log.qemuarm7.list | grep meta-openembedded
> > > ERROR: Task 11018 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-connectivity/uhd/uhd_git.bb, do_configure) failed with exit code '1'
> > >   | CMake Error at cmake/Modules/UHDPython.cmake:54 (MESSAGE):
> > >   |   Error: Python interpretor required by the build system.
> > > ERROR: Task 8798 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-qt/qwt/qwt-e_6.0.1.bb, do_compile) failed with exit code '1'
> > >   this is OK, qwt-6.0.1 was built before
> > >   | Project ERROR: local build will conflict with /OE/jansa-test/shr-=
core/tmp-eglibc/sysroots/qemuarm/usr/lib/libqwt.*
> > > ERROR: Task 468 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb, do_fetch) failed w=
ith exit code '1'
> > >   WARNING: Failed to fetch URL ftp://ftp.nluug.nl/pub/gnu/libmicrohtt=
pd//libmicrohttpd-0.4.6.tar.gz, attempting MIRRORS if available
> > >   ERROR: Fetcher failure: Fetch command failed with exit code 8, outp=
ut:
> > >   No such file 'libmicrohttpd-0.4.6.tar.gz'.
> > > ERROR: Task 104 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/gnome/libgnomecups_0.2.3.bb, do_compile) failed with exit co=
de '1'
> > >   | In file included from gnome-cups-init.h:4:0,
> > >   |                  from gnome-cups-request.h:6,
> > >   |                  from gnome-cups-util.c:7:
> > >   | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/g=
lib-2.0/glib/gtypes.h:28:2: error: #error "Only <glib.h> can be included di=
rectly."
> > > ERROR: Task 5224 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile) failed with exit co=
de '1'
> > >   | graphicwindow.h:62:23: error: 'class QwtPlotZoomer' has no member=
 named 'setSelectionFlags'
> > >   | graphicwindow.h:62:42: error: 'DragSelection' is not a member of =
'QwtPicker'
> > >=20
> > > ERROR: Task 19052 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-connectivity/networkmanager/modemmanager_0.5.bb, do_compile) failed=
 with exit code '1'
> > >   patch on ML to upgrade it fixes this
> > >   | mm-serial-port.c:1293:9: error: 'g_value_get_char' is deprecated =
(declared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/includ=
e/glib-2.0/gobject/gvaluetypes.h:184): Use 'g_value_get_schar' instead [-We=
rror=3Ddeprecated-declarations]
> > > ERROR: Task 18812 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-kernel/compat-wireless/compat-wireless-all_0.bb, do_compile) failed=
 with exit code '1'
> > >   | /OE/jansa-test/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/=
compat-wireless-all/3.5-rc5-1-r0/compat-wireless-3.5-rc5-1/include/linux/co=
mpat-3.5.h:76:8: error: redefinition of 'struct tc_fq_codel_qd_stats'
> > > ERROR: Task 18643 (/OE/jansa-test/shr-core/meta-openembedded/meta-gno=
me/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile) failed with exit =
code '1'
> > >   | downloader-view.c:340:7: error: too many arguments to function 'n=
otify_notification_new'
> > > ERROR: Task 16595 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-devtools/python/python-pyudev_0.11.bb, do_compile) failed with exit=
 code '1'
> > >   |   File "/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-=
gnueabi/python-pyudev/0.11-r3/pyudev-0.11/pyudev/_libudev.py", line 205, in=
 load_udev_library
> > >   |     raise ImportError('No library named udev')
> > >   | ImportError: No library named udev
> > > ERROR: Task 16464 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-support/hddtemp/hddtemp_0.3-beta15.bb, do_patch) failed with exit c=
ode '1'
> > >   ERROR: Command Error: exit status: 1  Output:
> > >   Applying patch hddtemp-db.patch
> > >   Ignoring potentially dangerous file name ../hddtemp.db
> > >   can't find file to patch at input line 7
> > > ERROR: Task 15665 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb, do_fetch) failed with exit cod=
e '1'
> > >   ERROR: Fetcher failure: Fetch command failed with exit code 8, outp=
ut:
> > >   http://downloads.sourceforge.net/project/f2fs-tools/f2fs-tools-1.1.=
0.tar.gz:
> > >   2012-12-13 05:06:20 ERROR 404: Not Found.
> > > ERROR: Task 15569 (/OE/jansa-test/shr-core/meta-openembedded/meta-net=
working/recipes-support/netcat/netcat_0.7.1.bb, do_compile) failed with exi=
t code '1'
> > >   | intl.h:31:2: error: #error You must have locale.h in your system
> > > ERROR: Task 13181 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-graphics/fbida/fbida_2.08.bb, do_compile) failed with exit code '1'
> > >   | checking for libjpeg version ... <stdin>:1:21: fatal error: jpegl=
ib.h: No such file or directory
> > >   | compilation terminated.
> > >   | # 1 "<stdin>"
> > >   | /bin/sh: stdin: No such file or directory
> > >   | make: *** No rule to make target `jpeg//transupp.o', needed by `e=
xiftran'.  Stop.
> > >   | make: *** Waiting for unfinished jobs....
> > >   |   CC    jpegtools.o
> > >   | jpegtools.c:36:59: fatal error: transupp.h: No such file or direc=
tory
> > >   | compilation terminated.
> > > ERROR: Task 10876 (/OE/jansa-test/shr-core/meta-openembedded/meta-gno=
me/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb, do_configure=
) failed with exit code '1'
> > >   | configure.in:8: error: version mismatch.  This is Automake 1.12.5,
> > >   | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
> > >   | configure.in:8: comes from Automake 1.11.1.  You should recreate
> > >   | configure.in:8: aclocal.m4 with aclocal and run automake again.
> > > ERROR: Task 10317 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/=
recipes-support/syslog-ng/syslog-ng_3.2.5.bb, do_compile) failed with exit =
code '1'
> > >   | {standard input}:637: Error: bad instruction `rorw $8,'
> > >   | make[3]: *** [misc.lo] Error 1
> > > ERROR: Task 8769 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-multimedia/pulseaudio/pavucontrol_git.bb, do_compile) failed with ex=
it code '1'
> > >   | make[2]: *** No rule to make target `README', needed by `all-am'.=
  Stop.
> > >   | make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/wo=
rk/armv5te-oe-linux-gnueabi/pavucontrol/0.9.10+git-r0/git/doc'
> > > ERROR: Task 7983 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/zenity/zenity_2.32.1.bb, do_compile) failed with exit code =
'1'
> > >   | notification.c:187: error: undefined reference to 'notify_notific=
ation_new_with_status_icon'
> > >   | collect2: error: ld returned 1 exit status
> > > ERROR: Task 7852 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/nautilus/nautilus3_3.0.2.bb, do_patch) failed with exit cod=
e '1'
> > >   Applying patch no-try-run-strftime.diff
> > >   patching file configure.in
> > >   Hunk #1 FAILED at 375.
> > >   1 out of 1 hunk FAILED -- rejects in file configure.in
> > > ERROR: Task 7712 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-extended/iotop/iotop_0.4.4.bb, do_install) failed with exit code '1'
> > >   patch on ML
> > >   | Writing /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-=
gnueabi/iotop/0.4.4-r0/image//usr/lib/python2.7/site-packages/iotop-0.4.4-p=
y2.7.egg-info
> > >   | ERROR: Function failed: do_install (see /OE/jansa-test/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/iotop/0.4.4-r0/temp/log.do_install.=
18090 for further information)
> > > ERROR: Task 8067 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-devtools/glade/glade3_3.8.2.bb, do_compile) failed with exit code '1'
> > >   patch on ML
> > >   | http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1: p=
arser error : Content error in the external subset
> > >   | HTTP/1.1 200 OK
> > > ERROR: Task 4056 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-support/fftw/benchfft_3.1.bb, do_configure) failed with exit code '1'
> > >   | benchees/goedecker/Makefile.am: error: Fortran source seen but 'F=
C' is undefined
> > >   | benchees/goedecker/Makefile.am:   The usual way to define 'FC' is=
 to add 'AC_PROG_FC'
> > >   | benchees/goedecker/Makefile.am:   to 'configure.ac' and run 'auto=
conf' again.
> > > ERROR: Task 2662 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome/gnome-terminal_2.26.3.bb, do_compile) failed with exi=
t code '1'
> > >   | terminal-window.c: At top level:
> > >   | terminal-window.c:2522:34: error: unknown type name 'GtkNotebookP=
age'
> > > ERROR: Task 1591 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-devtools/libedit/libedit_20120601.bb, do_fetch) failed with exit cod=
e '1'
> > >   ERROR: Fetcher failure: Fetch command failed with exit code 8, outp=
ut:
> > >   http://www.thrysoee.dk/editline/libedit-20120601-3.0.tar.gz:
> > >   2012-12-13 06:29:21 ERROR 406: Not Acceptable.
> > > ERROR: Task 372 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compil=
e) failed with exit code '1'
> > >   | gpm-manager.c:488:3: error: too many arguments to function 'notif=
y_notification_new'
> > >=20
> > > QA:
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libsw=
scale/usr/lib/libswscale.so.2.1.0' has relocations in .text
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libpo=
stproc/usr/lib/libpostproc.so.52.0.0' has relocations in .text
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libav=
util/usr/lib/libavutil.so.51.22.1' has relocations in .text
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libav=
format/usr/lib/libavformat.so.53.21.0' has relocations in .text
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libav=
filter/usr/lib/libavfilter.so.2.15.0' has relocations in .text
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libav=
device/usr/lib/libavdevice.so.53.2.0' has relocations in .text
> > > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary=
 '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.=
8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libav=
codec/usr/lib/libavcodec.so.53.35.0' has relocations in .text
> > > libpostproc-0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969: ELF =
binary '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/li=
bpostproc/0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969-r0/packages-s=
plit/libpostproc/usr/lib/libpostproc.so.52.0.100' has relocations in .text
> > > tk-8.5.8: tk-lib: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages=
-split/tk-lib/usr/lib/libtk8.5.so.0 contains probably-redundant RPATH /usr/=
lib
> > > tk-8.5.8: tk: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages-spl=
it/tk/usr/bin/wish8.5 contains probably-redundant RPATH /usr/lib
> > > php-5.3.19: php: Files/directories were installed but not shipped
> > >   reported on ML
> > >   /var
> > >   /OE
> > >   /etc/php-fpm.conf.default
> > >   /var/run
> > >   /var/log
> > >   /OE/jansa-test
> > >   /OE/jansa-test/shr-core
> > >   /OE/jansa-test/shr-core/tmp-eglibc
> > >   /OE/jansa-test/shr-core/tmp-eglibc/sysroots
> > > fakeroot-1.12.4: fakeroot: Files/directories were installed but not s=
hipped
> > >   reported on ML
> > >   /usr/lib/libfakeroot
> > >   /usr/lib/libfakeroot/libfakeroot.a
> > >   /usr/lib/libfakeroot/libfakeroot.la
> > >   /usr/lib/libfakeroot/libfakeroot-0.so
> > >   /usr/lib/libfakeroot/libfakeroot.so
> > >   /usr/lib/libfakeroot/.debug
> > >   /usr/lib/libfakeroot/.debug/libfakeroot-0.so
> > >   /usr/lib/libfakeroot/.debug/libfakeroot.so
> > > gnome-control-center-2.32.1: non -staticdev package contains static .=
a library: gnome-control-center-dev path '/work/armv5te-oe-linux-gnueabi/gn=
ome-control-center/2.32.1-r0/packages-split/gnome-control-center-dev/usr/li=
b/window-manager-settings/libmetacity.a'
> > >   patch on ML
> > > --=20
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >=20
> >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MLcyhLwX/7AHNQNx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDZajAACgkQN1Ujt2V2gBynQwCdHMQzQx+e9jMXsL+rFmwn2pgs
igMAn30mEqDbAX4QJ3N3barIimKeWsm1
=agvT
-----END PGP SIGNATURE-----

--MLcyhLwX/7AHNQNx--
