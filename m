Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB59378524
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:36 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id v41so31301161qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mqxA1L8gGOrZvvOY7D2p2R8us+VTFEjZbvsQzi+vesc=;
	b=rAtZZd2+lEZ0lWbVuFU5Rakvp00iYuNXUveAHdI2lZ+18EtyuO0LOAZqoN0Ae5zVj8
	XSSWk8FoNwbSwK8t3w9iFs5wDO4Qqe8qq2XeYGZMz4oHLHFUi8wBgLmixmpbUdnm6yvr
	dgp3zF11HVK3lTF2liYUQRdUAHdIHk02azdGxhicWvWbTXHp82+NuvaSvsJ2gYPgg0CA
	n5gCFHNBFhnVz2t2tVHhGrwz4b8zxPthA7zuVBagSIVV1VT8gVqNshO8Jmbwf5jjyBam
	kI51Q0fDmVvhE43bQWaZpL3dc7dfn0iDGXYMEUxcBJdOErb1xivyyGdM4ZxoRTlL5qXY
	6lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mqxA1L8gGOrZvvOY7D2p2R8us+VTFEjZbvsQzi+vesc=;
	b=WsP+cyzZxpd6ExoeElwOv5VW3cQI3VN58EdBB9KijZdiFHslQEILoGWulTHx3r2i7g
	sLqClbuYdPl5me8/aZcggZ+Q7zX2n24THn+rYOPQkcT7SS2ON5j7GhXbr93JUky1wRmW
	ESZGy6pWvVMCYfCxCje9ve4CRuZtky419rG8gw0uRRe80RWnS2tT2SADmkEsFMnxo+07
	8qramh8yujQBQ4o9tkulbPqMi19udSyF1YdfhmGLIvHNy46QBKFLzX3FUJ43B7zBi/+6
	pItUoeIriiCPKXiuF6nXMW9pqUmRPEZ+X/EUheLMhk/XbFtcCGqALBqCVgLRYqRoezRb
	MW6g==
X-Gm-Message-State: AJaThX7jBB//BWXomUh5/Bn8W7q7h9nnLUzucSoJLWyZ3KKFNvx0JWAG
	c1bbkLZVLWnLodaj2Yt4+WhvjQ==
X-Google-Smtp-Source: AGs4zMYLXC7tgdnGcX+/UM7B6FaYLSryCwzZBmO0mZZ7hInoeWL+pQ2hjfsTaukHmkqp1Qfh8xUJVg==
X-Received: by 10.55.111.193 with SMTP id k184mr23933921qkc.244.1510715377499; 
	Tue, 14 Nov 2017 19:09:37 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:17 -0800
Message-Id: <7b7caea33aabd049a04e9b31d97e63cc23e67d59.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 6/8] musl: Disable thumb1 ISA
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:36 -0000

thumb1 is unsupported see http://www.openwall.com/lists/musl/2017/10/20/10

Fix
[YOCTO #12336]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 56c9d7fe17..9af1172ae0 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -26,3 +26,8 @@ INSANE_SKIP_${PN} = "dev-so"
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
 MIPS_INSTRUCTION_SET = "mips"
+
+# thumb1 is unsupported
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+
-- 
2.15.0


