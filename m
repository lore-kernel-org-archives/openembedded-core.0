Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54531C43217
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.11505.1634657668218487871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RicFJzna;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3394478wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XlG3hUNLPDyZphiRDcqZLi+1YuTVFbD0DgMtRhhCrag=;
        b=RicFJznaQ/9aun/Xz7erFkwvzomHBYKs11UJycbGxd42WwYEEmeSAclq8wMo8sSgS2
         8bYlCyWS0PLMdVM1ANCthABu30hPqfaAqjuqitYZWxp6gBJUr5rFYSgtMZHYEOq5BmIH
         p9w2WbsS0biu21885Y2PhH17HZEbKspty5aRHzOsMKXbXegf9ngXXs1m9B0zvjsX2VU5
         eG/MoSddTC9Q4ok8/zDg8GZhDfvJxlRqxiRRgnTMPHYPrIPvSR4M2Xk6MnORNM8FQ6iY
         t2yJHUK/7xCOOEqBKmbEgdfDNU5UGjSeeJ9m/r+LCndBMC5sHAsLLx0ryEt4TIM50BtI
         RCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XlG3hUNLPDyZphiRDcqZLi+1YuTVFbD0DgMtRhhCrag=;
        b=Hwf2wD4bXQ3nwZC4QtKrXt43vGIYmF03pgalWkbwFVHFLqk/s5xGIXCjRw5LN9ld9Y
         reOosxeK2GUH5tCLszklTePkUqKLrOaf7FMBWcL1TlifFoRr8sIGjMQ6MClHKifobHzz
         DslIh1wK/OrTY6cDRGJRAE8Xufg3We0RjxMjwHXrYcQpc/uzOs/0wghriWFyz9w2atas
         UcX4i86VPHkpIXblhnNtILdw2tjg546WGWiwgjEu63dKlkZryRv1uqaa/dwSHiL0jTYC
         PU8QiHww6WyurEaM0H4Ew75oSH/Lmao+FB4N00Ih37pDtQNwMpF6c9xK0/K8q3CVUf+9
         tMgA==
X-Gm-Message-State: AOAM5330k8kd8XFFdJ4HXgfR6++IsOwNWb+dusT2m0EakSOT5wQ1187n
	yXjr41Z36zLaxPDz9qpZih5sYvf6n8I=
X-Google-Smtp-Source: 
 ABdhPJybsL0WmMOz64VguB7ToAQV4hyoAQ181htZ8f6z/7ZWSttsqBeiRQb9i0cIbajOD+ci1izo6g==
X-Received: by 2002:a5d:58ca:: with SMTP id
 o10mr45269285wrf.358.1634657666863;
        Tue, 19 Oct 2021 08:34:26 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/65] lighttpd: update 1.4.59 -> 1.4.60
Date: Tue, 19 Oct 2021 17:33:19 +0200
Message-Id: <20211019153419.3319802-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157124

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n-add-with_zstd-to-meson_options.txt.patch | 27 -------------
 ...-__BEGIN_DECLS-__END_DECLS-if-needed.patch | 38 +++++++++++++++++++
 ...{lighttpd_1.4.59.bb => lighttpd_1.4.60.bb} |  4 +-
 3 files changed, 40 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.59.bb => lighttpd_1.4.60.bb} (95%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch
deleted file mode 100644
index ceedccbd11..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f24bd105388c305beeead5d3fa0a028b82354f18 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Wed, 3 Feb 2021 00:35:34 -0500
-Subject: [PATCH] [meson] add with_zstd to meson_options.txt
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson_options.txt | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index 51bea44d..f6687159 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -148,6 +148,11 @@ option('with_zlib',
- 	value: true,
- 	description: 'with deflate-support for mod_deflate [default: on]',
- )
-+option('with_zstd',
-+	type: 'boolean',
-+	value: false,
-+	description: 'with zstd-support for mod_deflate [default: off]',
-+)
- 
- option('build_extra_warnings',
- 	type: 'boolean',
diff --git a/meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch b/meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
new file mode 100644
index 0000000000..2a9bb352b5
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
@@ -0,0 +1,38 @@
+From c1466f3620f608e4def4b8853c4e2bc6d9a19646 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Mon, 4 Oct 2021 09:51:22 -0400
+Subject: [PATCH] define __BEGIN_DECLS, __END_DECLS if needed
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/first.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/first.h b/src/first.h
+index df747ba..9d0428a 100644
+--- a/src/first.h
++++ b/src/first.h
+@@ -39,6 +39,22 @@
+ #include <sys/types.h>
+ #include <stddef.h>
+ 
++#ifndef __BEGIN_DECLS
++#ifdef __cplusplus
++#define __BEGIN_DECLS extern "C" {
++#else
++#define __BEGIN_DECLS
++#endif
++#endif
++
++#ifndef __END_DECLS
++#ifdef __cplusplus
++#define __END_DECLS }
++#else
++#define __END_DECLS
++#endif
++#endif
++
+ #if defined HAVE_STDINT_H
+ # include <stdint.h>
+ #elif defined HAVE_INTTYPES_H
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.60.bb
similarity index 95%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.60.bb
index 8cb3a9a18c..dca8934ad2 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.60.bb
@@ -18,10 +18,10 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd.conf \
            file://lighttpd \
            file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
-           file://0001-meson-add-with_zstd-to-meson_options.txt.patch \
+           file://0002-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch \
            "
 
-SRC_URI[sha256sum] = "fb953db273daef08edb6e202556cae8a3d07eed6081c96bd9903db957d1084d5"
+SRC_URI[sha256sum] = "4bb1dd859e541a3131e5be101557d2e1195b4129d3a849a3a6fbd21fe1c946f0"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.20.1


