Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60E9F7E21B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 04:02:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4S42Jea005937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 21:02:19 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 27 May 2019 21:02:18 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 12:01:52 +0800
Message-ID: <1559016116-139663-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] connman: add networkmanager as rconflict
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
X-List-Received-Date: Tue, 28 May 2019 04:02:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-connectivity/connman/connman_1.37.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 1265032..00852bf 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -14,3 +14,4 @@ SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
 SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
 
 RRECOMMENDS_${PN} = "connman-conf"
+RCONFLICTS_${PN} = "networkmanager"
-- 
2.7.4


