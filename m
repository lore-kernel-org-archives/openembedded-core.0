Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcdVm-0005Eb-Ks
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 15:11:58 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	15:08:10 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 15:08:00 +0200
Message-ID: <017f8b8ce1d13b71f3b13ae37f13b0801ce71924.1309525642.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309525642.git.anders@chargestorm.se>
References: <cover.1309525642.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v5 4/8] kernel.bblass: remove get_kernelmajorversion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2011 13:11:58 -0000
Content-Type: text/plain

It is now unused.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/linux-kernel-base.bbclass |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 510951a..4f2b0a4 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -24,14 +24,6 @@ def get_kernelversion(p):
             return m.group(1)
     return None
 
-def get_kernelmajorversion(p):
-	import re
-	r = re.compile("([0-9]+\.[0-9]+).*")
-	m = r.match(p);
-	if m:
-		return m.group(1)
-	return None
-
 def linux_module_packages(s, d):
 	suffix = ""
 	return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
-- 
1.7.4.1



