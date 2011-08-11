Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0r-0005ny-2N
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:49 +0200
Received: by yia28 with SMTP id 28so1528701yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BONQynslFvq2gPeNI+GuRTXXlVIfnasof/HwD3pESMg=;
	b=nHsH65CFb7Uf+5IetxwpyYZlP7Bsm5qqlmBBvIsLRdf9Ji3zbpwS8YxPnkBzLeX74n
	DHL6DgwVuYSkgvjigNMUHcQk6mihRcsweEulthfcT6wSAoaLqTsg3JptPrt86v+1UH6D
	6tRQhI/bz/finpNLkcAxFg1+Xf9YG9Hi6mz9Q=
Received: by 10.150.225.18 with SMTP id x18mr970663ybg.273.1313087116701;
	Thu, 11 Aug 2011 11:25:16 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:54 -0700
Message-Id: <25fef457e6d4277ba62ade4a240e5f73039e707a.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 7/7] cross: also empty PACKAGES_DYNAMIC
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
X-List-Received-Date: Thu, 11 Aug 2011 18:29:49 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/cross.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 519aa0d..5681ab9 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -5,6 +5,8 @@ inherit relocatable
 EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = ""
+PACKAGES_DYNAMIC = ""
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_VENDOR = "${BUILD_VENDOR}"
-- 
1.7.4.1



