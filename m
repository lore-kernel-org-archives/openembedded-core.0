Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.8119.1630503922060414175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lNr10uFA;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id s20so3800102oiw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Okq+myCfrLMIM4iNatYOHZmdREqMiUnkwcIVSrs8owE=;
        b=lNr10uFA0Yk7xNgk3o137Jnkl5mVPpM6xuK9RrJ/aLaSOChcNa7Ay6VePw57iDSfh8
         mjPgAKQTk/CwtImz8EnZE+CQwJRFLOyT+sSX0Gk/A4VApcbjyq5cql2IPZGifBVx7JLx
         AA8/ZhOIjEzZFQTHGROTBRz0O9UWd/OcOzb6G4x2Bm3ekkUaymbfqPmOQ3QbDBjoWApU
         k/v+3x9usC8W+Cqw5vSJ30dLfYE2hsaVMl79kFOxvLmHQ3MsyW+QBkmt/v5jkbLbjkyW
         xPeRHp3MeKwVZyBx4TbkIAyoEk0n4IFRjkL62xedEit/G6yYpdMw9LdgG6nA1jlCLroa
         hFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Okq+myCfrLMIM4iNatYOHZmdREqMiUnkwcIVSrs8owE=;
        b=pQp6NmlJ0kvAm/7mkYaOZm1QHOt8yY/M1FipPngNFRwCQvgDO+l8kEd+BFQjkWwPXT
         jpkRRYuuGNKS4D1FWy/JbD2xPF9zI5G5cowNFYolH1Slng3umNCs1kPr/VbSjn/heZUZ
         YolfvEDbkxi5R5DnPi7AMW2XcNJ4Bo3l8MjNZELGZP7LEXmFFvEp9Xlg+QXT/etoyVAW
         EScnR8yFZG9lDP8Kq8/1Jsi2kLgUYrGdP+uplezhZ/xIbiV7roPoKWjcO71YStn0FwLE
         KzoDca6E2KIzxfST5dVCyDZsx2LFhD+Job5x81iyCqDszjaCH/qHTrtAMPbu8Rgrq5I5
         NZzw==
X-Gm-Message-State: AOAM5329mhKjQSCokgwXyfFd0g2sFqenu6SjtGFTZgIP2ZMd7rYARpqf
	J/0nEq0vBdfdLlWTzWbg6oxhYqmj1Gc=
X-Google-Smtp-Source: ABdhPJwFeqMdHfE31tgC0TcpZ7RV+do883NJjcAAb9QPCvKwEB/YL4OpTyovn7d+rE9kxnHNm5tyNQ==
X-Received: by 2002:a54:4789:: with SMTP id o9mr7284243oic.50.1630503921101;
        Wed, 01 Sep 2021 06:45:21 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:20 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 03/31] classes/create-spdx: Change creator
Date: Wed,  1 Sep 2021 08:44:42 -0500
Message-Id: <20210901134510.29561-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the creator name since this no longer lives in meta-doubleopen

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 35fb4421d0..e49d4d7e3c 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -335,9 +335,9 @@ python do_create_spdx() {
     doc.name = "recipe-" + d.getVar("PN")
     doc.documentNamespace = get_doc_namespace(d, doc)
     doc.creationInfo.created = creation_time
-    doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
-    doc.creationInfo.creators.append("Tool: meta-doubleopen")
-    doc.creationInfo.creators.append("Organization: Double Open Project ()")
+    doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
+    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+    doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
     doc.creationInfo.creators.append("Person: N/A ()")
 
     recipe = oe.spdx.SPDXPackage()
@@ -423,9 +423,9 @@ python do_create_spdx() {
         package_doc.name = pkg_name
         package_doc.documentNamespace = get_doc_namespace(d, package_doc)
         package_doc.creationInfo.created = creation_time
-        package_doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
-        package_doc.creationInfo.creators.append("Tool: meta-doubleopen")
-        package_doc.creationInfo.creators.append("Organization: Double Open Project ()")
+        package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
+        package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
+        package_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
         package_doc.creationInfo.creators.append("Person: N/A ()")
 
         recipe_ref = oe.spdx.SPDXExternalDocumentRef()
-- 
2.32.0

