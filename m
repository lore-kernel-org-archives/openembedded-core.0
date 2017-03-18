Return-Path: <brian.avery@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6615677AB3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489849602; x=1521385602;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=VnqxVV8Ab7rT2p2vlEWI0Xd+1Qan6YKdL4Nc0Aq2oxY=;
	b=PVk27TQBFWhUhTJB0FRMyGG7kwGKlJJgiMjMIrKwQz6eUG5TS5xVl0dV
	3fPAxNa+OCkjraix9EvEOVw+b5rb2A==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Mar 2017 08:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,183,1486454400"; d="scan'208";a="68622910"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga004.jf.intel.com with ESMTP; 18 Mar 2017 08:06:41 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Mar 2017 08:08:48 -0700
Message-Id: <eb9bf2d0d6f7d21b1f7ee7ee934d4af585a56f6a.1489849643.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489849643.git.brian.avery@intel.com>
References: <cover.1489849643.git.brian.avery@intel.com>
Subject: [PATCH 2/2] bitbake.conf: remove vi from HOSTTOOLS list
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
X-List-Received-Date: Sat, 18 Mar 2017 15:06:40 -0000

Having changes the sdk test to cpio from cvs, we no longer require an
editor to be present. This patch removes vi from the list of required
tools.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 561167a..e03bc57 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -466,7 +466,7 @@ HOSTTOOLS += " \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "ps stty ip ssh scp ping vi"
+HOSTTOOLS += "ps stty ip ssh scp ping"
 
 # Link to these if present
 HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc socat"
-- 
1.9.1


