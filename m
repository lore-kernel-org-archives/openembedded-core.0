Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FFBCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 07:58:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.112690.1697443125659046733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 00:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mU94TbF7;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c8a1541232so36523825ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697443125; x=1698047925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz0n4XyVrpnybSTBXLq+M7Yw5IpimYEbIlnsVMmVvHQ=;
        b=mU94TbF7vY0Snu7kpUBB+SWeFJkvWZzobG9PAJv9A5oyqEu4rm97lr9ewZxRh/at7+
         ARaz3aJTPEUHKody4TlUypiHKwe5n6yIRA0u8UdgtcZdpZVQRsRXsTFK5nCtwpN5e2fW
         oUECa/J6XqNmv0k+dCwdOrpSH3dLM9wkbiNzNv4yILisNCMqkX894EH2i4xy40TU1wEn
         ga/3KBTI5Zpw8OXCTnsXel/xtcfqY0fiJXvW6hlMatkeay+7sTiz9o0fhaUh9RhrBBnX
         iNWaQ0FIVYmGXCQoBMrVnDe1pCDcDEniSgPA1C6+0ONketG8Zves1qicXd+EKbGrrx2u
         YSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697443125; x=1698047925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz0n4XyVrpnybSTBXLq+M7Yw5IpimYEbIlnsVMmVvHQ=;
        b=XDAPwgWlGJG43OgL/kMVARcWyMvcT+7XCzI04ymav4WdBQW8MXzRK5B6+ZBUn/Sdt0
         6Tv1aFrEefsMyD8f6PuF2Kh3h2XMrvR30fM1bow+QPxDwtjKdbXYNSud5IlEVj34V3Dr
         sQnEWvOuvk+ifHoiWsNh0+azGubd3njmTVYqAzshX4SuXeoo3TlWuGJjrBb/FIO0WifN
         qWo8T/mSo3vfk7MrRvXnAKSFLhKwEe+wd8HOqm1cLo4q9KWNuuw67ESWhMzHr9oo3Rd0
         5rURfi3wesmVeCg8RcGO4jm/TbNIUs0sz8TaHCnUeeYFitjLcje6sbY7+ri1yk4AOgdq
         n90A==
X-Gm-Message-State: AOJu0YyU7l/li/5ZEUWHuO9CWi5/y9qN714qzZJpDiusDQoynRkg9EC4
	2cYac1crqJlmyi4/soXCRfoCoSAGwFY=
X-Google-Smtp-Source: AGHT+IGXojY/Xl07UjppIGLKrGGusxowUE7qe1JlB1JPph+c0jyYQdzpj6W50WHLldXdnxZ0WE3u4Q==
X-Received: by 2002:a17:902:ecd1:b0:1c0:cbaf:6930 with SMTP id a17-20020a170902ecd100b001c0cbaf6930mr38814040plh.54.1697443124813;
        Mon, 16 Oct 2023 00:58:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c9a:c74b:230f:a25b:2132:c022])
        by smtp.gmail.com with ESMTPSA id z18-20020a170902ee1200b001b8b2a6c4a4sm7840081plb.172.2023.10.16.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:58:44 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] libwebp: Update CVE ID CVE-2023-4863
Date: Mon, 16 Oct 2023 13:26:58 +0530
Message-Id: <20231016075658.28929-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189263

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


