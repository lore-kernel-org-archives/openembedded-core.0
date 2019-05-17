Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A677B7DEC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d18so8080254wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vq0JpLhcgOIGC//q6TalpI0EQCxWF6zKRhQNOEc02BQ=;
	b=QqkZsjUObet2Ec5cRBjRU383vZcw4DwzxPTFC8K0qpQaICgYV1rpWbDpfdYtxQUalR
	uGWw4Cr4LDL/nlylO6xSUurBvC3elJHbEYRG03qsNRU9HT+6YuTLu542g+qFrfrlv8fY
	ZDk5nQGZzEEgW1DTPG3P0VfmjCq5ZbsuEPwC2SHAXQQUM30467ivypxvBtq5W/xhymcG
	7S0UtL394HAA6v3nWdNAXRYOJBZO9SJ8Q3Tc3no+7VT/E5LF2iixG68p+dAehZcdIF9F
	s+qsPPk+/1E0BbBB80fm8YIlUrlaGxkXnQmmT/12Sjd5BCFhHXa1IEMQJhNBXms/Qe1C
	FnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vq0JpLhcgOIGC//q6TalpI0EQCxWF6zKRhQNOEc02BQ=;
	b=m2DLTlyc8GyL9Y7wcPdWKtowrhlMuRAogBCS8bOPX6K4RAYCNuvtzEmTYLhRBIBr2b
	w/aq6Fp55F8uvy31FaM5fHPYIsekMgLuep4lD9C4gr6Na6jMBD4koDCQ+FZvxYPFjugh
	BO57N3HkNdLbqgJXq4lrBVasNSBbxDT7JzsxfIB/Hx/4QJJfZtxaTvMfP8Vt6VkYw+IA
	s3f5AW/wheKfE0Q9pM6nvheAJLhB4R3z8UMJ3Fzvw3RO60eoTw0KV4hjgX0r27rm4iPS
	pMZ46lp4U9/Yz8AYCM+0fF0issF2loEB3fq6IB7tFh6itLf7j8ihL+v49jKOypIlDmQj
	NzxQ==
X-Gm-Message-State: APjAAAXUTAD37cpdlNNqfeUL+D8qY4T2dRckP4Ldy7Bnr2dHp8TACx63
	dV4/xD+1rlTYD5YbllDYXK+2FcoP
X-Google-Smtp-Source: APXvYqx2RuE/oRev5/1qk8Bbk2zErrU1lIR1/p8yv3IniNq6N4RbtR2gHtZSGCkzAvscQ3gcx7+LUQ==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr19425060wrp.302.1558116734216; 
	Fri, 17 May 2019 11:12:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:32 +0200
Message-Id: <20190517181151.44001-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/37] lz4: upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Fri, 17 May 2019 18:12:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/lz4/{lz4_1.9.0.bb => lz4_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/lz4/{lz4_1.9.0.bb => lz4_1.9.1.bb} (94%)

diff --git a/meta/recipes-support/lz4/lz4_1.9.0.bb b/meta/recipes-support/lz4/lz4_1.9.1.bb
similarity index 94%
rename from meta/recipes-support/lz4/lz4_1.9.0.bb
rename to meta/recipes-support/lz4/lz4_1.9.1.bb
index 744a1bf4709..de1f970247e 100644
--- a/meta/recipes-support/lz4/lz4_1.9.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "131896ab9d4fc9b8c606616327ed223d5d86472b"
+SRCREV = "398e36c756a3067de8e2b35dd380baef040dfe0d"
 
 SRC_URI = "git://github.com/lz4/lz4.git \
            file://run-ptest \
-- 
2.17.1


