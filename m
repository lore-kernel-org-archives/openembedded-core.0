Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SujQ8-00046W-4m for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:13:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RC1uVe005880
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:01:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05276-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:01:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RC1i8d005874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:01:46 +0100
Message-ID: <1343390504.9574.128.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:01:44 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: gtk-doc-stub: Add PROVIDES for gobject-introspection-stub and fix unpackaged files
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
X-List-Received-Date: Fri, 27 Jul 2012 12:13:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
index 195fc41..da2eca6 100644
--- a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
+++ b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
@@ -4,7 +4,7 @@ SECTION = "x11/base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PROVIDES = "gtk-doc"
+PROVIDES = "gtk-doc gobject-introspection-stub"
 
 SRCREV = "3dfd0a09de696ec8c544762747f8a0f77153622e"
 PV = "0.0+git${SRCPV}"
@@ -16,4 +16,6 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+FILES_${PN} += "${datadir}"
+
 BBCLASSEXTEND = "native"




