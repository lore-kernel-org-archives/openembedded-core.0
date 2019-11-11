Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id F04877FA42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:22 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id l24so9937968pgh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LoEUb3vUWCMmigr1IqaKYvMkxWUlPNNCuwa8gUUKmwA=;
	b=DVPunNJOhHLo5sxuiLxzxkNudmRWix7+iZ2pDWQHWsXfb3/thvpU0ivE0+bwJmR3dM
	pn7BYbEudmMUMLKvh2R/6OVDoqG0EIuAQQtum2l/ZO4JwevetPdxqLNWTPAOM1KebiQz
	7/4opkaFg5EQTy04NGwbz0JnNOHDddDETR6XeVTYMppPJtqXUEi5c9SznZD2DZ1zZfqd
	5QNWGZ98JpUmJC6MviJnf77vMZd8CHOSzjOJ0KqDkcbOz8FsQBhzpvp059uESPn9RLiL
	d8Rj72iiPPJAW+0XMan+xUJRBf1+oQicmthh9DW+o4Gzk0uNRT/8C+lD2JAHuiKJavVw
	y4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LoEUb3vUWCMmigr1IqaKYvMkxWUlPNNCuwa8gUUKmwA=;
	b=EqlIelIW2cNVUTYIipe4rYk9JiTtpfBZezeN9GyxWQezZ31A+N8UBsRHJFIeIP36Tx
	5xobepqrNLrUjRcD5OmGHXw7GouiGvvYzr7s+sE2AtxSk+3FqAPT5r6sum9yyKeUgLCZ
	xLuUATM/y/JLLYvAEjKYfblzQNk4+VUDKFPJjkE13k9PAfA4W1rgEpuv2aYivgtNNc78
	bVSVOl/R/H15LgmDEIn1fXMj1u23ewPMoAYkR7wvpuJB7mgG6S3edlYS3/UzZhGnDdPd
	ZfkO/R82oEWlJPT1vxo0rd8QUEAtJFHWeXgSL+FS5kR/nGnBfdLlWkUKTWit/08YCEeA
	ybPg==
X-Gm-Message-State: APjAAAWVYNraxScAUmk0GFD20/84AsbvwE8O5g7E3i8dvVFRfonNkPEf
	zUmC+1LZhCUxfrcvdGjzq8tP6xzL
X-Google-Smtp-Source: APXvYqywDRPGjHM3iW14FeWQpOXnrgeOclXrmP4HuLougSKgeEmAD3v+djYeXWQir2tMnpGP2qwcYQ==
X-Received: by 2002:a17:90a:353:: with SMTP id 19mr551337pjf.128.1573497023417;
	Mon, 11 Nov 2019 10:30:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:57 -0800
Message-Id: <90b4b7dd19526e8aba79cf469dcc2c05401f36cc.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 15/21] recipeutils-test: use a small dependency in the dummy recipe
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:23 -0000

From: Ross Burton <ross.burton@intel.com>

recipeutils-test has virtual/libx11 as a DEPENDS, but this will cause errors if
the recipe is built in an environment without x11 in DISTRO_FEATURES.

This dependency isn't actually used for anything so we could remove it, but to
save updating the test cases too just swap virtual/libx11 for zlib.

[ YOCTO #13611 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 7c20d9a..0cd0494 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -4,7 +4,7 @@ require recipeutils-test.inc
 
 LICENSE = "Proprietary"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
-DEPENDS += "virtual/libx11"
+DEPENDS += "zlib"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


