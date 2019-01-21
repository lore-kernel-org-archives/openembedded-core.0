Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED7A76D63F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 22:12:19 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m19so17569446ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 14:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qQ7VKLqFBl3KeALeso0Boa+WG86qoJQtoZhCfoeWRqg=;
	b=HReEGeKdeUk7DlPL6pifDLqycPoKkmqHhwuZPUVjkcT5+db32rnrg+rH1dDttmxvzA
	hq1pQGuC5qWD/XapEyhIn2QTuWLo8IMc4XxnVq9f3V4iyzQFFlC4KrQHX+E82aJTotxf
	CRsJjxbxhsQTZSNa+mSnD0e6j9G/wwBl1bzh0JNuZuINLci75E1sAbZD5AVOfre6Uoq3
	v3RVcrZFyEmtP6wP98HNKhFMW7g5UIYSyU+IEiwjRk1cZ4q0SkOythpN6f4o8dAJIoV1
	Sn9qloV6RklECHWGFiiiEUyTH6vPIx7Qa9B4OotkwU4KKk0qovArvt+xlm62Z42SxoRI
	SYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qQ7VKLqFBl3KeALeso0Boa+WG86qoJQtoZhCfoeWRqg=;
	b=mviA5NKay2hg9ayK3OVnNgyw7V6ST1qj9BqC2mdTz4rXiF2GAxwYGD2P+ZKOVESM8m
	pTO6np3/XwY4yeW25In2RpWOMtLNk8TLYE9fSDuniN2LLENWFr0bU+Adjja0MxibPhdw
	seS0KTHZWH6p+IzZg/Ng/5S+6b+LeQfqzWXR/SyOv8kZk7xYbTS19ICupJoY+Tyg6lyI
	HsLUygZtIT113CfFu9QRbQaTsUjh6fGgbvV1vizFwn9HfbAf/VlyckywLVqk/OPutEhy
	+hqrSOI2Gfn0ggl9kZSZPyHYz9XvZvT/AURgPJb3XSZ5m4jfh2143MT/EDXbV5JvQClm
	T++g==
X-Gm-Message-State: AJcUukdymp3kI7vBMmDnCZeSMUehU5XhxW3lFhQ6rZ1+js0leXqtk8Go
	aVbWTbUrqSY3cU+m2L+y/LsES/E5/QI=
X-Google-Smtp-Source: ALg8bN7zsVAdOwyn4bnaojLEuhylMFf/DSJgF1FPH59PECBmEev7j+wMVGurCEu/zFkACrGqpH03xQ==
X-Received: by 2002:a5d:8d18:: with SMTP id p24mr16677878ioj.223.1548108740388;
	Mon, 21 Jan 2019 14:12:20 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id y5sm5217039ioj.9.2019.01.21.14.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 14:12:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2019 16:12:15 -0600
Message-Id: <20190121221215.14127-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] classes/populate_sdk_base: Add src-pkgs to COMPLEMENTARY_GLOB
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
X-List-Received-Date: Mon, 21 Jan 2019 22:12:20 -0000
Content-Transfer-Encoding: 8bit

Add a COMPLEMENTARY_GLOB for source packages (*-src) so that they can be
included when PACKAGE_DEBUG_SPLIT_STYLE is "debug-with-srcpkg"

[YOCTO #12931]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a4afc61c465..f2c934aaebb 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -6,6 +6,7 @@ COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
 COMPLEMENTARY_GLOB[staticdev-pkgs] = '*-staticdev'
 COMPLEMENTARY_GLOB[doc-pkgs] = '*-doc'
 COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
+COMPLEMENTARY_GLOB[src-pkgs] = '*-src'
 COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest'
 
 def complementary_globs(featurevar, d):
-- 
2.20.1


