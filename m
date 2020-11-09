Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.8730.1604910707011954476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iM5p/szR;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id t11so7745887edj.13
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9zyOvB1yIUOJoiTTGh8/izetZUORowsmjc3Fg8eh5Xo=;
        b=iM5p/szRgyHa0kn+QwVgemwiQ3WaQgYd1GFLDOc9aiUfVd009LULMscZh/HXlf/qbe
         a3j+HCeBxwqyGL+pFRMpEH+Eq6NcoLfUhAA7xV7XECUN9uKtiIBKl67tqLvPRm0nJ4gm
         z6ddq7qkODbQATbO63k51zaVMSh3Qx8KSif1f42J2i4Du9gLiYb3HhrQUjVF+XOKIboM
         0UQk25capLVKoukUTv0BK9XlWV66fcZctndnpNyK6eWM1ISSKYb2+AsFpkyQhGGXJ4uU
         LF1QervPfhSrcLnhad1xWx/BF1BG6OJe6a9TTwMCRyLSA+AnU9kDH0EzUnMeHAwBhqa2
         nn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zyOvB1yIUOJoiTTGh8/izetZUORowsmjc3Fg8eh5Xo=;
        b=p1NzIwSOmbjCLzNyd8abDqn3oyguPoUaOwMNjJA2NzLte6WD35S7usRbyi+VIn2HOC
         DhzBlpY48te4YhMGUveXT2K0+LUyoeBj6p2XipyqM56gL9CYpxCv4S/6gmHZo+UBvUDK
         qnKRPpUxb0L3sWW0Rs9eq+L91ciEES/Z+EDFdJa+YnfsnaG95qQb2vsGnd1RJZn/kred
         N2LvLMf+d+nqQ30YCj5Gn86w3aA2v0zNSgl4cn5g8G0AKkOXEDrwb7GBdnOcM64QrsZJ
         L0CGtVMcoB3fMA6vWoeAynTg0s5A0SQZqqV5327GRDdhN/UkIXSSVXko9omyEtML/XcO
         /iPQ==
X-Gm-Message-State: AOAM5326+DvoJ7n05NVsYG+cJsNbOVTowGjjcX6hQY+wJzw7luhIEHDw
	cJdpfDsOAGAZzZEYT848hwV7TrtPjw5GmA==
X-Google-Smtp-Source: ABdhPJzmLIloWm4SZte1PMIgEE53brii/E6749mmhpfpZH5OwQq4FlJboWhoMrBxxD6QcejWbS6EFQ==
X-Received: by 2002:aa7:d514:: with SMTP id y20mr13806235edq.384.1604910705405;
        Mon, 09 Nov 2020 00:31:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 03/12] oeqa/core/tests/test_data.py: use weston image instead of sato
Date: Mon,  9 Nov 2020 09:31:24 +0100
Message-Id: <20201109083133.16503-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/core/tests/test_data.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index ac74098b78..acd726f3a0 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -33,7 +33,7 @@ class TestData(TestBase):
 
     def test_data_fail_wrong_variable(self):
         expectedError = 'AssertionError'
-        d = {'IMAGE' : 'core-image-sato', 'ARCH' : 'arm'}
+        d = {'IMAGE' : 'core-image-weston', 'ARCH' : 'arm'}
 
         tc = self._testLoader(d=d, modules=self.modules)
         results = tc.runTests()
-- 
2.29.1

