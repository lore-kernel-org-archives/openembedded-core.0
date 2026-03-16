Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFABF53D9B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 21:11:35 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61819.1773695488408007044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 14:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YdwVvhXH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026031621112475c924e6cb00020750-6qpdfg@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026031621112475c924e6cb00020750
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Mar 2026 22:11:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5XEwlIy7k8SXtVq4BzaPL4fC6PjwKTAY+o/9bIKpo3E=;
 b=YdwVvhXHEeUDzkcgs+Ywaq+3SIs+J0MOmkWKs7vhzgUkpeAmDwrpv15g78PSoUBCBnO1td
 JKkK0Bb33nZiskQ3VOMS3SbzaICZoY+TK1XVYEuSA8PPNCULE8eMFsbRAVANYs4mMKl2O4dO
 FWLz9cCRvn+xP3hlUjd9eF8q5fYLH7i/wCr9SUso85n9nj+PuJza4eX8AbFcTgUgUsjr/TLM
 Jr4FKp2w2evajC3EBclc9B7dgFWfA58hrAA3CNX7DEQDpUcJDBJ/eKNTcHU/T8KUBl+L1em/
 AhnSP0/3Zn2gmzLLbsR4c07Opa06QZoK8jNjdpWzXUscbnyy7vRgM/vw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] systemd: upgrade 259.3 -> 259.5
Date: Mon, 16 Mar 2026 22:11:22 +0100
Message-Id: <20260316211122.1973786-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 21:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233271

From: Peter Marko <peter.marko@siemens.com>

Update to latest revision of v259.

Changes: https://github.com/systemd/systemd/compare/v259.3...v259.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ystemd-boot-native_259.3.bb => systemd-boot-native_259.5.bb} | 0
 .../systemd/{systemd-boot_259.3.bb => systemd-boot_259.5.bb}    | 0
 ...temctl-native_259.3.bb => systemd-systemctl-native_259.5.bb} | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_259.3.bb => systemd_259.5.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.3.bb => systemd-boot-native_259.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.3.bb => systemd-boot_259.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.3.bb => systemd-systemctl-native_259.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_259.3.bb => systemd_259.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_259.3.bb b/meta/recipes-core/systemd/systemd-boot-native_259.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_259.3.bb
rename to meta/recipes-core/systemd/systemd-boot-native_259.5.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_259.3.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_259.3.bb
rename to meta/recipes-core/systemd/systemd-boot_259.5.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.3.bb b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.3.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 52171acad5..b636d6e8b4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "32bc9ae9f58aed3fa06e111b55fc157a3fe1322b"
+SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-core/systemd/systemd_259.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_259.3.bb
rename to meta/recipes-core/systemd/systemd_259.5.bb

