Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.63.1619200983733060313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sa0Ri8xl;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id w3so75166775ejc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y5bpTryAise4pea0o+T6N1DfKdGNhylLjCFFUfAeNfE=;
        b=Sa0Ri8xluXxF5Lo2jA6kVAX+g0RbBw2eVSh10DiaOCQBfr6q6aTYezHgQ2K+DyZ0xA
         45o2c2IdSZ3Ii2/dog08IQakcS+VRq4UzdCsQjOn1mCzFWSJLAVcmA3TZWFSARHg9NWj
         wUwy/KcXGYejyO9yxU8VE5sBrlk4HXF+o46CWGg+WfdKVYJYChIHYo0Xw5NyZxPmYiAn
         LS/k2MQmiJKY5pqramFZ/DCCsGl022M1bwxzFISdkLWGAdcW0RPD0/AxEt/LVAgmRFgQ
         TpqMuJ65BgHlCvbGKzkdkDcxuHHkTRqIEXGEDKjXJG85+Qh9nGR0Fdm736c1jahfcmHF
         XaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5bpTryAise4pea0o+T6N1DfKdGNhylLjCFFUfAeNfE=;
        b=JddzufeaZ4tmbkNEBGjtZs08ys+IAePjgPKOS+M0YMyReRCMmKvVM8icHh6tLcz/Ak
         s/cunu/Q+ALyy8VjmHVLvZSiVYoxCnIoZ4tbpa5qKIaa1kV8WYJnbCUr2TIx5SO60Kgp
         IsKB6SN+togU2FVPlumtBpfxseZa3n9pLAaIqFPkcpnKdD6FFkpli6SafJ9BBfzKtlWX
         svWBIproucHRkqTelNQppN5rlYAMNSWl6Q/gjCqatKFtAnbEWFl544WaV2LnxL2FJeqL
         q7snOCiR8doQIZ/5Hd9BYhiKGqLLLam4tj8uMJyr9+d7lIuy0GPT/e7CEN9mhIevMjEO
         eLIg==
X-Gm-Message-State: AOAM53287glLYTEzVdxSxCmu3HG+t/34XG/Uz+c3V3QkvvD25MMn+p71
	RvLfUWxpD+iEjsN73DRV3BqGJ5iSjfKK9A==
X-Google-Smtp-Source: ABdhPJwExLKhkPhVQan4KlFQjZqeGeVSGlJjvLfzSPmv/Vtu3ADHEGJSXVjKEHTEYw6jRQfonsaGOw==
X-Received: by 2002:a17:906:b85a:: with SMTP id ga26mr5587442ejb.366.1619200982412;
        Fri, 23 Apr 2021 11:03:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/7] oeqa/core/tests/test_data.py: use weston image instead of sato
Date: Fri, 23 Apr 2021 20:02:50 +0200
Message-Id: <20210423180254.706537-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423180254.706537-1-alex.kanavin@gmail.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
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
2.30.2

