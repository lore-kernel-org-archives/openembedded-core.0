Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.115.1600879151330936573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 09:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hLfOg3MP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l15so4918070wmh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNunGGsExh7ffdNuKa8gT/GdktM5ibcEDnkrb0gTYz8=;
        b=hLfOg3MPQzzzPtRMcWVNvp6e0L2unOEFB/Y38Z2cZJHpWuo1N8eHqqyW3Iy6D4ILY6
         OW7WgRhoBjJmGjTZUthZQEKcnWqEagAxFJM9c01gIgFpqbUD0RNaFHYZdJEdswcPE47U
         z+vRztpRDZLX4dqk709ND43A/8PFLB92ikEvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNunGGsExh7ffdNuKa8gT/GdktM5ibcEDnkrb0gTYz8=;
        b=gQ7jwqJla4bNRChP156bnP5EeOvthy1VO1FXnpjZJiJT4ZtTFSoHHnJj6BOlv2OER6
         bR4YJ+oJZAJeyoX8D/8dWHvNeEU5ag09D6xhVHM+EndhtE2ghB0eu+jFPQR5b5PHr6pU
         bl0A82Wwh+5yMsUBJfSJB/ijEYFBPAUGCgAyk3ZxLCkUmJT/2JGydOqhgEf6tlTw5Cwj
         OiTOnB9R3BhlHBLi5V/6FK0BDJu688dXwq346etwwPLy6uz4u7YRbVKSENsu81a5gUlV
         x6/+vvH6cWZpQcRzS2LKgjsEX7IOJF+KOpy2/b3kuFAhrAWr3bP9o/PkNoxxvxqF5Dl3
         Wpyw==
X-Gm-Message-State: AOAM5328TI9ZrRN2+lwjD2T1EnMtMgc4vJpxC/fQvdh6F7+mf8n784RO
	P2M78bt9BuQaoKGciY/rSAnOBfvj4166NA==
X-Google-Smtp-Source: ABdhPJzgeqTMhnhUR8LUHIzPWsaKYxKJ7Yfrwwyoi5LZufb2m2zKFMkFDRf0kqph61Qu4J4XljW6Ig==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr402822wmb.133.1600879149237;
        Wed, 23 Sep 2020 09:39:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:4d01:62a4:e14d:6b53])
        by smtp.gmail.com with ESMTPSA id y68sm304896wmd.39.2020.09.23.09.39.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 09:39:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/incompatible_lib: Fix append usage
Date: Wed, 23 Sep 2020 17:39:07 +0100
Message-Id: <20200923163907.2552406-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's pure luck this has worked so far, add a missing space to the append.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 3eabd79097c..2a6382a1a85 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -85,7 +85,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
 class IncompatibleLicensePerImageTests(OESelftestTestCase):
     def default_config(self):
         return """
-IMAGE_INSTALL_append = "bash"
+IMAGE_INSTALL_append = " bash"
 INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 """
 
-- 
2.25.1

