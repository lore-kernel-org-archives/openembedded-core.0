Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA141C27C55
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:10:39 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.16154.1717488630685764983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hxe2/ep7;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a696cde86a4so22579166b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717488629; x=1718093429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H2LDsetkgPixy+iRtZnHA2ho0u3Du+LeirnLPqLX1E=;
        b=Hxe2/ep7Me2s13syHzxnA2ti0mBzH9HqYkG2axGFTs8qvafgDv1wHhkV7l64RbEw3q
         F80NuEXFlJKhnzI9zYMVYiE+8WqcDyYmFF/BB8u28JZoVMn5YCp+W8xrjKouJ+0T3TlA
         Vu5ltGscpgRCbqrxB5bahq7vLzQbcztJc8yOwa7cF1T4GM9z2pib7nGCBPolzqTdY33v
         zKMaMVRQ5yIUavandtVjwuy2DCnesTIiQmwKe5fpbZ0QFmZOGEYgFYuZV5cjq3eYGyI4
         8yPLHzcjoPhJ1ePIY/isRE0jvwFBPsqgdxnWBcXSlmO0Qr5qXL8xEyGYz2BB1oi86+An
         WMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488629; x=1718093429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5H2LDsetkgPixy+iRtZnHA2ho0u3Du+LeirnLPqLX1E=;
        b=Ius3A45DQmwQhC8DrIW3cSQMEceDhbSrDGiRZAQxNgJEpyRQ7xpa+oqrw04m3UalcL
         dL2TYAFotfyZuTu3Y2Qm9k9N73v2igXXZGMxy/IQPTwnBngONZJiU/csA6Hyx/7yK0w6
         Ep+pmYpZR+rdF2bgZJHCKz+Z81nn93r69MuxnXmZ0mdxNdGdvYAGoY4dESF4M45jDWcX
         SGUWDpfdDUz671jTVw4rjHhD0TeeJl1LXL4FeU4ktMzzbdqWqmcjQGceXYyhg6U2JPE1
         +9Z9ImveLDhk8vtKwBsM3AUaxINtFU81fV0BgzelAnQZDWmBbZ9QdrT5CC5i1bODQ1O+
         6hlQ==
X-Gm-Message-State: AOJu0Yw7kZxrQ6Cl8pH/vQ8T9z2mPwU/uMpLrVSzGO0buhS2AeLr9ZDL
	qQFk387FzO2L78x0l9hyLnYiTMlQauQ6bvS7ihO7y85k45juzq/OYIKeIw==
X-Google-Smtp-Source: AGHT+IFi7YZGP6dnfA22HpkRJxyWrN0sdFw9KhlPBtxhqsrYUXooDoIi/EUASyho3BdIySYw4ZXMTA==
X-Received: by 2002:a17:906:2689:b0:a68:beaa:afef with SMTP id a640c23a62f3a-a68beaab1c4mr543597566b.20.1717488628836;
        Tue, 04 Jun 2024 01:10:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e6f0371dsm588331966b.42.2024.06.04.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:10:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv3][PATCH 2/4] selftest: add few missing Upstream-Status
Date: Tue,  4 Jun 2024 10:10:21 +0200
Message-ID: <20240604081023.38549-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604081023.38549-1-martin.jansa@gmail.com>
References: <20240604081023.38549-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200305

* these were reported in:
  https://lists.openembedded.org/g/openembedded-core/message/200282

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../devtool/devtool-test-ignored/devtool-test-ignored.patch     | 2 ++
 ...1-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch | 2 ++
 .../0001-Add-a-note-line-to-the-quick-reference.patch           | 2 ++
 .../devtool/devtool-upgrade-test1-1.5.3/backported.patch        | 2 ++
 meta-selftest/recipes-test/recipetool/files/add-file.patch      | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
index 96ea0eb4e3..389e00b2fa 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [this is ignored]
+
 diff --git a/ignored b/ignored
 index a579759..e3d7b43 100644
 --- a/ignored
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
index 6aaf409ebc..74d0836c77 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [please don't submit me]
+
 diff --git a/patch-me b/patch-me
 index a20b29a..5e35d1b 100644
 --- a/patch-me
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
index 4ea3d74f0f..457fce3a13 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
@@ -4,6 +4,8 @@ Date: Wed, 24 Feb 2016 17:43:03 +1300
 Subject: [PATCH] Add a note line to the quick reference
 
 A test patch so we have a file to move around.
+
+Upstream-Status: Inappropriate [too important]
 ---
  doc/quickref.1.in | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
index c4f3f12666..c39c65eed4 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
@@ -4,6 +4,8 @@ Date:   Mon Nov 18 18:43:15 2019 +0100
 
     Backport of the NEWS file from version 1.6.0
 
+Upstream-Status: Backport [v1.6.0]
+
 diff --git a/doc/NEWS b/doc/NEWS
 index 69793fc..fd49b1c 100644
 --- a/doc/NEWS
diff --git a/meta-selftest/recipes-test/recipetool/files/add-file.patch b/meta-selftest/recipes-test/recipetool/files/add-file.patch
index bdc99c94f0..bbaa365ec6 100644
--- a/meta-selftest/recipes-test/recipetool/files/add-file.patch
+++ b/meta-selftest/recipes-test/recipetool/files/add-file.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [test file]
+
 diff --git a/file2 b/file2
 new file mode 100644
 index 0000000..049b42e
-- 
2.45.2


