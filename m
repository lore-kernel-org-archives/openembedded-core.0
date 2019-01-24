Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA7397BFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:00:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O707Uh026684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 23:00:07 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 23:00:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 23:00:01 -0800
Message-ID: <c50e7d5fa5d065d8385d85458fdc61ced18ef8f4.1548313066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1548313066.git.liezhi.yang@windriver.com>
References: <cover.1548313066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] ncurses: Add --cache-file to EXTRA_OECONF
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
X-List-Received-Date: Thu, 24 Jan 2019 07:00:06 -0000
Content-Type: text/plain

This can save configure time since it runs configure multiple times:
$ time bitbake ncurses-native -cconfigure
  35s -> 25s

  Saved 10s

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses_6.1+20181013.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
index b462b14..ef6ca98 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
@@ -7,5 +7,5 @@ SRC_URI += "file://0001-tic-hang.patch \
 # commit id corresponds to the revision in package version
 SRCREV = "7a97a7f937762ba342d5b2fd7cd090885a809835"
 S = "${WORKDIR}/git"
-EXTRA_OECONF += "--with-abi-version=5"
+EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.10.2


