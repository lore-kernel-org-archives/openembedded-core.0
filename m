Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB7873259
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:41:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7PEfHX5002395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:41:17 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Aug 2016 07:41:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2016 07:41:07 -0700
Message-ID: <5ec01bf4a08a13542d4211a5ceac5227c340064f.1472120966.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1472120966.git.liezhi.yang@windriver.com>
References: <cover.1472120966.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 10/10] qemurunner.py/qemutinyrunner.py: remove runqemu-internal
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
X-List-Received-Date: Thu, 25 Aug 2016 14:41:16 -0000
Content-Type: text/plain

There is no runqemu-internal any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py     | 2 +-
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 69a5ae1..2158d69 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -375,7 +375,7 @@ class QemuRunner:
                     newparents = next
         #print("Children matching %s:" % str(parents))
         for p in parents:
-            # Need to be careful here since runqemu-internal runs "ldd qemu-system-xxxx"
+            # Need to be careful here since runqemu runs "ldd qemu-system-xxxx"
             # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
             basecmd = commands[p].split()[0]
             basecmd = os.path.basename(basecmd)
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 7f7489d..d554f0d 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -162,7 +162,7 @@ class QemuTinyRunner(QemuRunner):
                     newparents = next
         #print("Children matching %s:" % str(parents))
         for p in parents:
-            # Need to be careful here since runqemu-internal runs "ldd qemu-system-xxxx"
+            # Need to be careful here since runqemu runs "ldd qemu-system-xxxx"
             # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
             basecmd = commands[p].split()[0]
             basecmd = os.path.basename(basecmd)
-- 
2.9.0


