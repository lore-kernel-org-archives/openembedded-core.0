Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 167B460657
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 08:04:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4L87acS008751 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:07:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OFZHJeNPrzl5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:07:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4L86wX7008743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:07:30 +0100
Message-ID: <1369121802.11013.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 May 2013 08:36:42 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.6.4-0ubuntu1 
Subject: [PATCH] task.bbclass: Drop deprecated class
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
X-List-Received-Date: Tue, 21 May 2013 08:04:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Any users have had time to adapt to this change by now, drop the old class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/task.bbclass | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta/classes/task.bbclass

diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
deleted file mode 100644
index 28db500..0000000
--- a/meta/classes/task.bbclass
+++ /dev/null
@@ -1,6 +0,0 @@
-python __anonymous() {
-    bb.warn("%s: task.bbclass is deprecated, please inherit packagegroup instead" % d.getVar("PN", True))
-}
-
-inherit packagegroup
-



