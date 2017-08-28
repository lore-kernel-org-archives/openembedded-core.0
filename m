Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6863177CEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:28:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 13:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="123361376"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 28 Aug 2017 13:28:30 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 13:28:18 -0700
Message-Id: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/8] reproducibility fixes
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
X-List-Received-Date: Mon, 28 Aug 2017 20:28:28 -0000

Various simple patches that eliminate buildhost references from several
packages and improve the reproducibility/determinism when building package/images.



Juro Bystricky (8):
  zlib_1.2.11.bb: remove build host references
  bash.inc: improve reproducibility
  flex_2.6.0.bb: remove build host references
  diffutils_3.6.bb: remove build host references
  package_manager.py: improve reproducibility
  eudev_3.2.2: improve reproducibility
  image_types.bbclass: improve reproducibility of .gz files
  qemuboot.bbclass: create deterministic qemuboot.conf file

 meta/classes/image_types.bbclass                 |  2 +-
 meta/classes/qemuboot.bbclass                    |  2 +-
 meta/lib/oe/package_manager.py                   |  2 +-
 meta/recipes-core/udev/eudev_3.2.2.bb            |  6 ++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb            |  5 +++++
 meta/recipes-devtools/flex/flex_2.6.0.bb         |  6 +++++-
 meta/recipes-extended/bash/bash.inc              | 22 +++++++++++++++++++---
 meta/recipes-extended/diffutils/diffutils_3.6.bb |  7 ++++++-
 8 files changed, 44 insertions(+), 8 deletions(-)

-- 
2.7.4


