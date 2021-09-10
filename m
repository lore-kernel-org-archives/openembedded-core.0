Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6457.1631262335620324457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IDEzH4Dd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id n5so1427714wro.12
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0hZVsHt/IIqVHeKq+rg3KLbqhB+wds9GNpY8BlNJhes=;
        b=IDEzH4DdvOvISLH3JGvP95l+6EN2uJGi/t+i1oPXEETgprxC7NAwT9LWQZI6seCnmk
         xA072B9n6YqH2iKx0SgTrKOamj8QnLNMwYtgs1WbTdiDcZ3pOVD346uxdgx9526qJ51T
         lV/45OEwHNhVNz1AlOPIyz5CTca2+sE36Tp14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0hZVsHt/IIqVHeKq+rg3KLbqhB+wds9GNpY8BlNJhes=;
        b=BbPWBdJ9iAfCZ/duz3djom24mIYCVPA/9beLxYd4UTvddmbITRyMiEtRWKWFDTJ/vl
         NkpU+Gk5euFS9BBXZ7QG9SOlLee8vHIGNlsyAIVQjXQ57TiZNjvPYgfBh33tE5dQcQ3l
         vUTt5VSE6IoT/XIr8eElYNrmnDzeJ0v/SRqUZ73gw9Xua/LWeEnBZOrR6Q9FcDUutsho
         u8tjXKq8abFcUo5VdcnMQEbIiwNHjAaCobnzVF7Zs6jOvg8Qfwtroo4TZgSvofrFnn+i
         0BrjlfIbDZCVKR6sDSEO4um/lw5E3YJvGOtUoN+VqKgAJAzeMfNFTyVt8hHeZI9raIq7
         YZtQ==
X-Gm-Message-State: AOAM530uVJID3DcpIUFEIGMAVzMxeG9f7lCg6h0s0Nhw0mEg6Jd3fVC7
	o25IuIFmT7CHTKHk9MB9gcntYTxrxR3xLCBc
X-Google-Smtp-Source: ABdhPJzWlYvth80tPeLKEBIk7PSwqIvk5Qm50JgSvLVIFXDuj6TF08ygpFnZO2qbqX2ZiLn78FCXQA==
X-Received: by 2002:adf:c38c:: with SMTP id p12mr8256433wrf.113.1631262333702;
        Fri, 10 Sep 2021 01:25:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id l1sm3038515wmq.8.2021.09.10.01.25.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:25:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/oescripts: Fix after tar recipe changes
Date: Fri, 10 Sep 2021 09:25:32 +0100
Message-Id: <20210910082532.1247641-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 8a10ff357be..1decce39e96 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -150,7 +150,7 @@ class OEListPackageconfigTests(OEScriptTests):
         expected_endlines = []
         expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
         expected_endlines.append("pinentry                     gtk2 libcap ncurses qt secret")
-        expected_endlines.append("tar                          acl")
+        expected_endlines.append("tar                          acl selinux")
 
         self.check_endlines(results, expected_endlines)
 
-- 
2.32.0

