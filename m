Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691D1103A9AF
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20274.1774438290385491127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T5Bds6L+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb439299so53885875e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438288; x=1775043088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLxT3f7MEriQOVxHKaVzgOWk/MhPYVjRaB82Y3rNepU=;
        b=T5Bds6L+udF7WAsBgNLVnQY6olWihsv5S9ZOrCpN2VFaLeizhuKX1upls79K1bKk7p
         mayQ6aMlKxDuIsTimpiVS9m02ya4j+B/DXgTJEzCXurFqqD1kWW/YJ1i5hD+siuXfJKg
         TOQg3sfYKrnvMHkQsYadGJqmHmXlyjvB/RN8ZfhWI3dS3XHt6FMa/OzCMSe5r1vRLqLl
         aWYfHoep64gMuNqqdVQw74S0tTguuRcaDvASU7ofE5fnpIe8QWNAJzW+zjtNGFiZw2ri
         ZCRIg3JcEP5XfYdbUUn7Vi/F1mOltKiwoS+IzeUWpBeCkHrziQ8XL/oS9deqdQlRgHTA
         JkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438288; x=1775043088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLxT3f7MEriQOVxHKaVzgOWk/MhPYVjRaB82Y3rNepU=;
        b=s43Hm3tI6ReT+Ax34D5zgbBIcNl4Bj0mjfpJ80fLs+W55vdmN2DqWTUPI7Rc0us6ta
         g/GV4aUK3umu/98bHrlps+tsZBTmbRol2CVCAbb0b2FIR/Q04S3EqMdnBP85zQVXo40E
         jRGTJiluHAHDVN218BWZARyqnfIC9lsYct4vuWhYPchyHSzn5p25YpdrUMpuDtCCME4b
         eSTZ6nWoc23Q/YPXeG7v1n6IDQv2q6WJq8UVK67BKp/6JKwqfpw2RWWFXdie/xxzHMAJ
         yhf3KCRg4AF8Edf/nEfrBbGa58ITjhy9BM9Le97d+rsqXjrVO/qNE4bajtnZXkY0cc4w
         QeNA==
X-Gm-Message-State: AOJu0YzDHDhWAKyaXOcnKGBfh34hyPvNQHfLi65Ji4pEVlFsqiA4XOrj
	FD0TM4Z+o/JGo8P5Y1KR/qpFXoLkvs1QUYM3sooej4oAdHZwxc/K5G+OPzgkFw==
X-Gm-Gg: ATEYQzzoDL8/MfjtNFNWGN5ZHuYQAuex7TwBAIOQaK86Zj8YxVWD44AziOZZziZXMrK
	dXPHpuD63uMRy5660fipEHdhtfCU+Y9U8r2nb9GONw3v+AssTXirR+AwT66+CE1A85EdMkUqiO0
	oUWldT9LBSjWPa76GdmJCxWsYi5yiQWGjQYqi4k/3ExDkHff+Ho9nCHJpIjT1ljMP0AfqoDuXUa
	7oKyEY3VI+btdJbF55QIv9nyI34Ae59kmFbzkEg9sia02y5A0rKEBrZh3nOkPxOQR2gAPXdU2ln
	O1FaMZF/hI0KvwwgB+2ML80Sj9fNmySRY09MACBauqblg/7jNjN+42+xEJpELR+EZY8v0T8TEuI
	iqvQvJcxHB+KiG17JJ7zb9z8NqI8pJIPcKezdo44Q0iuXiL/R0WM2OwvCNlfpM8gO+NQoAs3+sW
	WZ54fxq9UerWtgzw==
X-Received: by 2002:a05:600c:5296:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-4871606730amr45719215e9.28.1774438288236;
        Wed, 25 Mar 2026 04:31:28 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:26 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 01/14] python3-dir.bbclass: Support python freethreading
Date: Wed, 25 Mar 2026 12:24:11 +0100
Message-ID: <20260325113112.1163632-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233875

With a new DISTRO_FEATURE ("python_freethreading"), set PYTHON_ABI.

Added a new variable called PYTHON_MAINVERSION which is a
combination of PYTHON_BASEVERSION and PYTHON_ABI.

Set PYTHON_DIR so it also contains the ABI. Python build helper
classes use this variable, so it's important to set it correctly.

Support different settings for target and native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3-dir.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 3eb0dea9b2..2b81b776cb 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -5,7 +5,12 @@
 #
 
 PYTHON_BASEVERSION = "3.14"
-PYTHON_ABI = ""
-PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_ABI = "${@bb.utils.contains('DISTRO_FEATURES', 'python_freethreading', 't', '', d)}"
+PYTHON_ABI_NATIVE = "${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'python_freethreading', 't', '', d)}"
+PYTHON_MAINVERSION = "${PYTHON_BASEVERSION}${PYTHON_ABI}"
+PYTHON_MAINVERSION_NATIVE = "${PYTHON_BASEVERSION}${PYTHON_ABI_NATIVE}"
+PYTHON_DIR = "python${PYTHON_MAINVERSION}"
+PYTHON_DIR_NATIVE = "python${PYTHON_MAINVERSION_NATIVE}"
 PYTHON_PN = "python3"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
+PYTHON_SITEPACKAGES_DIR_NATIVE = "${libdir}/${PYTHON_DIR_NATIVE}/site-packages"
-- 
2.53.0


