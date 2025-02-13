Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3034FC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:23:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13581.1739460214091714568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XreAKl3p;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso11659635e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460212; x=1740065012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=XreAKl3phBZ7q10LwvULh5fy1rlHcwf+umt1oHW6MbOBs+f0AjXiWPCS/OGXyyHA1y
         5Dnd0SJxVL5IldurWv0vxuigj7RBqOmqR/MXVE6XwWEX5uXqBXzLK0sPDJGiS1RYDiYP
         BVNQc+iypI1r6n9/+7BJe5Ey2BGL/lypL8i0ZE2Qo2RWb7gvxGNxaayM8YI9HcUI1/yp
         4zTyklOedgOKshUHLTWP4nVb1SfJvgAuoM0cwX2Ufz6NIEC2Ov2545wV6io+hK/Z1+i6
         146DZYVCksZ0Xpeu0CPzkAZEkZfJLWicgz5l/Mjj+RKLoP+oisfq/QHju2Z4FZ/ukv6x
         ApOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460212; x=1740065012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=fUdElXlO392oCpN3ZoE/rQoN7VJklKn+SL7Dnl7TcMYpLprVvnmnO67ZmHDalsIlbR
         nbK1PlliJqnPXc4go3iUnBBhWSVZk6ut2d6S5ASX0iBkEans6NwSJ7IO/T/o0eV2NLsn
         RF/aRGNj0g0Y2IoDGqcbC2CMGKkL/rsa7hZDUmXB9fP4I5wxCKnYG/1AlBVh+CS4ZBod
         9uc7uexureASvuaVqjUC/lHGxueuXZshXaVhM77OWPyVWmGoejPeJR164xCSek8HTOzW
         vOgGvOBapLO+i/5wFWP7PgV0iMQl70uew8A1Jsem4ij9oviajmkAoFDPrx6ke/EGN9M5
         yF0g==
X-Gm-Message-State: AOJu0YxqPvtHJaOfIJGzZGGTpbB21YHsJnh6nm7allWISO3wR1xzH1/4
	91xFAIXdfAv8N5Ijqh+PZTHUHQIyKEO35VjQkBYxlFl38LdNua08Dl2vtQ==
X-Gm-Gg: ASbGncvr71TGDbJurOueVnemdTv7AV4eI2TnQWpC9CYbZMPeXWBpa05c5UDXnCxYeEQ
	AJru6UH4UySYACnnu2sTod/EKfKClyziUChCKgErQssl7Yw49P4al6jrwSJyKIxTPDFLI+w47TG
	qhV+sIZ9P+g8KRnFIWKCMe1exHXE/XRV2fvAS7raY68v0QlqD8OozFFJMEmuxdoaO39YPkHGCu+
	bu3lyz9f/12Rmb0mRC7krUwe7Z+tUqAjE3YduiWnilyrmKvPwLzWO3UNwJW2dYQiPXAu4pWO1SW
	vxsGxhptTvQtEvb1riEb6al3yFv7rzqpjBcLxWJtd1Jm3w==
X-Google-Smtp-Source: AGHT+IErkGMESkpPq7a2yPmjE3Bb5yPo7+160Imq4V8g7Nbkj/CKZRD55zY9OGTgt6IIdmqMrA/kcA==
X-Received: by 2002:a05:600c:1ca0:b0:439:4c24:6de8 with SMTP id 5b1f17b1804b1-439601cfee4mr47456125e9.31.1739460211930;
        Thu, 13 Feb 2025 07:23:31 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm2223564f8f.16.2025.02.13.07.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:23:31 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12.1 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Thu, 13 Feb 2025 16:23:24 +0100
Message-ID: <20250213152324.4016755-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213152324.4016755-1-zboszor@gmail.com>
References: <20250213152324.4016755-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211354

With all the pieces in place, the self test can be re-enabled.

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


