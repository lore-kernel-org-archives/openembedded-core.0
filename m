Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AB61478679
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433552"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:15 -0800
Message-Id: <20171219225831.22587-3-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 02/18] image.bbclass: Add fs-uuid bbclass
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:38 -0000

This gives the class access to the DISK_SIGNATURE_UUID variable.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/image.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ec940a4b659..38709691721 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -135,6 +135,9 @@ def build_live(d):
         return ""
     return "image-live"
 
+# uuid tools are useful for image creation
+inherit fs-uuid
+
 IMAGE_TYPE_live = "${@build_live(d)}"
 inherit ${IMAGE_TYPE_live}
 
-- 
2.14.3


