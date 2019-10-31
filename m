Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 569257FA30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 19:28:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 11so7196628wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 12:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v3PY9flgmHqzoXBNKCj7Ed8P33BRS0bqo39V3FGJ1h8=;
	b=stZJMRfeEOgcm9WLck328E8gzja6IrnMn/GqGSWBqWJTEV6q6p4U7dXYsV8gHxww4H
	ka5+J8GYkLHt4AwwIQA5Zh7c+9EfZgNn/aVdjxb2/G2PQfIg/ZKm8XXYZAPkh+9H4pzF
	E+IgAfcQq7StFH6W0knFVBp08OQyS3wkqRPJL3zyC2z5VppeYhGfEEkGMw8irhvPtb7J
	0/SerC43brK2EHQ/yyYHZhwogGsSVapzc3x1snQR82HalX4f2w6LRjpUy3T5mj3Da4rh
	Z0SSPAmtFZ/emD4lhyeBqt2rzwjbtK6tg/kKjihRk4Y4Z9HEeMvvlUvYST71EGYUL2mB
	0/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v3PY9flgmHqzoXBNKCj7Ed8P33BRS0bqo39V3FGJ1h8=;
	b=lgZA/M4AqmnbzRhrgcMtwGAy7jHGcUad/96YubtfAPCc+VCnRxqOVrY9Kfsm9As3Q6
	I2XKsrzm+PHJor7iXBJWfJxn8jnNfISsX/uKV1ag7jIf3Z291eIIW5DZYO2Yr7sOZ22E
	0MhVY7R4ROT1a2gET3jhWF68QzsbmsKlTrprlEfLfqvCkWGVDwTptkDWl91Iw+hgVttD
	uZFvYfFLS+6QGnsJzFh3W84omP1zIg6F+xrxwhm8y+TaBvXZV3jV7dVtBCgYWLKSeGHs
	WfwFSDw1dNY/wpunT992+FepiswZKtnvqPYiXoJUcMGRotvZ08QXShrUm72gbfRQxBCp
	O8BQ==
X-Gm-Message-State: APjAAAUrHhIu3eqsRLd0DlDpPC6X8/aRcUgEXSRCp+wYvBRe3PRqZGsY
	6342gc+/rSPi2PdOAddxrkXT+sEF
X-Google-Smtp-Source: APXvYqwmfUfr9b2dLQkjfumGLuPk2zpa9/YWAoeO4qrjOt8FoprV/RzBi10QLcB5m1haNDgqxxq/DA==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr6904548wma.138.1572550082761; 
	Thu, 31 Oct 2019 12:28:02 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b1sm4843986wru.83.2019.10.31.12.28.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 12:28:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 19:27:56 +0000
Message-Id: <20191031192756.2292514-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031192756.2292514-1-Martin.Jansa@gmail.com>
References: <to=CA+chaQdopiKmfqoreYzx0Q9saS-vtQpkqvLnwjEm9a9UmZ0dwA@mail.gmail.com>
	<20191031192756.2292514-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [warrior][PATCH 3/3] go-1.12: update to 1.12.9 minor release
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
X-List-Received-Date: Thu, 31 Oct 2019 19:28:02 -0000
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 13a4c3bd8d..ed14b175e6 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".6"
+GO_MINOR = ".9"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -20,5 +20,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "48a4141fc718dd742d106431294f08bf"
-SRC_URI[main.sha256sum] = "c96c5ccc7455638ae1a8b7498a030fe653731c8391c5f8e79590bce72f92b4ca"
+SRC_URI[main.md5sum] = "6132109d4050da349eadc9f7b0304ef4"
+SRC_URI[main.sha256sum] = "ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"
-- 
2.20.1


