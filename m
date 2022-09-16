Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C096C6FA86
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 12:28:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.5259.1663331280771979103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PFpqkavK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id c11so35779454wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=zBKl/HzF6oqFshwFLy9RnAxmIVPe0iqfQKIQ5D08ZtM=;
        b=PFpqkavKMfZILhhJfpnBJlGvl+lCXcr1ihBzqzJ1E6Wcwf0P36e3WSur5JUVxQT4h+
         avv+KdvOdE6dLWEr6tTe9a+DQEQ4cldYqa2Ad2b1nEQomxyzZeCRlvJGtMJuAoBssSfi
         iDVcFSzaD5UNa5oVYpAkZrbrWQnPkPAtBBIVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zBKl/HzF6oqFshwFLy9RnAxmIVPe0iqfQKIQ5D08ZtM=;
        b=miMOH9O7H3NBiUehFoM1MKhLKzvM3rKVLEAnScolURPKRhZ3uc8cXi8UzhJA5iVeUz
         32oo/RzbnzSMOWvHTazj9cuTLijngkYqpH/8wI61hK1XmTgpEVk4wGbSbz+OGrr4zwvS
         xsNZH3jxtLGWS1RYI32sVT4ZVNV+ABrHdpKth15lvWL53Ckm+f5lWwi5xkCaNlUEtNTx
         x4aWt7jRfWn1WBHSet6GjFgV/f+b4H6yGkB2LViJLORGq7LMEzOxpJPbpqgrPFkbUQI4
         2+C2a9UdDbzM3vXaQ6bdgw+E3mHPNM8fGDsTSTqV8ILC1k+AsocC5bRmIxjdfIIAd+DP
         ZscQ==
X-Gm-Message-State: ACrzQf2RS0KxL8Q05uVqdPKwzCL3VktJQM61qUQds9XyUjKjIlbeBF/p
	nlAOWyfdnEg/Vq9IlA2XrCimhxUC5wVlbg==
X-Google-Smtp-Source: 
 AMsMyM7J00Y5Z54eX4xWrmf4moklY9ainUs2ea/tz1sjDisBv94HG+imryhKOsilotLgV3rRsUfrJw==
X-Received: by 2002:a05:6000:11d0:b0:228:8d5d:f2e9 with SMTP id
 i16-20020a05600011d000b002288d5df2e9mr2720545wrx.207.1663331279066;
        Fri, 16 Sep 2022 05:27:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003b33de17577sm1988312wmj.13.2022.09.16.05.27.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 05:27:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oeqa/utils/decorators: Drop unused decorators
Date: Fri, 16 Sep 2022 13:27:55 +0100
Message-Id: <20220916122756.1191173-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916122756.1191173-1-richard.purdie@linuxfoundation.org>
References: <20220916122756.1191173-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 12:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170789

These decorators aren't used anywhere in core and broke from python 3.8
onwards. The code implementing them (in getResults) is pretty horrible
and I'm happy to see them and it removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/decorators.py | 48 -------------------------------
 1 file changed, 48 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index aabf4110cbe..9627b353033 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -53,54 +53,6 @@ class getResults(object):
     def getSkipList(self):
         return self.skiplist
 
-class skipIfFailure(object):
-
-    def __init__(self,testcase):
-        self.testcase = testcase
-
-    def __call__(self,f):
-        @wraps(f)
-        def wrapped_f(*args, **kwargs):
-            res = getResults()
-            if self.testcase in (res.getFailList() or res.getErrorList()):
-                raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            return f(*args, **kwargs)
-        wrapped_f.__name__ = f.__name__
-        return wrapped_f
-
-class skipIfSkipped(object):
-
-    def __init__(self,testcase):
-        self.testcase = testcase
-
-    def __call__(self,f):
-        @wraps(f)
-        def wrapped_f(*args, **kwargs):
-            res = getResults()
-            if self.testcase in res.getSkipList():
-                raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            return f(*args, **kwargs)
-        wrapped_f.__name__ = f.__name__
-        return wrapped_f
-
-class skipUnlessPassed(object):
-
-    def __init__(self,testcase):
-        self.testcase = testcase
-
-    def __call__(self,f):
-        @wraps(f)
-        def wrapped_f(*args, **kwargs):
-            res = getResults()
-            if self.testcase in res.getSkipList() or \
-                    self.testcase in res.getFailList() or \
-                    self.testcase in res.getErrorList():
-                raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            return f(*args, **kwargs)
-        wrapped_f.__name__ = f.__name__
-        wrapped_f._depends_on = self.testcase
-        return wrapped_f
-
 class testcase(object):
     def __init__(self, test_case):
         self.test_case = test_case
-- 
2.34.1


