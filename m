Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D4861752AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 07:51:26 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z73so8283406wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CnYNwGPhc8+p1+fa/HKqnSWHC8Rr4Q+vbtgNyZmA5lU=;
	b=VXq5cB55afOvYcL8UhSPeohKrf4dLTmK8+nsI7fJv6dpuQdXti22TiBo3Jza4rUB7j
	etAVlvYfd+/q6q/U2loIELF47tmGmymaKlQy3/+AI4VKfx8iPvcNxZ6Nr3ru+fqHCLNO
	0F31TfFgEHg4zIqWCnFbPNtm0eyGDA/udRa8B1KHa2M+7jOZ8NtuN1yaZcHxGcTU3bAE
	zqKaHZZu/nGfxv//eEhKV7C/UaBhCve+RLca8ZkMERmwhE9iTtUTisPsrSunr90MI7nN
	1jvLJ98aZQdSs6PvSt9tcJjhk1dkTo5pJASTsmno2DXjcOsScALAPsIeCzFUckUCjgYO
	6NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CnYNwGPhc8+p1+fa/HKqnSWHC8Rr4Q+vbtgNyZmA5lU=;
	b=R+MB6v0kfxHftULjrEAbjxRFDqHABuKmfhJ2zkUZHhet9YnVG6yo5al1gwTV8LMZDW
	7Nu7ZMG3OYpikaQoLVqb1pUWA+Y7SDBUBhXR9jf5fetU2a2J90lCYEZGEmfMsictGKve
	v7z+9/R+momqtS6KeLUQOckhIPN6zIJ8i58BK/AiIa97xXN8ek5I9+/q9YTRkqeU7NtB
	JIMOvMcAZM7GxyK1vatjrOoMMuTSyRHIytBuuVwS5AnaaLYJaaBwwlPfMBC5aV/iuaCK
	4rjH7v/vOWCu2uNMOLmq+rF9rJG2XM2o/APNbqkQt/O3K1G6F+xw8MOl6n6obp4J+WT/
	q1dA==
X-Gm-Message-State: AElRT7HVZw84ZU3kYS+TbmlJV9nKdoT4asdsgy96gaWWsjdiVdUu3JTi
	D6Q2eGYGvdFna0Hp1zKWFebGYQ==
X-Google-Smtp-Source: AIpwx49jGYy4v+vSEkfPEPRInsw050pNrgRimXahUdd52rJkl3KvNKv/v2FG4f36roLY359hV+KnbQ==
X-Received: by 10.223.210.82 with SMTP id o18mr27316517wri.85.1523260287210;
	Mon, 09 Apr 2018 00:51:27 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h9sm52118wmc.13.2018.04.09.00.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 00:51:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 07:51:41 +0000
Message-Id: <20180409075141.27481-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
References: <CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
Subject: [PATCH] libxcrypt: add -std=gnu99 to BUILD_CPPFLAGS
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
X-List-Received-Date: Mon, 09 Apr 2018 07:51:27 -0000

* add it to allow older distributions e.g. Ubuntu 14.04 with gcc 4.8
  to build this, otherwise it fails with:
  ../git/gen-des-tables.c: In function 'write_table_u8':
  ../git/gen-des-tables.c:307:3: error: 'for' loop initial declarations are only allowed in C99 mode
     for (size_t i = 0; i < m; i++)
     ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
index b1982c1991..a1be4be7ef 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
@@ -20,7 +20,7 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowc
 
 S = "${WORKDIR}/git"
 
-BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
 python () {
-- 
2.15.1


