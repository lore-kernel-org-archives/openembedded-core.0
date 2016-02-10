Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C42E1731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:16:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2016 06:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,426,1449561600"; d="scan'208";a="650101494"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2016 06:16:00 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 16:15:54 +0200
Message-Id: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/5] sstate: use oe.gpg_sign for signing/verifying
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
X-List-Received-Date: Wed, 10 Feb 2016 14:16:05 -0000

This patchset modifies sstate.bbclass to utilize the recently added oe.gpg_sign
library module. This unifies the code as now all gpg signing operations during
the build are done with the help of this module. The first four patches add new
features and refactor oe.gpg_sign in order to make it usable for sstate
signing/verification. The fifth patch finally changes sstate.bbclass to use it.

[YOCTO #9006]


The following changes since commit cbdf4abde6d80b6123c7546d2b4c9c2a7f359ec7:

  sign_package_feed.bbclass: fix task dependencies (2016-02-08 17:16:12 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/sstate

for you to fetch changes up to 10ac62ab77a862a4efdcf68d20dd7331bfbc6f7a:

  sstate.bbclass: use oe.gpg_sign for gpg signing (2016-02-10 16:02:18 +0200)

Markus Lehtonen (5):
  oe/gpg_sign: add verify() method
  oe/gpg_sign: add 'armor' argument to detach_sign()
  sign_rpm.bbclass: do not store key details in signer instance
  oe/gpg_sign: add 'passphrase' argument to detach_sign method
  sstate.bbclass: use oe.gpg_sign for gpg signing

 meta/classes/sign_rpm.bbclass          |  9 +++--
 meta/classes/sstate.bbclass            | 38 ++++++++++-----------
 meta/lib/oe/gpg_sign.py                | 60 ++++++++++++++++++++++------------
 meta/lib/oe/package_manager.py         |  9 +++--
 meta/recipes-core/meta/signing-keys.bb | 16 ++++-----
 5 files changed, 71 insertions(+), 61 deletions(-)

-- 
2.6.2


