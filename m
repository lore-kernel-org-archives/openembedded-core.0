Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QBvOS-0001xD-EO
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 22:50:00 +0200
Received: by pxi1 with SMTP id 1so3507943pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=HIY47uZ8i0QFxsyG7+WoVY0sBCkL48oOnKCMjs1yAjg=;
	b=bal7yPbU7p9B3d0bAW4Z5uqBx3jKS7b0NCrXAkfhSNBhSRCWGkctIlrIXPb347raN8
	y37La17aSlATTEfcBvqlaXIzOTSff+oHQ9iNUV3qodv29NGc8jGLSdyoqpRW9y42BV1G
	Kl8pli0ORcaBSNGBVMjRcSwx4zkuqbdM2Nme4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=btoBj4cfVFpG4VhXXEHZEaGyKkGk93JG57iAQZOJW9xMBVmwJuEa123KSg+rzhELiu
	PSscTV6WCp8fS3MbNbZMrohxqlR+KfHQ51IIk33mCed56ydVfSWuiQc/9XOj7b/3ln6q
	iOfuSgEBtK3nNouLn1FzJ8OMOLtuww6d8k9fg=
MIME-Version: 1.0
Received: by 10.68.58.7 with SMTP id m7mr7555139pbq.420.1303159657154; Mon, 18
	Apr 2011 13:47:37 -0700 (PDT)
Received: by 10.68.42.5 with HTTP; Mon, 18 Apr 2011 13:47:37 -0700 (PDT)
Date: Mon, 18 Apr 2011 16:47:37 -0400
Message-ID: <BANLkTimYHZUef-LkRQFvwtRv-xmTgveyZQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: OE weekly changelog for master, 2011-04-11 to 2011-04-18
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
X-List-Received-Date: Mon, 18 Apr 2011 20:50:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for master, 2011-04-11 to 2011-04-18

Colin Walters (1):
  autotools: Pass --disable-silent-rules to configure

Darren Hart (1):
  README.hardware: automate boot process for router station pro

Dexuan Cui (12):
  oprofileui: upgrade to latest git version
  libxt: update from 1.0.9 to the latest version 1.1.1
  libxi: upgrade from 1.4.0 to the latest version 1.4.2
  fixesproto: upgrade from 4.1.2 to the latest version 5.0
  xproto: upgrade from 7.0.20 to the latest version 7.0.21
  gnome-doc-utils: upgrade from 0.20.4 to the latest version 0.20.5
  xextproto: upgrade from 7.1.2 to the latest version 7.2.0
  libpciaccess: upgrade from 0.12.0 to the latest version 0.12.1
  cronie: upgrade from 1.4.6 to the latest version 1.4.7
  preferred-xorg-versions.inc: update libxt, libxi, fixesproto, xproto, xextpr
  distro_tracking_fields.inc: update the info for the following recipes
  libnewt: fix parallel-make issue

Dongxiao Xu (13):
  gstreamer: upgrade to vesion 0.10.32
  gst-plugins-base: upgrade to version 0.10.32
  gst-plugins-good: upgrade to version 0.10.28
  gst-plugins-bad: upgrade to version 0.10.21
  gst-plugins-ugly: upgrade to version 0.10.17
  ofono: upgrade to version 0.45
  alsa-lib: upgrade to version 1.0.24.1
  telepathy-glib: upgrade to version 0.14.3
  telepathy-idle: upgrade to version 0.1.8
  telepathy-mission-control: upgrade to version 5.7.9
  gssdp: upgrade to version 0.10.0
  gupnp: upgrade to version 0.16.0
  distro_tracking_fields: update for gstreamer, gupnp, telepathy-glib, etc

Gary Thomas (1):
  Allow JFFS2 image options to be overridden

Jingdong Lu (2):
  gcc: Add "--enable-clocale=gnu" option for LSB.
  poky-lsb: Add "largefile" feature for LSB distro.

Joshua Lock (1):
  clutter-1.6: fix tarball md5sum and add json-glib to dependencies

Kang Kai (1):
  jpeg: add link libjpeg.so.62 for LSB library test

Koen Kooi (1):
  x11vnc: fix SRC_URI

Martin Jansa (1):
  python-dir.bbclass: define default PYTHON_BASEVERSION

Mei Lei (3):
  libidn: upgrade from 1.19 to 1.20
  e2fsprogs: Upgrade from 1.41.12 to 1.41.14
  psmisc: Upgrade from 22.2 to 22.13

Paul Eggleton (2):
  netbase: automatically bring up eth0
  netbase: add /etc/network/interfaces file for qemumips & qemuppc

Qing He (4):
  libexif: upgrade to 0.6.20
  libxml2: upgrade to version 2.7.8
  openssl: upgrade to version 0.9.8r
  rsync: upgrade to version 3.0.8

Richard Purdie (1):
  ncurses: Remove unwanted package config from previous .inc merge

Saul Wold (4):
  clutter-1.6: fix SRC_URI[md5sum]
  qt4-x11-free: add virtual/libgl for opengl dependency
  gst-plugins-good: add dependency on libsoup-2.4
  slang: Update to 2.2.4

Scott Rifenbark (4):
  documentation/adt-manual/adt-eclipse.xml: Fixed link to autotools.
  documentation/adt-manual/adt-prepare.xml: Fixed URL for nightly builds
  documentation/adt-manual/adt-eclipse.xml: Fixed URL with pokylinux.org
  documentation/kernel-manual/kernel-how-to.xml: replaced 'pokylinux' with 'yo

Xiaofeng Yan (2):
  eglibc-package.inc: Add eglibc-binaries, eglibc-localedatas, eglibc-gconvs a
  task-poky-lsb.bb:Add locale resoures which is needed by LSB Test Suite

Yu Ke (12):
  xf86-input-synaptics: upgrade from 1.3.0 to 1.4.0
  xf86-input-vmmouse: upgrade from 12.6.10 to 12.7.0
  evieext: upgrade from 1.1.0 to 1.1.1
  xf86-input-keyboard: upgrade from 1.5.0 to 1.6.0
  xkbcomp: upgrade from 1.2.0 to 1.2.1
  libdrm: upgrade from 2.4.23 to 2.4.25
  mesa: upgrade to 7.10.2
  xf86-input-mouse: upgrade from 1.6 to 1.7
  pango: upgrade from 1.28.3 to 1.28.4
  mesa 7.10.2: add python-native dependency
  mesa: cleanup and remove the old version 7.5, 7.7 and 7.8.2
  distro tracking: reassign Kevin's recipe

Zhai Edwin (6):
  libsoup-2.4: Upgrade to 2.32.2 (from 2.32.1)
  x11perf: Upgrade to 1.5.3 (from 1.5.2)
  libcanberry: Upgrade to 0.28 (from 0.26)
  xz: Upgrade to 5.0.2 (from 5.0.0)
  polkit-gnome: Upgrade to 0.101 (from 0.99)
  qemu: Fix the qemu GL application start failure.


-- 
=================
http://bec-systems.com


