Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1A4CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:28:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.112959.1697444906020988945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLy10WUA;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso1508740b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697444905; x=1698049705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ8NpRTVdm/08hwPtoQzALgqz7xc43mme+0XsibbnmQ=;
        b=cLy10WUAUPx5AUSpwwlcsxjSlwr2UAOrfhC9HAtrCyqihya8PsL0++7hu6nUZM6/Al
         MN27dPAMWCeN802hhrPsOhc+M9zoRL8jwUjk1cji3uSbWwR5ZUXvUuIf1k+Q/Q/zTsp6
         sI110mUO2gzE5GGNJIoas4RXIozP2l0Ml3oxzmUxbYYK4pvrTxfLWxRWyz/QQFGdrCtd
         bDiSU3Lkxz/L+QReyX5LrofmfALEgPta9JDoqhyBg3/REkXvW79sUhVjeUzS2zh1PZLh
         YJB1BrTkRTsgClx7ZOpiEzScJ+dcsvAFWHsrSiPWxuUNeQU6q8OVnaz6XyG2vdi+Gt5C
         b6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697444905; x=1698049705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQ8NpRTVdm/08hwPtoQzALgqz7xc43mme+0XsibbnmQ=;
        b=Klp0s6GFRs5OhOpaTXQFYFlVNCaR4nnL4O4rrnN7U/tt9lews4XjMSHaOs5sj3+ebQ
         UjzAOudYoil2/a/imlhOVlnGWX4lHFXIdMOuTnTqGpgT9aknR6a3C1VFBLZIfd/dJjmL
         cUWRRDuoodn5mpS2y0sbVMPuED33ouwOP5egQAj45GSfu8sKArgS3dzovBb+j0XMeOUN
         EVoflB8FAkMVQOlrGRlkoc9AhuyHwjqSCf0bc9d5b9E7/gu31zVDvcnuG2V4o0PkXnm1
         qGqGbtzB1JOOypO8TDMgrI3KXIR4qS8RINnwkkgY/l0RUreI1LKyDmX9OGgNZ04QBTLD
         Ci4w==
X-Gm-Message-State: AOJu0Yye5GU2D1nFDqhgYbRfPqbNTqlwOACM8f7QgFf8gV6jfz9Tggai
	YT5vXTAp7eQOa9xMK5cHXxR4NTEvhHU=
X-Google-Smtp-Source: AGHT+IGvZ3FLRuLTmbZb02O2/Yb8Jom81Vdft7Z3RY6pyUmmxv2bTJ74FuTzfhbDllmBF2sVZ2L2QA==
X-Received: by 2002:a05:6a00:a29:b0:692:6417:728a with SMTP id p41-20020a056a000a2900b006926417728amr13146186pfh.14.1697444905210;
        Mon, 16 Oct 2023 01:28:25 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c9a:c74b:230f:a25b:2132:c022])
        by smtp.gmail.com with ESMTPSA id u21-20020a627915000000b006b2dff03b3csm5518875pfc.113.2023.10.16.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:28:24 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH V2] libwebp: Update CVE ID CVE-2023-4863
Date: Mon, 16 Oct 2023 13:58:02 +0530
Message-Id: <20231016082802.32336-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189273

Notice that it references different CVE id:
https://nvd.nist.gov/vuln/detail/CVE-2023-5129
which was marked as a rejected duplicate of:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
but it's the same issue. Hence update CVE ID CVE-2023-4863
to CVE-2023-5129.patch.

Signed-off-by: Pawan <badganchipv@gmail.com>
---
 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
index 356806ad87..ead3dee474 100644
--- a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
@@ -12,9 +12,16 @@ codes) streams are still decodable.
 Bug: chromium:1479274
 Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
 
-CVE: CVE-2023-5129
+Notice that it references different CVE id:
+https://nvd.nist.gov/vuln/detail/CVE-2023-5129
+which was marked as a rejected duplicate of:
+https://nvd.nist.gov/vuln/detail/CVE-2023-4863
+but it's the same issue. Hence update CVE ID CVE-2023-4863
+
+CVE: CVE-2023-5129 CVE-2023-4863
 Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a]
 Signed-off-by: Colin McAllister <colinmca242@gmail.com>
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
 ---
  src/dec/vp8l_dec.c        | 46 ++++++++++---------
  src/dec/vp8li_dec.h       |  2 +-
-- 
2.25.1


