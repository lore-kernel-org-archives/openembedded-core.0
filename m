Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C05C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.3045.1639000803433628017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmUu8V9H;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j3so6543001wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qXKqW64hy9LpCH4lLyEOLuqmOm3beO8Bie0q7PTdFho=;
        b=MmUu8V9HNq8y+4Ecj9oLetaNGX1q1AOqZs6/2WTz2UTS+Xb7bWZ3b7nqZsxULvUgXI
         0/WJbPw+Hya0qME6jRDh/XyZzYwfOkCxbrHqLNbuA4F5VenchVlOUe/W/O+QZ394SQGN
         vnZWtbO4ymRR3ooKkw5JSqkvIk9rTmjN5O6G32szQvjqTck57tmDq2+CQz+SS4M+Ip3y
         XCOZE0VJFe15YjwwNTmxsAj1+2x1ERFbWyn+eEejp/J2wzfzILdLvmrb6qulYCdlFEdD
         w7PXGQFkYH89DwvU1kI3FmNfRueFAv4AthwMJgDR3IOMc4zzFXBv+9iAK9/oFV31Py8I
         ruHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXKqW64hy9LpCH4lLyEOLuqmOm3beO8Bie0q7PTdFho=;
        b=VGqXnDApx5FxpgOjJQQWno2T+w24I99qul0QGtS3el9DyMzfOP0IGqFT2k5Wed+f8K
         wszuQFVyIA6whiaGqN+y1QaghkeS51ySYGC36/vJUC4z28zSzpjnD6WTZMVFcaq9bQZz
         256nvpkbLj/jLF+FkjNH5WV0/uvOGE1KuoDQtUqiUVcsIEgbf01445btyGGPkbPj0ba/
         mRKK50UK7VS1/hgSS4DZLV72wFtD330kte0CiaUEhlNoprahIZ1FLaN/BLLSWxeUjVRH
         3uMuos/c12E1RTkYFQuUO4ax0H1JTDoNGcbsLraddKt2y150IEPvgDwoY3+Cu8tcTtCC
         87CA==
X-Gm-Message-State: AOAM533wgTp3TIdLoCC6zf572uWHHB7drmaSv+YgfeOdMVgjbzYr9F6S
	xRaBLtlaxbkB+/XECxTlWzHHi1ZacAB50Q==
X-Google-Smtp-Source: 
 ABdhPJweo5E4S0jf3Ggp9NRzxQJF8Uf+LGz+CiOM4Wtla0fz1qGp23hXKPpKEOp2r4cTHKHzpqAwgA==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr1577104wrv.552.1639000802071;
        Wed, 08 Dec 2021 14:00:02 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/29] glib-2.0: upgrade 2.70.1 -> 2.70.2
Date: Wed,  8 Dec 2021 22:59:26 +0100
Message-Id: <20211208215947.1979470-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159374

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.70.1.bb => glib-2.0_2.70.2.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.1.bb => glib-2.0_2.70.2.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 9bfb6e85cc..2118c7e6b9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From ab071f315deed3740f867161ee58436b985d6fc1 Mon Sep 17 00:00:00 2001
+From f4b144cbcd474d5f4982e654607fd609e056b532 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.70.2.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.70.2.bb
index f7bb62f74b..df0dde5080 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.70.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "f9b7bce7f51753a1f43853bbcaca8bf09e15e994268e29cfd7a76f65636263c0"
+SRC_URI[sha256sum] = "0551459c85cd3da3d58ddc9016fd28be5af503f5e1615a71ba5b512ac945806f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.20.1


