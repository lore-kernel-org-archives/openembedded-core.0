Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 95898615AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:15 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so4175021ead.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VZlL4K/Ph2xvgrRacRno6jjsYD+yE9lEgsGcR9L6tbI=;
	b=A1apFTRBzoGIj5buCU2n0MOy/QqLeKpiTiM9AFFof29XYxfO40lvd5G4CVV3Jq1Hg8
	EXgsWw8HCPUJZOavOjZto53I5yloWxfywBWIUQSv0RdkOEXsOjzHqhyJmv0uxDyeWGsW
	R8fGmgCflvX1BETzPVwIMywWsmBfibu7oTZpWwx/+Wa3Bm3rYgNWFPrcscdIOPxHLn4E
	+uEbALhzvQioc4Zec8dHdQuWmL51aKfT/NgbmDKejqDFh1EbKRduJljSvJRXW3sgzD/P
	LqiaWSJiIPbpIUa1ueXMj4Y1BgRf4F4NaeYZAVQkaVy2bEYMpL91B9ESBXiYnxfjomi9
	xdhA==
X-Received: by 10.15.111.201 with SMTP id cj49mr26427922eeb.56.1390350976288; 
	Tue, 21 Jan 2014 16:36:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm20615786eeo.10.2014.01.21.16.36.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:07 +0100
Message-Id: <d0669896375ce0df754a39406084939b1ff6d16f.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RFC][WIP 2/6] feature-arm-thumb.inc: Replace inner quotes with apostrophes
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:16 -0000

* so that it's highlighted correctly
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index fa3a4e5..d58c4b4 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -6,20 +6,20 @@
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
 ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${ARM_THUMB_M_OPT}", "", d)}"
-OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${ARM_THUMB_M_OPT}', '', d)}"
+OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t", "", d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7a", "thumb" ], "t2", "", d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv4', 'thumb' ], 't', '', d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'thumb' ], 't', '', d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv6', 'thumb' ], 't', '', d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv7a', 'thumb' ], 't2', '', d)}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
 # arm system and vice versa. It is strongly recommended that DISTROs not
 # turn this off - the actual cost is very small.
 TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", " -mno-thumb-interwork", " -mthumb-interwork", d)}"
-OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
+OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ':thumb-interwork', '', d)}"
 
 TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -marm"
-- 
1.8.5.3


