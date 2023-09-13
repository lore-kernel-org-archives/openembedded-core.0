Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFBDEEB59A
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 06:25:02 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5726.1694586300320470162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 23:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cpQakWvy;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68fb71ded6dso2482191b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694586299; x=1695191099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18Ywu3/PNKGnNwiZKyAZeuCGhQdYV/6Bj53y+0VxymM=;
        b=cpQakWvyJEBbnSQi2vZ8DSAQqKrHe1CAAre+WnX2viNGvV1EEt79jZ2szBaiIIg7bU
         DqZ9Q+5TSP8IizOXEseWQxjDZj1Ucgyh70xG6ZZrzlHjSN5K1L56nxWPCVDEpioXQ7jc
         dC9c29tl9Fbz7Dqx9ai0Vj6+zx/o8eAWJkCvfsMQ//As+Vkr4ACuK3lQQ1JgHY5+tuBg
         IxdomGi0eIUYtFeCNUWqfqPdEKuispUxBWKcwxnhpqVe47XgwMGZI903qHxOA3SL73Y2
         nMMX0P8Ak5fR9msMFq+Iri4kB/wUkKgB9bHC4HFo+WTG+dcqeolJ0YFdwmPXFlC0D+8M
         D3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694586299; x=1695191099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18Ywu3/PNKGnNwiZKyAZeuCGhQdYV/6Bj53y+0VxymM=;
        b=c/+oMqB/z3KvIXN++Tc+lhCxLyCcThP4A52KZK1J4dwNn5hhtBoUcGOHoh0W4kt7IT
         d5W5/Krq/T+omAmtTDAF6TDZ1thy8XeXk3SDJ9Rq2bk8BJQGUo5rMlkQgvr/67J0921R
         5QZgiWkol50vEQNaopEYf34cTkxkTVrgGBKzOidYVjJqoZv/0ilX/iEBTsemUwzlqldw
         R4jvLLjCvbLrAsCtdioqK6iMfFZYIvZntESfW6trmPyyj5DTgDffqB++EirZsjTcv2Mu
         oRzUupbHE2rX39Oxb2++DxpbQkDAFHslyM7lBUxrxbBHUHbnF2GzNaN82LgMoHOyWp/E
         PtkA==
X-Gm-Message-State: AOJu0YwLXwgbF3xNRfAi0n2DtG/bofNyF/wV3JpXx4pu52eLD4wsx9O+
	R3NTAj9VWAf0lLjpZWEyMM3hCHzE2LZQcw==
X-Google-Smtp-Source: AGHT+IFoPraWcU/TJDoS7qw2dZvkwEnq+9P3oOxGnVMjGl580mL+h2SFrshA2+R+Gehc+H87Sr++gA==
X-Received: by 2002:a05:6a00:b93:b0:68f:d35d:217e with SMTP id g19-20020a056a000b9300b0068fd35d217emr2153100pfj.2.1694586299308;
        Tue, 12 Sep 2023 23:24:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id q12-20020a056a00084c00b0068fb8080939sm5498095pfk.65.2023.09.12.23.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 23:24:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] coreutils: Upgrade to 9.4
Date: Tue, 12 Sep 2023 23:24:54 -0700
Message-ID: <20230913062455.2856264-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 06:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187550

Drop a backport which is already in 9.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../coreutils/stdlib-mb-cur-max.patch         | 33 -------------------
 .../{coreutils_9.3.bb => coreutils_9.4.bb}    |  4 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
 rename meta/recipes-core/coreutils/{coreutils_9.3.bb => coreutils_9.4.bb} (98%)

diff --git a/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch b/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
deleted file mode 100644
index 732fa5b6f23..00000000000
--- a/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ca6c179226864bff23f2b062518cf885bb42ce56 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Thu, 27 Apr 2023 15:26:37 +0200
-Subject: [PATCH] stdlib: Fix error when cross-compiling.
-
-Reported by Pierre Labastie <pierre.labastie@neuf.fr> in
-<https://lists.gnu.org/archive/html/bug-gnulib/2023-04/msg00220.html>.
-
-* m4/stdlib_h.m4 (gl_STDLIB_H): Provide a 4th argument to AC_RUN_IFELSE.
----
- ChangeLog      | 7 +++++++
- m4/stdlib_h.m4 | 4 ++--
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/m4/stdlib_h.m4 b/m4/stdlib_h.m4
-index 3274ea4948..f47c1eb37b 100644
---- a/m4/stdlib_h.m4
-+++ b/m4/stdlib_h.m4
-@@ -66,7 +66,7 @@ int main ()
-   return result;
- }]])],
-           [gl_cv_macro_MB_CUR_MAX_good=yes],
--          [gl_cv_macro_MB_CUR_MAX_good=no]
-+          [gl_cv_macro_MB_CUR_MAX_good=no],
-           [:])
-       fi
-     ])
--- 
-2.34.1
-
diff --git a/meta/recipes-core/coreutils/coreutils_9.3.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
similarity index 98%
rename from meta/recipes-core/coreutils/coreutils_9.3.bb
rename to meta/recipes-core/coreutils/coreutils_9.4.bb
index 83b78d075f8..13a637baf86 100644
--- a/meta/recipes-core/coreutils/coreutils_9.3.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -16,11 +16,9 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
-           file://stdlib-mb-cur-max.patch \
            file://run-ptest \
            "
-
-SRC_URI[sha256sum] = "adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa"
+SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 # 
-- 
2.42.0


