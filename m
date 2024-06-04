Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B3FC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 09:03:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.16705.1717491827438897371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 02:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a9kIvns3;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b82d57963so5455329e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717491825; x=1718096625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H2LDsetkgPixy+iRtZnHA2ho0u3Du+LeirnLPqLX1E=;
        b=a9kIvns35v1k0I+Mj9t31dd2XPOuF3OoIPK/MARu0wMFqtGp3Z/s94uc8JD2xr1jGO
         7GB56Nu6n+iMbu1M1QD142MpvrMNF8monjTx1cAreUFsp6Vidq8fyuvZ+TI1n7sO+lxY
         RGnUe9E1X0JAtdeKrtbxvgE08Y/FCOIjce2o56gFfZtxuJMKPngmsUW0GYUUwQOqM6iK
         HtitWy36k7JA/FJxhL3WWUigxbYMV2HVGIxgrJhgFTchdiCzWv9xPw+4S3nUScLcYzp0
         GAcM/Jsh/5C7xtEQtmhMQhecPnBaAdclpfdpM0YL/X15fiTRwWGG47vIcfo+8UScku/f
         7vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717491825; x=1718096625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5H2LDsetkgPixy+iRtZnHA2ho0u3Du+LeirnLPqLX1E=;
        b=IpPplVtM71bfmbnwqP4Tj8lfaB7hE0gUFhJ+tQqiMbLy6nMvVNgUNBItWRxEBVLBSy
         14N4eWLyxA3kXivncJc1fgoinVM6/RhzQG9MpuVC8Eu4Qkbo+Ta5GhLKI+khciNLNhT7
         G+6nHcd+rYSoiPt3R9eMiEyIS3vQsI79hYh/J1oZdP12fvcONyzKYrNzT63Cx93FfcVc
         bAgH9y97dMFKiLj4Z+3V3NIuGKKoI10Ns1FfL81cqolIHdVEZvP+YpaJyTYYxNv4jDSI
         ODJjWKQbmjMzij9JQGFuQHyUZCP77Yc1/aPnCw97qYOK+5h2ACjc3U+7wq+llgRqTcHh
         Ofdg==
X-Gm-Message-State: AOJu0YzuBz13HmWpHnWLJj8Q2w1gEqWCLWmTvnSNBpbfPi22IEd0aHmw
	NbVQ9KuUDxQQGqgI0+l85C9bME5/5t/am2dBopT6qshKFezOhlpWhVvZ7A==
X-Google-Smtp-Source: AGHT+IFR0us7nCBpBh/fImeN8WoA55QDTq3Uc2SjbGI5Rw0n5vS5cZRX4TN5P95JI7dhX2hibdgVcg==
X-Received: by 2002:ac2:4942:0:b0:526:f4bc:beeb with SMTP id 2adb3069b0e04-52b896ace4dmr7041689e87.32.1717491825248;
        Tue, 04 Jun 2024 02:03:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb825esm6966392a12.32.2024.06.04.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:03:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv4][PATCH 2/4] selftest: add few missing Upstream-Status
Date: Tue,  4 Jun 2024 11:03:39 +0200
Message-ID: <20240604090341.45444-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604090341.45444-1-martin.jansa@gmail.com>
References: <20240604090341.45444-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 09:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200317

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


