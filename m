Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3BC86C687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:30:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN7UxTc003505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:30:59 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 23:30:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 15:47:23 +0800
Message-ID: <56a155eeb51a9472dc9a1ab9a5e401efd268e683.1542959097.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542959097.git.hongxu.jia@windriver.com>
References: <cover.1542959097.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ncurses: upgrade 6.1 -> 6.1+20181013
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
X-List-Received-Date: Fri, 23 Nov 2018 07:30:58 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ncurses/{ncurses_6.1+20180714.bb => ncurses_6.1+20181013.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1+20180714.bb => ncurses_6.1+20181013.bb} (86%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20180714.bb b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
similarity index 86%
rename from meta/recipes-core/ncurses/ncurses_6.1+20180714.bb
rename to meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
index b072869..b462b14 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20180714.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "3740e18875f16dfe126484869882fb15c3fd1aea"
+SRCREV = "7a97a7f937762ba342d5b2fd7cd090885a809835"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.4


