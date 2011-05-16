Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QLvt4-0004ip-01
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 13:22:58 +0200
Received: by wye20 with SMTP id 20so3700963wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 04:20:05 -0700 (PDT)
Received: by 10.227.205.67 with SMTP id fp3mr4171175wbb.53.1305544805767;
	Mon, 16 May 2011 04:20:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm3074719wbb.48.2011.05.16.04.20.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 04:20:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 May 2011 13:20:02 +0200
Message-Id: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: sstate breakage with multimachine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 11:22:58 -0000
X-Groupsio-MsgNum: 2391
Content-Type: multipart/mixed; boundary=Apple-Mail-5-820088502

--Apple-Mail-5-820088502
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

This bug gets reintroduced every other week, so let's try to fix it =
properly this time. The situation:

2 machines (beagleboard, pandaboard) using the same base architecture =
(armv7a).

step 0: rm build pseudone -rf
step 1: MACHINE=3Dbeagleboard bitbake console-image
step 2: MACHINE=3Domap4430-panda bitbake console-image

Step 0 and 1 work great, but I can't get step 2 to work. Attached is the =
complete output of step 2. As you can see without any updates to the =
repositories it wants to rebuild (e)glibc.

Why does it wants to rebuild all that? Why does it fail?

regards,

Koen


--Apple-Mail-5-820088502
Content-Disposition: attachment;
	filename=panda-build.log.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="panda-build.log.txt"
Content-Transfer-Encoding: quoted-printable

Configured layers:

layer repository name: bitbake
layer uri: git://git.openembedded.net/bitbake
layer branch/revision: master/HEAD
Updating layer at layers/bitbake
Current branch master is up to date.

Layers present in repository:

layer repository name: openembedded-core
layer uri: git://git.openembedded.org/openembedded-core
layer branch/revision: master/HEAD
Updating layer at layers/openembedded-core
Current branch master is up to date.

Layers present in repository:
openembedded-core/meta
openembedded-core/meta-rt

layer repository name: meta-angstrom
layer uri: git://git.angstrom-distribution.org/meta-angstrom
layer branch/revision: master/HEAD
Updating layer at layers/meta-angstrom
Current branch master is up to date.

Layers present in repository:
meta-angstrom

layer repository name: meta-openembedded
layer uri: git://git.openembedded.net/meta-openembedded
layer branch/revision: master/HEAD
Updating layer at layers/meta-openembedded
Current branch master is up to date.

Layers present in repository:
meta-openembedded/meta-efl
meta-openembedded/meta-oe
meta-openembedded/meta-gnome
meta-openembedded/meta-gpe

layer repository name: meta-texasinstruments
layer uri: git://git.angstrom-distribution.org/meta-texasinstruments
layer branch/revision: master/HEAD
Updating layer at layers/meta-texasinstruments
Current branch master is up to date.

Layers present in repository:
meta-texasinstruments

Using /home/koen/.oe/environment-oecore to setup needed variables. It is re=
commended to do '. /home/koen/.oe/environment-oecore' and run 'bitbake some=
thing' without using ./oebb.sh as wrapper
Executing: MACHINE=3Domap4430-panda bitbake console-image
Parsing recipes...NOTE: Angstrom DOES NOT support libiconv because the egli=
bc provided iconv library is used
NOTE: Angstrom DOES NOT support gconf-dbus because gconf-dbus has been merg=
ed back into main GConf
NOTE: Angstrom DOES NOT support gconf-dbus-native because gconf-dbus has be=
en merged back into main GConf
NOTE: Angstrom DOES NOT support libiconv because the eglibc provided iconv =
library is used
done.
Parsing of 1148 .bb files complete (0 cached, 1148 parsed). 1483 targets, 4=
1 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime psplash-support (psplash=
, psplash-angstrom, psplash-omap3pandora, psplash-ti)
NOTE: consider defining a PREFERRED_PROVIDER entry to match psplash-support
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide virtual/ps=
plash (/OE/tentacle/sources/meta-angstrom/recipes-core/psplash/psplash-angs=
trom_svn.bb /OE/tentacle/sources/meta-angstrom/recipes-core/psplash/psplash=
_svn.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide ssh (/OE/t=
entacle/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.=
bb /OE/tentacle/sources/openembedded-core/meta/recipes-connectivity/openssh=
/openssh_5.6p1.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide sshd (/OE/=
tentacle/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52=
.bb /OE/tentacle/sources/openembedded-core/meta/recipes-connectivity/openss=
h/openssh_5.6p1.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing SetScene Tasks

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "ace08f0395e64800cab55eeb30469bb73f94fcca"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "omap4430-panda"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.05-core"
TARGET_FPU        =3D "hard"

NOTE: package initscripts-1.0-r125: task do_populate_sysroot_setscene: Star=
ted
NOTE: package udev-165-r2: task do_populate_sysroot_setscene: Started
NOTE: package tinylogin-1.4-r6: task do_populate_sysroot_setscene: Started
NOTE: package psplash-zap-1.0-r7: task do_populate_sysroot_setscene: Starte=
d
NOTE: package initscripts-1.0-r125: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package tinylogin-1.4-r6: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package psplash-zap-1.0-r7: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package udev-165-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package opkg-1_0.1.8+svnr596-r2: task do_populate_sysroot_setscene: S=
tarted
NOTE: package dropbear-0.52-r1: task do_populate_sysroot_setscene: Started
NOTE: package wireless-tools-1_29-r1: task do_populate_sysroot_setscene: St=
arted
NOTE: package dropbear-0.52-r1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package wpa-supplicant-0.7.3-r4: task do_populate_sysroot_setscene: S=
tarted
NOTE: package opkg-1_0.1.8+svnr596-r2: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package wireless-tools-1_29-r1: task do_populate_sysroot_setscene: Su=
cceeded
NOTE: package util-linux-2.17.2-r7: task do_populate_sysroot_setscene: Star=
ted
NOTE: package portmap-6.0-r7: task do_populate_sysroot_setscene: Started
NOTE: package wpa-supplicant-0.7.3-r4: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package portmap-6.0-r7: task do_populate_sysroot_setscene: Succeeded
NOTE: package util-linux-2.17.2-r7: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_populate_sysroot_set=
scene: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_populate_sysroot_set=
scene: Succeeded
NOTE: package bluez4-4.91-r9: task do_populate_sysroot_setscene: Started
NOTE: package apmd-3.2.2-14-r1: task do_populate_sysroot_setscene: Started
NOTE: package ppp-2.4.5-r1: task do_populate_sysroot_setscene: Started
NOTE: package ppp-dialin-0.1-r6: task do_populate_sysroot_setscene: Started
NOTE: package ppp-2.4.5-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package apmd-3.2.2-14-r1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package ppp-dialin-0.1-r6: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package bluez4-4.91-r9: task do_populate_sysroot_setscene: Succeeded
NOTE: package usbutils-0.86-r1: task do_populate_sysroot_setscene: Started
NOTE: package e2fsprogs-1.41.14-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package alsa-utils-1.0.24.2-r0: task do_populate_sysroot_setscene: St=
arted
NOTE: package usbutils-0.86-r1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package sysfsutils-2.1.0-r1: task do_populate_sysroot_setscene: Start=
ed
NOTE: package alsa-utils-1.0.24.2-r0: task do_populate_sysroot_setscene: Su=
cceeded
NOTE: package e2fsprogs-1.41.14-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package sysfsutils-2.1.0-r1: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package module-init-tools-3.12-r1: task do_populate_sysroot_setscene:=
 Started
NOTE: package module-init-tools-3.12-r1: task do_populate_sysroot_setscene:=
 Succeeded
NOTE: package avahi-0.6.30-r0: task do_populate_sysroot_setscene: Started
NOTE: package openssh-5.6p1-r1: task do_populate_sysroot_setscene: Started
NOTE: package openssh-5.6p1-r1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package strace-4.5.20-r1: task do_populate_sysroot_setscene: Started
NOTE: package procps-3.2.8-r1: task do_populate_sysroot_setscene: Started
NOTE: package strace-4.5.20-r1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package procps-3.2.8-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package update-rc.d-0.7-r3: task do_populate_sysroot_setscene: Starte=
d
NOTE: package update-rc.d-0.7-r3: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package psplash-angstrom-0.0+svnr422-r34: task do_populate_sysroot_se=
tscene: Started
NOTE: package psplash-angstrom-0.0+svnr422-r34: task do_populate_sysroot_se=
tscene: Succeeded
NOTE: package gcc-cross-4.5-r36.2: task do_populate_sysroot_setscene: Start=
ed
NOTE: package avahi-0.6.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package gcc-runtime-4.5-r36.1: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package eglibc-2.12-r13: task do_populate_sysroot_setscene: Started
NOTE: package mtd-utils-1.4.1-r1: task do_populate_sysroot_setscene: Starte=
d
NOTE: package mtd-utils-1.4.1-r1: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package makedevs-1.0.0-r7: task do_populate_sysroot_setscene: Started
NOTE: package makedevs-1.0.0-r7: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libtool-cross-2.4-r2: task do_populate_sysroot_setscene: Star=
ted
NOTE: package libtool-cross-2.4-r2: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package acl-2.2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: package acl-2.2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package gcc-runtime-4.5-r36.1: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package gcc-cross-4.5-r36.2: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package glib-2.0-1_2.28.6-r1: task do_populate_sysroot_setscene: Star=
ted
NOTE: package gpgme-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: package curl-7.21.6-r0: task do_populate_sysroot_setscene: Started
NOTE: package curl-7.21.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package openssl-1.0.0c-r13.2: task do_populate_sysroot_setscene: Star=
ted
NOTE: package gpgme-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package zlib-1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: package eglibc-2.12-r13: task do_populate_sysroot_setscene: Succeeded
NOTE: package glib-2.0-1_2.28.6-r1: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package dbus-1.2.24-r20.1: task do_populate_sysroot_setscene: Started
NOTE: package gnutls-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: package zlib-1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package openssl-1.0.0c-r13.2: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package libnl-1_2.0-r5.0: task do_populate_sysroot_setscene: Started
NOTE: package tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Start=
ed
NOTE: package tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package gettext-0.17-r5: task do_populate_sysroot_setscene: Started
NOTE: package dbus-1.2.24-r20.1: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package ncurses-5.9-r0.1: task do_populate_sysroot_setscene: Started
NOTE: package ncurses-5.9-r0.1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package gst-plugins-base-0.10.32-r0: task do_populate_sysroot_setscen=
e: Started
NOTE: package libnl-1_2.0-r5.0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package gnutls-2.10.4-r0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package alsa-lib-1.0.24.1-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package libusb-compat-1_0.1.3-r0: task do_populate_sysroot_setscene: =
Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_populate_sysroot_setscene: =
Succeeded
NOTE: package gettext-0.17-r5: task do_populate_sysroot_setscene: Succeeded
NOTE: package dbus-glib-0.92-r0: task do_populate_sysroot_setscene: Started
NOTE: package libpcap-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: package libpcap-1.1.1-r0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package elfutils-0.148-r2: task do_populate_sysroot_setscene: Started
NOTE: package dbus-glib-0.92-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package alsa-lib-1.0.24.1-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package elfutils-0.148-r2: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package update-modules-1.0-r9: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package module-init-tools-cross-3.12-r1: task do_populate_sysroot_set=
scene: Started
NOTE: package expat-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: package update-modules-1.0-r9: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package module-init-tools-cross-3.12-r1: task do_populate_sysroot_set=
scene: Succeeded
NOTE: package libcap-2.20-r0: task do_populate_sysroot_setscene: Started
NOTE: package expat-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libcap-2.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: package gtk+-2.20.1-r10.4: task do_populate_sysroot_setscene: Started
NOTE: package libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libglade-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: package libpam-1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: package libglade-2.6.4-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package base-passwd-3.5.22-r1: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package base-passwd-3.5.22-r1: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package busybox-1.18.4-r1: task do_populate_sysroot_setscene: Started
NOTE: package busybox-1.18.4-r1: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package modutils-initscripts-1.0-r5: task do_populate_sysroot_setscen=
e: Started
NOTE: package modutils-initscripts-1.0-r5: task do_populate_sysroot_setscen=
e: Succeeded
NOTE: package bluez-hcidump-2.0-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package gtk+-2.20.1-r10.4: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package bluez-hcidump-2.0-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package python-2.6.6-nk1.3: task do_populate_sysroot_setscene: Starte=
d
NOTE: package gst-plugins-base-0.10.32-r0: task do_populate_sysroot_setscen=
e: Succeeded
NOTE: package perl-5.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: package libnss-mdns-0.10-r2: task do_populate_sysroot_setscene: Start=
ed
NOTE: package libnss-mdns-0.10-r2: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package psplash-0.0+svnr422-r34: task do_populate_sysroot_setscene: S=
tarted
NOTE: package psplash-0.0+svnr422-r34: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_populate_sysroot_sets=
cene: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_populate_sysroot_sets=
cene: Succeeded
NOTE: package gnome-vfs-2.24.4-r0: task do_populate_sysroot_setscene: Start=
ed
NOTE: package python-2.6.6-nk1.3: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package perl-5.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package hicolor-icon-theme-0.12-r0: task do_populate_sysroot_setscene=
: Started
NOTE: package hicolor-icon-theme-0.12-r0: task do_populate_sysroot_setscene=
: Succeeded
NOTE: package ttf-dejavu-2.23-r3: task do_populate_sysroot_setscene: Starte=
d
NOTE: package ttf-dejavu-2.23-r3: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package binutils-cross-2.20.1-r5: task do_populate_sysroot_setscene: =
Started
NOTE: package libgcc-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: package libpam-1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libgcc-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_populate_sysroot_se=
tscene: Started
NOTE: package lzo-2.05-r0: task do_populate_sysroot_setscene: Started
NOTE: package binutils-cross-2.20.1-r5: task do_populate_sysroot_setscene: =
Succeeded
NOTE: package attr-2.4.46-r0: task do_populate_sysroot_setscene: Started
NOTE: package attr-2.4.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package zip-3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: package lzo-2.05-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package zip-3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libgpg-error-1.8-r0: task do_populate_sysroot_setscene: Start=
ed
NOTE: package libassuan-2.0.1-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package libgpg-error-1.8-r0: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package libassuan-2.0.1-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_populate_sysroot_se=
tscene: Succeeded
NOTE: package gnome-vfs-2.24.4-r0: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package pth-2.0.7-r1: task do_populate_sysroot_setscene: Started
NOTE: package ocf-linux-20100325-r3.0: task do_populate_sysroot_setscene: S=
tarted
NOTE: package libtasn1-2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: package ocf-linux-20100325-r3.0: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package libgcrypt-1.4.6-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package pth-2.0.7-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package libtasn1-2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libsm-1_1.2.0-r1: task do_populate_sysroot_setscene: Started
NOTE: package libice-1_1.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: package libgcrypt-1.4.6-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package libx11-1_1.4.3-r9.0: task do_populate_sysroot_setscene: Start=
ed
NOTE: package libsm-1_1.2.0-r1: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package libice-1_1.0.7-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_sysroot_setscene: Start=
ed
NOTE: package gstreamer-0.10.32-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package freetype-2.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: package liboil-0.3.17-r3: task do_populate_sysroot_setscene: Started
NOTE: package liboil-0.3.17-r3: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package libogg-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: package libx11-1_1.4.3-r9.0: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package freetype-2.4.4-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libvorbis-1.3.2-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package libxv-1.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: package libogg-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libxv-1.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Starte=
d
NOTE: package libusb1-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: package libvorbis-1.3.2-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package libusb1-1.0.8-r0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package gstreamer-0.10.32-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package libtool-2.4-r2: task do_populate_sysroot_setscene: Started
NOTE: package bzip2-1.0.6-r3: task do_populate_sysroot_setscene: Started
NOTE: package tiff-3.8.2-r2: task do_populate_sysroot_setscene: Started
NOTE: package libtool-2.4-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package pango-1.28.3-r1.0: task do_populate_sysroot_setscene: Started
NOTE: package bzip2-1.0.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: package atk-1.30.0-r1: task do_populate_sysroot_setscene: Started
NOTE: package jpeg-8c-r1: task do_populate_sysroot_setscene: Started
NOTE: package tiff-3.8.2-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package atk-1.30.0-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package jpeg-8c-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package libpng-1.2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: package libxext-1_1.2.0-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package libxcursor-1_1.1.11-r0: task do_populate_sysroot_setscene: St=
arted
NOTE: package libpng-1.2.44-r0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package libxext-1_1.2.0-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package libxcursor-1_1.1.11-r0: task do_populate_sysroot_setscene: Su=
cceeded
NOTE: package gtk-doc-1.0-r4: task do_populate_sysroot_setscene: Started
NOTE: package cups-1.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: package libxrandr-1_1.3.1-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package pango-1.28.3-r1.0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package gtk-doc-1.0-r4: task do_populate_sysroot_setscene: Succeeded
NOTE: package libxrandr-1_1.3.1-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package libxdamage-1_1.1.3-r0: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package libxrender-1_0.9.6-r0: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package libxcomposite-1_0.4.3-r0: task do_populate_sysroot_setscene: =
Started
NOTE: package libxdamage-1_1.1.3-r0: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package cairo-1.10.0-r1: task do_populate_sysroot_setscene: Started
NOTE: package libxcomposite-1_0.4.3-r0: task do_populate_sysroot_setscene: =
Succeeded
NOTE: package cups-1.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package libxrender-1_0.9.6-r0: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package jasper-1.900.1-r1: task do_populate_sysroot_setscene: Started
NOTE: package gconf-2.28.0-r2: task do_populate_sysroot_setscene: Started
NOTE: package gnome-common-2.28.0-r0: task do_populate_sysroot_setscene: St=
arted
NOTE: package gnome-common-2.28.0-r0: task do_populate_sysroot_setscene: Su=
cceeded
NOTE: package shared-mime-info-0.90-r0: task do_populate_sysroot_setscene: =
Started
NOTE: package jasper-1.900.1-r1: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package shared-mime-info-0.90-r0: task do_populate_sysroot_setscene: =
Succeeded
NOTE: package gconf-2.28.0-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package bison-2.4.3-r2: task do_populate_sysroot_setscene: Started
NOTE: package cairo-1.10.0-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package flex-2.5.35-r2: task do_populate_sysroot_setscene: Started
NOTE: package bison-2.4.3-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package db-5.1.19-r2: task do_populate_sysroot_setscene: Started
NOTE: package flex-2.5.35-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot_setscene: Started
NOTE: package readline-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: package sqlite3-3.7.6.2-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot_setscene: Succeeded
NOTE: package readline-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package sqlite3-3.7.6.2-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package libxml2-2.7.8-r0: task do_populate_sysroot_setscene: Started
NOTE: package gnome-mime-data-2.18.0-r4: task do_populate_sysroot_setscene:=
 Started
NOTE: package font-update-common-0.1-r0: task do_populate_sysroot_setscene:=
 Started
NOTE: package font-update-common-0.1-r0: task do_populate_sysroot_setscene:=
 Succeeded
NOTE: package xproto-1_7.0.21-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package xproto-1_7.0.21-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package gnome-mime-data-2.18.0-r4: task do_populate_sysroot_setscene:=
 Succeeded
NOTE: package util-macros-1_1.13.0-r0: task do_populate_sysroot_setscene: S=
tarted
NOTE: package eglibc-initial-2.12-r13: task do_populate_sysroot_setscene: S=
tarted
NOTE: package util-macros-1_1.13.0-r0: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package libxml2-2.7.8-r0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package xtrans-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: package eglibc-initial-2.12-r13: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package xtrans-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libxau-1_1.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_populate_sysroot_setscene: S=
tarted
NOTE: package xextproto-1_7.2.0-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package bigreqsproto-1_1.1.1-r0: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package xextproto-1_7.2.0-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: package libxau-1_1.0.6-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package xcmiscproto-1_1.2.1-r0: task do_populate_sysroot_setscene: St=
arted
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_populate_sysroot_setscen=
e: Started
NOTE: package kbproto-1_1.0.5-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package db-5.1.19-r2: task do_populate_sysroot_setscene: Succeeded
NOTE: package inputproto-1_2.0.1-r0: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_populate_sysroot_setscen=
e: Succeeded
NOTE: package kbproto-1_1.0.5-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package inputproto-1_2.0.1-r0: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package xcmiscproto-1_1.2.1-r0: task do_populate_sysroot_setscene: Su=
cceeded
NOTE: package libxcb-1.7-r1: task do_populate_sysroot_setscene: Started
NOTE: package videoproto-1_2.3.1-r0: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package fontconfig-2.8.0-r1: task do_populate_sysroot_setscene: Start=
ed
NOTE: package libxft-1_2.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: package videoproto-1_2.3.1-r0: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package fontconfig-2.8.0-r1: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package libxft-1_2.2.0-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libxfixes-1_5.0-r0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package damageproto-1_1.2.1-r0: task do_populate_sysroot_setscene: St=
arted
NOTE: package randrproto-1_1.3.2-r0: task do_populate_sysroot_setscene: Sta=
rted
NOTE: package libxfixes-1_5.0-r0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package damageproto-1_1.2.1-r0: task do_populate_sysroot_setscene: Su=
cceeded
NOTE: package randrproto-1_1.3.2-r0: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: package renderproto-1_0.11.1-r0: task do_populate_sysroot_setscene: S=
tarted
NOTE: package compositeproto-1_0.4.2-r0: task do_populate_sysroot_setscene:=
 Started
NOTE: package renderproto-1_0.11.1-r0: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package pixman-0.22.0-r5.0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package compositeproto-1_0.4.2-r0: task do_populate_sysroot_setscene:=
 Succeeded
NOTE: package orbit2-2.14.17-r0: task do_populate_sysroot_setscene: Started
NOTE: package pixman-0.22.0-r5.0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package policykit-0.96-r2: task do_populate_sysroot_setscene: Started
NOTE: package gcc-cross-initial-4.5-r36.0: task do_populate_sysroot_setscen=
e: Started
NOTE: package orbit2-2.14.17-r0: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package libxcb-1.7-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: package policykit-0.96-r2: task do_populate_sysroot_setscene: Succeed=
ed
NOTE: package xcb-proto-1.6-r0.0: task do_populate_sysroot_setscene: Starte=
d
NOTE: package libpthread-stubs-0.3-r0: task do_populate_sysroot_setscene: S=
tarted
NOTE: package fixesproto-1_5.0-r0: task do_populate_sysroot_setscene: Start=
ed
NOTE: package xcb-proto-1.6-r0.0: task do_populate_sysroot_setscene: Succee=
ded
NOTE: package libpthread-stubs-0.3-r0: task do_populate_sysroot_setscene: S=
ucceeded
NOTE: package fixesproto-1_5.0-r0: task do_populate_sysroot_setscene: Succe=
eded
NOTE: package libidl-0.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: package popt-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: package eggdbus-0.6-r1: task do_populate_sysroot_setscene: Started
NOTE: package gcc-cross-initial-4.5-r36.0: task do_populate_sysroot_setscen=
e: Succeeded
NOTE: package libidl-0.8.13-r0: task do_populate_sysroot_setscene: Succeede=
d
NOTE: package popt-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: package eggdbus-0.6-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Executing RunQueue Tasks
NOTE: Running task 1259 of 3549 (ID: 1746, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_fetch=
)
NOTE: Running task 1263 of 3549 (ID: 1460, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_fetch)
NOTE: Running task 1273 of 3549 (ID: 1811, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_fetch=
)
NOTE: Running task 1274 of 3549 (ID: 3215, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_fetch)
NOTE: package binutils-cross-2.20.1-r5: task do_fetch: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_fetch: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_fetch: Succeeded
NOTE: package gcc-cross-initial-4.5-r36.0: task do_fetch: Started
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_fetch: Started
NOTE: Running task 1275 of 3549 (ID: 1456, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_unpack)
NOTE: package binutils-cross-2.20.1-r5: task do_fetch: Succeeded
NOTE: Running task 1276 of 3549 (ID: 1742, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_unpac=
k)
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_fetch: Succeeded
NOTE: package gcc-cross-initial-4.5-r36.0: task do_fetch: Succeeded
NOTE: Running task 1277 of 3549 (ID: 1807, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_unpac=
k)
NOTE: Running task 1278 of 3549 (ID: 3211, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_unpack)
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_unpack: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_unpack: Started
NOTE: package binutils-cross-2.20.1-r5: task do_unpack: Started
NOTE: package gcc-cross-initial-4.5-r36.0: task do_unpack: Started
NOTE: package binutils-cross-2.20.1-r5: task do_unpack: Succeeded
NOTE: Running task 1279 of 3549 (ID: 1743, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_patch=
)
NOTE: package binutils-cross-2.20.1-r5: task do_patch: Started
NOTE: package binutils-cross-2.20.1-r5: task do_patch: Succeeded
NOTE: Running task 1280 of 3549 (ID: 1748, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_confi=
gure)
NOTE: package binutils-cross-2.20.1-r5: task do_configure: Started
NOTE: package binutils-cross-2.20.1-r5: task do_configure: Succeeded
NOTE: Running task 1281 of 3549 (ID: 1749, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_compi=
le)
NOTE: package binutils-cross-2.20.1-r5: task do_compile: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_unpack: Succeeded
NOTE: Running task 1282 of 3549 (ID: 1753, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_popul=
ate_lic)
NOTE: package binutils-cross-2.20.1-r5: task do_populate_lic: Started
NOTE: package binutils-cross-2.20.1-r5: task do_populate_lic: Succeeded
NOTE: Running task 1283 of 3549 (ID: 1457, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_patch)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_patch: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_patch: Succeeded
NOTE: Running task 1284 of 3549 (ID: 1462, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_configure)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_configure: Started
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_unpack: Succeeded
NOTE: Running task 1285 of 3549 (ID: 1467, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_populate_lic)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_populate_lic: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_populate_lic: Succeed=
ed
NOTE: Running task 1286 of 3549 (ID: 1808, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_patch=
)
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_patch: Started
NOTE: package gcc-cross-initial-4.5-r36.0: task do_unpack: Succeeded
NOTE: Running task 1287 of 3549 (ID: 3212, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_patch)
NOTE: package gcc-cross-initial-4.5-r36.0: task do_patch: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_configure: Succeeded
NOTE: Running task 1288 of 3549 (ID: 1463, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_compile)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_compile: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_compile: Succeeded
NOTE: Running task 1289 of 3549 (ID: 1458, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_install)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_install: Started
NOTE: package binutils-cross-2.20.1-r5: task do_compile: Succeeded
NOTE: Running task 1290 of 3549 (ID: 1744, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_insta=
ll)
NOTE: package binutils-cross-2.20.1-r5: task do_install: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_install: Succeeded
NOTE: Running task 1291 of 3549 (ID: 1465, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_package)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_package: Started
NOTE: package binutils-cross-2.20.1-r5: task do_install: Succeeded
NOTE: Running task 1292 of 3549 (ID: 1751, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_packa=
ge)
NOTE: package binutils-cross-2.20.1-r5: task do_package: Started
NOTE: package binutils-cross-2.20.1-r5: task do_package: Succeeded
NOTE: Running task 1293 of 3549 (ID: 1754, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_packa=
ge_write_ipk)
NOTE: package binutils-cross-2.20.1-r5: task do_package_write_ipk: Started
NOTE: package binutils-cross-2.20.1-r5: task do_package_write_ipk: Succeede=
d
NOTE: Running noexec task 1294 of 3549 (ID: 1750, /OE/tentacle/sources/meta=
-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, d=
o_package_write)
NOTE: Running noexec task 1295 of 3549 (ID: 1747, /OE/tentacle/sources/meta=
-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, d=
o_build)
NOTE: Running task 1296 of 3549 (ID: 1752, /OE/tentacle/sources/meta-openem=
bedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_rm_wo=
rk)
NOTE: package binutils-cross-2.20.1-r5: task do_rm_work: Started
NOTE: package binutils-cross-2.20.1-r5: task do_rm_work: Succeeded
NOTE: Running task 1297 of 3549 (ID: 2695, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-core/eglibc/eglibc-initial_2.12.bb, do_fetch)
NOTE: package eglibc-initial-2.12-r13: task do_fetch: Started
NOTE: package eglibc-initial-2.12-r13: task do_fetch: Succeeded
NOTE: Running task 1298 of 3549 (ID: 2691, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-core/eglibc/eglibc-initial_2.12.bb, do_unpack)
NOTE: package eglibc-initial-2.12-r13: task do_unpack: Started
NOTE: package eglibc-initial-2.12-r13: task do_unpack: Succeeded
NOTE: Running task 1299 of 3549 (ID: 2692, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-core/eglibc/eglibc-initial_2.12.bb, do_patch)
NOTE: package eglibc-initial-2.12-r13: task do_patch: Started
NOTE: package eglibc-initial-2.12-r13: task do_patch: Succeeded
NOTE: Running task 1300 of 3549 (ID: 2697, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-core/eglibc/eglibc-initial_2.12.bb, do_configure)
NOTE: package eglibc-initial-2.12-r13: task do_configure: Started
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_package: Succeeded
NOTE: Running task 1301 of 3549 (ID: 1468, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.b=
b, do_package_write_ipk)
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_package_write_ipk: St=
arted
NOTE: package linux-libc-headers-2.6.37.2-r1: task do_package_write_ipk: Su=
cceeded
NOTE: Running noexec task 1302 of 3549 (ID: 1464, /OE/tentacle/sources/open=
embedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6=
.37.2.bb, do_package_write)
NOTE: Running task 1303 of 3549 (ID: 2702, /OE/tentacle/sources/openembedde=
d-core/meta/recipes-core/eglibc/eglibc-initial_2.12.bb, do_populate_lic)
NOTE: package eglibc-initial-2.12-r13: task do_populate_lic: Started
NOTE: package eglibc-initial-2.12-r13: task do_populate_lic: Succeeded
NOTE: Running task 1304 of 3549 (ID: 823, /OE/tentacle/sources/openembedded=
-core/meta/recipes-core/eglibc/eglibc_2.12.bb, do_fetch)
NOTE: package eglibc-2.12-r13: task do_fetch: Started
NOTE: package eglibc-2.12-r13: task do_fetch: Succeeded
NOTE: Running task 1305 of 3549 (ID: 819, /OE/tentacle/sources/openembedded=
-core/meta/recipes-core/eglibc/eglibc_2.12.bb, do_unpack)
NOTE: package eglibc-2.12-r13: task do_unpack: Started
ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_=
2010_x/work/armv7a-angstrom-linux-gnueabi/eglibc-initial-2.12-r13/temp/log.=
do_configure.23596 for further information)
ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_2010_x=
/work/armv7a-angstrom-linux-gnueabi/eglibc-initial-2.12-r13/temp/log.do_con=
figure.23596
Log data follows:
| + cd /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gn=
ueabi/eglibc-initial-2.12-r13/build-arm-angstrom-linux-gnueabi
| + do_configure
| + unset CFLAGS
| + sed -e s#@BASH@#/bin/sh# -i /OE/tentacle/build/tmp-angstrom_2010_x/work=
/armv7a-angstrom-linux-gnueabi/eglibc-initial-2.12-r13/eglibc-2_12/libc/elf=
/ldd.bash.in
| + sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' /OE/tentacle/bu=
ild/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/eglibc-initial-2=
.12-r13/eglibc-2_12/libc/configure
| + chmod +x /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-li=
nux-gnueabi/eglibc-initial-2.12-r13/eglibc-2_12/libc/configure
| + cd /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gn=
ueabi/eglibc-initial-2.12-r13/eglibc-2_12/libc
| + gnu-configize
| + find /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-=
gnueabi/eglibc-initial-2.12-r13/eglibc-2_12/libc -name configure
| + xargs touch
| + /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnuea=
bi/eglibc-initial-2.12-r13/eglibc-2_12/libc/configure --host=3Darm-angstrom=
-linux-gnueabi --build=3Dx86_64-linux --prefix=3D/usr --without-cvs --disab=
le-sanity-checks --with-headers=3D/OE/tentacle/build/tmp-angstrom_2010_x/sy=
sroots/omap4430-panda-eglibc/usr/include --enable-hacker-mode --enable-addo=
ns
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-angstrom-linux-gnueabi
| checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom-linux-=
gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/OE/tentacle/build/tmp-angs=
trom_2010_x/sysroots/omap4430-panda-eglibc-tcbootstrap
| checking for suffix of object files... configure: error: in `/OE/tentacle=
/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/eglibc-initia=
l-2.12-r13/build-arm-angstrom-linux-gnueabi':
| configure: error: cannot compute suffix of object files: cannot compile
| See `config.log' for more details.
|=20
| checking whether we are using the GNU C compiler... no
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -=
mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-=
thumb --sysroot=3D/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/omap4430-=
panda-eglibc-tcbootstrap accepts -g... no
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtun=
e=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thum=
b --sysroot=3D/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/omap4430-pand=
a-eglibc-tcbootstrap option to accept ISO C89... unsupported
| checking for gcc... ccache gcc
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc =
-E --sysroot=3D/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/omap4430-pan=
da-eglibc-tcbootstrap
| checking whether we are using the GNU C++ compiler... no
| checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -=
mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-=
thumb --sysroot=3D/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/omap4430-=
panda-eglibc-tcbootstrap accepts -g... no
| configure: running configure fragment for add-on libidn
| configure: running configure fragment for add-on nptl
| checking add-on ports for preconfigure fragments... alpha am33 arm hppa m=
68k mips powerpc
| checking sysdep dirs... checking for assembler gnu_indirect_function symb=
ol type support... no
| ports/sysdeps/arm/elf ports/sysdeps/unix/sysv/linux/arm/eabi/nptl ports/s=
ysdeps/unix/sysv/linux/arm/eabi ports/sysdeps/unix/sysv/linux/arm/nptl port=
s/sysdeps/unix/sysv/linux/arm nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pth=
read sysdeps/pthread ports/sysdeps/unix/sysv/linux sysdeps/unix/sysv/linux =
sysdeps/gnu sysdeps/unix/common sysdeps/unix/mman sysdeps/unix/inet nptl/sy=
sdeps/unix/sysv ports/sysdeps/unix/sysv sysdeps/unix/sysv ports/sysdeps/uni=
x/arm nptl/sysdeps/unix ports/sysdeps/unix sysdeps/unix sysdeps/posix ports=
/sysdeps/arm/eabi ports/sysdeps/arm/fpu ports/sysdeps/arm/nptl ports/sysdep=
s/arm sysdeps/wordsize-32 sysdeps/ieee754/flt-32 sysdeps/ieee754/dbl-64 sys=
deps/ieee754 sysdeps/generic/elf sysdeps/generic
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether ln -s works... yes
| checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnue=
abi-ranlib
| checking whether as is GNU as... yes
| checking whether ld is GNU ld... yes
| checking for as... as
| checking version of as... 2.20.1, ok
| checking for ld... ld
| checking version of ld... 2.20.1, ok
| checking for pwd... /bin/pwd
| checking for arm-angstrom-linux-gnueabi-gcc... (cached) ccache arm-angstr=
om-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mflo=
at-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/OE/tentacle/build=
/tmp-angstrom_2010_x/sysroots/omap4430-panda-eglibc-tcbootstrap
| checking version of ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-=
a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -m=
no-thumb --sysroot=3D/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/omap44=
30-panda-eglibc-tcbootstrap... 4.5.3, ok
| checking for gnumake... make
| checking version of make... 3.81, ok
| checking for gnumsgfmt... no
| checking for gmsgfmt... no
| checking for msgfmt... msgfmt
| checking version of msgfmt... 0.17, ok
| checking for makeinfo... makeinfo
| checking version of makeinfo... 4.13, ok
| checking for sed... sed
| checking version of sed... 4.1.5, ok
| checking for autoconf... autoconf
| checking whether autoconf works... yes
| checking whether ranlib is necessary... Assembler messages:
| Fatal error: Invalid -march=3D option: `armv7-a'
| ar: conftest.o: No such file or directory
| cp: cannot stat `conftest.a': No such file or directory
| /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi=
/eglibc-initial-2.12-r13/eglibc-2_12/libc/configure: line 5566: arm-angstro=
m-linux-gnueabi-ranlib: command not found
| yes
| checking LD_LIBRARY_PATH variable... ok
| checking whether GCC supports -static-libgcc... -static-libgcc
| checking for bash... /bin/bash
| checking for gawk... gawk
| checking for perl... /OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x86_=
64-linux/usr/bin/perl
| checking for install-info... /usr/bin/install-info
| checking for bison... /OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x86=
_64-linux/usr/bin/bison
| checking for signed size_t type... no
| checking for libc-friendly stddef.h... no
| checking whether we need to use -P to assemble .S files... yes
| checking whether .text pseudo-op must be used... no
| checking for assembler global-symbol directive... UNKNOWN
| configure: error: cannot determine asm global directive
| checking for .set assembler directive... no
| checking for assembler .type directive prefix... no
| checking for assembler gnu_unique_object symbol type... no
| checking for .symver assembler directive... no
| checking for ld --version-script... no
| *** WARNING: You should not compile GNU libc without versioning. Not usin=
g
| *** versioning will introduce incompatibilities so that old binaries
| *** will not run anymore.
| *** For versioning you need recent binutils (binutils-2.8.1.0.23 or newer=
).
| checking for .previous assembler directive... no
| checking for .popsection assembler directive... no
| checking for .protected and .hidden assembler directive... configure: err=
or: assembler support for symbol visibility is required
|=20
| /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi=
/eglibc-initial-2.12-r13/eglibc-2_12/libc/configure: line 6390: test: =3D: =
unary operator expected
| /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi=
/eglibc-initial-2.12-r13/eglibc-2_12/libc/configure: line 6425: test: =3D: =
unary operator expected
| checking for broken __attribute__((alias()))... no
| /OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi=
/eglibc-initial-2.12-r13/eglibc-2_12/libc/configure: line 6495: test: =3D: =
unary operator expected
| checking for .preinit_array/.init_array/.fini_array support... no
| configure: error: Need linker with .init_array/.fini_array support.
| checking for libunwind-support in compiler... no
| checking for -z nodelete option... configure: error: linker with -z nodel=
ete support required
|=20
| checking for -z nodlopen option... configure: error: linker with -z nodlo=
pen support required
|=20
| checkiERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-a=
ngstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/eglibc-initial-2.12-r13/t=
emp/log.do_configure.23596 for further information)
| ng for -z initfirst option... configure: error: linker with -z initfirst =
support required
|=20
| checking for -Bgroup option... no
| checking for libgcc_s suffix...
| checking for --as-needed option... no
| checking whether --noexecstack is desirable for .S files... no
| checking for -z combreloc... no
| checking for -z execstack... no
| checking for --hash-style option... no
| checking for -fno-toplevel-reorder -fno-section-anchors... yes
| checking for -fstack-protector... no
| checking for -fgnu89-inline... yes
| checking whether cc puts quotes around section names... no
| checking for assembler .weak directive... no
| checking for assembler .weakext directive... no
| checking whether CFI directives are supported... no
| checking for ld --no-whole-archive... no
| checking for gcc -fexceptions... no
| checking for __builtin_expect... no
| checking for __builtin_memset... no
| checking for redirection of built-in functions... yes
| checking for __thread... no
| checking for libgd... no
| checking for is_selinux_enabled in -lselinux... no
| checking for grep that handles long lines and -e... /bin/grep
| checking for egrep... /bin/grep -E
| checking for ANSI C header files... no
| checking for sys/types.h... no
| checking for sys/stat.h... no
| checking for stdlib.h... no
| checking for string.h... no
| checking for memory.h... no
| checking for strings.h... no
| checking for inttypes.h... no
| checking for stdint.h... no
| checking for unistd.h... no
| checking size of long double... 0
| running configure fragment for ports/sysdeps/arm/elf
| checking for ARM TLS support... no
| running configure fragment for ports/sysdeps/unix/sysv/linux/arm/eabi/npt=
l
| running configure fragment for ports/sysdeps/unix/sysv/linux/arm/eabi
| running configure fragment for nptl/sysdeps/pthread
| configure: error: compiler support for __thread is required
NOTE: package eglibc-initial-2.12-r13: task do_configure: Failed
ERROR: Task 2697 (/OE/tentacle/sources/openembedded-core/meta/recipes-core/=
eglibc/eglibc-initial_2.12.bb, do_configure) failed with exit code '1'
Waiting for 3 active tasks to finish:
0: eglibc-2.12-r13 do_unpack (pid 26022)
1: gcc-cross-intermediate-4.5-r36.0 do_patch (pid 27335)
2: gcc-cross-initial-4.5-r36.0 do_patch (pid 32188)
Waiting for 2 active tasks to finish:
0: gcc-cross-intermediate-4.5-r36.0 do_patch (pid 27335)
1: gcc-cross-initial-4.5-r36.0 do_patch (pid 32188)
NOTE: package eglibc-2.12-r13: task do_unpack: Succeeded
Waiting for 1 active tasks to finish:
0: gcc-cross-intermediate-4.5-r36.0 do_patch (pid 27335)
NOTE: package gcc-cross-initial-4.5-r36.0: task do_patch: Succeeded
NOTE: package gcc-cross-intermediate-4.5-r36.0: task do_patch: Succeeded
ERROR: '/OE/tentacle/sources/openembedded-core/meta/recipes-core/eglibc/egl=
ibc-initial_2.12.bb' failed

--Apple-Mail-5-820088502--
