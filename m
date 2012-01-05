Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1RimAK-0003kd-Ui
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:11:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q058cETG019045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jan 2012 00:38:14 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 5 Jan 2012 00:38:14 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <sgw@linux.intel.com>
Date: Thu, 5 Jan 2012 16:37:46 +0800
Message-ID: <1325752666-28560-5-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] tslib: enable big endian support for qemuppc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 12:11:31 -0000
Content-Type: text/plain

This enables wacom tablet/touchscreen support on qemuppc.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-graphics/tslib/tslib_1.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index f47116f..54ff3d4 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
 SRC_URI_append_qemumips += " file://32bitBE-support.patch"
+SRC_URI_append_qemuppc += " file://32bitBE-support.patch"
 
 
 inherit autotools pkgconfig
-- 
1.7.5.4



