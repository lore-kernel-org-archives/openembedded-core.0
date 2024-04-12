Return-Path: <reluri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D6CC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 15:48:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.50623.1712936917621431059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 08:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fGFjHwLP;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: reluri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed32341906so1095954b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712936916; x=1713541716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/YnuMAp84wr6Erm7oulGAkpwYtfzCjoAXB8s49eg7/Y=;
        b=fGFjHwLP0rjXPvZQfXLYOCo7TorBWwEIjD2umyiabHRy3gb+AC4DovhXMCK6C+MHO7
         2U4Q2eqilQPbuBzlB4deXZ02CRATlblYqMDd9MFQNS2EoFHpYdkv2wywBuUINboUNqgs
         LVIOU2pBXJqDG53dqmxDIp0vyJMPSQLi9Mkq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712936916; x=1713541716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YnuMAp84wr6Erm7oulGAkpwYtfzCjoAXB8s49eg7/Y=;
        b=dvdLsjLdg7Qcq4eAEoYXaPPdJaryq82bEefBj9NeScDBFXW4xYayTNek32KdUz+1Rh
         9SwO+I7EuZ2rsNicc5owemdfec3zbbgNy+/dzgkY+wTyYwK+OuPOL52Q65gMZ69rkk6X
         fUP1CWVTBskPyD8hKpbclrAK2xYTtLknN7I91MWgjU56nPeDG8d+djdXlESMBlgxWxB0
         +Rg2A8SY380a8xcdK6IsIhke+Jzxn7enULkcejwFFO2gFqOxc3XOOdFExPL64VmuQGTp
         n1wfKf15CpqZx3F2eClma3uKzxcYGcQQwnDxREapE5nAz+MVi7Od7nHR8xn5I65Xacwa
         r3dw==
X-Gm-Message-State: AOJu0YwZMUAp4PB6LNWS1YWAnk4/o8Gneyq8+eKqshxgKAJNB9kIQOOW
	llM7EKvAJUfeKCX0HxN5hnj6czdr2luR2Vy8w1+57jvNpl4b0nU+/zoOKzdRVXQ/hL/dNn0URrn
	/
X-Google-Smtp-Source: AGHT+IF0PAxTd4lVLiKpOVNDdcgrZtu5BU6jhtaCFsAaKkgzZQ8JrWf1gvW9NdYwGoLmnHSFnjDyAA==
X-Received: by 2002:a05:6a20:43a5:b0:1a9:5b1e:4f06 with SMTP id i37-20020a056a2043a500b001a95b1e4f06mr3913763pzl.52.1712936916134;
        Fri, 12 Apr 2024 08:48:36 -0700 (PDT)
Received: from MVIN00009.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id y18-20020aa793d2000000b006e697bd5285sm2997723pff.203.2024.04.12.08.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 08:48:35 -0700 (PDT)
From: reluri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: E V Ravi <reluri@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Maintain consistency in CVE-2023-24538 source patch file names
Date: Fri, 12 Apr 2024 21:18:28 +0530
Message-Id: <20240412154828.390748-1-reluri@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 15:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198175

From: E V Ravi <reluri@mvista.com>

Rename CVE-2023-24538-1.patch to CVE-2023-24538_1.patch and
CVE-2023-24538-2.patch to CVE-2023-24538_2.patch to maintain
consistency in source patch file names (replace - with _).

Other source patch files for this CVE are as follows:
CVE-2023-24538_3.patch, CVE-2023-24538_4.patch,
CVE-2023-24538_5.patch, CVE-2023-24538_6.patch.

Signed-off-by: E V Ravi <reluri@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc                          | 4 ++--
 .../{CVE-2023-24538-1.patch => CVE-2023-24538_1.patch}        | 0
 .../{CVE-2023-24538-2.patch => CVE-2023-24538_2.patch}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-1.patch => CVE-2023-24538_1.patch} (100%)
 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-2.patch => CVE-2023-24538_2.patch} (100%)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 9c7ceda891..7f45d8e45d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -58,8 +58,8 @@ SRC_URI += "\
     file://CVE-2020-29510.patch \
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
-    file://CVE-2023-24538-1.patch \
-    file://CVE-2023-24538-2.patch \
+    file://CVE-2023-24538_1.patch \
+    file://CVE-2023-24538_2.patch \
     file://CVE-2023-24538_3.patch \
     file://CVE-2023-24538_4.patch \
     file://CVE-2023-24538_5.patch \
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_1.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_1.patch
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_2.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_2.patch
-- 
2.34.1


