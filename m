Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TjETr-0002GM-3B; Thu, 13 Dec 2012 20:30:08 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1605218pbc.6
	for <multiple recipients>; Thu, 13 Dec 2012 11:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=65UITWY7oMO54UOWizis5HKxjhNIUPXmvIOQH+ccf/M=;
	b=S3etiMsniqDj3MkZt3HdUpzV1KBFEbKdRX6iAAVXrb/QZa4IDbSYZJBUxuvm+34cx2
	1dyZDycMqWIeRfiYrn/FqjcW/jUJVmnn//xl5+Mp6sp0qI19T3oYMFA1F1vI5YNlLLje
	cTHmsxJAEsK0sx0hTfcvcNlrJZ7OiEBPvEoDyVOmT1G6sMegkcFsNmTrnalQbymU40n7
	ZKCZC9q1SRsYyWvRsLjzmj5aqoStWmJWT+KNTgBdZmXCIr4TRh+gIISjCbe/J+adNgAk
	Clf6T45qry7t9dCvLP2YsjqWz1PRptPM3ICcx2oRHoHHWbd4F8id68vbaqgV39/ec3T/
	TAMg==
Received: by 10.68.219.164 with SMTP id pp4mr8291657pbc.72.1355426122701;
	Thu, 13 Dec 2012 11:15:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gu5sm1475061pbc.10.2012.12.13.11.15.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 11:15:21 -0800 (PST)
Date: Thu, 13 Dec 2012 20:15:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121213191534.GH3356@jama.jama.net>
References: <20121213174202.GE3356@jama.jama.net>
	<50CA2522.4060708@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <50CA2522.4060708@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 13 Dec 2012 19:30:08 -0000
X-Groupsio-MsgNum: 32646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YrlhzR9YrZtruaFS"
Content-Disposition: inline

--YrlhzR9YrZtruaFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 10:57:38AM -0800, Saul Wold wrote:
> On 12/13/2012 09:42 AM, Martin Jansa wrote:
> > Hi,
> >
> > I've sent a lot of small fixes to get world builds usable (to be able to
> > spot when there is more issues then usual).
> >
>=20
> Thank you for looking into this, we do run world build, but clearly we=20
> need to expand the arch list!
>=20
> > Now I'm down to ~ 43 recipes failing (+ maybe something what depends on
> > them)
> >
> > and 5 recipes with QA warnings (recorded in qa.log - e.g. deprecated use
> > of u-a.bbclass is not recorded there).
> >
> > Attaching list so that people which find some recipe they care about can
> > step up and fix that..
> >
> > failures and qa issues from bitbake world with qemuarm.
> >
> > oe-core has Revert "ICU: add pkgconfig support" to build webkit-gtk and=
 webkit-efl
> > all layers have some more fixes which I'm going to send soon
> >
> Someone is looking into updating the ICU package to the new version,=20
> which will help out as it removes some patches, but there is still and=20
> issue with autotools that is being investigated, this should be fixed=20
> shortly or it will be reverted.
>=20
> > included layers:
> > meta-shr
> > meta-aurora
> > meta-fso
> > meta-android      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf56843=
0c9"
> > meta-oe
> > meta-efl
> > meta-gnome
> > meta-gpe
> > meta-multimedia
> > meta-networking
> > meta-systemd      =3D "jansa/test:f6b59111bd40fad927cbde23e239231b4e07e=
a20"
> > meta-osmocombb
> > meta-nokia
> > meta-htc
> > meta-palm
> > meta-openmoko
> > meta-samsung      =3D "jansa/test:df65a76943df086b3002f2e6f0512dbf56843=
0c9"
> > meta-browser      =3D "jansa/test:1231ef3d166231c0426174077da64282db264=
5a6"
> > meta              =3D "jansa/test:6721eda317f98c673d1ac30362e4d454ab843=
586"
> >
> > $ cat world.log.qemuarm7.list | grep openembedded-core
> > ERROR: Task 13533 (/OE/jansa-test/shr-core/openembedded-core/meta/recip=
es-graphics/clutter/cogl_1.8.2.bb, do_compile) failed with exit code '1'
> >    | {standard input}:542: Error: selected processor does not support T=
humb mode `clz r3,r0'
> > ERROR: Task 2074 (/OE/jansa-test/shr-core/openembedded-core/meta/recipe=
s-extended/sat-solver/sat-solver_git.bb, do_compile) failed with exit code =
'1'
> >    | /tmp/cc7QsEPB.s: Assembler messages:
> >    | /tmp/cc7QsEPB.s:1542: Error: invalid offset, value too big (0x0000=
0400)
> >    | make[2]: *** [src/CMakeFiles/satsolver.dir/sha2.o] Error 1
> > ERROR: Task 20335 (virtual:native:/OE/jansa-test/shr-core/openembedded-=
core/meta/recipes-extended/ghostscript/ghostscript_9.05.bb, do_compile) fai=
led with exit code '1'
> >    patch on ML
> >    | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/l=
ibfontconfig.so: undefined reference to `FT_Get_Sfnt_Name'
> >    | collect2: error: ld returned 1 exit status
> >    | make: *** [obj/aux/mkromfs_0] Error 1
> > ERROR: Task 3453 (/OE/jansa-test/shr-core/openembedded-core/meta/recipe=
s-qt/qt-apps/qmmp_0.6.1.bb, do_compile) failed with exit code '1'
> >    | In file included from decoder_mpc.cpp:28:0:
> >    | decoder_mpc.h:27:24: fatal error: mpc/mpcdec.h: No such file or di=
rectory
> >    | compilation terminated.
> >    or
> >    | Project ERROR: Package wavpack not found
> > ERROR: Task 7843 (/OE/jansa-test/shr-core/openembedded-core/meta/recipe=
s-graphics/xorg-driver/xf86-video-omap_git.bb, do_compile) failed with exit=
 code '1'
> >    | omap_driver.h:54:18: fatal error: dri2.h: No such file or directory
> >    incompatible with DISTRO_FEATURES without opengl
> > ERROR: Task 6463 (/OE/jansa-test/shr-core/openembedded-core/meta/recipe=
s-multimedia/gstreamer/gst-openmax_0.10.1.bb, do_compile) failed with exit =
code '1'
> >    reported on ML
> >    | gstomx_base_filter.c:846:3: error: 'g_mutex_new' is deprecated (de=
clared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/g=
lib-2.0/glib/deprecated/gthread.h:271) [-Werror=3Ddeprecated-declarations]
> >    | cc1: all warnings being treated as errors
> >
> Can you please file bugs if you and if you are actively working them=20
> please mark yourself as assignee.

I think, I've spent anough time on this already (I got 150+ failures
before my last pull requests) and I need to do something else now. So
this list is for other people to fix stuff they care about.

Also there is a lot of stuff where I was fixing build time issues but
never used them in runtime.. (all those world fixes were from stuff
outside my images and feeds).

Cheers,
=20
>=20
> Thanks
> 	Sau!
>=20
>=20
> > $ cat world.log.qemuarm7.list | grep meta-openembedded
> > ERROR: Task 11018 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-connectivity/uhd/uhd_git.bb, do_configure) failed with exit code '1'
> >    | CMake Error at cmake/Modules/UHDPython.cmake:54 (MESSAGE):
> >    |   Error: Python interpretor required by the build system.
> > ERROR: Task 8798 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-qt/qwt/qwt-e_6.0.1.bb, do_compile) failed with exit code '1'
> >    this is OK, qwt-6.0.1 was built before
> >    | Project ERROR: local build will conflict with /OE/jansa-test/shr-c=
ore/tmp-eglibc/sysroots/qemuarm/usr/lib/libqwt.*
> > ERROR: Task 468 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/reci=
pes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb, do_fetch) failed wit=
h exit code '1'
> >    WARNING: Failed to fetch URL ftp://ftp.nluug.nl/pub/gnu/libmicrohttp=
d//libmicrohttpd-0.4.6.tar.gz, attempting MIRRORS if available
> >    ERROR: Fetcher failure: Fetch command failed with exit code 8, outpu=
t:
> >    No such file 'libmicrohttpd-0.4.6.tar.gz'.
> > ERROR: Task 104 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome/libgnomecups_0.2.3.bb, do_compile) failed with exit code=
 '1'
> >    | In file included from gnome-cups-init.h:4:0,
> >    |                  from gnome-cups-request.h:6,
> >    |                  from gnome-cups-util.c:7:
> >    | /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gl=
ib-2.0/glib/gtypes.h:28:2: error: #error "Only <glib.h> can be included dir=
ectly."
> > ERROR: Task 5224 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile) failed with exit code=
 '1'
> >    | graphicwindow.h:62:23: error: 'class QwtPlotZoomer' has no member =
named 'setSelectionFlags'
> >    | graphicwindow.h:62:42: error: 'DragSelection' is not a member of '=
QwtPicker'
> >
> > ERROR: Task 19052 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-connectivity/networkmanager/modemmanager_0.5.bb, do_compile) failed w=
ith exit code '1'
> >    patch on ML to upgrade it fixes this
> >    | mm-serial-port.c:1293:9: error: 'g_value_get_char' is deprecated (=
declared at /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include=
/glib-2.0/gobject/gvaluetypes.h:184): Use 'g_value_get_schar' instead [-Wer=
ror=3Ddeprecated-declarations]
> > ERROR: Task 18812 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-kernel/compat-wireless/compat-wireless-all_0.bb, do_compile) failed w=
ith exit code '1'
> >    | /OE/jansa-test/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/c=
ompat-wireless-all/3.5-rc5-1-r0/compat-wireless-3.5-rc5-1/include/linux/com=
pat-3.5.h:76:8: error: redefinition of 'struct tc_fq_codel_qd_stats'
> > ERROR: Task 18643 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile) failed with exit co=
de '1'
> >    | downloader-view.c:340:7: error: too many arguments to function 'no=
tify_notification_new'
> > ERROR: Task 16595 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-devtools/python/python-pyudev_0.11.bb, do_compile) failed with exit c=
ode '1'
> >    |   File "/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-g=
nueabi/python-pyudev/0.11-r3/pyudev-0.11/pyudev/_libudev.py", line 205, in =
load_udev_library
> >    |     raise ImportError('No library named udev')
> >    | ImportError: No library named udev
> > ERROR: Task 16464 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-support/hddtemp/hddtemp_0.3-beta15.bb, do_patch) failed with exit cod=
e '1'
> >    ERROR: Command Error: exit status: 1  Output:
> >    Applying patch hddtemp-db.patch
> >    Ignoring potentially dangerous file name ../hddtemp.db
> >    can't find file to patch at input line 7
> > ERROR: Task 15665 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-core/f2fs-tools/f2fs-tools_1.1.0.bb, do_fetch) failed with exit code =
'1'
> >    ERROR: Fetcher failure: Fetch command failed with exit code 8, outpu=
t:
> >    http://downloads.sourceforge.net/project/f2fs-tools/f2fs-tools-1.1.0=
=2Etar.gz:
> >    2012-12-13 05:06:20 ERROR 404: Not Found.
> > ERROR: Task 15569 (/OE/jansa-test/shr-core/meta-openembedded/meta-netwo=
rking/recipes-support/netcat/netcat_0.7.1.bb, do_compile) failed with exit =
code '1'
> >    | intl.h:31:2: error: #error You must have locale.h in your system
> > ERROR: Task 13181 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-graphics/fbida/fbida_2.08.bb, do_compile) failed with exit code '1'
> >    | checking for libjpeg version ... <stdin>:1:21: fatal error: jpegli=
b.h: No such file or directory
> >    | compilation terminated.
> >    | # 1 "<stdin>"
> >    | /bin/sh: stdin: No such file or directory
> >    | make: *** No rule to make target `jpeg//transupp.o', needed by `ex=
iftran'.  Stop.
> >    | make: *** Waiting for unfinished jobs....
> >    |   CC    jpegtools.o
> >    | jpegtools.c:36:59: fatal error: transupp.h: No such file or direct=
ory
> >    | compilation terminated.
> > ERROR: Task 10876 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome=
/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb, do_configure) =
failed with exit code '1'
> >    | configure.in:8: error: version mismatch.  This is Automake 1.12.5,
> >    | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
> >    | configure.in:8: comes from Automake 1.11.1.  You should recreate
> >    | configure.in:8: aclocal.m4 with aclocal and run automake again.
> > ERROR: Task 10317 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/re=
cipes-support/syslog-ng/syslog-ng_3.2.5.bb, do_compile) failed with exit co=
de '1'
> >    | {standard input}:637: Error: bad instruction `rorw $8,'
> >    | make[3]: *** [misc.lo] Error 1
> > ERROR: Task 8769 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-multimedia/pulseaudio/pavucontrol_git.bb, do_compile) failed with exit=
 code '1'
> >    | make[2]: *** No rule to make target `README', needed by `all-am'. =
 Stop.
> >    | make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/wor=
k/armv5te-oe-linux-gnueabi/pavucontrol/0.9.10+git-r0/git/doc'
> > ERROR: Task 7983 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/=
recipes-gnome/zenity/zenity_2.32.1.bb, do_compile) failed with exit code '1'
> >    | notification.c:187: error: undefined reference to 'notify_notifica=
tion_new_with_status_icon'
> >    | collect2: error: ld returned 1 exit status
> > ERROR: Task 7852 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/=
recipes-gnome/nautilus/nautilus3_3.0.2.bb, do_patch) failed with exit code =
'1'
> >    Applying patch no-try-run-strftime.diff
> >    patching file configure.in
> >    Hunk #1 FAILED at 375.
> >    1 out of 1 hunk FAILED -- rejects in file configure.in
> > ERROR: Task 7712 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-extended/iotop/iotop_0.4.4.bb, do_install) failed with exit code '1'
> >    patch on ML
> >    | Writing /OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-g=
nueabi/iotop/0.4.4-r0/image//usr/lib/python2.7/site-packages/iotop-0.4.4-py=
2.7.egg-info
> >    | ERROR: Function failed: do_install (see /OE/jansa-test/shr-core/tm=
p-eglibc/work/armv5te-oe-linux-gnueabi/iotop/0.4.4-r0/temp/log.do_install.1=
8090 for further information)
> > ERROR: Task 8067 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-devtools/glade/glade3_3.8.2.bb, do_compile) failed with exit code '1'
> >    patch on ML
> >    | http://www.oasis-open.org/docbook/xml/4.1.2/ent/iso-grk1.ent:1: pa=
rser error : Content error in the external subset
> >    | HTTP/1.1 200 OK
> > ERROR: Task 4056 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-support/fftw/benchfft_3.1.bb, do_configure) failed with exit code '1'
> >    | benchees/goedecker/Makefile.am: error: Fortran source seen but 'FC=
' is undefined
> >    | benchees/goedecker/Makefile.am:   The usual way to define 'FC' is =
to add 'AC_PROG_FC'
> >    | benchees/goedecker/Makefile.am:   to 'configure.ac' and run 'autoc=
onf' again.
> > ERROR: Task 2662 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/=
recipes-gnome/gnome/gnome-terminal_2.26.3.bb, do_compile) failed with exit =
code '1'
> >    | terminal-window.c: At top level:
> >    | terminal-window.c:2522:34: error: unknown type name 'GtkNotebookPa=
ge'
> > ERROR: Task 1591 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/rec=
ipes-devtools/libedit/libedit_20120601.bb, do_fetch) failed with exit code =
'1'
> >    ERROR: Fetcher failure: Fetch command failed with exit code 8, outpu=
t:
> >    http://www.thrysoee.dk/editline/libedit-20120601-3.0.tar.gz:
> >    2012-12-13 06:29:21 ERROR 406: Not Acceptable.
> > ERROR: Task 372 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile)=
 failed with exit code '1'
> >    | gpm-manager.c:488:3: error: too many arguments to function 'notify=
_notification_new'
> >
> > QA:
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libswsc=
ale/usr/lib/libswscale.so.2.1.0' has relocations in .text
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libpost=
proc/usr/lib/libpostproc.so.52.0.0' has relocations in .text
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libavut=
il/usr/lib/libavutil.so.51.22.1' has relocations in .text
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libavfo=
rmat/usr/lib/libavformat.so.53.21.0' has relocations in .text
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libavfi=
lter/usr/lib/libavfilter.so.2.15.0' has relocations in .text
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libavde=
vice/usr/lib/libavdevice.so.53.2.0' has relocations in .text
> > libav-0.8.3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b: ELF binary '=
/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.=
3+git1+2fb4be9a99a2c2a9435339830e3d940171cc0d9b-r6.0/packages-split/libavco=
dec/usr/lib/libavcodec.so.53.35.0' has relocations in .text
> > libpostproc-0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969: ELF bi=
nary '/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libp=
ostproc/0.0.0+git1+3b7053f46dbfe4662063345245cb00b6acbbe969-r0/packages-spl=
it/libpostproc/usr/lib/libpostproc.so.52.0.100' has relocations in .text
> > tk-8.5.8: tk-lib: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages-s=
plit/tk-lib/usr/lib/libtk8.5.so.0 contains probably-redundant RPATH /usr/lib
> > tk-8.5.8: tk: /work/armv5te-oe-linux-gnueabi/tk/8.5.8-r0/packages-split=
/tk/usr/bin/wish8.5 contains probably-redundant RPATH /usr/lib
> > php-5.3.19: php: Files/directories were installed but not shipped
> >    reported on ML
> >    /var
> >    /OE
> >    /etc/php-fpm.conf.default
> >    /var/run
> >    /var/log
> >    /OE/jansa-test
> >    /OE/jansa-test/shr-core
> >    /OE/jansa-test/shr-core/tmp-eglibc
> >    /OE/jansa-test/shr-core/tmp-eglibc/sysroots
> > fakeroot-1.12.4: fakeroot: Files/directories were installed but not shi=
pped
> >    reported on ML
> >    /usr/lib/libfakeroot
> >    /usr/lib/libfakeroot/libfakeroot.a
> >    /usr/lib/libfakeroot/libfakeroot.la
> >    /usr/lib/libfakeroot/libfakeroot-0.so
> >    /usr/lib/libfakeroot/libfakeroot.so
> >    /usr/lib/libfakeroot/.debug
> >    /usr/lib/libfakeroot/.debug/libfakeroot-0.so
> >    /usr/lib/libfakeroot/.debug/libfakeroot.so
> > gnome-control-center-2.32.1: non -staticdev package contains static .a =
library: gnome-control-center-dev path '/work/armv5te-oe-linux-gnueabi/gnom=
e-control-center/2.32.1-r0/packages-split/gnome-control-center-dev/usr/lib/=
window-manager-settings/libmetacity.a'
> >    patch on ML
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YrlhzR9YrZtruaFS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDKKVYACgkQN1Ujt2V2gBw8TgCdFv0BmvHp5EbATuN3422J0SvB
4g4Anj55f1fZIyeIL1faDWGfER5BMDl/
=72Xf
-----END PGP SIGNATURE-----

--YrlhzR9YrZtruaFS--
