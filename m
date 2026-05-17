Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBF3CD4F21
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 13:33:07 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23596.1779024786491475181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 06:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lV9xJh4c;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: joaohf@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8c94a3e3568so2659796d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779024785; x=1779629585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiwfkgvFxignwCC1ADuJjubCExNfVIHnUpq3q3u13Sk=;
        b=lV9xJh4cBA+UqNqiKxmbdPlT5zXyKsCFqamkWw1uMWEsN1Bt7zDzYRKf1YdzP8wyud
         dpz7Ka4U9kq6qwsX9WiSkr45V5bA0oNYiSLKrReYBEAQThiuulZH+I3I/eLy82BPF/xI
         RQG8I0gxq/aFKWMQyC8YEV6V7kXXLZSAjVgL70rTQs2yj59+Xn1BGG7XHuEk3AZnsMB9
         vjIyVS/cdjBryk9tTwjuKraPKAeJuu8vyFSQEH0ZdYLTjsGz5XQ4n4q6NlkFskKZqizt
         XDMKN8crGib75tbGBZiVVoTF49HkTnuE+LKJk0YFgNOG91u3+xmFwvSvJX6UYfR7x7rA
         D7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779024785; x=1779629585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiwfkgvFxignwCC1ADuJjubCExNfVIHnUpq3q3u13Sk=;
        b=rA3GlQRgcWOhdUSs+Sbpq4cT9yn9BUwjqqTLpAlDCwEHzO5EY3dQg/DybMbIpByA3k
         XY02K0ZCVacP/tZjai8t0EGpgqRhcnz2I3FbJltAwnFCcZ+uv7idT+nJGS5yxMwO8Zq9
         i0UevSdknwb0knz1EbB/gcrlikS22GLPROVFYu8XvTpAB3wFX2MHQkGYYEQ0+eVnYOrK
         U3W2wlKfI89Bid9mDHmWfhuo2Kjl/xNkE1XM7ECNXgJ2hYAh+HdCG5j7uixOIgb4FBX3
         Onr4p1Jl3ZidXV3egNcI98WsDrmyUmLKEvel4ZlDt2zLQBZ4I3aN3XehVRCvCtJHAcyp
         aRWw==
X-Gm-Message-State: AOJu0Yx2gPh9+OBciOSVCzcUHloWI8RUSftPzqyo08TGuq46VUjgLAGc
	umqNjrtxFsTwBuDg6bXb1rrLyctjTCAEg1TMjf8N0Wp4XFv3N0rxzY725rg01Q==
X-Gm-Gg: Acq92OHyKqxWuO/SCofn926RVXuCyCHZg/t7X7vG539SfLRz02C1f9YNXWdbqhrAMTb
	5jdZRU0HN0gl+wPxhz68G+mm2hPPznqg+zjAy4CRb7NhzXC0Kw+lE0wEGfOLoM+N7Vjg5NhjU7Q
	gs9bncUpiMgTOlk6l6kR+LWKAhSGhbngfBHP2TBwHh9Af8EUeXS7GATainb8tPBdtM3cw57q+2a
	sUD+Mje/fgDajeGItIVMMS/03ots/rdbFZwrTgOpH4oLWt2ZebKRgsUuGhjrhB6vjggKUvDji8a
	Ji1et2Wt7TAOMS91wZbbzj4M/xDqff3XWj1nHVkVAvsb3w1TVKta64F5VnLWyzGcZeKlHTzeXq9
	Q0dSWpspIG7b/DOOgvZ81KnKki5rvGG8FokYDEOFLUXMlfGTbV+vwhSTnqoAzRl4x+cHuhCDMVO
	1P/cx+sHcmwZx+CtMram4J
X-Received: by 2002:a05:620a:1997:b0:902:daaf:22cd with SMTP id af79cd13be357-911cae16edemr1150191585a.0.1779024785488;
        Sun, 17 May 2026 06:33:05 -0700 (PDT)
Received: from porco.local ([179.110.123.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae24879sm1248696185a.18.2026.05.17.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:33:05 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [PATCH 1/1] python3targetconfig: export native python paths
Date: Sun, 17 May 2026 10:32:41 -0300
Message-ID: <20260517133241.2972125-2-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517133241.2972125-1-joaohf@gmail.com>
References: <20260517133241.2972125-1-joaohf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 13:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237189

When building nativesdk recipes, python variables should use
native paths instead of target ones.

Exporting native paths fixes the following build error:

--
| ../sources/at-spi2-core-2.60.0/meson.build:200:17: ERROR: <PythonExternalProgram 'python3' -> ['/build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/recipe-sysroot-native/
usr/bin/python3-native/python3']> is not a valid python or it is missing distutils
|
| A full log can be found at /build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/build/meson-logs/meson-log.txt
|
| Last 10 lines of meson-log.txt:
|   File "/build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1335, in _find_and_load_unlocked
| ModuleNotFoundError: No module named '_sysconfigdata'
|
|
| ../sources/at-spi2-core-2.60.0/meson.build:200:17: ERROR: <PythonExternalProgram 'python3' -> ['/build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/recipe-sysroot-native/
usr/bin/python3-native/python3']> is not a valid python or it is missing distutils
|
| ERROR: meson setup failed
| WARNING: exit code 1 from a shell command.
--

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 2877665737..b7dc90b844 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -17,6 +17,13 @@ setup_target_config() {
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
 
+setup_nativesdk_config() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export _PYTHON_SYSCONFIGDATA_PATH="${STAGING_LIBDIR_NATIVE}/python-sysconfigdata"
+        export _PYTHON_PROJECT_BASE="${B}"
+        export PYTHONPATH=${STAGING_LIBDIR_NATIVE}/python-sysconfigdata:$PYTHONPATH
+}
+
 do_configure:prepend:class-target() {
         setup_target_config
 }
@@ -30,13 +37,13 @@ do_install:prepend:class-target() {
 }
 
 do_configure:prepend:class-nativesdk() {
-        setup_target_config
+        setup_nativesdk_config
 }
 
 do_compile:prepend:class-nativesdk() {
-        setup_target_config
+        setup_nativesdk_config
 }
 
 do_install:prepend:class-nativesdk() {
-        setup_target_config
+        setup_nativesdk_config
 }

