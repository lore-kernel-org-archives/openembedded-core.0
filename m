Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B349B7834E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 03:17:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 20:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,336,1505804400"; d="scan'208";a="331471845"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.249.64.52])
	by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2017 20:16:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 16:16:11 +1300
Message-Id: <d86576ea59094655cf482384f60990024b3f3adf.1509678875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1509678875.git.paul.eggleton@linux.intel.com>
References: <cover.1509678875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] buildhistory: enable committing history by default
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
X-List-Received-Date: Fri, 03 Nov 2017 03:17:00 -0000

The most common usage for buildhistory is with commits enabled so that
you actually collect history, rather than just keeping a snapshot of the
most recent build state, therefore default BUILDHISTORY_COMMIT to "1".
This really ought to have been the default in the beginning, I can't
really explain why it wasn't.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7a5534e..63980f7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -37,7 +37,7 @@ BUILDHISTORY_OLD_DIR_PACKAGE = "${BUILDHISTORY_OLD_DIR}/packages/${MULTIMACH_TAR
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}${SDK_EXT}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/bblayers.conf conf/auto.conf conf/locked-sigs.inc conf/devtool.conf"
-BUILDHISTORY_COMMIT ?= "0"
+BUILDHISTORY_COMMIT ?= "1"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
-- 
2.9.5


