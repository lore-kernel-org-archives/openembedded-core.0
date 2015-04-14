Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1740C73D27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E995nu010543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:09:02 -0700
Message-ID: <c8135fa378f5897cbc3a1f413a50d31b70664609.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] aspell: inherit binconfig-disabled
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:05 -0000
Content-Type: text/plain

There is a pspell-config.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/aspell/aspell_0.60.6.1.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index f546721..7cf17d6 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -25,4 +25,6 @@ FILES_libpspell = "${libdir}/libpspell.so.*"
 FILES_${PN}-dev += "${bindir}/pspell-config"
 
 ARM_INSTRUCTION_SET = "arm"
-inherit autotools-brokensep gettext texinfo
+inherit autotools-brokensep gettext texinfo binconfig-disabled
+
+BINCONFIG = "${bindir}/pspell-config"
-- 
1.7.9.5


