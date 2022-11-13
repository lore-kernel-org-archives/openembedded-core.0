Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42062C43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:24 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.2808.1668348793237890809
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v9+yTrO8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b11so8246599pjp.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEo2GNXU784ShN/7+QJQchzGWcqlli6QQkx0oRHlQUU=;
        b=v9+yTrO8XOO3TmpypRMOcAybNjMPMih2MzagifpcVVZnXCAOhAx8/rEuID0d1u6X87
         GCgkUK9T4l1TOg9EWtdpmnTN06t5NkcbMXAypb9NUOmDcOluyJpRkDDgzT0CXGnhONSk
         Hm7NPa/xeINE1PiO2bA3Cs92Dc93tXGX2WMQQng3OGYbGD+0O6C/Uvjs6UUKNSPhzP1I
         bYHiEglDIr+NLy4w241gHQCzNM23dXdknsA5DZoj/DGDuTbEKCEAUPnZfTa15l1nmKbW
         TjBzwTzuvDws2V1PT4Fnhb8H4C4vCa8f4mJoo/dI09+vHlewM3RbPSNYfqRagfPuzjxb
         2kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEo2GNXU784ShN/7+QJQchzGWcqlli6QQkx0oRHlQUU=;
        b=Gt7WshyJOZPKLm8caOsJbRMN8SIqKp/5MoDfVPt7Crms/jkVR7ym3hOAxs3LDqceHA
         neOllGe3/TuHpfAP+rhoodmlkOSnjoYI8uW6hYNsnBLUP8PdqF69g8sbQKk0CKEpwzyT
         YgIjBl147flrcy3XWP+7G3BgBEZRqjSZL8npFpzdpGQc8ETLUj6mVGloe0QtZBiURDjo
         8eyJ2X22JqfdH3j1WCBYifSSWshvYeCwQQqGrgMAMJC8F4Gx2HLZIYMELX9341+WcDQu
         eUyjvU2BAsuXpNDgkh6+U/ujqTIPyZ/Gw/mLpk/EsWo4O04EPqNyAQLgqnaI5RgXvctb
         HLsA==
X-Gm-Message-State: ANoB5plf5rTSaC1eo09bve/pfrWQwquhUewrUL3e8sYxBkjfooLXWLKO
	MnrLPRWR5hRewmKASlLzYF/NFp1y/cT3OXhk
X-Google-Smtp-Source: AA0mqf4fHMN8KCGsqWP46mY7dBkI/cWIEK/lDPOrD02nRJoyCjU+pQWT+HHvhGHpkxQe6jMuPLMUAg==
X-Received: by 2002:a17:90a:51:b0:213:fbf3:f3 with SMTP id 17-20020a17090a005100b00213fbf300f3mr10293791pjb.203.1668348794605;
        Sun, 13 Nov 2022 06:13:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.13.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:13:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED
Date: Sun, 13 Nov 2022 04:12:46 -1000
Message-Id: <742c83402203ecc6ef9298b8a717e7a06cd2bd30.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173202

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14948]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 89f1abd5e00807cf179ddf658f74d48119523b0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index d0bfcc7de6..e405bd0cfa 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -19,7 +19,6 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
-SPDX_INCLUDE_PACKAGED ??= "0"
 SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
@@ -423,7 +422,6 @@ python do_create_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
-    include_packaged = d.getVar("SPDX_INCLUDE_PACKAGED") == "1"
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
-- 
2.25.1


