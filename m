Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFCCC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 09:09:41 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.15890.1682586579348193332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 02:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P3D9jaEF;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso10300834b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682586578; x=1685178578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZcxEkraoaQLqVgOUGFaAme6XFeoXXP/VvjuzHEgceo=;
        b=P3D9jaEFiycYpMzGo/zshigHfIgJYi30TsRxEBpuVt2537EMiMP/cx7iKHxKTP1cU0
         PGktyQz9AQAGJUqWUOSXuxJqlIzZNIdOzQE/iB5YqBMjogCTAadC3HGPPCA6QbTv5dh8
         nNrXHkjdqODP6Q2d++SgKWPUeVgGGAjViA/vArR4sxjxc98vOFHTQT8+JNK8FLdQMqLU
         NFskuy+jRSGhAgHZWBirGeKU3TlpF/FaZWiw9Q50UptUD3BZcYWf35uFksabWQamTvvI
         iV+e2bbsyWivuWfnsoCOoahMMHP1xyBBOUruK654L760yl3KJiQV9d9QJhwwpzYLOdoN
         qEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682586578; x=1685178578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZcxEkraoaQLqVgOUGFaAme6XFeoXXP/VvjuzHEgceo=;
        b=Ba+XusNm9S40fCh6u4yNDNydD1MG3Vc/uHppqmWuRU2CPT7giY9LF9aV/tqNb7JUsY
         aCaR6SeTuNbCUKtBjxIIE8otIU5Q0CHfFJPzOQ+JpePBJX9EiMnq4rTIZGiDQwOkXaZl
         OWIZKsXatC63WjDYUz2ZO8mxXXQWGtWMlF4yXysyNoiEKh8YzhUq/DxyKxMqmxRnAUSu
         pPd+VmvpnbL7AeAKfk1Hey1Z+WICv9LtwbnXxbas9Z9U1iEEgBvjRU/iCH5OqERlIxk1
         A0Zu8XKVTOTaLFBIKGeGig+9thO97Dq9mENzwMUyaIslrqrm3HqsQWZeOxOcI/10IXUD
         vgGg==
X-Gm-Message-State: AC+VfDwxO73KRVr3mBzR1TTLQYYGfNsJKW3FXU2bgJG+cCl1crtd9lRo
	QQECS9WQcymkS89GeuLR6GkvOmgW8jU=
X-Google-Smtp-Source: ACHHUZ6e4KDrEZfQv820luV5Axb2FyXMWQfPYlobhIA6FsQ4WfpWT/+NK+j9GrlHk9hOay7Cq/ot0w==
X-Received: by 2002:a05:6a00:1350:b0:635:c8e4:ed0f with SMTP id k16-20020a056a00135000b00635c8e4ed0fmr1307753pfu.11.1682586578362;
        Thu, 27 Apr 2023 02:09:38 -0700 (PDT)
Received: from localhost.localdomain ([223.233.80.206])
        by smtp.gmail.com with ESMTPSA id ei23-20020a056a0080d700b006410f4f3ecdsm1498053pfb.83.2023.04.27.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 02:09:37 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: virendrak@kpit.com
Subject: [meta][kirkstone][PATCH v2] qemu: Whitelist CVE-2023-0664
Date: Thu, 27 Apr 2023 14:39:23 +0530
Message-Id: <20230427090923.32860-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 09:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180489

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a6ee958e4b..7f2b52fa88 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,6 +112,11 @@ CVE_CHECK_IGNORE += "CVE-2007-0998"
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_CHECK_IGNORE += "CVE-2018-18438"
 
+# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
+# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
+# this bug related to windows specific.
+CVE_CHECK_IGNORE += "CVE-2023-0664"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.25.1


