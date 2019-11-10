Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4A27F941
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:54:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 06:54:35 -0800
X-IronPort-AV: E=Sophos;i="5.68,289,1569308400"; d="scan'208";a="197423049"
Received: from wkwak-mobl1.gar.corp.intel.com (HELO
	anmitta2-mobl1.gar.corp.intel.com) ([10.252.8.93])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 06:54:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:54:09 +0800
Message-Id: <20191110145416.5171-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/7] Consolidated zeus pull request
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
X-List-Received-Date: Sun, 10 Nov 2019 14:54:34 -0000
Content-Transfer-Encoding: 8bit

a-full passing on autobuilder for the series.

Adrian Bunk (1):
  python3: Upgrade 3.7.4 -> 3.7.5

Joe Slater (1):
  libxslt: fix CVE-2019-18197

Ross Burton (4):
  libpng: whitelist CVE-2019-17371
  procps: whitelist CVE-2018-1121
  libsndfile1: whitelist CVE-2018-13419
  libpam: set CVE_PRODUCT

Trevor Gamblin (1):
  libgcrypt: fix CVE-2019-13627

 ...lib-as-location-for-site-packages-an.patch |   2 +-
 ...nt-parse-domains-containing-GH-13079.patch | 132 ------------------
 ...asename-to-replace-CC-for-checking-c.patch |   2 +-
 .../{python3_3.7.4.bb => python3_3.7.5.bb}    |   5 +-
 meta/recipes-extended/pam/libpam_1.3.1.bb     |   2 +
 meta/recipes-extended/procps/procps_3.3.15.bb |   9 +-
 .../libpng/libpng_1.6.37.bb                   |   3 +
 .../libsndfile/libsndfile1_1.0.28.bb          |   4 +
 ...cdsa-Fix-use-of-nonce-use-larger-one.patch | 128 +++++++++++++++++
 ...Add-mitigation-against-timing-attack.patch |  70 ++++++++++
 .../libgcrypt/libgcrypt_1.8.4.bb              |   2 +
 .../libxslt/files/CVE-2019-18197.patch        |  33 +++++
 .../recipes-support/libxslt/libxslt_1.1.33.bb |   1 +
 13 files changed, 253 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (98%)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch

-- 
2.21.0


