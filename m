Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47DC9719C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 14:47:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 07:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="97069114"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.140.209])
	by orsmga005.jf.intel.com with ESMTP; 08 May 2017 07:47:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  8 May 2017 22:47:25 +0800
Message-Id: <1494254846-9382-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
References: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4] gnupg: upgrade from 2.1.18 to 2.1.20
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
X-List-Received-Date: Mon, 08 May 2017 14:47:36 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.18.bb => gnupg_2.1.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.18.bb => gnupg_2.1.20.bb} (90%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.18.bb b/meta/recipes-support/gnupg/gnupg_2.1.20.bb
similarity index 90%
rename from meta/recipes-support/gnupg/gnupg_2.1.18.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.20.bb
index a0611aa..bbda283 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.18.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.20.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "c67f908b0b35c7ebc62144f362757e1e"
-SRC_URI[sha256sum] = "d04c6fab7e5562ce4b915b22020e34d4c1a256847690cf149842264fc7cef994"
+SRC_URI[md5sum] = "f6bc7e0b82893dfafe09109d86ff6e9b"
+SRC_URI[sha256sum] = "24cf9a69369be64a9f6f8cc11a1be33ab7780ad77a6a1b93719438f49f69960d"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.7.4


