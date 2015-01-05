Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9567282F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:41:06 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so29374314pab.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sihO9uKW0YukK9Nf1MxTdEUMwaRW1v+nO77qOTu0odg=;
	b=LchPziDXjsNxO/w1yPfNxW+8YWKanxfFz8+Tclz7wV08pzdS5goKWH7+iMeDpIqgPx
	XRjCtRMLIhtCqoc6TuFgO+KW1iOBR7TiSn+NbYuQSYOmcMnDIfIfzxooWGkpOB8I+rtT
	nWFn6W8BV7eWTP236FB3BFD6uBqnlCFarrF5YV5HlkMC2nxIPRY3vfvgMMJIgaG1990q
	OF8tf9EGsijIUlzqmKE0TVUMZlfDx7uhwogMmXsx8gLoAqHPj6jiF2iAqO+N7IBQ0Qx4
	Vb8cLy1njWDnWVGwp7m0coDtb7EY5tUcQ4LfL0ueKpdPns1+DUr5gaftF3uyHp8ti/lD
	4tfw==
X-Received: by 10.70.103.197 with SMTP id fy5mr150969227pdb.131.1420490466957; 
	Mon, 05 Jan 2015 12:41:06 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.41.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:41:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:46 -0800
Message-Id: <09c60431de6fc10ef43cdcd815b25a27069dcb04.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 12/12] packagegroup-self-hosted: add git-perltools
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
X-List-Received-Date: Mon, 05 Jan 2015 20:41:06 -0000

From: Jackie Huang <jackie.huang@windriver.com>

git-perltools provides some usefull git tools like:
git-submodule, git-request-pull, git-send-email, git-am, etc.

We should have it added in self-hosted image.

(From OE-Core rev: 4b0cbdc9c94b336f3102d4cce1886842b28ce6d5)

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 65aca7f..f95ce77 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -120,6 +120,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     gettext \
     gettext-runtime \
     git \
+    git-perltools \
     grep \
     groff \
     gzip \
-- 
1.9.1


