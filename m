Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0001060D68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 08:12:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s068CaSl008741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jan 2014 00:12:36 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 6 Jan 2014 00:12:35 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2014 16:12:33 +0800
Message-ID: <1388995953-18814-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] libpthread-stubs: should set ALLOW_EMPTY
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
X-List-Received-Date: Mon, 06 Jan 2014 08:12:36 -0000
Content-Type: text/plain

The package might be empty while pthread functions are being provided by
libc, so we need set ALLOW_EMPTY with it or it will break do_rootfs task.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../xorg-lib/libpthread-stubs_0.3.bb               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
index ad046d1..3e7ef27 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
@@ -11,6 +11,8 @@ PARALLEL_MAKE = ""
 #DEPENDS = "xcb-proto xproto libxau libxslt-native"
 # DEPENDS += "xsltproc-native gperf-native"
 
+ALLOW_EMPTY_${PN} = "1"
+
 SRC_URI = "http://xcb.freedesktop.org/dist/libpthread-stubs-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "e8fa31b42e13f87e8f5a7a2b731db7ee"
-- 
1.7.1


