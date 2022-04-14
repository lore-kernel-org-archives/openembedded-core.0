Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3C6C636C8
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.9389.1649926645153462927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2LN83FW;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id v15so5451299edb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8t4Gc+oUnCoiMFQpmjRxYW+C5Kog+HpPDoz3c1Vbj10=;
        b=J2LN83FWT5JCTuJ/XqHSsTppCXvkUtjKF18k0AzllaKJfwWFl9qw1LIE3tYwutVQaj
         LL0bha5YfFz0ekC3Tyg2H9diokfICbQ+oodwXOwTiEnNnEIr/yGsvzOT4a3bUT6dLnJR
         m46xZ/kd3CahrdowNysMTBzQDHxK3ohKKr2YoHs0fmsCLobRkeWcthCqGur9In/uRUOD
         jaAu/Gn63LeDS754U8mR4dnmr5hHvQylfs6psvrjjmY4jtUPRh2nqiYWF9RuDBoq2pN/
         swLb7zo2KzRMDkOIjOy5V9VeB393mhQzb2AXWPzk0wwukVnhK0vaKPqj/QHjGuC1sUBT
         NrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8t4Gc+oUnCoiMFQpmjRxYW+C5Kog+HpPDoz3c1Vbj10=;
        b=zGl07g68L1yKGUXWnupXlhsNF/2i3Zn1nuKPl9n0D708ji46eVBdtKD/KUsCjLKVzO
         8h/+PescW0MlnEuMJbqVZ+cNKfYOo8+mn1hZe9nWvAPe9ZReL1bmOQjXYAIqtd3oZ8+V
         pCA/wS4m/tYqQ8ufDH3Bso4rxE33QxppoRnQwECr+lrcqxonP6veKMTtcvTjAPEREkpB
         Fy96/XjEohSIvKBoPO6uk+hj2M+3OlCQmCt6vCvcnylQo96BTWv9q49YiGuZ+223z+k3
         OGNqaO+G5nKEY7v9YHui+3iGBrUTNnUd8T15Eqqlt1JGzm7gR28Dk7YVPWSqvL8YSV47
         N2og==
X-Gm-Message-State: AOAM532mMlFj4lCO/NJUVRowCvuWQNyae7nD8p+sufJ666n912DDNYb3
	8IiNWUZotSpZTyzDZ6Sz/avpDlJn9qw=
X-Google-Smtp-Source: 
 ABdhPJwRfbMePC7YWLOZwWFA4EawevNhr5vHozDSlobSL7LwHBINnqhVZm1/BBLzb/hkluowcLPTNw==
X-Received: by 2002:a05:6402:190d:b0:41b:a70d:1367 with SMTP id
 e13-20020a056402190d00b0041ba70d1367mr1818919edz.155.1649926643537;
        Thu, 14 Apr 2022 01:57:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm429542ejb.35.2022.04.14.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:57:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] webkitgtk: adjust patch status
Date: Thu, 14 Apr 2022 10:57:07 +0200
Message-Id: <20220414085710.2010223-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164397

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...indGObjectIntrospection.cmake-prefix-variables-obta.patch | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index bccf74d9c9..2379924cc9 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -4,7 +4,10 @@ Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
  from pkg-config with PKG_CONFIG_SYSROOT_DIR
 
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232933]
+See discussion at https://bugs.webkit.org/show_bug.cgi?id=232933 for
+reasons why this is not approproiate for upstream submission.
+
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.30.2


