Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.240.1612800042413144569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uwmHqXmK;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id f2so3558566ioq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cLXOSWAqjjn9TZWt9Rmxl85pUw30m4SFDAkVOGQLE9Y=;
        b=uwmHqXmK1yWy7bSG+5p8pyx4N+liYfm4XNY7QEcY1jNrhQU8NRA+6VDvE1OzFPsqIl
         mXFXqJ1nKGQXwRKVE+9ffvUrL0kr9OFKPf6tH6MmvhVSnMeRtr0Z4kHX21wBbh6Egr8F
         SkxysTtfweiKQBlLYH4osyYiPD3xMmWT81w6lJJukFj+xqAlbYXNBKZ1C3m+VmG54121
         QZAmGJiG5VvxsQXiVvMjyAoIJgXOxoi5F0/UBY6wNRSDwyLtCg5GgzOoUQD+4loYFwk6
         E75tbCW1j1caIg4u3Y57hQb+eS35v0eAx52VMCyMdYUvXw9QV9TAw51f4ykfXErmfX95
         GCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cLXOSWAqjjn9TZWt9Rmxl85pUw30m4SFDAkVOGQLE9Y=;
        b=mytXQiFahy2DT3gtc1Alz6uk7oPMOk3HyPQfWPylc2wOYDVHPnBZYFT397TlaRZqM4
         icmWEFY3Y/uJ69047C+sv8PlMv6JhXAwS+lKnZOeOOQizvbstjr/J5iFgjWF+uKVu7b0
         6lX9EpBGh19En0XVPAlEU+GmsNBeb4Qs/nAXIWBIBJiDYohiSkRThbKGy5OmoTtH90iA
         5RodR4wpJ9UV1+DJgBK6fqvvzWHkwTBuHbqxBHI9SUE6NZ8QwApvNpBaxT0jGcOSkI8R
         7r2/qHibt6+lwq+0lQIrO3GCtSQboXGR7Hv+U0R8DK1jPfnUczuQpC4xaPiP9rK6D5NV
         RdAA==
X-Gm-Message-State: AOAM531BevxeOiapOKE80WQt50sVYOIbURKGeZITsKULVridzJweM51l
	8mI/xXpdv/XWBwZdo7gqKRERmw810w5GfQ==
X-Google-Smtp-Source: ABdhPJzS96v0hAoWpgHJNu8hd7QAnoHZoRfwhRmTu5APja8Lwk9PnITbJrS2RftAwJvkIjC/3hKvPw==
X-Received: by 2002:a05:6602:21c6:: with SMTP id c6mr2303043ioc.94.1612800041591;
        Mon, 08 Feb 2021 08:00:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8024:4784:a3c:6cf6])
        by smtp.gmail.com with ESMTPSA id f15sm9001926ilj.23.2021.02.08.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 08:00:41 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Lee Chee Yang <chee.yang.lee@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [dunfell][PATCH 2/2] p11-kit: upgrade 0.23.21 -> 0.23.22
Date: Mon,  8 Feb 2021 08:00:38 -0800
Message-Id: <20210208160038.22410-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208160038.22410-1-akuster808@gmail.com>
References: <20210208160038.22410-1-akuster808@gmail.com>

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

(From OE-Core rev: b112ba291835061640123c13784e2b33cc73f17d)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59b07a71f32c84e592d66595a2a7e1ae9c7ebef8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit f500435958fd676a00757a64572f06f5cb16c251)
[p11-kit 0.23.xx is lts version. Bug fix only update
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

