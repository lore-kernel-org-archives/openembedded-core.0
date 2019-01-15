Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 92D146BDCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:50:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i12so501054pfo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 17:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hA3FI8R0mlnmaJhOW5uL5RrRPq1SjPOIST9goDMW97I=;
	b=Qzo95kPlbKvEr58e0HKmNqPlB17tx5hUmmjqJTVYsupJpGPcDgFKu1eWDHogteuIGK
	r9IcuozsyLJY7vdczn+yS/tZf2lV6y9j4V/P3Zesl5Qup3yp6atwwwPGtncXkPzJpPIz
	YFMeKqGzGaqmzX7YCX2jtsJ4fFKdnC2OulZdBI3mMIjJSBEiesNTRuGjffUzlzfDmBBC
	0P3kF9q6imwga9Yg5c0xN9c2WR5nuR3/5Cs+h/Xp/isdskIX9xnByCVqonPKpIJRh4Iw
	65sa5S8qryjJ9bIeXBb6V0zSL2JY6PIlLmGsPSeRgszwAey/0wE7xChPKYnDEtaAhZxT
	STlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hA3FI8R0mlnmaJhOW5uL5RrRPq1SjPOIST9goDMW97I=;
	b=Tr9xmXagYuLacjQvwZSIxKkOXXiMu8flI3a3io1ipgEMaDYKHTma33YB/sM6jXaxa7
	lWXe+9I9YStRYn4ry9VSouEOzidjDPdMuKOUDi2CIQ0dTBQB20XPimWrEZixyfOVWiYF
	DUWx7tsnhtHkFgufhU1JicUcby/pi+FbZjmOB3pYZua1NGAGjaq4GuEebR/nEXTYl98q
	Donn6BzhNvGkZ+4GRm58qtlV9dku2gNEfL1k2QlFr57FpUgvzkmrqEaz0pgW+YaBD5Gc
	TwDJ/gFBxKlVG5XFjrtdNQXMSZ53+mvtJl6U/4TatqIO/3FrncNMfjpctA6WTA1iGVe7
	gP4w==
X-Gm-Message-State: AJcUukeJssbWWEn+G1VAOuzoLFG75zKWJjQEsAT6Wz30KdBgKAev6aT5
	Qqfy8StKQeAlNlVGDSzfwi2sjTG5CYg=
X-Google-Smtp-Source: ALg8bN7UG3YP4qDln/uH4cNYRXcZ0KojgnXdpH86Ddy5DbY/7JRV0HCAnaHAtSzQ78oJxjkICAG0lg==
X-Received: by 2002:a63:160d:: with SMTP id w13mr1454723pgl.43.1547517053967; 
	Mon, 14 Jan 2019 17:50:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	p24sm2084238pfk.155.2019.01.14.17.50.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 17:50:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 17:50:44 -0800
Message-Id: <20190115015044.12892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] tune-cortexa5.inc: Add tune options for vfpv4
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
X-List-Received-Date: Tue, 15 Jan 2019 01:50:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa5.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 1f0cda6640..e9eddb407f 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
+AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa5             = "cortexa5"
 ARMPKGARCH_tune-cortexa5t            = "cortexa5"
 ARMPKGARCH_tune-cortexa5-neon        = "cortexa5"
 ARMPKGARCH_tune-cortexa5t-neon       = "cortexa5"
+ARMPKGARCH_tune-cortexa5-neon-vfpv4  = "cortexa5"
+ARMPKGARCH_tune-cortexa5t-neon-vfpv4 = "cortexa5"
 TUNE_FEATURES_tune-cortexa5             = "${TUNE_FEATURES_tune-armv7a} cortexa5"
 TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-armv7at} cortexa5"
 TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
 TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
+TUNE_FEATURES_tune-cortexa5-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa5"
+TUNE_FEATURES_tune-cortexa5t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa5"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-neon cortexa5t2-vfp cortexa5t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa5-vfp cortexa5-neon cortexa5-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa5-vfp cortexa5-neon cortexa5-neon-vfpv4 cortexa5t2-vfp cortexa5t2-neon cortexa5t2-neon-vfpv4"
 
 # HF Tunes
-AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
+AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon cortexa5hf-neon-vfpv4 cortexa5thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa5hf             = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf            = "cortexa5"
 ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
 ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
+ARMPKGARCH_tune-cortexa5hf-neon-vfpv4  = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 = "cortexa5"
 TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
 TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-armv7athf} cortexa5"
 TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
 TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
+TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa5"
+TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa5"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-neon cortexa5t2hf-vfp cortexa5t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-neon cortexa5hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-neon cortexa5hf-neon-vfpv4 cortexa5t2hf-vfp cortexa5t2hf-neon cortexa5t2hf-neon-vfpv4"
-- 
2.20.1


