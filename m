Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 214167117E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:25:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9V3PUfD023961
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 20:25:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 20:25:29 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 11:22:10 +0800
Message-ID: <30c6b34b50f003daa80a7c3ae43d89fdf18b9343.1414725684.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414725684.git.Chong.Lu@windriver.com>
References: <cover.1414725684.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gst-plugin-bluetooth: remove systemd service file
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
X-List-Received-Date: Fri, 31 Oct 2014 03:25:35 -0000
Content-Type: text/plain

The service file should be included in bluez4 package, not in plugin package.

This solves the following warning:

WARNING: QA Issue: gst-plugin-bluetooth: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/bluetooth.service [installed-vs-shipped]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
index f2dc0da..c71d612 100644
--- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
+++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
@@ -25,6 +25,7 @@ do_install_append() {
   	rm -rf ${D}${libdir}/alsa-lib
   	rm -rf ${D}${datadir}
 	rm -rf ${D}${includedir}
+	rm -rf ${D}${nonarch_base_libdir}
 }
 
 FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
-- 
1.9.1


