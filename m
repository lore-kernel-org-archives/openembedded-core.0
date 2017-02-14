Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A99E71E30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 07:02:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1E72RY5030864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Feb 2017 23:02:27 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 23:02:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 14 Feb 2017 02:02:19 -0500
Message-ID: <99439a1b9a1b9953e09494ffc6c463d8f38bdbe7.1487055395.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1487055395.git.hongxu.jia@windriver.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Tue, 14 Feb 2017 07:02:27 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (84%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
similarity index 84%
rename from meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
index 6514613..7328e78 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
@@ -4,7 +4,7 @@ SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "63dd558cb8e888d6fab5f00bbf7842736a2356b9"
+SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.8.1


