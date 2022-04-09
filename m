Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916D4C5AC75
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3930.1649486008852136922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 23:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cIX5bFhk;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z16so10264814pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 23:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7Zp7b4XG4CqXPQPGH6IR1vkD8QoIrMlTgfXiS+LTYs=;
        b=cIX5bFhkqtIwhYFkpJ04SqqVf8/6NJV/qgU50U0vM+GMtN3EsiZQoX6bTKtzVdk+Lo
         U1yR3tUHnSJdlELFpbz/giSJK5ix8O2sjCnN6iirFfPWP7QK9CKMf2T7IYi/5S0NJ+oz
         et10JI4reQqIoFyPWJqf7+pb1DOaLonNUSjENOptbLqlILwYQVJB3noOiULqVKqvL3S9
         KOyNEAwUxrkYLXX6q7+sEPD/ebgyo8s2F2WHSdjCL1DCeCrmnZtXvdw/JLH6Grh3sFOk
         YxDbtsfFH3K9Slyqy1n4L6B9jKliuyiyhUkT30tcOvv9Jp0+Umaia1sGCCR4R8oZnizi
         JKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7Zp7b4XG4CqXPQPGH6IR1vkD8QoIrMlTgfXiS+LTYs=;
        b=hle92OYJz0o37V6erWVKmFbULbCYOqv271jShfavhgq0PNwmMnHR6BeCeIsjPzd+eq
         tPnqntsIdNjTc7NC8lP6B9ugMLkLY7ildH7l8o6BUtoE0hTzLayDoDzqjGgWBJpyckes
         Eey+mn+dhB5gU7+qjYAkFyddf0kpXgR+SX/A0uleo7FEuDs2n8uJzanWri7PP25QXJRi
         7qHx5npBiRmwzdzqq1al14FqDdwzDzKREQ7wYNgYWjZHGGi/nn0EItYshUFy59xna+PI
         UeTGxOHSvjfj2KY7qjkXafGeOfrOvkU8UG/M9wE1TCaxy2SceE1hwHQjOCiFz/GxDsjr
         4apg==
X-Gm-Message-State: AOAM533ilDXgxrDyeA/aAskIzLrDNr2oUvXxz6rqVkZWHudEiQPiXZ1p
	eBY9gTnNZqZBo4tUlEtNRl0I4nn0W+7UPQ==
X-Google-Smtp-Source: 
 ABdhPJy2ONHNCx8jrp27BQEYzarCAnwk6aZQ0xNQBTjmlMjosXx9u/bxy6D8TQn29sVQErvxDyEdnQ==
X-Received: by 2002:a62:fb0f:0:b0:4f2:6d3f:5ffb with SMTP id
 x15-20020a62fb0f000000b004f26d3f5ffbmr22751469pfm.55.1649486007870;
        Fri, 08 Apr 2022 23:33:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 k62-20020a17090a4cc400b001c7ea7f487asm14108248pjh.39.2022.04.08.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 23:33:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Add missing header locale.h
Date: Fri,  8 Apr 2022 23:33:25 -0700
Message-Id: <20220409063325.3252179-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164185

This fixes build issues seen on mips, but problem is generic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/add_missing_include.patch       | 19 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.0.bb  |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
new file mode 100644
index 00000000000..e60c317a26f
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
@@ -0,0 +1,19 @@
+Include locale.h for LC_MESSAGE definition
+
+This fixes build error
+Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp:115:51: error: use of undeclared identifier 'LC_MESSAGES'
+            return g_variant_new_string(setlocale(LC_MESSAGES, nullptr));
+                                                  ^
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
++++ b/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
+@@ -30,6 +30,7 @@
+ #include "FrameView.h"
+ #include "Page.h"
+ #include <glib/gi18n-lib.h>
++#include <locale.h>
+ 
+ namespace WebCore {
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
index 09d44933706..db8a565511a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
+           file://add_missing_include.patch \
            "
 
 SRC_URI[sha256sum] = "b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d"
-- 
2.35.1


