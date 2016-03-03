Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D22EC6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 10:33:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2016 02:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="900233580"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.114])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2016 02:33:30 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 10:32:38 +0000
Message-Id: <cover.1457001019.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro][PATCH 0/2] Consolidated security pull request
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
X-List-Received-Date: Thu, 03 Mar 2016 10:33:32 -0000

This pull request picks up a couple of outstanding Jethro security fixes which
are also required for the fido branch. Note: the wpa-supplicant change isn't
required for master and an equivelant openssl fix is queued for master.

Please consider them for merging.

Regards,

Joshua

The following changes since commit 0c702756dd0009c4112028fbf2479a346867b32c:

  build-appliance-image: Update to jethro head revision (2016-02-24 09:04:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/jethro
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/jethro

Armin Kuster (1):
  openssl: Security fix CVE-2016-0800

Hongxu Jia (1):
  wpa-supplicant: Fix CVE-2015-8041

 .../openssl/openssl/CVE-2016-0800.patch            | 198 +++++++
 .../openssl/openssl/CVE-2016-0800_2.patch          | 592 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-0800_3.patch          | 503 +++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   3 +
 ...load-length-validation-in-NDEF-record-par.patch |  64 +++
 .../wpa-supplicant/wpa-supplicant_2.4.bb           |   1 +
 6 files changed, 1361 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch

--
2.5.0

