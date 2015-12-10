Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 57EF573179
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:15 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c201so33872243wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=caLpu4Nx98x5qnsLKZXSycmTITEi9qiXc3RYqkprUYA=;
	b=D2otluYcYqcKI5dr8FGIXWHNZZbaWC0C5AvLoW71cxzdPoWUOc+uvhzZ+TScmWTS62
	vk2EU+5paGs9uGzktGbolEeJ7/XraY55IRCu6LuSNfN8cjJAJF7e5uR/NKvgOl4yWUhT
	JrSCINrUrlsWrvHKh5Ms4ynefiOk8t72Kdci/JauaHEZcAz+wqUBuQXEwBVkQW2v4Gz5
	H9jODnVKS1MmtmTeriM/A5daEzdNn/XWRtZD1LDoZFlTO3pCOZ6uxQQgPQvxADoo0lk/
	ll9WQIUlCGG6DzwISgMRMrKw5PR7vPxXkaSLhnbPDp1Ur17pW61kUznez8C1Mz8m9q5M
	P/YA==
X-Received: by 10.194.20.164 with SMTP id o4mr13137018wje.105.1449755235999;
	Thu, 10 Dec 2015 05:47:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	186sm13008062wmv.9.2015.12.10.05.47.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:40 +0100
Message-Id: <89ff4353ebb052355764550291092c7933d6206c.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 03/15] arch-armv7a: add missing space before ?=
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:15 -0000

---
 meta/conf/machine/include/arm/arch-armv7a.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index b962e4c..f819f6b 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -16,7 +16,7 @@ ARMPKGARCH_tune-armv7a-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7at-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7a-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7at-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7a-neon?= "armv7a"
+ARMPKGARCH_tune-armv7a-neon ?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7a ?= "arm armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?= "${TUNE_FEATURES_tune-armv7a} thumb"
@@ -43,7 +43,7 @@ ARMPKGARCH_tune-armv7ahf-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7ahf-neon?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-neon ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon-vfpv4 ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon-vfpv4 ?= "armv7a"
@@ -76,7 +76,7 @@ ARMPKGARCH_tune-armv7ab-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7ab-neon?= "armv7a"
+ARMPKGARCH_tune-armv7ab-neon ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
 TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
@@ -103,7 +103,7 @@ ARMPKGARCH_tune-armv7ahfb-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-vfpv3d16 ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-vfpv3 ?= "armv7a"
-ARMPKGARCH_tune-armv7ahfb-neon?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-neon ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ahf} bigendian"
 TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7athf} bigendian"
-- 
2.6.3


