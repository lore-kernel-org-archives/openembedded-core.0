Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2093F60807
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhbIK021806; Fri, 30 Sep 2016 17:43:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JEaMQg1k22qZ; Fri, 30 Sep 2016 17:43:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhYa9021794
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Sep 2016 17:43:35 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1bq0uM-0007D5-HE; Fri, 30 Sep 2016 17:43:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 17:43:28 +0100
Message-Id: <1475253808-27642-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] machine-sdk: Clear ABIEXTENSION to avoid sstate checksum mismatch issues
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
X-List-Received-Date: Fri, 30 Sep 2016 16:43:38 -0000

When switching MACHINE, nativeksdk recipes could end up being rebuilt. Clear
ABIEXTENSION to avoid this problem and ensure sstate checksum consistency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine-sdk/i586.conf   | 1 +
 meta/conf/machine-sdk/i686.conf   | 1 +
 meta/conf/machine-sdk/x86_64.conf | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586.conf
index baacce7..4a66fa4 100644
--- a/meta/conf/machine-sdk/i586.conf
+++ b/meta/conf/machine-sdk/i586.conf
@@ -1,3 +1,4 @@
 SDK_ARCH = "i586"
 SDK_CC_ARCH = "-march=i586"
+ABIEXTENSION = ""
 
diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686.conf
index ffdb461..4e05ae8 100644
--- a/meta/conf/machine-sdk/i686.conf
+++ b/meta/conf/machine-sdk/i686.conf
@@ -1,2 +1,3 @@
 SDK_ARCH = "i686"
 SDK_CC_ARCH = "-march=i686"
+ABIEXTENSION = ""
diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
index 812d67c..70bd026 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1 +1,2 @@
 SDK_ARCH = "x86_64"
+ABIEXTENSION = ""
-- 
2.7.4


