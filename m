Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E096672F4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:55:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2O8tdHk008879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:55:39 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 01:55:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 01:55:33 -0700
Message-ID: <b72d9b60beb83ee4877df608ada45832bc80e3ed.1490345691.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1490345691.git.liezhi.yang@windriver.com>
References: <cover.1490345691.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] apt: fix hardcode of /usr/lib
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
X-List-Received-Date: Fri, 24 Mar 2017 08:55:38 -0000
Content-Type: text/plain

It should be ${libdir} rather than /usr/lib, otherwise it would fail
when multilib.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
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
2.9.0


