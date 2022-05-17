Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C43C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.1141.1652811923944404396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=C/MOVkn4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id w200so1745867pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Lg/FmkKR4sgsE0lL2VyrIdpSlPuU1i9e5RW5x1r1q+c=;
        b=C/MOVkn4Q3Wc/LBsBEccI8sCAyrQtHo7tXEWRLFKCBNwP12zlLgctmoXSfkaRhygoz
         Pimm4aWOgxnpp2yb0Qy71NBuZ2E5jLvZ0i7g3XVygdRF2Gmtr887QKYPefBsi5+OPWay
         hR3dlgwAMFb9ZGQeOQj23/18pfO8USg9zcSFJPghJUaW0UWxxRVHD6dZ/QPCHR8/c+Bh
         4U3nGEi/2NtTh2R8j6in5N8ibm/qh8xCZxZvGTS+czkSuGWjBNDIwgOs6J7PkZJzsEKD
         fbBekRtrpKGPP/eCMnMy+ho5nm00W6gXtYcnI1PfAfkLBuaSDgDOqkaLLJZJQg9SBg3f
         ooOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lg/FmkKR4sgsE0lL2VyrIdpSlPuU1i9e5RW5x1r1q+c=;
        b=tCp2mT5HbkengQTD/9/zZZ0Eg+byOfOtwZPLF/izQghNB6WQGX7nFC/NdXe80R+Y3g
         6yWuZKgOMMfE4rWoEnCP4KXhqzCriRtUs+DqkA6givxjRhbBU1fhDQlQIZWDWqYhQmBZ
         BIVROfsiglGZZ0K/J1Rgftih5gJcv9nBRX3gN8mIva0fax+6V6r1x7LYqDwBsEq7RikV
         2kwUv//tbZBliOzfPxLc4DFH5ZhfuuviCUjTEEmV0acUxyms5y4zJczr4Ep6HCTfaBoC
         RRKM9Y0cHl//9qdFPLFy2urfvmpOcNNX48myocFnF0S1eiyjAPPR+BaPQybPrhZNGG5C
         Cf4g==
X-Gm-Message-State: AOAM530ysdjpgQAusEiSExVZVmC/p3w6Z6T17XL5N5qHzEC2EgMR1E/l
	XLMX7ag7FpY/fx2bYVTiD0//yhPvQ0kv9SFM
X-Google-Smtp-Source: 
 ABdhPJypd9h3TQCAeV+HYTTqVdgz+LjLJ9GC4fnVg0M9vXWRN+jURbvCaYTmy9KhraJKD1XBWXr0EA==
X-Received: by 2002:a05:6a00:10d0:b0:4f7:5af4:47b6 with SMTP id
 d16-20020a056a0010d000b004f75af447b6mr23721150pfu.6.1652811922824;
        Tue, 17 May 2022 11:25:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/31] vim: Upgrade 8.2.4681 -> 8.2.4912
Date: Tue, 17 May 2022 08:24:05 -1000
Message-Id: 
 <d1c0db32383812531b857729c585b3305e781cd9.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165764

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2022-1381, CVE-2022-1420.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77d745bd49c979de987c75fd7a3af116e99db82b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 21ff036cf4..c5922b7fcd 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4681"
-SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
+PV .= ".4912"
+SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


