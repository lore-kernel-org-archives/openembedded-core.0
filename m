Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5464.1620859765766488316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 15:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OePy/RFV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so3806852wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 15:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NH17rx2SIyj1zi+UPwWbT4x8ejOyTTxZGvxd3ZdRbY8=;
        b=OePy/RFVv0lOUmmsFhLn8j8eumm1KYM6g/aHUqai4G0oUXu2/T6Qgbr7bVecdPtUub
         PcAoxNg5amoFg/YL2b84cgf1tj0Q67J4beEPSzKkHf2DlDDg3SaOcY4oVsURAQAl7i/X
         JxHl4CFa6MqbgJOQ+lkly6Da3jQ8630ht3wRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NH17rx2SIyj1zi+UPwWbT4x8ejOyTTxZGvxd3ZdRbY8=;
        b=BKd35DAapghkojfGC4W3y6CW0DM0dEe4apHwdYLeSwyHRSRzMPmwQzph2H+SzOzP0V
         RAm6qYdiZabWL65ASJ6pSwWFwN6yjAm8wj7gDhbGU5C/XFbCV8JLJbQAIh8wEO0TbnFE
         Fe1r3zGcIzdwfwoIzaGCZoOnK7kPtGURSZGe4+souN8byujX63WANUv8sjGKd2E3k+K8
         14r4BIoWTlj0DyovInSGqtc2IJ0Cmd3n6R0pabX2bdglrIq0g0FR0OoZXwyv6NZpTlJT
         bAI7Ep/1VYuO52G+1v0nZ/jI2+sRUUP2hVb8AShu6cam2IhIZZ7RHdPq7ESXLncIfyxL
         Y65g==
X-Gm-Message-State: AOAM530AqIob5PF+Q3dJKzlGoJn3AUdlaHvLVQbKAvcoKYbpMuqVrQr+
	MJwDi9rgdqABZLsQ4dtZi7l8Gq7EywnxOw==
X-Google-Smtp-Source: ABdhPJzoSBCoo38nI2/qQaINk/0G04Xj+HB3v7X8ILLp8bcVZz7VrUqDRnadNWGCcm0FFeG2M+R9oQ==
X-Received: by 2002:a1c:ba05:: with SMTP id k5mr9754668wmf.169.1620859763931;
        Wed, 12 May 2021 15:49:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id o13sm791887wmh.34.2021.05.12.15.49.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 15:49:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] rpm: Exclude CVE-2021-20271 from cve-check
Date: Wed, 12 May 2021 23:49:20 +0100
Message-Id: <20210512224922.2286380-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is included in the release we have, it was the reason for the last rpm
point release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 7c03b41fc82..2857cd730c4 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -47,6 +47,10 @@ SRCREV = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"
 
 S = "${WORKDIR}/git"
 
+# Fix https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21
+# included in 4.16.1.3
+CVE_CHECK_WHIETLIST += "CVE-2021-20271"
+
 DEPENDS = "libgcrypt db file popt xz bzip2 elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
-- 
2.30.2

