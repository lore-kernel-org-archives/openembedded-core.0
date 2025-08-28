Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91236CA0EFF
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 02:51:41 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.12125.1756349498552334663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 19:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AUaB9Y69;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so1172744a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756349498; x=1756954298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4afCeK9aY0MMmhsfbtPdZpQi+L7aU2qzFGOt5GNtxww=;
        b=AUaB9Y69RkvQX77uYyiSquELs8PnxqnvY9JENxNxhZjZXALnPagK6VQT28sPmYln7X
         WyyqnPEH96nKtTY8PwLxiwQr1WXQswpM7IX4e5FcmmcB+iabMDUDVt69W1AUjXmm24tm
         noXuz4TPizVm9v/cAbojpj67GDXgatXVIB2etsBAUDIyQbxRNWxViZCuj/8vkCvw40Hc
         bYSrXIyoQQHeXApN0QSG0GRqf9i9fJOv2/zdL2DVajcjSVjiMFyiRpntp+7NP6BzWyjD
         hGI8hL9SQ6932Al4qMzYbGm2ptjmr+m6nipLxVH1l2xNi7sQpzOpAFGp1QvSE3MzS783
         sCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349498; x=1756954298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4afCeK9aY0MMmhsfbtPdZpQi+L7aU2qzFGOt5GNtxww=;
        b=l5vQ1sz1zwMgUNeiYVZiuXHZQKC5dqiKKggmPiwm/d9tUJ49iY1w82hQnE6iHeAUqN
         WJNVemAmg9BlOx8BqUSt4/G7/CuQwhDuK8ErGX9s5cpg53IR/5a09x60jr/gcgQsBZ25
         UDKazPgnvGLuPlpNdgYyzKXxJXc+SaKdG1r6aVGJyvYV02KYprmPpYzTlaAAVXNveNpE
         s3DPLdQ+Qc5celDDx2HTeVa/v+FmlQglwQ/AICfNZdw3zd4q5aPS7PHJnyZrVh0wEwsh
         uJ+Ai15GmDtfK2hu+BLehgKknl5xv11N09GjXYczO2EZRheZvP26/a2XxQ4VhoYXk1fG
         O++w==
X-Gm-Message-State: AOJu0Yw+p9Tzp8kPoQDaLApQevnW/kPUEGuRXbQMXWp3OYqgunnojd6u
	GLMT8pBmkGrO1ZTvC158MokJ3WzXkc0TFuJY59CTg/Vjw69yFyQLdZPIfWsl/kse
X-Gm-Gg: ASbGncspxJEu3Eayd4xoIW9+KpXjTBW6Pb/T+/KXsuvBCf09dcp9Oz2On9zmkV2GtbF
	R0NeLOE4ZKXq6PhT0a8Izx5JkhYWUegfQJpCIj4kwqQXYJaC+QbyScJu6Eu7c/y0WputZCwhwEV
	1Yf5SLXdu10pIWLv+mkzr1zvzbZX17vWFNZGi9xrVGvceIikMj4hygbyRUeWOjGvyV82ccYp1j2
	ounqvyJ+KR4ufXfVyPam1k/X79jrOiRQIACDbXGD7ZEGzEutm+mCVDQs9CZStDOlDSgb7usLMrk
	csB/a9VKWyiW3VW15ifXgd3idG1M1uIvuL6DtWanNzMCpeI9bv1ih9IxM4RHG9PyC6YCdGN0Ru0
	usg60+F2NkTaMQs72dpYjF1hn8C6op5IzXTiKWSTew0H6uytxaOlOCfV/QYBQ3lPMbOYILwXGog
	6s5HJ9IK0ogQolzHsPImb/k3DI/dOf922WmbEBZB+X
X-Google-Smtp-Source: AGHT+IFZFdFKi/ik8jVDVWWaSjixXeumkujYgVypG62g5ovJ0bxZZOT6reTD0hEs9oR9wkwubbHu1Q==
X-Received: by 2002:a17:902:db01:b0:231:9817:6ec1 with SMTP id d9443c01a7336-248753a26eemr97403745ad.17.1756349497407;
        Wed, 27 Aug 2025 19:51:37 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248e3e0b75esm46695ad.8.2025.08.27.19.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:51:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lttng-tools: Filter out regression testsuite on musl systems
Date: Wed, 27 Aug 2025 19:51:34 -0700
Message-ID: <20250828025134.3747161-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222544

regression testsuite does not run to finish on musl systems, some of
the issues seen

* python is OOM'ing which is fixed by asking for 8G memory for qemu
* It hits the timeout limits of ptest-runner even -t 2400 does not finish it
* Use make -j1 and running run-ptest script directly ( outside
  ptest-runner to avoid timeout limit) causes it to run forever

Lets disable this testsuite for musl systems for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index 6f3fba1d735..e706e87c060 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -206,6 +206,11 @@ do_install_ptest () {
     done
 }
 
+do_install_ptest:append:libc-musl () {
+    # filter-out running regression testsuite on musl systems, it hangs
+    sed -i -e '$a\' -e 'SUBDIRS := $(filter-out regression,$(SUBDIRS))' ${D}${PTEST_PATH}/tests/Makefile
+}
+
 INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \

