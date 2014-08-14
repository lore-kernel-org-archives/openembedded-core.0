Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13B9B70A38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:45:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E8jsw3006600
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:45:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 01:45:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 16:46:01 +0800
Message-ID: <d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408005909.git.Qi.Chen@windriver.com>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] systemd: add libdw to RDEPENDS
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
X-List-Received-Date: Thu, 14 Aug 2014 08:45:53 -0000
Content-Type: text/plain

Add libdw to RDEPENDS of systemd to avoid build-deps QA warning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_215.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core/systemd/systemd_215.bb
index 770787b..a52a042 100644
--- a/meta/recipes-core/systemd/systemd_215.bb
+++ b/meta/recipes-core/systemd/systemd_215.bb
@@ -244,7 +244,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "libdw kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
 RDEPENDS_${PN} += "volatile-binds"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
-- 
1.7.9.5


