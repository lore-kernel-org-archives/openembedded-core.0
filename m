Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB0176E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 02:44:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t992ij7R027572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 19:44:45 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 19:44:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 19:44:41 -0700
Message-ID: <5420813fb0882efe8261a884c9550d68e2b29505.1444358567.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444358567.git.liezhi.yang@windriver.com>
References: <cover.1444358567.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] recipes-devtools: cleanup CONFFILES
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
X-List-Received-Date: Fri, 09 Oct 2015 02:44:45 -0000
Content-Type: text/plain

The ${sysconfdir}/* are CONFFILES by default.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb |    2 --
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index ace3de4..861f011 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -28,8 +28,6 @@ do_install () {
 
 FILES_${PN} = "${sysconfdir}/opkg/ "
 
-CONFFILES_${PN} += "${sysconfdir}/opkg/arch.conf"
-
 RREPLACES_${PN} = "opkg-config-base"
 RCONFLICTS_${PN} = "opkg-config-base"
 RPROVIDES_${PN} = "opkg-config-base"
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
index 588250e..b510580 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
@@ -71,4 +71,3 @@ FILES_${PN} += "${systemd_unitdir}/system/"
 
 BBCLASSEXTEND = "native nativesdk"
 
-CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
-- 
1.7.9.5


