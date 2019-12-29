Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id BDD8A7F87F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:32 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b22so13800609pls.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ih3YXs9WD25AFnJ+QsRwCy+SH4dPENVrBBmweLIfe4o=;
	b=WF4+0Xw2OTA9VwFrcb0uvoXcUn/HyAFHkdX/141wpz4ZhDjCSfWVdekyfQcs4E3Q44
	it0R/GCpffmE3yJjIbCdpmrBsDT/pq76s5L+liXHxMh0oCahFZfTtUgNfvnjm40st8uj
	J22F9wYUmXwH2TZhM2OZitrl81iBJi2PvHV9HcMIPpznz4xFNtRGfMda1kkpb8/VMRKT
	4ZBaJrGrmLBgiOBwoZ7joyY2Gw/6p6LgVduZdQVRLqryVs/opQQjNf6sEGN8W7bHTZG4
	tTU3i4cUAX2c92q8LgRAvdf4vcMwCo46i2Nb2/7j3q5W4N4sTodxpxGbotzR7C5j6vlc
	ihZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ih3YXs9WD25AFnJ+QsRwCy+SH4dPENVrBBmweLIfe4o=;
	b=im2caPbTGe3GLzOJiXj9IquOVl+JTV3cDT/2oprojevjqPkm03BECUB8PgRR/VVrfl
	8V2uLx1+Gdi5JSi2XBSih/m/omfqDO5qR5vKEcd0WTXxBiO1prIG+FN7oVr6XrJLUPtM
	ygVzuU6U93p0FpfjoaopuyfV29KrmNnkbak9fgl8nuP5xgjISIRDJ01pV5Hg5/79AP5H
	nR1Rfzu67zFR9I+NZDec6b9gf+1QW33qnOOeSg05Ccw4a/WxzHd6sB8iRYvVoGkiIS5a
	55tS368S01IcY5Idf3TxFSWuK5FxRtwtX3F7k3ohQSXMp4rDQaKNZmTESYpT8IDYxKyg
	lcZw==
X-Gm-Message-State: APjAAAULsv1lAD7i+nrViXFuXSkHqPo8Wj+uftmbSttEsZGPM9ljaJA/
	HshZLlxLxlIGgcwbFm+q0uRF8gAiXg8=
X-Google-Smtp-Source: APXvYqz6me/lA/XO5v1kVOuVFd2WfLsKoaWmmaLONU3XJyOmZbMxHZ7Isqrvq43aQ8IQgHpZ/qYgPw==
X-Received: by 2002:a17:90a:c983:: with SMTP id
	w3mr35267282pjt.121.1577645073576; 
	Sun, 29 Dec 2019 10:44:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:02 -0800
Message-Id: <20191229184415.19514-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/19] siteinfo: Recognize 64bit PPC LE
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 411e70478e..d62aaac0f0 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -48,6 +48,7 @@ def siteinfo_data_for_machine(arch, os, d):
         "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
         "powerpc64": "endian-big bit-64 powerpc-common",
+        "powerpc64le": "endian-little bit-64 powerpc-common",
         "ppc": "endian-big bit-32 powerpc-common",
         "ppc64": "endian-big bit-64 powerpc-common",
         "ppc64le" : "endian-little bit-64 powerpc-common",
@@ -106,8 +107,10 @@ def siteinfo_data_for_machine(arch, os, d):
         "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux": "powerpc-linux",
-        "powerpc64-linux-musl": "powerpc-linux",
+        "powerpc64-linux": "powerpc-linux powerpc64-linux",
+        "powerpc64-linux-musl": "powerpc-linux powerpc64-linux",
+        "powerpc64le-linux": "powerpc-linux powerpc64-linux",
+        "powerpc64le-linux-musl": "powerpc-linux powerpc64-linux",
         "riscv32-linux": "riscv32-linux",
         "riscv32-linux-musl": "riscv32-linux",
         "riscv64-linux": "riscv64-linux",
-- 
2.24.1


