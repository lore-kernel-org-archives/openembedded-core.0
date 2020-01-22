Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EAD889142B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 05:46:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:49 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220200347"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 13:46:36 +0800
Message-Id: <20200122054636.10681-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200122054636.10681-1-anuj.mittal@intel.com>
References: <20200122054636.10681-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sudo: upgrade 1.8.29 -> 1.8.30
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
X-List-Received-Date: Wed, 22 Jan 2020 05:46:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/sudo/{sudo_1.8.29.bb => sudo_1.8.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.29.bb => sudo_1.8.30.bb} (91%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.29.bb b/meta/recipes-extended/sudo/sudo_1.8.30.bb
similarity index 91%
rename from meta/recipes-extended/sudo/sudo_1.8.29.bb
rename to meta/recipes-extended/sudo/sudo_1.8.30.bb
index 8da2d64631..0aa9c596c1 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.29.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.30.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "b28dabff9c460f115fe74de4d6a6f79d"
-SRC_URI[sha256sum] = "ce53ffac9604e23321334d8ba8ac59ded2bcf624fdb9dbde097ab2049bf29c7c"
+SRC_URI[md5sum] = "d56cd5835b1cc9852bd76ddaaa572475"
+SRC_URI[sha256sum] = "a35ad3ddc7465703e04190d3ff0b8d78ded9246749becf9a014dcb9c31c579e7"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.21.1


