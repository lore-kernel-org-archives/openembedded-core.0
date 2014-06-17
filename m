Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1866FEE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 09:01:39 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so6754471wes.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 02:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4QIWMnjvGcouP0woOfyeS4yWsbaNotr0ySk6m46WCcU=;
	b=iwjNdYVxy8ntT3P/QFi+NZMU2jLImRtIY4WkiPZpqMUXkTJ5Jz2uut8XByaJ/B1XvO
	88rf06F8h941zHi7zt6E/BChWElpvwftvfIdIwpqbQCJqNPvujXnxa6BXyGvJQLrxDxD
	PsTZp5DccjY1Y26vbkAjqqmU8URalO+hbHHBpXDH1ecQbyzJQBfxhQ/AlBr3w0SVtn6O
	WRIJZu0M6pCWk/MjH7DyuiIIjhAaTWDoX1b2BMP9+RNIgx5qjM8Z3FkIqd4FR6AR1qNC
	DVZhTmMOslo5obuyRf6/f1TDyrUPKP4MqqcMLU2KvPfAe8U9UzjorTJdooUjZJLczwD/
	GSOQ==
X-Gm-Message-State: ALoCoQnBIa7YeAOjryRSKFL0sTWtyvSr3DOd9wwIVF1xh8QpAICKYK0Dy4hmfWQCEdzKpy7CS4x8
X-Received: by 10.180.94.37 with SMTP id cz5mr34407064wib.19.1402995700244;
	Tue, 17 Jun 2014 02:01:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	rw4sm22354280wjb.44.2014.06.17.02.01.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 02:01:39 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jun 2014 11:01:28 +0200
Message-Id: <1402995688-21105-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1402995688-21105-1-git-send-email-koen.kooi@linaro.org>
References: <1402995688-21105-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 2/2] hwlatdetect: fix PV
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
X-List-Received-Date: Tue, 17 Jun 2014 09:01:46 -0000

As an extra safety measure set PV in the same place as SRCREV.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-rt/rt-tests/{hwlatdetect_0.85.bb => hwlatdetect_0.89.bb} | 0
 meta/recipes-rt/rt-tests/rt-tests.inc                                 | 1 +
 2 files changed, 1 insertion(+)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.85.bb => hwlatdetect_0.89.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.89.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_0.89.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index ee5a1af..7fbe6d4 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,4 +1,5 @@
 # Version v0.89
+PV = "0.89"
 SRCREV = "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
-- 
1.9.3


