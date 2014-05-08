Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 05D926017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:35:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2014 08:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="508452787"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2014 08:35:36 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 18:35:20 +0300
Message-Id: <1399563320-9420-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] nettle: disable openssl
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
X-List-Received-Date: Thu, 08 May 2014 15:35:46 -0000

Do not include openssl glue in the
benchmark program.
This should fix a compile issue on
multilib.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index 87f1639..8aa5351 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -13,6 +13,8 @@ SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
 SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
 
+EXTRA_OECONF = "--disable-openssl"
+
 do_configure_prepend() {
        if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
                cp ${S}/aclocal.m4 ${S}/acinclude.m4
-- 
1.9.1


