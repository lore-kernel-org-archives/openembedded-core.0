Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.10190.1619186405787485246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S4M9mdk1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id u7so23454532plr.6
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MpQYe9RUK4OISwx6ZwliQJV4dXU+uFkX05vmTRj3h5g=;
        b=S4M9mdk1xQJ2G0PfkdGwX1X65bE1ar16LW3hyBXJLYvcPVtxPirfKLr8GTs9o8dWe6
         k1+sdZ3j5ybnCjJrDk+e1mrzMRAoH3IEHpdGBoTxNZeBxaLD5tXqpbyhusyPfRoT/1+s
         4sLwdBq19322BceVgBdrXTs0+H26XuOc71zpeyE9+V5PdCJ1ShHihlOTADXFlv5KX9fY
         /QErzy5/USxPK9eTKw/aCYlfqwBw8iCVoBNVhrYccN1Mx2uA9P/+til6LQaiPVOpty+8
         l6oWZ+5SpVhZyjzmS6CYE08++WOCt3KDifcHg2Xh4Efdqi1UndMicRCv9bn448eR82VE
         cuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MpQYe9RUK4OISwx6ZwliQJV4dXU+uFkX05vmTRj3h5g=;
        b=JMfBr5rZ5hxxCrpTahHvQuGjxCMpbOHI4ToC0zzEi358WUapQJL53mZo0UxW8FcmPj
         BwVmXCNFnClQg7k3rQgcmiGx1KKPdyiRFMLZB20ONT2cNlIgZvwbytI6OpP6pVYDneJ+
         AtkLs00fpWhP3/o7UIZapOe2a3Fa8jr1cppxWyWm0YcqfRrU5OediUwM0eCJBnEvD8X0
         tSaKYXaM2C9RJ6DhZiLnKEzGkb4EeWSZkIZxAt+z0XWwYR6kA0rMrIDH1XsXUFFV1SUq
         wvqKGt91pa8BY4/Er7CregJgatJbhIJsc+7Nr24KHT9QXp0QcpEJG1T2aq77WIroQ6Bk
         aXyQ==
X-Gm-Message-State: AOAM533DKRsjpE/W1wWJF6CBNLx9nGlSfj27niIjl5y3EdZIrtuAGKyy
	wYQ3kZHQzeUNkpTmUhp4P/Rg5sK/pPDy3PLkziM=
X-Google-Smtp-Source: ABdhPJwYHc6Rb8dk1S+X/VQirpyqrPmUnKvrXUcD5qLbvQi5f98du9dAK3zrOm32Xb9K8c4j72KGMw==
X-Received: by 2002:a17:902:d306:b029:ea:bb6c:3c99 with SMTP id b6-20020a170902d306b02900eabb6c3c99mr3832241plc.9.1619186404868;
        Fri, 23 Apr 2021 07:00:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/19] oeqa/selftest: Hardcode test assumptions about heartbeat event timings
Date: Fri, 23 Apr 2021 03:58:46 -1000
Message-Id: <cad75a7aa940efaf6674bfbbeb38d3fc11fab143.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Setting a value of 10 for heartbeat events causes the test to fail. Hardcode
a value to ensure it works correctly even if the default is changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08b2c9a23ce43ed65a16f5f0714b19a571e1b54a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index e91f0bd18f..b1b9ea7e55 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -57,15 +57,15 @@ class ImageOptionsTests(OESelftestTestCase):
 class DiskMonTest(OESelftestTestCase):
 
     def test_stoptask_behavior(self):
-        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
+        self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
-- 
2.25.1

