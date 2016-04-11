Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1D237320F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B7TT6H022955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:29 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:16 -0700
Message-ID: <c24d1c3e2dd0c08d8d570077d76f1fe2905eea82.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] ncurses: update SRC_URI
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:28 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

Upstream re-arranged their FTP server and deleted the tarball that we were
downloading.  This tarball is mirrors on downloads.yoctoproject.org but not
everyone uses that, so Work around this by pointing the SRC_URI at the Yocto
Project source mirror directly.

[ YOCTO #9379 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses_5.9.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 54d27a9..35ef9c3 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -4,9 +4,11 @@ REVISION = "20150329"
 
 PR = "${INC_PR}.1"
 
-SRC_URI += "file://tic-hang.patch \
-            file://config.cache \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/ncurses-5.9-20150329.tgz \
+           file://tic-hang.patch \
+           file://config.cache \
 "
+
 S = "${WORKDIR}/${BP}-${REVISION}"
 SRC_URI[md5sum] = "cee991d09e69e60ebedef424804c52d4"
 SRC_URI[sha256sum] = "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f0938bd87c0eb75828f"
-- 
2.7.4


