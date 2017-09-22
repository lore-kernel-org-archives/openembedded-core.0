Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4470B7827B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 23:52:20 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 16:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,428,1500966000"; d="scan'208";a="154532126"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.78.59])
	by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2017 16:52:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 22 Sep 2017 16:52:19 -0700
Message-Id: <20170922235219.2785-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] wayland-protocols: extend to native and fix dependencies
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
X-List-Received-Date: Fri, 22 Sep 2017 23:52:22 -0000

When trying to build a newer version of Mesa, a native version of
wayland-protocols is needed to build.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
index 4f9e9f32bfc..64044dae8d7 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
@@ -11,6 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
+
+DEPENDS = "wayland"
+
 SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
 SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a"
 
@@ -18,3 +21,5 @@ inherit allarch autotools pkgconfig
 
 PACKAGES = "${PN}"
 FILES_${PN} += "${datadir}/pkgconfig/wayland-protocols.pc"
+
+BBCLASSEXTEND = "native"
-- 
2.13.5


