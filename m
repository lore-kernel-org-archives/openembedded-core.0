Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tn2Qe-0001tf-19; Mon, 24 Dec 2012 08:26:28 +0100
Received: by mail-ee0-f42.google.com with SMTP id c41so3490113eek.29
	for <multiple recipients>; Sun, 23 Dec 2012 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FLyU2Z8wEpyitTdFv3bzWjB50+9JMQsWOVL+vy5lmsA=;
	b=MPI79Htel3jfW1YYw/apSyLVkqVAtXEAOFfKmPjlIU3CBoszUx1lz2zzuNoQ2CLT89
	HX0lOBX69t7alPaNcURJXMhPtFFPO0HOo9AXZdZei87d8tXsBbnvJZcwvq+YkWpO4aUS
	zd0ezvG5EClAdD/2BH6PFu7d8HwvUs3uSVA4lOSYeoYAJDhBZW9T+eplJSLggPHkAaR1
	I1D5KDcy6bZe0Q12HR8iotlurpWnuQZIZUaFGJzqHUhV1ze5a0boEvOlD40INKfkL4WJ
	Nd+XkrHFF9u6MJf2uleDxs4wJ8fDP5WzpF0yRx0fF6LrpysvrQysCmkh32DKkkwsubBX
	lVdw==
X-Received: by 10.14.207.6 with SMTP id m6mr53417340eeo.10.1356333097492;
	Sun, 23 Dec 2012 23:11:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm39514252eep.5.2012.12.23.23.11.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 23:11:36 -0800 (PST)
Date: Mon, 24 Dec 2012 08:11:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20121224071135.GP8988@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<CALbNGRQEu9f1KbGQTf9z2KAm8B12BbCr6HpT0Bqv6Cd9hdDizQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQEu9f1KbGQTf9z2KAm8B12BbCr6HpT0Bqv6Cd9hdDizQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Dec 2012 07:26:39 -0000
X-Groupsio-MsgNum: 33038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2uzDqHpccQJpqF2n"
Content-Disposition: inline

--2uzDqHpccQJpqF2n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 10:42:36PM +0100, Andreas M=FCller wrote:
> On Sun, Dec 23, 2012 at 9:16 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Dec 13, 2012 at 06:42:02PM +0100, Martin Jansa wrote:
> >> Hi,
> >>
> >> I've sent a lot of small fixes to get world builds usable (to be able =
to
> >> spot when there is more issues then usual).
> >>
> >> Now I'm down to ~ 43 recipes failing (+ maybe something what depends on
> >> them)
> >
> > Now I'm down to 19 failures with this patchset
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-December/0=
43163.html
> >   openembedded-core/meta/recipes-graphics/clutter/cogl_1.8.2.bb, do_com=
pile
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-d=
isk-utility_2.32.0.bb, do_compile
> Builds fine here for very long time. Could you give details?

That's one of those issues with libnotify(3)
| notification-main.c:539:21: error: too many arguments to function 'notify=
_notification_new'

The same does apply=20
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_compile
| gpm-manager.c:488:3: error: too many arguments to function 'notify_notifi=
cation_new'

> >   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.b=
b, do_compile
| downloader-view.c:340:7: error: too many arguments to function 'notify_no=
tification_new'

> >   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, d=
o_compile
| notification.c:187: error: undefined reference to 'notify_notification_ne=
w_with_status_icon'

Cheers,

> >   openembedded-core/meta/recipes-extended/sat-solver/sat-solver_git.bb,=
 do_compile
> >   meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_com=
pile
> >   openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
> >   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirel=
ess-all_0.bb, do_compile
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
> >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
> >
> > Except this patchset I've fix for zenity, f2fs-tools and
> > SkipPackage for xf86-video-omap (without opengl DISTRO_FEATURE).
> >
> > And I've added the rest to PNBLACKLIST and EXCLUDE_FROM_WORLD
> > (including recipes which depend on one of them)
> > so don't wait for me to fix the rest.
> >
> > Maybe we should create nonworking directory to disable
> > unmaintained recipes which does not even build like we had in OE-classi=
c.
> >
> > Cheers,
> >
> >> and 5 recipes with QA warnings (recorded in qa.log - e.g. deprecated u=
se
> >> of u-a.bbclass is not recorded there).
> >>
> >> Attaching list so that people which find some recipe they care about c=
an
> >> step up and fix that..
> >>
> >> failures and qa issues from bitbake world with qemuarm.
> >>
> >> oe-core has Revert "ICU: add pkgconfig support" to build webkit-gtk an=
d webkit-efl
> >> all layers have some more fixes which I'm going to send soon
> >>
> >> included layers:
> >> meta-shr
> >> meta-aurora
> >> meta-fso
> >> meta-android      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf5684=
30c9"
> >> meta-oe
> >> meta-efl
> >> meta-gnome
> >> meta-gpe
> >> meta-multimedia
> >> meta-networking
> >> meta-systemd      =3D "jansa/test:f6b59111bd40fad927cbde23e239231b4e07=
ea20"
> >> meta-osmocombb
> >> meta-nokia
> >> meta-htc
> >> meta-palm
> >> meta-openmoko
> >> meta-samsung      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf5684=
30c9"
> >> meta-browser      =3D "jansa/test:1231ef3d166231c0426174077da64282db26=
45a6"
> >> meta              =3D "jansa/test:6721eda317f98c673d1ac30362e4d454ab84=
3586"
> >>
> >> $ cat world.log.qemuarm7.list | grep openembedded-core
> >> ERROR: Task 13533 (/OE/jansa-test/shr-core/openembedded-core/meta/reci=
pes-graphics/clutter/cogl_1.8.2.bb, do_compile) failed with exit code '1'
> >>   | {standard input}:542: Error: selected processor does not support T=
humb mode `clz r3,r0'
> >> ERROR: Task 2074 (/OE/jansa-test/shr-core/openembedded-core/meta/recip=
es-extended/sat-solver/sat-solver_git.bb, do_compile) failed with exit code=
 '1'
> >>   | /tmp/cc7QsEPB.s: Assembler messages:
> >>   | /tmp/cc7QsEPB.s:1542: Error: invalid offset, value too big (0x0000=
0400)
> >>   | make[2]: *** [src/CMakeFiles/satsolver.dir/sha2.o] Error 1
> >> ERROR: Task 20335 (virtual:native:/OE/jansa-test/shr-core/openembedded=
-core/meta/recipes-extended/ghostscript/ghostscript_9.05.bb, do_compile) fa=
iled with exit code '1'
> >>   patch on ML
> >>   | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/l=
ibfontconfig.so: undefined reference to `FT_Get_Sfnt_Name'
> >>   | collect2: error: ld returned 1 exit status
> >>   | make: *** [obj/aux/mkromfs_0] Error 1
> >> ERROR: Task 3453 (/OE/jansa-test/shr-core/openembedded-core/meta/recip=
es-qt/qt-apps/qmmp_0.6.1.bb, do_compile) failed with exit code '1'
> >>   | In file included from decoder_mpc.cpp:28:0:
> >>   | decoder_mpc.h:27:24: fatal error: mpc/mpcdec.h: No such file or di=
rectory
> >>   | compilation terminated.
> >>   or
> >>   | Project ERROR: Package wavpack not found
> >> ERROR: Task 7843 (/OE/jansa-test/shr-core/openembedded-core/meta/recip=
es-graphics/xorg-driver/xf86-video-omap_git.bb, do_compile) failed with exi=
t code '1'
> >>   | omap_driver.h:54:18: fatal error: dri2.h: No such file or directory
> >>   incompatible with DISTRO_FEATURES without opengl
> >> ERROR: Task 6463 (/OE/jansa-test/shr-core/openembedded-core/meta/recip=
es-multimedia/gstreamer/gst-openmax_0.10.1.bb, do_compile) failed with exit=
 code '1'
> >>   reported on ML
> >>   | gstomx_base_filter.c:846:3: error: 'g_mutex_new' is deprecated (de=
clared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/g=
lib-2.0/glib/deprecated/gthread.h:271) [-Werror=3Ddeprecated-declarations]
> >>   | cc1: all warnings being treated as errors
> >>
> >> $ cat world.log.qemuarm7.list | grep meta-openembedded
> >> ERROR: Task 11018 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-connectivity/uhd/uhd_git.bb, do_configure) failed with exit code '1'
> >>   | CMake Error at cmake/Modules/UHDPython.cmake:54 (MESSAGE):
> >>   |   Error: Python interpretor required by the build system.
> >> ERROR: Task 8798 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-qt/qwt/qwt-e_6.0.1.bb, do_compile) failed with exit code '1'
> >>   this is OK, qwt-6.0.1 was built before
> >>   | Project ERROR: local build will conflict with /OE/jansa-test/shr-c=
ore/tmp-eglibc/sysroots/qemuarm/usr/lib/libqwt.*
> >> ERROR: Task 468 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb, do_fetch) failed wi=
th exit code '1'
> >>   WARNING: Failed to fetch URL ftp://ftp.nluug.nl/pub/gnu/libmicrohttp=
d//libmicrohttpd-0.4.6.tar.gz, attempting MIRRORS if available
> >>   ERROR: Fetcher failure: Fetch command failed with exit code 8, outpu=
t:
> >>   No such file 'libmicrohttpd-0.4.6.tar.gz'.
> >> ERROR: Task 104 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/=
recipes-gnome/gnome/libgnomecups_0.2.3.bb, do_compile) failed with exit cod=
e '1'
> >>   | In file included from gnome-cups-init.h:4:0,
> >>   |                  from gnome-cups-request.h:6,
> >>   |                  from gnome-cups-util.c:7:
> >>   | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gl=
ib-2.0/glib/gtypes.h:28:2: error: #error "Only <glib.h> can be included dir=
ectly."
> >> ERROR: Task 5224 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile) failed with exit cod=
e '1'
> >>   | graphicwindow.h:62:23: error: 'class QwtPlotZoomer' has no member =
named 'setSelectionFlags'
> >>   | graphicwindow.h:62:42: error: 'DragSelection' is not a member of '=
QwtPicker'
> >>
> >> ERROR: Task 19052 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-connectivity/networkmanager/modemmanager_0.5.bb, do_compile) failed =
with exit code '1'
> >>   patch on ML to upgrade it fixes this
> >>   | mm-serial-port.c:1293:9: error: 'g_value_get_char' is deprecated (=
declared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include=
/glib-2.0/gobject/gvaluetypes.h:184): Use 'g_value_get_schar' instead [-Wer=
ror=3Ddeprecated-declarations]
> >> ERROR: Task 18812 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-kernel/compat-wireless/compat-wireless-all_0.bb, do_compile) failed =
with exit code '1'
> >>   | /OE/jansa-test/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/c=
ompat-wireless-all/3.5-rc5-1-r0/compat-wireless-3.5-rc5-1/include/linux/com=
pat-3.5.h:76:8: error: redefinition of 'struct tc_fq_codel_qd_stats'
> >> ERROR: Task 18643 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile) failed with exit c=
ode '1'
> >>   | downloader-view.c:340:7: error: too many arguments to function 'no=
tify_notification_new'
> >> ERROR: Task 16595 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-devtools/python/python-pyudev_0.11.bb, do_compile) failed with exit =
code '1'
> >>   |   File "/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-g=
nueabi/python-pyudev/0.11-r3/pyudev-0.11/pyudev/_libudev.py", line 205, in =
load_udev_library
> >>   |     raise ImportError('No library named udev')
> >>   | ImportError: No library named udev
> >> ERROR: Task 16464 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-support/hddtemp/hddtemp_0.3-beta15.bb, do_patch) failed with exit co=
de '1'
> >>   ERROR: Command Error: exit status: 1  Output:
> >>   Applying patch hddtemp-db.patch
> >>   Ignoring potentially dangerous file name ../hddtemp.db
> >>   can't find file to patch at input line 7
> >> ERROR: Task 15665 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-core/f2fs-tools/f2fs-tools_1.1.0.bb, do_fetch) failed with exit code=
 '1'
> >>   ERROR: Fetcher failure: Fetch command failed with exit code 8, outpu=
t:
> >>   http://downloads.sourceforge.net/project/f2fs-tools/f2fs-tools-1.1.0=
=2Etar.gz:
> >>   2012-12-13 05:06:20 ERROR 404: Not Found.
> >> ERROR: Task 15569 (/OE/jansa-test/shr-core/meta-openembedded/meta-netw=
orking/recipes-support/netcat/netcat_0.7.1.bb, do_compile) failed with exit=
 code '1'
> >>   | intl.h:31:2: error: #error You must have locale.h in your system
> >> ERROR: Task 13181 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-graphics/fbida/fbida_2.08.bb, do_compile) failed with exit code '1'
> >>   | checking for libjpeg version ... <stdin>:1:21: fatal error: jpegli=
b.h: No such file or directory
> >>   | compilation terminated.
> >>   | # 1 "<stdin>"
> >>   | /bin/sh: stdin: No such file or directory
> >>   | make: *** No rule to make target `jpeg//transupp.o', needed by `ex=
iftran'.  Stop.
> >>   | make: *** Waiting for unfinished jobs....
> >>   |   CC    jpegtools.o
> >>   | jpegtools.c:36:59: fatal error: transupp.h: No such file or direct=
ory
> >>   | compilation terminated.
> >> ERROR: Task 10876 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnom=
e/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb, do_configure)=
 failed with exit code '1'
> >>   | configure.in:8: error: version mismatch.  This is Automake 1.12.5,
> >>   | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
> >>   | configure.in:8: comes from Automake 1.11.1.  You should recreate
> >>   | configure.in:8: aclocal.m4 with aclocal and run automake again.
> >> ERROR: Task 10317 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/r=
ecipes-support/syslog-ng/syslog-ng_3.2.5.bb, do_compile) failed with exit c=
ode '1'
> >>   | {standard input}:637: Error: bad instruction `rorw $8,'
> >>   | make[3]: *** [misc.lo] Error 1
> >> ERROR: Task 8769 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-multimedia/pulseaudio/pavucontrol_git.bb, do_compile) failed with exi=
t code '1'
> >>   | make[2]: *** No rule to make target `README', needed by `all-am'. =
 Stop.
> >>   | make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/wor=
k/armv5te-oe-linux-gnueabi/pavucontrol/0.9.10+git-r0/git/doc'
> >> ERROR: Task 7983 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/zenity/zenity_2.32.1.bb, do_compile) failed with exit code '=
1'
> >>   | notification.c:187: error: undefined reference to 'notify_notifica=
tion_new_with_status_icon'
> >>   | collect2: error: ld returned 1 exit status
> >> ERROR: Task 7852 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/nautilus/nautilus3_3.0.2.bb, do_patch) failed with exit code=
 '1'
> >>   Applying patch no-try-run-strftime.diff
> >>   patching file configure.in
> >>   Hunk #1 FAILED at 375.
> >>   1 out of 1 hunk FAILED -- rejects in file configure.in
> >> ERROR: Task 7712 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-extended/iotop/iotop_0.4.4.bb, do_install) failed with exit code '1'
> >>   patch on ML
> >>   | Writing /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-g=
nueabi/iotop/0.4.4-r0/image//usr/lib/python2.7/site-packages/iotop-0.4.4-py=
2.7.egg-info
> >>   | ERROR: Function failed: do_install (see /OE/jansa-test/shr-core/tm=
p-eglibc/work/armv5te-oe-linux-gnueabi/iotop/0.4.4-r0/temp/log.do_install.1=
8090 for further information)
> >> ERROR: Task 8067 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-devtools/glade/glade3_3.8.2.bb, do_compile) failed with exit code '1'
> >>   patch on ML
> >>   | http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1: pa=
rser error : Content error in the external subset
> >>   | HTTP/1.1 200 OK
> >> ERROR: Task 4056 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-support/fftw/benchfft_3.1.bb, do_configure) failed with exit code '1'
> >>   | benchees/goedecker/Makefile.am: error: Fortran source seen but 'FC=
' is undefined
> >>   | benchees/goedecker/Makefile.am:   The usual way to define 'FC' is =
to add 'AC_PROG_FC'
> >>   | benchees/goedecker/Makefile.am:   to 'configure.ac' and run 'autoc=
onf' again.
> >> ERROR: Task 2662 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/gnome/gnome-terminal_2.26.3.bb, do_compile) failed with exit=
 code '1'
> >>   | terminal-window.c: At top level:
> >>   | terminal-window.c:2522:34: error: unknown type name 'GtkNotebookPa=
ge'
> >> ERROR: Task 1591 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-devtools/libedit/libedit_20120601.bb, do_fetch) failed with exit code=
 '1'
> >>   ERROR: Fetcher failure: Fetch command failed with exit code 8, outpu=
t:
> >>   http://www.thrysoee.dk/editline/libedit-20120601-3.0.tar.gz:
> >>   2012-12-13 06:29:21 ERROR 406: Not Acceptable.
> >> ERROR: Task 372 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/=
recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile=
) failed with exit code '1'
> >>   | gpm-manager.c:488:3: error: too many arguments to function 'notify=
_notification_new'
> >>
> >> QA:
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libs=
wscale/usr/lib/libswscale.so.2.1.0' has relocations in .text
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libp=
ostproc/usr/lib/libpostproc.so.52.0.0' has relocations in .text
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/liba=
vutil/usr/lib/libavutil.so.51.22.1' has relocations in .text
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/liba=
vformat/usr/lib/libavformat.so.53.21.0' has relocations in .text
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/liba=
vfilter/usr/lib/libavfilter.so.2.15.0' has relocations in .text
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/liba=
vdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text
> >> libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary =
'/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8=
=2E3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/liba=
vcodec/usr/lib/libavcodec.so.53.35.0' has relocations in .text
> >> libpostproc-0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969: ELF b=
inary '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/lib=
postproc/0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969-r0/packages-sp=
lit/libpostproc/usr/lib/libpostproc.so.52.0.100' has relocations in .text
> >> tk-8.5.8: tk-lib: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages-=
split/tk-lib/usr/lib/libtk8.5.so.0 contains probably-redundant RPATH /usr/l=
ib
> >> tk-8.5.8: tk: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages-spli=
t/tk/usr/bin/wish8.5 contains probably-redundant RPATH /usr/lib
> >> php-5.3.19: php: Files/directories were installed but not shipped
> >>   reported on ML
> >>   /var
> >>   /OE
> >>   /etc/php-fpm.conf.default
> >>   /var/run
> >>   /var/log
> >>   /OE/jansa-test
> >>   /OE/jansa-test/shr-core
> >>   /OE/jansa-test/shr-core/tmp-eglibc
> >>   /OE/jansa-test/shr-core/tmp-eglibc/sysroots
> >> fakeroot-1.12.4: fakeroot: Files/directories were installed but not sh=
ipped
> >>   reported on ML
> >>   /usr/lib/libfakeroot
> >>   /usr/lib/libfakeroot/libfakeroot.a
> >>   /usr/lib/libfakeroot/libfakeroot.la
> >>   /usr/lib/libfakeroot/libfakeroot-0.so
> >>   /usr/lib/libfakeroot/libfakeroot.so
> >>   /usr/lib/libfakeroot/.debug
> >>   /usr/lib/libfakeroot/.debug/libfakeroot-0.so
> >>   /usr/lib/libfakeroot/.debug/libfakeroot.so
> >> gnome-control-center-2.32.1: non -staticdev package contains static .a=
 library: gnome-control-center-dev path '/work/armv5te-oe-linux-gnueabi/gno=
me-control-center/2.32.1-r0/packages-split/gnome-control-center-dev/usr/lib=
/window-manager-settings/libmetacity.a'
> >>   patch on ML
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2uzDqHpccQJpqF2n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDYACcACgkQN1Ujt2V2gBzZ5wCcD/TvbL7DSjLYzibLWmz7bXSr
lfkAnA1UKQgKcQMe0wEr7kTjjD3PJv7+
=LXJ3
-----END PGP SIGNATURE-----

--2uzDqHpccQJpqF2n--
