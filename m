Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 388DC73FAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:51:37 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yrtjm-0005d5-Nr from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 May 2015 12:51:38 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 11 May 2015 20:51:37 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 22:51:35 +0300
Message-ID: <1431373895-32411-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] systemd.bbclass: drop has_exactly_one_service setting
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
X-List-Received-Date: Mon, 11 May 2015 19:51:39 -0000
Content-Type: text/plain

The has_exactly_one_service variable was used in now deleted code. Drop
this part to make code cleaner.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/classes/systemd.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c34884b..cfe1eb5 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -139,9 +139,6 @@ python systemd_populate_packages() {
         searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir", True), "systemd", "system"))
         searchpaths.append(oe.path.join(d.getVar("exec_prefix", True), d.getVar("nonarch_base_libdir", True), "systemd", "system"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
-        has_exactly_one_service = len(systemd_packages.split()) == 1
-        if has_exactly_one_service:
-            has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
 
         keys = 'Also'
         # scan for all in SYSTEMD_SERVICE[]
-- 
2.1.4


