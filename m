Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F591C36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2949.1742372187940964088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T1Aa8OWN;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223a7065ff8so37240645ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372187; x=1742976987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=T1Aa8OWNd8hXQW/bR3k7f2Ryz8NDH4tIAq2XTb3ttMb7/CY5nMvja5Ps6O1LJMLUpq
         dFqQ0KhGwHBANKpIViubPNYqe+rX7XP+o4wKp7OQSZh4Ipdrow2XAn8GamFVjVjhQIoE
         G1ZPYgu0G0qb3BFk4UjcnFiR4uyAXHRyU1u+Tk+9T292q6aoVFw0WTe/UL9YU5brtsue
         5etDsEXZ9wc65yQR10RFsGs0xmBwOSh/FtRiTk2doOjSZYhn/UbGUXr49clhQc0YZq3S
         MGTacWWbtI1hfRMLIEnh1+JUq360skMO7SrEas2pOk7BogVo8hXdQBbQOlZhhh3UuE0i
         HZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372187; x=1742976987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=daN6/Dz1Wukbt3bVKACsNxJJQddcZlz0U+kKX9OlNb0Juql+vsrNM1C0FV9AYLAX5u
         nFMkKfUdO5he4ubLCDAJgovgtoVF1h4vfojmcnKoVE0WgnhiC069tIZ7B94ImnNsJuIV
         LOu95dnT9M4hCesxOPJV9CjRaoXY1q1ubQN2CKPKnDLTZNPozK/z4el+MDspnEICm39h
         7xvVZL6GdoBvL9yne4mkkkAgjw4uX3zM43AWe3/HtF3zoTVHXJ1qluPHGRwcX3cUp2qw
         BiVgCa9/1YtizO3NNvu2xfUEliIkZMf32i9Snswh7xOXomv11mKY1Zim4knymMBtx9bv
         wzlw==
X-Gm-Message-State: AOJu0Yy08A0OxiGKRVmI+M1zmZqGQYSA+VLKfwL3NpWTIHyuS2PZff/S
	dggcpLx0Fbc1g+7uMhSC8eUQiGNMN6jYlVLGK5poSo2NcSP2x3VV0FjuLJ6G
X-Gm-Gg: ASbGncsolh9hYffJHRQsxALt4glDc/P5Rsk8wbr95iZMubNBakMMAOfx4UgRtAnVQ91
	6R+TLr/h3Aer6ZJQYD3sXq2bTu0RkHDPp0ohw+tYIW3E8V12FTyI9qcwGx/w5LDshzckqeXjeQs
	vJmNdbQx6p0VGNxXciZ5CevYq05DlQfWakzizOTLhqYUXC3km7b5RIO/hH1gfrWZlEgQaTtS6zM
	VbbDtw6boha2VQOa8tTNQovmrPt0kLR90ASPDaG0yEpVKKX9MJANETdqEMVjT/Hl7WZ2XoaOGfn
	ZFyVnNjWgTQo86VqlB6PYMeRVdRSaNNKUtX3
X-Google-Smtp-Source: AGHT+IFrzHfoFzlPqYMH2nWcZPchPMqea6luxBr8KY9PzG7YqhcJ4JNiKQ49fqkPjUT35A1ZqRCl4g==
X-Received: by 2002:a05:6a20:7484:b0:1f5:790c:94a with SMTP id adf61e73a8af0-1fbebe7183amr3006477637.25.1742372187116;
        Wed, 19 Mar 2025 01:16:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 14/25] libmatchbox: Fix build with gcc-15
Date: Wed, 19 Mar 2025 01:15:44 -0700
Message-ID: <20250319081610.3536475-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213282

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index bf3f5c005d9..e99b66855e1 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-#SRCREV for 1.12
-SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
+PV .= "+git"
+#SRCREV for 1.12 + 1 patch for gcc15
+SRCREV = "312c04b6ba60dca0d6c4a7d1393f0ec816a265e3"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check

