Return-Path: <tomasz.meresinski@comarch.pl>
X-Greylist: delayed 1130 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Feb 2018 16:46:42 UTC
Received: from odzwierny2.comarch.com (odzwierny2.comarch.com [217.74.69.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7AF7838D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 16:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny2.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1ejSZd-000Odp-1C; Wed, 07 Feb 2018 17:27:53 +0100
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Feb 2018 17:27:44 +0100
Message-Id: <1518020864-18718-1-git-send-email-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny2.comarch.com
X-CA-Is-Spam: No
Cc: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Subject: [PATCH] python3: Fix python3-logging dependencies
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
X-List-Received-Date: Wed, 07 Feb 2018 16:46:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

python3-logging depends on python3-netserver (logging/config.py:42)

Signed-off-by: Tomasz Meresiński<tomasz.meresinski@comarch.pl>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index b117569..1914a4c 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -591,7 +591,8 @@
         ],
         "rdepends": [
             "core",
-            "stringold"
+            "stringold",
+            "netserver"
         ],
         "summary": "Python logging support"
     },
-- 
2.7.4


