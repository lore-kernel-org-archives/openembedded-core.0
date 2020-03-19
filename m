Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AC67460592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 08:36:33 +0000 (UTC)
IronPort-SDR: A6LomLJUkJxry4UU1SXhJtuuHYzsN9MzS8vp9aPbsK0qRx++s+yla5i18wNI7BYnl3HaAjndZ8
	VsC2lHv3ZdzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Mar 2020 01:36:34 -0700
IronPort-SDR: /rlGjtqO4tU8q46WDbXV1/Sq8rhB1zJ8ttDI4LjSxmu3JWBmxtjbzjmTZ91oJQ8U7shBpe9XZJ
	8fs3jPn6Kf0A==
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="268664017"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.78.196])
	by fmsmga004-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 01:36:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 16:36:21 +0800
Message-Id: <cover.1584606859.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH][zeus 0/7] zeus pull request - cover letter only
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
X-List-Received-Date: Thu, 19 Mar 2020 08:36:33 -0000
Content-Transfer-Encoding: 8bit

Please pull these changes for zeus. Clean a-full on autobuilder.

Thanks,

Anuj

The following changes since commit d8cfc309f9dd0dc8904ab18e5898770502ee2540:

  cve-check: fix ValueError (2020-03-15 13:33:19 -0700)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

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
2.25.1


