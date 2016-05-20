Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA0460557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 10:54:18 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n129so266294288wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=r8z9BhhAUwzgH+ZfyS3L1WTZ6kNqh/U98ax7O7BpC3E=;
	b=q1Oidh14j43/dyoeV6myVw/KGBUqbQ23pMKpuiLTv9e3v+I46lxnIGdG6IqxiON/rB
	2ECIS6L8Bm1jNRLZ6E8N5vPJ7ZPdnG3YfdDojZFggiqsPvaZhh6TRVogPZSU+N3y0K9a
	9d56U4CY6IK2n/M0850VW8M0QNB2AU+chzJJXfUj8U7xuO4E9vhROPP74oMkQve31t1j
	0sdE4J1i4q/glHRayb1OB2FeemKvVeyua7Rd/gLtBTj0diQJa/Kk+Sb0Zpdnz9pO0I+m
	4y2ZxOe627K1zEiRdAIp2AXZ8K7WnGCox8Ddr3Y+qhG6vPpZdgUU1F1ZXnUziB27BmGK
	Ceww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r8z9BhhAUwzgH+ZfyS3L1WTZ6kNqh/U98ax7O7BpC3E=;
	b=k+mI8evliN0rM4t9G2tmAb8juqYmiwKZeRx+8eR8Wj2yHBd/NkbZ5SX3GDZwe6EOQU
	n8+rHyrsUjEsZucFXLWewblHCWMFQ3Tj6hP2jNkqeMx5t08j9A0vwuXQysZYX5sv63+w
	YrPi9mD83TkPBgZOvT2quT/7fpf6vtoUwYSAj5aeN8zVY6Wp0mPt2f6Gf55qztD53nQV
	LnB7MHT89Wys33VP+VB+8sUrRn4XvRsPyS6i9w4b84mHB5TJAU04QwHcf0sULKxknn0A
	hyr0uBBAEyF6UtvaDhMhVfeo1M6JxxrheqbC6Lgxx3HH2H8flArfIG+97dzrQ+GmsYQi
	BRcw==
X-Gm-Message-State: AOPr4FUoGrpKogS9CBD6LKL9XLUri9jwskTQfVRkuY3Ck40YvSpaka81rVWT/VNb82yk+Mxz
X-Received: by 10.28.8.213 with SMTP id 204mr3094624wmi.93.1463741658383;
	Fri, 20 May 2016 03:54:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	jq1sm19141907wjc.28.2016.05.20.03.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 May 2016 03:54:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 11:54:15 +0100
Message-Id: <1463741655-32423-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] wipe-sysroot: fix wrong glob when removing manifests
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
X-List-Received-Date: Fri, 20 May 2016 10:54:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index 9e067e8..5e6b1a4 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -51,4 +51,4 @@ rm -rf $STAMPS_DIR/*/*/*.do_packagedata.*
 rm -rf $STAMPS_DIR/*/*/*.do_packagedata_setscene.*
 
 # The sstate manifests
-rm -rf $SSTATE_MANIFESTS/manifest-*.populate-sysroot
+rm -rf $SSTATE_MANIFESTS/manifest-*.populate_sysroot
-- 
2.8.0.rc3


