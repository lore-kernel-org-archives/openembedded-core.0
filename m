Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96DF97BFBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:48:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6mViq009136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:48:31 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:48:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 15:06:36 +0800
Message-ID: <10d326febf6744315b0cb324b98b9f3bd9ea4056.1548313558.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548313558.git.liezhi.yang@windriver.com>
References: <cover.1548313558.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] native.bbclass: remove invalid CONFIG_SITE
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
X-List-Received-Date: Thu, 24 Jan 2019 06:48:30 -0000
Content-Type: text/plain

This CONFIG_SITE has no effect since autotools.bbclass handles it. And the
comment line is out of date, it was for "CONFIG_SITE = ''", so remove them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/native.bbclass | 3 ---
 meta/site/native            | 1 -
 2 files changed, 4 deletions(-)
 delete mode 100644 meta/site/native

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index ddccfe2..c20c6dc 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -54,9 +54,6 @@ TOOLCHAIN_OPTIONS = ""
 # Don't build ptest natively
 PTEST_ENABLED = "0"
 
-# Don't use site files for native builds
-export CONFIG_SITE = "${COREBASE}/meta/site/native"
-
 # set the compiler as well. It could have been set to something else
 export CC = "${BUILD_CC}"
 export CXX = "${BUILD_CXX}"
diff --git a/meta/site/native b/meta/site/native
deleted file mode 100644
index 7dfb1cb..0000000
--- a/meta/site/native
+++ /dev/null
@@ -1 +0,0 @@
-ac_cv_path_SED=sed
-- 
2.7.4


