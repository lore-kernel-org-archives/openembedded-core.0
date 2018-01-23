Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E37427867B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="11959115"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 23 Jan 2018 06:04:08 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id DA9B25803BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:07 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:40 +0200
Message-Id: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 00/12] package upgrades
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:08 -0000

Package upgrades including gtk+3

Maxin B. John (12):
  freetype: upgrade to version 2.9
  libsoup-2.4: upgrade to version 2.61.2
  ofono: upgrade to version 1.22
  pango: upgrade to version 1.41.0
  libtasn1: upgrade to version 4.13
  puzzles: upgrade to latest commit
  sqlite3: upgrade to version 3.22.0
  vte: upgrade to version 0.50.2
  gtk+: upgrade to version 2.24.32
  gtk+3: upgrade to version 3.22.26
  gtk-icon-utils-native: upgrade to version 3.22.26
  atk: upgrade to version 2.26.1

 meta/recipes-connectivity/ofono/ofono_1.21.bb      |   8 --
 meta/recipes-connectivity/ofono/ofono_1.22.bb      |   8 ++
 .../gtk+/{gtk+3_3.22.24.bb => gtk+3_3.22.26.bb}    |   4 +-
 .../gtk+/{gtk+_2.24.31.bb => gtk+_2.24.32.bb}      |   4 +-
 ...3.22.17.bb => gtk-icon-utils-native_3.22.26.bb} |   4 +-
 .../{freetype_2.8.1.bb => freetype_2.9.bb}         |   6 +-
 ...op-introspection-macros-from-acinclude.m4.patch | 120 ---------------------
 .../pango/{pango_1.40.12.bb => pango_1.41.0.bb}    |   5 +-
 ...arify-conditions-to-avoid-compiler-errors.patch |  48 ---------
 meta/recipes-sato/puzzles/puzzles_git.bb           |   1 -
 .../atk/{atk_2.26.0.bb => atk_2.26.1.bb}           |   4 +-
 .../gnutls/libtasn1/CVE-2017-10790.patch           |  63 -----------
 .../gnutls/{libtasn1_4.12.bb => libtasn1_4.13.bb}  |   5 +-
 ...libsoup-2.4_2.60.2.bb => libsoup-2.4_2.61.2.bb} |   4 +-
 meta/recipes-support/sqlite/sqlite3_3.21.0.bb      |  10 --
 meta/recipes-support/sqlite/sqlite3_3.22.0.bb      |  10 ++
 .../vte/{vte_0.50.1.bb => vte_0.50.2.bb}           |   4 +-
 17 files changed, 37 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.21.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.22.bb
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.24.bb => gtk+3_3.22.26.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.31.bb => gtk+_2.24.32.bb} (90%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.17.bb => gtk-icon-utils-native_3.22.26.bb} (94%)
 rename meta/recipes-graphics/freetype/{freetype_2.8.1.bb => freetype_2.9.bb} (89%)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
 rename meta/recipes-graphics/pango/{pango_1.40.12.bb => pango_1.41.0.bb} (88%)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
 rename meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.26.1.bb} (78%)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.12.bb => libtasn1_4.13.bb} (80%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.60.2.bb => libsoup-2.4_2.61.2.bb} (89%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.21.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.22.0.bb
 rename meta/recipes-support/vte/{vte_0.50.1.bb => vte_0.50.2.bb} (91%)

-- 
2.4.0


