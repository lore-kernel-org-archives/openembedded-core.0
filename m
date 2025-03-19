Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BF2C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2925.1742372191231995861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0MRAFVF;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225e3002dffso73940525ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372190; x=1742976990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=G0MRAFVFhVU72jVnqRvFOZOq1taiDdDGz/17ObbjEfajRo/a7AzWp9Sn5Qg31qMaPu
         ntdCCnf4/dIRYLTCzWtw4DyKSWaXvTOyYSae/Bh96forqTwEC273jqhS4Ho36JavM1DM
         Fyb2/PkRgHDRVd+fAgf9iUDsEWHioa/56ZEnSzkl25p9FNNDX3+b+JlMVZN+5py8dvMC
         /3zEoYP8Ta2qy1sAHRtvCI7rxj0TET7KJl+fHQKNLJI19GGrPJr3Ea4WZmG1IvZPwge/
         xWjmEV0Cl3CX2z6NLz/LvXdabTy9Q2SxRKTZMo1i69UiHiJ+dduwH/2VMH7Ce7/JT3Ih
         PrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372190; x=1742976990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=WGwbCr+g0FaWdctaE3+r5rTAVBAq3SOtPF+dW37L3GpD7Ivxn4yS+ZWihnU8OtNdgO
         XDHid3U3tu9Cr7prd+S2GNnP7zJFWMOHKEBpqQabhPQzIipx8GjYxOwwBK8h6yetZV7K
         Mda3F3+sUjhNk96OLJhFki24AZtl9/2RcahNJION3pZOVT2u8YpKnZ+6EEIGoQCvNcLO
         FYiQme+qyKhzPlboucS4HAHm9Ny07vmfbUqyZ+ZwMrb71SILWPkLMt0Rbr7Pdz7UMHFA
         il/KwZTHdHpu/VWMyicMunFEtaH8YiT4FF35SqGzqkLsnW52Lo6nxBtcRqvz5kHqZmsW
         H5cw==
X-Gm-Message-State: AOJu0YwFYvGjxj11eEEl1pZyktBZBXtjUaRMLSYFEp5enuCk6+e272rv
	4TrpAPcdV6u5O+qJKmZyvkh/1yZgjo6CWlVJUda0ZjLf2yzWyokQPMVCVyVe
X-Gm-Gg: ASbGncvx4UJd56+iNRHcnbYF6zmjKxB5HRxSp7JRmyzpXzwt3NGHNkPEIOyC75xzoKB
	CjenriH8JGXrClhbGdu1lzf1Pj1y8NfvTdsowDnfrB+4v9xbo87EP1jinHlljHTDKtGjmyMP+J8
	h3h4X5V0WjxP8GVFrEh+KsXjVbarjfLetm59HgJ/xspJOQVieU+vIOD6AW3ihiadeW7eXz9FDpH
	HJzFvt5Of/MgAnfR+jRoOhxln4MWNetLV5BA/6GUQtO2yhGv7c4OS7odZWg21/GCVsb3xtHZl68
	rJLvOYmHoSm0rH16LfuP/weDNhRuDx+BRkTpF5Wx5JbUZHc=
X-Google-Smtp-Source: AGHT+IFf77Hlsc67H20eHyiXXz9D3FAV+p8eyOSHhpv0OMRfwP9+nnQAcZu6AL3ALyi86zgtmAWqGQ==
X-Received: by 2002:a05:6a21:50b:b0:1ee:e785:a082 with SMTP id adf61e73a8af0-1fbeae911ddmr3057117637.1.1742372190411;
        Wed, 19 Mar 2025 01:16:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 16/27] makedumpfile: Fix build with GCC-15
Date: Wed, 19 Mar 2025 01:15:48 -0700
Message-ID: <20250319081610.3536475-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213286

fix gcc-15 compiling error: too many arguments to function eppic_init

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-compiling-error-too-many-arguments-.patch | 43 +++++++++++++++++++
 .../makedumpfile/makedumpfile_1.7.6.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
new file mode 100644
index 00000000000..90f1b4038be
--- /dev/null
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
@@ -0,0 +1,43 @@
+From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
+From: Coiby Xu <coxu@redhat.com>
+Date: Thu, 23 Jan 2025 17:47:10 +0800
+Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments to function eppic_init
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2340813
+
+When building makekdumpfile against gcc-15, the following error is
+shown,
+
+    erase_info.c: In function ‘process_eppic_file’:
+    erase_info.c:2226:13: error: too many arguments to function ‘eppic_init’; expected 0, have 1
+     2226 |         if (eppic_init(&eppic_cb)) {
+          |             ^~~~~~~~~~ ~~~~~~~~~
+    make: *** [Makefile:109: erase_info.o] Error 1
+
+Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
+
+Signed-off-by: Coiby Xu <coxu@redhat.com>
+Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
+---
+ erase_info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/erase_info.c b/erase_info.c
+index cbe1681..af6bfae 100644
+--- a/erase_info.c
++++ b/erase_info.c
+@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
+ {
+ 	void *handle;
+ 	void (*eppic_load)(char *), (*eppic_unload)(char *);
+-	int (*eppic_init)();
++	int (*eppic_init)(struct call_back *);
+ 
+ 	/*
+ 	 * Dynamically load the eppic_makedumpfile.so library.
+-- 
+2.48.1
+
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
index 21847ece6b8..46be13e7d0f 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
@@ -26,6 +26,7 @@ FILES:${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch \
 "
 
 S = "${WORKDIR}/git"

