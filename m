Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8E8C43217
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.4336.1651532608603073615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KqJI7vM0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so602862pjh.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AJFKtk3d4UYJmYtXtkmgRKhwsDHpuWcwlnVZUX1bnm8=;
        b=KqJI7vM06yNj26Pe3zF5DULmWzmV8omY1w/98oWQQfq62XP6UhMAkhuXSSuBV3ggVB
         7GEkAFdy+e+rWfqE9eZRO7S2e+s7Bxlud7Gues3XCNu9Z2TwD6a4kuyrLsS1S+INu0wq
         iroBz5ifst2VXAsqSCGg1E5TCRLR0w9l8gyOmWvvjGt9kdEnwAdJzXcBy0tIT8JNiGib
         LTGdYa+zb3LmI9MLwTojRsnoUfhQmDGLOjTBcGzM1SGhKXLxxlfo6ZU+TEuGW/Nd2zbz
         nd2sE7zm6v22R+7jciWz3jfrubfYfv3Ii+JFhIhTvogoOc8s63v+j5ceLvmZ5UY20MIp
         6oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJFKtk3d4UYJmYtXtkmgRKhwsDHpuWcwlnVZUX1bnm8=;
        b=rx+c76QVB12WmxxPXCvPyDwhjwSIGmGo8IuVABAVz+yr0+O4obEXyBwzH/YXMB7BvS
         DzreAf2v3LjpH/F+aF27fKBAMfZNJSOyqXVAVTXFeKPTp/vYhmABavh5JXqgwZG7U9/J
         dZuL1mo0SsJIfjOYTdphQmgBH0sJ7dIahysR530+ga95DFv0+JIQclDXybheD0StyXwD
         6KpogPlDBS990JZTT/ySPONALlc59ZmXDaal5z4H/4gzOzRK9BoIVxF7ClmX/tLvK3Bj
         art8jvkQSpO6uSudQrt3fJ0Ch0vxQaB/i/HuufBfGZeXutST6iG6DLcse7PI3bNBmvN9
         uYZQ==
X-Gm-Message-State: AOAM531z30WZz67fTTxGhKz3YaAddmZomjYP6dA8/ySJjJNFzqKGP8D5
	i+qjFhl1IZYM73SfCf1SJgfks/6cScijPsBzDm4=
X-Google-Smtp-Source: 
 ABdhPJxrIg8DhNvFwlJou+JIQQPdkh0TgUo35CdOTzYjsKsU8HqPoqrPFWYcoG7UZpcXAvOjSFiIDw==
X-Received: by 2002:a17:90b:3ecc:b0:1d9:549d:8141 with SMTP id
 rm12-20020a17090b3ecc00b001d9549d8141mr1614992pjb.132.1651532607506;
        Mon, 02 May 2022 16:03:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] neard: Switch SRC_URI to git repo
Date: Mon,  2 May 2022 13:02:53 -1000
Message-Id: 
 <0a62632b431ff2e17aca1f1f80a74da8f217af67.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165187

From: Rahul Kumar <rahul.kumar_3@philips.com>

The tarball (neard-0.16.tar.xz) fetched by the recipe is incomplete.
Few plugins (e.g. tizen) and tests scripts (e.g. Test-channel, test-see,
neard-ui.py, ndef-agent etc) are missing.

Since neard did not release latest tarballs, so as per community
recommendation switching the recipe SRC_URI to git repo.

Community Discussion:
https://lists.openembedded.org/g/openembedded-core/topic/90058043#163681

Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 (cherry-picked from b563f40ebf4461d9c35df72bd7599ea11e97da9c)
Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index 7c124a3c0b..dd0742f792 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -2,21 +2,22 @@ SUMMARY = "Linux NFC daemon"
 DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE = "http://01.org/linux-nfc"
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
+                   "
 
 DEPENDS = "dbus glib-2.0 libnl"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
+SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git;branch=master \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
-SRC_URI[md5sum] = "5c691fb7872856dc0d909c298bc8cb41"
-SRC_URI[sha256sum] = "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
- file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
- "
+SRCREV = "949795024f7625420e93e288c56e194cb9a3e74a"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


