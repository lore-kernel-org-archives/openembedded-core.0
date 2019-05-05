Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAF7A7D69D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 06:02:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4561k3h022305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 May 2019 23:01:56 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sat, 4 May 2019 23:01:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 5 May 2019 14:12:32 +0800
Message-ID: <41bf622e96c697efd32778af54f88de4fcf2f1ff.1557036591.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1557036591.git.Qi.Chen@windriver.com>
References: <cover.1557036591.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: set CVE_PRODUCT
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
X-List-Received-Date: Sun, 05 May 2019 06:02:05 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
index bb32347..2630084 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
@@ -136,3 +136,6 @@ BBCLASSEXTEND = "native"
 
 # ghostscript does not supports "arc"
 COMPATIBLE_HOST = "^(?!arc).*"
+
+# some entries in NVD uses gpl_ghostscript
+CVE_PRODUCT = "ghostscript gpl_ghostscript"
-- 
1.9.1


