Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 443C17D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:52 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 15so9167439wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4SVmrIuJLbmrXgGXSxG+ohGOOolfaynwpA/FlgNrPYY=;
	b=NeIZfWnGL9GRd9FoClWqiPTRAuEyEys4CFQS/yNOo/EyLeXxQGPWOg8FaAx5HtohIQ
	QNUy7MjKy4j93tiVv+fqey9q6N1IDm3v2cBpyzPuAzCeHkxQBqpEp59zh96Jlv92VHfp
	Ir7EaD+b9N0sOvw9Ael9QEOAbQDSaacNoWk8ppMsWA5yKqxib59mspjMm1OLwJVK7H3I
	BiMo6nHHYw+hUelK8KWOc1aN5leq9POR1pEh3ha3kHlvTKJ/N+8F4z6pGaCI50Fb1BEP
	sULJkMTXtkL1ZVvBAIF1N2jEiHEMAxuBCQTDyWVscVv03yAzacStZ/KELwsUDsdcQ2do
	KBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4SVmrIuJLbmrXgGXSxG+ohGOOolfaynwpA/FlgNrPYY=;
	b=g0nnZg2oH15MErtMDYusFbzNtm5/Yk684Z2sifGZArN0xWKPDlRudf5lbIE4B/TYv5
	QcSNk+/AeRwOslFkRbN4qHAGQ1KLtq0L+/Qb2yC6iOmlYNyPYMpliu6RYdW9CDZd4ekK
	R06x2Olg/T/kvVKFxzMdbuNYTzSqDjC5sRSVLJy+EDi5HHB+CqOjGUgDUeeTHRDZtfnn
	vlIlY4WDGFWMVocUQzN4dRBsDHNVTuW/9FIEfYvU9tYYXkKvtWkRPuXr5LBe9Q+YpGfh
	oucLwAo6JdB3oQwlMSKT12hemEu4km5nR4YI8iGzg+a2mIUjrNT+9CYxfPq/wd5x5hDS
	1EJA==
X-Gm-Message-State: APjAAAX02qCHd0oXdgpYrE7usQwMqybYoiXL7Mz8bs1lCts7lIs2CDhU
	MTUVZlJAqwQE9ZvKQ+srr1lXEID/
X-Google-Smtp-Source: APXvYqzaTAvoGUNWr/eN3vX/M++FqHwT4NWbOwV3Gl0+tq7sk8vb0omEG4h/vlBUU15bDgL/wiMQeg==
X-Received: by 2002:a1c:2dd2:: with SMTP id
	t201mr30686100wmt.136.1558361512569; 
	Mon, 20 May 2019 07:11:52 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:03 +0200
Message-Id: <20190520141125.10805-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/42] libxcrypt: upgrade 4.4.4 -> 4.4.6
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
X-List-Received-Date: Mon, 20 May 2019 14:11:52 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libxcrypt/{libxcrypt_4.4.4.bb => libxcrypt_4.4.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.4.bb => libxcrypt_4.4.6.bb} (93%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
similarity index 93%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
index b44c07b4d0b..637c0e6ffbd 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
 
 inherit autotools pkgconfig
 
-PV = "4.4.4"
+PV = "4.4.6"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "3b251d4e1af66aa7697c4ac96c689f996fa90c32"
+SRCREV = "398943774c5ff38baf1bc5ee088855fd8983bb05"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
-- 
2.17.1


