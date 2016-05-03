Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A5B146FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2016 07:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="96341794"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 03 May 2016 07:49:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1B2D96A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:18 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:39 +0300
Message-Id: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 00/10] package version upgrades
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
X-List-Received-Date: Tue, 03 May 2016 14:49:45 -0000

Here are the initial list of package upgrades:

Maxin B. John (10):
  acpid: upgrade to 2.0.27
  ethtool: upgrade to 4.5
  pkgconfig: update to version 0.29.1
  libtasn1: upgrade to 4.8
  bluez5: upgrade to 5.39
  mc: upgrade to 4.8.16
  orc: upgrade to 0.4.25
  harfbuzz: upgrade to 1.2.6
  sqlite3: upgrade to 3.12.2
  iproute2: upgrade to version 4.5.0

 .../acpid/acpid/0001-Fix-out-of-source-build.patch | 46 ----------
 meta/recipes-bsp/acpid/acpid_2.0.26.bb             |  9 --
 meta/recipes-bsp/acpid/acpid_2.0.27.bb             |  7 ++
 meta/recipes-connectivity/bluez5/bluez5_5.37.bb    | 55 ------------
 meta/recipes-connectivity/bluez5/bluez5_5.39.bb    | 55 ++++++++++++
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    | 97 +++++++++-------------
 .../iproute2/iproute2-fix-building-with-musl.patch | 24 ------
 .../iproute2/iproute2_4.4.0.bb                     | 14 ----
 .../iproute2/iproute2_4.5.0.bb                     | 13 +++
 meta/recipes-devtools/orc/orc_0.4.24.bb            | 27 ------
 meta/recipes-devtools/orc/orc_0.4.25.bb            | 27 ++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  4 +-
 meta/recipes-extended/ethtool/ethtool_4.2.bb       | 30 -------
 meta/recipes-extended/ethtool/ethtool_4.5.bb       | 30 +++++++
 meta/recipes-extended/mc/mc_4.8.15.bb              | 49 -----------
 meta/recipes-extended/mc/mc_4.8.16.bb              | 49 +++++++++++
 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb   | 39 ---------
 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb   | 39 +++++++++
 meta/recipes-support/gnutls/libtasn1_4.7.bb        | 20 -----
 meta/recipes-support/gnutls/libtasn1_4.8.bb        | 20 +++++
 .../sqlite/sqlite3/fix-disable-static-shell.patch  | 61 --------------
 meta/recipes-support/sqlite/sqlite3_3.11.0.bb      | 11 ---
 meta/recipes-support/sqlite/sqlite3_3.12.2.bb      |  9 ++
 23 files changed, 288 insertions(+), 447 deletions(-)
 delete mode 100644 meta/recipes-bsp/acpid/acpid/0001-Fix-out-of-source-build.patch
 delete mode 100644 meta/recipes-bsp/acpid/acpid_2.0.26.bb
 create mode 100644 meta/recipes-bsp/acpid/acpid_2.0.27.bb
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.37.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.39.bb
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2_4.5.0.bb
 delete mode 100644 meta/recipes-devtools/orc/orc_0.4.24.bb
 create mode 100644 meta/recipes-devtools/orc/orc_0.4.25.bb
 delete mode 100644 meta/recipes-extended/ethtool/ethtool_4.2.bb
 create mode 100644 meta/recipes-extended/ethtool/ethtool_4.5.bb
 delete mode 100644 meta/recipes-extended/mc/mc_4.8.15.bb
 create mode 100644 meta/recipes-extended/mc/mc_4.8.16.bb
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
 delete mode 100644 meta/recipes-support/gnutls/libtasn1_4.7.bb
 create mode 100644 meta/recipes-support/gnutls/libtasn1_4.8.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.11.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.12.2.bb

-- 
2.4.0


