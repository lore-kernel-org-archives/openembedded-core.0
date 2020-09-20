Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17682.1600602454341395804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2020 04:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZOqCj/q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id k18so9797195wmj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2020 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaCbnpsvMTEXgRYzl+WE6ztTmqhOFpA2NKjMPAu+nDw=;
        b=dZOqCj/qDtoC3NcEmkzizP588wU9RQbPImoJPgQanDYNZ2n9GS9jEVUHslK63Qadpa
         N1pn3WyZFOH2dW2jR09ZB6io2ie5VfKz7YmfLGJeiHexmmUS9y5/b+gMUo4GvvvG7oYZ
         V1x/CeAMlaX+dlINJVwv0C6Tgm1JoF6XnBvGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaCbnpsvMTEXgRYzl+WE6ztTmqhOFpA2NKjMPAu+nDw=;
        b=Xy9tjZkTFSEJZzgZceV03Y9FXHxmxJNT8B9WimgvNwKXIbPxeXSfuuhzdEdtwjZ3mD
         AS6ywDP5KrJ3SNpaW+7vG0oCzkrghK+l6UYOOAEObHbyJ+/uYDzjxXpYCzB40pajBA5l
         vJ3MsCoB5CIK36NnGDiknopWOBlxigyKtCtmccdBZtls/k3gr5S/hhmjyeTxNnMev3Ol
         hph1hDoKg0TFW3IQY5pm9chZr9FrcBRIoc+TlRfnLD3iTzi27wmOrsyoL+npWNXUFASW
         YlzS3JDqZHLzO38B1FZBV06dVhdZtMZ5ex29onphUnk7MFqsj0IIgEiUPxJm1IR8txVI
         NsRg==
X-Gm-Message-State: AOAM530kUwP+YYN6SYKNa7pjKXOwIWufnREy/mJUAdWliIV0Ed/ouyrX
	/Y7QblY4zt1SkzGeiXCsBf4XVAMl/Hs1Nw==
X-Google-Smtp-Source: ABdhPJyPr9g70mnDlmK0UXjECdReXdRdQN18xSBvx3dtp0RWy5KK/TLurjwFdwMlnjqLCY1eKzhwJQ==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr24348619wmi.37.1600602451800;
        Sun, 20 Sep 2020 04:47:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (7.1.a.4.b.6.6.4.7.f.7.9.a.9.8.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c89a:97f7:466b:4a17])
        by smtp.gmail.com with ESMTPSA id j14sm15794504wrr.66.2020.09.20.04.47.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 04:47:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/oe-build-perf-report: Use python3 from the environment
Date: Sun, 20 Sep 2020 12:47:30 +0100
Message-Id: <20200920114730.2412159-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This means ot matches the rest of the system rather than causing confusing errors
where multiple python versions are mixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index e781f4f03ff..7ed86a72f66 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Examine build performance test results
 #
-- 
2.25.1

