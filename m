Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4F34D6025F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 16:24:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 08:24:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,215,1484035200"; d="scan'208";a="1102821803"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.4.127])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2017 08:24:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 27 Feb 2017 08:24:25 -0800
Message-Id: <1488212665-27534-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] LICENSE: Clarify what is meant by 'metadata'
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
X-List-Received-Date: Mon, 27 Feb 2017 16:24:26 -0000

The term metadata in the LICENSE text is unclear and recently
garnered some questions at ELC, so clarify metadata to include
bbclasses, which is and has been metadata as well as code.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 LICENSE | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/LICENSE b/LICENSE
index 21fa6e6..9783ee5 100644
--- a/LICENSE
+++ b/LICENSE
@@ -6,9 +6,11 @@ meta/COPYING.MIT (MIT)
 meta-selftest/COPYING.MIT (MIT)
 meta-skeleton/COPYING.MIT (MIT)
 
-All metadata is MIT licensed unless otherwise stated. Source code
-included in tree for individual recipes is under the LICENSE stated in
-the associated recipe (.bb file) unless otherwise stated.
+All metadata files (including, but not limited to bb, bbappend,
+bbclass, inc and conf files) are MIT licensed unless otherwise stated.
+Source code included in tree for individual recipes is under the
+LICENSE stated in the associated recipe (.bb file) unless otherwise
+stated.
 
 License information for any other files is either explicitly stated 
 or defaults to GPL version 2.
-- 
2.7.4


