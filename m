Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91A217117E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 09:01:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8F91ZTA012511
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 02:01:36 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 02:01:35 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Sep 2014 17:01:36 +0800
Message-ID: <1410771696-6165-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] rsync: Add PACKAGECONFIG for acl/attr
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
X-List-Received-Date: Mon, 15 Sep 2014 09:01:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Add PACKAGECONFIG for acl/attr
and setting the default value to enable them

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/rsync/rsync_3.1.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.1.0.bb b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
index 72c072d..c27e4f0 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
@@ -6,7 +6,9 @@ SRC_URI += "file://acinclude.m4"
 SRC_URI[md5sum] = "3be148772a33224771a8d4d2a028b132"
 SRC_URI[sha256sum] = "81ca23f77fc9b957eb9845a6024f41af0ff0c619b7f38576887c63fa38e2394e"
 
-EXTRA_OECONF += "--disable-xattr-support --disable-acl-support"
+PACKAGECONFIG ?= "acl attr"
+PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
+PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
 
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
-- 
1.7.10.4


