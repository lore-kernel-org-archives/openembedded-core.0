Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id C64197FDC7
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:59 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id z16so27847114pfk.0
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ueoAB/paKcs58RcwjsHu3YO3LLAazDrlmC1WJxcuo8s=;
	b=mnoJWjYW/WrshUFb21kxC6KayPGYOxWB2DJNLAjjOJ5vXc2EbQhsGChjpJ57s5Wb6M
	1k5FRT7OT5oZScm/DedDscl1akO55I7emSWjB1ptp48+6qyn/wH88KvYVswbbJJ97zGJ
	iSkpQGjKDUTJgxPPtENqqy0lsJFyBYxMboKTR60IgxG7a6XCdxfwNBLgsFFCSp/BGSBb
	vtKIaHpdbEhiJUnoWRM5obokeyUnRS5Zcw0NQC9YKKo21rMe4eCkJ6CjJMku7UB0eoxw
	f1UdjnH/Gxfnkx4rxuB4QhaDTQK3GqXN9ZhWsium89XUnZxG8KHLF38EfM/2Oby4RXRY
	qyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ueoAB/paKcs58RcwjsHu3YO3LLAazDrlmC1WJxcuo8s=;
	b=YkPXJNCiNuxD2WqSY07PARRC2GzLSmphjRoNfmGjyth1qhSEyYOrKwE3ddY6Zbv1K2
	gfOKJsGycnCJAovV30OoiS/s4Em7wBdLHptPZlp79s8rz/ANtNPKY/8UF8Tw/PT+PXHd
	qGJtyL4VBckCo2h0PC4dqw+wVkYojCC138j6DIYBKpI5pCc5pHi5YUj2H+/wivgNMerz
	JVgwP9GtClfI+F0tlbtdL1fzeGVZBjqasbmXCYd8G1qARUA3eddJjSfNMbRJF6L2ViFS
	F6S5PDbPtPyiczz3AaPC7HRdhnbgP2kQv7DGSV8OIIUSE6RcbNkgLoT5ExKZrhlY3QDW
	0pTQ==
X-Gm-Message-State: APjAAAUiuChqhCiPL8269uaXkYUwo2LqNzEj85e2QVUfL3J/k6zOQ492
	8Tcf7H8CgjyZ826lClbkaZPvY1kf
X-Google-Smtp-Source: APXvYqxUypE7/NziuTfJ+hxiL6jpF3EHDH8+XBdHciix2eo1Y7Fr/m45AzOXLgI7Vq0Q9Wdu3eOJVA==
X-Received: by 2002:a62:1c95:: with SMTP id
	c143mr108974171pfc.219.1578364500841; 
	Mon, 06 Jan 2020 18:35:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.35.00
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:35:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:28 -0800
Message-Id: <a8eba8a57045c2a2d69e3399e9a86ed15aaab3fd.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 23/28] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:59 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aee9beb12226abf7a195b8ee801ea488920b2fdb)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3_3.7.5.bb => python3_3.7.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.5.bb
rename to meta/recipes-devtools/python/python3_3.7.6.bb
index f6a1fc76e3..d3706cdf64 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -38,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
-SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
+SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
+SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


