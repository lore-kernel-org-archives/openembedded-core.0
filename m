Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29820.1793868239664088793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NCeMyoIo;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so967740f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868238; x=1794473038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkYnwNLKr5va74Ltn7l1jkk64XAHCFcmckLExj5iogc=;
        b=NCeMyoIo6/dWdhMBk3e7x1TBJpVXn2pLT0cGW47m5CYv3r7UzJi6vy3clp6sCiTrnK
         8taj5+wffywpkuQXOUE9jUWFHOOJ/C6BlxxLAwmimoO/QK8zI5sO6aYgruJ32ZgMJvsg
         7lzYrjMvqdIWkngAv2jpJGLsYZZ60s5bKhl+J+rL+DTnXnnPj+I19GgrzsdYeC8v4hIp
         6KWzqpd+xt0HHz1h86HrZ7xZEnq5n3Q3dRx/SYi1bFDOkgVf6o1ns5aLLFo5vS0nA4qh
         1yR50Sqtkxe9J/rYJY7PEQYWviehnxelZMnihqUKQc3S37WPcIpvqHFJGpcoGTdQao21
         RwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868238; x=1794473038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AkYnwNLKr5va74Ltn7l1jkk64XAHCFcmckLExj5iogc=;
        b=XuijkkpGlMQ+j5+CTbho4iVpHFxWdmtVKrJr5al9uhqBgmEn4P1N9ZhPqc+jDFWzQT
         r7ZvXl0yf4gvYfZ3LGog8hanHJzX1iGIrwGBeKKx5yHi8C4h6O/WUorq3wddCxpyZ7Fq
         +UpVzHezUF6j3wP4F39ZjotdZX7gfRLESYiRl//O8+PqwH5E2LjQ1IwRM3u9zRThTGqL
         y9LMC625yul0RNXhvwXHlVrWeveYBnycJC+UO+CEh0iQnwbbokMatkQK/4yeD74ZSvO8
         A8CYgWMAVJVeT6EGIMqh34md0qUwR1GLk2ZvDJgw5bFOhjZQD6mlheVmLwKe5vjl7BS/
         QmNg==
X-Gm-Message-State: APuU4Z/psz7zo/kb1nxV7+rOWlor8GeERHFLAsj5y2KZtw/lzUdJ9Luh
	P2N3E3NeObvz6xgeu/yXB9/Io1ZJ3lOHBmTIj6ihTC2V2ItDFy+IKzL4YzS2UK+U4LTzAoHxezB
	K5xRU1f8=
X-Gm-Gg: AYBFou26VYa/llC2bdGeTsn2mCHpRQRySaYUlB541XZ8czekCepU5rLiort7lxHa41J
	RnMlayNHrxAMgABTrvSJnNl7tWJGaxpmuWvfmdIYZpmrqFT66/UAdu14++T17trHZj7Z2aOCnlv
	Nq2e7UNFrNiI6sSr2S668lJKLJ7L3Ij6CearoEHIz4JXumjx0LnWhSIMIVBIwLE59agZIHT06cb
	EHwT7SpfopVsMMmocvstlVXFxXM1sveK1Octo+CSGokAEz/qaAbQPgKz7o8EFb9//alqOheWMO7
	v+0piIw6WGJgQgYvE4rCAmRodTcUr41nrHmXR3N5zjaP02q6THv8Xe3n/9k8KfuRKMVjR0W60YU
	6Syi4QHoA23fQ0/M0YeRcnuHK4mhPqX4tCdHeDa4pTmX0wccOontB412DuioCZLvXyf7156FavY
	CKFuzI+WGixFojt/bNTn3A9MWAL/UaCmaxjid+GU9tuKp7ya1L6rGDKawi6OG1MDASKasK7UsUN
	O6R67MlYwo6SRs1/UVRxbyDdg8DFrH2edlnwFbh9OsE1Drz+WPVnlpJ+YC+vwMWG0wsa5uLKsgW
	bK9uhXy8ozQST6S1sDONvVmEH+/wPYiNsj1vxyuRLcPHxl59WdLvbaQmI6zke9gf665VCuG88Qs
	v2auDyCucaD+LPSYfnPqBGQm62h5e
X-Received: by 2002:a05:6000:2c04:b0:48d:f7af:be35 with SMTP id ffacd0b85a97d-48e6e303f44mr41489518f8f.29.1793868237875;
        Thu, 05 Nov 2026 00:43:57 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 35/60] python3-sphinx: Add python3-compile to RDEPENDS
Date: Thu,  5 Nov 2026 09:42:54 +0100
Message-ID: <484eb22189c75de7bbd3bd179d6bf9d990683cc4.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249494
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

sphinx.util.osutil imports filecmp, which is packaged in python3-compile,
so importing sphinx fails on target:

  ModuleNotFoundError: No module named 'filecmp'

Seen in python3-breathe ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39524ad0feb8f0833f8d07f68ce509d89646f8d4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-sphinx_9.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index dcf769724f0..44ed739fc9f 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -18,6 +18,7 @@ do_install:append () {
 RDEPENDS:${PN} = "\
     python3-alabaster \
     python3-babel \
+    python3-compile \
     python3-docutils \
     python3-imagesize \
     python3-jinja2 \
