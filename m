Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id E451A70BE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:04:16 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id eM4C1o00W1mTNtu01M4HAY; Wed, 13 Aug 2014 14:04:18 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 16:03:45 -0500
Message-Id: <1407963825-20257-6-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1407963825-20257-1-git-send-email-pab@pabigot.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 5/5] gcc-target: make --enable-clocale consistent with gcc-runtime
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
X-List-Received-Date: Wed, 13 Aug 2014 21:04:20 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 8941f5f..0f9a5f8 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -8,6 +8,8 @@ EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
 "
 
+EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
+
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 
 PACKAGES = "\
-- 
1.8.5.5


