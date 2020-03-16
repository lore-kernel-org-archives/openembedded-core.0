Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 7D42E60867
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 16:31:25 +0000 (UTC)
IronPort-SDR: PjmBpYdJg6E3LmNVyFfutUilQTDjVSUwXwI4A4DMV7IrFLSqobKiqupI9wKP8j6hd1thfUupXG
	jF8YB88pFeqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Mar 2020 09:31:26 -0700
IronPort-SDR: 5DfmcooilmEGeiF0LWN/uy2XCZQqg/TYk52LlIzRUNtFP30AjTkkABnL6Ict1MqRaeCD/ZD46h
	zC39m1uxuYFQ==
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; d="scan'208";a="390745589"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.148.157])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:31:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:30:58 +0800
Message-Id: <cover.1584375668.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH][zeus 0/7] zeus review
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
X-List-Received-Date: Mon, 16 Mar 2020 16:31:25 -0000
Content-Transfer-Encoding: 8bit

This series includes some CVE fixes for zeus. Please review.

Thanks,

Anuj

The following changes since commit d8cfc309f9dd0dc8904ab18e5898770502ee2540:

  cve-check: fix ValueError (2020-03-15 13:33:19 -0700)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

Adrian Bunk (1):
  python3: Upgrade 3.7.6 -> 3.7.7

Anuj Mittal (1):
  bluez: fix CVE-2020-0556

Lee Chee Yang (2):
  qemu: fix CVE-2019-20382
  libpcre2: fix CVE-2019-20454

Ross Burton (1):
  sqlite: fix numerous CVEs

Stefan Ghinea (1):
  aspell: CVE-2019-20433

Wenlin Kang (1):
  libarchive: Fix CVE-2020-9308

 meta/recipes-connectivity/bluez5/bluez5.inc   |    2 +
 .../bluez5/bluez5/CVE-2020-0556-1.patch       |   35 +
 .../bluez5/bluez5/CVE-2020-0556-2.patch       |  143 +++
 .../{python3_3.7.6.bb => python3_3.7.7.bb}    |    6 +-
 meta/recipes-devtools/qemu/qemu.inc           |    1 +
 .../qemu/qemu/CVE-2019-20382.patch            | 1018 +++++++++++++++++
 ...ct-files-that-declare-invalid-header.patch |  124 ++
 .../libarchive/libarchive_3.4.0.bb            |    1 +
 .../aspell/aspell/CVE-2019-20433-0001.patch   |  999 ++++++++++++++++
 .../aspell/aspell/CVE-2019-20433-0002.patch   |   68 ++
 meta/recipes-support/aspell/aspell_0.60.7.bb  |    2 +
 .../libpcre/libpcre2/CVE-2019-20454.patch     |   19 +
 .../recipes-support/libpcre/libpcre2_10.33.bb |    1 +
 .../sqlite/sqlite3/CVE-2019-19244.patch       |   33 +
 .../sqlite/sqlite3/CVE-2019-19923.patch       |   50 +
 .../sqlite/sqlite3/CVE-2019-19924.patch       |   65 ++
 .../sqlite/sqlite3/CVE-2019-19925.patch       |   33 +
 .../sqlite/sqlite3/CVE-2019-19926.patch       |   31 +
 .../sqlite/sqlite3/CVE-2019-19959.patch       |   46 +
 .../sqlite/sqlite3/CVE-2019-20218.patch       |   31 +
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |   10 +-
 21 files changed, 2714 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch
 rename meta/recipes-devtools/python/{python3_3.7.6.bb => python3_3.7.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-20382.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-RAR5-reader-reject-files-that-declare-invalid-header.patch
 create mode 100644 meta/recipes-support/aspell/aspell/CVE-2019-20433-0001.patch
 create mode 100644 meta/recipes-support/aspell/aspell/CVE-2019-20433-0002.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch

-- 
2.24.1


