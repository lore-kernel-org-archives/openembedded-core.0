Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD40472000
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 04:37:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA64bheP004115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 20:37:44 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 20:37:43 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Nov 2014 12:34:00 +0800
Message-ID: <1415248440-28251-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: add the dropped patches back
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
X-List-Received-Date: Thu, 06 Nov 2014 04:37:48 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

busybox-cross-menuconfig.patch and busybox-install-ping6-to-usr-bin.patch
were dropped when uprev, add them back.

no busybox-cross-menuconfig.patch, "bitbake -c menuconfig busybox" did not
work.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../{busybox-1.21.1 => busybox-1.22.1}/busybox-cross-menuconfig.patch   | 0
 .../busybox-install-ping6-to-usr-bin.patch                              | 0
 meta/recipes-core/busybox/busybox_1.22.1.bb                             | 2 ++
 3 files changed, 2 insertions(+)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox-1.22.1}/busybox-cross-menuconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox-1.22.1}/busybox-install-ping6-to-usr-bin.patch (100%)

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-cross-menuconfig.patch b/meta/recipes-core/busybox/busybox-1.22.1/busybox-cross-menuconfig.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-cross-menuconfig.patch
rename to meta/recipes-core/busybox/busybox-1.22.1/busybox-cross-menuconfig.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.22.1/busybox-install-ping6-to-usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.22.1/busybox-install-ping6-to-usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 82f7f68..2a4e647 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -6,6 +6,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
            file://busybox-udhcpc-no_deconfig.patch \
+           file://busybox-cross-menuconfig.patch \
+           file://busybox-install-ping6-to-usr-bin.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \
-- 
1.9.1


