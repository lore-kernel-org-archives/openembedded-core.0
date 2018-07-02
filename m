Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA70F77DC9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w625lXES028352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:33 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:13 +0800
Message-ID: <b8832b1380214795c607d81168800392c10ea804.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] ncurses: 6.1 -> 6.1+20180630
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:32 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/ncurses/{ncurses_6.1.bb => ncurses_6.1+20180630.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1.bb => ncurses_6.1+20180630.bb} (86%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1.bb b/meta/recipes-core/ncurses/ncurses_6.1+20180630.bb
similarity index 86%
rename from meta/recipes-core/ncurses/ncurses_6.1.bb
rename to meta/recipes-core/ncurses/ncurses_6.1+20180630.bb
index 8d72f57..38faf7a 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20180630.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "518fe9f913a0bfb80f1e366c9fcccf23e79dc69b"
+SRCREV = "d3b29180ae4360d7ab7a41a15e963299fdb72e33"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.4


