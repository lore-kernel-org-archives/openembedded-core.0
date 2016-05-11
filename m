Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A8A136E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 20:36:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2016 13:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="951263659"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2016 13:36:13 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 12:31:55 +0000
Message-Id: <cover.1462969737.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/3] Add extract() method to package manager
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
X-List-Received-Date: Wed, 11 May 2016 20:36:14 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Sometimes it is needed to have the content of a package outside of an image,
these series add this capability using a temp directory.

The following changes since commit 7ca60ec8bff7656b4e52f5a4d238913e851da089:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:48:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9569
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9569

Mariano Lopez (3):
  package_manager.py: Move opkg_query() outside of Indexer class
  package_manager.py: Add extract() method for opkg and dpkg
  package_manager.py: Add extract() method for RPM package manager

 meta/lib/oe/package_manager.py | 312 +++++++++++++++++++++++++++++++++--------
 1 file changed, 257 insertions(+), 55 deletions(-)

-- 
2.6.6


