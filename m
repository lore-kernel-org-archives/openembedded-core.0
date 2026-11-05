Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30054.1793868221475379332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=muW0gKWx;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so15676325e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868220; x=1794473020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wa5GrWeNTSNILoP6m+ZbLqiKJtv2hcXtS6u/IHCp6W0=;
        b=muW0gKWxsFga4deUN6U6zfL/I5whj+5jE7vvBYaM+rvlWYCYJJwCzhQBUGpFEwhPJC
         3Rtit6lSNRPzktAsE5HtJJupMKKCsrr5jhLPy6I+32NMUmePogHM0gM/5PSP22yxSdIS
         Q5iOuCYJnuqZ/iq+oefwyk1J4fVN5Hzk61J3Vv1rWk1OU7q2c0QueeD/OF2rLHh2k4ZJ
         anzVVuEJDAcVRWzGUTBsvPBoWFh35tdgY93FLXzoFzpopSLAtzVk6JBHH0i4DazjN8Ze
         wl764ct0yWJG/f1og9IPmzhUJZQ6Uvh2MgN+prOXeb8LG04k4Qc7tRFHtnAtee6Ax7yP
         w7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868220; x=1794473020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wa5GrWeNTSNILoP6m+ZbLqiKJtv2hcXtS6u/IHCp6W0=;
        b=JAL5RAA3RxqpFdCVwGDpiKzXvVCHukhRKexOZJxOvR3ka/LLsZ0/5r7BOMx0orOjwj
         sbUKzbhjRxDNOr5mt9i6VY0Rua5qX3agtpXZyDS/LckHk8kyWPDtNEf0+CbHAP8u/2Q0
         9biFqT8+mY5pRLaYCYTe9ZHs8xEJeRdPUI2zTOoLf30/UhU4y3MTiiG9yjPBmYNn12N1
         pQz/YonlUliejJpebSYw5tQD0kTNkHi8VgaU9sc2q/oyNmp6astenraLP+fAqzPrzBRL
         QkEeFGJjRRfPxd5uhX15Xs0wG2s5Eaizr6mDi0KLI8WxZPu+J3Hhs7ZJyDdgDSVRNrqJ
         R4/w==
X-Gm-Message-State: APuU4Z/ZDRjGCAZmK+0tkDjHOrENC1GfjVCWYj2GJyIqSil0mQeob1Po
	y3sAEGNKAi7q7nWM2FAt846ls5AEOFdWaKH8DA1oP3r+DAW+PbTBzmvg8CjHkkSpW6iB6qSBUYI
	+A2Bxius=
X-Gm-Gg: AYBFou0KhtFlUCrCeZY7XGPND/qmkqvnxdmHE1uJueGjaDgPlclG7A2fF299oVTHuPf
	NuqLJObviKR9aPsnF4EIG8HNEv5dXo60YSWb1Rs9d/d5hOSI+ZjSxNOb1FIq4t+pdmzc/p3P1Cd
	32Qfry6BuU+UvHBrFlUi+LJe4TJEP+6/LjLT7KTIP9Inekkbnz2T345cBM1ciFVYmEqzV7VggQu
	C+lzGEsqNJRaCgfQ9AkEyyXHcFqugdonqjdjK73WDJrHAYT0IzWSLd+jSz5ER6/Ajy4DevDSqZP
	53Ig7UEo1F69drwTzz6CSM2hfJjKRghihwNn/kzeH2xJC4FU/Wb+uSqeKPfwJKXlEBN9YGRH0n1
	lU1dHj/10K+IX8w5jx5cHooJ0vcVFmmvIJOPEK5e+M6mgzUKv6PsJdEvdQSk66ZHG4htmMdkDSq
	2G+FiSh4nF5ae5fHvqvo28tgMD3kO41o8FQd/0nRZMKGweBwmGBJtN5Nkmuv19fTzrw0YDefi8a
	AJinsrPPgoG5cWsHoiXQjijtR74KKb8jsgj6C4UJ8eKguCgQgwS2bNqPBSSMaEwLouQp3EbZr44
	UK6VxRvbWsCX9eXO7f4CzsDnMhTB8TNNVWUcCx1Ie8sIkLdG2uo/HwXdKHWqpg3uYDg3CM5TI/K
	tTCsquRYH9YDVbf9g68Q/YsaMpL5D
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr407204285e9.26.1793868219700;
        Thu, 05 Nov 2026 00:43:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 06/60] python3-pip: upgrade 26.2.1 -> 26.2.2
Date: Thu,  5 Nov 2026 09:42:25 +0100
Message-ID: <38699b6b7a5e2f53aa5350fd8378c7cf8c0e14a1.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249465
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Just one change, upgrading the vendorered certifi to 2026.10.19, removing
the compromised eMudhra intermediate certificates[1].

[1] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit d0a56494bf6617ce797c1b71a6aee6ce9ab4703e)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-pip/no_shebang_mangling.patch          | 8 ++++----
 .../{python3-pip_26.2.1.bb => python3-pip_26.2.2.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.2.1.bb => python3-pip_26.2.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index e8b2982b2ab..f388928230e 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
+From ea75b7fc017f7a1a3a47e9e2bef21209f0f36a04 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index 195dc3f..a0e0d61 100644
+index ac9e909..1faa5b6 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -155,6 +155,8 @@ class ScriptMaker(object):
+@@ -157,6 +157,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -25,7 +25,7 @@ index 195dc3f..a0e0d61 100644
          if os.name != 'posix':
              simple_shebang = True
          elif getattr(sys, "cross_compiling", False):
-@@ -363,7 +365,7 @@ class ScriptMaker(object):
+@@ -367,7 +369,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.2.1.bb b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.2.bb
index 7f041f822e3..c83c9e4468d 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f"
+SRC_URI[sha256sum] = "3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f"
 
 CVE_PRODUCT = "pypa:pip"
 
