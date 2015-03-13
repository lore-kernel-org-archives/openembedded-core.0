Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id D896B732F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 18:00:29 +0000 (UTC)
Received: by wesw55 with SMTP id w55so24984736wes.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UMU5LZi5CSEbbTC+fQSHV/YZGWhpKkBS88p9yVrGzw0=;
	b=kL7WMcJAJUZJzl9g501GxldB8AOmkWyFFrXiOd3R/QVYwI3G6ZcQyg2maeGQeSPxcq
	URqIrEncN0SPx9YO1ROaXQ8WKrCM0MJJpusdPjDL9bhOJ8nAoi5KkmBFu5Tu6gfu8//e
	LsADEJjH+sZ/lT/lRiP8LrbutiFyZglT77bYpjqTVkKJOUGb/UlKoOAkgA8F6P7EklLA
	A/5kk+CsNLiC+hnSjq+ekpFghjiU7eQkjP8z1i9w9wp5gkTPhyippCP8vSRpbpL0TKT0
	yfoDO1+OHNpClZhq5pkzxgCMmlvjiD0DrQ4X5HgItblwZd/ggarPVSgTn+rqg1fqaZ3V
	qXnA==
X-Gm-Message-State: ALoCoQmd1iMn1O5siede/1yrpC8bI++vXGt4RU6X+tAZruTOX7JDxVq3OJcLhh6bLVQfjOHtDHZA
X-Received: by 10.180.78.136 with SMTP id b8mr101737842wix.6.1426269630817;
	Fri, 13 Mar 2015 11:00:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hd10sm3788404wib.7.2015.03.13.11.00.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 11:00:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 17:57:44 +0000
Message-Id: <cover.1426268502.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/42] Consolidated pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 18:00:31 -0000

Hi,

A nice long consolidated pull that is all green on the AB apart from an
intermittent x86-64 inability to run df which I don't think is related to this
series and will investigate shortly.

Ross

The following changes since commit 7f30749fe026e9ceb75d73b89271145a45a60763:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:50:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 04a5d9f1426d1b6cd7d6fc926bdc572e0b223e2c:

  systemd: fix /var/log/journal ownership (2015-03-13 17:22:38 +0000)

----------------------------------------------------------------
Alexandru.Vaduva (1):
      linux-yocto-rt: removed duplicated line

Andre McCurdy (2):
      chrpath.bbclass: handle RUNPATH as well as RPATH
      curl: remove samba from PACKAGECONFIG[smb] DEPENDS

Benjamin Esquivel (1):
      oe-setup-builddir: output message cleanup

Chen Qi (4):
      bitbake-diffsigs: consider the situation where sigdata and siginfo files having the same hash values
      nativesdk.bbclass: set PKGDATA_DIR explicitly
      rootfs.py: fix logic error so that warnings are checked
      util-linux: fix CVE-2014-9114

Ed Bartosh (1):
      yocto-project-qs: update OpenSUSE essentials

Jonathan Liu (5):
      postinst-intercepts/update_font_cache: fix ownership of fontconfig cache
      fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
      libunwind: backport patch to link against libgcc_s intead of libgcc
      kernel-devsrc: fix file ownership
      systemd: fix /var/log/journal ownership

Kai Kang (2):
      lsb: update init-functions and remove sendmail
      msmtp: add link file /usr/lib/sendmail

Khem Raj (1):
      buildstats.bbclass: typecast argument to os.minor/os.major to long

Koen Kooi (2):
      bitbake.conf: use http:// for GNU_MIRROR instead of ftp://
      sysprof: fix arm big-endian build.

Martin Jansa (2):
      test-dependencies.sh: strip only .bb suffix
      util-linux: move getopt u-a link to base_bindir

Mehaffey, John (1):
      lttng: Add tracing group when building lttng-tools

Randy Witt (2):
      lib/oeqa/runtime/systemd: Add a basic runtime test for the journal
      systemd: Fix journal "Failed to set file attributes:" warning

Rob Woolley (3):
      nfs-utils: Install nfsmount.conf
      nfs-utils: Identify CONFFILES
      logrotate: Identify CONFFILES

Robert Yang (11):
      license.bbclass: set dirs for do_populate_lic_setscene
      kernelsrc.bbclass: fix KERNEL_VERSION
      pixbufcache.bbclass: add harfbuzz-native to PIXBUFCACHE_SYSROOT_DEP
      xinetd: fix HOMEPAGE and SRC_URI
      libevent: fix SRC_URI
      apt: fix SRC_URI
      net-tools: fix SRC_URI
      resolvconf: fix SRC_URI
      mtd-utils: disable parallel build
      Revert "blktrace: fix and enable parallel build"
      mailx: disable parallel build

Ross Burton (3):
      devshell: allow the starting directory to be overridden
      liberation-fonts: inherit allarch as fonts are arch-independent
      util-linux: split libraries dynamically

Sona Sarmadi (1):
      e2fsprogs: CVE-2015-0247

 bitbake/bin/bitbake-diffsigs                       |   18 +-
 documentation/poky.ent                             |    2 +-
 meta/classes/buildstats.bbclass                    |    4 +-
 meta/classes/chrpath.bbclass                       |    2 +
 meta/classes/devshell.bbclass                      |    4 +-
 meta/classes/fontcache.bbclass                     |    4 +-
 meta/classes/kernelsrc.bbclass                     |    2 +-
 meta/classes/license.bbclass                       |    2 +
 meta/classes/nativesdk.bbclass                     |    1 +
 meta/classes/pixbufcache.bbclass                   |    7 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oe/rootfs.py                              |    2 +-
 meta/lib/oeqa/runtime/systemd.py                   |    6 +
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   10 ++
 .../resolvconf/resolvconf_1.76.bb                  |    3 +-
 ...ix-Inappropriate-ioctl-for-device-on-ext4.patch |   37 +++++
 meta/recipes-core/systemd/systemd_219.bb           |    3 +
 meta/recipes-core/util-linux/util-linux.inc        |   21 ++-
 .../util-linux/util-linux/CVE-2014-9114.patch      |  174 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.25.2.bb  |    1 +
 meta/recipes-devtools/apt/apt.inc                  |    2 +-
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        |   58 +++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    1 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    4 +
 meta/recipes-extended/logrotate/logrotate_3.8.8.bb |    3 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |   16 +-
 meta/recipes-extended/mailx/mailx_12.5.bb          |    5 +
 meta/recipes-extended/msmtp/msmtp_1.6.1.bb         |    5 +
 .../net-tools/net-tools_1.60-25.bb                 |    4 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    9 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
 .../blktrace/blktrace/makefile-fix-parallel.patch  |   41 -----
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   17 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb         |    2 +
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |    1 -
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |    5 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 +
 meta/recipes-support/curl/curl_7.40.0.bb           |    2 +-
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    2 +-
 ...-libunwind-to-libgcc_s-rather-than-libgcc.patch |   42 +++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 scripts/oe-setup-builddir                          |   32 ++--
 scripts/postinst-intercepts/update_font_cache      |    1 +
 scripts/test-dependencies.sh                       |    2 +-
 44 files changed, 457 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch

Alexandru.Vaduva (1):
  linux-yocto-rt: removed duplicated line

Andre McCurdy (2):
  chrpath.bbclass: handle RUNPATH as well as RPATH
  curl: remove samba from PACKAGECONFIG[smb] DEPENDS

Benjamin Esquivel (1):
  oe-setup-builddir: output message cleanup

Chen Qi (4):
  bitbake-diffsigs: consider the situation where sigdata and siginfo
    files having the same hash values
  nativesdk.bbclass: set PKGDATA_DIR explicitly
  rootfs.py: fix logic error so that warnings are checked
  util-linux: fix CVE-2014-9114

Ed Bartosh (1):
  yocto-project-qs: update OpenSUSE essentials

Jonathan Liu (5):
  postinst-intercepts/update_font_cache: fix ownership of fontconfig
    cache
  fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
  libunwind: backport patch to link against libgcc_s intead of libgcc
  kernel-devsrc: fix file ownership
  systemd: fix /var/log/journal ownership

Kai Kang (2):
  lsb: update init-functions and remove sendmail
  msmtp: add link file /usr/lib/sendmail

Khem Raj (1):
  buildstats.bbclass: typecast argument to os.minor/os.major to long

Koen Kooi (2):
  bitbake.conf: use http:// for GNU_MIRROR instead of ftp://
  sysprof: fix arm big-endian build.

Martin Jansa (2):
  test-dependencies.sh: strip only .bb suffix
  util-linux: move getopt u-a link to base_bindir

Mehaffey, John (1):
  lttng: Add tracing group when building lttng-tools

Randy Witt (2):
  lib/oeqa/runtime/systemd: Add a basic runtime test for the journal
  systemd: Fix journal "Failed to set file attributes:" warning

Rob Woolley (3):
  nfs-utils: Install nfsmount.conf
  nfs-utils: Identify CONFFILES
  logrotate: Identify CONFFILES

Robert Yang (11):
  license.bbclass: set dirs for do_populate_lic_setscene
  kernelsrc.bbclass: fix KERNEL_VERSION
  pixbufcache.bbclass: add harfbuzz-native to PIXBUFCACHE_SYSROOT_DEP
  xinetd: fix HOMEPAGE and SRC_URI
  libevent: fix SRC_URI
  apt: fix SRC_URI
  net-tools: fix SRC_URI
  resolvconf: fix SRC_URI
  mtd-utils: disable parallel build
  Revert "blktrace: fix and enable parallel build"
  mailx: disable parallel build

Ross Burton (3):
  devshell: allow the starting directory to be overridden
  liberation-fonts: inherit allarch as fonts are arch-independent
  util-linux: split libraries dynamically

Sona Sarmadi (1):
  e2fsprogs: CVE-2015-0247

 bitbake/bin/bitbake-diffsigs                       |   18 +-
 documentation/poky.ent                             |    2 +-
 meta/classes/buildstats.bbclass                    |    4 +-
 meta/classes/chrpath.bbclass                       |    2 +
 meta/classes/devshell.bbclass                      |    4 +-
 meta/classes/fontcache.bbclass                     |    4 +-
 meta/classes/kernelsrc.bbclass                     |    2 +-
 meta/classes/license.bbclass                       |    2 +
 meta/classes/nativesdk.bbclass                     |    1 +
 meta/classes/pixbufcache.bbclass                   |    7 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oe/rootfs.py                              |    2 +-
 meta/lib/oeqa/runtime/systemd.py                   |    6 +
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   10 ++
 .../resolvconf/resolvconf_1.76.bb                  |    3 +-
 ...ix-Inappropriate-ioctl-for-device-on-ext4.patch |   37 +++++
 meta/recipes-core/systemd/systemd_219.bb           |    3 +
 meta/recipes-core/util-linux/util-linux.inc        |   21 ++-
 .../util-linux/util-linux/CVE-2014-9114.patch      |  174 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.25.2.bb  |    1 +
 meta/recipes-devtools/apt/apt.inc                  |    2 +-
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        |   58 +++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    1 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    4 +
 meta/recipes-extended/logrotate/logrotate_3.8.8.bb |    3 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |   16 +-
 meta/recipes-extended/mailx/mailx_12.5.bb          |    5 +
 meta/recipes-extended/msmtp/msmtp_1.6.1.bb         |    5 +
 .../net-tools/net-tools_1.60-25.bb                 |    4 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    9 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
 .../blktrace/blktrace/makefile-fix-parallel.patch  |   41 -----
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   17 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb         |    2 +
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |    1 -
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |    5 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 +
 meta/recipes-support/curl/curl_7.40.0.bb           |    2 +-
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    2 +-
 ...-libunwind-to-libgcc_s-rather-than-libgcc.patch |   42 +++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 scripts/oe-setup-builddir                          |   32 ++--
 scripts/postinst-intercepts/update_font_cache      |    1 +
 scripts/test-dependencies.sh                       |    2 +-
 44 files changed, 457 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch

-- 
1.7.10.4


