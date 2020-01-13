Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 868A07FC93
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:35 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id m13so4424775pjb.2
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n/ocAy4Q5CruOTDxlyX6dXjujCS1UDn1YTjqYwkSXBU=;
	b=UoIbx5pAzdver5GGEK4Sjz6/3X9BX0I33gou/KOK63Cf+NuILwl5YXOlnPWWhNYDdn
	9M/GuIsGy6nX2Op56wQbpij871ImRJvqD2rQbJ+GR22URQ+GI4FefSKnF+vBz4p6a4NA
	4AMW1VNx94LtQb2DnWkZ3TJT5vAtgGcsU8izFHHkYBQBkDip62YD6w+MLynla2tgviJS
	0TSYmZEa46lJ7FwnC60Muj059i/qqJpBbagx6DH6IXI+3rsQ2tEsUohw3fjvpU6Njj1X
	B1sJ1KMwNz9da2nHGQRmgW3wh4qRXfS84ykFZxA8oUE/0sbSbWJO6ef7uxcislC5J+xS
	3XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n/ocAy4Q5CruOTDxlyX6dXjujCS1UDn1YTjqYwkSXBU=;
	b=RBZ5nVo2JEvywB5qY3Eykle+TzZUUB1Uks98OvBFvYQg/pZKCT2zOzlqgnJHsLaeAF
	SoOtdBTGMsfoNF6vHm39j70cWJ+TzSMyPqRgCDg9gJqSO5gPtYw0k7RTHEzaruVrLloa
	VrtSoZlhDW2ccSAJIvx+/MDwb2gat15de6wM6pGPbjnBd1ehy6BKog05ncg67xd/Co9Y
	7ZU9GBwS6ko0fAiv87HoX8tvZuYXXy9iYE86TgU6vJTphRGI0p+hQ7YXOlwjidV0m9AS
	8wzoU3qcsqlbps3yuioiaBXL35KmBNue9UAeJ8tFJvwN05Tr5uS/95wSwaqaE41nuthH
	bdAg==
X-Gm-Message-State: APjAAAUZ4HM9ulS8IvpysHJdFcPFvfzg21Kk5x2zhkYDhYMnJ0RziPXh
	+MkePcqopKfyeu0g9ok/LysuqYyf
X-Google-Smtp-Source: APXvYqys2N3XKpMBwbbYFN6bJdqocI0+7Pe1eaN//FpcYT/mQu0O963NkGvprnOfMK/EuZJ734mgEg==
X-Received: by 2002:a17:90a:ac0e:: with SMTP id
	o14mr23560246pjq.11.1578929436094; 
	Mon, 13 Jan 2020 07:30:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:03 -0800
Message-Id: <9b5437f9afb4dd1366d5e21ea861f683d8cd2a09.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 04/28] subversion: set CVE vendor to Apache
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:35 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Subversion.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.11.1.bb b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
index 8abac7408e..9909461bf7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.11.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "9efd2750ca4d72ec903431a24b9c732b6cbb84aad9b7563f59dd96dea5
 
 inherit autotools pkgconfig gettext
 
+CVE_PRODUCT = "apache:subversion"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-- 
2.17.1


