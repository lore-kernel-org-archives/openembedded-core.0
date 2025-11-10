Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94379CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 11:37:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46173.1762774622058163300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 03:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DtKFd2Zd;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295ceaf8dacso29409375ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 03:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774621; x=1763379421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gaVrolhd6GASIFdGBw2g0S4H1/C4YxDwUMyzW7u7/EQ=;
        b=DtKFd2ZdxCIu5ygfakV/TEHWyIroIkXx5zq+T36Gm0fbU5gsgEBjP7UdQbo8xzT0cX
         YF/OfhcAw48aYfzIczLPtPEb46LDloDpV6m4JuKj1M9qBvybDl70MExplZ3eM+KilwYn
         wR7yjENS7zn4mkJicZUXyw0j17YoI4d6AJ5EPC6d+spcWtOPJwi9dWAfQViRP6AfCtv1
         dLdkK0b2CjEr6svmqYJFaCvKJrVAFiu6sxgir9GqsthgUeHZ6I3uCPtpIzo7CVgcdYjB
         I8MqkTpaH6pUixWZ1mjhhC7P7/mkcCIvlfbVZ3QVUkQCmm11FCDnjSYDXC59W0tlgdze
         qaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774621; x=1763379421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaVrolhd6GASIFdGBw2g0S4H1/C4YxDwUMyzW7u7/EQ=;
        b=NRO01vtx01++ybIuTtEG1OhMBKeEOodVJ0yfEvF72hOa8B9EJYmle5JmbpGZCbcmeR
         H22sxdIJvfFwMvwuFVKEOWmyuECtqjBsGy55vQiEH9zg+fD5Q+drk43xYFdWdZMq4pHC
         JNANfMjWrUEm6Ny67Z56xoOSUoOh3OByb4mVRvsJk6rSfRFC9lWsnDTSf1rbXpUMlkZZ
         uWQ8yvF0KTYUHfobm9j4lAcTJM91x19U4gvuhqnyDNIg5jQVUCbUJeyIalOu+onqlOPM
         b4csOsk7xsi0NqGX5L+gIgmneRPUMQv1ff+skqHa1Kc30kw1Zw2jKsckMOoeYlhwSsNi
         U5NQ==
X-Gm-Message-State: AOJu0YxkK2NYvQ1BVk4zmtYnqk3NtrmVHqtwjzCnNsZjG81EF3b5ozZW
	hjwUOH0kBBjJgShqeFs3IlHjIYapKClxzhhoW8KhAzJmr7LL6/uEReyC3sUgbg==
X-Gm-Gg: ASbGnctVc3ttbtVizEVyLbTJVFnMoSJfLCa9fQj5lfo9yTpzCBQSI+0l9LaFFXwFIx0
	wAeAbbJmN3uMNlnvkjxb2SKnnURAVGjpdgsdUCKgNFnb/Bt6GdCnTexE0aFb9bWwoucYEe/dGFH
	jOODTHWgJpU6KKQLYUhJaMT0KSK8SaqiGZEfKNTTY1gkfiJMn+vhW/FCcGbobB2s9XXMuMR3jJX
	JTUXv/NTPHDBWJchWDkSpgI2+OGXw5s7TQn2VaApRCyLeEJi7Q1YOE3EHRo2yAUINXWRMrMk8kH
	1uqXS4h014VSjGOSFlTat/jet5q1ze7jflYBBRlT8a5VsEgOyps+2W1nnikqcZQ2knTdUKnM+19
	pppuC07XF4lh2OJdPPGv7Zpb3dXb8v4nQTtfeAxrQRkyU7gtLCdz1YMGxzeQkp5OOzq5sCgg22Z
	v2ItDfmg==
X-Google-Smtp-Source: AGHT+IH3LJ7boE8/5Hdam3rqQCQealE2u9hibJO+oslMIY0do+PTPTyQPdpsI9viLh25iv7VNz2JIQ==
X-Received: by 2002:a17:902:d2c5:b0:297:dd7f:f1e0 with SMTP id d9443c01a7336-297e56f8ef5mr106314325ad.43.1762774621216;
        Mon, 10 Nov 2025 03:37:01 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm142582385ad.23.2025.11.10.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:37:00 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][scarthgap][PATCH] socat: Update LICENSE field
Date: Mon, 10 Nov 2025 17:06:43 +0530
Message-Id: <20251110113643.852149-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 11:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226119

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.8.0.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index bb39730005..6b46207e98 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=241;endline=271;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=241;endline=271;md5=338c05eadd013872abb1d6e198e10a3f \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
-- 
2.34.1


