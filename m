Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9E89171DBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrRYI005705; Thu, 19 Jan 2017 22:53:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XIE0s_e9lapC; Thu, 19 Jan 2017 22:53:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrN81005649
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004h3-HH; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:43 +0000
Message-Id: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 01/33] lib/oe/utils: Add build_depends_string function
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:32 -0000

This is useful when manipulating depends strings for task [depends]
flags and is slightly easier to parse than some inline python.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 76806b5..330a5ff 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -97,6 +97,10 @@ def param_bool(cfg, field, dflt = None):
         return False
     raise ValueError("invalid value for boolean parameter '%s': '%s'" % (field, value))
 
+def build_depends_string(depends, task):
+    """Append a taskname to a string of dependencies as used by the [depends] flag"""
+    return " ".join(dep + ":" + task for dep in depends.split())
+
 def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
-- 
2.7.4


