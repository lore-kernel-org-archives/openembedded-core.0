Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 64D577326E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 12:21:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 25 Jan 2016 04:21:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,344,1449561600"; d="scan'208";a="868079420"
Received: from dwmw2-shinybook.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.13.32])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2016 04:21:36 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 14:21:33 +0200
Message-Id: <1453724494-20092-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] New lib module for signing
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
X-List-Received-Date: Mon, 25 Jan 2016 12:21:43 -0000

Re-sending this patch as a standalone refactoring / improvement. Getting this
merged would make it easier work separately on different parts of signing, e.g.
sstate signing, remote rpm signing, ipk and dpkg signing.

No code changes since the previous version of the patch. Only commit message is
slightly modified.

Markus Lehtonen (1):
  New lib module for handling GPG signing

 meta/classes/sign_package_feed.bbclass |  6 +++
 meta/classes/sign_rpm.bbclass          | 47 +++++----------------
 meta/lib/oe/gpg_sign.py                | 76 ++++++++++++++++++++++++++++++++++
 meta/lib/oe/package_manager.py         | 31 +++++---------
 meta/recipes-core/meta/signing-keys.bb | 26 ++++++------
 5 files changed, 116 insertions(+), 70 deletions(-)
 create mode 100644 meta/lib/oe/gpg_sign.py

-- 
2.1.4


