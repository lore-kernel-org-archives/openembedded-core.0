Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F22A36E6A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:34:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 10:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="672175755"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 10:34:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 10:34:26 -0800
Message-Id: <cover.1422988163.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/6] Fixes and updates
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
X-List-Received-Date: Tue, 03 Feb 2015 18:35:02 -0000

Richard, Ross:

This contains a patch to the create-pull-request that address a change in
command line syntax for our usage. The core-image change will also require 
some docs update that I need to work with ScottRif on, that one could go into
sample.conf or sample.conf.extended if you agree.

Sau!


The following changes since commit 2104111edc85d057eb4fadecd007f5c592803da6:

  opkg-keyrings: New recipe (2015-02-03 14:53:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (6):
  glew: Upgrade to 1.12
  nspr: Upgrade to 4.10.8
  lsbinitscripts: Upgrade to 9.61
  ca-certificates: Upgrade to 20141019 (git based)
  core-image: split debug-tweaks into individual features
  create-pull-request: Fix git request-pull

 meta/classes/core-image.bbclass                    |   3 -
 meta/classes/image.bbclass                         |  11 +-
 ...binitscripts_9.60.bb => lsbinitscripts_9.61.bb} |   6 +-
 .../glew/{glew_1.11.0.bb => glew_1.12.0.bb}        |   4 +-
 ...date-mozilla-certdata.txt-to-version-1.98.patch | 227 ---------------------
 .../ca-certificates/default-sysroot.patch          |  21 +-
 ...tes_20140325.bb => ca-certificates_20141019.bb} |   6 +-
 .../nspr/{nspr_4.10.7.bb => nspr_4.10.8.bb}        |   4 +-
 scripts/create-pull-request                        |   8 +-
 9 files changed, 33 insertions(+), 257 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.60.bb => lsbinitscripts_9.61.bb} (80%)
 rename meta/recipes-graphics/glew/{glew_1.11.0.bb => glew_1.12.0.bb} (83%)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Update-mozilla-certdata.txt-to-version-1.98.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20140325.bb => ca-certificates_20141019.bb} (91%)
 rename meta/recipes-support/nspr/{nspr_4.10.7.bb => nspr_4.10.8.bb} (96%)

-- 
2.1.0


