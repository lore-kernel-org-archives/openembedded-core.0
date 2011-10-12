Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDz4e-00019D-1U for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:42:28 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDhCg9005757 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:43:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pDDxtodGjiob
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:43:12 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDh9Lm005754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:43:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:36:27 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426596.23801.160.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] Import python-setuptools from meta-oe (for glib-2.0)
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
X-List-Received-Date: Wed, 12 Oct 2011 13:42:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
new file mode 100644
index 0000000..ca7335e
--- a/dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
+
+SRCNAME = "setuptools"
+PR = "ml2"
+DEPENDS += "python"
+DEPENDS_virtclass-native += "python-native"
+
+SRC_URI = "\
+  http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz\
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+do_install_prepend() {
+    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+}
+
+RDEPENDS_${PN} = "\
+  python-distutils \
+  python-compression \
+"
+
+SRC_URI[md5sum] = "7df2a529a074f613b509fb44feefe74e"
+SRC_URI[sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
+
+BBCLASSEXTEND = "native"





