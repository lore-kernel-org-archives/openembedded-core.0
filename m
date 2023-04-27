Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06578C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 09:35:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.16197.1682588100422716682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 02:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iKE+wztG;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b62d2f729so6459162b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682588099; x=1685180099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qgWL2YtC9WJ+qXzpD6jPXyC93O3erlQpxz4SfAnuAQ=;
        b=iKE+wztGK+BQ/iDhTU0y2wQSNHm9VYK6368zSL1yFVLnu+8JC+HwS/Br5TKM3E3Fzi
         fDEKlEw2UZn+op20IxO/VWgArRC5DKY0ZSX1/vqvtCKjZetWoGYrI3slC8P8BCk46Rd1
         pfhv+bhPMN8gHTFqG1MvtIBBQquapZUYXeW9BXv1pPcKcP+bWmV8Ej68d6e5RVeISAF4
         DKug33BXIIQq0rvl5vnBfKPQJBZ+0MN0NocvAzi4hlDidfPIlw8Vl9EyM0VLMPtMVWOV
         uu399pieS4R8ceNBq25oTZu+7W9Spx6xERZ5zDYVJIQ4E+3GEAAStIG/1tiOPD6MPqxb
         N6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588099; x=1685180099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qgWL2YtC9WJ+qXzpD6jPXyC93O3erlQpxz4SfAnuAQ=;
        b=l6cHm1mzvBHp26UsQp5ZQ55Lmdu/ebPgz1x1nMTRbqwwY9jPdrrn7h15fnhJK4BnBr
         oX9v2XFVOc9DC0r0EHMDiMLFiN5kUgwAuxNs94w2YGE8PhcJ2f52XWop/3wLXwIv6haC
         AMXNMMJfcaguXMAH9FwsN4FMtJ4ibqTxc/4DHng9Cz16fS4/q4ZnSwv8xspRN6Zw1Eg8
         PQBLZE847CFhhZA4NsDc+uM7yHvB8iVKaMZy/tZRd3qbC+v0oZu0+/JvYcluU+ufITGd
         BKIvY/hRzo7Os6u5Gu28Bm4Vvu86C7+UyqzSG9G6aEufSRgZnYtiQDHZ789oumCtHN/u
         QElg==
X-Gm-Message-State: AC+VfDyMEgQpGfI595sezNJ1DKScwp22atlWOBqcmUMF8IK2fFfYKl1n
	6EoTFT2VbKbyQSKr/z2EOPe26h8m+Fk=
X-Google-Smtp-Source: ACHHUZ5mKIybWmXvAw8epwEQ2z8VTD2ctk9/UJ4F1eJq7y1BK5e+zZoyq06nLS8gY3wDcEuaWXXWmQ==
X-Received: by 2002:a05:6a20:9f46:b0:f0:dedb:83b8 with SMTP id ml6-20020a056a209f4600b000f0dedb83b8mr1052242pzb.19.1682588099002;
        Thu, 27 Apr 2023 02:34:59 -0700 (PDT)
Received: from localhost.localdomain ([223.233.80.206])
        by smtp.gmail.com with ESMTPSA id o23-20020a637e57000000b0050bf1d1cdc8sm10986604pgn.21.2023.04.27.02.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 02:34:58 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: virendrak@kpit.com
Subject: [meta][master][PATCH] qemu: Whitelist CVE-2023-0664
Date: Thu, 27 Apr 2023 15:04:25 +0530
Message-Id: <20230427093425.34932-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 09:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180491

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e2453dd8bc..c755d0dca3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,11 @@ CVE_CHECK_IGNORE += "CVE-2007-0998"
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


