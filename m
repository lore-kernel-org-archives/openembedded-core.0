Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7A8C982D8
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 19:16:04 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35014.1789931755106866435
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 12:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kA6x5uPw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260920191551bc92c8c17300020734-u_hypb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260920191551bc92c8c17300020734
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Sep 2026 21:15:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Mf3eUDuHb0IZgItgvxL6NIMo5zVZf2bS6G41uVx9C7w=;
 b=kA6x5uPw2WS/VNDESKPcn9ZzwE0MoOtQ+Ddx4NQp7kD0XxSGM9S7ZJde+sH0Ehn4IgZEjo
 +q22cf+/CDiwwAR7h+g57mm9a/WUnAh5b0QtsvaoqzdgjbJOIIRlw8OPrhZ8Xw+xMLHWHA5W
 dVHCV3FGNM+u5qH1lexpSUj8KiqtrEM6DF0EOXQxDctqAPANsZANQxZF/yH+o5w57wzSj45j
 vRK99mgEWR5rDUrv31we8mj9MR/dJr8PVhHHxNjzu+QRqJAW4cYyUXt3ZHRSL4QKepfqtKUz
 CPYjxiieV42Mos474ECkgiW7RGkla+8AF2xBZdHXHK0UimfVisY5xtyw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 1/5]  sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native: upgrade 2026.08.03-000011 -> 2026.08.25-000009
Date: Sun, 20 Sep 2026 21:15:27 +0200
Message-ID: <20260920191531.113024-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 19:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246263

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 8d6b930f4d11627b90db3e902e382692c38cde15)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...03.bb => sbom-cve-check-update-cvelist-native_2026-08-25.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.08.25-000009.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-03.bb => sbom-cve-check-update-cvelist-native_2026-08-25.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.03-000011.bb => sbom-cve-check-update-nvd-native_2026.08.25-000009.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
index aa21b06953..dcbd98396d 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "b160e6f2915ac726b29ee0689fc920f5016abef5"
+SRCREV = "ce11dbdcf79189e965d64b29161af93993619281"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
index 720b5ded0a..473e33411c 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "b9f52bb052695dac5cabbd58e049eaac73697161"
+SRCREV = "08cb7bde86fe9057c2338d7d61a705e642775bfd"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

