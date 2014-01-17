Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 003FD6DC62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:26:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0HAQ6tk011698 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:26:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jwtDHR3zAavC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:26:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0HAPxVh011683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:26:01 GMT
Message-ID: <1389954353.14987.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 10:25:53 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] opkg/opkg-utils/chkconfig: Clean up u-a-cworth references
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
X-List-Received-Date: Fri, 17 Jan 2014 10:26:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Catch some u-a-cworth references that slipped through the move of u-a
to opkg-utils and its rename to -opkg.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index eb54a81..6aa5fb8 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Additional utilities for the opkg package manager"
+SUMMARY_update-alternatives-opkg = "Utility for managing the alternatives system"
 SECTION = "base"
 HOMEPAGE = "http://code.google.com/p/opkg/"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 527fe5d..7bea26d 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -1,6 +1,5 @@
 SUMMARY = "Open Package Manager"
 SUMMARY_libopkg = "Open Package Manager library"
-SUMMARY_update-alternatives-cworth = "Utility for managing the alternatives system"
 SECTION = "base"
 HOMEPAGE = "http://code.google.com/p/opkg/"
 BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 4560298..d285c50 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -56,7 +56,7 @@ SUMMARY_${PN}-alternatives-doc = "${SUMMARY_${PN}-alternatives} - Documentation
 DESCRIPTION_${PN}-alternatives-doc = "${DESCRIPTION_${PN}-alternatives}  \
 This package contains documentation."
 RPROVIDES_${PN}-alternatives += "update-alternatives"
-RCONFLICTS_${PN}-alternatives = "update-alternatives-cworth update-alternatives-dpkg"
+RCONFLICTS_${PN}-alternatives = "update-alternatives-opkg update-alternatives-dpkg"
 FILES_${PN}-alternatives = "${sbindir}/alternatives ${sbindir}/update-alternatives \
 			    ${sysconfdir}/alternatives ${localstatedir}/lib/alternatives"
 FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \



