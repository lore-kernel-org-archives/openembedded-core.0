Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACDB60272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:19:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id l7so11996099ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 19:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6/qElHP2uBPK6165+ghyu9VF/YGXesE0h1O5KgcL+ag=;
	b=PZmBNFljpx4qd0jdjM4D3vo+/ZbDB7/vLx5br2HdvKLwduG9ZHBDQlhOsC3PTUBafq
	loVjKhN03RaR3GbZVxtW5LkTYEwEzWGgUbpEfJSniwvB6qHKd6ElNXxzRdlfzGL2cIni
	8iZLAgfeVEFAk1nYhllXu/D/16UFlx0bjkoYPySby+TvY+GPjuASycLOacfjEsPsb5NS
	vFlHGe2VGCKUB3OkPpxDFzptHRBEiazbMA2Ltddc7bizpVtm+dALg28IGSStRMkYnBmN
	hmxfkUASU7cJMOQh/XusF9B7cgLsf/XeZHmPcqLdjZIc5UpOFBrbKLGFFNVaD3uCg6+2
	2hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6/qElHP2uBPK6165+ghyu9VF/YGXesE0h1O5KgcL+ag=;
	b=o5QsnOpwyTq0OfCpiHrip1/Yw8G+QKqAU18IU7AJU71oMHP0rittVov9Gm26Pda4sv
	CoSw0iJF1A9XyPQszc7cmT6HZjlmtlKD7drSsABTE/8qQoPp8rPUgCEdaZHzvczX4cAe
	1snW6Xt5m7QV+UT5uC8hwVAIUwXHVUVDUT0oiepCfMYCWh+Y7owfGyRhOn17ZZpaA99T
	kv4dgTRO9rAIQoERE2U+KyvxMFVLtKJ1gO4DhyNvQdYEnJiRUMsO6nOyNf0x+CILoO1y
	m41fayDymRhx6VDoygo/l2ZfT8TSsjBkSf4m7vyglZUvM90q7A3KdzEn5t6NSfD7AXjW
	DKOQ==
X-Gm-Message-State: APjAAAUAQhT7RuubCa3M6IwwONuzVfcFW3/8f3qXNNNnPMwraAiJOTlE
	UwQCizlAbtSqCihNh81XIJPxeuvR61g=
X-Google-Smtp-Source: APXvYqzzlYXuZcz3Ei1bM0ILFt9i/oydz7C6b3yfVNHaoR/7O4u54zgEC36a+PuU4pXm1Ykp4T7g8Q==
X-Received: by 2002:a2e:9915:: with SMTP id v21mr12245342lji.154.1555985943453;
	Mon, 22 Apr 2019 19:19:03 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x30sm3019714ljd.38.2019.04.22.19.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 19:19:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 04:18:57 +0200
Message-Id: <20190423021857.14151-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] gnupg: update to 2.2.15
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
X-List-Received-Date: Tue, 23 Apr 2019 02:19:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...01-Woverride-init-is-not-needed-with-gcc-9.patch | 13 ++++++++-----
 .../gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb}      |  4 ++--
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 4a280f9d5c..83195b5bd4 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 0df5800cc2e720aad883a517f7d24a9722fe5845 Mon Sep 17 00:00:00 2001
+From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,15 +17,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 30d0b45..98fe412 100644
+index 024d6dcc8..c6e141e16 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
-@@ -154,7 +154,7 @@ DNS_PUBLIC int *dns_debug_p(void);
+@@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
+ #define DNS_PRAGMA_QUIET _Pragma("clang diagnostic ignored \"-Winitializer-overrides\"")
+ #define DNS_PRAGMA_POP _Pragma("clang diagnostic pop")
  
- #define dns_quietinit(...) \
- 	DNS_PRAGMA_PUSH DNS_PRAGMA_QUIET __VA_ARGS__ DNS_PRAGMA_POP
 -#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || __GNUC__ > 4
 +#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || (__GNUC__ > 4 && __GNUC__ < 9)
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.13.bb b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.13.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.15.bb
index 3ce2a38c0e..06a257333d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.13.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "563b959d0c3856e34526e9ca51c80d7b"
-SRC_URI[sha256sum] = "76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8"
+SRC_URI[md5sum] = "3ab87e377aa0af2f463649515bf66508"
+SRC_URI[sha256sum] = "cb8ce298d7b36558ffc48aec961b14c830ff1783eef7a623411188b5e0f5d454"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


