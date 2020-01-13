Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 23D2D7FC99
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:33 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q127so4869506pga.4
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DswTZMG0O3HD0qfYq8CkAickAUsQj7AnioaNq+mgASo=;
	b=dIi6y2e5s5tNU+39z2I1b7euKh3YW30TJVbGhcAI4KLlUtJkiQ6Qphu0cy/Vbm2/Z6
	w3T55KPfyPbgCSCZ/AYWF6L1KXOBsWliiXo3eUUVKB3jb8/MAA6tnVzw/mPVLINlSmNE
	6Oucditqe1Zt68WgBmIrllqzuxaqXgMp3YpSqFGIP/LOQB/lIsvbANO09unKcTUAVqx0
	6cG7NQfdBla/Mm0/1+Brfv+Bq4kVQexiM2m9JjjB68ZymA8KLTW6CbseJq1YJBQhJ7dG
	D9fOu0d0Py5wVaT0g3bZRq6I2wQDevjjJPr4cF0ZBa0M4wTbP8EAA02aqd7ONGQI6WEF
	VItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DswTZMG0O3HD0qfYq8CkAickAUsQj7AnioaNq+mgASo=;
	b=rowWkAZV3ir8+QcKJrp1Xz642g0O0eSTfD9KYPeetz34j/4UpcgBlBNUBJt5vUyg88
	VP5gsAZzMA9ufa7dmiyvCscASS4nDU6AmhSMSWViB4VDEKYltiHYOLA3hXIwW/AQtSmT
	elEsHSvZCn130icyAO1dXv10ColyhSt8h3y2RtPo001SoC5unDQN4zensCQ6Rfd1w//d
	xe4mn7eRSR66aokBQGMEvl5WTYVvtBndhPNF4hFzZTeYyL/eHU/NGXVi1FXLGQn86iI1
	IsY/9K0F7gmbxd8xfJULDcM89/TeDLTDWIINB77vOPXOebACVxodqgibp9h2BVaStpeR
	i5hA==
X-Gm-Message-State: APjAAAWjE1Had8YhRf5XUw7a8KmH3R8OkQ2NTZr1QtIiAjblxHwIwnTW
	NGvaKYJ7RLttnvygGZgyupGKrpwu
X-Google-Smtp-Source: APXvYqzXnd6fExVQ0gtY2aU1U0i2uLS/zv4n84mfuRYHi3HNvgvxmsGXIOWdXGvUV/y/G1fapVD3DA==
X-Received: by 2002:a63:4850:: with SMTP id x16mr22100492pgk.334.1578929433522;
	Mon, 13 Jan 2020 07:30:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:01 -0800
Message-Id: <e128bd76ae9f4b30948e6b8fc68f4374e03c7bec.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 02/28] flex: set CVE_PRODUCT to include vendor
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:33 -0000

From: Ross Burton <ross.burton@intel.com>

There are many projects called Flex and they have CVEs, so also set the vendor
to remove these false positives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index b477cd8c7f..12ce0cb461 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -68,3 +68,6 @@ do_install_ptest() {
 	    -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
+
+# Not Apache Flex, or Adobe Flex, or IBM Flex.
+CVE_PRODUCT = "flex_project:flex"
-- 
2.17.1


