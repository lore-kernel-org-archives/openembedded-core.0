Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.7842.1614526639036851827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DjpHOsWq;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a22so23515961ejv.9
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=44d191s1f5w6onB+AJTb58sKMrG/6yNR/YVmizNdnFw=;
        b=DjpHOsWqABVA4zJNKw0Aokd4dBWox45W9p+Hd7KWVQhxJzlFHQSen3KZiLlGa6RwvA
         wZ4qexfX288PJMSttIeWWMt0l5wz1ZEFBW0dPck2T7OKt0JvjDYDE8vH0TpcY6W4RKUR
         wlHiLwMpem+KZ9VPeB10mdQYq8R2fUtul7pNXQekv1xDQIVqOFlrBYA5lNKon69HKQEA
         Ejc0md/eAl6Cc8rkWC/KWbOcOmqy2Ck3rX7GPjcLdGKwKVcY8P34sRn/8guEqHPz2tLg
         O11lg2SNBsf/bP2dI31UStgqZr10mDRVbZOeSTxFG1zBDrJSECf7nXtTVn7+DUWlUoVi
         USUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=44d191s1f5w6onB+AJTb58sKMrG/6yNR/YVmizNdnFw=;
        b=pdpzUuJYc1Wf6Ad+0UOszCdtHG6uKaLV6OzNjBKejISvLjQDV2RfsJss3J9dTEKBqN
         uawZlNactuzI+S1DuCXHECflW8kRXFlOYsN3qj01WEOGbnnAHDBoUZP22X9rX/41foMT
         aefTZlh/TZTJP4EiAP8z58vBDKO2Jd9oXNHXcJm6knkkabJkSlaTifRZSi2VnmHNg0g2
         LyUjuZvzP6Y1TOMRdk2x6SlTxZ3Z7NnWMzO5K/b4cG3SBxSFCUn+t+P/acn3yAof2NVA
         na9/Z3kHkFCCikgnCcGcQGwe8zGzGnT4mKVhhFO5Wvcq03a20YdesOAT6DmVgLCjErii
         5bmA==
X-Gm-Message-State: AOAM5334yERgwU7E0peCV8eAqe2JFQ47rRahKLMiE3q0asgNU6S7Rc82
	SDRINfHcnusgl1ygfgZH4LH/YGx/eWLyOQ==
X-Google-Smtp-Source: ABdhPJwcEl0MNxXiW++4Fjfp2CWIwyhjwWs4qxE79w7zmtq71J4x+0nG5WzKHp40X3O+e1gOahEmYg==
X-Received: by 2002:a17:906:ad96:: with SMTP id la22mr12528201ejb.237.1614526637642;
        Sun, 28 Feb 2021 07:37:17 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:17 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
Date: Sun, 28 Feb 2021 16:36:46 +0100
Message-Id: <20210228153702.498275-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sdd a patch to fix musl builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...h-include-the-correct-header-on-musl.patch | 31 +++++++++++++++++++
 .../{libdnf_0.55.2.bb => libdnf_0.58.0.bb}    |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.55.2.bb => libdnf_0.58.0.bb} (93%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
new file mode 100644
index 0000000000..734521bb3f
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
@@ -0,0 +1,31 @@
+From 8cc7ada0161a7af38351d1e70516975402f3c5c5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 26 Feb 2021 18:37:41 +0000
+Subject: [PATCH] libdnf/config.h: include the correct header on musl
+
+Problem reported at https://github.com/rpm-software-management/libdnf/issues/1146,
+but this patch isn't quite the fix.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libdnf/config.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libdnf/config.h b/libdnf/config.h
+index 16121f6f..51623ce4 100644
+--- a/libdnf/config.h
++++ b/libdnf/config.h
+@@ -18,7 +18,12 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
++#include <features.h>
++#ifdef __GLIBC__
+ #include <bits/wordsize.h>
++#else
++#include <bits/reg.h>
++#endif
+ 
+ #if __WORDSIZE == 32
+ #include "config-32.h"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
similarity index 93%
rename from meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
index b34bb5de01..eea410af4c 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
@@ -11,9 +11,10 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            file://enable_test_data_dir_set.patch \
+           file://0001-libdnf-config.h-include-the-correct-header-on-musl.patch \
            "
 
-SRCREV = "d2d0ec98fd2e0a2623123fb1ddf8fdd8936c6046"
+SRCREV = "85278894f21bc1957dc47a2a09ddacf59bc3cda8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

