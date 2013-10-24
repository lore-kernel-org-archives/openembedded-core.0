Return-Path: <cristiana.voicu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 64FA66D34C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:57:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2013 00:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,560,1378882800"; d="scan'208";a="421820161"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2013 00:57:02 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 11:01:46 +0300
Message-Id: <cover.1382601179.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Package upgrades
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
X-List-Received-Date: Thu, 24 Oct 2013 07:57:01 -0000

The patchset was tested on a local autobuilder, for all major architecture,
on the top of the following commit 505114c13d29799a25379f7ce720d632616d8776.
Basic functionality tests done using rpm and deb packages on a core-image-
sato-sdk.

Cristiana Voicu (4):
  liburcu: upgrade to 0.8.0
  at: upgrade to 3.1.14
  curl: upgrade to 7.33.0
  sudo: upgrade to 1.8.8

 .../at/{at_3.1.13.bb => at_3.1.14.bb}              |    7 ++---
 meta/recipes-extended/at/files/configure.patch     |   29 --------------------
 meta/recipes-extended/at/files/use-ldflags.patch   |   24 ----------------
 meta/recipes-extended/sudo/sudo.inc                |    2 +-
 .../sudo/{sudo_1.8.7.bb => sudo_1.8.8.bb}          |    4 +--
 .../curl/{curl_7.32.0.bb => curl_7.33.0.bb}        |    4 +--
 meta/recipes-support/liburcu/files/fixCCflag.patch |   18 ++++++++++++
 .../liburcu/files/fixsepbuild.patch                |   18 ++++++++++++
 .../liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} |    8 ++++--
 9 files changed, 48 insertions(+), 66 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.13.bb => at_3.1.14.bb} (90%)
 delete mode 100644 meta/recipes-extended/at/files/configure.patch
 delete mode 100644 meta/recipes-extended/at/files/use-ldflags.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.7.bb => sudo_1.8.8.bb} (83%)
 rename meta/recipes-support/curl/{curl_7.32.0.bb => curl_7.33.0.bb} (93%)
 create mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
 create mode 100644 meta/recipes-support/liburcu/files/fixsepbuild.patch
 rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} (74%)

-- 
1.7.9.5


