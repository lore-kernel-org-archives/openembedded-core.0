Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id C5A807FA30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 19:27:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 8so55338wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Bkb4nD0HVcsRAp0mPlXlpyEh9BhkTRpwuxXhZvB7BKM=;
	b=UD7QEqX0tYPKGP/8noGVWFLihPYDl/vTzewWtNH1OTD1udnn2YEtexif1wOsoptj5i
	t7GIaengeLmU2xXqnSjxwDT7iNJ1VF5bHbIaPD3+kAwaVDqoE5IP7UFzegmcG7CGofu6
	DfDpqrHYngWozZIRH7OW78dzszrUOmdo4iCApEAbZCv5qyuVVVrKd05/XpITTWnG0HtW
	2tgeYMqCTU3ptrTxPZfvXReS268niBbu3EYQCaOJmf2WpXKCApmjfYlJuSjy4qNmveet
	C6G1NDr34Hv4h4J8Wx3erJ/C8WqvCyLaDFhdXGJB4iH41eej9QM9qaCpnxXYdpa4n2ia
	NsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Bkb4nD0HVcsRAp0mPlXlpyEh9BhkTRpwuxXhZvB7BKM=;
	b=E0z/EDJJdyZc7B/qpOV7WE2kntMcsZ+dr7Ncxp/E08H9ZmifojPXx5plouZocrLN1z
	zXHbSG4gSkSTkOqX1/hzeISB4tY5nrjN5m0JIfryYmEKh0u3HGtJDt8TawYb02t8/FFK
	tx56h52y1kSxfnYNlTHsNB1GrtN4g9Yv4Q2aKb0gVa7krXB+9GFCDXfv66dQyDinZaP6
	D+VjhD96cuImNfeN8T2yElgW/F7P6bChn/EDvBmg9JT6e/lcfYGqUbhPG9Q9WqVa+paq
	ZNUfIRHLYIUd6v9hBnzNLAuF8Vw0h2CEV8kxwXaLmyLrKkFZB/C8XqGD3uYAkIsAzyoA
	iHrw==
X-Gm-Message-State: APjAAAUl/JY2tqEelBU4iwGdhsq8evLhtBR0xSiGwU5MSEfU0IIRmjyH
	p1rxGr258/6AwoLxWCdDLDxb4V8f
X-Google-Smtp-Source: APXvYqxg9halgB2kpICLOsgKlZTjQqRGDh5ZMNzNCA8XOd9BbgYIJ0pxjQVNn507HdHv8U8a31zsVQ==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr6641981wmh.40.1572550079885; 
	Thu, 31 Oct 2019 12:27:59 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y1sm4949231wrw.6.2019.10.31.12.27.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 12:27:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 19:27:54 +0000
Message-Id: <20191031192756.2292514-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <to=CA+chaQdopiKmfqoreYzx0Q9saS-vtQpkqvLnwjEm9a9UmZ0dwA@mail.gmail.com>
References: <to=CA+chaQdopiKmfqoreYzx0Q9saS-vtQpkqvLnwjEm9a9UmZ0dwA@mail.gmail.com>
MIME-Version: 1.0
Subject: [warrior][PATCH 1/3] go: update 1.12.1->1.12.5
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
X-List-Received-Date: Thu, 31 Oct 2019 19:28:00 -0000
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 66df500520..dc5e2af9e2 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".1"
+GO_MINOR = ".5"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -20,5 +20,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "09fe592343465560b4b8431d870b3df3"
-SRC_URI[main.sha256sum] = "0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a"
+SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
+SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"
-- 
2.20.1


