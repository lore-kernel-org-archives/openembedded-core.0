Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F64C02198
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 04:43:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.32823.1738816984232582415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 20:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPiKG9sM;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso2538155e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 20:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738816982; x=1739421782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45Meur1ERfQlaa2dQwRg2Mz2fwZvbqheeT+WAnAMVKg=;
        b=ZPiKG9sMTqDsjDkiyjZj0yXfsYJJSTUWtYc4ZnrmED6tM5okkRTg3Xqih/Rq2goH4m
         WONSEbs9kkXQdIbaAOi0+1sAdip5p+w9R8w2LuWM101rpM+m+TdYXh9h3Zzge1Wl2UQC
         tBZu4eeECeGQRaE6EOxSTqmzfcSP37eP5gd71whljhJXdpbjOg/QpwUHOt0xQiVv+mZm
         MEP5JyqEQ0k4sYjM1MH724l5Rg04QtW6DL7moq+fqQzzciYktVTtKCS+aue/N1J9gtsm
         ds6ks3KXxiMaxf9CzdOkx3Zgyqb/1oEfeYBiZhqs/gG9kNvyj/PAPjQqAztk46rEEAjF
         c9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738816982; x=1739421782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45Meur1ERfQlaa2dQwRg2Mz2fwZvbqheeT+WAnAMVKg=;
        b=YRChaT5cV6fTU8JEv/Zc1S26wVwEo8+ht2hH7ooIZv7cGDnaI1vTjiP5gvdMPFKbWu
         PdQ/KJbQ6eLrprcEiqudisr9UAEwtP7uTC5n4rTaQIJuC0FBgbDrr531Tm1J1bUJ5oCS
         JrF4d6hTp/DA6Bw1vDDyjV2ieKCsuQsEglNVUUXK2Onv9j+F08uNQimcCyn4kRcukstp
         dXpksq3z1ZlwX0iVq7sDK/XqBw0OVYZ2mPhXbRB0xAIPmShTw05ePPJHtjhoUEtlplE7
         e+1l7UW4XKqYvVyw4Xwdnhnr74He728IDCxxL9GqiFFUOaTm/HidyA23Ub55YLUq+Wt9
         Md7Q==
X-Gm-Message-State: AOJu0Yx1Uuibn6LN9ZWHN0TfeODYQMuPiaJtAjqWtg1Jlucri7Gln3uZ
	6S+HpS4IKX9wUDzPfYcuEJVpWTaPs2bMhofS2yjes8/slfFfnpHP3wvPMQ==
X-Gm-Gg: ASbGncvQOBbHAiQJYhgJKpIYLcr3tFGd4qgv5M971zb17btp3j7FLf8U1crUhX+5+6T
	Mh2SW4P5MbfNH5I3BcyuFAD21P1IRd/VelkggE3aD0BFdAyfbZwTuxfxQRb7A4m20byQECIULOL
	7WrlwSmisWlhJDYGuawa36QHpddDbGaP6tX4Xc/lpOFQnxesJexkdgSSzl2YLy9BYguQ1XDkz5t
	nAnwN/0mjZvqeaC1nE/H8CaYlPMHVrMVHXDVputISPAl0AWhLBtYpb7ydvp8ffqD+knAEKhDoje
	an/uHxdY/Eh/YN75lyVTYdZDtix++5Efw4kXlXKKjLJ+iA==
X-Google-Smtp-Source: AGHT+IF2FW1esafT75px1M24daBfciSvOtVTUEG21hQOQ56odeL2d9w5xxzbgthdieg963W+hUr1SA==
X-Received: by 2002:a05:600c:1897:b0:434:a315:19c with SMTP id 5b1f17b1804b1-4390ef68f6amr37821105e9.3.1738816982246;
        Wed, 05 Feb 2025 20:43:02 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm5819695e9.16.2025.02.05.20.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 20:43:01 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v7 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Thu,  6 Feb 2025 05:42:50 +0100
Message-ID: <20250206044250.3311711-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206044250.3311711-1-zboszor@gmail.com>
References: <20250206044250.3311711-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210893

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


