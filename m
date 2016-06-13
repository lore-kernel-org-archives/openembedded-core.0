Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C74E56FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5D9GtnG004410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Jun 2016 02:16:55 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:35 -0400
Message-ID: <9e2f35b1dbe87525a2854569787b87cd0fa594d1.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] ncurses: upgrade to 6.0+20160319
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:54 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ncurses/{ncurses_6.0+20160213.bb => ncurses_6.0+20160319.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160213.bb => ncurses_6.0+20160319.bb} (84%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb b/meta/recipes-core/ncurses/ncurses_6.0+20160319.bb
similarity index 84%
rename from meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20160319.bb
index 0d56481..b23ac10 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20160319.bb
@@ -4,7 +4,7 @@ SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "a25949ff653ac5ae7a204381a3ebfd800feeaa01"
+SRCREV = "05af40f7d3af1e43144ed5315e31c7044c122fab"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.8.1


