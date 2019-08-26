Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id C6A127D72F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 16:44:40 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id b24so12175936pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cinV6B6SqdS7L9418bicWUzlNlDg6LNQ9g9TaQgRHiY=;
	b=ea3d16jkzzvoH/h4nrYaIsQBMcZWm1uQ7Zx3u+fjesryZn/BOQKNUGMzZfR8Xb2w+N
	wtzSa1T4yy9XGn4Ywb+VAhVMzpHu2KlIdOSmFK+wqFRZNBojQvtTj12PFourjbobELLI
	pfJdL4JbH5UvZvOXSdQtAt0TV0rnlPIhHOhDHMB/n0mOzr+uwV1liqTTWfY83FahZ5al
	bc655v6sOqbFfcsr1AC7XqE08o2w2j72AhvY30z4knq5wrdUJ3qgRRcHUka8y88Ip5E1
	CbWGnYKjnXdbg61mGexmqRGJhmk1ZVqZS1rdtF1p1V4ObmOijnmPJBTd4ssFHt9Dtci5
	2AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cinV6B6SqdS7L9418bicWUzlNlDg6LNQ9g9TaQgRHiY=;
	b=KoO4bcMf3Gn8R/2ZUjnWeTxtdFyEY5NM5YRJZHY4kJHcIir6zZYgfJLnErx0rnhNx8
	o60D1ueeQE1UAO+4xj2ocy+qQgRPHcSPfPvWvotgzz5Ekiexj6IvuixKFT8lJxvXXxUc
	8CVvx4sRsmWWgjUbTGrcSCMowFf7xC5+KXiElFOHUZSKl3CnVzw+bIr0lGhOS5+At/73
	K/Q6ApFU3bsfbzwS+fxNsF0QM9k7RB1indXKbZeMosibYbPHvlo30b0GZD2ROdaz/dW3
	QguxvYvNjhdb/wFR2z7N13BZKpfLt0T6h0Ei0HIq0WZpvZKlQA5remrMpGVWR08SQA7R
	YpOg==
X-Gm-Message-State: APjAAAVFkzU9r0QMlMC3a3/tHPnI4X5fEvwVK7ORfaVEc48ySYUh+uYP
	CmBMAk6/2PRFwM2F9Zg4t10pZ1TNtKY=
X-Google-Smtp-Source: APXvYqzfuIPYPMSGSzPNRYoDdCsZYIav+j/ic4ou0+GOfB4s9hZRhbpKzDKBagJ+n4VMkD+BTmkf+Q==
X-Received: by 2002:a63:f857:: with SMTP id v23mr17235475pgj.228.1566837881141;
	Mon, 26 Aug 2019 09:44:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j17sm9075507pff.50.2019.08.26.09.44.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 26 Aug 2019 09:44:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2019 09:44:26 -0700
Message-Id: <20190826164426.17929-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] go-1.12: update to 1.12.9 minor release
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
X-List-Received-Date: Mon, 26 Aug 2019 16:44:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 3f23f06f09..39157ff882 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".6"
+GO_MINOR = ".9"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "48a4141fc718dd742d106431294f08bf"
-SRC_URI[main.sha256sum] = "c96c5ccc7455638ae1a8b7498a030fe653731c8391c5f8e79590bce72f92b4ca"
+SRC_URI[main.md5sum] = "6132109d4050da349eadc9f7b0304ef4"
+SRC_URI[main.sha256sum] = "ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"
-- 
2.23.0


