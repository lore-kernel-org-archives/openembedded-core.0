Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.35343.1612792505588895384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QkJYBJxZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id t25so14240971otc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cvNBlGgpabsOhOEvSwhZM0Gf9P7M4oxsppuIzTqmHgE=;
        b=QkJYBJxZPpDGJx+2EZT8DOr5BLpmJaHwtVwpCnyHUyHi1glrReLJn9Q+vG9L7t03nG
         U6SxX2eERPxT2XrS9y+yK53JeOCn2otWShjCKA47s9+KcxcsnDdEsqAoi+0wmWJJHOfs
         PdjcAVJApo0oZC4Tia6pPYA9Hpf1On8hvZFeXztDC8t3IYn5gTmJP1C5w0bWkDc4NI20
         HoJdz1ke2ltwXocJ3K1OiwDTuyKRlhNA1aBlEz853h7ZOOIfmpZraMTnrswk74au/o32
         EpUMEM2OF7aP1lyV9bElLQ21UFl0lHwO4rMmTl00QTxNV+nkEQOC3mW0GYh4l2MUqelt
         2D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvNBlGgpabsOhOEvSwhZM0Gf9P7M4oxsppuIzTqmHgE=;
        b=fMjgYbE23/HNer11MICA1BlwnexEeSkpxZAbiSqkRWb93Iw7f+vMJXLNgxOYxiqiil
         2sb5+WVCG8/YUY9kHDyBQGIaO57xxlT0taXKopmIZAaxoTCpIlR5XWEkv0ePsx4PbBc5
         5H4MAcyQGLa/FMP0th2Tl6zIiHUtpDbsVMzUHSujk42sR92lH+ZkgbfKISE+vFdYkY2T
         4yWhQ0b8dGcm4mfsP8jXTVGajFtqpR2vXUrwK4fs465/Ln7MikiORglGBQiAdydB8SkV
         zT4nRcRN9ubEiJfCskYcwRDoxNPdkagy6I3jf7Xb/bhakcCJ3e0aCLCyYJCm14JhRHRx
         CWiQ==
X-Gm-Message-State: AOAM530evNt73RISHZV9X0Y+NJKSzihlKqgsCwnRdc1cU8yXCtuFRqp0
	97SNjZ1Px1C83YDmyr0NM6G6r7ULkxSosjRiXJk=
X-Google-Smtp-Source: ABdhPJyDD1pKuq8zU3Okzqd+rPDlpgMcPZOzaEsV8z859DQ/Nk319ddZpAYg/7ik4sgrvxwd3U0Zeg==
X-Received: by 2002:a9d:1465:: with SMTP id h92mr12473358oth.141.1612792504314;
        Mon, 08 Feb 2021 05:55:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/28] glib-2.0: Rename patch file for CVE-2020-35457
Date: Mon,  8 Feb 2021 03:52:12 -1000
Message-Id: <07f390647aee70863a37c3fab7575a2aa24f22a8.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anatol Belski <anbelski@linux.microsoft.com>

The naming convention needs to be help so the CVE is recognized as
fixed by the tooling.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ion-to-avoid-GOptionEntry-lis.patch => CVE-2020-35457.patch} | 0
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/glib-2.0/{0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch => CVE-2020-35457.patch} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
rename to meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
index 0ad14a0878..1a006b9f38 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://tzdata-update.patch \
-           file://0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch \
+           file://CVE-2020-35457.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.25.1

