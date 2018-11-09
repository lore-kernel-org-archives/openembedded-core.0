Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7028D6C1C6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:57:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA98v3Nw004202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:57:04 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 00:57:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:07:05 +0800
Message-ID: <a747382214dfa3420434916df7250da659d232d4.1541754319.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541754319.git.hongxu.jia@windriver.com>
References: <cover.1541754319.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] ncurses: upgrade 6.1 -> 6.1+20180714
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
X-List-Received-Date: Fri, 09 Nov 2018 08:57:03 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ncurses/{ncurses_6.1+20180630.bb => ncurses_6.1+20180714.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1+20180630.bb => ncurses_6.1+20180714.bb} (86%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20180630.bb b/meta/recipes-core/ncurses/ncurses_6.1+20180714.bb
similarity index 86%
rename from meta/recipes-core/ncurses/ncurses_6.1+20180630.bb
rename to meta/recipes-core/ncurses/ncurses_6.1+20180714.bb
index 38faf7a..b072869 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20180630.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20180714.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "d3b29180ae4360d7ab7a41a15e963299fdb72e33"
+SRCREV = "3740e18875f16dfe126484869882fb15c3fd1aea"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.4


