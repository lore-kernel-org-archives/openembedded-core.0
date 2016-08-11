Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2C778731F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475595"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:44:57 +1200
Message-Id: <cover.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 00/10] Extensible SDK fixes
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:28 -0000

Fixes for building the extensible SDK without uninative enabled, fixes
for the recently implemented sstate filtering, fixes for buildtools
handling within the eSDK installer, addition of sanity tests early in
the eSDK install process, and a couple of other related fixes.

Worth noting is that this changeset, building the eSDK with OE-Core's
default configuration now works again. It's not clear to me when it
broke (it may have only been recently, certainly it was after the
sstate filtering patches that the YP autobuilder started warning that
the tests were failing with OE-Core).


The following changes since commit 5ed0d5a7d9b051a551a6de644bf6a42b87c12471:

  dbus: backport stdint.h build fix (2016-08-10 10:45:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes13-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes13-oe

Paul Eggleton (10):
  gen-lockedsig-cache: ensure symlinks are dereferenced
  classes/populate_sdk_ext: ensure eSDK can build without uninative enabled
  classes/populate_sdk_ext: handle lack of uninative when filtering sstate
  classes/populate_sdk_ext: sstate filtering fixes
  lib/oe/copy_buildsystem: fix merging sstate directories for eSDK
  classes/populate_sdk_ext: properly handle buildtools install failure
  classes/populate_sdk_ext: properly determine buildtools filename
  toolchain-shar-extract.sh: add option to list contents
  classes/populate_sdk_ext: add some pre-install checks
  classes/populate_sdk_ext: drop duplicated error message

 meta/classes/populate_sdk_ext.bbclass | 114 +++++++++++++++++++++++++++-------
 meta/files/ext-sdk-prepare.py         |   2 +-
 meta/files/toolchain-shar-extract.sh  |  25 +++++++-
 meta/lib/oe/copy_buildsystem.py       |  20 +++---
 scripts/gen-lockedsig-cache           |   7 ++-
 5 files changed, 131 insertions(+), 37 deletions(-)

-- 
2.5.5


