Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990B8C6370B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.7371.1649517420275088039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 08:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y08s18HB;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id w7so10856529pfu.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zG4fGa57c8DnJtJ8Geyc5vuJHEOZxJ+GwwmGG3pJ10=;
        b=Y08s18HBGE0kWKZcVe0Xr//pCwo3KmvLk3PWnkdfNQNqwy/m86DbCh3VEtERCPnk8I
         sI6JsZqS2YIvDKNt6Zl4NSlUE76qTTo0QaJgaL6snggeBZWO0zwhzetnd4ii3ekWX41S
         mDTaR5Fb1dUeXrnItokk1fbQZVW2ty9qvf01UUkbmGXyxsD5G65QWU5rsr6O/AYnten6
         UxgTbcQWM7pFEC/Wlh35ZNpaD1EJpMZK9pzKt4h1RJSnTZA+7rOv6i8faa3kgAz8SKNw
         9kQq/hIWNlh5c6LSfEjA8KS3g0GKkmpXXuMrjfYYcNN7G55yrViisgcd6VUDdDLanuUd
         p+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zG4fGa57c8DnJtJ8Geyc5vuJHEOZxJ+GwwmGG3pJ10=;
        b=aPEOAPy6wp5A+Ihb4KkNH/Kds3bPtkspl/tsKWy7q0q+rCaIaRxHfYebAMnhTOvdnb
         KaiCGJpd32HfYSBwF89NShSo1Y5RhwKDMgTtGhfFou57z6vLMn2hwVi+e/btoDtR/XLv
         uGgJGiivuXn3CYdxCe0htlOEjTAPCaH4wfoQLC8gd8xAo1OvJQ6YsbTHU0OdaQMJBtbe
         /AbIRYZ6L+fR441mQ+kn1BeWsSvZyA6C8UhbjCCoGhUPrLtETN58ITCdR2X9AZ33ib7D
         pcqe0WCUzsJuSkneeio7LyBuONlnLYewiAaWyZpKKLcavA3Ze+3+F4RaB1SOTHZcvEa9
         ThbA==
X-Gm-Message-State: AOAM530KVGGUk+X5oBCFPbf5MO3CnC1iV31u4OV4NBb3d+3LsrRXPwFp
	qi5IkDH1uDP8nRJcMG3FZbp2NH83WNqaew==
X-Google-Smtp-Source: 
 ABdhPJyf8XhdkfmOXYrwsyc/UAy/krD4EmOw1ajao7EV/h7SOyG5dmqR5zBYk3v6zzxNbgKNRVKbsg==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr20548356pgu.62.1649517419363;
        Sat, 09 Apr 2022 08:16:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 my18-20020a17090b4c9200b001c75aeac7fdsm15405675pjb.27.2022.04.09.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 08:16:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] webkitgtk: Add missing header locale.h
Date: Sat,  9 Apr 2022 08:16:56 -0700
Message-Id: <20220409151656.3416246-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164190

This fixes build issues seen on mips, but problem is generic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/add_missing_include.patch       | 19 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.0.bb  |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
new file mode 100644
index 00000000000..8f59db31303
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
@@ -0,0 +1,19 @@
+Include locale.h for LC_MESSAGE definition
+
+This fixes build error
+Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp:115:51: error: use of undeclared identifier 'LC_MESSAGES'
+            return g_variant_new_string(setlocale(LC_MESSAGES, nullptr));
+                                                  ^
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=239030]
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


