Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B40979202
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 09:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 492D6182C9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id tPxejvw6hsra
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B2C791813C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A09DE1A07B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95ABB1A075
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 89F792878
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 10:30:36 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA39Uafr011334
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Nov 2018 10:30:36 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA39UabX011333
	for openembedded-core@lists.openembedded.org;
	Sat, 3 Nov 2018 10:30:36 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 10:30:25 +0100
Message-Id: <20181103093029.11289-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/5] common-licenses: Correct the FreeType license text
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
X-List-Received-Date: Sat, 03 Nov 2018 09:30:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It now matches:
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/FTL.TXT

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/files/common-licenses/FreeType | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/common-licenses/FreeType b/meta/files/common-licenses/FreeType
index b7d4d11c0f..3666649f3e 100644
--- a/meta/files/common-licenses/FreeType
+++ b/meta/files/common-licenses/FreeType
@@ -48,7 +48,7 @@ Introduction
   encourage you to use the following text:
 
    """  
-    Portions of this software are copyright � <year> The FreeType
+    Portions of this software are copyright © <year> The FreeType
     Project (www.freetype.org).  All rights reserved.
    """
 
@@ -163,7 +163,7 @@ Legal Terms
 
   Our home page can be found at
 
-    http://www.freetype.org
+    https://www.freetype.org
 
 
 --- end of FTL.TXT ---
-- 
2.12.0


