Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CAA1C610CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:42:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2SDga1J019564 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:42:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lEZAzRaejJxI
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:42:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2SDgXKv019541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:42:35 GMT
Message-ID: <1396014148.14790.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 13:42:28 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_*.bbclass: Simplify addtask
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
X-List-Received-Date: Fri, 28 Mar 2014 13:42:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The package_write task was previously removed. Remove a remaining superfluous
reference to it.

(From OE-Core rev: 74c48d8ff3502a4d11df05dc70da6b4155e1800d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 9ae0017..7bc29df 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -308,7 +308,7 @@ python do_package_write_deb () {
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[umask] = "022"
-addtask package_write_deb before do_package_write after do_packagedata do_package
+addtask package_write_deb after do_packagedata do_package
 
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index aab31e5..2949d1d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -253,7 +253,7 @@ python do_package_write_ipk () {
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
-addtask package_write_ipk before do_package_write after do_packagedata do_package
+addtask package_write_ipk after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9e63878..1ff2b36 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -723,7 +723,7 @@ python do_package_write_rpm () {
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
-addtask package_write_rpm before do_package_write after do_packagedata do_package
+addtask package_write_rpm after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"



