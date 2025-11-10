Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4DCCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 11:39:03 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46214.1762774734760698316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 03:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayONk/BQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b8c0c0cdd61so2412110a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774734; x=1763379534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vlF73EB7E/JRHRHSWIPBdzMxi7vNwaM+9s4hhbo1SxA=;
        b=ayONk/BQDyXYFh+eepB298YdbeiAARJ0MpKVFdc1ImLaf9m7GxehZKJH+e82u9FGzV
         TugHy0uoNOpmjwXMLUNlq0txjmR4Hcg/8OkgSoyHHEOF3akKStuJwnBP4fu3vVH0/NU4
         dgAd/ae+UQnAA9wpfmh9899ai86HS/7hV1nRI5HbAmqXdWJirS2dds2DfF6vsLG+UyUJ
         H9ZGkXK+jYk1dv0EAnA3d5mixGYi9MwdI2bjidLzlBgJiWD1sdhL2mRHy0vwxDRW2mE3
         W2Vc929hKXbpgyeGvVnbvJXA4nTJcxfbv7QkyvbIeh+fvSR+DutBIRBkk06WHhReJsF5
         HQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774734; x=1763379534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlF73EB7E/JRHRHSWIPBdzMxi7vNwaM+9s4hhbo1SxA=;
        b=OYDkZhLJZYg81/2Pfk4B8xFzsIwzN/4K859ab11kYcFjsNs+Irw0HhvIaGKgLD0Nhm
         49m0EYZ40go/Zw4SWxnLWSHhOP5mbHGn/EDVW9/ZD2Lh7giTzr7BQ818T+fYgOjlHcW8
         BqYQiHnVAmX06O2eDB8HHnexvsDSiSZJxivK2p4mJZPXFyAMDKwzUILzFngEVfO6eny1
         fxAH5xYVWXZZN07EgVsd7rBEZk/WGbgNnp1oj4U6J0aRcr6F8YRTPInx4XYaczvE7ilM
         vAEA39aD73j1IWyAZroJGAxHlPDPCoup5hbpxfyxmPsnDsHJj1vt1uPPB8eh2x7JXyhY
         H64A==
X-Gm-Message-State: AOJu0Yxm+h3ermA/shUx+/uLaHRNBp0ejGxkPAxnoQciEmpdGnyuixGO
	kLAuhpvk83deIO/m5gxIkLxGT/XYGatkwl8V3k2nzM0UMUU1ccVtOGWnbIydrQ==
X-Gm-Gg: ASbGncuuxnCmu8Q1fCejl1+rQZFCF8dBtbbkvxBWN3BdS6XTlTzIqfftcABYxw8jm7I
	cBNj4612zQ+vP2UvwWUXtCvAiXOUgP0KttLoTOoc33J/aDqwWChey88kTnId4Y3fMbC4NHuyGH4
	fVhQAFhzzQ8DyGP0xdyeccLwQsjMExYUpGE6GdM+UlphAfxq6wJpHhklVOzgcPhcLqFpQkESq2K
	d7UAGCHHVrdDFtfRJl8zoDq93zfo3vkB/tc9uFde6683E/pNTHGhqZTFrwImX5T4AiE62NqIcLr
	BqZAEz7XTtqOe118zaPRuyoKDlX19jIsY2oC4+wvp0LPE4OAnmAvVtETEYQLoVBxOtiQNjpmf6c
	37dSnNRmTw+yHFUga8hgyj13TzJKI32p4dhG0XJ4ONceqK4jaRXfk6PnXkSOk0DEn2d0w7eh1e5
	XNHF/Ei2wMdzYuoIM9
X-Google-Smtp-Source: AGHT+IHkpKM7QuBaiwcDI/WRAjPV+e0eZdONKqJBHYOfB9IKZRVcIR7QcJLwr8wQImvMzt1/CdKmFg==
X-Received: by 2002:a05:6a20:94cb:b0:352:4411:6785 with SMTP id adf61e73a8af0-353a21cb41amr10182451637.44.1762774733972;
        Mon, 10 Nov 2025 03:38:53 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccc59e44sm11716956b3a.64.2025.11.10.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:38:52 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][kirkstone][PATCH] socat: Update LICENSE field
Date: Mon, 10 Nov 2025 17:08:38 +0530
Message-Id: <20251110113838.852524-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 11:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226120

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.7.4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index 86ca5879be..4a18219208 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
+                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86 \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://CVE-2024-54661.patch \
-- 
2.34.1


