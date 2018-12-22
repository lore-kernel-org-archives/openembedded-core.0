Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92E6779BF6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 22:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E9D1818415
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GNCUZWSzhb9b
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 76F9F18408
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6038F1A05F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5541F1A05E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 498B13123
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:33 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wBMMDW6R003816
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:32 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wBMMDWG5003815
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2018 23:13:32 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Dec 2018 23:13:21 +0100
Message-Id: <20181222221322.3768-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [thud][PATCH 1/2] libaio: Extend to native
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
X-List-Received-Date: Sat, 22 Dec 2018 22:13:35 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

lvm2 currently requires libaio. So building lvm2-native will result in
the following error.

  ERROR: Required build target 'lvm2-native' has no buildable providers.
  Missing or unbuildable dependency chain was: ['lvm2-native', 'libaio-native']

Extend libaio to native to fix this issue.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

This is a backport from master.

 meta/recipes-extended/libaio/libaio_0.3.111.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.111.bb
index 04b50b61ec..8e1cd349a0 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
@@ -20,4 +20,4 @@ do_install () {
     oe_runmake install DESTDIR=${D}
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.12.0


