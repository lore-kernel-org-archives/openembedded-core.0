Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED36ECDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:17:28 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.112854.1697444239542482102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mex3X3IZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: badganchipv@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-58111e624bdso2633035eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697444238; x=1698049038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz0n4XyVrpnybSTBXLq+M7Yw5IpimYEbIlnsVMmVvHQ=;
        b=Mex3X3IZj0lvMSkaPuAokivczowzcPxeHVHq6RKXu9F8B2rarC+GQxOyr9iQmlhOJu
         yCQuJ4T3kMhqYVYB8RrQ3B08OtLJXsrvlCMkAZmQOYyuStzrzd53lkHu1OQnU8MSOvNd
         YRMaRmqs5YzXse5Q55/nxz6XoVPD2LCYm7jWBLKdH4oxOSJdLvNz0ZVaEi3bwqnmLaql
         txF6dV4vGC9HU1+Q3DdbNEPHUGCPbX3uWWmKi5W/dV020l1q//L3MqIvjQ450DrC9xXy
         49NoWb8EC2XGj0uh03y+K+ZtXy1sPIu/hwzFsxKGV3uBzSCb2Z5W/E8PNZbGAaKwpEeJ
         FkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697444238; x=1698049038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz0n4XyVrpnybSTBXLq+M7Yw5IpimYEbIlnsVMmVvHQ=;
        b=wFnNtpryztZDLSqnDxDPl6Z+KYnUX4Oe7R/LEqrPS3GMsLeCBXVIgARsINgSiVIe4o
         ELI+5S+7fYBL1hM2hAKUY3/ZbweflZKS4W0QJKWtP5M2XeWrz+TE3DWrI0jwi6Nhb0Oy
         W7DdZQzWRSEl9Y6+kOdTAE9xpVWFESSXGWXMGNrsCjm1MzcZWl2lD9/ZePfUqkZKX5GR
         IZyjYGo7qGOVLDa+NW4EKYlYsX/5d6SuAe+wKVsWZMqcCti3K6z0hwzCgMXEfiivx4I/
         4CUi+KTbYFlyaS4BvjkADgrAqbwhT2wyuS9PEvveszzJSp4835yDu4lPlh7CnTAj3F5M
         /D3w==
X-Gm-Message-State: AOJu0YzwkQxEC2hn+dyEkC/D/ZMSdkOb7fTPycry/WtFSC1iwcv9cXYf
	T6QhoSmcXZE2MP+YXuE/rLbekKYmFns=
X-Google-Smtp-Source: AGHT+IGaXyDqUEV0bTnI1E4uwG9Kc3wN21+6dEQw2lwaNlFcBJFCflaLpKzYFl6PCSi/dRewr0YzSQ==
X-Received: by 2002:a05:6358:279c:b0:143:2f7e:aa with SMTP id l28-20020a056358279c00b001432f7e00aamr41843068rwb.28.1697444238598;
        Mon, 16 Oct 2023 01:17:18 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c9a:c74b:230f:a25b:2132:c022])
        by smtp.gmail.com with ESMTPSA id s5-20020aa78bc5000000b006be22fde07dsm1234713pfd.106.2023.10.16.01.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:17:18 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] libwebp: Update CVE ID CVE-2023-4863
Date: Mon, 16 Oct 2023 13:47:00 +0530
Message-Id: <20231016081700.31672-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189268

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


