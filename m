Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1147D2D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:40:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:02 -0800
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="201485220"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.245])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:39:59 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 19:38:59 +0800
Message-Id: <cover.1574422359.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 00/15] zeus review/pull request
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
X-List-Received-Date: Fri, 22 Nov 2019 11:40:02 -0000
Content-Transfer-Encoding: 8bit

zeus patch queue for review. a-full build passing on autobuilder.

Thanks,

Anuj

The following changes since commit 0275e68b0576cdefc19718e4b1977044f9f43f48:

  iputils: Whitelist CVE-2000-1213 CVE-2000-1214 (2019-11-19 00:24:22 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib anujm/zeus

Adrian Bunk (1):
  lz4: Whitelist CVE-2014-4715

Alexander Kanavin (2):
  Revert "devtool/standard.py: Not filtering devtool workspace for
    devtool finish"
  python: update to 2.7.17

Anuj Mittal (1):
  boost: fix build for x32

Kai Kang (1):
  bind: fix CVE-2019-6471 and CVE-2018-5743

Ross Burton (9):
  libsoup: set CVE_PRODUCT
  cve-check: we don't actually need to unpack to check
  cve-update-db-native: don't refresh more than once an hour
  cve-update-db-native: don't hardcode the database name
  cve-update-db-native: add an index on the CVE ID column
  cve-update-db-native: clean up proxy handling
  cve-check: rewrite look to fix false negatives
  cve-check: neaten get_cve_info
  cve-check: fetch CVE data once at a time instead of in a single call

Zheng Ruoqin (1):
  tiff: Refresh patch

 meta/classes/cve-check.bbclass                |  98 +-
 .../bind/0001-bind-fix-CVE-2019-6471.patch    |  64 ++
 ...01-fix-enforcement-of-tcp-clients-v1.patch |  60 ++
 ...p-clients-could-still-be-exceeded-v2.patch | 670 +++++++++++++
 ...rence-counter-for-pipeline-groups-v3.patch | 278 ++++++
 ...accounting-and-client-mortality-chec.patch | 512 ++++++++++
 ...a-and-pipeline-refs-allow-special-ca.patch | 911 ++++++++++++++++++
 ...allowance-for-tcp-clients-interfaces.patch |  80 ++
 ...perations-in-bin-named-client.c-with.patch | 140 +++
 .../bind/bind_9.11.5-P4.bb                    |   8 +
 .../recipes-core/meta/cve-update-db-native.bb |  44 +-
 ...-fix-one-do_populate_sysroot-warning.patch |  25 +-
 ...tive_2.7.16.bb => python-native_2.7.17.bb} |   2 +-
 meta/recipes-devtools/python/python.inc       |  10 +-
 ...nt-parse-domains-containing-GH-13079.patch |  90 --
 ...cape-the-server-title-of-DocXMLRPCSe.patch | 101 --
 ...Resolve-intermediate-staging-issues.patch} |  53 +-
 .../python/python/CVE-2018-20852.patch        | 123 ---
 .../python/python/CVE-2019-9740.patch         | 216 -----
 .../python/bpo-35907-cve-2019-9948-fix.patch  |  55 --
 .../python/bpo-35907-cve-2019-9948.patch      |  55 --
 .../python/bpo-36216-cve-2019-9636-fix.patch  |  28 -
 .../python/bpo-36216-cve-2019-9636.patch      | 111 ---
 .../python/bpo-36742-cve-2019-10160.patch     |  81 --
 .../{python_2.7.16.bb => python_2.7.17.bb}    |   3 -
 .../libtiff/tiff/CVE-2019-7663.patch          |  71 +-
 ...01-dont-setup-compiler-flags-m32-m64.patch |  42 +
 meta/recipes-support/boost/boost_1.71.0.bb    |   1 +
 .../libsoup/libsoup-2.4_2.66.2.bb             |   2 +
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   3 +
 scripts/lib/devtool/standard.py               |   2 +-
 31 files changed, 2911 insertions(+), 1028 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
 rename meta/recipes-devtools/python/{python-native_2.7.16.bb => python-native_2.7.17.bb} (97%)
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
 rename meta/recipes-devtools/python/python/{builddir.patch => 0001-python-Resolve-intermediate-staging-issues.patch} (58%)
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2018-20852.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2019-9740.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
 rename meta/recipes-devtools/python/{python_2.7.16.bb => python_2.7.17.bb} (97%)
 create mode 100644 meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch

-- 
2.21.0


