Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9068AC36014
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 02:41:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.24099.1743302477662965482
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 19:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIGEHWnp;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso16704215e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 19:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743302476; x=1743907276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqtBr2kXOOn6fMCLGU5/j5LRDB149ILNu+Bkk6ejHLU=;
        b=DIGEHWnp4VIdLG42yXVovJ7T6Vo4uFiWlJ2sBGLIayc9SM6ad9MptCeu62/gLnDsvR
         +q3S7thrLkbuzVNwi9umZxvxtNm9mFDeWXKjE4XYH6NiotpGdStvvjXEVnXsHigvxDmC
         sp3UqRkgy6KBjTrPOll4wsy7NCV2fSqMZwzVMn36PDYjyFQlbs007kVZyZ9uF0K9bRDT
         M3bf8+9UGA8m/k+cQOomPWEyCO86k7sPDa++RJIc0jui+5187RV9J7xbIvtpQrlQnuAt
         ofSG+O9aYGMnfKFWdyCgYwFTDWeUnQ9wX8fr5M+A0w7o05+2rzNQYfwyRygoEhhwBiZY
         WICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743302476; x=1743907276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqtBr2kXOOn6fMCLGU5/j5LRDB149ILNu+Bkk6ejHLU=;
        b=mzPczIF3ESWtJWfCSWk3vdjGodxKmY+MpWGm0a8pRZKOyGeUyX6qxtVUPpsWD7AT8B
         oQDW7gS9rGwm8ciH9L8UPNsdShirQOvbXv+RwDKbruo30sLkcAk6YgvA+8oB6wh+CkFp
         86poopUmukbfxhKf7g1hW0uCvkqXPgcszD6DljiBLXQ5eg1IPzjXLuMWSuy48lJGs6bo
         FkPnKjrrK+CcY7ZwwURIAJ53rDBAziBVjS9hH36fpqgHXyG8WHZXWQITo0qtlOplsHgW
         76eEWGBYXp3+lLSioltOdU0Vjq+gqyKo3fFzd3yDHIumsLny7it5R2FrtkI+H25BU6OL
         JTyg==
X-Gm-Message-State: AOJu0YxRYTX/LIxVwaYYqZTNXOnoOsRbcFSU72xjbk5h8tYwin1aS1q4
	bsgPY9UTHYVygTl0GyhgmURVfK17kikSRr1q2mMbFs4omCu1pH1fjIw+Uw==
X-Gm-Gg: ASbGncshvXallg1Xxr/WRbGJvDuj4OgdPt68ABzFJOU34TPXk+rJnKHIpYfFc9ZHDvg
	1dF8ZTIY9Sdx4yTd8iOlTcIqVnbEkVYs6BEXSR0kSE8Xigojb1XFbQn3T58Sn8+ZRdPFVghC/WV
	8IxGu4t8c9vm8VxonO8lNXeCuiralBrjfkz2kvs0Fbj4ksMX938yDd25OLRwym9fHOtu2NumVgJ
	yTs5jIcoaJUbPy32gZ7c0XfzZpx4uZ6vyoX7SC/XjeZ5hXd78SqA00zkZSxCnDGKdIkrui7Sot3
	WS4hFKBGreqcHHNC5PGWbdnqL07xOj3WnAeht2W72tbrifcWN7ObLtsTWq4dnnfPgNpQarViRhi
	slTpn
X-Google-Smtp-Source: AGHT+IGKV1DFIVR6+OfekaWfHlAM712azDI1UOJp5PFK/DejeoNe2UhiAb08x81BO61JSE+Pa2kJuA==
X-Received: by 2002:a05:600c:1d1c:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43e8de07fe4mr27737005e9.25.1743302475649;
        Sat, 29 Mar 2025 19:41:15 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm6328999f8f.42.2025.03.29.19.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 19:41:15 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v3 2/3] bluez5: add missing tools to noinst-tools package
Date: Sun, 30 Mar 2025 02:41:01 +0000
Message-ID: <20250330024103.64558-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330024103.64558-1-gudni.m.g@gmail.com>
References: <20250330024103.64558-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 02:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213912

This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.80.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.80.bb b/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
index 6e5b621971..b7bca4f12d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.80.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -45,6 +48,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -55,6 +59,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -64,5 +70,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


