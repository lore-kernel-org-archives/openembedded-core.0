Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UHRer-00033I-JF
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 05:26:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Mar 2013 21:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,861,1355126400"; d="scan'208";a="272150762"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.246])
	by azsmga001.ch.intel.com with ESMTP; 17 Mar 2013 21:09:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Mar 2013 21:09:57 -0700
Message-Id: <cover.1363579670.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/31] Final Updates and Patches for 1.4
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
X-List-Received-Date: Mon, 18 Mar 2013 04:27:05 -0000

Richard,

Here is a set of tested patches for 1.4, I have reviewed then and done 
some basic testing on some of them.

Nothing in this group really raises any flags for me.  Please take a look
and let me know if you have any issues.

Thanks
	Sau!


The following changes since commit 6093fe2694ac5300feaa38fe2eb898ea843f92ee:

  util-linux: Update License Information (remove GPLv3 Licnese) (2013-03-16 17:18:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (1):
  documentation.conf: remove unused variable QA_LOG

Chase Maupin (1):
  kernel bbclass: return to original directory in do_deploy

Chen Qi (1):
  rm_work.bbclass: inhibit rm_work per recipe

Colin Walters (1):
  cracklib: Generate compiled dict using default dictionary

Cristian Iorga (1):
  linux-firmware: upgrade to git HEAD
    c530a75c1e6a472b0eb9558310b518f0dfcd8860

Felipe F. Tonello (2):
  qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
  qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has
    pulseaudio

Kevin Strasser (2):
  archive-*-source.bbclass: fix scripts_with_logs build error
  archiver: fix archive filtering behavior

Khem Raj (1):
  sudo: Compile mksigname and mksiglist for build host

Marcin Juszkiewicz (1):
  nss-myhostname: add 0.3 version

Radu Moisan (13):
  rxvt-unicode: Upgrade to v9.17
  gawk: Upgrade to v4.0.2
  ed: Upgrade to v1.7
  u-boo-fw-utils: Upgrade to v2013.01.01
  u-boot-mkimage: Upgrade to v2013.01.01
  u-boot: Upgrade to v2013.01.01
  hdparm: Upgrade to v9.43
  cronie: Upgrade to v1.4.9
  systemtap: Upgrade to v2.1
  liburcu: Upgrade to v0.7.6
  babeltrace: Upgrade to v1.0.3
  apr-util: Upgrade to v1.5.1
  mobile-broadband-provider-info: Upgrade to v20120614

Saul Wold (5):
  man-pages: Update to 3.50
  lsbinitscripts: Update to 9.45
  sysstat: Update to 10.1.4
  libenv-perl: Update to 1.04
  pigz: Update to 2.3

Tom Zanussi (1):
  perf: bump PE

wenzong.fan@windriver.com (1):
  layer.conf: Add LAYERVERSION and LAYERDEPENDS

 meta-hob/conf/layer.conf                           |   6 +++++
 meta-skeleton/conf/layer.conf                      |   5 +++++
 meta/classes/archive-configured-source.bbclass     |  15 +++++++++----
 meta/classes/archive-original-source.bbclass       |  15 +++++++++----
 meta/classes/archive-patched-source.bbclass        |  15 +++++++++----
 meta/classes/archiver.bbclass                      |  13 +----------
 meta/classes/kernel.bbclass                        |   1 +
 meta/classes/rm_work.bbclass                       |  13 +++++++++++
 meta/conf/documentation.conf                       |   3 ---
 ...2012.04.01.bb => u-boot-fw-utils_2013.01.01.bb} |   6 ++---
 ..._2012.04.01.bb => u-boot-mkimage_2013.01.01.bb} |   6 ++---
 .../{u-boot_2012.04.01.bb => u-boot_2013.01.01.bb} |   8 +++----
 .../mobile-broadband-provider-info_git.bb          |   4 ++--
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |   9 +++++++-
 .../cronie/{cronie_1.4.8.bb => cronie_1.4.9.bb}    |   6 ++---
 .../ed/{ed-1.6 => ed-1.7}/ed-1.2-build.patch       |   0
 meta/recipes-extended/ed/{ed_1.6.bb => ed_1.7.bb}  |   4 ++--
 .../gawk/{gawk_4.0.1.bb => gawk_4.0.2.bb}          |   6 ++---
 .../hdparm/{hdparm_9.39.bb => hdparm_9.43.bb}      |   6 ++---
 ...binitscripts_9.44.bb => lsbinitscripts_9.45.bb} |   6 ++---
 .../{man-pages_3.47.bb => man-pages_3.50.bb}       |   4 ++--
 meta/recipes-extended/pigz/files/ldflags.patch     |  18 ++++++++-------
 .../pigz/{pigz_2.2.5.bb => pigz_2.3.bb}            |   7 +++---
 meta/recipes-extended/sudo/sudo.inc                |   5 +++++
 .../{sysstat_10.1.3.bb => sysstat_10.1.4.bb}       |   6 ++---
 .../linux-firmware/linux-firmware_git.bb           |   3 +--
 .../{babeltrace_1.0.0.bb => babeltrace_1.0.3.bb}   |   2 +-
 meta/recipes-kernel/perf/perf.bb                   |   1 +
 .../systemtap/obsolete_automake_macros.patch       |  22 +++++-------------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   4 ++--
 .../{libenv-perl_1.03.bb => libenv-perl_1.04.bb}   |   6 ++---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   7 ++++--
 .../rxvt.desktop                                   |   0
 .../rxvt.png                                       | Bin
 .../xwc.patch                                      |   0
 .../{rxvt-unicode_9.15.bb => rxvt-unicode_9.17.bb} |   6 ++---
 .../apr/{apr-util_1.4.1.bb => apr-util_1.5.1.bb}   |   6 ++---
 .../liburcu/{liburcu_0.7.4.bb => liburcu_0.7.6.bb} |   6 ++---
 .../nss-myhostname/nss-myhostname_0.3.bb           |  25 +++++++++++++++++++++
 39 files changed, 169 insertions(+), 106 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2012.04.01.bb => u-boot-fw-utils_2013.01.01.bb} (84%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2012.04.01.bb => u-boot-mkimage_2013.01.01.bb} (84%)
 rename meta/recipes-bsp/u-boot/{u-boot_2012.04.01.bb => u-boot_2013.01.01.bb} (82%)
 rename meta/recipes-extended/cronie/{cronie_1.4.8.bb => cronie_1.4.9.bb} (94%)
 rename meta/recipes-extended/ed/{ed-1.6 => ed-1.7}/ed-1.2-build.patch (100%)
 rename meta/recipes-extended/ed/{ed_1.6.bb => ed_1.7.bb} (81%)
 rename meta/recipes-extended/gawk/{gawk_4.0.1.bb => gawk_4.0.2.bb} (86%)
 rename meta/recipes-extended/hdparm/{hdparm_9.39.bb => hdparm_9.43.bb} (87%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.44.bb => lsbinitscripts_9.45.bb} (78%)
 rename meta/recipes-extended/man-pages/{man-pages_3.47.bb => man-pages_3.50.bb} (82%)
 rename meta/recipes-extended/pigz/{pigz_2.2.5.bb => pigz_2.3.bb} (55%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.3.bb => sysstat_10.1.4.bb} (44%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.0.0.bb => babeltrace_1.0.3.bb} (94%)
 rename meta/recipes-lsb4/perl/{libenv-perl_1.03.bb => libenv-perl_1.04.bb} (72%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.15.bb => rxvt-unicode_9.17.bb} (93%)
 rename meta/recipes-support/apr/{apr-util_1.4.1.bb => apr-util_1.5.1.bb} (91%)
 rename meta/recipes-support/liburcu/{liburcu_0.7.4.bb => liburcu_0.7.6.bb} (77%)
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb

-- 
1.8.0.2



