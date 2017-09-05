Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 805F577E65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 15:08:48 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id a47so7680121wra.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=C5y4qxK1zZVE1wbyQ+ZT1pnNCHt4dCu60FPjD0njoKY=;
	b=aU/V9j1glxg7nHA6OpcB08cneiU9NmgiBzLdo1ElbC+BAtKG/ZGJHU9RlpMOm+6cdS
	/fsVa4Gkr0SVtzCtroLX9KEqSpMZdxvMM1net4MZM6O8bXCnJ5p48p3qczXqB9oHMCE1
	tP589J9Ox768Hv/xFji1Vx3CB88b9zulMh1ScyfgrfMz5nyLK5uwlriO7XQDXNxforXL
	wWDyTibL4/oBB9jQCL/SKsr1wNolcuwG7V680fTxQEYbu/miuuC80jvPRXfjfT1jFCj0
	NfCSA9qDbjabHTBfglE92qU5h+36xjHsRhUQtO6hNY3+nm7knbgM6zU4nepR+plVLF5n
	YiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C5y4qxK1zZVE1wbyQ+ZT1pnNCHt4dCu60FPjD0njoKY=;
	b=OcRyibev0K6a2pgAI5qK+fjWnyyZ+W72TwRViGU53LsL215yHFPPPk/kcoqyRdmE3m
	I0yIyzbxR5x7aR9uhglCrts4IhMa2HBRAcILucDaKDyGzP3QpeIX8Z3uJkw9Nx9j8I0f
	fhzEGjGtVO9V8AAut5RYNosiVzyAqHS9MDdj52leGDoI2xz6t8vqn6HJA3FTgsFn9/Pg
	+Z0gNkYnk74d58rK5ve13JlPiekd4Mwtt5gwSfrpAah59rW+Jgrvjkppjc1yfxHUQVEs
	1VfOdXsjdq2j+T5of1Gxrmqy27frLW2iAI6iMob9MzVU3Z3kp684UM/oG0T3XaZe+sPS
	h0NA==
X-Gm-Message-State: AHPjjUgxn7Gg62Tk1J+Yaut/uHWqCjMbNe6uunqtntFoxtVh3SCcgRc3
	hcLKf0A+8FFVDlp2MsU=
X-Google-Smtp-Source: ADKCNb7BH67B69bHqYGARKnjJKC+Ec6HwQX0sPLOK9zFyx89+oYzRprhowAgqjlgrFs53/9Ofp7ZbA==
X-Received: by 10.223.164.150 with SMTP id g22mr3001619wrb.331.1504624129239; 
	Tue, 05 Sep 2017 08:08:49 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q19sm985034wrb.17.2017.09.05.08.08.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 08:08:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 16:08:47 +0100
Message-Id: <20170905150847.32681-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: recommend shared-mime-info
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
X-List-Received-Date: Tue, 05 Sep 2017 15:08:49 -0000

Large portions of GIO are not that useful without the MIME database.  Add a
recommends to shared-mime-info so that GIO works out of the box, but can be
removed (using BAD_RECOMMENDATIONS) if shared-mime-info is too large and isn't
required.

[ YOCTO #11792 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d6ef4dfc0b0..ce15ccefc39 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -73,6 +73,8 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
                        ${bindir}/gdbus-codegen"
 FILES_${PN}-utils = "${bindir}/*"
 
+RRECOMMENDS_${PN} += "shared-mime-info"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 # Valgrind runtime detection works using hand-written assembly, which
-- 
2.11.0


