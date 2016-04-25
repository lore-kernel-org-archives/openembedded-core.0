Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 62CF66FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:14:47 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n3so148311537wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Zkq0mOTR1dWDrfLfVAP2xUW1ECJluCnU2rDscZh7fM4=;
	b=1+p7nOhaFuX93DvkCT8EBtK+1VkkHVsxChkXUb/S+MC0CVIeQ4mB1K2s/3mbGzSE9b
	jV+hMUikbV6qbGFETBqzTbpXldqkDgwzEI6f2GwNLbRsESlOfpFtdRe30WHoGJ/0t71D
	j8YWkMsEFCj3ehpdzPd2+tP3PXXxTHiHCCMHcbcPjOvNGq5FAA4potyf2nROWpcXTWhX
	Q+EIJS6XqYwuhvBwhvoJcUotazYKUd5X7IsQCbNhJktvewxBLYrnhPUPZhzBbsnS6nYW
	Z72ptTWFO5EKrXw9jeetkx4in+Ak/y1uqFA/LL95rLz4kDZaSgcGh8bJK9eAVt2YPPwV
	u+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Zkq0mOTR1dWDrfLfVAP2xUW1ECJluCnU2rDscZh7fM4=;
	b=ljkeHZ4xyEf5wWQS7spuXAcZLmETdOVsovGtnn7dt5bNaKHajUqg3G1q5lm4ZmiyvS
	sQea0ZRVvq9GwYbQ6SgtqjoMRXp8p5JfjF05C7wopwc+nSm00tokDADT8RCwSKiccDjg
	jVEk7rvFRGKX8uwDYYwnIuab/Z9hsxRVnogHAVvctd80DJ61KZpJrMJMPghWHda/sDWB
	fbIR59cvKvhhYjRrYFqU6ukyqnldztDi5yB5bYzv0TmlCW2zLLhxDDInpC/mC3r7f6IR
	bL1bCNT1kmUERKtnxJK7ghc0cBFF6zRz7GiB91IcEV3Ad5qrapSfr21AKA3ZVjbgzgKR
	t/lw==
X-Gm-Message-State: AOPr4FWB8r57YAcnLWQEaGGYLegCL9x+z1DG5Qr1gAtKWN7fSee3pFBVwCpeNl2sIiZmvlAe
X-Received: by 10.28.45.216 with SMTP id t207mr14144751wmt.40.1461618887094;
	Mon, 25 Apr 2016 14:14:47 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	u187sm9425684wmu.21.2016.04.25.14.14.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 14:14:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 22:14:44 +0100
Message-Id: <1461618884-7038-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] oeqa/sstatetests: remove temporary DL_DIRs in noop_samesigs
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
X-List-Received-Date: Mon, 25 Apr 2016 21:14:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 2c947bb..ad59146 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -415,6 +415,7 @@ INHERIT_remove = "buildstats-summary buildhistory uninative"
 http_proxy = ""
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
+        self.track_for_cleanup(topdir + "/download1")
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
@@ -429,6 +430,7 @@ INHERIT += "buildstats-summary buildhistory"
 http_proxy = "http://example.com/"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
+        self.track_for_cleanup(topdir + "/download2")
         bitbake("world meta-toolchain -S none")
 
         def get_files(d):
-- 
2.8.0.rc3


