Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B18B965D3E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 00:21:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R0Lf4I015326 for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:21:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AyzwFnjYmLvK
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:21:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R0Lbv6015322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:21:38 +0100
Message-ID: <1398558091.16672.281.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Apr 2014 01:21:31 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross: Drop virtclass-cross OVERRIDE
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
X-List-Received-Date: Sun, 27 Apr 2014 00:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This has been replaced by the class-cross override.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index bd14489..480ec48 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -58,21 +58,6 @@ do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE
 do_populate_sysroot[stamp-extra-info] = ""
 do_packagedata[stamp-extra-info] = ""
 
-python cross_virtclass_handler () {
-    classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
-    if "cross" not in classextend:
-        return
-
-    pn = e.data.getVar("PN", True)
-    if not pn.endswith("-cross"):
-        return
-
-    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-cross", e.data)
-}
-
-addhandler cross_virtclass_handler
-cross_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
-
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }



