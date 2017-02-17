Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C31F760557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:28:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2017 10:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,172,1484035200"; d="scan'208";a="824614603"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.195.61])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2017 10:28:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 17 Feb 2017 10:28:00 -0800
Message-Id: <1487356080-8124-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] apt-package: use ${libdir} instead of /usr/lib
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
X-List-Received-Date: Fri, 17 Feb 2017 18:28:02 -0000

Fixes ssue when building with x32

+ install -m 0644 /srv/sdc/builds/poky/10698/tmp/work/corei7-64-pokymllib64-linux/lib64-apt/1.2.12-r0/apt-1.2.12/debian/apt.systemd.daily /srv/sdc/builds/poky/10698/tmp/work/corei7-64-pokymllib64-linux/lib64-apt/1.2.12-r0/image/usr/lib/apt/
install: target '/srv/sdc/builds/poky/10698/tmp/work/corei7-64-pokymllib64-linux/lib64-apt/1.2.12-r0/image/usr/lib/apt/' is not a directory: No such file or directory

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/apt/apt-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 839d58e..7ebde38 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -83,7 +83,7 @@ do_install () {
 	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
 
 	install -d ${D}${systemd_unitdir}/system/
-	install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
+	install -m 0644 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
 	install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/system/
 	install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/system/
 	install -d ${D}${sysconfdir}/cron.daily/
-- 
2.7.4


