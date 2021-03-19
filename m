Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.698.1616176339292433219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gut7cg8I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id k128so3508040wmk.4
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvQ0p6xOm95hcVrVg1ZbmrDgfdZ/tDn1VfbQ77iCDEE=;
        b=Gut7cg8IiuoLDUwrS2Pn6PbXhzP9GatCfAq8xCWFND3TRwGePBhxxwyzU963gEmcnY
         kIgmW2ue41JLtQ/BnwG/IWAGq12VswDJEvuix59kvlvQjIeeQOL2xADwgHx7x9YhprFa
         nvRFnai59/czYVN8xnSUZOpMc+WY3X+J/6aug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvQ0p6xOm95hcVrVg1ZbmrDgfdZ/tDn1VfbQ77iCDEE=;
        b=SGQhV9uN3WMwdo2fcOwTlTbYfNE8RD8wkquTi7SJLYJuvw+vBuvAIBPJugHU64CAO2
         Oy2aiOjWqlsQvdtlUTMw+lFhLnsmGnesUWAcu1mMGbHZToDjJBHrABuQ5UpXjLmv7+xK
         tYegoG4tzfKO0hzrQiNX0tmJByyOByUvMwttbdjqptpuIur/Ks4thNmMJj76xdkx7v84
         ofPxORDD4O8DzisSiKbVsokKBuSkmSO0a5Wy1ODyBjLNCh4SeI+RGCEXiA+NL0sIV7nz
         De12WKqT8ahux1TQ2UKUwPNYwyxJFVX55tPLvCIiOfOUFqKF8kvLeWVMh+pAX1J0Aq5c
         XVEg==
X-Gm-Message-State: AOAM5326RUMu5mn/SG8Hg+9De3y+kAJNwCqN8qGdgDXc285MDZjNxdKB
	V6X+SB2OfE4QziJeDUPea99t4gYxIWzbRQ==
X-Google-Smtp-Source: ABdhPJzcUmAejhM3yJg4AWz87Bq+aREPinJdfdknfshGcWlEz+XTw6t7aEvoAl3kuWGWgWTCiXLOzw==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr4846689wmi.27.1616176337516;
        Fri, 19 Mar 2021 10:52:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id p18sm10755501wro.18.2021.03.19.10.52.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:52:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/reproducible: Drop ovmf exclsuion
Date: Fri, 19 Mar 2021 17:52:16 +0000
Message-Id: <20210319175216.234897-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardcoded path issue was fixed, drop the exclsuion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 1945a12c319..a62757399b9 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -33,7 +33,6 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'go-',
-	'ovmf-shell-efi',
 	'ruby-ri-docs'
 	]
 
-- 
2.30.2

