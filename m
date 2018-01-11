Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F19F787ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 03:09:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0B39NOc017239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 19:09:24 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 10 Jan 2018 19:09:23 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jan 2018 11:07:06 +0800
Message-ID: <20180111030706.18174-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] systemd: add RDEPENDS on util-linux-getopt
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
X-List-Received-Date: Thu, 11 Jan 2018 03:09:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

'getopt' is needed by systemd-sysv-install, or it fails with:
| kdump.service is not a native service, redirecting to systemd-sysv-install.
| Executing: /lib/systemd/systemd-sysv-install enable kdump
| /lib/systemd/systemd-sysv-install: line 15: getopt: command not found

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 4132cdf40f..5a0e4c2247 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -521,7 +521,7 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-getopt"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
-- 
2.11.0


