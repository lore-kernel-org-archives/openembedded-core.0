Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E9CB17F829
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 19:39:22 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id h14so2075664pfe.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 11:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gLCKf01Gt7J8uAQFCD1i9aThwvyGy5LxEatIca1p7dI=;
	b=NCPz8sFV7Mo0RvjOVdg3ZZq64dnguH7Gdu+vmpwFklwMFt1s3CwjQjOpoHb0NriD0L
	2UNMTiPObaQK4Q7VCHAhnyYt4mgSOq5/F+Y6blS+MWpaznGrASRwHn3BF+RwWuI6ClN9
	PslKQ+cFCZnKRuHkCBhmPlM4e1qsIxo+ddYC9sn/DDHPBjJJ5TbiW+01wDgxzJDU3qBr
	m57P9OZ41GYKeqyRSVoBvZmKrKmY58zrGZKZP8JK0riykX68kvq/CwKJH4953U8v+iWQ
	3Zqsf/RIgDksOmyhWJ0ecuSvzL/HhLak0KAdCQ59JN238KGuypoRDXpVhX0uhivTQVri
	60hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gLCKf01Gt7J8uAQFCD1i9aThwvyGy5LxEatIca1p7dI=;
	b=sOCwpuoNtTQvl4OsKpHB6M3++6tpyukey8ZuqnkZ5RX1Jm60T7D24NR7DGAGp3kdRc
	cFSjL99JzoOl5qnw4sWH9keo0F3wHyrFRzeZcovniIWOmEvOdostJZJ1cdILDQfkAtoJ
	WYZ5nPkuWpd8Ad66TCZp1kSEIhBdGgNW8XJbwACiqwVM9IWHZ3nvr5lEZS4THQsndldm
	yMKPmcANkNy0PQFezJow5T2m4QQy7HhhRyAMLbNXVJJ7kAugAvSe6TOPgTzeonbY/nD9
	crUYKDr6ppNkj5rROrLbRhbyb3KLEgECjVpSD2vYlTBzXl5BslFGc6EX6cFvPSOkNpN8
	0R1w==
X-Gm-Message-State: APjAAAWy0vFY7VYQdac6ZnGozS2D2vye7Q/7Y2cO/ZCiLgpcBmVi8lw2
	KkQKX904gpSyTsUypmh+5SsTYqZq3AQ=
X-Google-Smtp-Source: APXvYqx1afbDVVoI/43m887eyo5rvRw8tywIS1Lmqjxvm5Pyi+sWEQ86d90EL8RXr4hWn6imtlIRXQ==
X-Received: by 2002:a63:4246:: with SMTP id p67mr10898356pga.243.1575574763308;
	Thu, 05 Dec 2019 11:39:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id
	r66sm1412918pfc.74.2019.12.05.11.39.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:39:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 11:37:08 -0800
Message-Id: <20191205193708.262610-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] llvm: rv32/rv64 target builds are not supported yet
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
X-List-Received-Date: Thu, 05 Dec 2019 19:39:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 5f9277fc0f..cb2e1164cf 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
 DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
-- 
2.24.0


