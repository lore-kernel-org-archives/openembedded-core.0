Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37171C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:20:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.15688.1708442452350695634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 07:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PuklzBEO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412698cdd77so11019795e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708442450; x=1709047250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejkE6C6pwD1MkmY3qghxjyELimdOB5uTESunHqOfGKI=;
        b=PuklzBEORstYT3Kbx3P8Jlc5kVb8dsC86SDPslpXt0XBW6u+3MZgyTU3S2kXaPdyPX
         Zm/ybnOTa8uSMHZu5AlMRjLvXJ6uNIxWrLXpCGKq6Cq8TjT4fEK5XAWNt8vvV3ixzKlL
         4v4gu2Vt+0M/adoWx4rLzGM4ULmE7Qcvvj5JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442450; x=1709047250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejkE6C6pwD1MkmY3qghxjyELimdOB5uTESunHqOfGKI=;
        b=NKWJktmp83UEwZdGQ/WBcvjuI6yR7ZeAZpD1rIkzlyVAOUZNQM4sZwK+LcPSB3aszJ
         Qa/1TBWhpPf0Xtek6nzOnmP5oXDVxrXOKhsQ7ykvh03/OBGSK1e0mBEA7MgyWFDkWeI9
         3f40cWLmRx8X2cqAwVjt9XUoppUDPl0EjWbxvdwc4a3wgFaC+mz3XAxAFzKSLFGMvyhs
         1g+g1ag1ZRfbM6W4idSpuWsBdv7/NQ1exe1Ji+XFQ8VS/o1XssIJogCQjKtVvYla5Ovz
         6wXq9ia+Uj0C3IhWssLjhqZvdrMmMi+kKYsaYR601lkwYsJLXLxgKrLY4tPvkKZRJpXX
         cgHg==
X-Gm-Message-State: AOJu0YwV5TQlbdj4KPBN7zHvvnt+uHjAwQdYy+KPum4olBvdGUNyNiD9
	d5fEocwtzKVMVHhc6szBkOJEnlvww51ioVPLKzJFBORd0Lx9ErVbeDFvNAZhv2bzIsTlIxRhCh8
	R
X-Google-Smtp-Source: AGHT+IExePvfze+m8yIMjfIzpvvzXoaow0cbIJvT7mAC0DoACI+ihiMnNi6Iwi9VtSN9EHPn5Cybhw==
X-Received: by 2002:a05:600c:1d1a:b0:411:db41:687c with SMTP id l26-20020a05600c1d1a00b00411db41687cmr15231841wms.13.1708442450500;
        Tue, 20 Feb 2024 07:20:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b883:fc21:a202:c294])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c459100b004124907f43fsm14374151wmo.12.2024.02.20.07.20.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 07:20:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-ust: Upgrade 2.13.6 -> 2.13.7
Date: Tue, 20 Feb 2024 15:20:48 +0000
Message-Id: <20240220152048.683706-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240220152048.683706-1-richard.purdie@linuxfoundation.org>
References: <20240220152048.683706-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 15:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195919

Update one of the patches to account for upstream changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Makefile.am-update-rpath-link.patch       | 12 +++++-------
 ...g-ust-common-link-with-liburcu-explicitly.patch |  7 ++++---
 ...gust-Makefile.am-Add-install-lib-to-setup.patch | 14 +++++++-------
 .../{lttng-ust_2.13.6.bb => lttng-ust_2.13.7.bb}   |  2 +-
 4 files changed, 17 insertions(+), 18 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.6.bb => lttng-ust_2.13.7.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
index cbbf1df812a..6aca8f85faa 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
@@ -1,4 +1,4 @@
-From 06279f50e924d1d55b43eb3b299f6633ecb1f7a4 Mon Sep 17 00:00:00 2001
+From 7d053804ab3823d40ae10d90f4efc49dbfb4cb66 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 22 Sep 2021 16:33:10 +0800
 Subject: [PATCH] Makefile.am: update rpath link
@@ -13,15 +13,16 @@ ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/
 Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/61]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  doc/examples/Makefile.am | 2 +-
- 1 file changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index 8ee0564..20d246c 100644
+index 57782cc..d46caa6 100644
 --- a/doc/examples/Makefile.am
 +++ b/doc/examples/Makefile.am
-@@ -142,7 +142,7 @@ all-local:
+@@ -167,7 +167,7 @@ all-local:
  				CFLAGS='$(CFLAGS)' \
  				AM_CFLAGS='$(AM_CFLAGS)' \
  				LDFLAGS="$(LDFLAGS)" \
@@ -30,6 +31,3 @@ index 8ee0564..20d246c 100644
  				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
  				AM_V_P="$(AM_V_P)" \
  				AM_V_at="$(AM_V_at)" \
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
index d3c451fd2bc..e85dbdb4398 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 2058584b7e87d6bd9d1765577766e0df7752232c Mon Sep 17 00:00:00 2001
+From 27402453f25fbdb5a9fb1a1b88d1c4d9852187d2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 5 Sep 2021 10:44:19 +0200
 Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
@@ -7,15 +7,16 @@ Otherwise linking errors are seen on x86-32.
 
 Upstream-Status: Submitted [by email to lttng-dev, Francis, Jonathan]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  src/lib/lttng-ust-common/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/lib/lttng-ust-common/Makefile.am b/src/lib/lttng-ust-common/Makefile.am
-index caeea2b..30febf0 100644
+index 1ccc290..6531fa0 100644
 --- a/src/lib/lttng-ust-common/Makefile.am
 +++ b/src/lib/lttng-ust-common/Makefile.am
-@@ -15,6 +15,7 @@ liblttng_ust_common_la_SOURCES = \
+@@ -16,6 +16,7 @@ liblttng_ust_common_la_SOURCES = \
  
  liblttng_ust_common_la_LIBADD = \
  	$(top_builddir)/src/common/libcommon.la \
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index fd9b6ea7ff8..7c49583e0dc 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,6 +1,6 @@
-From dd1fdc841d069dbd4e284f430a88af79de951124 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 26 Sep 2019 17:54:00 +0800
+From f65efd963e52de51d35e2e03fb773f33dd64f565 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 20 Feb 2024 12:19:06 +0000
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
 
 Otherwise it may install to /usr/lib, but should be /usr/lib64 when cross
@@ -15,15 +15,15 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python-lttngust/Makefile.am b/src/python-lttngust/Makefile.am
-index f95482d..f76d95b 100644
+index d53e21d..283901e 100644
 --- a/src/python-lttngust/Makefile.am
 +++ b/src/python-lttngust/Makefile.am
-@@ -32,7 +32,7 @@ install-exec-local: build-python-bindings.stamp
+@@ -45,7 +45,7 @@ install-exec-local: build-python-bindings.stamp
  	if [ "$(DESTDIR)" != "" ]; then \
  		opts="$$opts --root=$(DESTDIR)"; \
  	fi; \
--	$(PYTHON) $(builddir)/setup.py install $$opts;
-+	$(PYTHON) $(builddir)/setup.py install $$opts --install-lib=$(pythondir);
+-	$(PYTHON) $(builddir)/setup.py install $(PY_INSTALL_OPTS) $$opts;
++	$(PYTHON) $(builddir)/setup.py install $(PY_INSTALL_OPTS) $$opts --install-lib=$(pythondir);
  
  clean-local:
  	rm -rf $(builddir)/build
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
index 424b0fa645f..9509185badd 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "e7e04596dd73ac7aa99e27cd000f949dbb0fed51bd29099f9b08a25c1df0ced5"
+SRC_URI[sha256sum] = "5fb4f17c307c8c1b79c68561e89be9562d07e7425bf40e728c4d66755342a5eb"
 
 CVE_PRODUCT = "ust"
 
-- 
2.40.1


