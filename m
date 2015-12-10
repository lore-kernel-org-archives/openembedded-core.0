Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BCCCC73184
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:22 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w144so24581675wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=EXt6K06DJSEHzIG8jq/ShdyaTtoslbD1z66XzSSCvrg=;
	b=EVaTVjxkdRVae2zLqJXlWIc7HB5rZI5QMVJZS4z5t54E2ua9u4nj3bkkyv4Y7FLMZv
	AQQ1X+k4erfV6XCuky5vnR5nLB6nJqp1q2HfPxLuUONMejgWmEiV31e0ue6+HgNCOvU/
	xMYYD/46R4Q0YIokK2KWglDUej4Cmg26jGOmRuqwJEBzRVtniojx23gmutx5LkfIrh2i
	T7AZoob4WdpAu8U5BOb9oQ/ws7QlxxVJwpq8I0wZylqq6aiIEhjE3Tbjj6RxWLiB6Sj1
	w+rrZ/WJlcrcp/nYkmBEaSlRpZuDlBiUVEf5rpS8adMxxnoV2e/stfq4SJUG3hgrP/BU
	/odg==
X-Received: by 10.28.30.14 with SMTP id e14mr17927743wme.83.1449755243373;
	Thu, 10 Dec 2015 05:47:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l20sm916013wmd.20.2015.12.10.05.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:45 +0100
Message-Id: <5956ef188e2b18213b69840379b067f07474dd2f.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 08/15] arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:23 -0000

* both belong and already are in arch-armv5-dsp.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv5.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 6a17972..e6ff902 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -5,8 +5,6 @@ TUNECONFLICTS[armv5] = "armv4"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
 
-ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}"
-
 require conf/machine/include/arm/arch-armv4.inc
 require conf/machine/include/arm/feature-arm-vfp.inc
 
@@ -33,7 +31,6 @@ PACKAGE_EXTRA_ARCHS_tune-armv5-vfp     = "${PACKAGE_EXTRA_ARCHS_tune-armv5}  arm
 PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp    = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp   = "armv5hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp  = "armv5hf-vfp armv5thf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
 
 # Big Endian
 AVAILTUNES += "armv5b armv5tb"
-- 
2.6.3


