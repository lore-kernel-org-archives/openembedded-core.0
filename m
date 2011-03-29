Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Q4aC7-000431-C4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 16:46:55 +0200
Received: by wye20 with SMTP id 20so225066wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=wUehtS1//uQEtyJv8lbpzpBhKKDtaXkImxeO/+MJ0tQ=;
	b=Ih1dQVBmbz3dRcVQa8LC0CEaCTe19u0B5SZWGx+DyB5m6t5yDoB90dIaSRrKWEN4AU
	/s4d9kPA0jL1GY+KkX8LKmtPgZ/K+9onhfIYLd4LImYkpLwdvAYwLJHwlNtO5+VxJ+/I
	HvvLpJbSdA/+NnJqWj/NcCObQPDX4lWkyaJBk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Ez/SAx6LX8p6uS2N0SZQX97wV4Nuk40NnfN+wypAYAcLqWs4xlzxXe/ElR3+lkH+gl
	pReqdKfauR5VCzs5GoTsJBGY9+WJrsHT0KL5pHeX/QzPl6so3hZPCtC+khBuVYaEzAC6
	yY++GDxyUh93v1CNhSTDBoF3w3dFYQwWD/tlw=
MIME-Version: 1.0
Received: by 10.216.145.221 with SMTP id p71mr4556141wej.9.1301409772942; Tue,
	29 Mar 2011 07:42:52 -0700 (PDT)
Received: by 10.216.47.85 with HTTP; Tue, 29 Mar 2011 07:42:52 -0700 (PDT)
Date: Tue, 29 Mar 2011 10:42:52 -0400
Message-ID: <AANLkTinP4siOKUVwTs5_P-Cu6Cv9MxUu_HQJXQ6PpMKX@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: OE weekly changelog for master, 2011-03-21 to 2011-03-28
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
X-List-Received-Date: Tue, 29 Mar 2011 14:46:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for master, 2011-03-21 to 2011-03-28

Bruce Ashfield (1):
  linux-yocto: update to 2.6.37.5

Chris Larson (8):
  poky-init-build-env: unbork for zsh
  native: empty PACKAGES_DYNAMIC the way we do PACKAGES
  scripts/bitbake: add -g/--graphviz to NO_BUILD_OPTS
  Shift a few env bits into scripts/bitbake
  oe.utils: add bb, bb.data imports
  oe.patch: add missing imports
  oe.path: sync up with current OE
  oe.utils: add inherits (sync from OE)

Darren Hart (1):
  kernel/bbclass: rework kernel and module classes to allow for building out-o

Kang Kai (1):
  msmtp: add link sendmail for lsb command check

Khem Raj (8):
  lib/oe/patch.py: Cosmetic change to avoid bitbake warning
  scripts/poky-qemu-internal: Pass -m <mem_size> always on commandline
  scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs boots as well
  perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha
  bitbake.conf: Prune global OPTIMIZATION flags
  machine/include/tune-atom.inc: Remove FULL_OPTIMIZATION_pn-gtk+
  gcc-runtime_4.5.1.bb: Fix ICE in gcc-runtime with -feliminate-dwarf2-dups
  qemu: Upgrade 0.13.0 -> 0.14.0

Koen Kooi (4):
  alsa-lib: extend to -native for qemu-native
  qemu: enabling the alsa driver needs alsa in DEPENDS, add it
  kernel.bbclass: blacklist 'kernel-misc' from kernel-modules
  gnutls: add BBCLASSEXTEND = native

Martin Jansa (2):
  bitbake.conf: replace unused/broken E_CVS/E_URI with E_MIRROR/E_SVN used in
  sstate: use only unique set of SSTATETASK

Paul Eggleton (1):
  README.hardware: add Freescale MPC8315E-RDB; other minor tweaks

Richard Purdie (6):
  bitbake.conf/tune files: Adjust PACKAGE_EXTEA_ARCHS
  image.bbclass: Improve readability of the image generation code
  image.bbclass: Move ROOTFS_SIZE into runimagecmd() function
  base-files: Remove sysctl.conf file. This is now provided by the procpc reci
  bitbake.conf/image.bbclass: Move image type information into image_types.bbc
  image_types.bbclass: Drop IMAGE_EXTRA_OPTION in favour of the more standard

Scott Rifenbark (3):
  documentation/yocto-project-qs/yocto-project-qs.xml: Bug reference added cou
  documentation/yocto-project-qs/yocto-project-qs.xml:  [BUGID# 931] - Removed
  documentation/adt-manual/adt-prepare.xml: Added instruction for building ADT

Tom Rini (8):
  net-tools: Switch to using DEBIAN_MIRROR
  Various: Switch to GNOME_MIRROR
  Various: Switch to using GNU_MIRROR
  Various: Switch to KERNELORG_MIRROR
  Various: Update KERNELORG_MIRROR for consistency
  Various: Switch to SOURCEFORGE_MIRROR
  checksums.ini: Delete
  coreutils: Switch to disabling gmp support


-- 
=================
http://bec-systems.com


