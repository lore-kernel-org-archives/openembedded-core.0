Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C46DC02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 15:41:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.90880.1738597251917461775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 07:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=niQNb74G;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: nikhilar2410@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361c705434so33831215e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 07:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738597249; x=1739202049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yA8fWFUUj9fP5qlLNDele9HuJM/BWCJfgBeRscOfVFE=;
        b=niQNb74GKStYpvoRW3ypxPvjjW89R6UOseF7VBtYcDy3O1HB0OITIne3ayN2g/UpL/
         qlvLXz7ykknmPQ1olTKwbUEB4KKE0H/Mp6TyIb2ToHqHdAePmbjDNOMhlkv2KDR7RKeF
         1pQm0MkVXUamqd7VVMrx4icj9pt2nqIj2R45FOL9TmZnhCk2bJcD3ckFMJjvit14vC+R
         sRiJJ0abCX7ZpVFjdA4SM8w2grBhAeziZf/J1/19vwA9e6Q820Fc2qAniWAcbYIbYJmF
         O5fSHjXL5VGJ9tfCvvcVbmxivYrKnQmD89MrguNFMYRz3AU5YM9hxMSyl2OgUes9BKwW
         tu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597249; x=1739202049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yA8fWFUUj9fP5qlLNDele9HuJM/BWCJfgBeRscOfVFE=;
        b=QvutgBdzJ94D0erBXYkmQo4k9Wdl6eXhMWqezYOstqtMsZABYO0DiiNW0KKV+7mDbd
         VuYcP1LvOfcrsWuN0XF1YGCMpbEa0R2A1VMMwdourIZaEfD/9zQhTAtn/VH6Iv+mwbRw
         xUW92GZO2Glz4fC764YMpk5phPlgn5DcS5bFQFw3kEkQyFcMJt/rmlpq86JeatDsHBfH
         0+rohcfG1HXehyOBxwCmLQSLFU6wvKNVVkXPTWqLluVMlTLuA2HOabVBSUEexF7aDmWu
         06S880yA3It67Qj6kLMNb37Iq5vbni7EziThhpj2uBQp9dNHa5Xir6acp3grlELKj9QB
         olwA==
X-Gm-Message-State: AOJu0Yzd9pTkizX1jh+xrZQfre6oebTIR7QcOqU5RTyAG3V85CxjrpBl
	LBW2uYrQ1TUa7YrpL89nz3XTWpqjTrGat6fj0jCtx6gH3zjyj1OcAgViRH8=
X-Gm-Gg: ASbGncsJ5ggarGuiLPrwe5KzlA0fVE+bAl2Qe+yqXp/4B9iXKJk4Ki+zhM+6MgQzzq0
	v4KChVUkkX0epCEm5osuNx8LoKzBtC8VQ+VW6FE+fksslHhmNKLZ3fBZgZ4AotEhRazZiNYv6bq
	J85SGr2KBXB6R4eTx+K97Y7r83+cFTVzxfaFOv3EHSP7LY7uS2ZqSAntJo4P2II53IzdUezw+v8
	GEf3rR2WRRa+rl2Z5RAOp4jnmAi/wPmQ6cgcNxoOEm6Qo7QB1XJ2+62Ubexw8h3Eo88wxhsY3y1
	b6NPn8DB0XEPFnKUO7n8p527RfCxXAdT
X-Google-Smtp-Source: AGHT+IEJvsVWgkNKy3GrkTrWkB4NiM8kMi/wncO5975HVrZKP7JLhvxuilPWvEVyvnTDi+9ZtyGcMg==
X-Received: by 2002:a05:600c:3ca0:b0:436:1aa6:b8ee with SMTP id 5b1f17b1804b1-438dc3aa574mr202911365e9.2.1738597248886;
        Mon, 03 Feb 2025 07:40:48 -0800 (PST)
Received: from GIW-21.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de880sm157805475e9.12.2025.02.03.07.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:40:48 -0800 (PST)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: Nikhil R <nikhilr5@kpit.com>
Subject: [OE-core][dunfell][PATCH] glibc: Suppress GCC -Os warning on user2netname for sunrpc
Date: Mon,  3 Feb 2025 16:40:38 +0100
Message-Id: <20250203154038.33130-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 15:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210658

From: Nikhil R <nikhilr5@kpit.com>

When building with GCC -Os, a warning is triggered indicating that sprintf might overflow.

Error:
  netname.c: In function 'user2netname':
  netname.c:51:28: error: '%s' directive writing up to 255 bytes into a
  region of size between 239 and 249 [-Werror=format-overflow=]
     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
        |                            ^~               ~~~~~~~
  netname.c:51:3: note: 'sprintf' output between 8 and 273 bytes into a
  destination of size 256
     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

However the code does test prior the sprintf call that dfltdom plus
the required extra space for OPSYS, uid, and extra character will not
overflow and return 0 instead.

Upstream-patch: https://github.com/bminor/glibc/commit/6128e82ebe973163d2dd614d31753c88c0c4d645

Reviewed-by: Carlos O'Donell <carlos@redhat.com>
Tested-by: Carlos O'Donell <carlos@redhat.com>
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 ...press-gcc-os-warning-on-user2netname.patch | 61 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch

diff --git a/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
new file mode 100644
index 00000000000..7068a81518f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
@@ -0,0 +1,61 @@
+From 6128e82ebe973163d2dd614d31753c88c0c4d645 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
+Date: Wed, 21 Sep 2022 10:51:07 -0300
+Subject: [PATCH] sunrpc: Suppress GCC -Os warning on user2netname
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC with -Os warns that sprint might overflow:
+
+  netname.c: In function â€˜user2netnameâ€™:
+  netname.c:51:28: error: â€˜%sâ€™ directive writing up to 255 bytes into a
+  region of size between 239 and 249 [-Werror=format-overflow=]
+     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
+        |                            ^~               ~~~~~~~
+  netname.c:51:3: note: â€˜sprintfâ€™ output between 8 and 273 bytes into a
+  destination of size 256
+     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
+        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  cc1: all warnings being treated as errors
+
+However the code does test prior the sprintf call that dfltdom plus
+the required extra space for OPSYS, uid, and extra character will not
+overflow and return 0 instead.
+
+Checked on x86_64-linux-gnu and i686-linux-gnu.
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Tested-by: Carlos O'Donell <carlos@redhat.com>
+
+Upstream-Status: Backport [https://github.com/bminor/glibc/commit/6128e82ebe973163d2dd614d31753c88c0c4d645]
+Signed-off-by: nikhil <nikhil.r@kpit.com>
+
+---
+ sunrpc/netname.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/sunrpc/netname.c b/sunrpc/netname.c
+index bf7f0b81c43..c1d1c43e502 100644
+--- a/sunrpc/netname.c
++++ b/sunrpc/netname.c
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ #include <rpc/rpc.h>
+ #include <shlib-compat.h>
++#include <libc-diag.h>
+ 
+ #include "nsswitch.h"
+ 
+@@ -48,7 +49,12 @@ user2netname (char netname[MAXNETNAMELEN + 1], const uid_t uid,
+   if ((strlen (dfltdom) + OPSYS_LEN + 3 + MAXIPRINT) > (size_t) MAXNETNAMELEN)
+     return 0;
+ 
++  /* GCC with -Os warns that sprint might overflow while handling dfltdom,
++     however the above test does check if an overflow would happen.  */
++  DIAG_PUSH_NEEDS_COMMENT;
++  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wformat-overflow");
+   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
++  DIAG_POP_NEEDS_COMMENT;
+   i = strlen (netname);
+   if (netname[i - 1] == '.')
+     netname[i - 1] = '\0';
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9400e1e9208..d9cae79ac2f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
+           file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1


