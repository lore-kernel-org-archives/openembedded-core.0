Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFB465DF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:40:24 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3004918eek.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=WGuzETQj07vSOBXnVoPiktYxWZaGC8SDB+EBUK+oz90=;
	b=fix8VPfrpolxeETuO949N5zfNqTA95F3jpOWCoz3oR/A8Dbf2OMq7Xzwfw1CYoSNwg
	jByxX/wIrgu4GrDpoY4+XgHczfRBpnOWV2jOdcm74A0KFQuBPu3HDKudzOH2VO1xPq13
	EJ33rgPt4UWObzj7oofVWRAYX3ulneUi0ZhIUT8ycQPGVrnBBeViDP55wEK6fntAAxGx
	zpggF+YK008DHZHIVM97UFE5uMdtpsE2enJ4wlzhjFbdupBQrylZ58bdgPGMWoas6Pof
	gzQNROJp91Lyggan5cS2PlDPLVI1IVvspmUsffVeiWKtKLcuhc6WsOTII4Flbte7sGqu
	E/fQ==
X-Received: by 10.14.126.73 with SMTP id a49mr11778824eei.46.1398444025826;
	Fri, 25 Apr 2014 09:40:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm26104607eei.24.2014.04.25.09.40.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 09:40:24 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 18:40:26 +0200
Message-Id: <91d31e9273860971afe06a127ed0d054224e9c5e.1398443925.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] feature-arm-thumb.inc: Replace inner quotes with apostrophes
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
X-List-Received-Date: Fri, 25 Apr 2014 16:40:26 -0000

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
1.9.1


