Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AEC83708FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 03:08:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6T38PRc028579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 20:08:25 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 20:08:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 11:08:41 +0800
Message-ID: <3bed83d83f5aec30fe843eac4c03c4b64105ceb3.1406603221.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406603221.git.Qi.Chen@windriver.com>
References: <cover.1406603221.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com
Subject: [PATCH V2 2/3] systemd: add volatile-binds to RDEPENDS
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
X-List-Received-Date: Tue, 29 Jul 2014 03:08:26 -0000
Content-Type: text/plain

This services generated from volatile-binds.bb recipe file only have
effect in a read-only filesystem. So if the rootfs is read-write, the
related service are not started.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_213.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 5de7cdc..4fb7ffc 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -243,6 +243,7 @@ FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_uni
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "volatile-binds"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
                       util-linux-agetty \
-- 
1.7.9.5


