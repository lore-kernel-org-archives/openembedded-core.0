Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BCEC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.1764.1645114196470820584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GbWaKX5C;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id qx21so8371756ejb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vBPeZOcjkbvVF3QY6XTithQ7IPFr5T8ImmzQEqtko0=;
        b=GbWaKX5CvZxHwBW3gcBKSEEZ3HrNn+P2Zm7SKwDp0/5IOyzOjX0bvXerCBlPcvuHsd
         +NALAMQYv84uLixBKesi9hJkUFdJOBwgV2xNycVhYVRsEgWAlvzKZqz1NmBWq+N6vkKP
         7dFRLMAP7vvYJAHQFAyeOizOUjcbqwqaMldNQUpSIDAbRp5Jig9ZG9MMzJGp7oGAyVw/
         0sklDazU69+OdrJPL6CozBfzLWK3QSDGvBXouBJaXurrgUZw17fFGAQz4aY2rZ+lnLM+
         i3jt6tCIm5EGYSW036kb4vNtxQpTeCUT3j+I1zeLWOzP8DYosD8fXXeefxLAt7fsLMgV
         4fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vBPeZOcjkbvVF3QY6XTithQ7IPFr5T8ImmzQEqtko0=;
        b=JAe/1IcSzLTRAuBzqVWhFpWkhanzfx3MGUBv7unmovjIP921TyRK7exjnMLT5gM3JV
         DzfNIRXQX4bGN8mvzpKc9Q4IpsRQAynPJx+QHY0AwHDO2ofoelDtcFzxQO3DUzBMZw5q
         uPk+vX8XKiCtLcDRhh/QLS23mxridRjsp695HRkVyvo8J8fh7bM/WGtdxRktgVBMo3hQ
         7p4op/LC8NZyZt6sjCRzpDtvPDpek73TGlLu+v0O2KA+uWUEfoaIumOdCkd4sYAhr6md
         iIgi98uNdq6eddnIu7sG3B5eb2v/PuGri3NJpeQ0E8dGPStijtnISAJtCQ0xAv/UCOeJ
         inLQ==
X-Gm-Message-State: AOAM530JIT9yV6Bx85xjG//jgX/Q/j1Dvy2pmJRF8c9oIJ8ydh8QdARf
	iUzkWgbGgSSWMHwmRg6dn9ukntitENE=
X-Google-Smtp-Source: 
 ABdhPJy5onsKRpFc60E+rGPjPINmuO7cc+p+fO/JclOEnjsEBX/twsRC267CWSf9tl4d4O6iTtPK9A==
X-Received: by 2002:a17:907:1245:b0:6cc:e663:7baa with SMTP id
 wc5-20020a170907124500b006cce6637baamr2759885ejb.447.1645114194963;
        Thu, 17 Feb 2022 08:09:54 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 07/28] webkitgtk: remove rejected patch
Date: Thu, 17 Feb 2022 17:09:18 +0100
Message-Id: <20220217160939.1424397-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161824

Upstream has first accepted, then reverted this change,
so this needs to be re-submitted, after verifying that it is
still relevant.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 42 -------------------
 meta/recipes-sato/webkit/webkitgtk_2.34.5.bb  |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
deleted file mode 100644
index a65cfc8b5a..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b055bd199f9c40148334725a227796c0d7d14788 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Feb 2020 17:06:27 -0800
-Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
-
-Fixes build failures on risv64
-
-Taken from https://trac.webkit.org/changeset/231843/webkit
-
- Enable THREADS_PREFER_PTHREAD_FLAG. This uses -pthread instead of
--lpthread, fixing the 64-bit RISC-V build of the GTK+ port due to
-missing atomic primitives.
-
-Upstream-Status: Submitted [https://trac.webkit.org/changeset/231843/webkit]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Source/cmake/OptionsGTK.cmake     | 1 +
- Source/cmake/OptionsJSCOnly.cmake | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index 3cb5a495..dfba9900 100644
---- a/Source/cmake/OptionsGTK.cmake
-+++ b/Source/cmake/OptionsGTK.cmake
-@@ -7,6 +7,7 @@ SET_PROJECT_VERSION(2 34 0)
- 
- 
- set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
-+set(THREADS_PREFER_PTHREAD_FLAG ON)
- 
- find_package(Cairo 1.14.0 REQUIRED)
- find_package(Fontconfig 2.8.0 REQUIRED)
-diff --git a/Source/cmake/OptionsJSCOnly.cmake b/Source/cmake/OptionsJSCOnly.cmake
-index e892b427..73bf9e4d 100644
---- a/Source/cmake/OptionsJSCOnly.cmake
-+++ b/Source/cmake/OptionsJSCOnly.cmake
-@@ -1,3 +1,4 @@
-+set(THREADS_PREFER_PTHREAD_FLAG ON)
- find_package(Threads REQUIRED)
- 
- if (MSVC)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
index e6362bedc3..41ecb8095a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
@@ -14,7 +14,6 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-           file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
            file://reduce-memory-overheads.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
-- 
2.20.1


