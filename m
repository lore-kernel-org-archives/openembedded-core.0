Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C43FB77047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4I7hoFq013820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:44 -0700
Message-ID: <918d6d61f77c487e4cd8aaf6f2cb519f46256369.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] buildtools-tarball: replace nativesdk-python with nativesdk-python3
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
X-List-Received-Date: Wed, 18 May 2016 07:43:49 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index dd28b96..f45e781 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "SDK type target for building a standalone tarball containing python, chrpath, make, git and tar. The \
+DESCRIPTION = "SDK type target for building a standalone tarball containing python3, chrpath, make, git and tar. The \
                tarball can be used to run bitbake builds on systems which don't meet the usual version requirements."
 SUMMARY = "Standalone tarball for running builds on systems with inadequate software"
 LICENSE = "MIT"
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 TOOLCHAIN_TARGET_TASK ?= ""
 
 TOOLCHAIN_HOST_TASK ?= "\
-    nativesdk-python-core \
-    nativesdk-python-modules \
-    nativesdk-python-misc \
-    nativesdk-python-git \
+    nativesdk-python3-core \
+    nativesdk-python3-modules \
+    nativesdk-python3-misc \
+    nativesdk-python3-git \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
-- 
2.8.0


