Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56897C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 03:48:37 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.67016.1744084116967962018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 20:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3jusYWL;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: alistair23@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3014678689aso4209447a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 20:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744084116; x=1744688916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgkekoFVgef5uWDE6PvKX95Xt7MKtdu+Hl+l7MNTGss=;
        b=j3jusYWLB6qSCOe2Mh10/tutZkvbg2MHfv8ep53lUoa+Y5G7JF5cOZypPzBdYPWjyB
         hDzv5d+3oBM2FlhnackG+USV1qXGPzaRasr8bm6guvpNTf/BXDmKwD/Xhz/lVxBmxTr3
         uwdncUok6aL2wQ5NlEqY3NGdaoG+gL+0x9Gm6HrziCh+Pfh64yckGXKwAancTf8cD0ac
         OtYVLVELwVzrhqfJX6qbJKPdzTBJ+2i+9kZTAuTIYvGPj454LLII+Crlbg+dfX2N9NBx
         TiNMZNjrKV0x13CdOwF5ynIRk68N6mwsXYa+w2gpz4j93LLSnQ7USBApNbPBUqilq+6O
         sWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084116; x=1744688916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgkekoFVgef5uWDE6PvKX95Xt7MKtdu+Hl+l7MNTGss=;
        b=EsnyTiL0DZ2LPcY2sq2zccKG7PsBTqLjaSjhfOnI2LPpQuaoq/YDHvcY4nketoy+HA
         5FmKZK1UpZ2bWD9j7vuPErFCoNAiX9LMQasLdT92fkAcvW/dvlCX7h2qO6mwcTParqEJ
         qXW/jMsfex6HXcR61ll6au3igfyULplQBUzSMh2T9DvybnH7/nS77ANg6Nvb+9tlxc+x
         QeXl2cMnK/gacrHmmC6Cf5FkbRO4Y5jJ1arj7Hh9WgxJswljdPeXVvo868ajlE61d2Yt
         rsQr0GTPhAVWDKIU93XE0lYNpe2p7G8Yq+eP+crLOWlwH2HWE94bA1iugrpMYLkVm77s
         YatQ==
X-Gm-Message-State: AOJu0YwFrbRYhRD8rBzfCjCnW89hP3nI6cDHEjATFAu0HsipQZKScCt0
	2P4GdLbIJXwLQKw36E6TzrSE6rHAEDLjjgGz5qX2f9CBZTiFi+d6p7Z1lQ==
X-Gm-Gg: ASbGncvr7CNwoVbZ0XNUpI3pXUtSdYxwZPl5QDoPwh0YC5tr5kxmlhMF05HpHxcNE7A
	ZLMg06rza88dFsBk0hsv50mYDO5uuhzyyXn4JiABaoMOt0cJqnCtH4+7Kzjda5AKzxkk6r3spxB
	ju3BIgf5AIc2UAsc0l/xp+2joopNJzV9/EtlgtQpTJCbUtJrfeNdGQy0eA7n7tbLxJEAJWItRWM
	8WpTg9wiEMImrdU76hBUrOo+JIYiejhUj4mLHzPSyRhJjx8mYpfkhFGAlj1cnJBESw2RbbX5VZC
	QjRBFgyDIsUrFp49eyaQIl9bR6AxBwinFC8FDBhPdPKgcFX6nmIh6i0mHSBILc5OXKNQz+4xuue
	qT57DpSvfJkWqwdn+KO5x94tP3dTsQpJ1Ux1D+/NOvHtUcv2qnoa/4uTSfqtJ
X-Google-Smtp-Source: AGHT+IHHqZUEAyfiFZjBh1YsV6qWttfYRXu2ee4BY17PzCjmBPMqlxga8htFeHK1Mk6RWC9P+hD7QQ==
X-Received: by 2002:a17:90b:520e:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-306a48a57eemr23972127a91.18.1744084116029;
        Mon, 07 Apr 2025 20:48:36 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca8d040sm9832205a91.28.2025.04.07.20.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 20:48:35 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH v2] ktls-utils: Initial commit
Date: Tue,  8 Apr 2025 13:48:29 +1000
Message-ID: <20250408034829.4000367-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214506

Package ktls-utils which includes tlsd.

This is used when in-kernel TLS consumers need a mechanism to perform TLS
handshakes on a connected socket to negotiate TLS session parameters that
can then be programmed into the kernel's TLS record protocol engine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
new file mode 100644
index 0000000000..e85dc4ac72
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
@@ -0,0 +1,17 @@
+SUMMARY = "TLS handshake utilities for in-kernel TLS consumers"
+DESCRIPTION = "In-kernel TLS consumers need a mechanism to perform TLS \
+handshakes on a connected socket to negotiate TLS session parameters that \
+can then be programmed into the kernel's TLS record protocol engine."
+DEPENDS = "gnutls keyutils glib-2.0 libnl"
+RDEPENDS:${PN} += " gnutls"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
+
+SRCREV = "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
+SRC_URI = "git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig systemd
+
+PACKAGECONFIG[systemd] = "--with-systemd,,systemd"
-- 
2.49.0


