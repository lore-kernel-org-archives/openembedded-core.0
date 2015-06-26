Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3D8605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:00:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q80fth002566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 01:00:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 26 Jun 2015 01:00:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jun 2015 15:52:54 +0800
Message-ID: <1435305174-13966-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] quota: fix quota do_install errors
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
X-List-Received-Date: Fri, 26 Jun 2015 08:00:41 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

ROOTDIR should be defined, otherwise man files will be installed
to host root dir.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-extended/quota/quota_4.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.02.bb b/meta/recipes-extended/quota/quota_4.02.bb
index 96ff4b5..124b0a3 100644
--- a/meta/recipes-extended/quota/quota_4.02.bb
+++ b/meta/recipes-extended/quota/quota_4.02.bb
@@ -36,5 +36,5 @@ PACKAGECONFIG[rpc] = "--enable-rpc=yes,--enable-rpc=no,libtirpc"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 
 do_install() {
-	oe_runmake prefix=${D}${prefix} install
+	oe_runmake ROOTDIR=${D} install
 }
-- 
1.9.1


