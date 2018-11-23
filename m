Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 857E06C641
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:09:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN29xen010029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:09:59 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:09:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:16:26 +0800
Message-ID: <6ff168d8feae989d888dd2258a6339ea473c5cc8.1542939066.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542939066.git.Qi.Chen@windriver.com>
References: <cover.1542939066.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] busybox: add zip to RDEPENDS of ptest package
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
X-List-Received-Date: Fri, 23 Nov 2018 02:09:58 -0000
Content-Type: text/plain

busybox's unzip test case requires zip command. However, busybox
itself does not provide one. So add zip as a runtime dependency.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b8d8858..b45d2b6 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -53,6 +53,9 @@ RDEPENDS_${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_man
 
 inherit cml1 systemd update-rc.d ptest
 
+# busybox's unzip test case needs zip command, which busybox itself does not provide
+RDEPENDS_${PN}-ptest = "zip"
+
 # internal helper
 def busybox_cfg(feature, tokens, cnf, rem):
 	if type(tokens) == type(""):
-- 
1.9.1


