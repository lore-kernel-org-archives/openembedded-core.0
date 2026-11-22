Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36991.1795367991206715354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=m1HW0WHC;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: ketanmundhe01@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so521416eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795367991; x=1795972791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aByBO9gPzZp8MOBNKnjQSwZGSuXUZL6I+RcZbgorF30=;
        b=m1HW0WHCQOgi1nSsxPvfy9LbErC2x9B8eHh0zrC/yyO2DnLlffsQLM/AU837kN1bHB
         0RomtQY3RH9jV96MnXVR/pVFMmIglSNJgoDUvDHB2NLGhQY0WujsZbkzMlQT3+DviZyL
         2wP5I3XFhtujAtBXjEHsKjDWWchpB5G2f2Vgj0C5G8Z2fdcUXU/Y7qwX5cM8BBeOXxtm
         crBOleneNIUBHzh6TyByp+NtxvFI0fURP1johQqqqfkhBEYxkjIWsqHvWMwyXNIeYXwx
         IIwR5JOxAWp0gAOhEd6f9D1yq6uCw+Aj6uKLhfm9QVuNGQgYJ3nckDq/YWSs4dtJQqk4
         N+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367991; x=1795972791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aByBO9gPzZp8MOBNKnjQSwZGSuXUZL6I+RcZbgorF30=;
        b=prfneTnxh5oh0sxOTlHq+ojfjU8HvCUSqpXQ17PgQC20B1eNaK9IRHuJ70iBIfLjsI
         TY4WtXDBPkdUO/rU9MpjqHHxM5whWQrTr3kABTJ3bT+tLaX8xqqIeP6B9xkRu/LO76N+
         m7MjTyu6wZVEDH1v4m7wOFk+v089XA0IhzZP1eaboYXPGcj9VqgouHWZdFqLJZk1cBxl
         mTUv4Xri8NNutVdaYdAiupi1HqgCwp9awjhMXNhe8clB7mx/opd/0rli3sxf3IHTIdSR
         EMumBMkhHEgcsL5dVSyjp6RBcqoI6kItdEuBy/0rsfjKgYj8d9RothblDSN1P6zsekYO
         qomw==
X-Gm-Message-State: APuU4Z+YR7XHrIn81uIkiY8GJkEybxN16idMfJ13kZYHVn2DzvAH2/lN
	1oXp5+48KZ9UJCWtb3f/iLS0ILNVkX+rKFW5PyAZu920tp3lurfwOtYOHZvn8/ng
X-Gm-Gg: AZFdTZeRC5zw/S3eM0Dmbg6Hqag+DV7gNbOn4PdshIk5R7Ca3XO89asG5tVeWl2Z/Dk
	1ptoNWAwZSAE+p9bQsoSnIHRywPA44ww6VM4xzkMnntEYTu6l51NLgdLcBdgD/wq/azsZEuWh4Y
	VTkBDVVmkOy1DTS0pT6SPGbJHSgqsw60v+597ipFoy2uu7Ub5QkkfKU9RKGe3dvo02WmtRYRMGp
	nVduZqJHGsd2uyFCS8mD/ZdSexC0P13E847QVdZY0J0ScQrMp9lZ9cORvQazqB63qcOtcdqL68Z
	xyLz1Bc2gf0ydGCHoveuQYmdhqG3Ooin+hfHpDgLNSduilyVpvfXoWAZaxgCsmmzIatvFLrvLP4
	VlGkNuyNROlJkVO83OZmWD4GFuNwvMQXNTjWhZu/XvgIqTGvt5UgoWKdcuqQY4xz7tY35rDVOO0
	ZKsUSAwJXVGh+1m98qzK/xDIBd3WVOiBd4TZFoTiTSFlEJ9t2iKdf89LkzkB7dLgw3TEfOqgrYe
	tbdZS+7HTFwXWJeOGI4azVuZyPSbKL4yys/mlcbVwjeySEMJYUjKKgRH+qU10ULi7n34JY1+1Xb
	QSt7BUZOAllgCXCoYDrUuu9adWkRN9aAbejgnkIaUL8ymI69x7T+6rBhyV6XTtJSSdXtF/o3FvB
	v7K3n4zWxeIxs+UrqtgyrxOrTveK0iYKg/9o=
X-Received: by 2002:a05:693c:88d8:b0:386:954f:7c18 with SMTP id 5a478bee46e88-386954f7cf0mr7001747eec.31.1795367990487;
        Sun, 22 Nov 2026 09:19:50 -0800 (PST)
Return-Path: <ketanmundhe01@gmail.com>
Received: from LAPTOP-AG1DMAP4.localdomain ([152.58.32.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm32075687eec.26.2026.11.22.09.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:19:49 -0800 (PST)
From: ketanmundhe01@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ketan Mundhe <ketanmundhe01@gmail.com>
Subject: [PATCH] libpcre: fix spelling mistake
Date: Sun, 22 Nov 2026 22:49:24 +0530
Message-Id: <20261122171924.993-1-ketanmundhe01@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 17:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250870
Content-Type: text/plain; charset="utf-8"

From: Ketan Mundhe <ketanmundhe01@gmail.com>

Signed-off-by: Ketan Mundhe <ketanmundhe01@gmail.com>
---
 meta/recipes-support/libpcre/libpcre2_10.49.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.49.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
index 8e0c44fb4c..d39a06880f 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.49.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -48,8 +48,8 @@ PACKAGES =+ "libpcre2-16 libpcre2-32 pcre2grep pcre2grep-doc pcre2test pcre2test
 
 SUMMARY:pcre2grep = "grep utility that uses perl 5 compatible regexes"
 SUMMARY:pcre2grep-doc = "grep utility that uses perl 5 compatible regexes - docs"
-SUMMARY:pcre2test = "program for testing Perl-comatible regular expressions"
-SUMMARY:pcre2test-doc = "program for testing Perl-comatible regular expressions - docs"
+SUMMARY:pcre2test = "program for testing Perl-compatible regular expressions"
+SUMMARY:pcre2test-doc = "program for testing Perl-compatible regular expressions - docs"
 
 FILES:libpcre2-16 = "${libdir}/libpcre2-16.so.*"
 FILES:libpcre2-32 = "${libdir}/libpcre2-32.so.*"
