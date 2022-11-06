Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63DCC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:41 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.16527.1667744257993949940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pPU4YMoX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k15so8447062pfg.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2hhG4vTk0eG3Q8czRBCAhvU/0LGt8nszfjQmTjA5Qc=;
        b=pPU4YMoXO/5Z7+/w0KrLjZLbJ++/n9HBUlu3KFWwhBdzKJzIcQ3c599oHg1voKTQRZ
         jDsAPpNzHuadVFp0awmW73O7pxqtqVIxET/rBcPL4Eu/eno+8kXY5ogX6CIR4Vrq6nTP
         MWa23uIFba+7maJjx6QwVtbxnOUKmebgYONXXRfZxmsYUwU8DAUo2Yl0Yu0pTK1y6piN
         luo42Kcv953SZ+4gaE1/iubNqUl5yy3ZwxbWWAQ4Chtq06z77tVpP3PB43p9XShhZTyy
         xe3QbPlOZ6poMHMdA6u50Wzcg8UEIDZAGd+StlzqG2SBo9VHknSlE4goWmAvGKzkROht
         b7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2hhG4vTk0eG3Q8czRBCAhvU/0LGt8nszfjQmTjA5Qc=;
        b=Ap7fWlmbpXaj4qMgXLqKx1SxYWedCzxv/o1nCAfls3R5ySCW0eeemlYpzdnrZxcygh
         dQhavhMp3EE0NaVdKrzZx4tFU0C/n532RAZzHulJGc1QGOKAl47LQc6nBN0fe60nZwiq
         +8wtf0D5LN+nnr06ZLnOb8U7QK9pZ+xfoTN80rfjlZhBtlqyMC4iNh7WHzQDnPTvLLwX
         htyqC40c5Dm/N6d31J+A0e6oGR0IsGopLp4T9mVukmlcPRB6AnnGq2HUNBPRZmoaeyw6
         lazmEnqLKLHmV2ahE5SF08n27xH1v92LE71jI57PlhTi3XMeyAmthJZzfGs7Gvs5Mcuk
         0AhA==
X-Gm-Message-State: ACrzQf276VJELwK8jenr2ARpCl/6hSbIwWVQAKeAiZeQnLbuYeBQTLpo
	dQfMiQ4F8e6kTTJvc96LWqxL1rWFBdVl5QQI
X-Google-Smtp-Source: AMsMyM5Mfs6YojBa8k1RrEHr1y2in5D25lus7YX5R9Lzu+xYGtpX06YSq7Tk1/28ww98cUPK/tw6Xw==
X-Received: by 2002:a63:d64b:0:b0:46f:7941:a8ea with SMTP id d11-20020a63d64b000000b0046f7941a8eamr38572135pgj.331.1667744257044;
        Sun, 06 Nov 2022 06:17:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/34] libical: upgrade 3.0.14 -> 3.0.15
Date: Sun,  6 Nov 2022 04:16:46 -1000
Message-Id: <68e89fb36d43db7a655a3a73933e403bb0932ff3.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172771

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
 Add missing property parameters into libical-glib
 Fix CMake option USE_32BIT_TIME_T actually uses a 32-bit time_t value
 Fix icaltime_as_timet, which returned incorrect results for years >= 2100, to work properly between years 1902 and 10k.
 Fix x-property comma handling and escaping
 Built-in timezones updated to tzdata2022d (now with a VTIMEZONE for each time zone alias)
 Fix fuzzer issues
 Handle unreachable-code compile warnings with clang
 Ensure all vanew_foo() calls finish with (void*)0 (not 0)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6092ae3cbe0eaf006db615c6cc3f1692e1cc1df8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libical/{libical_3.0.14.bb => libical_3.0.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.14.bb => libical_3.0.15.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.15.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.14.bb
rename to meta/recipes-support/libical/libical_3.0.15.bb
index 44030fdc9f..1ceb0005cd 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.15.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f"
+SRC_URI[sha256sum] = "019085ba99936f25546d86cb3e34852e5fe2b5a7d5f1cb4423a0cc42e399f629"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.25.1


