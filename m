Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id AAA7178DE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:34 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id w10-v6so1383786pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PS1g9GPa4HSLie6iMM5FcZuQF9ox0d0sLaCJltM4uq4=;
	b=Xm1Gv1pGKEHdaUkTEQAs1CeHjk21/A7xcZlnIdaRINZ+0y9s18sR99bV6ukmdm1k30
	A3Xlu2i0kAcjZ9OkftmfUQnhECQbTjDgATQLO+v8VxuVpSLIwB6KGw+KwBGbVbwzwDf0
	f3Pp4L3VttjnJrUGhns8nGonUkHdDxAisZIq0WhILJ/jGIcV9L1EZ84O68BuvveuVp7n
	Fp4iIJXEIa2xQ78LFtQ3PWzbVc+8CoKx/F66Um5zgV7aAMc/ABuS2lE8xq98YD54plSn
	DWvQ7mQo0F/OPhxyPMv6goJnvs/mUFp75obDw/yba69ITugtKrIcbrJIKwW5jBRkJpz1
	tErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PS1g9GPa4HSLie6iMM5FcZuQF9ox0d0sLaCJltM4uq4=;
	b=uHsh0iPm4mruhkxsoqIMLTdRiOcXo6xnxrNlVyLNSH0DSdK/ucgj85HwuU1OvtfsNc
	kApGzTYqvENP9Tq5jNB5mI+mnNEBU6raL+NK9FXsMQPQJUYyySwgYYBzbFyvXJIjulW7
	Xrsq6e7GQdFMy94TlsTXswPupI+YVWwZ7+SPVMZIGDhAaHWGENRibGo97wnp+b/FAWlc
	1rNBLbArsZNxAE3K5KxB/DCRAkFMmDOvPXz0WnHFC0UdzfvRNWQDXXlQmNnLIZRpw/Q3
	ho67D74gjgl9HxEGRP6CPWdWy/Lo1No0ZaGE2f69fqq3ONTrp5iLMbit9ip3ygwiJ3qX
	WqrQ==
X-Gm-Message-State: AOUpUlEObk3Y0cYcm+GDkw65M8i6lr0Gx8/4WbzQPCAGcX/Euuladj2X
	JqbhV68ewGB4dYA8FN9UMYYt3JmI
X-Google-Smtp-Source: AA+uWPwAt7Pugqd4j0QmrVy1sb3lUC97Jgm2LQgE8wPUckG1gra5tMJYbQEysJ8bHivyvghXalvNKA==
X-Received: by 2002:a63:d04f:: with SMTP id
	s15-v6mr3457251pgi.42.1533747875351; 
	Wed, 08 Aug 2018 10:04:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:20 -0700
Message-Id: <d448b0405c86a57e42edb40e69525881c3d4accc.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 3/8] libxcrypt: Provide virtual/crypt for target and native as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 17:04:35 -0000

virtual/crypt for musl will come from libc itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc       | 1 +
 meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 052ae0e23b..8badbbb40a 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -9,6 +9,7 @@ LIBCOVERRIDE = ":libc-musl"
 PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
 PREFERRED_PROVIDER_virtual/libintl ?= "musl"
+PREFERRED_PROVIDER_virtual/crypt ?= "musl"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
index 6ed67a6761..f21029cdad 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
@@ -24,9 +24,4 @@ S = "${WORKDIR}/git"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
-python () {
-    if not bb.data.inherits_class('nativesdk', d):
-        raise bb.parse.SkipRecipe("Recipe only applies in nativesdk case for now")
-}
-
 BBCLASSEXTEND = "nativesdk"
-- 
2.18.0


