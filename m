Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UXvYJ-0004td-PK; Thu, 02 May 2013 17:36:20 +0200
Received: by mail-pa0-f44.google.com with SMTP id jh10so413100pab.31
	for <multiple recipients>; Thu, 02 May 2013 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VGVwTKGOyHyH4DPjGbykyGLsfG+EcCCgKEEk1PS07uE=;
	b=ALOd2rbMFqRCuLy6SfoEN1fzpW5Pck86yW5L41hTUoU6hMgecHGTbph/KUbsIjJQ5r
	awFUIKFqs/ctvslRW6AKjdC8QOdRycCGtAumQI9sC8JpaImVpsBXomstNSjEdCbUe44g
	FTlTUJZEWY76hGRsDWE6U19CdcnKuJjrw20nLSlPDD2U2Qp2U1dec5mqRU3zOju5lANF
	r8pGyoHFyqkbR7Jk0MkUx4UhG4rvIx4EKdURraMDkeylLoSW7lF4yAVeKS7ze+OgEGyw
	FMWtRn3AJrXBdFUSuRIg0eyBZvI7ApLGsa25XRKVEedJPijp0OvTQCElirxsq+JbvZVV
	EmfA==
X-Received: by 10.69.0.66 with SMTP id aw2mr6073443pbd.85.1367507897245;
	Thu, 02 May 2013 08:18:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	wi6sm7700006pbc.22.2013.05.02.08.18.13 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 02 May 2013 08:18:15 -0700 (PDT)
Date: Thu, 2 May 2013 17:18:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130502151833.GC3206@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama>
MIME-Version: 1.0
In-Reply-To: <20130427105400.GB3199@jama>
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
X-List-Received-Date: Thu, 02 May 2013 15:36:45 -0000
X-Groupsio-MsgNum: 38653
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2013 at 12:54:00PM +0200, Martin Jansa wrote:
> Updated status, but only change IIRC is fixed php, tbb,
> android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
> fix build on qemuarm again)
>=20
> qemuarm Summary: 19 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130426_185942.log/
> qemux86 Summary: 20 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130427_002532.log/
> qemux86-64 Summary: 22 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130427_044751.log/

Updated list, there were some nice fixes especially for gnome stuff, but th=
is time it was=20
built with gcc-4.8 and binutils-2.23.2 so we have a lot more issues,
most of them were already reported in
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037715.ht=
ml
so those are caused by gcc-4.8 not binutils-2.23.2

Be warned, logs are HUGE this time +- 600M
qemuarm Summary: 24 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30429_150137.log/
qemux86 Summary: 25 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30430_170512.log/
qemux86-64 Summary: 27 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30501_142102.log/

Common (18):
  virtual:native:meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbit2_2=
=2E14.17.bb, do_compile
  openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.=
bb, do_compile
  meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, do_comp=
ile
  meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb,=
 do_compile
  meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_package
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_git.=
bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb,=
 do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetoot=
h_2.32.0.bb, do_compile
  meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_compi=
le
  meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools=
_0.7.2.bb, do_compile
  meta-smartphone/meta-shr/recipes-shr/shr/phoneuid_git.bb, do_compile
  meta-smartphone/meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb, do_compi=
le
  meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libframewo=
rkd-glib_git.bb, do_compile

qemux86* common (6):
  openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
  meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2=
=2E0.2.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_compile
  meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_compile

qemuarm (6)
  openembedded-core/meta/recipes-support/gmp/gmp_5.1.0.bb, do_compile
  openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb, do_conf=
igure
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_comp=
ile
  openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
  meta-openembedded/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_=
compile

qemux86 (1)
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_comp=
ile

qemux86-64 (3)
  meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb, =
do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.=
32.1.bb, do_compile

> common from notify mismatch (6):
>   I'll send patch excluding libnotify3 and nautilus3 from world to hide t=
hem
>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26=
=2E0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb,=
 do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-=
settings-daemon_2.32.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb,=
 do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_=
compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-po=
wer-manager_2.32.0.bb, do_compile
>=20
> common (8):
>   I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to no=
nworking
>   and exclude compat-wireless-all, samsung-rfs-mgr from world + check aur=
ora-daemon (probably debugedit issue)
>=20
>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, =
do_compile
>   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireles=
s-all_3.6.8.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.b=
b, do_compile
>   meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb,=
 do_configure
>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pack=
age
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>   meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb,=
 do_package
>   meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mg=
r_git.bb, do_configure
>=20
> qemuarm (5):
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_co=
mpile
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_configure
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>=20
> qemux86* common (4):
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.3.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc=
_2.0.2.bb, do_configure
>=20
> qemux86 (2):
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_comp=
ile
>=20
> qemux86-64 (4):
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb=
, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_comp=
ile
>=20
> On Mon, Apr 15, 2013 at 04:12:53PM +0200, Martin Jansa wrote:
> > Hi,
> >=20
> > just reminder of pending build issues with distro-less qemuarm world bu=
ils,
> > unfortunately a lot of these recipes are still there since I started to=
 send
> > "world build status", so I will comment only on new or suspicious entri=
es.
> >=20
> > Complete log as always available at
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130415_033339.log/
> >=20
> > qemux86 and qemux86-64 still running (one build takes +- 24hours)
> >=20
> > # old entries:
> > meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb,=
 do_compile
> > meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26=
=2E0.bb, do_compile
> > meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, =
do_compile
> > meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc=
_2.0.2.bb, do_configure
> > openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_co=
mpile
> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireles=
s-all_3.6.8.bb, do_compile
> > meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb,=
 do_compile
> > meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_=
git.bb, do_configure
> > meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.b=
b, do_compile
> > meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_comp=
ile
> > meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb,=
 do_configure
> > openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
> > meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_=
compile
> > meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
> > meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1=
=2E5.0.bb, do_compile
> > meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-po=
wer-manager_2.32.0.bb, do_compile
> >=20
> > *gnome*: biggest part of this is caused by libnotify3/libnotify conflic=
ts and list of failing gnome
> > recipes always is different, depending which libnotify version was buil=
t/reused from sstate first :/
> >=20
> > *klibc*: also happen quite often missing limits.h
> >=20
> > meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compile
> >   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te=
-oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Interce=
pt.cpp: In constructor '{anonymous}::StatSymbols::StatSymbols()':
> >   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te=
-oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Interce=
pt.cpp:69:67: error: 'lseek64' was not declared in this scope
> >   from my pending patch, need to hunt this down before merging it or tr=
y if 2.8 suffers the same
> >=20
> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireles=
s-all_3.6.8.bb
> >   this is picky about used defconfig, not sure how to "blacklist" it wh=
en something is missing in defconfig
> >=20
> > meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.19.bb
> >   Applying patch phar-makefile.patch
> >   patching file ext/phar/Makefile.frag
> >   Hunk #1 FAILED at 6.
> >   1 out of 1 hunk FAILED -- rejects in file ext/phar/Makefile.frag
> >   probably reexecuting do_patch in same directory for some reason..
> >=20
> > meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb
> >   reported on pending review
> >=20
> > meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> >   reported on review, but then I've accidentally merged it (I had it bl=
acklisted as known broken,=20
> >   but then v2 came and I supposed it's fixed because it wasn't in list =
of failing :/)
> > meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_con=
figure
> >   node-waf: not found
> >   probably caused by my pending patch to upgrade nodejs to 0.10.4
> >=20
> > meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, =
do_configure
> >   fix on ML http://patchwork.openembedded.org/patch/48153/
> >=20
> > meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/and=
roid-audiosystem_bzr.bb, do_package
> >   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/s=
hr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/=
debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/=
armv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audi=
osystem/1.8+bzr43-r0/debugsources.list' '/home/jenkins/oe/shr-core-branches=
/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosystem/1.8+=
bzr43-r0/package/usr/lib/alsa-lib/libasound_module_pcm_android.so')
> >=20
> > meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb,=
 do_package
> >   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/s=
hr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/=
debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/=
armv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/aurora-daemo=
n/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a679ba71ddef0c4-r0.17/debugsourc=
es.list' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/aurora-daemon/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743=
a679ba71ddef0c4-r0.17/package/usr/lib/qt4/imports/Aurora/Components/libauro=
ra-components.so')
> >=20
> > meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mg=
r_git.bb, do_configure
> >   depends on samsung-ipc-1.0 >=3D 0.2', but we have that with negative =
D_P
> >=20
> > meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> >   pending review for Koen's patches, still need some improvements
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGCg8kACgkQN1Ujt2V2gBwVNQCgucr4EEKrRD0N2Ryrvy8jOThI
Xn4AoLCfWfzK72KCRgw9hDiv+8HtazeN
=fSy5
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
