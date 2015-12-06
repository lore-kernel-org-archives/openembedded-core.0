Return-Path: <matt@madison.systems>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 10A9A601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 17:09:34 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so112018775pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 09:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9PPGnsllHOKgyQXuR+xnoAP3LU5eBgL/rR2c5xCV0Yw=;
	b=DMiW9KjVBEMGPbDtpJBxVabzspDDYoEcb4uyblVR05GGgG9inj7TUu4U1jZvu0n8jT
	Iq4TG5ddE/QQCy+v9aeO3m58F4h6Mqv8RD0z8zTTnez/tqdWN1i7idbjDtnThTszS5Tl
	YANgZsOphdPYEiRZC3//dLJOZGt5T1GLlobszSFYfIWW8vNeM1rW7XtNkG1TyUtaTzng
	RrO062OfqDUmLAtynyqmvu2hxbsY0OckiJPYwWBzgjJzAiwvobiztLlVj1Lpdv001hrn
	0XhCwrbZPQAt2uPFKNQSyJVkHe3tKKWnnPBjyKjd62yhuzZT4kL4JPDWhmNN1HoaMe3s
	Gjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9PPGnsllHOKgyQXuR+xnoAP3LU5eBgL/rR2c5xCV0Yw=;
	b=IFN3YWL2/kI1E5DS3baR7OUOxjtg0Q/YvLBMbiyd05VNGzkF/c4/iS/chbuSSiWy3M
	DHRAMTIN6O6NoF1x1e3grfVfuwcxeQ9uPJxqjguzub3i20Cp0vPbJz0WQY8JIW7Fq4X3
	xR/k4VtmTfxFfjWJWzsrJy8rPGwmsBoQN26N5USEiWyT7Cytt86+Fxk8g1DVg6cOVc4I
	7RnLrqNHc0D4JS461d5qNvV28Sjfj8xezyfXM/L00hGGDSz3ABS87UAs96VAMTqweQvx
	SWvnJgBv3L0gT2z6EnOggfkm26MVTlaxY7NvaacFHA6rGZ1XdTz3alh4ZNSmM02rI3j7
	j3rw==
X-Gm-Message-State: ALoCoQkKJr56d+bdG6p+vNhgU5yYOM6ONv3FEdPeAIIl4Ye45rG8PmTmE57zUxKTh89H7g3ZiVSW
X-Received: by 10.66.216.7 with SMTP id om7mr36793930pac.90.1449421775761;
	Sun, 06 Dec 2015 09:09:35 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	h10sm29367381pat.7.2015.12.06.09.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Dec 2015 09:09:34 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Dec 2015 09:09:11 -0800
Message-Id: <1449421751-12670-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449421751-12670-1-git-send-email-matt@madison.systems>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
Subject: [PATCH 1/1] feature-arm-neon.inc, feature-arm-vfp.inc: fix vfpv4 suffix ordering
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
X-List-Received-Date: Sun, 06 Dec 2015 17:09:35 -0000

Make the feature order in ARMPKGSFX_FPU match that used in
PACKAGE_EXTRA_ARCHS when both neon and vfpv4 are enabled.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index e9351f9..f671a53 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,3 @@
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' -mfpu=neon-vfpv4', ' -mfpu=neon', d), '' , d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', '-neon', '', d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-neon-vfpv4', '-neon', d), '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index e23d377..a1a2c61 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -10,7 +10,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' -mfpu=vfpv3', '
 ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', '-vfpv3', '' ,d)}"
 
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', bb.utils.contains('TUNE_FEATURES', 'neon', '', '-vfpv4', d), '' ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
-- 
2.5.0


