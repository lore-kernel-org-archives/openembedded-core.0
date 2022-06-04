Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D551C43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.8733.1654338389935532337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WeCi0tmK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n185so5187915wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AZ4eW7ss49RrUFdS2hDuCf0C9picYlZ0aPhhvlV+hes=;
        b=WeCi0tmKGIzXFvCWGFsc9x0nkDsQ2SE8IMf72mBX8Qf/jLW0SmHt0KOR+3yB8JJRYA
         2zRbKZpU9Twh5sKY2MWvrHWyrolKzUcjTRidLGjtEFgWupS4V4vRlLwS08/CDv3kAoaG
         s0Um5db6HtixhkNtHg9CbItX+/AnyR9hbwtfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AZ4eW7ss49RrUFdS2hDuCf0C9picYlZ0aPhhvlV+hes=;
        b=j8yPv0+f7QoAAyzaPJuCJo9EczbSrkAGvH9VksNoDxHH9FBEVelaT4s35LCeolHdwn
         ClEzBiIP9P/8+0V7QebgW4zQLWTWm4ojU/sWlDSjqniu8d6QKSUU4KgdyZb8pmP1hUxr
         EWyqCIA7Z01sZKqy4LcklsLkFDKymKKo+HixJcWBQ+eCcNn+Zb6Op+t4QjUgJAaXdgtm
         jcCyMXqoAYkm+LQ3V3mRMPXfTzU3bO53ty+j5QjJw9Lm4YtYDT9hffBpPHmMXgaLIMvN
         a6m3T7SUM63hoTEWRczSOHRCSdgI4k7C+YOwpRGnuTQIJSQoYM/Aq/KLnAyEvllrPvoO
         0QKA==
X-Gm-Message-State: AOAM532uq1/MAY/wutSyGopnodPrGDJ/do3cGX9T/yqkdblHF4rhWRli
	38QPiI/iVmFCTDgRZRU1OESwEHPowoBEUP3k
X-Google-Smtp-Source: 
 ABdhPJxBa4q4KX5o1rXLn0UlvZUh/gZRtHHAvfJiduT5UsuivBmeYUjYafFb7OD3IX+aWUytqkfcLg==
X-Received: by 2002:a7b:c109:0:b0:397:43ef:b66f with SMTP id
 w9-20020a7bc109000000b0039743efb66fmr41080493wmi.44.1654338387816;
        Sat, 04 Jun 2022 03:26:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/17] glib-2.0: upgrade 2.72.1 -> 2.72.2
Date: Sat,  4 Jun 2022 11:26:09 +0100
Message-Id: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166547

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 816b790ce77..fb50fff6a57 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d52b1b530c5d8a1e70ae45d6e2139e9d3f25207f Mon Sep 17 00:00:00 2001
+From a30eb17c20e070124b55523d86729348f2929f95 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
index c9ccedd81ff..c4a8a4b8ada 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "c07e57147b254cef92ce80a0378dc0c02a4358e7de4702e9f403069781095fe2"
+SRC_URI[sha256sum] = "78d599a133dba7fe2036dfa8db8fb6131ab9642783fc9578b07a20995252d2de"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


