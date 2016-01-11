Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 25154731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:13:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 11 Jan 2016 08:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,553,1444719600"; d="scan'208";a="631703122"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2016 08:13:19 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:13:16 +0200
Message-Id: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Support remote RPM signing
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
X-List-Received-Date: Mon, 11 Jan 2016 16:13:23 -0000

This patchset enables remote signing of RPM packages and package feeds using
the obs-signd signing server from openSUSE.
https://github.com/openSUSE/obs-sign
https://en.opensuse.org/openSUSE:Build_Service_Signer

Other remote signing methods should be easy to add, later.

The first patch of the series is a generic task dependency bugfix for rpm
signing.


The following changes since commit 95fced137a46dc98863fe5af7be5cbce708602f2:

  udev-extraconf: introduce multiple blacklist files for more complex setups (2016-01-05 17:55:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/rpmsign

for you to fetch changes up to 3ac8c3e5ab0dd6cab1438efd4484e0e313e55d8d:

  oe.gpg_sign: support obs-signd (2016-01-11 18:00:19 +0200)

Markus Lehtonen (3):
  sign_rpm.bbclass: fix task dependencies
  New lib module for handling GPG signing
  oe.gpg_sign: support obs-signd

 meta/classes/sign_package_feed.bbclass |  11 ++-
 meta/classes/sign_rpm.bbclass          |  53 +++++---------
 meta/lib/oe/gpg_sign.py                | 124 +++++++++++++++++++++++++++++++++
 meta/lib/oe/package_manager.py         |  31 +++------
 meta/recipes-core/meta/signing-keys.bb |  26 ++++---
 5 files changed, 173 insertions(+), 72 deletions(-)
 create mode 100644 meta/lib/oe/gpg_sign.py

-- 
2.1.4


