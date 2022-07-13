Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AB7C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 20:38:14 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.2219.1657744692295054750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=R7A6a5VV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id g4so11514668pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rBomAr6TfPaeYIF2pT8qXXxSHgNEluPhSdt6rBE9YBw=;
        b=R7A6a5VViLf434ENU6J/1Go1jOIrYWg5kveudIvm0sqYeaqEmvC4l7c4ibuqqTvpIG
         yW6C2AaHO08yt0EHvnTMQHPw3i/cbn76AjSsMmHUodENU7mGlYW2t+02dkoihKOCRoox
         kuGrxGZ6kTrXPixMy15f6Sv0wST88M4tMIAkY9Hy1mQh3WFuDhQDOzOxUDhv76w/1+0d
         Uwtl1oPIVKcuSZslshIeNv/ARHwu4tSM3r+ws4ZfGfMqjjtk0UM1ZhQv8Evb1UbcTbfU
         c5GjYDOV4i4pwyDtAv8l+ec4H+WqJpJi4JsWvT/0tnH6fM3EpruI9f3EuGFGO9q9/VjN
         /M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rBomAr6TfPaeYIF2pT8qXXxSHgNEluPhSdt6rBE9YBw=;
        b=TBOZ7Uf9A2fv61FvNxcpCMqJcYVMI7Exco7nxMaCqw7hcuQ09ylpPBWb3LSYxo1Oag
         r38or1oSlExK0FHWej+k/1x6TnQlWJCVaIzcBgNQ1OHzo4UIk4M982hTRuoKTvwFFFpT
         qIMyyHgK4o/u76L4CUExz5IbAmYUpfRCcosTdxoGwis2Bkvwqx1GIKAdIpMf3sPJTEvf
         l01hXosdKfmqUIKNs6zB8RQh1MHWsyIOzj+RM5Zpe+Pyjfn7nw/2KQYcnzTJcbL4aMV5
         ZJkMNIIhYTCKkOwRHsla64G4cbggQBe3vVbaGldH09WpZGc9Bp1uKzHZB6JwfPNdE7tD
         GtjA==
X-Gm-Message-State: AJIora97IojnlUIkOoR4RmBmq30Lx6JP9JgAAlqGILDTGxMWYR51uDXv
	QNnpKl9zxPdkZ7XnAAaRWeT9ylLaV+/azeFj
X-Google-Smtp-Source: 
 AGRyM1sDsASbFDVRQlhMRggEc3ueXl3zyuv4d590T14nv8Hxuf0DCMWV4MlT6GJfN4jVAnXs9tEhgg==
X-Received: by 2002:a05:6a00:e0e:b0:522:990c:ab60 with SMTP id
 bq14-20020a056a000e0e00b00522990cab60mr4866465pfb.8.1657744691173;
        Wed, 13 Jul 2022 13:38:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a170902eccd00b001664d88aab3sm9231892plh.240.2022.07.13.13.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:38:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] vim: upgrade to 9.0.0021
Date: Wed, 13 Jul 2022 10:37:52 -1000
Message-Id: 
 <3230e5f734f69acfe05219da104e8818445c9eff.1657739246.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657739246.git.steve@sakoman.com>
References: <cover.1657739246.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 20:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167987

From: Ross Burton <ross.burton@arm.com>

This fixes the following CVEs:
- CVE-2022-2257
- CVE-2022-2264
- CVE-2022-2284
- CVE-2022-2285
- CVE-2022-2286
- CVE-2022-2287

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03c044a81a76b7505b9d5bf0d936dde75b51905e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 84c2eed4c8..1893759ae9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".0005"
-SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
+PV .= ".0021"
+SRCREV = "5e59ea54c0c37c2f84770f068d95280069828774"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


