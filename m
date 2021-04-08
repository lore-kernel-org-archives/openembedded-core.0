Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.151.1617899519948880654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=K8pN31zW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so2855521otr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5xLG3rLKQD1xsFQn8K+DTpdNM+8BBXW/l4psF7UQmQc=;
        b=K8pN31zWGIjJBCDj6lvvtQGwP8JdwybZS1iXABmny04f6RLzaoEFYIoJA9QeMQnjE6
         /pAMaRll3PdmV3eqgJ47C8NzGMkC7ntDiJFRLAhyR378j7L3i3OWmZe8E7ThClygYOtR
         HDN3/sr4Z/NKTMC6eGrLNVjB9YGCjUxiRykvCll/HwLFpBahIN5Tr4Q2aE6iGZjnX4Os
         myA2MUksPsRPJniBjSQMCdbzRF/Lq+bkysHWmZPw9+b0vBo+7A1GTbbdE/kgIqBuPndr
         MZLCj/JTKhA5YaiywF3trwlTMcc2uCFLn0gmeDChAjcNKpfEkpFMsIe7t6WvrDrP7j28
         SDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xLG3rLKQD1xsFQn8K+DTpdNM+8BBXW/l4psF7UQmQc=;
        b=CIb5fp+v+Mlz1o+hoKwbuLv2u/MGQ+5HAHo5hkff+yLcmBw1kwzaxx5Kg9NMK2yQQ+
         oKDtEC1cwkDXA4Yi5EqhyEI8ScxegF0WMwDl4ULUtt53Maq+zm2Fw9iSi5t6EzkwdQ6e
         n0+YBihecOHUce4ArMfkfU1BizvonsCiMy15DZ/Oh2v39r0Ut+pPN7MVBR1000soFJoB
         BJQ3WAjD+7MulfiEb30dVnj1TdlpL2wNS584KSD6/TDNKvAx4LoW8DlxYqMsixra7jkJ
         mL4gCcLLQgOdLesKYJ2q53Grb/PDdSsHztXAki88K9wRK/dCDmOPnP+cvC/etcSN90E2
         1yKA==
X-Gm-Message-State: AOAM531lQDdbdsU7WbN2+3ni66qbjKq1sql3BSppaSjLhiypPzzte6mk
	n9lk8nDEXczlzAl4ZXVRaIM+PpvgqgI5vTxR44w=
X-Google-Smtp-Source: ABdhPJxARwwPr+yDdkmTd0E/Q/5ZYT6dO99ngpIeiBqUgOf1DbZe/8jB504Nr0HiAMCG//jIYs5tqQ==
X-Received: by 2002:a9d:24c7:: with SMTP id z65mr8670340ota.243.1617899518863;
        Thu, 08 Apr 2021 09:31:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.31.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:31:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] selftest/reproducible: track unusued entries in the exclusion list
Date: Thu,  8 Apr 2021 06:31:04 -1000
Message-Id: <689335e861a9d7d6cc0a2ba6f066139533703873.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This helps with trimming down the list, and towards 100% reproducibility :)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da7a173d7a01524229c8515326465968a845e96f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index c023c92d5d..b331c3dedf 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -68,8 +68,8 @@ def is_excluded(package):
     package_name = os.path.basename(package)
     for i in exclude_packages:
         if package_name.startswith(i):
-            return True
-    return False
+            return i
+    return None
 
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
@@ -95,14 +95,17 @@ class PackageCompareResults(object):
         self.different = []
         self.different_excluded = []
         self.same = []
+        self.active_exclusions = set()
 
     def add_result(self, r):
         self.total.append(r)
         if r.status == MISSING:
             self.missing.append(r)
         elif r.status == DIFFERENT:
-            if is_excluded(r.reference):
+            exclusion = is_excluded(r.reference)
+            if exclusion:
                 self.different_excluded.append(r)
+                self.active_exclusions.add(exclusion)
             else:
                 self.different.append(r)
         else:
@@ -116,7 +119,10 @@ class PackageCompareResults(object):
         self.same.sort()
 
     def __str__(self):
-        return 'same=%i different=%i different_excluded=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total))
+        return 'same=%i different=%i different_excluded=%i missing=%i total=%i\nunused_exclusions=%s' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total), self.unused_exclusions())
+
+    def unused_exclusions(self):
+        return set(exclude_packages) - self.active_exclusions
 
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
-- 
2.25.1

