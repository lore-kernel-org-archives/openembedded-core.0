Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBB865DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989738"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:48 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:25 -0800
Message-Id: <cover.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 00/19] Initial package upgrades for 1.8
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Richard, Ross:

Here is a set of updates that I have tested on the Autobuilder and 
done local touch test with also.

Thanks
	Sau!

The following changes since commit dd93b3a950d063f4e3020362c636006f51fb5782:

  image_types.bbclass: whitespace and reorder (2014-11-06 16:41:38 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (19):
  libcap: Upgrade to 2.24
  btrfs: Update to 3.17 version
  npth: Upgrade to 1.0
  liburcu: Ugrade to 0.8.5
  libgcrypt: Ugrade to 1.6.2
  libksba: Ugrade to 1.3.1
  curl Ugrade to 7.38
  systemtap: Upgrade to 2.6 Git Version
  babeltrace: Upgrade to 1.2.3
  libxkbcommon: Upgrade to 0.5.0
  resolvconf: Upgrade to 1.76
  at: Upgrade to 3.1.16
  cups: Upgrade to 2.0.0
  help2man: Upgrade to 1.46.4
  hdparm: Upgrade to 9.45
  less: Upgrade to 470
  lsbinitscripts: Upgrade to 9.56.1
  man-pages: Upgrade to 3.75
  watchdog: Upgrade to 5.14

 .../{resolvconf_1.75.bb => resolvconf_1.76.bb}     |   4 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |   6 +-
 ...-native_1.46.1.bb => help2man-native_1.46.4.bb} |   4 +-
 .../at/{at_3.1.15.bb => at_3.1.16.bb}              |   4 +-
 meta/recipes-extended/cups/cups.inc                |   1 -
 .../0001-don-t-try-to-run-generated-binaries.patch |  35 ++-
 .../cups/cups/cups-no-gcrypt.patch                 |  49 ----
 meta/recipes-extended/cups/cups_1.7.5.bb           |   6 -
 meta/recipes-extended/cups/cups_2.0.0.bb           |   6 +
 .../hdparm/{hdparm_9.43.bb => hdparm_9.45.bb}      |   4 +-
 .../less/{less_466.bb => less_470.bb}              |   4 +-
 ...nitscripts_9.55.bb => lsbinitscripts_9.56.1.bb} |   6 +-
 .../{man-pages_3.71.bb => man-pages_3.75.bb}       |   4 +-
 .../{files => watchdog}/fix-ping-failure.patch     |  56 +++--
 .../watchdog/{files => watchdog}/fixsepbuild.patch |   0
 .../{watchdog_5.13.bb => watchdog_5.14.bb}         |   5 +-
 ...libxkbcommon_0.4.3.bb => libxkbcommon_0.5.0.bb} |   6 +-
 ...-Support-out-of-tree-builds-in-babeltrace.patch |  17 --
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |  54 -----
 .../{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb}   |   9 +-
 .../systemtap/tapset-linux-sendfile-syscall.patch  |  22 --
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   5 +-
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 ---------------------
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |  69 ------
 .../curl/{curl_7.37.1.bb => curl_7.38.0.bb}        |   8 +-
 .../libcap/libcap/fix-CAP_LAST_CAP.patch           |  39 ---
 meta/recipes-support/libcap/libcap_2.22.bb         |   6 -
 .../libcap/{libcap.inc => libcap_2.24.bb}          |  12 +-
 ...ibgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch | 169 -------------
 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb  |   6 -
 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb  |   4 +
 .../libksba/{libksba_1.3.0.bb => libksba_1.3.1.bb} |   5 +-
 .../liburcu/{liburcu_0.8.4.bb => liburcu_0.8.5.bb} |   4 +-
 .../npth/{npth_0.91.bb => npth_1.0.bb}             |   5 +-
 34 files changed, 108 insertions(+), 795 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.75.bb => resolvconf_1.76.bb} (92%)
 rename meta/recipes-devtools/help2man/{help2man-native_1.46.1.bb => help2man-native_1.46.4.bb} (79%)
 rename meta/recipes-extended/at/{at_3.1.15.bb => at_3.1.16.bb} (93%)
 delete mode 100644 meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
 delete mode 100644 meta/recipes-extended/cups/cups_1.7.5.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.0.0.bb
 rename meta/recipes-extended/hdparm/{hdparm_9.43.bb => hdparm_9.45.bb} (88%)
 rename meta/recipes-extended/less/{less_466.bb => less_470.bb} (88%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.55.bb => lsbinitscripts_9.56.1.bb} (78%)
 rename meta/recipes-extended/man-pages/{man-pages_3.71.bb => man-pages_3.75.bb} (86%)
 rename meta/recipes-extended/watchdog/{files => watchdog}/fix-ping-failure.patch (58%)
 rename meta/recipes-extended/watchdog/{files => watchdog}/fixsepbuild.patch (100%)
 rename meta/recipes-extended/watchdog/{watchdog_5.13.bb => watchdog_5.14.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.3.bb => libxkbcommon_0.5.0.bb} (73%)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb} (73%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch
 rename meta/recipes-support/curl/{curl_7.37.1.bb => curl_7.38.0.bb} (90%)
 delete mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
 delete mode 100644 meta/recipes-support/libcap/libcap_2.22.bb
 rename meta/recipes-support/libcap/{libcap.inc => libcap_2.24.bb} (80%)
 delete mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
 rename meta/recipes-support/libksba/{libksba_1.3.0.bb => libksba_1.3.1.bb} (85%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.4.bb => liburcu_0.8.5.bb} (83%)
 rename meta/recipes-support/npth/{npth_0.91.bb => npth_1.0.bb} (78%)

-- 
1.8.3.1


