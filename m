Return-Path: <lukasz.laguna@3mdeb.com>
X-Greylist: delayed 3604 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Mar 2019 11:35:31 UTC
Received: from 18.mo6.mail-out.ovh.net (18.mo6.mail-out.ovh.net
	[46.105.73.110])
	by mail.openembedded.org (Postfix) with ESMTP id 8289379D5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 11:35:31 +0000 (UTC)
Received: from player699.ha.ovh.net (unknown [10.109.143.208])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 831FA1B0F5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 11:19:17 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: lukasz.laguna@3mdeb.com)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 0EF7439222C1;
	Tue, 12 Mar 2019 10:19:15 +0000 (UTC)
From: =?UTF-8?q?=C5=81ukasz=20=C5=81aguna?= <lukasz.laguna@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 11:18:56 +0100
Message-Id: <20190312101856.32280-1-lukasz.laguna@3mdeb.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 9774218570546854081
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrgeekgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: maciej.pijanowski@3mdeb.com
Subject: [PATCH][pyro] bmap-tools_3.2.bb: add lacking packages in RDEPENDS
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
X-List-Received-Date: Tue, 12 Mar 2019 11:35:31 -0000

---
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
index e10f5fd341d2..099fa998acf9 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
 SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
 SRC_URI[sha256sum] = "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
 
-RDEPENDS_${PN} = "python-core python-compression"
+RDEPENDS_${PN} = "python-core python-compression python-mmap python-setuptools python-fcntl python-argparse python-xml"
 
 inherit setuptools
 
-- 
2.17.1


