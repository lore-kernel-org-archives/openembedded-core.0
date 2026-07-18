Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA79C44524
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2628.1784364807627391620
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lptg5z1O;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49546c690ffso14923875e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364806; x=1784969606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ahNT2H2C96mN8IWK0Cifv5HSKXzRUq6HPJab3CZfx0U=;
        b=lptg5z1O0CCuo60iU68R5pSSdOJCV6SIcI3ZAkKmWa01iVa9yzZKEg1OH/l6iv0HBo
         m7GMe0YAmR0+TpFcJm7J072Qcme/5OqkcmYZ9/OJTbj6hGlHMVFZvuYlKt7QxERdvZr5
         IhqmmsecSmPn2+WGxaAWqW/MytWXVk2TjgZT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364806; x=1784969606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ahNT2H2C96mN8IWK0Cifv5HSKXzRUq6HPJab3CZfx0U=;
        b=o1kByOxPeAddMiMhXCwr0yn5v0lpBa5fY7PMmhNtG898Qev+pMgUZzoRE+C5AQEheO
         C+zDFurGlOcOcSVnCrgR7Fq4P39HNum3S1fmZeMVD5EMuohgqcl0YAe4cuAgJlf4x1/d
         Guu/RkU6y2Kvvq67HGVTsR7MfXWdOsDZbVELZ6rWDNvbDQbCvSXnyhJY2uXcB4RW4pVM
         LxX9kS6W40u6R3XiGHCnlCQS8a9UPbVZ3fYjAFDQaEcmwYZl4XRhXBWEe7pNkZjWkAAQ
         7Kx59LL3iVilZUxBb4Qy5zMmEORri4/V2qx/k8rrx5ZDk8N8UjHv4YlFJzuHDe0ckgRE
         JCjA==
X-Gm-Message-State: AOJu0YzGqBww/H8PAXRvZe8sXoLg/boz2pC8JCsz3fTFezIVkpBTN+4g
	ou1phn/u1wFWtRYZR1P8bjh9KmzOJwgCNwrMoM3+nFVPe7RG/0c1ZgRLmI1kGlTeOaw4YM0LAoD
	JMSUhG4Q=
X-Gm-Gg: AfdE7cl8iwnRGOcXGxQT1xwdUIEX3c4tSOFKpyTO9QhzPl0A0zTUNvX8dzLFfYL/q4g
	B3W/iGQO0/XW1GF3qjmkYtqwJKEZcLW7FMzDB5mlu/5Erf9uj0gHRsLi9W4IvrCmQWF7cjSO3gi
	FuCuner5BEemeHhQbbUp3S6sgwalGWxbC9tDRtqXXhoVWWR9RP3cFg4/n2UQPN4mGDPeUOsTNsx
	WOGkuTSKbSiztnD90vm6x9T1WAjU4bZyxEfMqcwxsftBp8LuF+SmuHNJN9y3c7GaIy4EUeEGG/o
	c32zCRqHxGkZSnjmRM442Th5NfjSNFLdvUcwPgXZEsmH3/UDRDPFJA8AfDnAhOASRaoWwGQ2nB4
	PJyOQcs3MTmesM71ktcMxTZmpXK1j32crua4ex5Ioxv133vxU0x6WSWrZ2SL/fC6u8vy2PEGvup
	9PRtAYvxMu2U1HmPl1AuSfrtc8oeBYDwAocWSNw+BrJivu/6hf/xH+bpjp5//es9d546nI9Fy2/
	8VJCTg=
X-Received: by 2002:a05:600c:8010:b0:493:bd37:1cdf with SMTP id 5b1f17b1804b1-4954a3e2165mr64678115e9.2.1784364805841;
        Sat, 18 Jul 2026 01:53:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/17] bzip2: Fix CVE-2026-42250
Date: Sat, 18 Jul 2026 10:52:48 +0200
Message-ID: <161cbfeb9f8aecf1628d4feab67ad4a7690706b5.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241246

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

This patch applies the upstream fix as referenced in [1], using the commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42250
[2] https://sourceware.org/cgit/bzip2/commit/?id=35d122a3df8b0cc4082a4d89fdc6ee99f375fe67

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf39a3c0497023e96de11444579ffef31f968bcd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bzip2/bzip2/CVE-2026-42250.patch          | 35 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
new file mode 100644
index 00000000000..1679e744478
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
@@ -0,0 +1,35 @@
+From 71bf61d2e664c754ae5b1eb04018c8eaf5f99ae3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 28 May 2026 16:15:45 +0200
+Subject: [PATCH] bzip2recover: Make sure to not process more than
+ BZ_MAX_HANDLED_BLOCKS
+
+There is an off-by-one in the check before calling tooManyBlocks. This
+causes the scanning loop to run one more time and cause a possible
+read or write one past the global bStart, bEnd, rbStart and rbEnd
+buffers. There are no known exploits of this issue and you will need
+to compile with something like gcc -fsanitize=address (ASAN
+AddressSanitizer) to observe the faulty read/write.
+
+This has been assigned CVE-2026-42250.
+
+CVE: CVE-2026-42250
+Upstream-Status: Backport [https://sourceware.org/cgit/bzip2/commit/?id=35d122a3df8b0cc4082a4d89fdc6ee99f375fe67]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2recover.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bzip2recover.c b/bzip2recover.c
+index a8131e0..4b1c219 100644
+--- a/bzip2recover.c
++++ b/bzip2recover.c
+@@ -402,7 +402,7 @@ Int32 main ( Int32 argc, Char** argv )
+             rbEnd[rbCtr] = bEnd[currBlock];
+             rbCtr++;
+          }
+-         if (currBlock >= BZ_MAX_HANDLED_BLOCKS)
++         if (currBlock >= BZ_MAX_HANDLED_BLOCKS - 1)
+             tooManyBlocks(BZ_MAX_HANDLED_BLOCKS);
+          currBlock++;
+ 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 9cecf6a331b..36267e5073a 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
            file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=${BP} \
+           file://CVE-2026-42250.patch;subdir=${BP} \
            "
 SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
 

