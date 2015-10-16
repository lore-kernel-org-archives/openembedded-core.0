Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43FD377122
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 11:57:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 04:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,688,1437462000"; d="scan'208";a="812530217"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2015 04:57:38 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 14:57:31 +0300
Message-Id: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Rework rpm signing
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
X-List-Received-Date: Fri, 16 Oct 2015 11:57:41 -0000

Additionl patches on top of my previous "Implement GPG_PATH variable" patchset.

Slightly rework the rpm and package feed signing feature. The user-visible
changes are that the RPM_GPG_PUBKEY and PACKAGE_FEED_GPG PUBKEY configuration
variables are not needed anymore, and, package feed signing should now be
enabled using INERIT += "sign_package_feed".

The following changes since commit 27ce8876e4b4b19fd26c2f70ccc2acc2c1bc5d40:

  package_manager: support GPG_PATH variable (2015-10-16 14:03:46 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/rpmsign
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/rpmsign

Markus Lehtonen (5):
  sign_rpm.bbclass: be more verbose in case of error
  sign_rpm.bbclass: make RPM_GPG_NAME a mandatory setting
  Add new bbclass for package feed signing
  package_manager: fail if signed feeds are enabled for ipk or dpkg
  package signing: automatically export public keys

 meta/classes/sign_package_feed.bbclass     | 31 ++++++++++++++++++++
 meta/classes/sign_rpm.bbclass              | 44 +++++++++++++----------------
 meta/lib/oe/package_manager.py             |  4 +++
 meta/recipes-core/meta/signing-keys.bb     | 45 ++++++++++++++++++++++++++++++
 meta/recipes-core/os-release/os-release.bb |  1 +
 5 files changed, 100 insertions(+), 25 deletions(-)
 create mode 100644 meta/classes/sign_package_feed.bbclass
 create mode 100644 meta/recipes-core/meta/signing-keys.bb

-- 
2.1.4


