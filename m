Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PzZZM-00027Y-Dl
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 20:06:12 +0100
Received: by wwb17 with SMTP id 17so1012526wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=w1a0YcgmcXKAKD2cNYGiAm6EuTiGTc+hBL02v7qWWHw=;
	b=mQ4EAHt//jjpIEjVZrRBEJlcw9M56Gpjd3ol1s+xx9wJ4PGzn9AUCyMG6Zd3o9Z5AH
	PjBhCmxDRX1f1HcAUdYeHL1QLtiVIf1b22QWXltKtgi3uyDFjyB1LTyUiJIyW0dPA+gA
	/h8EdPZfCajX1fkC++CS/ylna2bsXaJIEwT8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=uQzBy6EOm7R9RNqFLZgue4FxFbZ/uOPJlkTZs9zuZl8kHLSI6s9HMNdcavKZ2hO0OR
	VdhSt2ZQm7R93+Sp50xddcGv0aneex2k480zCV8zLP3gFbAu2bvfrE4gvhkQ5KSZBgOf
	LiV56BTwiLO08i3Svc8DGRc+plLAyRUG+S2sI=
MIME-Version: 1.0
Received: by 10.216.145.221 with SMTP id p71mr4077843wej.9.1300215866271; Tue,
	15 Mar 2011 12:04:26 -0700 (PDT)
Received: by 10.216.47.85 with HTTP; Tue, 15 Mar 2011 12:04:26 -0700 (PDT)
Date: Tue, 15 Mar 2011 15:04:26 -0400
Message-ID: <AANLkTi=R+k9xVVp8xT4tTMeqfLY4itBbn08M7u5o3Mef@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: OE weekly changelog for openembedded-core, 2011-03-07 to 2011-03-14
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
X-List-Received-Date: Tue, 15 Mar 2011 19:06:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for openembedded-core, 2011-03-07 to 2011-03-14

Bruce Ashfield (1):
  linux-yocto: update to 2.6.37.3

Dexuan Cui (2):
  oprofileui: upgrade to the latest version maintained by the Yocto project
  distro_tracking_fields.inc: update the info for oprofileui

Dongxiao Xu (4):
  connman: add xuser to the dbus permission list
  telepathy-python: Fix parallel make issue.
  tinylogin: Fix rotate passwd check logic
  gst-plugins-bad: add missing dependency librsvg

Joshua Lock (1):
  util-macros: fix DEPENDS for nativesdk

Khem Raj (3):
  poky-default.inc: Change LINUXLIBCVERSION "2.6.36" -> "2.6.37.2"
  sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
  gcc-configure-runtime.inc: Add immediate evaluation otherwise it ends in cir

Lianhao Lu (1):
  gcc/collect2: Added --sysroot support into collect2 in gcc.

Liping Ke (3):
  adt: Update to svn r596 to fix symbolic link issues
  adt: removed unused repo source and opkg options
  Disable wget server side cache

Mark Hatle (4):
  gcc-runtime: Ensure that gcc-runtime builds a debug package
  package.bbclass: Change the debug directory to avoid conflicts
  package_rpm: Fix rootfs generation
  gcc-runtime: Fix dbg files

Martin Jansa (4):
  sanity.bbclass: some multilib systems have symlink /lib -> /lib64
  python: add generate-manifest-2.6.py script and regen
python-2.6-manifest.in
  debian.bbclass: call auto_libname in reverse sorted
AUTO_LIBNAME_PKGS
  distutils-base: Only RDEPEND python-core on target packages

Nitin A Kamble (2):
  gcc-runtime: fix LSB library checks for libstdc++.so.6
  perl: another set of parallel build fixes

Paul Eggleton (1):
  gst-plugins-good: remove dependency on hal

Richard Purdie (3):
  sstate: Ensure the SRCURI fetcher cache is not used for sstate
  autotools.bbclass: Fix automake file race issues
  sanity.bbclass: Fix inverted mmap_min_addr logic

Saul Wold (3):
  lsb-live image: add lsb-live and lsb-sdk-live image types
  cpio: Fix the SHA256 Checksum for the src tarball
  quilt: add autotools inheritance

Scott Garman (1):
  openssh: allow the openssh meta package to be empty



-- 
=================
http://bec-systems.com


