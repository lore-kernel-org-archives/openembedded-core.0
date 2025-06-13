Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F75C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 21:49:38 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.8355.1749851377477387220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 14:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VLkKplyJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250613214934817d4d33ee46b5de1c-pjf3g0@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250613214934817d4d33ee46b5de1c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 13 Jun 2025 23:49:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qZhiXwDEuPlD9oxW0zmI5w4MTA+r45mweHAJM4oiAog=;
 b=VLkKplyJHt2StdraTw0m0B7XLEWFkl0JnZDpKPCbYebRhWmfdiG5XjZDjzkmJ5rqKs2mf8
 nKAR/wJVjgFrXRf8qdH2bEQ5XNO9N+6EaCyQSRQ4H6jwTLGohM2sWmGHdXC2WzVpWDplcvHC
 6NF7iBl5EhDToZaD3WkI24dUjBzeMR2ScNz/NxFlaNft5FcyR14tMmLHjYFaTjyMolKJIE5e
 JvtJjFYBAlMVDinktKiP/sWc6wtTCIo6fvMWeO/RIRsPskD2zZAQnF6Y3s0bIdYtJa+blKYS
 PFtUNWBxboRVjGdnzVPpZdyW76Cb01z9ZYRQUlia2H4RHOr8LV2T7qCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 1/2] systemd: upgrade 257.4 -> 257.5
Date: Fri, 13 Jun 2025 23:48:46 +0200
Message-Id: <20250613214847.1418662-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 21:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218631

From: Wang Mingyu <wangmy@fujitsu.com>

(From OE-Core rev: 05618ac2c6f69e0f41fb95e517382bf1177f0735)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...temd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} | 0
 .../systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb}  | 0
 ...mctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 ++--
 .../systemd/{systemd_257.4.bb => systemd_257.5.bb}            | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.4.bb => systemd-boot-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.4.bb => systemd-boot_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.4.bb => systemd-systemctl-native_257.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.4.bb => systemd_257.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.4.bb b/meta/recipes-core/systemd/systemd-boot-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.4.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.4.bb
rename to meta/recipes-core/systemd/systemd-boot_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 55389f1050..243053a8c7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,9 +15,9 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5ce1c02abc0cc386332384497b5939108314d80d"
+SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
 SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.4.bb
rename to meta/recipes-core/systemd/systemd_257.5.bb

