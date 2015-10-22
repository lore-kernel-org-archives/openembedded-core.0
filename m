Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 779E37713C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id D1968600F5A
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:51 +0100
Message-Id: <e1837b51e4054a725ce01007f27544ee21db79ef.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 30/52] i2c-tools: fix inverted RDEPENDS
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:25 -0000

From: Matt Madison <matt@madison.systems>

The runtime dependency between i2c-tools and i2c-tools-misc was
backwards when the packages were split.  With this change,
including i2c-tools in an image no longer drags in perl.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
index 92f4d69..042695b 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
@@ -30,5 +30,4 @@ FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
                         ${bindir}/decode-dimms \
                         ${bindir}/decode-vaio \
                        "
-RDEPENDS_${PN} += "${PN}-misc"
-RDEPENDS_${PN}-misc += "perl"
+RDEPENDS_${PN}-misc = "${PN} perl"
-- 
2.1.4


