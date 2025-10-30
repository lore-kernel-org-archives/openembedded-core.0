Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C33CCFA00
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:17:27 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web01.17419.1761799349793263117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=niN82KP9;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so653814b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 21:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761799349; x=1762404149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frujk2ehh4wiPteFD9myqbEWR9n6hWTIhZwpgG5y/rM=;
        b=niN82KP9/PrdPl2kMlQo5PMQ04utLx2TVBWEOqsvUUIWLAN9FyizSyuEg3YJq/ga9s
         00HDlP8HTRDY4W/h60rRbddz4pwre9XRRCjD1phuruQNEz6HyxcHaF3VE9Mk6nx5FYjR
         j/wTgGX8qjUWLpWo/L4pO701Qnz4KSr2LGvdrrkHe7XhKAFXsz4kf8BbHH6NEuxZ55OP
         GZCYJWALNt+M5VLR4Lc0iED4z1eBOfkf6i6HcYMxSw7Rw5Etyqq99I1zq5p0owJEyzHV
         /8Vr6MMScI5bZJ2A5bjrmZ2wKSD1GGOmzqrKsQG4u5oDShy2mBkNdhsJ/WJZu4cC8oEl
         yVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761799349; x=1762404149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frujk2ehh4wiPteFD9myqbEWR9n6hWTIhZwpgG5y/rM=;
        b=hWOaVrxC8xAvByG2mHsB8sX+krYbcS5fdbqHb4l9DGfNQ93jtLGKjlUyu2tkZvO9Ng
         ovSo4070QxPoIscSnDS62JwVkI7qVX16xjM+iYyjQQafK+KkHWKxv94cYCFb6xzRAnrO
         0yeX7786Xbs2FPW35EQkMKkI1vSxrKZf78YcP4xMvst+/lqBAALEQqaP+rJg+7Mfqqw3
         UXhZ5aaW35fRw3TXZ+iddYoYQmfcVPu5hKW3IrbLWDykGKL75FNliPXqlMlBnKD9nzP4
         E8FSC3wMgNWVh4IWw76I/EORkgWL4ybe2GqAknlYYnF+pWyFKxrffkvpEdTJ4PrpP7Y1
         9AnA==
X-Gm-Message-State: AOJu0YxzgYQg5FZ2tDmD2xOY8BOh9d5MVDFQCCS3LL6cTmmV4FEIYye+
	TtL5IjWu3uytHpqogCElKuA5p8Yepu76Y0VndxNYq0HrgfQdSTYcsiRq+CGo8w==
X-Gm-Gg: ASbGnctfdr7MAscp6ZrayAPtTOvx35y+4AGd9wD/fTYKCPeUy5r7sQ53nDH3Lpckz9Z
	aGY4/TN1GEh+dNA7unsz7J5+yHtxJjum4x5jQWmKn66Q9NQ90trdP1BhIgO7YqeSTz0BICiiRY7
	RDZR2dtfKnEIGHktIYUjwgF/jdp7SmMe//9Ddghw0PG/Qj5pfbrU/rOctRPhYhRalfze0Mqyb89
	JmSBm/ZSFNhLVbDeeKcCg7XSbaZ9Bes6hzg+jh1vJ79LIDU6fBea9nHMlxpyrkqrPcCxwYGHDPK
	JXiCenJ0O5QZC/emgbcMO6rSZzD7+/yd++uA09UtQb+AtTOqT7uVrLZ65Wl3CLpVxkWpNgRF9zo
	8qPUjc4COoZGQRlHrZfMlYXaB2BGpnpVHgCN4de5//gUdOiwwlDc6mkLxbuxBkc6UwJrQjoYJgm
	3WIb36NCI8d7+cNVr2
X-Google-Smtp-Source: AGHT+IGiLsEWHq2/xnaKwp+w72M2wGMVOVeEqKXcR+W1EIseMCjpithCMzQUfcaFy58Ns7wf4xdAqA==
X-Received: by 2002:a17:902:c945:b0:278:9051:8ea9 with SMTP id d9443c01a7336-294deef7ee0mr60631855ad.40.1761799348969;
        Wed, 29 Oct 2025 21:42:28 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([2405:201:6807:1a2:beae:429:147d:8dc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm173057085ad.6.2025.10.29.21.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:42:28 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][master][PATCH] socat: Update LICENSE field
Date: Thu, 30 Oct 2025 10:12:11 +0530
Message-Id: <20251030044211.607841-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225496

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license. Also add LGPL-2.1-or-later as
socat uses it.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.8.0.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
index ee6ca1fe44..f4c3591710 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
-- 
2.34.1


