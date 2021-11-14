Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C95AC433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 20:27:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.13734.1636921647273353480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TH4fxHFN;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id p18so2806748wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M59eGlNx94HzkqPNGYSiostqGfRVUJL63fxV6/pZ9d8=;
        b=TH4fxHFNXkv+1t2Jx1dgnRO4zb12NaMx3uQqJn6nKKT78W8jRSWVPnh8fRWp5WCfin
         44Y+TV2Pm6os0eDDv3hNqI3J9flTXK7iQus1GcEfNXJqKefPwoLzbW0RdbGcqvOn7jmW
         cak4y8DpYLJO0bJt/XB7bkT31InWzjEgI8K/44jj0hTT67ZOnHyiDuRlpHa5vU4hOzpl
         +pNqYHWHvOD/zOIPEbvhmE98qBHHzRsJmV/N0nlsxRy+u2Zs2NXMz93bFE1ZJn86/bHI
         jYc/jJqVvobbu30GSTCVnzwBSgyb/zzBHYfzG+zzXEAR48HJ87gHZpmDMVktg8YFVEm3
         OBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M59eGlNx94HzkqPNGYSiostqGfRVUJL63fxV6/pZ9d8=;
        b=zBq174fFsBLzVLjiFnbRWDlHDd17XQwL7a4CZDDh/tDPVA7A0ORTTRsDLmiAFvaEGF
         lBBcw0cq8bqq0pSCvUO7gXqDl4cY1b8AAe1du5/FBeR2lWeaUSnYUdS/5lT0wEZwq/Wp
         fnZXXhALAwqcTuWfhYXms6KLSdwXesguTT/4upNSXX4ZrTngqFMBlN5kKh3MSs5BHSnJ
         1zSLs+hj3DYQKVGofun3GzUdHBo6+HRIDU8z2/1wxYRlW75ZTc0VTSahowQYfV4/xtF8
         7sCMx1U7WfNH1LIiBRCPr1dnUiEOiwgpSltfvcN3g/WB0IhhcWfsy6Fzxqi4oCtltsSg
         M9Kw==
X-Gm-Message-State: AOAM5327YnJf8OSqdWndGYgLM5WUMTESzjNpaueLQN6/RW1QnlPK8qUS
	RzYa4DVz0EKgt1mcrpTRzPLw5PgcVWo=
X-Google-Smtp-Source: 
 ABdhPJxr4GpAiFYmjrJzl8h1Mpdkaxi6g62qG7o+bYsvW6Ob2lw0VFkdi+aarCskWjIR+92S/Maizg==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr23954573wma.69.1636921645587;
        Sun, 14 Nov 2021 12:27:25 -0800 (PST)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r15sm12733295wru.9.2021.11.14.12.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:27:25 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/5] glslang: upgrade 11.6.0 -> 11.7.0
Date: Sun, 14 Nov 2021 20:26:47 +0000
Message-Id: <20211114202648.316923-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114202648.316923-1-quaresma.jose@gmail.com>
References: <20211114202648.316923-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 20:27:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158270

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../glslang/{glslang_11.6.0.bb => glslang_11.7.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.6.0.bb => glslang_11.7.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.6.0.bb b/meta/recipes-graphics/glslang/glslang_11.7.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.6.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.7.0.bb
index e2388a1a57..0b4bf21bca 100644
--- a/meta/recipes-graphics/glslang/glslang_11.6.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.7.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "2fb89a0072ae7316af1c856f22663fde4928128a"
+SRCREV = "925503088e2bcd76921b1e102c37fc320bace254"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.33.1


