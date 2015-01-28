Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A45C672D84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qWFW008465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:32 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:27 -0800
Message-ID: <bb265a9fc38c94d8412d36ee3530116b6b3875bb.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] mingetty: fix SRC_URI
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:31 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL http://cdnetworks-kr-1.dl.sourceforge.net/project/mingetty/mingetty/1.08/mingetty-1.08.tar.gz, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index f1936af..3c16228 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
-SRC_URI = "http://cdnetworks-kr-1.dl.sourceforge.net/project/mingetty/mingetty/${PV}/mingetty-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "2a75ad6487ff271424ffc00a64420990"
 SRC_URI[sha256sum] = "0f55c90ba4faa913d91ef99cbf5cb2eb4dbe2780314c3bb17953f849c8cddd17"
-- 
1.7.9.5


