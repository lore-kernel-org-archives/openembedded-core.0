Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.5886.1617634444418920550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YSMejz5t;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id f29so5814526pgm.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bfOuDlNCptGXFQw4A9xNcc0V6vCfrwPeXy+lhnIK6fU=;
        b=YSMejz5ta2jk9NpbZS1J34TgVUpk/oSzNs95CD9cZpB0vj7SVuTsKg/P3HlR0d66Sf
         7pVUMhY17NXlO9jWGhpET/WxHrOWgwmN/5hsxOojkucRFUAPDfV0eTH6r77obesY73aU
         s/QQSOqT08aicqcJws3EyEKwZnVyIXxny/4L6YoyWXndAALd9YSC3Y3pKYi8u8Bqdmvg
         4h6cAoLlwUC3W0My7NdPu2EbQyNET0d3WaHT3GvfVe/kVgLTHo5G0I8fhsAqNIRfBOeO
         LSE0QjRoN7zxBPzap7I3Km3PM+ojBYa3PAMYjw7nJczJhaREIF8Aq7ZAYoJQSfQnIe4C
         NOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfOuDlNCptGXFQw4A9xNcc0V6vCfrwPeXy+lhnIK6fU=;
        b=f6ROBj4zDomBXVLQf8yHgdfZAktHEsmhWumKo2EiyCD5n05/nkBKVqJ/JtV8W6DWjd
         r8uZoJGBOrlHWafA6f4Qj8/TlZETd/UhoISw0lnFiqXfHq6FeGo9c+G+t1r+Vxr3C7Jj
         +1bCf204F0+8/ybQpsFxfKxaIqTcJjaW7mhhoC2YEfXeF10gPi6JJ0HSsTo0U03OYjHc
         hyzUBDJM+M5MpjWDJBfRAFrFZpTFA1OAWVPn8KCG50sIF7R5bTe2x/EVHNkyCxsPMmmZ
         un8lrpf8DDd1a7r+Wk3lp5WOi/FUaTj5HJHYfjpQhF9fDGlOlA0OAjx2Owevr5nwVWMF
         KLDQ==
X-Gm-Message-State: AOAM533yg8fQ7IMJD0aGcZ3fXzon0uPA00LEjAmjDiLOoN5xIWave/E6
	PqX2yVswU599pNDNdzsbQpW6yYOHmxDcLm+qnSA=
X-Google-Smtp-Source: ABdhPJwrNEv6omdSvqU2n2usT2OCd2uP7ZZVlUk4j4kGzsUBNwxLbmVVjoifVdx6ddNj5SoSBN4CHw==
X-Received: by 2002:a63:4502:: with SMTP id s2mr24257641pga.94.1617634443522;
        Mon, 05 Apr 2021 07:54:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.54.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] selftest/reproducible: enable world reproducibility test
Date: Mon,  5 Apr 2021 04:53:27 -1000
Message-Id: <eca98a5540a3c267a09ef19021a00695725aa7d6.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Add systemd and pam distro features, and commercial license flag
to include more recipes into the world set.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed8f94942c07784f9f6eef5c00b75aa9b398ea5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f570958f80..4b60b2e1b0 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -83,7 +83,7 @@ class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
 
     # targets are the things we want to test the reproducibility of
-    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
+    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'world']
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
     sstate_targets = []
     save_results = False
@@ -156,6 +156,8 @@ class ReproducibleTests(OESelftestTestCase):
             PACKAGE_CLASSES = "{package_classes}"
             INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
+            LICENSE_FLAGS_WHITELIST = "commercial"
+            DISTRO_FEATURES_append = ' systemd pam'
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
 
-- 
2.25.1

