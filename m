Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C74C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 15:28:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13228.1637854089147618542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bFmmkhte;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o29so5913662wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tqao/NoT60My2Zxy/i0HRT8CYa2h8RwgIo+TjaQvruw=;
        b=bFmmkhtePvuMsZlpaqgRnZkhqC4G+xu3A2OvUsooYG9D9Lb23BDEAVT6692JbscVzr
         8n1mySDHNGnTEDt9MQSSCknBggoNmPaImI+5tVgJtnv8WzkRK1917Ls8xG8aRdx1H+c2
         RslIKKJihVO9tMACJ/uOcJ2xswYwRvE0Bw5rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tqao/NoT60My2Zxy/i0HRT8CYa2h8RwgIo+TjaQvruw=;
        b=cCHVWaW/7/SoL6Y1Vc3knb4KvlTvOQ5ukqY1wJEok0SRmcR1Ztq+Aa4gOgNztroPtS
         ldgBQqEcjFkEmqHCUEqOwKMUCGGDQGcziXj0f41aAMt7RyInj4lYAsr2Ja1TZU9tlUcR
         lmnaEevwI/dVC81Sb1b/y7ey8yQreyQR7PaeiaEmUEdmU5FSE+WiPXt7kyzC+oITb/7B
         Y/3If6F8ptadWfQq9PzW5M33axKJu4BagrXPApN+AW8kOChf0a1gBZBNUNkBCWEAqHiH
         PZYkOe9rxuZJNlarEqvYbh0YE/l9cH26KGfAaT7gBt4+HILT21GJW3NC/OGb7asYOrdS
         /fyQ==
X-Gm-Message-State: AOAM533q6EHy2DKpok82gSUwwptfI5Gm5eJq2Vpr4j6xOwoIwxZEZiYq
	3ZHdqwnhf7SbL15YkS9xKElcXjoO102RhQ==
X-Google-Smtp-Source: 
 ABdhPJyFLA9VB+R9BK7/ZDwbBl9azmi2Za3gEPybcN0YgxJViO2su2qLl6S0BA8YrlAxlIKy7TCLlw==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr8553346wmq.8.1637854087297;
        Thu, 25 Nov 2021 07:28:07 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6a3f:a87f:f605:c96b])
        by smtp.gmail.com with ESMTPSA id
 y15sm3879880wry.72.2021.11.25.07.28.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:28:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: Add missing HOMEPAGE entries
Date: Thu, 25 Nov 2021 15:28:06 +0000
Message-Id: <20211125152806.129794-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 15:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158784

Add missing HOMEPAGE entries to new python recipes from meta-python.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb       | 1 +
 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb | 1 +
 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb  | 1 +
 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb    | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
index 80e2aa5bc26..ae0154080b8 100644
--- a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
+++ b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
+HOMEPAGE = "https://pypi.org/project/rfc3987/"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
 
diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
index e64f1960046..35c79c40056 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
@@ -1,4 +1,5 @@
 SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order."
+HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 AUTHOR = "Anthon van der Neut"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
index 52ae9ebe9a2..aa2d5b46f05 100644
--- a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
+HOMEPAGE = "https://pypi.org/project/strict-rfc3339/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
diff --git a/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
index 2ec036ef357..26dbe517671 100644
--- a/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
+HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
 
-- 
2.32.0


