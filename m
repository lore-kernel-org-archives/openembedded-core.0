Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id B99EE73899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 14:34:40 +0000 (UTC)
Received: by wesw62 with SMTP id w62so16807097wes.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=sWCYL+UJJ+DpFgO83bNfS4OY0oLyzL1KZN3dfdRMZ0s=;
	b=iGXfuFJ6AW4wEC9GOFu57RennMVxd2nQ4KA/IjZ3G3hvI6cBvGuWRhBLb6Uvvy1tnW
	5w6wMaHj/MEZYZckzca//72BiLQMGSufnhkLQ8CpZHdXI0aP6o9AEPQ9CmKIemFd3lbd
	CUP5T+BmtJvO7L/HVbn0dng32hEWs7okaloOHrWM39VLRyrSl9Hh8733iqOteDMwj8vA
	UAL/C0HLRN7XESVyUE1CcfsTvP9EZOed7SAwMBhv+81K3F/NVBuBIYOI4LP7AVHG+Vg7
	lGHhtqa8e3fqM0ok3YZvXBQcNhbRdw739yEWveNTXBTvcvweuuyB/Q6exRjAkPlRkOze
	u0gQ==
X-Received: by 10.180.97.106 with SMTP id dz10mr87341321wib.33.1426170881243; 
	Thu, 12 Mar 2015 07:34:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ka1sm10346947wjc.2.2015.03.12.07.34.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 07:34:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Mar 2015 15:35:21 +0100
To: OE-core <openembedded-core@lists.openembedded.org>,
	Tomas Frydrych <tomas@sleepfive.com>
Message-ID: <20150312143521.GD2338@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: meta-gir issues and maintenance
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
X-List-Received-Date: Thu, 12 Mar 2015 14:34:41 -0000
X-Groupsio-MsgNum: 63265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline

--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomas, all,

I was trying to use meta-gir in Dizzy release and found out that last
commit in this layer is 16 months ago and many .bbappends no longer
match with their recipes.

Was this layer superseded by something else or you just didn't have time
to update it for newer Yocto releases?

Even the base meta-gir layer have issue with g-ir-core recipe which is
currently failing with Dizzy release (it seems to be working fine with
Dylan):

$ cat /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/g-ir-core/1=
=2E34.2-r0/temp/log.do_compile.660
DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'comm=
on-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 9
[ -d gir ] || /bin/mkdir -p gir ; \
sed \
-e s,%CAIRO_SHARED_LIBRARY%,libcairo-gobject.so.2, \
-e s,%CAIRO_GIR_PACKAGE%,cairo-gobject, \
< /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/g-ir-core/1.34.=
2-r0/gobject-introspection-1.34.2/gir/cairo-1.0.gir.in > gir/cairo-1.0.gir.=
tmp && mv gir/cairo-1.0.gir.tmp gir/cairo-1.0.gir
make  all-recursive
make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/armv5te-oe-li=
nux-gnueabi/g-ir-core/1.34.2-r0/build'
Making all in .
make[2]: Entering directory '/OE/build/oe-core/tmp-glibc/work/armv5te-oe-li=
nux-gnueabi/g-ir-core/1.34.2-r0/build'
g-ir-scanner   --namespace=3DGLib --nsversion=3D2.0 --libtool=3D"./arm-oe-l=
inux-gnueabi-libtool" --pkg=3Dglib-2.0    --library=3Dglib-2.0 --library=3D=
gobject-2.0 --external-library --reparse-validate --identifier-prefix=3DG -=
-symbol-prefix=3Dg --symbol-prefix=3Dglib --c-include=3D"glib.h"  -I/OE/bui=
ld/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0 -I/OE/build/oe-=
core/tmp-glibc/sysroots/qemuarm//usr/lib/glib-2.0/include -DGETTEXT_PACKAGE=
=3DDummy -DGLIB_COMPILATION -D__G_I18N_LIB_H__  /OE/build/oe-core/tmp-glibc=
/sysroots/qemuarm//usr/lib/glib-2.0/include/glibconfig.h /OE/build/oe-core/=
tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/giochannel.h /OE/buil=
d/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gprintf.h /=
OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gtes=
tutils.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0=
/glib/gversion.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/=
glib-2.0/glib/genviron.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/=
include/glib-2.0/glib/gmacros.h /OE/build/oe-core/tmp-glibc/sysroots/qemuar=
m//usr/include/glib-2.0/glib/gprimes.h /OE/build/oe-core/tmp-glibc/sysroots=
/qemuarm//usr/include/glib-2.0/glib/ghook.h /OE/build/oe-core/tmp-glibc/sys=
roots/qemuarm//usr/include/glib-2.0/glib/gvariant.h /OE/build/oe-core/tmp-g=
libc/sysroots/qemuarm//usr/include/glib-2.0/glib/garray.h /OE/build/oe-core=
/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gmem.h /OE/build/oe-=
core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gmappedfile.h /O=
E/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gtras=
hstack.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0=
/glib/gerror.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/gl=
ib-2.0/glib/gnode.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/inclu=
de/glib-2.0/glib/gi18n-lib.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//=
usr/include/glib-2.0/glib/gkeyfile.h /OE/build/oe-core/tmp-glibc/sysroots/q=
emuarm//usr/include/glib-2.0/glib/gregex.h /OE/build/oe-core/tmp-glibc/sysr=
oots/qemuarm//usr/include/glib-2.0/glib/gsequence.h /OE/build/oe-core/tmp-g=
libc/sysroots/qemuarm//usr/include/glib-2.0/glib/ggettext.h /OE/build/oe-co=
re/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/goption.h /OE/buil=
d/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gstringchun=
k.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib=
/gstring.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2=
=2E0/glib/gscanner.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/incl=
ude/glib-2.0/glib/gdataset.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//=
usr/include/glib-2.0/glib/gpoll.h /OE/build/oe-core/tmp-glibc/sysroots/qemu=
arm//usr/include/glib-2.0/glib/gdatetime.h /OE/build/oe-core/tmp-glibc/sysr=
oots/qemuarm//usr/include/glib-2.0/glib/gbase64.h /OE/build/oe-core/tmp-gli=
bc/sysroots/qemuarm//usr/include/glib-2.0/glib/ghmac.h /OE/build/oe-core/tm=
p-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gurifuncs.h /OE/build/o=
e-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gslice.h /OE/b=
uild/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gquark.h=
 /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gm=
ain.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/gl=
ib/ghostutils.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/g=
lib-2.0/glib/gbytes.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/inc=
lude/glib-2.0/glib/gmessages.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm=
//usr/include/glib-2.0/glib/gi18n.h /OE/build/oe-core/tmp-glibc/sysroots/qe=
muarm//usr/include/glib-2.0/glib/gtimezone.h /OE/build/oe-core/tmp-glibc/sy=
sroots/qemuarm//usr/include/glib-2.0/glib/glist.h /OE/build/oe-core/tmp-gli=
bc/sysroots/qemuarm//usr/include/glib-2.0/glib/gqueue.h /OE/build/oe-core/t=
mp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gcharset.h /OE/build/o=
e-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gdate.h /OE/bu=
ild/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gchecksum=
=2Eh /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/gli=
b/galloca.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-=
2.0/glib/gwin32.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include=
/glib-2.0/glib/gbitlock.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr=
/include/glib-2.0/glib/gbookmarkfile.h /OE/build/oe-core/tmp-glibc/sysroots=
/qemuarm//usr/include/glib-2.0/glib/gshell.h /OE/build/oe-core/tmp-glibc/sy=
sroots/qemuarm//usr/include/glib-2.0/glib/gbacktrace.h /OE/build/oe-core/tm=
p-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gmarkup.h /OE/build/oe-=
core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gqsort.h /OE/bui=
ld/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gslist.h /=
OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gstr=
funcs.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/=
glib/gutils.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/gli=
b-2.0/glib/gconvert.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/inc=
lude/glib-2.0/glib/gpattern.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm/=
/usr/include/glib-2.0/glib/gthread.h /OE/build/oe-core/tmp-glibc/sysroots/q=
emuarm//usr/include/glib-2.0/glib/gstdio.h /OE/build/oe-core/tmp-glibc/sysr=
oots/qemuarm//usr/include/glib-2.0/glib/gatomic.h /OE/build/oe-core/tmp-gli=
bc/sysroots/qemuarm//usr/include/glib-2.0/glib/gtimer.h /OE/build/oe-core/t=
mp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/ghash.h /OE/build/oe-c=
ore/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gtree.h /OE/build=
/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gvarianttype=
=2Eh /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/gli=
b/gunicode.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib=
-2.0/glib/grand.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include=
/glib-2.0/glib/gdir.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/inc=
lude/glib-2.0/glib/gtypes.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//u=
sr/include/glib-2.0/glib/gfileutils.h /OE/build/oe-core/tmp-glibc/sysroots/=
qemuarm//usr/include/glib-2.0/glib/gthreadpool.h /OE/build/oe-core/tmp-glib=
c/sysroots/qemuarm//usr/include/glib-2.0/glib/gasyncqueue.h /OE/build/oe-co=
re/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gspawn.h /OE/build=
/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib/gversionmacr=
os.h /OE/build/oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/gob=
ject/glib-types.h /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/g-ir-core/1.34.2-r0/gobject-introspection-1.34.2/gir/glib-2.0.c /OE/build/=
oe-core/tmp-glibc/sysroots/qemuarm//usr/include/glib-2.0/glib-unix.h --outp=
ut GLib-2.0.gir
g-ir-compiler  --includedir=3D. /OE/build/oe-core/tmp-glibc/work/armv5te-oe=
-linux-gnueabi/g-ir-core/1.34.2-r0/gobject-introspection-1.34.2/gir/DBus-1.=
0.gir -o gir/DBus-1.0.typelib
g-ir-compiler  --includedir=3D. /OE/build/oe-core/tmp-glibc/work/armv5te-oe=
-linux-gnueabi/g-ir-core/1.34.2-r0/gobject-introspection-1.34.2/gir/fontcon=
fig-2.0.gir -o gir/fontconfig-2.0.typelib
make[2]: g-ir-compiler: Command not found
Makefile:1638: recipe for target 'gir/DBus-1.0.typelib' failed
make[2]: *** [gir/DBus-1.0.typelib] Error 127
make[2]: *** Waiting for unfinished jobs....
make[2]: g-ir-compiler: Command not found
Makefile:1638: recipe for target 'gir/fontconfig-2.0.typelib' failed
make[2]: *** [gir/fontconfig-2.0.typelib] Error 127
/bin/sh: g-ir-scanner: command not found
Makefile:1625: recipe for target 'GLib-2.0.gir' failed
make[2]: *** [GLib-2.0.gir] Error 127
make[2]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/armv5te-oe-lin=
ux-gnueabi/g-ir-core/1.34.2-r0/build'
Makefile:1113: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/armv5te-oe-lin=
ux-gnueabi/g-ir-core/1.34.2-r0/build'
Makefile:733: recipe for target 'all' failed
make: *** [all] Error 2
ERROR: oe_runmake failed
WARNING: /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/g-ir-cor=
e/1.34.2-r0/temp/run.do_compile.660:1 exit 1 from
  exit 1
ERROR: Function failed: do_compile (log file is located at /OE/build/oe-cor=
e/tmp-glibc/work/armv5te-oe-linux-gnueabi/g-ir-core/1.34.2-r0/temp/log.do_c=
ompile.660)

And if I fix PATH to find g-ir-compiler, then it fails somewhere else with:

g-ir-compiler  --includedir=3D. WORK/g-ir-core/1.34.2-r0.0/gobject-introspe=
ction-1.34.2/gir/xft-2.0.gir -o gir/xft-2.0.typelib
Could not find GIR file 'xlib-2.0.gir'; check XDG_DATA_DIRS or use --includ=
edir
error parsing file WORK/g-ir-core/1.34.2-r0.0/gobject-introspection-1.34.2/=
gir/xft-2.0.gir: Failed to parse included gir xlib-2.0
make[2]: *** [gir/xft-2.0.typelib] Error 1

Trailing .bbappends:
meta-gir/meta-gir-clutter/recipes-graphics/clutter-gtk/clutter-gtk-1.0_1.4.=
2.bbappend
meta-gir/meta-gir-clutter/recipes-graphics/clutter/clutter-1.0_1.14.4.bbapp=
end
meta-gir/meta-gir-clutter/recipes-graphics/cogl/cogl-1.0_1.14.0.bbappend
meta-gir/meta-gir-clutter/recipes-graphics/mutter/mutter_3.8.1.bbappend
meta-gir/meta-gir-clutter/recipes-graphics/mx/mx_2.0.bbappend
meta-gir/meta-gir-core/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bbappend
meta-gir/meta-gir-core/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.=
bbappend
meta-gir/meta-gir-core/recipes-gnome/gtk+/gtk+3_3.8.2.bbappend
meta-gir/meta-gir-core/recipes-gnome/gtk+/gtk+_2.24.20.bbappend
meta-gir/meta-gir-core/recipes-graphics/pango/pango_1.32.5.bbappend
meta-gir/meta-gir-core/recipes-support/atk/atk_2.10.0.bbappend
meta-gir/meta-gir-core/recipes-support/libsoup/libsoup-2.4_2.42.1.bbappend

Current versions:
openembedded-core/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
openembedded-core/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
openembedded-core/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.25.bb
openembedded-core/meta/recipes-graphics/pango/pango_1.36.8.bb
openembedded-core/meta/recipes-support/atk/atk_2.14.0.bb
openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb

mx bbappend is surprisingly newer than what is in oe-core and was probably =
meant for meta-guacamayo layer:
http://layers.openembedded.org/layerindex/recipe/3286/
there is also mx-2.0 recipe in meta-clutter:
http://layers.openembedded.org/layerindex/recipe/4952/

mutter is only in meta-clutter:
http://layers.openembedded.org/layerindex/recipe/4895/

gsettings-desktop-schemas were moved to meta-gnome, so it should be moved f=
rom meta-gir-core as well
meta-openembedded/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsetti=
ngs-desktop-schemas_3.14.1.bb

Are there any plans to update it?

Thanks,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUBpCgACgkQN1Ujt2V2gBzNqACfVgu0pWbZJmvhv02VuykAG0qJ
g8UAoKZ5+d9nSIm2DKI3bVpnrdNZnr0z
=oprH
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
