Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5634.1617634460742221087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=L1J14+xC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id v8so5772002plz.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5xLG3rLKQD1xsFQn8K+DTpdNM+8BBXW/l4psF7UQmQc=;
        b=L1J14+xC1jrt6vOWBHK+MRIlqTdcqJx+NIXrqeZ1UO2NjCBNRfTH0SsxLXdFmM3WxW
         L+NyGZjkWUyYUHyU6cZTf7BcZamsTYzOx0kj8AgOCeJomxuyAA8pPYipwcFPz7+LuY3G
         6novNJxvGvkZPN3/WHMSwwD4dYAz7pQJL80kcOHFcxhGRCwpNy+xchFCnOW6x1xX4iXg
         b6BjuU5R85YT/aY63XCFOGXcNbj1cmhgP9iXU6cJMtZN3D2zak9ZLX4hO7iqcCZRVg02
         v33XDRqZSjeJIZQZRdUdqXu3OgFPXWNFUEjeTahP0cAn29WQlxwjtTX3HzOaBvFG+tiS
         hkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xLG3rLKQD1xsFQn8K+DTpdNM+8BBXW/l4psF7UQmQc=;
        b=UdcWZQA4TD78dY6d7QoHsqIQQbmeZ9nvoJnxbFjXiBpxsE2i/b/BEE68qkLgmjs/f0
         cVJCKVNhil1yMKRNpx4Agm/rJN8hE/mGZOqQEc/pZHxerWgsKO8ZjpYg6ERniZJ2SiPL
         +TTG5HZFNbOiBAIZnKxGHhTQ47Ft46fE+K+kOzXnK3iJcO/0zHAwqeSrEch7QzXn0E23
         7MfcyBsw45enzZx7p4pJCRKGWcj+z3hugG+HjyqFt16LNJrhmEcWCl4JYjbqwsNKm4p6
         Jr9UoogqiF48EbolJLd8PdURxopCjpfRmPZEEXmiEVZ05JH3oJBtUJcY5iYH04qbSuMJ
         VyYA==
X-Gm-Message-State: AOAM530pFQ1J04xziFwONV7bx8guGeqdpLnXvsrBHUYj6Szq5OoiqnDl
	FKC2gdbM+Npm/50iwVrWLENQKSPJM+k58uHD+3o=
X-Google-Smtp-Source: ABdhPJxxMR3x7yqYkpCrs8eyhPvt07+Lr83xINTAOuXGVEqNtaNIY6O9z3+Wpic1inU5+bpZGevVBg==
X-Received: by 2002:a17:902:ee95:b029:e5:e2c7:5f76 with SMTP id a21-20020a170902ee95b02900e5e2c75f76mr24589651pld.25.1617634459892;
        Mon, 05 Apr 2021 07:54:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.54.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] selftest/reproducible: track unusued entries in the exclusion list
Date: Mon,  5 Apr 2021 04:53:30 -1000
Message-Id: <689335e861a9d7d6cc0a2ba6f066139533703873.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
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

