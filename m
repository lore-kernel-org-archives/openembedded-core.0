Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 37567605A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 04:46:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 20:46:02 -0800
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="233035475"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.22.68])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 20:46:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2020 12:45:54 +0800
Message-Id: <20200302044554.1265618-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302044554.1265618-1-anuj.mittal@intel.com>
References: <20200302044554.1265618-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] stress-ng: upgrade 0.11.00 -> 0.11.01
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
X-List-Received-Date: Mon, 02 Mar 2020 04:46:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.11.00.bb => stress-ng_0.11.01.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.00.bb => stress-ng_0.11.01.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
index c8471ebadd..3486be1b03 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "781f8a0f8509a01793d815210086e78a"
-SRC_URI[sha256sum] = "a41a6a4a7ea4e50aab7331e5594af7d1b3b6e5815751d137a78a6e166295294e"
+SRC_URI[md5sum] = "a558fc7fb9d0a851afe6de09080b5401"
+SRC_URI[sha256sum] = "9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b77527549a7736f65494"
 
 DEPENDS = "coreutils-native"
 
-- 
2.24.1


