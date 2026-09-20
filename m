Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0E9C982DA
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 19:16:34 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34764.1789931786109972823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 12:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=c3lfGOmK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260920191624c3b3d2c42500020738-mcailh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260920191624c3b3d2c42500020738
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Sep 2026 21:16:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9iKavfBMKRp3cpBouYbNpRKeRBpvtIx7co+Xt6z9R/8=;
 b=c3lfGOmKYgu66FWcDq5uqdUv8GQsKIVmBm6LR7z6f8eFqd9iUZCq7PwOtQduo+kTHrXjke
 DdfsfRNWZXhNfWmnvQ7iBQ8/PU5+QF6I9QvGTAPr0oWlLil7XRLcdpS2Q7hNmuxjJykrJpCM
 wZBn5ezs7kNVOPRzsFxcKoHW8DmwEzk0BB4fgZDKND5tGhIYO8DVhFm3KMRBtRNKN5gwDXiQ
 zV1Qq4hkXESF+xsAh/umkR61NnVIU9hta78Qnjj7fIilfkiRQ6dNj+mrwjTbl8jzx1X9uB0o
 Ye0Kgc7p1+k+1O5m/4gnYO8nnlM/RMBNX2OSVWF6nXqygd/Fs6qim+3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 4/5]  sbom-cve-check-update-{nvd-native,cvelist-native}: upgrade 2026.08.25 -> 2026.09.12
Date: Sun, 20 Sep 2026 21:15:30 +0200
Message-ID: <20260920191531.113024-4-peter.marko@siemens.com>
In-Reply-To: <20260920191531.113024-1-peter.marko@siemens.com>
References: <20260920191531.113024-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 19:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246266

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to newer database versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 5bc50f5f1d7a8b4c37d32d78558f79a2337c3752)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...25.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-25.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.25-000009.bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
index dcbd98396d..b609b43f22 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "ce11dbdcf79189e965d64b29161af93993619281"
+SRCREV = "9b9889cfd98306bf29b91df076c5118aae80b63f"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
index 473e33411c..7ba8647d6a 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "08cb7bde86fe9057c2338d7d61a705e642775bfd"
+SRCREV = "82336c26ab85706ae56efaa36ef5851ab92dd32c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

