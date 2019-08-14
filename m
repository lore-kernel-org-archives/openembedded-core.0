Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 408007CE73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 05:19:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d1so19658372pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 22:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GipbrZMypiks/Ru/QPAtBDdrtLy/nQDOvhzbqx+xhw=;
	b=FICypxGGAnXzJzHLV0Le8arc/9AfpgfNnCaGZOTMpfvP4UuPeltCjXYQVjHL+BjA2+
	zLjlMXZFtZzq6bvvssCZTXSebmNzd6rz6WTqYxRgJ2kvXN5Od9yVuryYOM+QYcizyNFe
	h+ZFFQYIZybefNjwayNbMmil0pIzlvG/Yx+ibE/7KYCF2oNVqTcVs7gA1zO5sIV1MzAD
	gWgJrRAqNX4lok17SnrPrS4sqlsVxm22tFK2uaRPuGIs2nUd50lR8X9gD24OFodNpeh6
	FXkhYv4CF3TE/tqprfqTSxPEwZtMXggp+4Odi1C3UJb8IPadVXH6W/POrMppztId03Im
	yRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GipbrZMypiks/Ru/QPAtBDdrtLy/nQDOvhzbqx+xhw=;
	b=j/dv49P8aWdKP4trIpoI7/5u1gvGJ229v8kDXocEe71G1Lx3d2Atd1Mralyfyq9LgP
	05uPtyjL3cnxj2wae0Bp4AKSNzlhhotE0QTX0vjphaTjeklxZe2C3Z5JovnJNSxZQsNn
	Ii11rQEY0Rqt80Sw8GwmL9Xhy34TwzIE+hbkTNG3y7eM1X4gF3Z+siEAl+ghF+DP4NoN
	rYkwPJytOcLdeKgYOVzHNKt2nu5LoBJHC9gGDzPYtV5sqxEiMrborhoSn2eF/j53WW6C
	/SrHgXWqu43h6rkEtRPXmKyS3bQMqEaLe+umQ9qp3HgiYLmXtO7qj6PQ3BUqcQWawUcw
	KWQw==
X-Gm-Message-State: APjAAAXjkxA92OzM/flZzgi9+rSHk2ez44ZBTzZCZFSTDxoyZpv5/nWQ
	hgMCprdf7GvbPvfmBUCG6p14E4XPDB4=
X-Google-Smtp-Source: APXvYqyVVUkAf+7QnLv383GLyayEritaeue+5JortriMj0RPH4Ezym4CkAuq/pzZnJtVjQiekLvCbA==
X-Received: by 2002:a17:90a:24cc:: with SMTP id
	i70mr5663307pje.12.1565759970586; 
	Tue, 13 Aug 2019 22:19:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	v22sm107805527pgk.69.2019.08.13.22.19.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 22:19:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:19:17 -0700
Message-Id: <20190814051918.42678-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] linuxloader: Add entries for riscv64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Aug 2019 05:19:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index b4c413494a..c0fbf26836 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -19,6 +19,8 @@ def get_musl_loader(d):
         dynamic_loader = "${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+    elif targetarch.startswith("riscv64"):
+        dynamic_loader = "${base_libdir}/ld-musl-riscv64${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
     return dynamic_loader
 
 def get_glibc_loader(d):
@@ -42,6 +44,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+    elif targetarch.startswith("riscv64"):
+        dynamic_loader = "${base_libdir}/ld-linux-riscv64-lp64${@['d', ''][d.getVar('TARGET_FPU') == 'soft']}.so.1"
     return dynamic_loader
 
 def get_linuxloader(d):
-- 
2.22.0


