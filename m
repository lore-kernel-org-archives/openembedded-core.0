Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44C2177115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:36:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F7a7fA005842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Aug 2016 00:36:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Aug 2016 00:36:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 03:35:59 -0400
Message-ID: <f2d0736dd176c21c4ef1d539a7e82dbfd1367f2a.1471246475.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471246474.git.hongxu.jia@windriver.com>
References: <cover.1471246474.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ncurses: upgrade to 6.0+20160625
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
X-List-Received-Date: Mon, 15 Aug 2016 07:36:07 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ncurses/{ncurses_6.0+20160319.bb => ncurses_6.0+20160625.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160319.bb => ncurses_6.0+20160625.bb} (84%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160319.bb b/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
similarity index 84%
rename from meta/recipes-core/ncurses/ncurses_6.0+20160319.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
index b23ac10..6514613 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20160319.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
@@ -4,7 +4,7 @@ SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "05af40f7d3af1e43144ed5315e31c7044c122fab"
+SRCREV = "63dd558cb8e888d6fab5f00bbf7842736a2356b9"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.8.1


