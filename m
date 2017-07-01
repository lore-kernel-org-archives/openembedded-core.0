Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4F6775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id s66so20428461pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j8j2vwmPrTcQyuEyDj6yKz3FUPqEvDTaa3vIjhP++QQ=;
	b=tE/Op4neRvJ/TKzLufS3faPuDwgjbcnxeO68hCcuDl23NoTGm5qsPr3DFImvGkEy+O
	Qzwh2Z3PFFDTchRwLXMHy7ZFP/BVDX0c4PQYwTVvI8jb1Z6df1I7fM1k0qN8Q2RDyHLT
	e+5qTZ3S+L2caP7RUMta7+CBt4pLyP1VeVNExo+isxRQ4LDunSheCYL6IqAwCD18vooB
	tiTE3tzqSkDf1Kv1GnUADY5C4ZAaSZCYXe8W5qvuUI3Gb0Q1Y1DCzmEV8waIIMG/DnYb
	hkiWxy9KyRD3grph10KyaEGSl2eS16UpQb8mcgXJ4JbjJSasnijkUnTbMtkTHGpZD5NG
	8HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j8j2vwmPrTcQyuEyDj6yKz3FUPqEvDTaa3vIjhP++QQ=;
	b=bSxSJSgsxuOpD2RJBudfSJNk9MnKQ0hZlgrUKfsl1S7HIjbyQT2+7fcxy05EtbaFx2
	GXN7wFG9yAi94O7Ddi1t0zlyS7BfKkFcS5tFcur9cJFwtt3SiRRc7xpsR24JqamYtEUQ
	xBJg3F1rc1sNYYdazNp1tZ7fZ+oDsCbsZ94YbKkZyFeU2GCfozwrhE4E9WNiHfO2ti0Z
	a26FSD5B80a0pRNISpIYR9OqUOD78aM5JKNq7h9Iji0I1xTJCNU5XUXBxVhERUIbSiZD
	nkLDO+9R4fCSo9dnSe29T21poX+uZLhSV3BX6sYJIC678rgSXA5u4cxBT89Fa4+cPOcK
	lCpQ==
X-Gm-Message-State: AIVw1111mSPJQGPYz4KolVwAjYkpngoIJt4/msQAhDOAAy89jjQacwtO
	Q6esvVJjaQJHbHyb
X-Received: by 10.98.59.1 with SMTP id i1mr930786pfa.147.1498919035292;
	Sat, 01 Jul 2017 07:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:14 -0700
Message-Id: <55301ed7b6254a06d1c3f60fc2fe19bd3d2c2b49.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 11/19] valgrind: Remove -no-pie from cflags
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:54 -0000

It has been moved to distro security include file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index a81adc31d6..888b132ec7 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -73,8 +73,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
-CFLAGS += "-no-pie"
-
 def get_mcpu(d):
     for arg in (d.getVar('TUNE_CCARGS') or '').split():
         if arg.startswith('-mcpu='):
-- 
2.13.2


