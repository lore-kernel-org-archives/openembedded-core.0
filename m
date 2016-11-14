Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91F557197B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:34:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAEEY8sB025763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:34:08 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 06:34:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:34:04 -0800
Message-ID: <3c1340adf7e9ec38b040df984d68a345f366c6f3.1479133967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479133967.git.liezhi.yang@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] testsdk.bbclass: print which file is not found
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
X-List-Received-Date: Mon, 14 Nov 2016 14:34:09 -0000
Content-Type: text/plain

This is helpful when debug.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testsdk.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 43342b1..06b4c50 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -59,7 +59,7 @@ def testsdk_main(d):
 
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
-        bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .")
+        bb.fatal("The toolchain %s is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
 
     sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
     bb.utils.remove(sdktestdir, True)
@@ -109,8 +109,8 @@ def testsdkext_main(d):
 
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
-        bb.fatal("The toolchain ext is not built. Build it before running the" \
-                 " tests: 'bitbake <image> -c populate_sdk_ext' .")
+        bb.fatal("The toolchain ext %s is not built. Build it before running the" \
+                 " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
 
     testdir = d.expand("${WORKDIR}/testsdkext/")
     bb.utils.remove(testdir, True)
-- 
2.10.2


