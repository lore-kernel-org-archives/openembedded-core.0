Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.42981.1606636089219182640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 23:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tVRJyqcD;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id o4so5561090pgj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 23:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQ6iE5GnFraw1rr4wHwLhBzqJl0M4NQsdK7eqtTLmsE=;
        b=tVRJyqcDYbZahJrGHQ+bcW7/zJyBA6+0gMVwKipiang93PYqBTluU77E7ONYBETZtC
         t4kY8M7eNtnnWMuUo44idP6VCGXv8g+8usqmAwu3VQ8f6X2eFnw0++JM07FuG1/4A8eB
         x/Xv1kKqHgCs8dg50lSVHjtY3hLIe+YXMzGEDkzcmrxEcRO5x3YvpeubNw1rLLqaeU6v
         t5pP2NHvIQIjD6I9jVg7/h1D1QL5Wnn/pm9HM179bHYP8evsFVLTZqe595psROoHt/gc
         V4edHGlP+XLC1s9KH/r6Fqge4J3goUbPSDv6kNS+7FtuReAIFcTKOn7JzP0Bw0sB+YaQ
         DyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQ6iE5GnFraw1rr4wHwLhBzqJl0M4NQsdK7eqtTLmsE=;
        b=VTiSUkrKqGnL2BdGNIGvGh0jCgo8DJZglc7hSC0xzCu4v5sqQRb8+GpT5BNOEaK4I1
         i04GLjAdHz4uvfDTW/wSIInwslbKT3UsLepj3XYbRRZ7Z2AlnCJDmfl4cMZBG8Y4nJEX
         GMHkCbHpVSnv/7K+05ek/vbUDGhNBZvZvcDkC0xKQNbsEaC7P+wFWSrLcdAJXh/2RkfT
         T+ALMdsDsnE0yxOu9aDYtwOVT8oXGaOOq1hKiXasU4oY6R9rIrALy+qwGSsMKkwJFGNv
         P+SIWnNgC84TRiOPAKv9AmGJXsapzB84MQhjijkX8r/++zwR36RkPoAE1B7ngCzCchuv
         gHYA==
X-Gm-Message-State: AOAM530wtPTjMLRv3tO6hyBU9L6HqYhLrsU3tfsdk8jrs0ejF2JnCnyl
	WZQPWStWPz4LZU2X6Q7BZtb/F/cY8F8Dmg==
X-Google-Smtp-Source: ABdhPJwa1CbISSz+LSqdQdxqDonl7JV+EOcgUvj0H3YwYoo64Zy2jSB3DDG5F0xruqaXH9J6IErKow==
X-Received: by 2002:a17:90a:7087:: with SMTP id g7mr13908448pjk.200.1606636088605;
        Sat, 28 Nov 2020 23:48:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id z20sm12905267pjq.16.2020.11.28.23.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 23:48:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [PATCH v5 5/5] python3-numpy: Add python3-resource to ptest deps
Date: Sat, 28 Nov 2020 23:48:02 -0800
Message-Id: <20201129074802.1493537-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129074802.1493537-1-raj.khem@gmail.com>
References: <20201129074802.1493537-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
>           import resource
E           ModuleNotFoundError: No module named 'resource'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index 9351e507c1..2bfc913aa0 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -49,6 +49,7 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
 RDEPENDS_${PN}-ptest += "${PYTHON_PN}-pytest \
                          ${PYTHON_PN}-hypothesis \
                          ${PYTHON_PN}-sortedcontainers \
+                         ${PYTHON_PN}-resource \
                          ldd \
 "
 
-- 
2.29.2

