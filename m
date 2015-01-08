Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD4F72498;
	Thu,  8 Jan 2015 17:19:56 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q59so3674913wes.8;
	Thu, 08 Jan 2015 09:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wlJD7hdgc18jNcgAskwbHjkFS9jqhAVgYRrARuizWvE=;
	b=FiOYg9XeQueM3BvOcdsyfZ4xD62Mm2decjS1s16gBS2FzqMVKENd79dS7GTUX1igjs
	g6yo8XqkVxIasSMmmbfbkFoqq/IasFD+F8SlcXETpjYtLmDQq03F7E7CrF5H3+FyvJBK
	9JoYP99zLz8ItfRKVhXy/lgSRdggLtHzEO3sB5xS6XE5YNDE8w2M1p0WDGMd8fWt9Bcf
	mu+oGTWfAwkb9wHlwAC3wN5safLW7qm6vuebHKslX0cV/tvK+wV79ZekEW1fZNWLU4DC
	CPwsnTUkTNfJN0+su/3gKehNzons/zWjGOOojVdW8fqVaQw9aAA0491TCGzDbLEyHHDS
	5T4A==
X-Received: by 10.194.58.37 with SMTP id n5mr22148544wjq.14.1420737593715;
	Thu, 08 Jan 2015 09:19:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	et4sm6924013wjd.15.2015.01.08.09.19.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 09:19:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 18:19:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150108171955.GJ3972@jama>
References: <20150108115722.GG3972@jama>
 <20150108170537.GA8907@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20150108170537.GA8907@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-01-08
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
X-List-Received-Date: Thu, 08 Jan 2015 17:20:00 -0000
X-Groupsio-MsgNum: 61181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlxN1C6awaFNesUv"
Content-Disposition: inline

--UlxN1C6awaFNesUv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 12:05:42PM -0500, Joe MacDonald wrote:
> [[oe] State of bitbake world, Failed tasks 2015-01-08] On 15.01.08 (Thu 1=
2:57) Martin Jansa wrote:
>=20
> > I've reverted font-util change from oe-core to resolve all font-* recip=
es failing, see
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/=
100461.html
> >=20
> > Just as reminder this is using openembedded-core-contrib/jansa/master w=
ith these changes
> > which weren't merged to master yet:
> > pick 9fadeaf qemux86: Add identical qemux86copy variant for tests
> > pick 7d2d6ce WIP: Add KERNEL_EXTRA_ARGS?
> > pick 57be53f libsdl: Add support for libsdl-native
> > pick c283292 report-error: Allow to upload reports automatically
> > pick 655252d DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variab=
le
> > pick c7db4d0 gdb: force arm mode
> > pick a683970 icu: force arm mode
> > pick 66870ff gst-ffmpeg: add dependency on libpostproc
> > pick 131dd6d libav: drop unused FFMPEG_LIBS and move libpostproc only t=
o 0.8.11
> > pick ac92b08 xorg-app: add x11 to required DISTRO_FEATURES and cleanup =
dependencies
> > pick 78b33cc recipes: add x11 to required DISTRO_FEATURES
> > pick 890a3dc xorg-driver: add x11 to required DISTRO_FEATURES
> > pick 9bf0e73 recipes-qt: add x11 to required DISTRO_FEATURES
> > pick 4d7299c resolvconf: Drop allarch
> > pick 6db992d usbinit, weston-init, run-postinsts, qt-demo-init: Drop al=
larch
> > pick d41ccc2 ppp-dialin: Drop allarch
> > pick 2e00590 linux-firmware: Drop allarch
> > pick f273cb7 initramfs-framework: Drop allarch
> > pick 347487f libav: drop older 0.8.* and use libav-9 by default
> > pick 0dc2e98 libpostproc: import from meta-oe
> > pick a17e622 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
> > pick 7818a65 Revert "font-util: Fix incorrect PKG_CONFIG_PATH"
> >=20
> > I'm going to exclude qt5-opengles2-test from world, because it requires=
 gles2
> > to be enabled.
> > I'll blacklist xfce4-vala, because it's broken for long time.
> > I'll drop pending change for openwsman.
>=20
> I didn't get a chance to see the failure in openwsman v2 and I didn't
> notice the follow-up on the list, what was the failure?  Or did v2 not
> correct all of the issues in v1?

The links to logs are in the "=3D=3D=3D Number of failed tasks (13) =3D=3D=
=3D"
section of the e-mail

 ../libwsman.so.1.0.0: error: undefined reference to 'floor'

http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150107_141406.l=
og//bitbake.log
or
http://errors.yoctoproject.org/Errors/Search/Details/7107/1/10/3939

and similar links for other architectures

> I'll update the patch status in patchworks if you haven't already.

I did for no-bundle and master-next/meta-qt5 bundles, but please check
meta-networking bundle (patches included in jenkins builds are usually
included in both meta-networking and master-next bundles)

> > There is pending patch for libutempter (needs few more changes)
> > perf is failing since last kernel changes, I've pinged Bruce to look.
> >=20
> > So hopefully next time we'll get better status.
> >=20
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >=20
> > =3D=3D Failed tasks 2015-01-07 =3D=3D
> >=20
> > INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/log.report.20150108_115117.log
> >=20
> > =3D=3D=3D common (4) =3D=3D=3D
> >     * /meta-openembedded/meta-networking/recipes-protocols/openwsman/op=
enwsman_2.4.12.bb, do_compile
> >     * /meta-openembedded/meta-oe/recipes-support/libutempter/libutempte=
r_1.1.6.bb, do_compile
> >     * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.1=
0.3.bb, do_configure
> >     * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_compi=
le
> >=20
> > =3D=3D=3D common-x86 (0) =3D=3D=3D
> >=20
> > =3D=3D=3D qemuarm (0) =3D=3D=3D
> >=20
> > =3D=3D=3D qemux86 (0) =3D=3D=3D
> >=20
> > =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> >     * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile
> >=20
> > =3D=3D=3D Number of failed tasks (13) =3D=3D=3D
> > {| class=3Dwikitable
> > |-
> > || qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150107_141406.log// || http://errors.yoctoproject.org:80/Errors/S=
earch/1/3939/
> > |-
> > || qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150107_152738.log// || http://errors.yoctoproject.org:80/Errors/S=
earch/1/3944/
> > |-
> > || qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/=
/log.world.20150107_164049.log// || http://errors.yoctoproject.org:80/Error=
s/Search/1/3947/
> > |}
> >=20
> > =3D=3D=3D PNBLACKLISTs (50) =3D=3D=3D
> >=20
> > =3D=3D=3D QA issues (48) =3D=3D=3D
> > {| class=3Dwikitable
> > !| Count		||Issue
> > |-
> > ||0	||already-stripped
> > |-
> > ||0	||build-deps
> > |-
> > ||0	||file-rdeps
> > |-
> > ||0	||libdir
> > |-
> > ||0	||textrel
> > |-
> > ||48	||version-going-backwards
> > |}
> >=20
> >=20
> > PNBLACKLISTs:
> > openembedded-core/:
> > meta-browser:
> > meta-openembedded:
> > meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[i=
fuse] ?=3D "depends on blacklisted libimobiledevice"
> > meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIS=
T[gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> > meta-gnome/recipes-connectivity/network-manager-applet/network-manager-=
applet_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?=3D "Depends on bro=
ken polkit-gnome"
> > meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLI=
CT: 4 files conflict with gnome-keyring"
> > meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depen=
ds on broken polkit-gnome"
> > meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBL=
ACKLIST[gnome-bluetooth] ?=3D "dbus-binding-tool fails with: Unable to load=
 gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid=
 D-Bus interface name"
> > meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST=
[gnome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> > meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[=
gnome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with =
libgweather"
> > meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[lib=
gweather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> > meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> > meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] =
?=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> > meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACK=
LIST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-conf=
ig was removed, error: unknown type name 'SDL_Overlay'"
> > meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.b=
b:PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3D=
S (trying to install rendererconsole.py from ${B} instead of ${S})"
> > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNB=
LACKLIST[lksctp-tools] ?=3D "BROKEN: fails to link against sctp_connectx sy=
mbol"
> > meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb=
:PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross co=
mpiling"
> > meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> > meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[z=
eroc-ice] ?=3D "BROKEN: not compatible with default db version"
> > meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polki=
t-gnome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024=
 exceeded, use -L<N> to change it"
> > meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsu=
rface] ?=3D "Needs to be upgraded for compatibility with new libdivecompute=
r"
> > meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutt=
er-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> > meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROK=
EN: doesn't build with B!=3DS (flex: can't open lex.lex)"
> > meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST=
[xf86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without=
 ${S} in sed call)"
> > meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2=
] ?=3D "Requires newer libav which has negative D_P"
> > meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fil=
e or directory"
> > meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
> > meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]=
 ?=3D "BROKEN: Doesn't work with B!=3DS"
> > meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
> > meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qe=
mu: uncaught target signal 11 (Segmentation fault) - core dumped"
> > meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[mali=
it-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incor=
rectly inherits autotools"
> > meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit=
-plugins] ?=3D "BROKEN: depends on broken maliit-framework"
> > meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=
=3D "Fails to build with system boost"
> > meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmo=
tif] ?=3D "BROKEN: doesn't build with B!=3DS"
> > meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[=
vala-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch =
`src/.stamp': No such file or directory"
> > meta-qt5:
> > meta-smartphone:
> > meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D=
 "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rd=
epends on blacklisted mplayer2"
> > meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompas=
s] =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-webos-ports:
> > conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> > conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc fr=
om meta-virtualiazation which isn't included in my world builds"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn=
't really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn'=
t really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn'=
t really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn'=
t really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn=
't really need to be tested so much"
> > conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> > conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> > conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to buil=
d"
> > conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> > conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> > QA issues by type:
> > count: 0	issue: already-stripped
> >=20
> >=20
> > count: 0	issue: libdir
> >=20
> >=20
> > count: 0	issue: textrel
> >=20
> >=20
> > count: 0	issue: build-deps
> >=20
> >=20
> > count: 0	issue: file-rdeps
> >=20
> >=20
> > count: 48	issue: version-going-backwards
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f=
1-r0.17) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f=
1-r0.18) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-dbg went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.17) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-dbg went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.18) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-dev went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.17) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-dev went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.18) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-doc went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.17) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-doc went backwards which would break =
package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155=
bd3f1-r0.18) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-locale went backwards which would bre=
ak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79=
155bd3f1-r0.17) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-locale went backwards which would bre=
ak package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79=
155bd3f1-r0.18) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-staticdev went backwards which would =
break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0=
+79155bd3f1-r0.17) [version-going-backwards]
> > luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version=
 for package luna-sysmgr-ipc-messages-staticdev went backwards which would =
break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0=
+79155bd3f1-r0.18) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime went backwards which would break package feeds from (0:1.0-=
r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-dbg went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-dbg went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-dev went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-dev went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-doc went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-doc went backwards which would break package feeds from (0:=
1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-locale went backwards which would break package feeds from =
(0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-locale went backwards which would break package feeds from =
(0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-staticdev went backwards which would break package feeds fr=
om (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-datetime-1.0: Package version for package polkit-grou=
p-rule-datetime-staticdev went backwards which would break package feeds fr=
om (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network went backwards which would break package feeds from (0:1.0-r0=
=2E125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network went backwards which would break package feeds from (0:1.0-r0=
=2E125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-dbg went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-dbg went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-dev went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-dev went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-doc went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-doc went backwards which would break package feeds from (0:1.=
0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-locale went backwards which would break package feeds from (0=
:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-locale went backwards which would break package feeds from (0=
:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-staticdev went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
> > polkit-group-rule-network-1.0: Package version for package polkit-group=
-rule-network-staticdev went backwards which would break package feeds from=
 (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common went ba=
ckwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.10=
4) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common went ba=
ckwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.10=
5) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-dbg wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.104) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-dbg wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.105) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-dev wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.104) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-dev wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.105) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-doc wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.104) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-doc wen=
t backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r=
8.105) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-locale =
went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.3=
4-r8.104) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-locale =
went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.3=
4-r8.105) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-staticd=
ev went backwards which would break package feeds from (0:1.34-r8.106 to 0:=
1.34-r8.104) [version-going-backwards]
> > xserver-common-1.34: Package version for package xserver-common-staticd=
ev went backwards which would break package feeds from (0:1.34-r8.106 to 0:=
1.34-r8.105) [version-going-backwards]
>=20
>=20
>=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlxN1C6awaFNesUv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSuvDsACgkQN1Ujt2V2gBxeFgCgtLTcqSCrfSKjheNEvKkDPYwF
fYAAnRM1G/Y6rHePeCysxyYuKpmGH9b1
=XuW9
-----END PGP SIGNATURE-----

--UlxN1C6awaFNesUv--
