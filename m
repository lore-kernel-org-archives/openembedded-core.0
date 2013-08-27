Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62CFF6BA88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:07:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7R77qEo005188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 00:07:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 27 Aug 2013 00:07:52 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 15:08:03 +0800
Message-ID: <5150aa69facaf05be255db2bc58bfc0687800880.1377587203.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377587203.git.Qi.Chen@windriver.com>
References: <cover.1377587203.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] runqemu-internal: provide more info if a preconfigured tap is used
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
X-List-Received-Date: Tue, 27 Aug 2013 07:07:51 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We should provide the user more information if a preconfigured tap
is used. This is because the user might have manually set up the tap
interface to be used by other qemu binaries.

So at a minimum, we should let the user know how to make runqemu skip
that tap interface.

[YOCTO #5047]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 3f8674c..d6ceb28 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -211,7 +211,7 @@ else
                 TAP=$tap
             fi 
         else
-            echo "Using preconfigured tap device '$TAP'"
+            echo "Using preconfigured tap device '$TAP'. If this is not intended, create $LOCKFILE.lock to make runqemu skip $TAP."
         fi
 
         cleanup() {
-- 
1.7.9.5


