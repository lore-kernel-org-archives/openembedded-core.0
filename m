Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEE1E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 17:50:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.203.1771437010607697082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 09:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AycjYAGE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C83D84E402B3
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:50:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E7C75FA23;
	Wed, 18 Feb 2026 17:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AD6F10368097;
	Wed, 18 Feb 2026 18:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771437008; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ti44klcNw6PQNOMVkdLzWZjLe3V5zBEQdjgHHjtw0Nk=;
	b=AycjYAGEjBtLTT3QJiH9SzcSF5tOvJPf/sG/WXqDhyEt3inHJ0J9pL2edK3CNjP1+iztH4
	kebWsbR3jEmZp+VVgi8jnZu/GHRhpsCY0odQz2eTmOQYkAVl9785fjOCCvKoqt9gIwbEcF
	l/pusbFHQOVnEtkCp1Z8Fp8noPG75m1FVaDlZ3BTgUZUvYIr1wO0c0UgPf/bjhRcf1bcFU
	WBdf3nJ0Q4aUB6R+rtYb46CLjr5cCj+lNUwidct5FqjH/i61/NHBiy5bdZ9rtNUZ/Ys8Wh
	DHgv5aGM3eeR5osOJ+u+flrkDtVNr1RVl/ofTkYWs3h3nur1yjzFIX793oJAdg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 18:50:03 +0100
Message-Id: <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1771409846.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1771409846.git.liezhi.yang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231314

On Wed Feb 18, 2026 at 1:22 PM CET, Robert Yang via lists.openembedded.org =
wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> * V6
>   - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>
> * V5
>   - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>   - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencie=
s
>     between /bin/sh and libc.so.=20
>
> * V4
>   - Fix loop dependencies issues for libc6 and busybox
>   - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>
> * V3
>   - Fix Alexender's comments
>     a) Suppot rpm 6
>     b) Move rpm-setup-autosign to rpm-build
>     c) Remove -DLIBELF_FOUND=3DFalse
>
>   - Fix build for nativesdk-rpm
>
>   - Drop patch for createrepo-c since it has been upgraded (rev:
>     804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>
> * V1 & V2
>   - Initial version
>
> // Robert
>
> The following changes since commit 2c20c05b324e5d6564c8554381019170839509=
bb:
>
>   pseudo: Update to include an openat2 fix (2026-02-13 12:25:37 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/robertlinux/yocto rbt/rpm
>   https://github.com/robertlinux/yocto/tree/rbt/rpm
>
> for you to fetch changes up to 907fd664240474a2183fc4bf7bfa35f98c53c3d4:
>
>   rpm: 4.20.1 -> 6.0.1 (2026-02-18 10:02:04 +0000)
>
> ----------------------------------------------------------------
>
> Robert Yang (7):

Hi Robert,

Thanks for the new version.

I believe we still have some issue:

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf. Comman=
d '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-p=
oky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmver=
bosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/genericx86/build/build/tmp/=
work/genericx86-poky-linux/core-image-sato/1.0/sdk/image/usr/local/oe-sdk-h=
ardcoded-buildpath/sysroots/core2-32-poky-linux/etc/dnf/dnf.conf --setopt=
=3Dreposdir=3D/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/g=
enericx86-poky-linux/core-image-sato/1.0/sdk/image/usr/local/oe-sdk-hardcod=
ed-buildpath/sysroots/core2-32-poky-linux/etc/yum.repos.d --installroot=3D/=
srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-poky-=
linux/core-image-sato/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/sy=
sroots/core2-32-poky-linux --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker/=
genericx86/build/build/tmp/work/genericx86-poky-linux/core-image-sato/1.0/t=
emp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/genericx86/build/b=
uild/tmp/work/genericx86-poky-linux/core-image-sato/1.0/oe-sdk-repo --setop=
t=3Dinstall_weak_deps=3DFalse --nogpgcheck install acl-dbg acl-dev acl-src =
acpid-dbg acpid-dev acpid-src adwaita-icon-theme-dbg adwaita-icon-theme-dev=
 alsa-plugins-dbg alsa-plugins-dev alsa-plugins-src alsa-state-dbg alsa-sta=
te-dev alsa-utils-dbg alsa-utils-dev alsa-utils-src at-spi2-core-dbg at-spi=
2-core-dev at-spi2-core-src attr-dbg attr-dev attr-src avahi-dbg avahi-dev =
avahi-libnss-mdns-dbg avahi-libnss-mdns-dev avahi-libnss-mdns-src avahi-src=
 base-files-dbg base-files-dev base-passwd-dbg base-passwd-dev base-passwd-=
src bluez5-dbg bluez5-dev bluez5-src busybox-dbg busybox-dev busybox-src bz=
ip2-dbg bzip2-dev bzip2-src ca-certificates-dbg ca-certificates-dev connman=
-dbg connman-dev connman-gnome-dbg connman-gnome-dev connman-gnome-src conn=
man-src consolekit-dbg consolekit-dev consolekit-src curl-dbg curl-dev curl=
-src dbus-dbg dbus-dev dbus-src dbus-wait-dbg dbus-wait-dev dbus-wait-src d=
ebugedit-dbg debugedit-dev debugedit-src desktop-file-utils-dbg desktop-fil=
e-utils-dev desktop-file-utils-src dnf-dbg dnf-dev dropbear-dbg dropbear-de=
v dropbear-src e2fsprogs-dbg e2fsprogs-dev e2fsprogs-src elfutils-dbg elfut=
ils-dev elfutils-src eudev-dbg eudev-dev eudev-src file-dbg file-dev file-s=
rc flac-dbg flac-dev flac-src formfactor-dbg formfactor-dev gcc-runtime-dbg=
 gcc-runtime-src gconf-dbg gconf-dev gconf-src glib-networking-dbg glib-net=
working-dev glib-networking-src glibc-locale-dbg gnupg-dbg gnupg-dev gnupg-=
src go-dev go-runtime-dbg gpgme-dbg gpgme-dev gpgme-src grub-bootconf-dbg g=
rub-bootconf-dev grub-dbg grub-dev grub-efi-dbg grub-efi-dev grub-efi-src g=
rub-src gst-examples-dbg gst-examples-dev gst-examples-src gstreamer1.0-dbg=
 gstreamer1.0-dev gstreamer1.0-plugins-bad-dbg gstreamer1.0-plugins-bad-dev=
 gstreamer1.0-plugins-bad-src gstreamer1.0-plugins-base-dbg gstreamer1.0-pl=
ugins-base-dev gstreamer1.0-plugins-base-src gstreamer1.0-plugins-good-dbg =
gstreamer1.0-plugins-good-dev gstreamer1.0-plugins-good-src gstreamer1.0-sr=
c gtk+3-dbg gtk+3-dev gtk+3-src hdparm-dbg hdparm-dev hdparm-src hicolor-ic=
on-theme-dbg hicolor-icon-theme-dev icu-dbg icu-dev icu-src init-ifupdown-d=
bg init-ifupdown-dev init-system-helpers-dbg init-system-helpers-dev initsc=
ripts-dbg initscripts-dev iptables-dbg iptables-dev iptables-src iw-dbg iw-=
dev iw-src kbd-dbg kbd-dev kbd-src kernel-dbg kernel-dev keymaps-dbg keymap=
s-dev kmod-dbg kmod-dev kmod-src l3afpad-dbg l3afpad-dev l3afpad-src lame-d=
bg lame-src libacpi-dbg libacpi-dev libacpi-src libarchive-dbg libarchive-d=
ev libarchive-src libasound-dbg libasound-dev libasound-src libassuan-dbg l=
ibassuan-dev libassuan-src libc6-src libcairo-dbg libcairo-dev libcairo-src=
 libcap-dbg libcap-dev libcap-src libcomps-dbg libcomps-dev libcomps-src li=
bcrypt-dbg libcrypt-dev libcrypt-src libdaemon-dbg libdaemon-dev libdaemon-=
src libdbus-glib-1-dbg libdbus-glib-1-dev libdbus-glib-1-src libdnf-dbg lib=
dnf-dev libdnf-src libdrm-dbg libdrm-dev libdrm-src libedit-dbg libedit-dev=
 libedit-src libegl-mesa-dev libell-dbg libell-dev libell-src lib
...
Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.core2_32 fr=
om oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev-0.1.23-r0=
.core2_32 from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.co=
re2_32 from oe-repo
 Problem 4: package libsndfile-dev-1.2.2-r0.core2_32 from oe-repo requires =
flac-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.core2_32 fr=
om oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3206
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3206

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


