Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.157.1617899503985785331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IrjoDdTO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id z15so2759520oic.8
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bfOuDlNCptGXFQw4A9xNcc0V6vCfrwPeXy+lhnIK6fU=;
        b=IrjoDdTOKsKxJAoWdOEEFcQJckI7Kd2LOO0qgpMz8AdYH5bV0ZYXOeb/BRZwKw/Tc3
         iAOGPQqMRjpB3jC7fnsOrp7/CjwGRcWCjdgMa+mlbdSV2axyQDgr7F6JfbyAcFqLfGMS
         +o24xV6Y7IArPvS1NTe3/Iqs1DZ9owXMmGK+kk4/DK6SLGzAiVYSTXO5aicGG42cw5q4
         jbB7GSLDf0Ks4nXMFI3FWR24suMF0yCXluWbRKkd66Ke6Vsw1zPsOHnx8G6eAPIsGU19
         yCgiQrMoiHQrqUg4MbOAA9B9dGIIKeWn3ZPCBhojMtC5nCu/hsmM7Ltwx1oxOyqFRzkX
         1g5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfOuDlNCptGXFQw4A9xNcc0V6vCfrwPeXy+lhnIK6fU=;
        b=NDFWo3Ul9t4NPbv/QoSXPtw6JX1toPiXPPlLj5u71P/Y3AHSmI6sEvp1fb4+obg4V7
         XkurCqXt5156Mbm5KXxKLANplGzCfV3eQy9qRYJ9aJd4teHQKNMsa0K56zwOFBswR35q
         08Yf9vqaAyTY0wmfBp68vfWRWIyjsGLQYFpRrimXUMg64jji90YGWu95kJdnHT4ufB5u
         uxvtEYn2EGTaldJlH+FBAP6ygkc16SQxuVdQ2wBmI3b9a5R6knGtTD4W3+p2ZQ6a7dTb
         tH1AIXoX4t6ppjwbuhNt2ph5IrYF1Byk/fqVjb5P0RfjDg4Za57ETfXTUGH+f2VWCJP4
         KF6g==
X-Gm-Message-State: AOAM531R19kTqOxKyDga7Xs31JIcMBegnZXS4C/Tmhghzxpe8TtgkScG
	9x7Ln4wVrNhZnNHsdYwkBcH0LXdW4PHGlz3TwQw=
X-Google-Smtp-Source: ABdhPJykGw/8ePQl+H97bTZuSJ1lLl0Uxa348QJpvEuGDCjesQhlX5ow36TU7s/bqeXCsChg0tOifw==
X-Received: by 2002:aca:afc8:: with SMTP id y191mr6786185oie.169.1617899502870;
        Thu, 08 Apr 2021 09:31:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.31.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:31:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] selftest/reproducible: enable world reproducibility test
Date: Thu,  8 Apr 2021 06:31:01 -1000
Message-Id: <eca98a5540a3c267a09ef19021a00695725aa7d6.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
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

