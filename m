Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4997465D49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:14:11 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Jun 2014 11:14:05 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 18C0728BA4A;
	Wed, 25 Jun 2014 11:14:06 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jun 2014 11:13:59 +0200
Message-ID: <1403687639-13030-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] u-boot-fw-utils: install config file
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
X-List-Received-Date: Wed, 25 Jun 2014 09:14:22 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

The on-target fw_printenv and fw_setenv needs configuration file
(fw_env.config) to be present in the target.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index 14b0976..89fed8b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -26,8 +26,10 @@ do_compile () {
 
 do_install () {
   install -d ${D}${base_sbindir}
+  install -d ${D}${sysconfdir}
   install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
   install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+  install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.10.4


