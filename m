Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.31525.1613399919779192040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zguX2nmw;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id u66so7901422oig.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fWo/rLLOWvkjW5UtN8qivkGzHa6BcltMQ0AB6uBL/dc=;
        b=zguX2nmw5YNyJZOXnAofsl20FpN7czAgg5QHZMuGF3zgGw+6kXVcb+Zcd9Xr+UzEry
         IuB2XHG0OeJvkuDXjzWHMBA1caju27MWf/kaKSBi5YRy2hEUd+8q6/Ka96glrW+HZ7gd
         5rJHYSIXOh3oFBpwObeGXxwAsfwBLJrpk7ZYut7ITcXeZIeMqI/yGHKdOrOz6kbSXY1Q
         ZOkVWVYjy0HrueB8NJB5WvZrnpZbt8965hDtodgOut3jy+lDGP12QVz+sIdN76yWkMtt
         IdLE79xAWrgOeHnwHhvnSqj9ht0sst+WBy1CunP4Enjx343fpvuJKV2d1yt4Sv2qddol
         y8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fWo/rLLOWvkjW5UtN8qivkGzHa6BcltMQ0AB6uBL/dc=;
        b=fFQg8AppwtwIJkbnzW3UBS+bdDRJUv7Z+hxlqH6GhG61WS55xQGkc00Rm0cLo3qFpy
         I/T3nqttsikMT4w7ugpMhI/njGWeILQEOtQm3fS/z40d/ghQEtFr2TJflcGtO5hkGctU
         vwTfw1Cd6CErlsp0yOPO2m/Il6fPxhpNvCeUeK6j7wlWvJIUXyzrXX2J9vJcKZfEV+6+
         N0pclk3mspz1/MISeL5Z/e5erfAHvST1kBLXQ0suWYpeN1Og1WYtvDCIraoiFY3Vvipj
         cO6eJDLirZ+FXNqPSifRIWPEPZHnn6TwW4yWboXOhaL1AnfsuwBM9x5hvykUSh/9q0Rs
         WHdA==
X-Gm-Message-State: AOAM532RimAXoYpu/OsXV0ImqZPwQyXrVoIWHF8WqK+A+RIcoLxMchm6
	UihX8cLpI5d5BVnvORo0hbnHBkClY87Tjb51
X-Google-Smtp-Source: ABdhPJy9bAnr3QDubia40u/Ts7G3ERcK4L+3j8oglXRT5uTBgLFX5EAj99rG1gPjep4sPHiRFFnO1Q==
X-Received: by 2002:aca:cf4b:: with SMTP id f72mr8701194oig.113.1613399918743;
        Mon, 15 Feb 2021 06:38:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/17] p11-kit: upgrade 0.23.21 -> 0.23.22
Date: Mon, 15 Feb 2021 04:37:21 -1000
Message-Id: <641c9f6a20672e26e66191e6363b534d5b87abf5.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://github.com/p11-glue/p11-kit/releases/tag/0.23.22

Release notes:
Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361, CVE-2020-29362, and CVE-2020-29363), discovered and fixed by David Cook
anchor: Prefer persistent format when storing anchor [#329]
common: Fix infloop in p11_path_build [#326, #327]
proxy: C_CloseAllSessions: Make sure that calloc args are non-zero [#325]
common: Check for a NULL locale before freeing it [#321]
Build and test fixes [#313, #315, #317, #318, #319, #323, #330, #333, #334, #335, #338, #339]

https://github.com/p11-glue/p11-kit/commit/c4e75e10021ce86ab42682ea4936dce94ced2f77
patch to fix trailing newline using custom_target() caused error
with DISTRO_FEATURES api-documentation due to meson bugs, enable
manpages PACKAGECONFIG should prevent this error.
| warning: failed to load external entity "../version.xml"
| ../p11-kit-docs.xml:11: parser error : Failure to process entity version
| 		<releaseinfo>for p11-kit &version;</releaseinfo>
| 		                                  ^
| ../p11-kit-docs.xml:11: parser error : Entity 'version' not defined
| 		<releaseinfo>for p11-kit &version;</releaseinfo>
| 		                                  ^
| unable to parse ../p11-kit-docs.xml

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b112ba291835061640123c13784e2b33cc73f17d)
[0.23.x is an lts release, bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (75%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
similarity index 75%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index b1fd2334b2..c539ecdbc6 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -2,17 +2,18 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit meson gettext pkgconfig gtk-doc bash-completion
+inherit meson gettext pkgconfig gtk-doc bash-completion manpages
 
 DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.25.1

