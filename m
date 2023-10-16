Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CE4CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:21:48 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.112902.1697444500616860509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c0BAv7dN;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: badganchipv@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57b5f0d658dso2561936eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697444500; x=1698049300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz0n4XyVrpnybSTBXLq+M7Yw5IpimYEbIlnsVMmVvHQ=;
        b=c0BAv7dNmoHYkSGXrYouiHIxdcRdCvC8MPcRkV8Q4EUcMhmR9RIU5M6d2qD35+fVhY
         NQSrTWhUXrlHgnYQRO9yeN9AKye5h/aOGJgRItIqRgkHB+YuXsCbSK7mwgN2ns+pfD7c
         wO3339JKSnQs15rySrKWpCS20c82GAnuVxuQzRj0bkN5ndScth3DJozm3lpKRmfOM7x9
         Eg8qPSSEZZb2+4o+RidFIyrmZTIXQS88ym2+ynVPIfVCvZ5juc7e5t4DAizA3zBDqO2f
         1DSfYZAf/RfX8tdsx9mFssWRICSqfK4bjKlBkaUQ7fLpQqAV19YRdY8Vf948XttrefFv
         pCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697444500; x=1698049300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz0n4XyVrpnybSTBXLq+M7Yw5IpimYEbIlnsVMmVvHQ=;
        b=Xmy9ERfJgEHcq2k/ZtLTdpgyPCHAP+OXCgMvQuPQKXNmeB4aX36+zurBDwGepl2Uc/
         0pVYAJvI/q2FUKLrj3/kERzyWh7MEDzdULgxYht9tMRGp44TUwrKrDbK1vnY7LQeVOUF
         yZm/PnG2rDvtwBdRDikzOF4Uj/rrmZpb5imyBE80RgSABTb5iVXZembwNAAsSida+AHW
         J6zLbXmOxh3iQgQx+/xf3y0kFhwApg8mKhrO8cqDjBbkfRGzK/kDMjE4BXrvScYvIRwg
         Zv59XpXc/2FUSlUKuZK7sd2J+nVodnwd+Oc1PVfWvugXXgvfAR9tG06oruBjdPTRuol8
         xcEw==
X-Gm-Message-State: AOJu0YyzCqEsuQMqS3iCM/du5uIqAxaxO0ZzlTc0OU3YPrnrwVVT1W3w
	qCYgdu5vuzgSrvdwdofhLPb44j156NU=
X-Google-Smtp-Source: AGHT+IF/fjDSYFy0zbzaxb109dsPcbFYs2IV6fC7q9MEqFuK2Z07ye3PokRWdlyoyyWqLEvIR4AqaQ==
X-Received: by 2002:a05:6358:4327:b0:14f:6a41:5d14 with SMTP id r39-20020a056358432700b0014f6a415d14mr42367978rwc.27.1697444499633;
        Mon, 16 Oct 2023 01:21:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c9a:c74b:230f:a25b:2132:c022])
        by smtp.gmail.com with ESMTPSA id x19-20020aa79413000000b006b4ac8885b4sm5151137pfo.14.2023.10.16.01.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:21:38 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] libwebp: Update CVE ID CVE-2023-4863
Date: Mon, 16 Oct 2023 13:51:23 +0530
Message-Id: <20231016082123.31902-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189271

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
index eb77e193c2..ffff068c56 100644
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
 Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85927a12d6ca1d76]
 Signed-off-by: Colin McAllister <colinmca242@gmail.com>
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
 ---
  src/dec/vp8l_dec.c        | 46 ++++++++++---------
  src/dec/vp8li_dec.h       |  2 +-
-- 
2.25.1


