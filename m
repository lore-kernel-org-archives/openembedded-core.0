Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBC286025F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:47:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O9l7Rk026992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:47:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Jul 2017 02:47:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 17:51:07 +0800
Message-ID: <cover.1500889785.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Package Upgrade: pciutils, diffutils, cups, sudo, sysstat, dbus
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
X-List-Received-Date: Mon, 24 Jul 2017 09:47:07 -0000
Content-Type: text/plain

The following changes since commit 0f20512deac20f3ec7241ff431c8523ce3c66034:

  poky: Remove machine specific kernel overrides (2017-07-24 09:13:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20170724
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20170724

Chen Qi (6):
  pciutils: upgrade to 3.5.5
  diffutils: upgrade to 3.6
  cups: upgrade to 2.2.4
  sudo: upgrade to 1.8.20p2
  sysstat: upgrade to 11.5.7
  dbus/dbus-test: upgrade to 1.10.20

 .../{pciutils_3.5.4.bb => pciutils_3.5.5.bb}       |   4 +-
 .../{dbus-test_1.10.18.bb => dbus-test_1.10.20.bb} |   4 +-
 .../dbus/{dbus_1.10.18.bb => dbus_1.10.20.bb}      |   4 +-
 .../cups/{cups_2.2.3.bb => cups_2.2.4.bb}          |   4 +-
 .../diffutils-3.5/diffutils-3.5-gcc7.patch         | 228 ---------------------
 ...need_charset_alias-when-building-for-musl.patch |   0
 .../0001-explicitly-disable-replacing-getopt.patch |  30 +++
 .../{diffutils-3.5 => diffutils-3.6}/run-ptest     |   0
 .../{diffutils_3.5.bb => diffutils_3.6.bb}         |  14 +-
 meta/recipes-extended/sudo/sudo.inc                |   2 +-
 .../sudo/{sudo_1.8.19p2.bb => sudo_1.8.20p2.bb}    |   4 +-
 .../{sysstat_11.5.6.bb => sysstat_11.5.7.bb}       |   4 +-
 12 files changed, 47 insertions(+), 251 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.4.bb => pciutils_3.5.5.bb} (92%)
 rename meta/recipes-core/dbus/{dbus-test_1.10.18.bb => dbus-test_1.10.20.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.18.bb => dbus_1.10.20.bb} (97%)
 rename meta/recipes-extended/cups/{cups_2.2.3.bb => cups_2.2.4.bb} (40%)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.5/diffutils-3.5-gcc7.patch
 rename meta/recipes-extended/diffutils/{diffutils-3.5 => diffutils-3.6}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
 rename meta/recipes-extended/diffutils/{diffutils-3.5 => diffutils-3.6}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.5.bb => diffutils_3.6.bb} (66%)
 rename meta/recipes-extended/sudo/{sudo_1.8.19p2.bb => sudo_1.8.20p2.bb} (90%)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.6.bb => sysstat_11.5.7.bb} (53%)

-- 
1.9.1


