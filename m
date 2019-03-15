Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 607266C1BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 19:20:16 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id e17so7123091pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sKHMtEgW3vWa6nUONXi3X6xjhkggxARUZIkyXFCqw6s=;
	b=MoRPUQbpfRt4ldCOlWEzhxD8D8/3WJAFTRt85A0qN+glVFoQHoOotEJAZ2PYN/waeE
	XnG8OqcFvZEpvGgIGcy5Udkz/LTNQJrJDyDdapla+REbCZ7K5mBVkBXFn/4ajKx3IpPW
	PVlPpGNf/+nNZDlfXrK7naxE9H8q5GAuFObQuVB7sKiMtweCWbGzoKrvBJJIi4EtNA3J
	4Nd6Gv0sfTvvgJve5/EdY5gs5bNowOOwcxt+K7vYUc8jCfUA3k4ISKXab2mYSJq8k0gT
	TH1rfrTrw+0TqfuEu+dDFRxJB69JzYPHefF43KnaCO1RhTrW1prvXH6Q6X06k16mpK6K
	Qc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sKHMtEgW3vWa6nUONXi3X6xjhkggxARUZIkyXFCqw6s=;
	b=CBbierTD7WEOKvS3fSkIO2HQJtn10IIsl+Qj3D6HkXxIAP1/4W26OtyhF041Irrscl
	cBjNCj3e9Ili1PeQTjUALxZn3YRrwpgrhTVJFDy1PrgC7bJ0Ni0Yyu9/2qvo1n36TqT0
	zpysf23LX5icckOZH+4vU2WZuMJtwFTXjriMu+wROPv1gUtKTLR+QOgv0Bn3CWatchqf
	mGUq5zDyOik9LMtWpQqRjEek803IVAXrFE8lO5FnYeuupefnSxC7+0paL06uXIYW8sm0
	ltCuWCE+TjjKY4XXxMavgbicx90Wn8/Hv4y0h6cEl0JmSxdmNAIcRA0sLGZ0icEo1689
	cbgw==
X-Gm-Message-State: APjAAAUrYCVe3nD9KgOhw/XO8lskVbz/jveZkUlFYEGX9K5StPyjwp+l
	4Hxb15a/wvP21BpCNBXfL6QreCme
X-Google-Smtp-Source: APXvYqydJ+2aiH2SwwWRTjOmzzWO/yKHGiW/gATvA911JCz1k41HDxDqZ44oDFiFBwk7frxM6mk6aQ==
X-Received: by 2002:a63:e801:: with SMTP id s1mr5004556pgh.378.1552677616049; 
	Fri, 15 Mar 2019 12:20:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	p88sm5399001pfa.80.2019.03.15.12.20.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 12:20:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2019 12:20:05 -0700
Message-Id: <20190315192005.20780-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] go: Minor 1.21.1 patch update
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
X-List-Received-Date: Fri, 15 Mar 2019 19:20:16 -0000
Content-Transfer-Encoding: 8bit

Minor revisions
go1.12.1 (released 2019/03/14) includes fixes to cgo, the compiler, the go command, and the fmt, net/smtp, os, path/filepath, sync, and text/template packages. See the Go 1.12.1 milestone on our issue tracker for details.

Details
https://github.com/golang/go/issues?q=milestone%3AGo1.12.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 4f6c341fc3..0cf0a63ff6 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ""
+GO_MINOR = ".1"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "b3332feba8a945a193b47a52d9981bb9"
-SRC_URI[main.sha256sum] = "09c43d3336743866f2985f566db0520b36f4992aea2b4b2fd9f52f17049e88f2"
+SRC_URI[main.md5sum] = "09fe592343465560b4b8431d870b3df3"
+SRC_URI[main.sha256sum] = "0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a"
-- 
2.21.0


