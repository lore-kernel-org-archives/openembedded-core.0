Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B29060191
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:10:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALDAnIM017581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 13:10:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eH8K9-0004Tg-VT; Tue, 21 Nov 2017 13:10:49 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:10:44 +0000
Message-Id: <1511269847-17161-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/6] classes/cross: Add addto_recipe_sysroot task to cross recipes
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
X-List-Received-Date: Tue, 21 Nov 2017 13:10:51 -0000

This is particularly useful if you want to use gdb-cross as there
is no other good way to access it now with RSS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index d217717..e9fafed 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -92,3 +92,8 @@ export STRIP = "${BUILD_STRIP}"
 export NM = "${BUILD_NM}"
 
 inherit nopackages
+
+python do_addto_recipe_sysroot () {
+    bb.build.exec_func("extend_recipe_sysroot", d)
+}
+addtask addto_recipe_sysroot after do_populate_sysroot
-- 
2.7.4


