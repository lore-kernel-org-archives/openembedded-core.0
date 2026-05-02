Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBABCD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9469.1777739379717645619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gJ/fePgE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so44680675e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739378; x=1778344178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbOakkpH4ouB1rMTWTdTzthJQ8joPll03ffN5k5VXwI=;
        b=gJ/fePgEezWk6dwNfW2CMhVqyuKrO3CrE/2LM4BilWpwtn9Hpks3B3H5F1jtdR8iMo
         zTUDqvClps6rtfYdVBsAE5ZfK0x1PCT7iJvs7cunUfcaiJjdW7Ve+1P3TUMsnfDWk/Fx
         muLHEmbJ+Ml4Ole/7Jx5duOrbYTxGrxf0khAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739378; x=1778344178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TbOakkpH4ouB1rMTWTdTzthJQ8joPll03ffN5k5VXwI=;
        b=ENjsfTt/fF1LO3TsxHFqOtwn6EJ7/24JaGnAbCVm72MFB7KhUzFxVsGDqj4Ahl+AXk
         H5+450MxDu6oBT7G4EsmD6DHoSb0wEsTubHTuEsCyy+EWe/yqWA0eFmo4H0peTQSL/di
         w/MfgUdptpIO5rPcunxcExECgMrZQZ6c3dwiYSW0WRuEFiNt/rFgEMCKRIcG+QmWIglp
         gnM8HCcplZJkGKOGLpdIL6r0sXcMivpdm6f7roLzhfk4USSr+jVGs+/VKAVLgX+9LJHy
         aB0a68cDRMIw+KVZgB6T1IpOHLmOXNhmZjpQFV7FJFeJH4E+R2vJgp17wVLEoyUuqMZO
         u+Pw==
X-Gm-Message-State: AOJu0YwCAwdmcJJ1Aok13IqcsYLNCulhHkl85Y90qI/yHzpsUT5DEMqV
	BBvWma2wWwQYVMimPj7r7J0JmwPoFg6fU+Fs5ojySU9dWnDfenZHDIYsOd/iVzpRSSkgkU0wPuL
	e62OIYquM6xYBtxCLpSKNtgUvez+f/CEhNQ+wpE3aBMlGyL5T0FS+GbnwSnAkiu8XAZtCclzwTs
	u/IRhBpf+ImqQqFzo=
X-Gm-Gg: AeBDievUgGbx0PFYBpUMfVUGcF2CTsCMfxzsPrr4JZrajZPsuKgMCuWeXsgv/iLoPoB
	H9rowtGtaRdqxANvYoNuv+XwwQ/M7xU2FESSQmxUXB6KhoSGJCGkdY2Ox88nDMRIAiO6eedftAu
	SOlzjG30B5dquK7xwhdK81SZ3E8nXNyWFrQJ3KIS8Lvgu1syhFWk4vpRQL4QUIZEL6ThkayTei6
	DXJ3qdXFTt7uN3bHZQhTKmFt/J5gvTp/iI3PyhhHv/Qjo2l6WhmZ8yuCYcdM8WDfHSNj7lBvlBb
	eu0kTFHlJDaGUzYTrOn8DGGXTTYCrl3X3HXBmCe8DkxtwDQEzH5aM0ZovH4MfTBCl4cDyIAdwv9
	oBNy2AQUAvJtm0EhjFzWZpjNJ6TuPerj/5eZXOOy/RKd+a0dYz0yto/SuDglQgd1/GTgUyo8jb1
	Eq0r+ExCws7BQypAdaM31JqaLctiwjPWiZY4lbbDdJgKXYB0TebmWPPIGPavJ+EiMF8swkrzp7V
	w==
X-Received: by 2002:a05:600c:c0c2:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-48a9866b9c6mr39326215e9.23.1777739377625;
        Sat, 02 May 2026 09:29:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/62] coreutils: upgrade 9.10 -> 9.11
Date: Sat,  2 May 2026 17:28:24 +0100
Message-ID: <20260502162929.1377831-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236313

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../coreutils/coreutils/remove-usr-local-lib-from-m4.patch    | 4 ++--
 .../coreutils/{coreutils_9.10.bb => coreutils_9.11.bb}        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_9.10.bb => coreutils_9.11.bb} (99%)

diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
index 718de0ab78c..b5d788161a0 100644
--- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
@@ -1,4 +1,4 @@
-From f53ffb5b27ab7d4a4c62df00ebd6a1a6936d1709 Mon Sep 17 00:00:00 2001
+From 91c377bc35037aaa087b9db8cd2e4c5cefe8f2d7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Aug 2011 14:12:30 -0700
 Subject: [PATCH] coreutils: Fix build on uclibc
@@ -17,7 +17,7 @@ Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
  1 file changed, 12 deletions(-)
 
 diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
-index 9d0236f..68f7c52 100644
+index dc22616..39561dd 100644
 --- a/m4/getloadavg.m4
 +++ b/m4/getloadavg.m4
 @@ -46,18 +46,6 @@ if test $ac_cv_func_getloadavg != yes; then
diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-core/coreutils/coreutils_9.11.bb
similarity index 99%
rename from meta/recipes-core/coreutils/coreutils_9.10.bb
rename to meta/recipes-core/coreutils/coreutils_9.11.bb
index ad4639b5ed9..ea2d237c3d2 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.11.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25"
+SRC_URI[sha256sum] = "394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135a49521d57c3cc3"
 
 CVE_PRODUCT = "gnu:coreutils"
 

