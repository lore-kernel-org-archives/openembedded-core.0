Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2088.1794939636680844991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=N8aWcJ54;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so77881f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939635; x=1795544435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmwTshNP+iVVSx9W8XgNdawR7Ow+oGXem1XucYf4Yy4=;
        b=N8aWcJ54xvyVqm/w9uMgs0FBEkMDJwwrWTBszYP9/oaBcvWmil3KWTRwZm0gqzlTZg
         mikFy5j041WfFxrdQfeYuxEZky+bCgRM1dm+qwqi0qPtAxj1iTZJ5ZAKnna9Pc+oUJxM
         x+beDy702xFy+OnIXDE4TM732IszneuNBdLAL5piT5yGDWQxX6SnJB8zL/BBS0RbiVTz
         IBdvBcvh4f8Nv+6C5CV+RLEjymtiPoiZ5GghkJpIBHum1jUKtMyEd3Tlez17nMKLz46V
         n1n4nXdO0mhHAH9a0Qno2+BJ+bZv/yEJtrrISf6SyRvXRwgF52B6zzjb0VY0h1vr0Xvi
         cc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939635; x=1795544435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmwTshNP+iVVSx9W8XgNdawR7Ow+oGXem1XucYf4Yy4=;
        b=iK6eLftxuJlvqVLSsatX4ImNdtG7RcdD8rgXn5Up2slLdO+KSJDp8ffGj4P95eRI2F
         RdXi3MsqMaftQwqRw2m8L1X5OZxYB24SM3dIzeDeIjZggx0W5EHdNJewN7QYHuz6RdwW
         X4r5BKOy/s/dyE3ej49ziotiU1oDEXPWVGPpgbGoIDE+H6L1HblJ7yoxvErwZoV5THSJ
         a/RY6vfE4vjLJ0/q3dtFIRzRvv1ZrlD/11ElWKM8ahm83zIRHX30DEi9IXRq0pb5fyRe
         aUxEoZ11khjS3LHpJLh4Sjv2WlBBfYjXWm27+uvJjzmJ0ZTqSe5qDE8iiEFkV4mtE8H/
         yDtA==
X-Gm-Message-State: APuU4Z+XCG7OtTE3Zz2ZQ/pkWDrnKnNRVQiDvvnokE3NBduQNP7FTN5K
	1Sbk1cfWfDOPgVfAuwdGri3pJWdil4WleSR9cwGl5pkZ5VD+ojdX+rvLOXLQXrLyRG7omqeg/fZ
	RMcZDV7I=
X-Gm-Gg: AZFdTZfMlNYIs5GTLUbsEWA8EuRvoBG4nWE3zPQrUPw/zg2tjwUJ9dlNaXDwCKocpFT
	rL/rwWU43cedSrraEo/S5N41hXFjI56cn/FEzDsprV3E3DUuqVwNfUARjX8nl6f0RD0XtFPtRMu
	PByQcdC3AfWmNuP+Yu0HVKMXWsku2tF1jBxUdrEVJ4AUDTgeUlX2YZkxcupfYPlhSd6YHcukr1H
	qgaWD42V18oNGH4KOuj26kENT8WUBWuP493d1coSsB/bbR/1NVz1Cg9Ctt5kYBUZZeKrkDxwXLw
	NZpEpCrClvtq2ld8i6BHERabc4YW/6me65QwCT92vAzYPTNx1NEpzjfGRG4ZwHUih9RB92nq8cx
	RmoeYCmuaECJC0DI10Rt+YjlCQeBL0kHPgHU0S83r6IFKnbfTryyU5j3IGgMc1Cb5GJ69A6Ls+G
	7Ld5cxegd5RM9eDUkrxgnAbAUpnZAIjjViJj7SLF+cL+55IttI527yy0uc1b1dAqLGp/Ta096/j
	Sh4y3EOvSdclgqELcM/SLons1oVd78Mz9KmJRWzPoMPDvaBRzoFZ6hG/ryZJS6nE5MGEcg2MPtF
	PLJxR9HwH6oj0dsp1w/l+5e/M3wQKT4bu/SgKQuwphoMCY641VNxdPQnJCRSy3XLuCgkqP4Mbi+
	FVP818eapNyT0HsykGgP5flA7FJUf
X-Received: by 2002:a05:6000:24c6:b0:4a4:6b8e:8685 with SMTP id ffacd0b85a97d-4a63ac6b268mr633570f8f.21.1794939634633;
        Tue, 17 Nov 2026 10:20:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/17] rsync: upgrade 3.4.2 -> 3.4.4
Date: Tue, 17 Nov 2026 19:20:03 +0100
Message-ID: <8482cda7afa8335d014bcc7bf4aa2dfc739ed0d5.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250470
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f583855eece3b022dec3703e6622eedac0159e9)
Suggested-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: NEWS: https://download.samba.org/pub/rsync/NEWS#3.4.3
NEWS: https://download.samba.org/pub/rsync/NEWS#3.4.4
Compare log: https://github.com/RsyncProject/rsync/compare/v3.4.2...v3.4.4
The Yocto Project TSC granted an exemption to the stable release
policy for this rsync version upgrade, see:
https://lists.openembedded.org/g/openembedded-core/message/248203]
---
 ...-Add-missing-prototypes-to-function-declarations.patch | 8 ++++----
 meta/recipes-devtools/rsync/files/determism.patch         | 4 ++--
 .../rsync/files/makefile-no-rebuild.patch                 | 6 +++---
 .../rsync/{rsync_3.4.2.bb => rsync_3.4.4.bb}              | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.2.bb => rsync_3.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index e6d3578e85c..ede0238b2ef 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
+From c05cc113f925bda645c8e51b83e9dc30b0543bad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -50,7 +50,7 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
+index b948f16..afca81d 100644
 --- a/log.c
 +++ b/log.c
 @@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
@@ -63,11 +63,11 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index ccad28a..bbb09ba 100644
+index 229a889..aa158ad 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
 -static void become_copy_as_user()
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index fd96b873c85..a8fee5ba0af 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
+From 32852028e95cdf78d09f1bd867f3b46b4728f9e3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 80e9d72..a7d313c 100644
+index 0ba2d5c..b9c5438 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index fb195b1e685..914b50a7b7e 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
+From 50ef5ccd9149cee27bae29e767ff1c2e76bdc879 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c2fe775..80e9d72 100644
+index 79060b3..0ba2d5c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
+@@ -200,60 +200,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.2.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.4.bb
index 5fe1bc2c2b3..fa9a61778f6 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
+SRC_URI[sha256sum] = "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
