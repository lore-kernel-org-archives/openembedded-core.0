Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D48436BC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:51:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7S2ponZ026306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 19:51:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 27 Aug 2013 19:51:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2013 10:52:05 +0800
Message-ID: <f0b21f7218b037ed76014a341b68568ef4474675.1377658086.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377658086.git.Qi.Chen@windriver.com>
References: <cover.1377658086.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] runqemu-internal: provide more info if a preconfigured tap is used
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
X-List-Received-Date: Wed, 28 Aug 2013 02:51:50 -0000
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
 scripts/runqemu-internal |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 8165e13..f9d8728 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -214,6 +214,7 @@ else
             fi 
         else
             echo "Using preconfigured tap device '$TAP'"
+            echo "If this is not intended, use flock on $LOCKFILE.lock to make runqemu skip $TAP."
         fi
 
         cleanup() {
-- 
1.7.9.5


