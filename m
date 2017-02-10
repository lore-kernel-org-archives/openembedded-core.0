Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3A84772BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NNXJ007870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:12 -0800
Message-ID: <824bccc4bfe9af09c859e318e968727b8e0d82c6.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] strace: 4.14 -> 4.15
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:23 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/strace/{strace_4.14.bb => strace_4.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.14.bb => strace_4.15.bb} (91%)

diff --git a/meta/recipes-devtools/strace/strace_4.14.bb b/meta/recipes-devtools/strace/strace_4.15.bb
similarity index 91%
rename from meta/recipes-devtools/strace/strace_4.14.bb
rename to meta/recipes-devtools/strace/strace_4.15.bb
index 452925c7ea9..2b9d19a42b8 100644
--- a/meta/recipes-devtools/strace/strace_4.14.bb
+++ b/meta/recipes-devtools/strace/strace_4.15.bb
@@ -15,8 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            "
 
-SRC_URI[md5sum] = "1e39b5f7583256d7dc21170b9da529ae"
-SRC_URI[sha256sum] = "5bed5110b243dce6864bedba269446c18c8c63f553cdd7fd4f808d89a764712f"
+SRC_URI[md5sum] = "1ff96209fec19914c920608ed0791864"
+SRC_URI[sha256sum] = "c0cdc094d6141fd9dbf6aaad605142d651ae10998b660fda57fc61f7ad583ca9"
 
 inherit autotools ptest bluetooth
 
-- 
2.11.0.rc2.dirty


