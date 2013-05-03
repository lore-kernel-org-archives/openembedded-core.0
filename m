Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UYAcJ-0002Us-7c; Fri, 03 May 2013 09:41:22 +0200
Received: by mail-ve0-f178.google.com with SMTP id jy13so1250045veb.37
	for <multiple recipients>; Fri, 03 May 2013 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=sIPDQvfRTqJ+M8+goXE7+by3mzC0u4idNRyG9UI3BeE=;
	b=f9zd/cZFpcd0KDrQ6vasmsf7hzRk64b1JqOvdzCXEgJ5pIvwoEFTHlhphn9ZKTYwsf
	fXv7ylVdwGOOOgdEY2bkgav2gK6XDabp7B4lSQCIyB6h70rnuXfxeyoPbO51oel0Z5SO
	EQM3GfCXmTbRdsB6SqF0KgpkAQcJzwVoF2OCAuXxmqw2AHIGI8lhsLlyJoF/VV0b4qzO
	m2kzD//+DAH9kt/FT8JbtxROtGMXmOi0vRtuQqeSUkVdBThcuNPxA1TEsOOMLUl9yxCN
	bsE9uts6ArTLWjfrKxkCNgSUKihfqjn/4LbI91LTGKC3cer589EDG/ZAM0VHhJu1ASJx
	GkvA==
MIME-Version: 1.0
X-Received: by 10.58.106.76 with SMTP id gs12mr576815veb.15.1367565803859;
	Fri, 03 May 2013 00:23:23 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Fri, 3 May 2013 00:23:23 -0700 (PDT)
In-Reply-To: <20130502151833.GC3206@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
Date: Fri, 3 May 2013 09:23:23 +0200
Message-ID: <CALbNGRSTFKUP2enN+7OKmAhTjkiFNUkuLRdbFP9B8Jo23=dyCA@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 May 2013 07:41:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Sat, Apr 27, 2013 at 12:54:00PM +0200, Martin Jansa wrote:
>> Updated status, but only change IIRC is fixed php, tbb,
>> android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
>> fix build on qemuarm again)
>>
>> qemuarm Summary: 19 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130426_185942.log/
>> qemux86 Summary: 20 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130427_002532.log/
>> qemux86-64 Summary: 22 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130427_044751.log/
>
> Updated list, there were some nice fixes especially for gnome stuff, but =
this time it was
> built with gcc-4.8 and binutils-2.23.2 so we have a lot more issues,
> most of them were already reported in
> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037715.=
html
> so those are caused by gcc-4.8 not binutils-2.23.2
>
> Be warned, logs are HUGE this time +- 600M
> qemuarm Summary: 24 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130429_150137.log/
> qemux86 Summary: 25 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130430_170512.log/
> qemux86-64 Summary: 27 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130501_142102.log/
>
> Common (18):
>   virtual:native:meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbit2=
_2.14.17.bb, do_compile
>   openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.=
0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, do_co=
mpile
>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb, =
do_compile
>   meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.b=
b, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pack=
age
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb, do_compi=
le
>   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_gi=
t.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.b=
b, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth_2.32.0.bb, do_compile
>   meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_com=
pile
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls_0.7.2.bb, do_compile
>   meta-smartphone/meta-shr/recipes-shr/shr/phoneuid_git.bb, do_compile
>   meta-smartphone/meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb, do_com=
pile
>   meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libframe=
workd-glib_git.bb, do_compile
>
> qemux86* common (6):
>   openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc=
_2.0.2.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_comp=
ile
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_comp=
ile
>
> qemuarm (6)
>   openembedded-core/meta/recipes-support/gmp/gmp_5.1.0.bb, do_compile
>   openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb, do_co=
nfigure
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_co=
mpile
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>   meta-openembedded/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile
>
> qemux86 (1)
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_co=
mpile
>
> qemux86-64 (3)
>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb=
, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_=
2.32.1.bb, do_compile
>
>> common from notify mismatch (6):
>>   I'll send patch excluding libnotify3 and nautilus3 from world to hide =
them
>>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.2=
6.0.bb, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb=
, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome=
-settings-daemon_2.32.1.bb, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb=
, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do=
_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-p=
ower-manager_2.32.0.bb, do_compile
>>
>> common (8):
>>   I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to n=
onworking
>>   and exclude compat-wireless-all, samsung-rfs-mgr from world + check au=
rora-daemon (probably debugedit issue)
>>
>>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb,=
 do_compile
>>   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirele=
ss-all_3.6.8.bb, do_compile
>>   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.=
bb, do_compile
>>   meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb=
, do_configure
>>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pac=
kage
>>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb=
, do_compile
>>   meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb=
, do_package
>>   meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-m=
gr_git.bb, do_configure
>>
>> qemuarm (5):
>>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, =
do_compile
>>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_c=
ompile
>>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6=
.bb, do_compile
>>   meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_configu=
re
>>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>>
>> qemux86* common (4):
>>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2=
.21.3.bb, do_compile
>>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_comp=
ile
>>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klib=
c_2.0.2.bb, do_configure
>>
>> qemux86 (2):
>>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geod=
e_2.11.14.bb, do_compile
>>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_com=
pile
>>
>> qemux86-64 (4):
>>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.b=
b, do_compile
>>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimo=
biledevice_1.1.4.bb, do_configure
>>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_com=
pile
>>
>> On Mon, Apr 15, 2013 at 04:12:53PM +0200, Martin Jansa wrote:
>> > Hi,
>> >
>> > just reminder of pending build issues with distro-less qemuarm world b=
uils,
>> > unfortunately a lot of these recipes are still there since I started t=
o send
>> > "world build status", so I will comment only on new or suspicious entr=
ies.
>> >
>> > Complete log as always available at
>> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.worl=
d.20130415_033339.log/
>> >
>> > qemux86 and qemux86-64 still running (one build takes +- 24hours)
>> >
>> > # old entries:
>> > meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb=
, do_compile
>> > meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.2=
6.0.bb, do_compile
>> > meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb,=
 do_compile
>> > meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klib=
c_2.0.2.bb, do_configure
>> > openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_c=
ompile
>> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirele=
ss-all_3.6.8.bb, do_compile
>> > meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb=
, do_compile
>> > meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc=
_git.bb, do_configure
>> > meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.=
bb, do_compile
>> > meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_com=
pile
>> > meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb=
, do_configure
>> > openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>> > meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do=
_compile
>> > meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb=
, do_compile
>> > meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_=
1.5.0.bb, do_compile
>> > meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-p=
ower-manager_2.32.0.bb, do_compile
>> >
>> > *gnome*: biggest part of this is caused by libnotify3/libnotify confli=
cts and list of failing gnome
>> > recipes always is different, depending which libnotify version was bui=
lt/reused from sstate first :/
>> >
>> > *klibc*: also happen quite often missing limits.h
>> >
>> > meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compile
>> >   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t=
e-oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Interc=
ept.cpp: In constructor '{anonymous}::StatSymbols::StatSymbols()':
>> >   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t=
e-oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Interc=
ept.cpp:69:67: error: 'lseek64' was not declared in this scope
>> >   from my pending patch, need to hunt this down before merging it or t=
ry if 2.8 suffers the same
>> >
>> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirele=
ss-all_3.6.8.bb
>> >   this is picky about used defconfig, not sure how to "blacklist" it w=
hen something is missing in defconfig
>> >
>> > meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.19.bb
>> >   Applying patch phar-makefile.patch
>> >   patching file ext/phar/Makefile.frag
>> >   Hunk #1 FAILED at 6.
>> >   1 out of 1 hunk FAILED -- rejects in file ext/phar/Makefile.frag
>> >   probably reexecuting do_patch in same directory for some reason..
>> >
>> > meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb
>> >   reported on pending review
>> >
>> > meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
>> >   reported on review, but then I've accidentally merged it (I had it b=
lacklisted as known broken,
>> >   but then v2 came and I supposed it's fixed because it wasn't in list=
 of failing :/)
>> > meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_co=
nfigure
>> >   node-waf: not found
>> >   probably caused by my pending patch to upgrade nodejs to 0.10.4
>> >
>> > meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb,=
 do_configure
>> >   fix on ML http://patchwork.openembedded.org/patch/48153/
>> >
>> > meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/an=
droid-audiosystem_bzr.bb, do_package
>> >   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/=
shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin=
/debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work=
/armv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-=
core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-aud=
iosystem/1.8+bzr43-r0/debugsources.list' '/home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosystem/1.8=
+bzr43-r0/package/usr/lib/alsa-lib/libasound_module_pcm_android.so')
>> >
>> > meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb=
, do_package
>> >   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/=
shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin=
/debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work=
/armv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-=
core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/aurora-daem=
on/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a679ba71ddef0c4-r0.17/debugsour=
ces.list' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv=
5te-oe-linux-gnueabi/aurora-daemon/0.1+gitrAUTOINC+b65354ad6c0e201eea855974=
3a679ba71ddef0c4-r0.17/package/usr/lib/qt4/imports/Aurora/Components/libaur=
ora-components.so')
>> >
>> > meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-m=
gr_git.bb, do_configure
>> >   depends on samsung-ipc-1.0 >=3D 0.2', but we have that with negative=
 D_P
>> >
>> > meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>> >   pending review for Koen's patches, still need some improvements
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>>
>>
I have the following here after following glib 2.36 update (only):

chromium
gvfs
geany

Hope to send out patches soon

Andreas


