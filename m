Return-Path: <jef.driesen@niko.eu>
X-Greylist: delayed 300 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Dec 2017 09:35:41 UTC
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	by mail.openembedded.org (Postfix) with ESMTP id D62C878761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 09:35:41 +0000 (UTC)
Received: from barracuda.home.lan
	([IPv6:2a02:1810:4f00:f900:208:9bff:fec2:1e15])
	by michel.telenet-ops.be with bizsmtp
	id oxWh1w00p2H4v4V06xWh2o; Fri, 22 Dec 2017 10:30:41 +0100
Received: from w7pt-jdi.ipw71bu.lan (84-199-78-189.ifiber.telenet-ops.be
	[84.199.78.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by barracuda.home.lan (Postfix) with ESMTPSA id 093EE3FF44;
	Fri, 22 Dec 2017 10:30:40 +0100 (CET)
From: Jef Driesen <jef.driesen@niko.eu>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 10:30:19 +0100
Message-Id: <1513935019-10643-1-git-send-email-jef.driesen@niko.eu>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] glib-2.0: Add python3 modules required by gdbus-codegen
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
X-List-Received-Date: Fri, 22 Dec 2017 09:35:42 -0000

The gdbus-codegen tool depends on python3, python3-distutils and python3-xml at
runtime. But because these dependencies are not stated in the yocto recipe,
those python modules are not automatically included in the SDK.

Signed-off-by: Jef Driesen <jef.driesen@niko.eu>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 42ab5f1..fbc655a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -115,6 +115,12 @@ do_install_append_class-target () {
 	fi
 }
 
+RDEPENDS_${PN}-codegen += "\
+            python3 \
+            python3-distutils \
+            python3-xml \
+           "
+
 RDEPENDS_${PN}-ptest += "\
             dbus \
             gnome-desktop-testing \
-- 
2.7.4


