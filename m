Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B768AC5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:50 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3557.1786186362414032632
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XpUbvdZD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260808105240896ccce88b0002074b-q1e2qo@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260808105240896ccce88b0002074b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1MFUPl+BusL8mVli2oBO1LpS6EckVsBMvM4LWIQ+H5s=;
 b=XpUbvdZDAA6sb7avttiokrt5TT2pXbm5VVcDsioid3b0kdIihlhYNDmrli+CuHabc3YeWx
 RTD2tJ5yOhikb3+J1b4r9p8DvvM2CmBEv641/47cLd+/HrgD5EEM41REWfhD9F8U/XoB4Gvf
 rPmuXZX5QAjy9EiteZhw1PFeIZ2EB0k3O4Yvi5MQ5VwfevwyGhsWmL5t32ps3o65ddYeYU1x
 RdHVZzkDaYxKjKVtlbR3odvoKHFXU8dq+G3WkPlpipU9hSQPQITY0zeshlUyot3Fd98/1LwR
 0CqfpH+RRI8+EEaYHt7m8+bLdfaK5byjnU5HblD/sZ/h+AjxCJ9XNmzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 06/11] sbom-cve-check-update-nvd-native: update to version 2026.06.24-000003
Date: Sat,  8 Aug 2026 12:51:42 +0200
Message-ID: <20260808105147.42294-7-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243043

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

Update fkie-cad/nvd-json-data-feeds to the CVE database from 2026-06-24.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: fba290297e9bbc8c6c4086e7784ece5d06dbd26d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.06.24-000003.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.06.09-000006.bb => sbom-cve-check-update-nvd-native_2026.06.24-000003.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
index 2917c89e62..73d9e77692 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "7ff4a0622bfdf5313c79635951112d2a45bbe9fd"
+SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

