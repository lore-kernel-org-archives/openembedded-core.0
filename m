Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C05DECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 12:28:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.5432.1663331281860385452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hrNelShn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id b5so35759202wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=0gg6FofRgF27jYcTy4InFZxhuVke0PkFqeFjOBAdX+g=;
        b=hrNelShnvx+Kg3dGp9AWsk71B8K0NfQ7Hin5gcdku2jrq5X+HR9yGtInOFM4ubqo92
         nSELNZFs42zhlW3Y366m/vVDwZcG6blWEBjzMMGIyrnwEseEAl0xm7t/aAJw1EPqHvqz
         mgPYcaYhosKqJDN0HHgPd7+23xjvCrfonffrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0gg6FofRgF27jYcTy4InFZxhuVke0PkFqeFjOBAdX+g=;
        b=wtnrp0gz5eq18lHuhsNKhmuLZqzLlDdJWhjFlZlCA4MPCdPnirp57W/2dC6Y/pPCA2
         KmHutpd2B28zgLIIdgXz1YdGJAaVcqUlANzyyQ6+0PtKNjcYtV27Uyg5H2jL+bne04mW
         7Ss044TYw5Bn/QFgjDvN++RC4CFGpMzQlvC3uHvzxWjJmXvNXLcCut6qgfHVnhTl96Gb
         aULC0ioAQXIlUdJ7JhrHEqlyDfK2mpf1mYfndb4P0OAXlOoKzasO4ZSCKinq2WnJdLMI
         RDTRZauox1lGyy+rqobnNU6Me+w7hbWwqFPe6XpmkPMQO1musXeJK7ST8b5easbLMuLK
         Kz9A==
X-Gm-Message-State: ACrzQf3niSnPIvAXiPSnUTTaSmJ5ct87MZZ+8LO/V+mJkQcXqvFQIIEH
	CaYPmneR8Gv6Uqm9B6bgGvhJ2KxL60mtdg==
X-Google-Smtp-Source: 
 AMsMyM6sI2ts2BCVpmxRjoQnBJa7q7UVmAUwxZDZeLZ8CHXmkyAaMixiaSbl3lcYSM3vGCL0rs7kGQ==
X-Received: by 2002:a05:6000:1acc:b0:22a:db06:6719 with SMTP id
 i12-20020a0560001acc00b0022adb066719mr2577702wry.121.1663331279943;
        Fri, 16 Sep 2022 05:27:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003b33de17577sm1988312wmj.13.2022.09.16.05.27.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 05:27:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oeqa/utils/decorators: Drop getResults
Date: Fri, 16 Sep 2022 13:27:56 +0100
Message-Id: <20220916122756.1191173-4-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/170790

Now there are no users of getResults, drop it. The code doesn't work with
python 3.8 onwards and is pretty horrible with internal python knowledge.
We don't need this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/decorators.py | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 9627b353033..ea90164e5e7 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -16,43 +16,6 @@ import threading
 import signal
 from functools import wraps
 
-#get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
-class getResults(object):
-    def __init__(self):
-        #dynamically determine the unittest.case frame and use it to get the name of the test method
-        ident = threading.current_thread().ident
-        upperf = sys._current_frames()[ident]
-        while (upperf.f_globals['__name__'] != 'unittest.case'):
-            upperf = upperf.f_back
-
-        def handleList(items):
-            ret = []
-            # items is a list of tuples, (test, failure) or (_ErrorHandler(), Exception())
-            for i in items:
-                s = i[0].id()
-                #Handle the _ErrorHolder objects from skipModule failures
-                if "setUpModule (" in s:
-                    ret.append(s.replace("setUpModule (", "").replace(")",""))
-                else:
-                    ret.append(s)
-                # Append also the test without the full path
-                testname = s.split('.')[-1]
-                if testname:
-                    ret.append(testname)
-            return ret
-        self.faillist = handleList(upperf.f_locals['result'].failures)
-        self.errorlist = handleList(upperf.f_locals['result'].errors)
-        self.skiplist = handleList(upperf.f_locals['result'].skipped)
-
-    def getFailList(self):
-        return self.faillist
-
-    def getErrorList(self):
-        return self.errorlist
-
-    def getSkipList(self):
-        return self.skiplist
-
 class testcase(object):
     def __init__(self, test_case):
         self.test_case = test_case
-- 
2.34.1


