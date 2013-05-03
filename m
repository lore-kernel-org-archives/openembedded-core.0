Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UYAdI-0002Zd-D7; Fri, 03 May 2013 09:42:24 +0200
Received: by mail-ve0-f181.google.com with SMTP id d10so1241805vea.40
	for <multiple recipients>; Fri, 03 May 2013 00:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=yg+wRjJJZxulRUXVEkbC5bx3t9GSV0PGTqPrMP45A0Y=;
	b=Y9qgC1AC7a2CWOf9EiLsafueasAo44jKQw8yhL5qgRmfU4jbhijXiyaioI/rOPP7mq
	XynC24uiQ1oTyFK/pmdvqzycuoeTyyZDLJldUJcdSlj14NKL4T1GpM0yLFVQa2uL6XtZ
	tCAd17UsGQHwL5L1EeDfRGEydfL3GiPl/MyE28VDz6djC9c8xA8LjRs5v5/+PtVO+Piw
	jbgXbPSqMBddRkGpRd6sWA+ofPhOmtF1sS9DU3YY/zplsWIhrpx1TKAVaQZXBP78ky7X
	UNqjVUAcmX0s9JewwyM+fnxa+acGwHGkUvjkG8l+IvfVGwktqufdu3rfXLXv0KBcu1Wx
	b2fg==
MIME-Version: 1.0
X-Received: by 10.58.232.98 with SMTP id tn2mr3208862vec.57.1367565865368;
	Fri, 03 May 2013 00:24:25 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Fri, 3 May 2013 00:24:25 -0700 (PDT)
In-Reply-To: <CALbNGRSTFKUP2enN+7OKmAhTjkiFNUkuLRdbFP9B8Jo23=dyCA@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<CALbNGRSTFKUP2enN+7OKmAhTjkiFNUkuLRdbFP9B8Jo23=dyCA@mail.gmail.com>
Date: Fri, 3 May 2013 09:24:25 +0200
Message-ID: <CALbNGRRz4wmLiO2GsY3iWJZW-wbh_ykdSUHd0g+e1bky+6UOoA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 03 May 2013 07:42:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2013 at 9:23 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, May 2, 2013 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>> On Sat, Apr 27, 2013 at 12:54:00PM +0200, Martin Jansa wrote:
>>> Updated status, but only change IIRC is fixed php, tbb,
>>> android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
>>> fix build on qemuarm again)
>>>
>>> qemuarm Summary: 19 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
.20130426_185942.log/
>>> qemux86 Summary: 20 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
.20130427_002532.log/
>>> qemux86-64 Summary: 22 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
.20130427_044751.log/
>>
>> Updated list, there were some nice fixes especially for gnome stuff, but=
 this time it was
>> built with gcc-4.8 and binutils-2.23.2 so we have a lot more issues,
>> most of them were already reported in
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037715=
.html
>> so those are caused by gcc-4.8 not binutils-2.23.2
>>
>> Be warned, logs are HUGE this time +- 600M
>> qemuarm Summary: 24 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130429_150137.log/
>> qemux86 Summary: 25 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130430_170512.log/
>> qemux86-64 Summary: 27 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130501_142102.log/
>>
>> Common (18):
>>   virtual:native:meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbit=
2_2.14.17.bb, do_compile
>>   openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14=
.0.bb, do_compile
>>   meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, do_c=
ompile
>>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_co=
mpile
>>   meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb,=
 do_compile
>>   meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.=
bb, do_compile
>>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_co=
mpile
>>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pac=
kage
>>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6=
.bb, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb, do_comp=
ile
>>   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_g=
it.bb, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.=
bb, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluet=
ooth_2.32.0.bb, do_compile
>>   meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_co=
mpile
>>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-to=
ols_0.7.2.bb, do_compile
>>   meta-smartphone/meta-shr/recipes-shr/shr/phoneuid_git.bb, do_compile
>>   meta-smartphone/meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb, do_co=
mpile
>>   meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libfram=
eworkd-glib_git.bb, do_compile
>>
>> qemux86* common (6):
>>   openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
>>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klib=
c_2.0.2.bb, do_compile
>>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_comp=
ile
>>   meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_com=
pile
>>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_com=
pile
>>
>> qemuarm (6)
>>   openembedded-core/meta/recipes-support/gmp/gmp_5.1.0.bb, do_compile
>>   openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb, do_c=
onfigure
>>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_c=
ompile
>>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>>   meta-openembedded/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb, do_compil=
e
>>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, =
do_compile
>>
>> qemux86 (1)
>>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_c=
ompile
>>
>> qemux86-64 (3)
>>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.b=
b, do_compile
>>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimo=
biledevice_1.1.4.bb, do_configure
>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session=
_2.32.1.bb, do_compile
>>
>>> common from notify mismatch (6):
>>>   I'll send patch excluding libnotify3 and nautilus3 from world to hide=
 them
>>>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
26.0.bb, do_compile
>>>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.b=
b, do_compile
>>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnom=
e-settings-daemon_2.32.1.bb, do_compile
>>>   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.b=
b, do_compile
>>>   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, d=
o_compile
>>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_compile
>>>
>>> common (8):
>>>   I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to =
nonworking
>>>   and exclude compat-wireless-all, samsung-rfs-mgr from world + check a=
urora-daemon (probably debugedit issue)
>>>
>>>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
>>>   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirel=
ess-all_3.6.8.bb, do_compile
>>>   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0=
.bb, do_compile
>>>   meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.b=
b, do_configure
>>>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pa=
ckage
>>>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
>>>   meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.b=
b, do_package
>>>   meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-=
mgr_git.bb, do_configure
>>>
>>> qemuarm (5):
>>>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb,=
 do_compile
>>>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_=
compile
>>>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.=
6.bb, do_compile
>>>   meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_config=
ure
>>>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compil=
e
>>>
>>> qemux86* common (4):
>>>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configur=
e
>>>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_=
2.21.3.bb, do_compile
>>>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
>>>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb, do_configure
>>>
>>> qemux86 (2):
>>>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.14.bb, do_compile
>>>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_co=
mpile
>>>
>>> qemux86-64 (4):
>>>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compil=
e
>>>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.=
bb, do_compile
>>>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
>>>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_co=
mpile
>>>
>>> On Mon, Apr 15, 2013 at 04:12:53PM +0200, Martin Jansa wrote:
>>> > Hi,
>>> >
>>> > just reminder of pending build issues with distro-less qemuarm world =
buils,
>>> > unfortunately a lot of these recipes are still there since I started =
to send
>>> > "world build status", so I will comment only on new or suspicious ent=
ries.
>>> >
>>> > Complete log as always available at
>>> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130415_033339.log/
>>> >
>>> > qemux86 and qemux86-64 still running (one build takes +- 24hours)
>>> >
>>> > # old entries:
>>> > meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.b=
b, do_compile
>>> > meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
26.0.bb, do_compile
>>> > meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
>>> > meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb, do_configure
>>> > openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_=
compile
>>> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirel=
ess-all_3.6.8.bb, do_compile
>>> > meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.b=
b, do_compile
>>> > meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klib=
c_git.bb, do_configure
>>> > meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0=
.bb, do_compile
>>> > meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_co=
mpile
>>> > meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.b=
b, do_configure
>>> > openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compil=
e
>>> > meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, d=
o_compile
>>> > meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
>>> > meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.0.bb, do_compile
>>> > meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_compile
>>> >
>>> > *gnome*: biggest part of this is caused by libnotify3/libnotify confl=
icts and list of failing gnome
>>> > recipes always is different, depending which libnotify version was bu=
ilt/reused from sstate first :/
>>> >
>>> > *klibc*: also happen quite often missing limits.h
>>> >
>>> > meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compil=
e
>>> >   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Inter=
cept.cpp: In constructor '{anonymous}::StatSymbols::StatSymbols()':
>>> >   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Inter=
cept.cpp:69:67: error: 'lseek64' was not declared in this scope
>>> >   from my pending patch, need to hunt this down before merging it or =
try if 2.8 suffers the same
>>> >
>>> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirel=
ess-all_3.6.8.bb
>>> >   this is picky about used defconfig, not sure how to "blacklist" it =
when something is missing in defconfig
>>> >
>>> > meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.19.bb
>>> >   Applying patch phar-makefile.patch
>>> >   patching file ext/phar/Makefile.frag
>>> >   Hunk #1 FAILED at 6.
>>> >   1 out of 1 hunk FAILED -- rejects in file ext/phar/Makefile.frag
>>> >   probably reexecuting do_patch in same directory for some reason..
>>> >
>>> > meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb
>>> >   reported on pending review
>>> >
>>> > meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
>>> >   reported on review, but then I've accidentally merged it (I had it =
blacklisted as known broken,
>>> >   but then v2 came and I supposed it's fixed because it wasn't in lis=
t of failing :/)
>>> > meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
onfigure
>>> >   node-waf: not found
>>> >   probably caused by my pending patch to upgrade nodejs to 0.10.4
>>> >
>>> > meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb=
, do_configure
>>> >   fix on ML http://patchwork.openembedded.org/patch/48153/
>>> >
>>> > meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/a=
ndroid-audiosystem_bzr.bb, do_package
>>> >   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe=
/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bi=
n/debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/wor=
k/armv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-au=
diosystem/1.8+bzr43-r0/debugsources.list' '/home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosystem/1.=
8+bzr43-r0/package/usr/lib/alsa-lib/libasound_module_pcm_android.so')
>>> >
>>> > meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.b=
b, do_package
>>> >   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe=
/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bi=
n/debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/wor=
k/armv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/aurora-dae=
mon/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a679ba71ddef0c4-r0.17/debugsou=
rces.list' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/arm=
v5te-oe-linux-gnueabi/aurora-daemon/0.1+gitrAUTOINC+b65354ad6c0e201eea85597=
43a679ba71ddef0c4-r0.17/package/usr/lib/qt4/imports/Aurora/Components/libau=
rora-components.so')
>>> >
>>> > meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-=
mgr_git.bb, do_configure
>>> >   depends on samsung-ipc-1.0 >=3D 0.2', but we have that with negativ=
e D_P
>>> >
>>> > meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b
>>> >   pending review for Koen's patches, still need some improvements
>>> > --
>>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>>
>>>
> I have the following here after following glib 2.36 update (only):
>
> chromium
> gvfs
> geany
Forgot orbit2
>
> Hope to send out patches soon
>
> Andreas


