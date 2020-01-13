Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 24F727FC93
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:34 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id p27so3940060pli.10
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TeSd9MG3lXjqBiroTUuzIsGLpnt66kOHFEtKmGv91x8=;
	b=YNKBXMQiT/jfX9fHCzd27TMLGd/k58yp0E7Gn076WL4wKDhXZRhpKsq5VGBjLCdzbs
	NI9cFU/qWPcYpYUNzoPytqlgE+39zgzxvtzwoI9IfKDmELMFMsSGjXP0F4U6SY9IbGUN
	tFU1KnAChe5mmI8OqtxB9Q9sYNRt+yKQtlTO6w+0R9frkiZBL/iAxL+SRWCT3n+vIQQj
	M1PWcC2QvqRy0xpHl6pC5vd4ff6puXa7A+RWkv9yrkDlUKc0QaavRB2p3JulplnZwLR3
	JF6NdRwoRumTCGG03O6tQJ7Zp70xHXbtY+veq6sJ3zgXpETC4t082gHBgx8xjspILweN
	VnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TeSd9MG3lXjqBiroTUuzIsGLpnt66kOHFEtKmGv91x8=;
	b=XQvDxiuwFa650fwbRSW/2lSfLkvIKigGxM7gCNGOnSk/RD8Ae7VVHlq1cLjaEARvJg
	iXFrCIaiCi0ulYzXFKAOZr2bAwC0ge+KDClZTVWMiuz5YkAZqX/roRaWDT32zJh7dKAn
	PoA/fymu8eBulhwPHSjqp/lfwmRvdgWEU4/T2FWa5B1MvwGWoLNIKmnGhxORf36cSIYM
	1DIS1ZFr9tIkXqql1eqb3fl48HLT+1Ob+2vVUR65t72wooO9fwsqog7t0Kg3qV1UYWCU
	5MGxJYyllOZ56oEf0TPRZQu1VYuMl9sZ8nwK4Jr6O3F0zFX5mIsa+BLvV4BZmMWUEGG2
	rjrA==
X-Gm-Message-State: APjAAAV8btCiviPylkZujxIvZNN1ZAHKZG/kzpqs16LU7rXQ6ghJSJqB
	y8nQ4667OOJItJRcX8cXKbQ7N1vA
X-Google-Smtp-Source: APXvYqxVrXK7QKA8OPrUAnQOuuXn9+HonWLD09I5H+LGN68fwyU0qflnaijJSxmNwe6miUrrGdNdoA==
X-Received: by 2002:a17:90a:d081:: with SMTP id
	k1mr23343703pju.57.1578929435145; 
	Mon, 13 Jan 2020 07:30:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:02 -0800
Message-Id: <44d4dda6db56107d7ce900730b370a2ec81d9c30.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 03/28] git: set CVE vendor to git-scm
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:34 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 26a22ac1e8..6e137432f0 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
+CVE_PRODUCT = "git-scm:git"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.17.1


