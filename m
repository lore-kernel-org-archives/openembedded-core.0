Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 633156F472
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:41:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s22Hfr2N023994 for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:41:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Fjr-5HQut2m6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:41:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s22HfopU023990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:41:51 GMT
Message-ID: <1393782102.22581.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 02 Mar 2014 17:41:42 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] acpica: Add recipe for latest version
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
X-List-Received-Date: Sun, 02 Mar 2014 17:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is now used by multiple architectures and is useful when working
with firmware. I'd love to see more BSPs shipping working firmware
builds and this should bring us a step closer to that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

---
diff --git a/meta/recipes-bsp/acpica/acpica_20140114.bb b/meta/recipes-bsp/acpica/acpica_20140114.bb
new file mode 100644
index 0000000..584023d
--- /dev/null
+++ b/meta/recipes-bsp/acpica/acpica_20140114.bb
@@ -0,0 +1,16 @@
+SRC_URI = "http://acpica.org/sites/acpica/files/acpica-unix2-20140114.tar.gz"
+LICENSE = "GPLv2.0 | ACPICA"
+LIC_FILES_CHKSUM = "file://source/include/acpi.h;endline=42;md5=23044abac8549f92999615207f2b8f56"
+
+S = "${WORKDIR}/acpica-unix2-${PV}/"
+
+EXTRA_OEMAKE = "CC='${CC}'"
+
+do_install () {
+	oe_runmake install DESTDIR='${D}' INSTALLFLAGS='-m 555' INSTALLDIR=${bindir}
+}
+
+SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
+SRC_URI[sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
+
+BBCLASSEXTEND = "native"



