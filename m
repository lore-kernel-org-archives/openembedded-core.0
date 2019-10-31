Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 142DE7FA30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 19:28:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b3so1744298wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4111VRIWZ1Mees4hnVE7RdGEIMWPRv0zBrSbo95d+aw=;
	b=oIL/WdFHWfG1d+n3moKraN7vABpaEkIdHMGJZlsAgZeNQod9pqCGGhSnzkjvYLzxpf
	DXlX7wTBIZUUvS6EcGu1jDryh9lF/1Ky/3p4quVU39UewSTlhHrWHBWC6yN2UkGAVrmE
	7TX1TOHR1q5AAOZr6nJR8dyNUVZPYZ2Vj5IdFG8qWNVOhcq6a9/P/LbJgdMGq8fJhylu
	/pmYiJE6sJ9e0Ij62W5kmzQ9ZUy2kgfx33rQcPJW9ST/F6fxDSCtd01vOptlKfxng+Rp
	KCC19xrjOuVl9khp0cXXzMbcToHZeIt2Qw3kvmpUZpOQpQswrxZk4CCYmBPBbLYBKJ0R
	/zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4111VRIWZ1Mees4hnVE7RdGEIMWPRv0zBrSbo95d+aw=;
	b=dvlWUsE2BxUiGKGonMR2epA+QL//8JYTa0fLZrXKcNOCQFttpQpDb8cFZEp4g69WmS
	4xispG4CvsNUsP3b7DPK0ufpud7mZRTWWcwEJTbw99Q8yte5zcl+C8nrINleB6Bow+5d
	Nh4I60mqPffXUua5k3wZNEji3/5UM42z6yfys/KAVOVoYT1uFOrxBxRWALI8gMfDeO2j
	xBoZ7c38gXUQLPXqPqrZwuYLAzDUb9YdomMjTrUKwjNy4QtAbKETdAURKV4w4O2Uo/Ky
	GX5qohnRL5SVF7DTig/3rUutqqvHojv+Lc95SV7pNYuhEtNeSqLG3EuNJqRezZK9TIs/
	dR8A==
X-Gm-Message-State: APjAAAXkRnt+RgPRiohxUvvsFLM3IQq2eGLWDIW7wgKj5F1DQciqrrZG
	jQcIArFKgs5v3etkGx9Q0JcW9mqc
X-Google-Smtp-Source: APXvYqxkZMC01XNCq2+Ys2XQytxunLa27SE6wQQMyurFUMZ71IX6IbeCglwiSOEAQKQJ6omfhp2c3Q==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr2543831wro.314.1572550081417; 
	Thu, 31 Oct 2019 12:28:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f6sm5268436wrm.61.2019.10.31.12.28.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 12:28:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 19:27:55 +0000
Message-Id: <20191031192756.2292514-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031192756.2292514-1-Martin.Jansa@gmail.com>
References: <to=CA+chaQdopiKmfqoreYzx0Q9saS-vtQpkqvLnwjEm9a9UmZ0dwA@mail.gmail.com>
	<20191031192756.2292514-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [warrior][PATCH 2/3] go: Upgrade 1.12.5 -> 1.12.6
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
X-List-Received-Date: Thu, 31 Oct 2019 19:28:01 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index dc5e2af9e2..13a4c3bd8d 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".5"
+GO_MINOR = ".6"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -20,5 +20,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
-SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"
+SRC_URI[main.md5sum] = "48a4141fc718dd742d106431294f08bf"
+SRC_URI[main.sha256sum] = "c96c5ccc7455638ae1a8b7498a030fe653731c8391c5f8e79590bce72f92b4ca"
-- 
2.20.1


