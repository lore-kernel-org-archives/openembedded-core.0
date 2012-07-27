Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Suj3e-0002wI-CD for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:50:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBceHW005742;
	Fri, 27 Jul 2012 12:38:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05276-04; Fri, 27 Jul 2012 12:38:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBcUws005736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jul 2012 12:38:31 +0100
Message-ID: <1343389110.9574.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 12:38:30 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] eds-tools: Drop this recipe, its inappropriate in OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 11:50:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index 76b08d0..f7c222e 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -3,5 +3,3 @@
 #
 EXCLUDE_FROM_WORLD_pn-gobject-introspection = "1"
 
-# Need bzr
-EXCLUDE_FROM_WORLD_pn-eds-tools = "1"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index a23a0ee..1200589 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -126,7 +126,6 @@ BBCLASSEXTEND_append_pn-dtc = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-e2fsprogs = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-ed = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-evolution-data-server = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-eds-tools = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eee-acpi-scripts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"
diff --git a/meta/recipes-sato/eds/eds-tools_git.bb b/meta/recipes-sato/eds/eds-tools_git.bb
deleted file mode 100644
index 97279ce..0000000
--- a/meta/recipes-sato/eds/eds-tools_git.bb
+++ b/dev/null
@@ -1,20 +0,0 @@
-LICENSE = "GPLv2"
-SECTION = "x11"
-DEPENDS = "dbus-glib evolution-data-server"
-RDEPENDS_${PN} = "libedata-book"
-DESCRIPTION = "Test applications for EDS"
-
-SRCREV = "5e9afbd22a021d1f0d0a0249d5995d19dd770584"
-PR = "r3"
-
-SRC_URI = "git://github.com/rossburton/eds-tools.git;protocol=git"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-
-FILES_${PN} += "${libdir}/evolution-data-server-1.2/extensions/*.so"
-FILES_${PN} += "${libdir}/evolution-data-server-1.2/extensions/*.la"
-FILES_${PN}-dbg += "${libdir}/evolution-data-server-1.2/extensions/.debug/*.so"




