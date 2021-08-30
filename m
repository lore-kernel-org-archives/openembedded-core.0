Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.16394.1630327373936952690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 05:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17UCgquQ004741
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 05:42:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17UCgpY5016035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 05:42:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 30 Aug 2021 05:42:51 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 30 Aug 2021 05:42:50 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rustfmt: fix SRC_URI
Date: Mon, 30 Aug 2021 20:42:46 +0800
Message-ID: <20210830124246.30922-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
index b7deb4097c..2e4a47eb00 100644
--- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
+++ b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
@@ -7,7 +7,7 @@ inherit cargo
 
 # how to get rustfmt-nightly could be as easy as but default to a git checkout:
 # SRC_URI += "crate://crates.io/rustfmt-nightly/1.4.2"
-SRC_URI += "git://github.com/rust-lang/rustfmt/;protocol=https;nobranch=1"
+SRC_URI += "git://github.com/rust-lang/rustfmt.git;protocol=https;nobranch=1"
 SRCREV = "aeb3496f31a0dfa90fc511520d2023634e885260"
 S = "${WORKDIR}/git"
 CARGO_SRC_DIR = ""
-- 
2.17.1

