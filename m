Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TfppO-0001sL-0I
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 11:34:14 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qB4AJlFE002471;
	Tue, 4 Dec 2012 04:19:49 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:19:50 +0500
Message-Id: <1354616390-14949-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] qa.py: Modify the env for the child process only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 10:34:14 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Modified environment is only required for new subprocess to execute
objdump command and not for the current process. We should only
modify the copy of env to pass it on to the child.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/lib/oe/qa.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 12dcd1f..2c51141 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -99,7 +99,7 @@ class ELFFile:
         objdump = d.getVar('OBJDUMP', True)
         staging_dir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
 
-        env = os.environ
+        env = os.environ.copy()
         env["LC_ALL"] = "C"
 
         try:
-- 
1.7.9.5



