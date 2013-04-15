Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1URkQC-00010l-W3; Mon, 15 Apr 2013 16:30:20 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so2196407eaj.8
	for <multiple recipients>; Mon, 15 Apr 2013 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B+rh/v8mxku+K/tQ05d9Bl7yxpUfFPY+su4q94hAvZY=;
	b=js81zVyr2Kw6+5+7JzebrNnVQ0dM2yROez9QnKld4j4BzDigy+6n3MvSSNmYMTklzf
	aN5mOAXGdF11XJW+B9sq+j30idWww19MI66RRNJ67HC+qx6zRwCYuiJW6pjX0BN8RcDF
	Q4eSkVJnLSMbqu+MQdKp0v/3zmgr7wGq5S7RtOnX1L+uRMH//T5ajsXC3Dad2fb1SGQS
	icL4FJwNdSvVVpSLFgLxsxt0BEp2fVuDsOmoXpU7W0n7kzMZmsh/yAPDZnYVLRqoXUvA
	DLq3JWNMgtSskmBqrkCcft2ex19kskv86+8vKg/kjLXjywivE+Tyj3dKGKioulsTlDs2
	Qo9A==
X-Received: by 10.15.75.70 with SMTP id k46mr17004263eey.4.1366035168097;
	Mon, 15 Apr 2013 07:12:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a2sm25613527eem.11.2013.04.15.07.12.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 07:12:47 -0700 (PDT)
Date: Mon, 15 Apr 2013 16:12:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130415141253.GC10628@jama.dyndns-home.com>
References: <20121213174202.GE3356@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121213174202.GE3356@jama.jama.net>
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
X-List-Received-Date: Mon, 15 Apr 2013 14:30:43 -0000
X-Groupsio-MsgNum: 37951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline

--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

just reminder of pending build issues with distro-less qemuarm world buils,
unfortunately a lot of these recipes are still there since I started to send
"world build status", so I will comment only on new or suspicious entries.

Complete log as always available at
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30415_033339.log/

qemux86 and qemux86-64 still running (one build takes +- 24hours)

# old entries:
meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb, do_=
compile
meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.b=
b, do_compile
meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do_c=
ompile
meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0=
=2E2.bb, do_configure
openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_compile
meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-al=
l_3.6.8.bb, do_compile
meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_=
compile
meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.=
bb, do_configure
meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb, d=
o_compile
meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_compile
meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb, do_=
configure
openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_comp=
ile
meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_=
compile
meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0=
=2Ebb, do_compile
meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-=
manager_2.32.0.bb, do_compile

*gnome*: biggest part of this is caused by libnotify3/libnotify conflicts a=
nd list of failing gnome
recipes always is different, depending which libnotify version was built/re=
used from sstate first :/

*klibc*: also happen quite often missing limits.h

meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compile
  | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Intercept.c=
pp: In constructor '{anonymous}::StatSymbols::StatSymbols()':
  | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Intercept.c=
pp:69:67: error: 'lseek64' was not declared in this scope
  from my pending patch, need to hunt this down before merging it or try if=
 2.8 suffers the same

meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-al=
l_3.6.8.bb
  this is picky about used defconfig, not sure how to "blacklist" it when s=
omething is missing in defconfig

meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.19.bb
  Applying patch phar-makefile.patch
  patching file ext/phar/Makefile.frag
  Hunk #1 FAILED at 6.
  1 out of 1 hunk FAILED -- rejects in file ext/phar/Makefile.frag
  probably reexecuting do_patch in same directory for some reason..

meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb
  reported on pending review

meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
  reported on review, but then I've accidentally merged it (I had it blackl=
isted as known broken,=20
  but then v2 came and I supposed it's fixed because it wasn't in list of f=
ailing :/)
meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_configu=
re
  node-waf: not found
  probably caused by my pending patch to upgrade nodejs to 0.10.4

meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do_c=
onfigure
  fix on ML http://patchwork.openembedded.org/patch/48153/

meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/android=
-audiosystem_bzr.bb, do_package
  ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/debu=
gedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv=
5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosys=
tem/1.8+bzr43-r0/debugsources.list' '/home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosystem/1.8+bzr4=
3-r0/package/usr/lib/alsa-lib/libasound_module_pcm_android.so')

meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb, do_=
package
  ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/debu=
gedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv=
5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/aurora-daemon/0.=
1+gitrAUTOINC+b65354ad6c0e201eea8559743a679ba71ddef0c4-r0.17/debugsources.l=
ist' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/aurora-daemon/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a679=
ba71ddef0c4-r0.17/package/usr/lib/qt4/imports/Aurora/Components/libaurora-c=
omponents.so')

meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mgr_gi=
t.bb, do_configure
  depends on samsung-ipc-1.0 >=3D 0.2', but we have that with negative D_P

meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
  pending review for Koen's patches, still need some improvements
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFsCuUACgkQN1Ujt2V2gBxkbwCfWbgautOaAt87eQYRwDRlRxRa
t9IAn3SQIYJpOXZr+9v58zoXtTptP9r/
=ew1Y
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
