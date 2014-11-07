Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C22D571FF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989801"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:37 -0800
Message-Id: <6d652ff4f250795b7437c4df5b7c126224a8fdcc.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 12/19] at: Upgrade to 3.1.16
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/at/{at_3.1.15.bb => at_3.1.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.15.bb => at_3.1.16.bb} (93%)

diff --git a/meta/recipes-extended/at/at_3.1.15.bb b/meta/recipes-extended/at/at_3.1.16.bb
similarity index 93%
rename from meta/recipes-extended/at/at_3.1.15.bb
rename to meta/recipes-extended/at/at_3.1.16.bb
index 0c37d6d..f16edba 100644
--- a/meta/recipes-extended/at/at_3.1.15.bb
+++ b/meta/recipes-extended/at/at_3.1.16.bb
@@ -27,8 +27,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "f0f96db22e3a174b53ce4beeeb848839"
-SRC_URI[sha256sum] = "03a84f5293d5a95ef4231b7faf5578f141f0c76a2b304dd655bc7e90e97bf7fc"
+SRC_URI[md5sum] = "d05da75d9b75d93917ffb16ab48b1e19"
+SRC_URI[sha256sum] = "cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
-- 
1.8.3.1


