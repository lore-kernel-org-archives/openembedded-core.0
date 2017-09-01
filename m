Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9B6E7849D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:00:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81G02gs029678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 17:00:03 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dnoMU-0002L4-CE; Fri, 01 Sep 2017 17:00:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 17:00:00 +0100
Message-Id: <1504281601-8951-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 17:00:03 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] package: Change PACKAGE_BBCLASS_VERSION
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
X-List-Received-Date: Fri, 01 Sep 2017 16:00:04 -0000

The silent rpmdeps failures fixed in a preceeding commit mean we
need to rerun all packaging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a051617..7a62181 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2073,7 +2073,7 @@ python do_package () {
     # cache.  This is useful if an item this class depends on changes in a
     # way that the output of this class changes.  rpmdeps is a good example
     # as any change to rpmdeps requires this to be rerun.
-    # PACKAGE_BBCLASS_VERSION = "1"
+    # PACKAGE_BBCLASS_VERSION = "2"
 
     # Init cachedpath
     global cpath
-- 
2.7.4


