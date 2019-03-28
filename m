Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 700EB7D14F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:43:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id p10so23006304wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/6uKnCp+ICx2bBfSSgVkiZ0jlcfzrbyqwYang4BDyIc=;
	b=Y3qf0Ik0thEmX7yA8roZYFR8axoA7wWoHFFR6PwcxRJvQJDlF+kRS2Q7PUbE2DC9Wf
	Zr2vpwPG1FW0T2696kJxASHIC/buHjTyFCdic3fnTxtgCaA+WE0n2SsRR63cx0HYsKGv
	T2GQDKP7iKnF/G+Pq6jWGfnyDy2F7fBPFgvUN8ItEfgtGUBNhrwXAf7VPaKkFsa+cdkx
	DjmRljR40TKY5vsqelSIYMBTBd6dZr6hMgdwcgHc6eu34tAnZw5yfQXkJvLo5uldpCPY
	2MynD9CeATHVzT5q1L0e0o/4ioVcsAdtrCNTZBQO0OXcmOcy89kzHUi1CRFyB+GAv16O
	msGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/6uKnCp+ICx2bBfSSgVkiZ0jlcfzrbyqwYang4BDyIc=;
	b=kzEj0DwaII6B97hpjhpnwYKnDdfgMid/aXwRl8Ur9GedsYCw8ueC5ZdnD76CydS1iu
	xkT55H+yobjA2GZo98O74Agaw0h7YCXjYwiQSrFbBeQP0ZgQN9FUCUoJw2nvKdM5vI+l
	FavDVvx4GLo4v05qSxxCCaQhBBIjaeKnKB+SE1zFv6bwiV2iMpWvQBw3B9pcE/yxNoHZ
	jyNNcg9MtySCZqr1Hl3+Ke28PQG9D2pGGG9ghlKcQig+oUNf5a0OXpDFanQISSpBa1hb
	eWS2XQQ+v5+0p58XyDZozewDch1BlY83cawEttFy62E++JLK46JnGQfk2+pbUuhuy8WA
	tEjQ==
X-Gm-Message-State: APjAAAWg1j+v9ziIrlyrutMrJVXapM74QZ6DM6B4D3Q2+cwFdK8M6Dpd
	4KkWlo5JUTVh0/PUyxwqQV6ERYRX9nI=
X-Google-Smtp-Source: APXvYqwupvoy8NHnTmTwL4Lp1hlKUimJVDNOwQghpZ5W/A08sjlEuiSQb9mFl1CTAXA6CSwoXb84sQ==
X-Received: by 2002:adf:eb85:: with SMTP id t5mr27504630wrn.168.1553780630902; 
	Thu, 28 Mar 2019 06:43:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d4sm2563141wrv.42.2019.03.28.06.43.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 06:43:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 13:43:48 +0000
Message-Id: <20190328134348.16189-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] packagegroup-core-base-utils: remove lzip
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
X-List-Received-Date: Thu, 28 Mar 2019 13:43:50 -0000

lzip is pretty niche: people are typically either sticking with that they know
(gzip, bzip) or using xz.  Data point: only one recipe in oe-core is shipped as
a .lz file.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
index 431dbb09261..611e0cafcc1 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -38,7 +38,6 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "kbd", "", d)} \
     kmod \
     less \
-    lzip \
     ncurses-tools \
     net-tools \
     parted \
-- 
2.11.0


