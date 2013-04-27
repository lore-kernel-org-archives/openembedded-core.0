Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UW32X-0005K9-KI; Sat, 27 Apr 2013 13:11:43 +0200
Received: by mail-pb0-f48.google.com with SMTP id wy7so373665pbc.7
	for <multiple recipients>; Sat, 27 Apr 2013 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qzGsu0K6Wfuj8ojXQ7PCKBOcqgAOldceZSUE6YZyUu4=;
	b=C7aG1t05ufH4q12XibOQDenOJDGmLly+m1HAeJulQ2TPGbjqevsh1q3gK3cqkUOkNZ
	Ml+nPMol2/esVY/24q01CFsQHYd+MGarG0uiPurEKodzSQ2fkaIohaFBb/V2WUbGFdaZ
	MAF6sMQbdJlPNpdrQBWbwDswBRNS4Z46B3w9rmYitObaDUd9Ov3leLeibtUiO+qf/9WH
	+e3H18CE19ckmU8qyQ54f3wAJFAq+hWFJHcb8fg1z1QudRyBlDJ+yX/6x9FVXZAeBMvR
	uGi/2bz234mx7rwqu65UMWu3WxvARgBWxgVMjr/eOy/pgQ17BMPmW4fmqMjU7J0lys+Q
	R4MA==
X-Received: by 10.68.228.134 with SMTP id si6mr63572917pbc.24.1367060030555;
	Sat, 27 Apr 2013 03:53:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ya4sm15491218pbb.24.2013.04.27.03.53.47 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 03:53:49 -0700 (PDT)
Date: Sat, 27 Apr 2013 12:54:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130427105400.GB3199@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130415141253.GC10628@jama.dyndns-home.com>
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
X-List-Received-Date: Sat, 27 Apr 2013 11:11:47 -0000
X-Groupsio-MsgNum: 38486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Updated status, but only change IIRC is fixed php, tbb,
android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
fix build on qemuarm again)

qemuarm Summary: 19 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30426_185942.log/
qemux86 Summary: 20 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30427_002532.log/
qemux86-64 Summary: 22 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30427_044751.log/

common from notify mismatch (6):
  I'll send patch excluding libnotify3 and nautilus3 from world to hide them
  meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0=
=2Ebb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb, d=
o_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-se=
ttings-daemon_2.32.1.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, d=
o_compile
  meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_co=
mpile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-powe=
r-manager_2.32.0.bb, do_compile

common (8):
  I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to nonw=
orking
  and exclude compat-wireless-all, samsung-rfs-mgr from world + check auror=
a-daemon (probably debugedit issue)

  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-=
all_3.6.8.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb,=
 do_compile
  meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb, d=
o_configure
  meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_package
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile
  meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb, d=
o_package
  meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mgr_=
git.bb, do_configure

qemuarm (5):
  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_=
compile
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_comp=
ile
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_configure
  openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile

qemux86* common (4):
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E3.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2=
=2E0.2.bb, do_configure

qemux86 (2):
  meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2=
=2E11.14.bb, do_compile
  meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_compile

qemux86-64 (4):
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb, =
do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_compile

On Mon, Apr 15, 2013 at 04:12:53PM +0200, Martin Jansa wrote:
> Hi,
>=20
> just reminder of pending build issues with distro-less qemuarm world buil=
s,
> unfortunately a lot of these recipes are still there since I started to s=
end
> "world build status", so I will comment only on new or suspicious entries.
>=20
> Complete log as always available at
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130415_033339.log/
>=20
> qemux86 and qemux86-64 still running (one build takes +- 24hours)
>=20
> # old entries:
> meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb, d=
o_compile
> meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0=
=2Ebb, do_compile
> meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
> meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2=
=2E0.2.bb, do_configure
> openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_comp=
ile
> meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-=
all_3.6.8.bb, do_compile
> meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, d=
o_compile
> meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_gi=
t.bb, do_configure
> meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb,=
 do_compile
> meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_compile
> meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb, d=
o_configure
> openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
> meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_co=
mpile
> meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile
> meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5=
=2E0.bb, do_compile
> meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-powe=
r-manager_2.32.0.bb, do_compile
>=20
> *gnome*: biggest part of this is caused by libnotify3/libnotify conflicts=
 and list of failing gnome
> recipes always is different, depending which libnotify version was built/=
reused from sstate first :/
>=20
> *klibc*: also happen quite often missing limits.h
>=20
> meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compile
>   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Intercept=
=2Ecpp: In constructor '{anonymous}::StatSymbols::StatSymbols()':
>   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Intercept=
=2Ecpp:69:67: error: 'lseek64' was not declared in this scope
>   from my pending patch, need to hunt this down before merging it or try =
if 2.8 suffers the same
>=20
> meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-=
all_3.6.8.bb
>   this is picky about used defconfig, not sure how to "blacklist" it when=
 something is missing in defconfig
>=20
> meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.19.bb
>   Applying patch phar-makefile.patch
>   patching file ext/phar/Makefile.frag
>   Hunk #1 FAILED at 6.
>   1 out of 1 hunk FAILED -- rejects in file ext/phar/Makefile.frag
>   probably reexecuting do_patch in same directory for some reason..
>=20
> meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb
>   reported on pending review
>=20
> meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
>   reported on review, but then I've accidentally merged it (I had it blac=
klisted as known broken,=20
>   but then v2 came and I supposed it's fixed because it wasn't in list of=
 failing :/)
> meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_confi=
gure
>   node-waf: not found
>   probably caused by my pending patch to upgrade nodejs to 0.10.4
>=20
> meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do=
_configure
>   fix on ML http://patchwork.openembedded.org/patch/48153/
>=20
> meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/andro=
id-audiosystem_bzr.bb, do_package
>   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/de=
bugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar=
mv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audios=
ystem/1.8+bzr43-r0/debugsources.list' '/home/jenkins/oe/shr-core-branches/s=
hr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosystem/1.8+bz=
r43-r0/package/usr/lib/alsa-lib/libasound_module_pcm_android.so')
>=20
> meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb, d=
o_package
>   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/de=
bugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar=
mv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/aurora-daemon/=
0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a679ba71ddef0c4-r0.17/debugsources=
=2Elist' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/aurora-daemon/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743=
a679ba71ddef0c4-r0.17/package/usr/lib/qt4/imports/Aurora/Components/libauro=
ra-components.so')
>=20
> meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mgr_=
git.bb, do_configure
>   depends on samsung-ipc-1.0 >=3D 0.2', but we have that with negative D_P
>=20
> meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>   pending review for Koen's patches, still need some improvements
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF7rkgACgkQN1Ujt2V2gBwx2QCfZAkvTgK6qm9+JJBc9YpGjvLl
pgEAoJNfJ2nywSfCzqsJAX8PZ+UNozit
=32A4
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
