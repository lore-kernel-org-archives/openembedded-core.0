Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1318B7E07D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4C8HZ9R018121
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:35 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:17:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:25 +0800
Message-ID: <892252c3c1961d471cdf37c67a811353ab495e0b.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] ncurses: fix incorrect UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Sun, 12 May 2019 08:17:35 -0000
Content-Type: text/plain

The upstream git tag has a `upstream/' prefix, such as:
>>> import re
>>> pattern = "upstream/(?P<pver>\d+(\.\d+)+(\+\d+)*)"
>>> string = "upstream/6.1+20181013"
>>> result = re.match(pattern, string)
>>> result['pver']
'6.1+20181013'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/ncurses/ncurses_6.1+20181013.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
index ef6ca98..928c477 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
@@ -8,4 +8,4 @@ SRC_URI += "file://0001-tic-hang.patch \
 SRCREV = "7a97a7f937762ba342d5b2fd7cd090885a809835"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+UPSTREAM_CHECK_GITTAGREGEX = "upstream/(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.4


