Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D10B57723C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 08:29:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u858TpwN024973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2016 01:29:51 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 01:29:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Sep 2016 01:29:47 -0700
Message-ID: <c1b186a9c643bb747190725f83d64e7f8c5b6c4c.1473064099.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473064099.git.liezhi.yang@windriver.com>
References: <cover.1473064099.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] coreutils: enable xattr for native
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
X-List-Received-Date: Mon, 05 Sep 2016 08:29:52 -0000
Content-Type: text/plain

The lib/oe/path.py requires xattr, fixed:
Subprocess output:
cp: cannot preserve extended attributes, cp is built without xattr support

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.25.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index fc8d061..df6ad38 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -38,7 +38,8 @@ PACKAGECONFIG_class-target ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
 "
 
-PACKAGECONFIG_class-native ??= ""
+# The lib/oe/path.py requires xattr
+PACKAGECONFIG_class-native ??= "xattr"
 
 # with, without, depends, rdepends
 #
-- 
2.9.0


