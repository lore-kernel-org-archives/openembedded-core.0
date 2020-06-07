Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.7401.1591536156552197695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 06:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 057DMFPp026340
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Jun 2020 06:22:25 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 7 Jun 2020 06:22:04 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] mdadm: remove service template from SYSTEMD_SERVICE
Date: Sun, 7 Jun 2020 21:21:56 +0800
Message-ID: <20200607132157.9417-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove service template mdmon@.service from SYSTEMD_SERVICE which should
be not started by systemctl directly. It is hanlded by udev rules.

Replace tab with spaces in SRC_URI as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 40c5273e00..001d3331a7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
            file://debian-no-Werror.patch \
            file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
-	   file://mdadm.init \
-	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
+           file://mdadm.init \
+           file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            "
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1
 
 inherit autotools-brokensep ptest systemd
 
-SYSTEMD_SERVICE_${PN} = "mdmonitor.service mdmon@.service"
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 CFLAGS_append_toolchain-clang = " -Wno-error=address-of-packed-member"
-- 
2.17.1

