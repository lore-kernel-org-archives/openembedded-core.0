Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id A6582786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465198"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:02:02 +0200
Message-Id: <20180201180210.21652-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/20] liburcu: update to 0.10.1
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/liburcu/{liburcu_0.10.0.bb => liburcu_0.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.10.0.bb => liburcu_0.10.1.bb} (80%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.10.0.bb b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
similarity index 80%
rename from meta/recipes-support/liburcu/liburcu_0.10.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.10.1.bb
index 4ecb20b75c0..0c8cd3571af 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
            "
 
-SRC_URI[md5sum] = "69dab85b6929c378338b9504adc6aea7"
-SRC_URI[sha256sum] = "7cb58a7ba5151198087f025dc8d19d8918e9c6d56772f039696c111d9aad3190"
+SRC_URI[md5sum] = "281a2f92fdc39c40ad6b76f6631fdbd7"
+SRC_URI[sha256sum] = "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f79eb06"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools
-- 
2.15.1


