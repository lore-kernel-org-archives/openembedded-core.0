Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624FAC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:48 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.1269.1655854124253355156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1EFkxR9h;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id f16so13032054pjj.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DrMBoXEX5yJgSOQqZBWPACho6rDIkpO4t7ZyCw8KKnA=;
        b=1EFkxR9h1gxorLcYEEyQ2Hvu8fu5UTq7ABziCm3MuoFYUzQBTbslBM1GoAvJ8V2bFh
         UVA2coJ4cJEOl6RSsL0MXfSFv9Z2dL9O09oikTiLA63kyNItF1oXYtdyBxZunyx/Kot4
         5K5BosrR5BLodIQdeC1cPMP5o5j/RnGoj9V3UaWds9uLkSJFC8WXVKLv056113UDBHyj
         MM8mN/+/1F5QFIhLZMFBLNom8CMW4Pe4yz2Qw42pLY7ACHJD23R0ndV4V0ky42IcqNFP
         xPpaO3/F4Nya+fTa+32QrOauNqE6wsVNipy6ZY2+En3oDipOzh4VobcN8aQ0nehSBwZ0
         Bx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DrMBoXEX5yJgSOQqZBWPACho6rDIkpO4t7ZyCw8KKnA=;
        b=r9DNU6tHcsDkdeU0bqLpiadh1HKnSRZR5R0wdqQ3cCsP3SrIOs3Ml2dTCagfQh5bWs
         B8cMKKx/vrDEn0IZrIgAqU5GjCYNe3VX6eHGugdWlZtNCFeWPuUCEn+5Yn6ndfiNbkqB
         WMQve3v1UpfySuL5JOFdyHUTea0RStN4uXTtKOGBbi9JzB3bJ5N3BtnAwb4OqevrfwqO
         sC8P3ZJ3ZamxOKy+IYz9tjoPX7WJq0zvtC0WdGnP1lS3wYlMZvHJag8UFQmtACp8TBDE
         TXzeq/1NuM6MWF9TIwUV2fourDrvRWJcpxG6PvuoPQNztQAUrWmYyK+X9Qo2LSHI4jVG
         h1pQ==
X-Gm-Message-State: AJIora9I9ZmFU07CDQx+KSqgbWnQQYflBnu1l0byXmQ74exGpIRQIPtc
	EZskNAm28fGNRJGZmxvDjtTajYzeUvxTfOJA
X-Google-Smtp-Source: 
 AGRyM1vSAfL7HJm1LlYXB9WRpv5j0VnKXD5o0Nhyn+srn7HwZ0oPHCzaoRB7CZsY4FC3gPHj6TxDlw==
X-Received: by 2002:a17:902:b7cc:b0:16a:3f8:98c3 with SMTP id
 v12-20020a170902b7cc00b0016a03f898c3mr25119451plz.73.1655854123232;
        Tue, 21 Jun 2022 16:28:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] rootfs-postcommands.bbclass: correct
 comments
Date: Tue, 21 Jun 2022 13:27:58 -1000
Message-Id: 
 <f0770686b36c08d99915a8d1b4d0e4450e831be4.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167202

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 41ade8e9a14c867e146a545be8d2d9c151b6855f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index d302c23cf4..fc179613fb 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -1,5 +1,5 @@
 
-# Zap the root password if debug-tweaks feature is not enabled
+# Zap the root password if debug-tweaks and empty-root-password features are not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
@@ -8,7 +8,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-root-login is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
 
-# Enable postinst logging if debug-tweaks is enabled
+# Enable postinst logging if debug-tweaks or post-install-logging is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
@@ -140,7 +140,7 @@ read_only_rootfs_hook () {
 }
 
 #
-# This function is intended to disallow empty root password if 'debug-tweaks' is not in IMAGE_FEATURES.
+# This function disallows empty root passwords
 #
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
@@ -202,7 +202,7 @@ python sort_passwd () {
 }
 
 #
-# Enable postinst logging if debug-tweaks is enabled
+# Enable postinst logging
 #
 postinst_enable_logging () {
 	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default
-- 
2.25.1


