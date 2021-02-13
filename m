Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.5158.1613233066468807988
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 08:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CGXjoW69;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id r21so3301663wrr.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krljBXeVCWv/3CVau4vVHTeU7qYNNSf7KLCqKXEI4pA=;
        b=CGXjoW69TL6emv/ZRk9ALnMIQV8YrOvtnrbGbyd+ksZe0AQq8hUYaUPq5C6YDAvgxD
         GbVhk/fb5uG/QiYGtV2sfrC06EdAiHnUyHQj4fQ7w93VMUWVrTts10ueBKWxqmaiES8M
         MvEkyK/Rz9M+v9r49FcLl/IIqDURJdCiL2G1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krljBXeVCWv/3CVau4vVHTeU7qYNNSf7KLCqKXEI4pA=;
        b=qn+9TE6mtnGYC48lM5hTQnH7UdAn07GfZrWoWHYYAtz+MSKFKUr/z9FXaySGARXBy3
         zesF6597ZY7FjMToiYe+cqhzYooctVyw3Fy70cpdGJjlRG2EByacpFLSW0ma1tCFE+iO
         5ApxIKjJH01CpcJY6WBm9l38oG3jZ3rHIOTBS509z8d0jsTm7S3bQvCQZu1Kdo1NGmDB
         hpsgCq9lrE92rKdD782Iq9KN5B3KB8HIWpI1f9+d+lwIdP6/y6PBgWG02zGe4UN09HCX
         RPOB5ANR0haiikQ1/DHEUaHH8b/TMi1dUiOJXv/04WPSM4PNdSpeIG3gKyFBHMKiyJfv
         W1WQ==
X-Gm-Message-State: AOAM532puKKkXcarwCTVKylYLX9+TwnKMBd9/hrCZv8agkKm8VW9jMrH
	tMnQP03qYwjYBrDjnPt5007MCARYPWzF3Q==
X-Google-Smtp-Source: ABdhPJyVquFb/lx9rHNuoIbdS8bldbzNvil3A6gZvSykuIYkQ/A7ZTfKdGzMIMhiodNRZVgTwuKEWQ==
X-Received: by 2002:adf:e988:: with SMTP id h8mr8287819wrm.2.1613233064865;
        Sat, 13 Feb 2021 08:17:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:91a5:e7fd:31d5:331])
        by smtp.gmail.com with ESMTPSA id x15sm15705208wro.66.2021.02.13.08.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 08:17:44 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] selftest/reproducible: Sort the unused exclusion list
Date: Sat, 13 Feb 2021 16:17:42 +0000
Message-Id: <20210213161744.1938647-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes comparisions between lists easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ecd69b3577f..860c8c95886 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -133,7 +133,7 @@ class PackageCompareResults(object):
         return 'same=%i different=%i different_excluded=%i missing=%i total=%i\nunused_exclusions=%s' % (len(self.same), len(self.different), len(self.different_excluded), len(self.missing), len(self.total), self.unused_exclusions())
 
     def unused_exclusions(self):
-        return set(exclude_packages) - self.active_exclusions
+        return sorted(set(exclude_packages) - self.active_exclusions)
 
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
-- 
2.27.0

