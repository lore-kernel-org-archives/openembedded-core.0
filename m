Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0Hp-0005vP-Nm
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:57 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so279267wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=YYMKdHrqGjQBY7OaliponF2F9CYcpaHooLDP/vkALLw=;
	b=B/I7k3jiCa0wDnj19l11Ek2EdheyGmjbOm6Da4ZsetdZ+jet14Y/ETqFgS2XS0Yopy
	Gabcpuj9juS9XN6FPAKhI9uBpeDr8mcbSL2/CNkFTu+b2aggSFDiWywji3+8aO9aMzrh
	WnbzjCQ7zitQSzGGGyicaS5tM2sN41nbjYaYLcs93a8owsQ2CfIklGO83eWwrg2WlcxN
	kd4M2jSTQ2WJiFxE82Xg3xp/7hjvKTuNG82+9iq2KCXcUDNsg9JIg53bDCodMUsZGe7H
	oTXWq+Otd/6upgAx3SA7r/2bKla/S1dpwnTm3QJeNkMUZ9VBskP0UhvKA4aCCHkKVQ0b
	I2/Q==
Received: by 10.180.87.34 with SMTP id u2mr32317153wiz.3.1348698488953;
	Wed, 26 Sep 2012 15:28:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm28021337wix.9.2012.09.26.15.28.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:28:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:12 +0200
Message-Id: <cbb7697a9efcc1067a79c127d747de509d246f45.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] qt4: drop patches not used in any recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 22:40:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qt4/qt4-4.8.1/0008-qt-lib-infix.patch          | 41 ----------
 .../qt4/qt4-4.8.1/blacklist-diginotar-certs.diff   | 95 ----------------------
 .../qt4/qt4-4.8.1/compile.test-lflags.patch        | 17 ----
 .../qt4/qt4-4.8.1/fix-config-tests.patch           | 38 ---------
 4 files changed, 191 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0008-qt-lib-infix.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/blacklist-diginotar-certs.diff
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/compile.test-lflags.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/fix-config-tests.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0008-qt-lib-infix.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0008-qt-lib-infix.patch
deleted file mode 100644
index d308a15..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Add lib infix for QtUiTools to distinguish different Qt edition: e.g. "E" for embedded, "" for X11
-
-Patch has been accepted upstream and should be included in the next major version (4.8.0), see:
-http://bugreports.qt.nokia.com/browse/QTBUG-7169
-
-Original Author: Jeremy Lainé <jeremy.laine@m4x.org>
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-Upstream-Status: Accepted
-
---- /tmp/uitools.prf	2009-12-01 18:38:22.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.0/mkspecs/features/uitools.prf	2009-12-01 18:58:16.000000000 +0100
-@@ -3,11 +3,11 @@
- 
- # Include the correct version of the UiLoader library
- symbian: QTUITOOLS_LINKAGE = -lQtUiTools.lib
--else: QTUITOOLS_LINKAGE = -lQtUiTools
-+else: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
- 
- CONFIG(debug, debug|release) {
--    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
--    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
-+    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
-+    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
- }
- LIBS += $$QTUITOOLS_LINKAGE
- 
---- /tmp/uitools.pro	2009-12-01 18:40:28.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.0/tools/designer/src/uitools/uitools.pro	2009-12-01 18:59:18.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE = lib
--TARGET = $$qtLibraryTarget(QtUiTools)
-+TARGET = QtUiTools
- QT += xml
- CONFIG += qt staticlib
- DESTDIR = ../../../../lib
-@@ -43,3 +43,5 @@
-    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
-    QMAKE_PKGCONFIG_REQUIRES += QtXml
- }
-+
-+TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/blacklist-diginotar-certs.diff b/meta/recipes-qt/qt4/qt4-4.8.1/blacklist-diginotar-certs.diff
deleted file mode 100644
index 4d88ae2..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/blacklist-diginotar-certs.diff
+++ /dev/null
@@ -1,95 +0,0 @@
-http://labs.qt.nokia.com/2011/09/02/what-the-diginotar-security-breach-means-for-qt-users/
-http://labs.qt.nokia.com/2011/09/07/what-the-diginotar-security-breach-means-for-qt-users-continued/
-
-Original Author:Nokia
-Upstream-Status: Integrated in upcoming versions
-
-diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslcertificate.cpp
-index 328c5c2..1ae98f4 100644
---- a/src/network/ssl/qsslcertificate.cpp
-+++ b/src/network/ssl/qsslcertificate.cpp
-@@ -803,22 +803,47 @@ QList<QSslCertificate> QSslCertificatePrivate::certificatesFromDer(const QByteAr
- // These certificates are known to be fraudulent and were created during the comodo
- // compromise. See http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
- static const char *certificate_blacklist[] = {
--    "04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e",
--    "f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06",
--    "d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3",
--    "39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29",
--    "3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71",
--    "e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47",
--    "92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43",
--    "b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0",
--    "d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0",
-+    "04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e", "mail.google.com", // Comodo
-+    "f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06", "www.google.com", // Comodo
-+    "d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3", "login.yahoo.com", // Comodo
-+    "39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29", "login.yahoo.com", // Comodo
-+    "3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71", "login.yahoo.com", // Comodo
-+    "e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47", "login.skype.com", // Comodo
-+    "92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43", "addons.mozilla.org", // Comodo
-+    "b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0", "login.live.com", // Comodo
-+    "d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0", "global trustee", // Comodo
-+
-+    "05:e2:e6:a4:cd:09:ea:54:d6:65:b0:75:fe:22:a2:56", "*.google.com", // leaf certificate issued by DigiNotar
-+    "0c:76:da:9c:91:0c:4e:2c:9e:fe:15:d0:58:93:3c:4c", "DigiNotar Root CA", // DigiNotar root
-+    "f1:4a:13:f4:87:2b:56:dc:39:df:84:ca:7a:a1:06:49", "DigiNotar Services CA", // DigiNotar intermediate signed by DigiNotar Root
-+    "36:16:71:55:43:42:1b:9d:e6:cb:a3:64:41:df:24:38", "DigiNotar Services 1024 CA", // DigiNotar intermediate signed by DigiNotar Root
-+    "0a:82:bd:1e:14:4e:88:14:d7:5b:1a:55:27:be:bf:3e", "DigiNotar Root CA G2", // other DigiNotar Root CA
-+    "a4:b6:ce:e3:2e:d3:35:46:26:3c:b3:55:3a:a8:92:21", "CertiID Enterprise Certificate Authority", // DigiNotar intermediate signed by "DigiNotar Root CA G2"
-+    "5b:d5:60:9c:64:17:68:cf:21:0e:35:fd:fb:05:ad:41", "DigiNotar Qualified CA", // DigiNotar intermediate signed by DigiNotar Root
-+
-+    "1184640176",                                      "DigiNotar Services 1024 CA", // DigiNotar intermediate cross-signed by Entrust
-+    "120000525",                                       "DigiNotar Cyber CA", // DigiNotar intermediate cross-signed by CyberTrust
-+    "120000505",                                       "DigiNotar Cyber CA", // DigiNotar intermediate cross-signed by CyberTrust
-+    "120000515",                                       "DigiNotar Cyber CA", // DigiNotar intermediate cross-signed by CyberTrust
-+    "20015536",                                        "DigiNotar PKIoverheid CA Overheid en Bedrijven", // DigiNotar intermediate cross-signed by the Dutch government
-+    "20001983",                                        "DigiNotar PKIoverheid CA Organisatie - G2", // DigiNotar intermediate cross-signed by the Dutch government
-+    "d6:d0:29:77:f1:49:fd:1a:83:f2:b9:ea:94:8c:5c:b4", "DigiNotar Extended Validation CA", // DigiNotar intermediate signed by DigiNotar EV Root
-+    "1e:7d:7a:53:3d:45:30:41:96:40:0f:71:48:1f:45:04", "DigiNotar Public CA 2025", // DigiNotar intermediate
-+//    "(has not been seen in the wild so far)", "DigiNotar Public CA - G2", // DigiNotar intermediate
-+//    "(has not been seen in the wild so far)", "Koninklijke Notariele Beroepsorganisatie CA", // compromised during DigiNotar breach
-+//    "(has not been seen in the wild so far)", "Stichting TTP Infos CA," // compromised during DigiNotar breach
-+    "1184640175", "DigiNotar Root CA", // DigiNotar intermediate cross-signed by Entrust
-+    "1184644297", "DigiNotar Root CA", // DigiNotar intermediate cross-signed by Entrust
-     0
- };
- 
- bool QSslCertificatePrivate::isBlacklisted(const QSslCertificate &certificate)
- {
-     for (int a = 0; certificate_blacklist[a] != 0; a++) {
--        if (certificate.serialNumber() == certificate_blacklist[a])
-+        QString blacklistedCommonName = QString::fromUtf8(certificate_blacklist[(a+1)]);
-+        if (certificate.serialNumber() == certificate_blacklist[a++] &&
-+            (certificate.subjectInfo(QSslCertificate::CommonName) == blacklistedCommonName ||
-+             certificate.issuerInfo(QSslCertificate::CommonName) == blacklistedCommonName))
-             return true;
-     }
-     return false;
-diff --git a/src/network/ssl/qsslsocket_openssl.cpp b/src/network/ssl/qsslsocket_openssl.cpp
-index 141d80a..b8e6c4c 100644
---- a/src/network/ssl/qsslsocket_openssl.cpp
-+++ b/src/network/ssl/qsslsocket_openssl.cpp
-@@ -1193,12 +1193,16 @@ bool QSslSocketBackendPrivate::startHandshake()
-     X509 *x509 = q_SSL_get_peer_certificate(ssl);
-     configuration.peerCertificate = QSslCertificatePrivate::QSslCertificate_from_X509(x509);
-     q_X509_free(x509);
--    if (QSslCertificatePrivate::isBlacklisted(configuration.peerCertificate)) {
--        q->setErrorString(QSslSocket::tr("The peer certificate is blacklisted"));
--        q->setSocketError(QAbstractSocket::SslHandshakeFailedError);
--        emit q->error(QAbstractSocket::SslHandshakeFailedError);
--        plainSocket->disconnectFromHost();
--        return false;
-+
-+    // check the whole chain for blacklisting (including root, as we check for subjectInfo and issuer)
-+    foreach (const QSslCertificate &cert, configuration.peerCertificateChain) {
-+        if (QSslCertificatePrivate::isBlacklisted(cert)) {
-+            q->setErrorString(QSslSocket::tr("The peer certificate is blacklisted"));
-+            q->setSocketError(QAbstractSocket::SslHandshakeFailedError);
-+            emit q->error(QAbstractSocket::SslHandshakeFailedError);
-+            plainSocket->disconnectFromHost();
-+            return false;
-+        }
-     }
- 
-     // Start translating errors.
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/compile.test-lflags.patch b/meta/recipes-qt/qt4/qt4-4.8.1/compile.test-lflags.patch
deleted file mode 100644
index 1d725b7..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/compile.test-lflags.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Pass through LDFLAGS to configure tests
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: qt-everywhere-opensource-src-4.6.3/config.tests/unix/compile.test
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/config.tests/unix/compile.test	2010-06-02 06:03:18.000000000 +0400
-+++ qt-everywhere-opensource-src-4.6.3/config.tests/unix/compile.test	2010-10-04 17:35:07.587783460 +0400
-@@ -11,7 +11,7 @@
- EXE=`basename "$6"`
- DESCRIPTION=$7
- shift 7
--LFLAGS=""
-+LFLAGS="$LDFLAGS"
- INCLUDEPATH=""
- CXXFLAGS=""
- MAC_ARCH_CXXFLAGS=""
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/fix-config-tests.patch b/meta/recipes-qt/qt4/qt4-4.8.1/fix-config-tests.patch
deleted file mode 100644
index 1e0d14e..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/fix-config-tests.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Fix invocation in case of "ccache some-compiler-gcc". As the command "ccache some-compiler-gcc" will not exist but "ccache" will.
-
-both visibility and relocs were affected.
-
-Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-Upstream-Status: Pending
-
-Index: qt-x11-opensource-src-4.5.2/config.tests/unix/bsymbolic_functions.test
-===================================================================
---- qt-x11-opensource-src-4.5.2.orig/config.tests/unix/bsymbolic_functions.test 2009-08-01 08:01:11.000000000 +0200
-+++ qt-x11-opensource-src-4.5.2/config.tests/unix/bsymbolic_functions.test      2009-08-01 08:01:16.000000000 +0200
-@@ -8,7 +8,7 @@
- int main() { return 0; }
- EOF
- 
--"$COMPILER" -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC bsymbolic_functions.c >/dev/null 2>&1 && BSYMBOLIC_FUNCTIONS_SUPPORT=yes
-+$COMPILER -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC bsymbolic_functions.c >/dev/null 2>&1 && BSYMBOLIC_FUNCTIONS_SUPPORT=yes
- rm -f bsymbolic_functions.c libtest.so
- 
- # done
-Index: qt-x11-opensource-src-4.5.2/config.tests/unix/fvisibility.test
-===================================================================
---- qt-x11-opensource-src-4.5.2.orig/config.tests/unix/fvisibility.test 2009-06-20 06:57:50.000000000 +0200
-+++ qt-x11-opensource-src-4.5.2/config.tests/unix/fvisibility.test      2009-08-01 07:59:05.000000000 +0200
-@@ -15,9 +15,9 @@
- EOF
- 
-     if [ "$VERBOSE" = "yes" ] ; then
--        "$COMPILER" -c -fvisibility=hidden fvisibility.c && FVISIBILITY_SUPPORT=yes
-+        $COMPILER -c -fvisibility=hidden fvisibility.c && FVISIBILITY_SUPPORT=yes
-     else
--        "$COMPILER" -c -fvisibility=hidden fvisibility.c >/dev/null 2>&1 && FVISIBILITY_SUPPORT=yes
-+        $COMPILER -c -fvisibility=hidden fvisibility.c >/dev/null 2>&1 && FVISIBILITY_SUPPORT=yes
-     fi
-     rm -f fvisibility.c fvisibility.o
- }
-
-- 
1.7.12



