Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7338ACDE008
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 11:15:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8885.1782386133155141025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 04:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SMu1TYqw;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so18314775e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782386131; x=1782990931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOyzXRlUumdQ4X502/WBMaPS2nTAzPKemuBTwmUbGGw=;
        b=SMu1TYqwHzZMAmnCYN04hsZAbfaJxjFgnqE9XjjkQtV0P1OHUdsySTA23zD0Qdk90l
         C4x0SqtxCluKBUJNlNRPBCjz29cB6JqNasvgTZEXah04asmbqCM6yLB4XoU5UBkwF4Sp
         GNQkJ031JfHDN5XdAl8koWeVBqKDy+9GstsKfz4AG/Sh/NHlBu+Qqs8ublRnhRC2X6dF
         O96VaYaoOLY5KBNfECepwMalUCdR9d6EpYVum6Jw5q6QhRaqjXmcsiuDjbMvA30KJ5VB
         Rw4QFEsKLmaY9fYVQy2VUlZtbz34MtURZn5bi6l1N2oKjt/uDmBM7g4uw08mdZpC6Sq2
         xc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386131; x=1782990931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOyzXRlUumdQ4X502/WBMaPS2nTAzPKemuBTwmUbGGw=;
        b=mvL39OniVO6PpJ2ekVJxYCQONNH2/h+Uo4EI6PaPJ5jkDWbHa+aBTnu6Zsaec5iVRR
         EXXwc8JTAYckkwPcFDh/fr2YvbLYnUE6s+Y4WB9ENWttSWFEbEG3OLLlvq+YrNR5ZXoe
         QUQE9YK3M5JK5c4oVxYb4yJo1m54ZadkhUBuojUCUUv5OXixdb4In7Pf2Q7ZBc8NuBzi
         RDB7ifisOcOZ3O40KCwvzvjUTqMzQw24KJxD/AbbdbosSB5T/JQa4uMb1i+n7dzHf5Nr
         glyhC6MkEqcWol0Tg5jDpxzvqWzxjBUq+gPAOy/X6NSaeQj85XqjZ3Uj0xy3BgtYN49m
         vbMw==
X-Gm-Message-State: AOJu0YzMHGKghHBAWv9nu67d9//sutLTLoGcfek05xfEN1drpZelgPcT
	jC8XF+gelXtwQUpGXlNaET20MN8k5oOhStehVcLeav7AWP+G9oesP12ukkPOTQ==
X-Gm-Gg: AfdE7cmUAh4nQMme40jII5yiUscV6IXFPofHhjoccB5k2QJk5WBZjU7rnOkE51IsuKy
	W55+2Cke8dD9uAjhlsJJrG2pvvnVje3cbfmlV2XVQr9LlDpmPf+AfaLCBJ79M+sM946Ni22XH8f
	gzYSwLjEGlv6H+NKaUYrdybZFO2Gz9aeVQnetR+X7W2DYMDF8KFw+tyz/F8RY56ucZeaAlb36Qk
	IMiM0Cs0agGkmGrdrJZJ9U5Knf4U4vNZHcyTpkh1SQe3EFG7NF6UMpp3/aaQbkKIjcCvZ6vdeVO
	cAHUFHI2AB8IPzeJ+OMfF0vXaFhjF1Yk9r4R8wvXAPaKxqzTFdu1ICYxBkG61LNzv88K425sWye
	yNLivX3j4rJ97OyP3MU9L5eVQ+u4AcpFfhGNbI1nK+u34zcRy35pXI9a5dQiBMWm9jzezlEUW95
	nZVL920dRFBr0WeZ/EJo88elb29OW5LjyvJOA=
X-Received: by 2002:a05:600c:8b88:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-49266893312mr27577665e9.29.1782386130946;
        Thu, 25 Jun 2026 04:15:30 -0700 (PDT)
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660addddsm53884445e9.6.2026.06.25.04.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:15:29 -0700 (PDT)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Awais B <awais.b@rufilla.com>
Subject: [scarthgap][PATCH] cve-update-nvd2-native: allow setting resultsPerPage
Date: Thu, 25 Jun 2026 16:15:24 +0500
Message-Id: <20260625111524.3796292-1-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 11:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239554

From: Awais B <awais.b@rufilla.com>

It is seen that during bulk updates on the NVD side the server
struggles to keep up with the default/max of 2000 entries per
page and we see a lot of incomplete read errors resulting in
proper db sync failures most of the times. Lowering the per
page value noticably increases the reliability of the process
and hence should ideally be configurable.

Signed-off-by: Awais B <awais.b@rufilla.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 945bd1d927..5d8b76e62c 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -34,6 +34,11 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
+# Maximum number of CVE records per API response. Default/max is 2000.
+# Lowering this value can help avoid incomplete read errors during bulk NVD updates.
+CVE_DB_RESULTS_PER_PAGE ?= ""
+CVE_DB_RESULTS_PER_PAGE_MAX ?= "2000"
+
 CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
 CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
@@ -217,6 +222,15 @@ def update_db_file(db_tmp_file, d, database_time):
         api_key = d.getVar("NVDCVE_API_KEY") or None
         attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
 
+        results_per_page = d.getVar("CVE_DB_RESULTS_PER_PAGE")
+        results_per_page_max = int(d.getVar("CVE_DB_RESULTS_PER_PAGE_MAX"))
+        if results_per_page:
+            results_per_page = int(results_per_page)
+            if results_per_page > results_per_page_max:
+                bb.warn("CVE_DB_RESULTS_PER_PAGE exceeds maximum of %d, capping" % results_per_page_max)
+                results_per_page = results_per_page_max
+            req_args['resultsPerPage'] = results_per_page
+
         # Recommended by NVD
         wait_time = 6
         if api_key:
-- 
2.34.1


