Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web09.36454.1612196747155522561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pzIbHihZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id g69so19348109oib.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r5KME7oPB0Lsf6Ye0BEXc7K9W/yZCukc1Z+IJ+u/77g=;
        b=pzIbHihZJB6uT7dBQ0E+FEr7UH9g8sV7djejv9K3sQnpDNsCpdpdU41Lcq2W0tTN43
         mg1L/WytwvFHjAAJdiGqxsVXIsLoCavHBuRdYQFxNSsYv+gQsEUUQ1t0luGVIilppCIk
         giZyhozFy5WGI3xmuJZTrA74daC1is8kl/1n9ud7f19hCKMBubz8ekeWN39t47V0Hjfa
         5rNXn1aP2WREcoVpsyEsbrhsiiB2dvv6CO2zFfaqmuDfFPwdAhtMJcBBs1tbhAaVb6up
         j/Zj/xmVhzfeZwhPcACtIQLyLJo/F6ZDBKmAq1ciGS7wC0XwErbEooptjKYOw5XG+Jyk
         d4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5KME7oPB0Lsf6Ye0BEXc7K9W/yZCukc1Z+IJ+u/77g=;
        b=GmIcoId+r7Bi90U43trVWlZ+BpvAuJO7aqTIMKQ197VhYUVwdCvD41EanD8LNsDpC6
         1sz+e9DirrOv1ieHfbmkwnDaM1HjT/Sh+1E0aBtn5EwhEGj+OjNwsmWvMRWUBQdd/Y4G
         FnNeTo0Z0R6/NEaUDQkAqLy4N8QBy+BT6Aayxyo93TVkLAw9sw5AFcf9wuXw3DARBuMf
         4sey5kSaycbFaa+LeSS8X2n815Ha3fjRwAnY36uxf6MaPABrKQ91ikhI2YX0GbYU1zfl
         MZ3C8i0QOoyr7PzZ3i+gYsstoGa4rCauohWv2U67GKsdes5mLWIWQYvkV+rNC1Tw9MyO
         9BFA==
X-Gm-Message-State: AOAM533QbLZojGZWhb1SWMbuWxvRa1iRuukX8XBEMcMOY+JIwOoHkwI8
	ndTbLsMbJIFY/ZF6uv9Ia0X2FRVancNI8oNSQKs=
X-Google-Smtp-Source: ABdhPJzbgwpyFRaFCKPB6eS2jeSm5kfy+NR+5eqwHixNEQ0WWJmj6f0pvRtXj+gYt42B5u3+swnhgQ==
X-Received: by 2002:aca:add7:: with SMTP id w206mr11428128oie.86.1612196746040;
        Mon, 01 Feb 2021 08:25:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:25:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/21] oeqa/ptest: print a warning if ptests failed
Date: Mon,  1 Feb 2021 06:24:34 -1000
Message-Id: <6097b1cbffc048185c1ed658f16f0f90a9d19054.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This allows spotting ptest regressions without having hard ptest failures
(for that full ptest stability should be achieved).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79b54d902df2788b0822b6c9cc14705ab00e6a5b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 5232c0b480eba4537c8db71c95189950011fb64d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index ef0470da7e..2066d009c3 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -104,4 +104,5 @@ class PtestRunnerTest(OERuntimeTestCase):
             failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
 
         if failmsg:
+            self.logger.warning("There were failing ptests.")
             self.fail(failmsg)
-- 
2.25.1

