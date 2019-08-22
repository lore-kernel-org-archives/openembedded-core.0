Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1E57E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:08:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7M27jUm024784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2019 19:07:55 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 21 Aug 2019 19:07:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 22 Aug 2019 10:07:30 +0800
Message-ID: <1566439650-17423-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566439650-17423-1-git-send-email-hongxu.jia@windriver.com>
References: <20190822020240.2334.69764@do>
	<1566439650-17423-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 2/3] ncurses: upgrade 6.1+20181013 -> 6.1+20190803
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
X-List-Received-Date: Thu, 22 Aug 2019 02:08:20 -0000
Content-Type: text/plain

---
 .../ncurses/{ncurses_6.1+20181013.bb => ncurses_6.1+20190803.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1+20181013.bb => ncurses_6.1+20190803.bb} (87%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb b/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
similarity index 87%
rename from meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
rename to meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
index ef6ca98..a44d78e 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "7a97a7f937762ba342d5b2fd7cd090885a809835"
+SRCREV = "3c9b2677c96c645496997321bf2fe465a5e7e21f"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.4


