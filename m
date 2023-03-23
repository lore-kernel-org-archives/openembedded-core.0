Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F27C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.85122.1679605498899277866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CT5DgGZd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id l7so5539977pjg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDdrEHMP0dPWnIg6L2vzRF0LQ36n5IlJ/GujljMoXBs=;
        b=CT5DgGZdQXsxsEpTBx/93sRo7DZFZeVsyJMH6ij8vSgv8HX8ybvD/2y2xEmk+BRzSI
         xxiHaUHFfNS2GFsc73Y7IkelBsctu9fwmAZAcK1V5HYP5WjABlDqGn27isHUD82NDWbs
         ZAWazV8rBWdDeOtwbtMvULA0S2JKtaWUVSDbJh1FVmUdc4HjbysBm7qLzLjPE4a3jWZI
         F49GqBkzVXfncF8tKyQ/5RWTIhQ4Wyw2jd6HjDU3s3/dPl3O59PtzgraAB6snS2SIDnb
         VGSVIa7daf/t+tIChbPMW/eyrX3pWos3b/NddhnvArS17NPoPora8FeXrkQkvDN2pOS9
         wnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDdrEHMP0dPWnIg6L2vzRF0LQ36n5IlJ/GujljMoXBs=;
        b=SBysF8Gm/EGAwam+/p9OciVhBfDCyytbv9K5lJShnqcqHPmqoG6rnpOA7XURlAis2u
         97Mr2OfLfsO7YgaXpg+O1Cco2mik6YugPOmCe4aC9dKYJwDudivfmLFtEF9b8bIpAKSb
         kZzCWGKshliEnXOIonvLJ8vI6h0tEwW9dci/SVNcHTjUgn4n0x6NKTRELUiioaE/z+sn
         CIWbq4bf79tXPmvJVcQ/KjXBLeM6JWh8nvVvk9nGXfYj4jFkeAcRKnhLCXREAjRQmPgG
         D2d3aNWf1DmPeiZpuq8pZ+eUPpfZHI3qsnc/1hs7C2ObxxpkYp7AnMCWXQJ5OhxiOMOd
         CvVA==
X-Gm-Message-State: AAQBX9e9v0BrVClyU8Obb3/g3sGq+zrlutQ10fe70Ixe4uVNqdSCx2Bo
	P4dg08b7va44KmaUqQUnOAJJ5qt83KD7kMGzVwU=
X-Google-Smtp-Source: AKy350YZSrTgkuHGLDf4kcFmAaSwBXEqda5tB6KitYmCXu5mYQOVXVWxIWf0JNBvoGSMOt6Dsteurw==
X-Received: by 2002:a17:902:fac7:b0:1a1:82cc:5ae5 with SMTP id ld7-20020a170902fac700b001a182cc5ae5mr211888plb.13.1679605497995;
        Thu, 23 Mar 2023 14:04:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.04.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:04:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/14] git: ignore CVE-2023-22743
Date: Thu, 23 Mar 2023 11:04:31 -1000
Message-Id: <8a8a86076f9eed36b7f4c831ad8882d07de62e8e.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178997

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 70adf86b515934168a6185dcff4a8edb39a40017)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.35.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 7cc8e5722b..faf0b67051 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -33,6 +33,8 @@ CVE_PRODUCT = "git-scm:git"
 CVE_CHECK_IGNORE += "CVE-2022-24975"
 # This is specific to Git-for-Windows
 CVE_CHECK_IGNORE += "CVE-2022-41953"
+# specific to Git for Windows
+CVE_CHECK_IGNORE += "CVE-2023-22743"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1


