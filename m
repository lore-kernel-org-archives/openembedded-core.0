Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EA27165ED7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:51:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2014 08:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="552717628"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2014 08:51:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:51:15 +0100
Message-Id: <cover.1402328991.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [daisy][PATCH 0/5] OpenSSL CVE fixes for the daisy branch
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
X-List-Received-Date: Mon, 09 Jun 2014 15:51:44 -0000

NOTE: These patches needs to be applied *after* the OpenSSL
CVE-2010-5298 patch fix in Saul's pending daisy series (which is in
the branch for this pull request or it would not work otherwise.)


The following changes since commit:

  openssl: add openssl-CVE-2010-5298.patch SRC_URI (2014-06-09 14:11:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/openssl-daisy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssl-daisy

Paul Eggleton (5):
  openssl: fix CVE-2014-0195
  openssl: use upstream fix for CVE-2014-0198
  openssl: fix CVE-2014-0221
  openssl: fix CVE-2014-0224
  openssl: fix CVE-2014-3470

 .../openssl/openssl-1.0.1e-cve-2014-0195.patch     |  40 ++++++++
 .../openssl/openssl-1.0.1e-cve-2014-0198.patch     |  38 ++++++++
 .../openssl/openssl-1.0.1e-cve-2014-0221.patch     |  38 ++++++++
 .../openssl/openssl-1.0.1e-cve-2014-0224.patch     | 103 +++++++++++++++++++++
 .../openssl/openssl-1.0.1e-cve-2014-3470.patch     |  31 +++++++
 .../openssl/openssl-CVE-2014-0198-fix.patch        |  23 -----
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |   6 +-
 7 files changed, 255 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0195.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0198.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0221.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0224.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-3470.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch

-- 
1.9.3


