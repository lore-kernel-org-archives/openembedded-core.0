Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42091C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.3412.1647298149959718946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YhzTSCsO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q14so26334919wrc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y7qs4B43dgSzMLub1bZGEGnbIZKMxbiacE0uvLY/r6E=;
        b=YhzTSCsOXxc6CJi5+nh82bbRIb7eDagr2BaGNY/PktdG0sEugMGphCcosWlbJkgkxw
         lLUPl/p4wqA2p20bdUQDwg/OtjjQJKIgecynvy7VejTtSloPc1JF4BZfZOmlr3+53PMs
         GfIt05JJs5R/Nkot1Gg0lW2Y63ZgNtplDrO/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7qs4B43dgSzMLub1bZGEGnbIZKMxbiacE0uvLY/r6E=;
        b=7ro6Vk2/t6atxO+4c0I1yCHqL0aCSCWZAKtzjjkZaJDr3V7CY0UjxP7tOBMo2HrGTT
         THrbXSlnatJzILjRRH2UQfppASkjJGb4iVzFMNtvHry4hum30JbhxmCpfxY1J5qB88ay
         zX1XXG5O1MbXe0WL9Ng7q5Q3DMW7JytvEDoYG0QFXMGPYL+qSHZ5iY2/M0RZiK9VcP2P
         da0ryzCjVGTC8n5U8YCk/Z1Kz/A0BPmZ6JUIpOW/VqJMZ5T60SuKyxkAidFyd/Ex8Qpp
         5ugzL73KxDbapn3Qpv0iLnWU5UDwCksNOHkCYXwQkQdROw63MqUewjtypsdKCCaLSDR/
         ma5Q==
X-Gm-Message-State: AOAM533c7lshV4d4goWocBSzdF8TP70VypVJinYUzmcN5VHYcBIKqW+1
	pX89aRY2KWyXO56ZKLnk45Mj/oUhfPpYdFBt
X-Google-Smtp-Source: 
 ABdhPJyldY18LxsxWUiLsFYEoWM3fl14q79uYfvEgeQGcN3wIgiFja+vz0R0srAMgu0Iu7L5S47DfA==
X-Received: by 2002:adf:ef48:0:b0:1f0:47ba:d4e6 with SMTP id
 c8-20020adfef48000000b001f047bad4e6mr18942587wrp.438.1647298148143;
        Mon, 14 Mar 2022 15:49:08 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 29/33] python3-cryptography: mark
 test_create_certificate_with_extensions as expected to fail
Date: Mon, 14 Mar 2022 22:48:33 +0000
Message-Id: <20220314224837.834776-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163195

From: Ross Burton <ross.burton@arm.com>

This test causes OpenSSL to leak some memory. Until this is resolved in
OpenSSL, mark the test as expected-to-fail.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../skip-leaky-test.patch                     | 19 +++++++++++++++++++
 .../python/python3-cryptography_36.0.1.bb     |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/skip-leaky-test.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/skip-leaky-test.patch b/meta/recipes-devtools/python/python3-cryptography/skip-leaky-test.patch
new file mode 100644
index 00000000000..64248d57bd9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/skip-leaky-test.patch
@@ -0,0 +1,19 @@
+Mark as test as expected-failure, OpenSSL is leaking memory.
+
+xfail not skip so we can remove this when OpenSSL doesn't leak anymore.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/hazmat/backends/test_openssl_memleak.py b/tests/hazmat/backends/test_openssl_memleak.py
+index 835c9256..639f6ba2 100644
+--- a/tests/hazmat/backends/test_openssl_memleak.py
++++ b/tests/hazmat/backends/test_openssl_memleak.py
+@@ -466,6 +466,7 @@ class TestOpenSSLMemoryLeaks:
+             )
+         )
+ 
++    @pytest.mark.xfail(reason="has memory leaks")
+     def test_create_certificate_with_extensions(self):
+         assert_no_memory_leaks(
+             textwrap.dedent(
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
index 11466ecece6..69eeeb1e968 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://check-memfree.py \
     file://0001-Cargo.toml-specify-pem-version.patch \
     file://0002-Cargo.toml-edition-2018-2021.patch \
+    file://skip-leaky-test.patch \
 "
 
 inherit pypi python_setuptools3_rust
-- 
2.32.0


