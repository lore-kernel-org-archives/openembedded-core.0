Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.20725.1599740609962516260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VRRMLaV6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id y15so5608559wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RlOlwqccm7Vg838s7d2QT690Azh7vr/cpzwrz/SWYkQ=;
        b=VRRMLaV6AvDaCdheBIaNkznTJXRtbOyJlPq9VqVgnwIH0D/7OWnbo9kC4uCmjYvsbN
         cno7leVWOBmZCwfr9wdpT7XzzEt0daHVYQsfAPd8dUniwarJboa5XPf1nu0LN2M+8mEe
         0UDvzvXUWgmmRHXc9NI361S5WntxAfCcDsFhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RlOlwqccm7Vg838s7d2QT690Azh7vr/cpzwrz/SWYkQ=;
        b=pXv+YX8ukk8HYzAxyFKiLOOwKLkj2IIO7/nsib7ObKSMrX4g+vvSz7q6sGernmbT3e
         KeciPxjjBQ6UgrgoshGPR9HL/DpKvMcIJr7UkjXEJuugZVy1XpWkg660FqDdPbA3lVuH
         MoNEfBWghqb5YOBK++Lo2x0XYi9+/A/5shVSouoMQitR+1wDJIu6MXO/N95SeWhQ5i3f
         BAhdMQxzMnqFAAbhOZlKKFtyxt7oWtJGBzDIhsDdefXRY67o5HljyK0ruakyaFNuSO1I
         u9yCOUBw98GczQ5oVVV5Wjmo564bc3jKTjvlmvR8E1P0oQFoiqX5qBTlQv9SY3EmAPrl
         CW3A==
X-Gm-Message-State: AOAM532GyQmAyOJG1crAapZKY1LA00lqlYGqCpFDmqLw82FPQ1tx4DwO
	8yU9IKNqfHjACSxolVpekSFVnuHwEo9Rfg==
X-Google-Smtp-Source: ABdhPJzzYUlEx+Bwr1/5kxgtn4Y2jLD/reDA0GXYrJaaZ8go2mecbDitbTcrdQxHKBNxDTlAclHQPg==
X-Received: by 2002:a1c:cc0c:: with SMTP id h12mr7953840wmb.57.1599740608229;
        Thu, 10 Sep 2020 05:23:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 22/22] oeqa/runtime_test: Disable test_testimage_virgl_gtk
Date: Thu, 10 Sep 2020 13:23:06 +0100
Message-Id: <20200910122306.2040194-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test keeps failing on the autobuilder and is proving extremely
annoying. It works much better in later releases but for zeus and
earlier, lets just stop running it as it doesn't really tell us
anything useful at this point, nobody has any plans to improve
the distro exclusions or otherwise fix it in the older releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d817b755fed..5149583bd49 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -168,7 +168,7 @@ class TestImage(OESelftestTestCase):
         # remove the oeqa-feed-sign temporal directory
         shutil.rmtree(self.gpg_home, ignore_errors=True)
 
-    def test_testimage_virgl_gtk(self):
+    def disabled_test_testimage_virgl_gtk(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
         Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
-- 
2.25.1

