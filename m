Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A825C77404
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5wWn001270; Wed, 21 Dec 2016 17:05:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FhU39B6A3a2t; Wed, 21 Dec 2016 17:05:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5qE8001238
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Dec 2016 17:05:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cJkKu-0006t2-48; Wed, 21 Dec 2016 17:05:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:05:45 +0000
Message-Id: <1482339945-26418-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] lib/oe/utils: Drop python2 compatibility code
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
X-List-Received-Date: Wed, 21 Dec 2016 17:06:00 -0000

We've moved to python3, we don't need this compatibility code which just makes
the code less readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index bf440ec..3de21fc 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,9 +1,4 @@
-try:
-    # Python 2
-    import commands as cmdstatus
-except ImportError:
-    # Python 3
-    import subprocess as cmdstatus
+import subprocess
 
 def read_file(filename):
     try:
@@ -144,7 +139,7 @@ def packages_filter_out_system(d):
     return pkgs
 
 def getstatusoutput(cmd):
-    return cmdstatus.getstatusoutput(cmd)
+    return subprocess.getstatusoutput(cmd)
 
 
 def trim_version(version, num_parts=2):
-- 
2.7.4


