Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E665C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 23:33:43 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5690.1745192019138275843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 16:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ut55CR8H;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso30551315e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745192017; x=1745796817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RYes7b5dVFZWnU/E9XmOauqk9q8b+4u6m7im6qo94Q=;
        b=Ut55CR8HW9lW7EV+RmGzodgvzidPTvuCwPe5YeNklyM+rxf6FKlZinECvJyXkYTg34
         VvPbzFe+u5NpR/s8kBl3cCtnaWd/+3GEFkziO4S42KlFV/tULNHSSny/elxJDYaYnu9T
         fka/hVo1ty7DajhlN+n316k1ejIZJ3BHjZCU2CRSJiIk/nH6xOuYMQwC9oRThZG94tno
         tQXiozaQZY9DsUz/eIu03zIpZZEqZS7UY7RqDMsTKOOQ76fhOtg+pdv5P/Y4kZYCEQDI
         aKalXPk/mI+P+B3kKSNXCtWfKEM7EjvXnTbkPj3M0XHJiRS6pYIJ83/9x5fG0rr940B8
         qCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745192017; x=1745796817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RYes7b5dVFZWnU/E9XmOauqk9q8b+4u6m7im6qo94Q=;
        b=s4eQf6i8XorQYuccqs+D2OCNTuHOlhLQCD7qYfCaE4SzlOnlJHsaeaaHy1fyi54u7y
         JPFNGi0lzO4NdGjBmDv5HLrR2AXpn9rHri4318rI+bguu8P0JyeVy/eefjfmM0dDjHl8
         dsw12Rap95YtFXABVZC1W+nk9CbFUZm1ZojPLUMeXzLxjzzgcXOh2wB8stHla3uxjr8Z
         7JRX2HuXVHh9aszFYwm5d+rsq1eRFFcffL3tmao1fAQOFU6LMpbtgd66iSklPvotzvbX
         KYq2ARxDduenYA+rXti15Hy26svR3wBXKcSUvUSBqQt6yBEZoehcGUjiTxnlo6VcV+Wk
         IybA==
X-Gm-Message-State: AOJu0YwfrQ2gApnVtLnYPMfCtVb6aTX+Jxg+zK2ilAR7S18wIV+8Jb0L
	D8py18t3B07zPFq7vTTsCkxatjrvioW5ggPfYCLkPJ8Z0wdQxBYDZHiGqA==
X-Gm-Gg: ASbGncsf2MsVisurqQth0naSJsPGFs7XrtRqkurufZWKknkL3R7mrcrbPGDJhMkXARF
	aINUTxY6iMt4aNvRAltM67emPVkVycTfDx992D1hwpLAD67XK+FmHtzvKdK0XdUqvj3+RQq+oKQ
	y3PMNqqBu/xqcT3PeWTKbwYcxcxK7hEoedUJND1sNf7KQvYdrM4gegQQA/SWMaZxMatSm0a03Dl
	Ox+eRpUOsKjWjh3oPMjdtzgGMDN3/xXoXcLn7fhiXXtDX44xu0fLKiBMxf1JEX4xsV+ayNJq4QB
	CGQPNRB7QHro6vMoiRXcNBtXbXBqE9IPz+gUuvYqkPlCc7KK1MjPQArFdIgWtkhZyA==
X-Google-Smtp-Source: AGHT+IG4HCRz9cY+kvv1w6M205tEMLsg1pAhP9fBGJUO8y7MPtsEa2aiuI4YR553o9ZAq5lkQxDp8A==
X-Received: by 2002:a05:600c:3154:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-4406ab9432fmr90644445e9.13.1745192016923;
        Sun, 20 Apr 2025 16:33:36 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm10148286f8f.51.2025.04.20.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 16:33:35 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH] bluez5: add missing tools to noinst-tools package
Date: Sun, 20 Apr 2025 23:33:24 +0000
Message-ID: <20250420233324.1852229-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 23:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215160

This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.79.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.79.bb b/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
index 30ea6d317b..330b30884f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -46,6 +49,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -56,6 +60,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -65,5 +71,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


