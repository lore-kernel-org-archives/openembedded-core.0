Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QMcnH-0001tH-5y
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 11:11:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 02:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3853549"
Received: from unknown (HELO helios) ([10.255.16.147])
	by fmsmga001.fm.intel.com with SMTP; 18 May 2011 02:08:54 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 18 May 2011 10:08:53 +0100
Message-Id: <f77e009fa6923ac446620d971190723f0a0561dc.1305709034.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1305709034.git.paul.eggleton@linux.intel.com>
References: <cover.1305709034.git.paul.eggleton@linux.intel.com>
Old-Date: Tue, 17 May 2011 11:53:22 +0100
Date: Wed, 18 May 2011 10:08:53 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] qt4: remove Qt 4.6.3
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
X-List-Received-Date: Wed, 18 May 2011 09:11:52 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

We should only have one version of Qt4 supported in oe-core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/0001-cross-compile.patch |   36 ------
 .../qt4/files/0002-fix-resinit-declaration.patch   |   22 ----
 .../files/0010-no-simpledecoration-example.patch   |   14 --
 ...klist-fraudulent-comodo-certificates-patch.diff |  134 --------------------
 meta/recipes-qt/qt4/files/g++.conf                 |   53 --------
 meta/recipes-qt/qt4/files/hack-out-pg_config.patch |   30 -----
 meta/recipes-qt/qt4/files/linux.conf               |   54 --------
 meta/recipes-qt/qt4/files/mips-relocate.patch      |   28 ----
 .../qt4/files/qthelp-lib-qtclucene.patch           |   86 -------------
 meta/recipes-qt/qt4/qt-4.6.3.inc                   |   57 ---------
 meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb          |    9 --
 meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb      |   11 --
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb   |    6 -
 meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf  |   54 --------
 meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb          |    6 -
 15 files changed, 0 insertions(+), 600 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/files/0001-cross-compile.patch
 delete mode 100644 meta/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
 delete mode 100644 meta/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
 delete mode 100644 meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
 delete mode 100644 meta/recipes-qt/qt4/files/g++.conf
 delete mode 100644 meta/recipes-qt/qt4/files/hack-out-pg_config.patch
 delete mode 100644 meta/recipes-qt/qt4/files/linux.conf
 delete mode 100644 meta/recipes-qt/qt4/files/mips-relocate.patch
 delete mode 100644 meta/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-4.6.3.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb

diff --git a/meta/recipes-qt/qt4/files/0001-cross-compile.patch b/meta/recipes-qt/qt4/files/0001-cross-compile.patch
deleted file mode 100644
index 053be06..0000000
--- a/meta/recipes-qt/qt4/files/0001-cross-compile.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add configure option "crossarch" for cross compiling
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
-Index: qt-embedded-linux-opensource-src-4.4.3/configure
-===================================================================
---- qt-embedded-linux-opensource-src-4.4.3.orig/configure	2009-03-26 17:02:45.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2009-03-26 17:03:43.000000000 +0100
-@@ -726,7 +726,7 @@
-             UNKNOWN_ARG=yes
-         fi
-         ;;
--    -prefix|-docdir|-headerdir|-plugindir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
-+    -prefix|-docdir|-headerdir|-plugindir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL="$1"
-@@ -1143,6 +1143,9 @@
-     xplatform)
-         XPLATFORM="$VAL"
-         ;;
-+	crossarch)
-+		CROSSARCH="$VAL"
-+		;;
-     debug-and-release)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_DEBUG_RELEASE="$VAL"
-@@ -2405,6 +2408,8 @@
-     CFG_ARCH=$CFG_HOST_ARCH
- fi
- 
-+CFG_ARCH="$CROSSARCH"
-+
- if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
-     if [ "$OPT_VERBOSE" = "yes" ]; then
-         echo "    '$CFG_ARCH' is supported"
diff --git a/meta/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch b/meta/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
deleted file mode 100644
index be4d5c0..0000000
--- a/meta/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From acfeb18aa94bad6b2066e91cd15570889baaa252 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Sat, 2 Jun 2007 16:04:01 +0200
-Subject: [PATCH] fix resinit declaration
-
----
- src/qt3support/network/q3dns.cpp |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.4.3/src/qt3support/network/q3dns.cpp
-===================================================================
---- qt-embedded-linux-opensource-src-4.4.3.orig/src/qt3support/network/q3dns.cpp	2008-09-27 11:01:28.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/src/qt3support/network/q3dns.cpp	2009-03-26 17:04:05.000000000 +0100
-@@ -44,7 +44,7 @@
- # include <netinet/in.h>
- # include <arpa/nameser.h>
- # include <resolv.h>
--extern "C" int res_init();
-+extern "C" int res_init() throw();
- #endif
- 
- // POSIX Large File Support redefines open -> open64
diff --git a/meta/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch b/meta/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
deleted file mode 100644
index e527369..0000000
--- a/meta/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
---- /tmp/qws.pro	2009-12-10 19:30:08.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.0/examples/qws/qws.pro	2009-12-10 19:30:21.000000000 +0100
-@@ -1,7 +1,7 @@
- TEMPLATE      = subdirs
- # no /dev/fbX
- !qnx:!vxworks:SUBDIRS = framebuffer
--SUBDIRS      += mousecalibration simpledecoration
-+SUBDIRS      += mousecalibration
- 
- # install
- sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS README *.pro
diff --git a/meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff b/meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
deleted file mode 100644
index 00faf75..0000000
--- a/meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
+++ /dev/null
@@ -1,134 +0,0 @@
-Security advisory: Fraudulent certificates
-
-Background:
-
-Recently a group of people managed to get fraudulent SSL certificates signed
-by a Certificate Authority (CA).
-
-These certificates potentially enable their owners to pretend to be other
-entities on the Web; the attackers can present valid certificates for e.g.
-mail.google.com, login.yahoo.com and login.live.com, among others.
-
-The patch below solves this problem by blacklisting those fake certificates
-and aborting an SSL handshake with entities that present these certificates.
-The patch applies to all 4.6 and 4.7 versions, and should be applied to all Qt
-4.6.x and 4.7.x versions; upcoming Qt releases will contain a fix for this
-problem.
-
-More technical background:
-
-In order to trick a user into establishing an SSL connection to a site using
-one of those fake certificates, in addition to controlling the certificate, an
-attacker would need to either control the DNS server used by the victim, or
-have control over a proxy that the victim uses. That way, the attacker could
-trick the victim to connect to the attacker?s site and then present the user
-with a valid certificate.
-
-One obvious question now is: Should those certificates not just be revoked,
-which would solve the problem?
-
-First, they have been revoked by the affected Certificate Authority (see above
-link).
-
-However, the problem in this case, and probably part of the reason why most
-browser vendors release new versions blacklisting those certificates, is that
-by default browsers do not treat invalid responses from an OCSP server (a
-server used for checking the revocation status of a certificate) as fatal, and
-will allow the SSL connection to proceed anyway. Qt itself does not support
-OCSP yet, which makes blacklisting the certificates the only valid option (now
-would be a good moment to vote on the task for implementing OCSP in Qt); since
-Qt is relying on the system root certificates since version 4.7, it cannot
-control the root certificates that Qt trusts automatically anymore.
-
-http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
-http://qt.nokia.com/files/qt-patches/blacklist-fraudulent-comodo-certificates-patch.diff/view
-
-diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslcertificate.cpp
-index 618ac79..a5cdf01 100644
---- a/src/network/ssl/qsslcertificate.cpp
-+++ b/src/network/ssl/qsslcertificate.cpp
-@@ -219,17 +219,19 @@ bool QSslCertificate::isNull() const
-     Returns true if this certificate is valid; otherwise returns
-     false.
- 
--    Note: Currently, this function only checks that the current
-+    Note: Currently, this function checks that the current
-     data-time is within the date-time range during which the
--    certificate is considered valid. No other checks are
--    currently performed.
-+    certificate is considered valid, and checks that the
-+    certificate is not in a blacklist of fraudulent certificates.
- 
-     \sa isNull()
- */
- bool QSslCertificate::isValid() const
- {
-     const QDateTime currentTime = QDateTime::currentDateTime();
--    return currentTime >= d->notValidBefore && currentTime <= d->notValidAfter;
-+    return currentTime >= d->notValidBefore &&
-+            currentTime <= d->notValidAfter &&
-+            ! QSslCertificatePrivate::isBlacklisted(*this);
- }
- 
- /*!
-@@ -798,6 +800,30 @@ QList<QSslCertificate> QSslCertificatePrivate::certificatesFromDer(const QByteAr
-     return certificates;
- }
- 
-+// These certificates are known to be fraudulent and were created during the comodo
-+// compromise. See http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
-+static const char *certificate_blacklist[] = {
-+    "04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e",
-+    "f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06",
-+    "d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3",
-+    "39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29",
-+    "3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71",
-+    "e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47",
-+    "92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43",
-+    "b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0",
-+    "d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0",
-+    0
-+};
-+
-+bool QSslCertificatePrivate::isBlacklisted(const QSslCertificate &certificate)
-+{
-+    for (int a = 0; certificate_blacklist[a] != 0; a++) {
-+        if (certificate.serialNumber() == certificate_blacklist[a])
-+            return true;
-+    }
-+    return false;
-+}
-+
- #ifndef QT_NO_DEBUG_STREAM
- QDebug operator<<(QDebug debug, const QSslCertificate &certificate)
- {
-diff --git a/src/network/ssl/qsslcertificate_p.h b/src/network/ssl/qsslcertificate_p.h
-index cdceb0f..1ce33d3 100644
---- a/src/network/ssl/qsslcertificate_p.h
-+++ b/src/network/ssl/qsslcertificate_p.h
-@@ -96,6 +96,7 @@ public:
-     static QSslCertificate QSslCertificate_from_X509(X509 *x509);
-     static QList<QSslCertificate> certificatesFromPem(const QByteArray &pem, int count = -1);
-     static QList<QSslCertificate> certificatesFromDer(const QByteArray &der, int count = -1);
-+    static bool isBlacklisted(const QSslCertificate &certificate);
- 
-     friend class QSslSocketBackendPrivate;
- 
-diff --git a/src/network/ssl/qsslsocket_openssl.cpp b/src/network/ssl/qsslsocket_openssl.cpp
-index 0866534..2427193 100644
---- a/src/network/ssl/qsslsocket_openssl.cpp
-+++ b/src/network/ssl/qsslsocket_openssl.cpp
-@@ -1193,6 +1193,13 @@ bool QSslSocketBackendPrivate::startHandshake()
-     X509 *x509 = q_SSL_get_peer_certificate(ssl);
-     configuration.peerCertificate = QSslCertificatePrivate::QSslCertificate_from_X509(x509);
-     q_X509_free(x509);
-+    if (QSslCertificatePrivate::isBlacklisted(configuration.peerCertificate)) {
-+        q->setErrorString(QSslSocket::tr("The peer certificate is blacklisted"));
-+        q->setSocketError(QAbstractSocket::SslHandshakeFailedError);
-+        emit q->error(QAbstractSocket::SslHandshakeFailedError);
-+        plainSocket->disconnectFromHost();
-+        return false;
-+    }
- 
-     // Start translating errors.
-     QList<QSslError> errors;
diff --git a/meta/recipes-qt/qt4/files/g++.conf b/meta/recipes-qt/qt4/files/g++.conf
deleted file mode 100644
index 4cd76e6..0000000
--- a/meta/recipes-qt/qt4/files/g++.conf
+++ /dev/null
@@ -1,53 +0,0 @@
-#
-# qmake configuration for common gcc
-#
-
-QMAKE_CC       = $(OE_QMAKE_CC)
-QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_DEPS	+= -M
-QMAKE_CFLAGS_WARN_ON	+= -Wall -W
-QMAKE_CFLAGS_WARN_OFF	+= -w
-QMAKE_CFLAGS_RELEASE	+= 
-QMAKE_CFLAGS_DEBUG	+= -g
-QMAKE_CFLAGS_SHLIB	+= -fPIC
-QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
-QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
-
-QMAKE_CXX      = $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
-QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
-QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
-QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
-QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
-QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
-
-QMAKE_LINK     = $(OE_QMAKE_LINK)
-QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
-QMAKE_LFLAGS_RELEASE	+=
-QMAKE_LFLAGS_DEBUG	+=
-QMAKE_LFLAGS_APP	+=
-QMAKE_LFLAGS_SHLIB	+= -shared
-QMAKE_LFLAGS_PLUGIN	+= $$QMAKE_LFLAGS_SHLIB
-QMAKE_LFLAGS_SONAME	+= -Wl,-soname,
-QMAKE_LFLAGS_THREAD	+=
-QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
-QMAKE_RPATH        = -Wl,-rpath-link,
-
-QMAKE_PCH_OUTPUT_EXT    = .gch
-
-# -Bsymbolic-functions (ld) support
-QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
-QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
-
-# for the SDK
-isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
diff --git a/meta/recipes-qt/qt4/files/hack-out-pg_config.patch b/meta/recipes-qt/qt4/files/hack-out-pg_config.patch
deleted file mode 100644
index 650ed77..0000000
--- a/meta/recipes-qt/qt4/files/hack-out-pg_config.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Hack to not use the pg_config of the host system which will add /usr/include
-
-pg_config is a native binary so using that when cross compiling
-will always fail.  The commented out fix would do, but for OE
-our -platform and -xplatform is the same so we are actually not
-really cross compiling. Just comment out the test, we are passing
-the location to the postgres headers and if they are okay we
-will padd.
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
-Index: qt-embedded-linux-opensource-src-4.5.2/configure
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.2.orig/configure	2009-08-10 03:03:04.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.5.2/configure	2009-08-10 03:58:11.000000000 +0200
-@@ -4401,10 +4402,10 @@
-             ;;
-         psql)
-             if [ "$CFG_SQL_psql" != "no" ]; then
--                if "$WHICH" pg_config >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
--                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
--                fi
-+#                if [ "$QT_CROSS_COMPILE" = "no" ] && "$WHICH" pg_config >/dev/null 2>&1; then
-+#                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
-+#                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
-+#                fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
-                 if "$unixtests/compile.test" "$XQMAKESPEC" "$QMAKE_CONFIG" $OPT_VERBOSE "$relpath" "$outpath" config.tests/unix/psql "PostgreSQL" $QT_LFLAGS_PSQL $L_FLAGS $QT_CFLAGS_PSQL $I_FLAGS $l_FLAGS $MAC_ARCHS_COMMANDLINE; then
diff --git a/meta/recipes-qt/qt4/files/linux.conf b/meta/recipes-qt/qt4/files/linux.conf
deleted file mode 100644
index 90b8d65..0000000
--- a/meta/recipes-qt/qt4/files/linux.conf
+++ /dev/null
@@ -1,54 +0,0 @@
-#
-# qmake configuration for common linux
-#
-
-QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
-QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR          =
-QMAKE_LIBDIR          =
-QMAKE_INCDIR_X11      =
-QMAKE_LIBDIR_X11      =
-QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   =
-QMAKE_LIBDIR_OPENGL   =
-
-
-QMAKE_LIBS            =
-QMAKE_LIBS_DYNLOAD    = -ldl
-QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        = -lnsl
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
-QMAKE_LIBS_OPENGL_QT  = -lGL
-QMAKE_LIBS_THREAD     = -lpthread
-
-QMAKE_MOC             = $(OE_QMAKE_MOC)
-QMAKE_UIC             = $(OE_QMAKE_UIC)
-QMAKE_UIC3            = $(OE_QMAKE_UIC3)
-QMAKE_RCC             = $(OE_QMAKE_RCC)
-QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
-QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
-
-QMAKE_AR              = $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         = objcopy
-QMAKE_RANLIB          =
-
-QMAKE_TAR             = tar -cf
-QMAKE_GZIP            = gzip -9f
-
-QMAKE_COPY            = cp -f
-QMAKE_COPY_FILE       = $(COPY)
-QMAKE_COPY_DIR        = $(COPY) -r
-QMAKE_MOVE            = mv -f
-QMAKE_DEL_FILE        = rm -f
-QMAKE_DEL_DIR         = rmdir
-QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB += --strip-unneeded
-QMAKE_CHK_DIR_EXISTS  = test -d
-QMAKE_MKDIR           = mkdir -p
-QMAKE_INSTALL_FILE    = install -m 644 -p
-QMAKE_INSTALL_PROGRAM = install -m 755 -p
-
-include(unix.conf)
diff --git a/meta/recipes-qt/qt4/files/mips-relocate.patch b/meta/recipes-qt/qt4/files/mips-relocate.patch
deleted file mode 100644
index 2fde9a0..0000000
--- a/meta/recipes-qt/qt4/files/mips-relocate.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Disable the LDFLAGS "-Bsymbolic-functions" for mips
-
-"-Bsymbolic-functions" flag makes ld to bind the global function symbol of shared library at compiling time, thus reduce the runtime relocation cost.
-
-However, this flag in binutil 2.20 cause QT4 mips building failure, which is "final link failed: Bad value" error in libQtWebKit.so linking stage. If downgrad to binutil 2.19, this error disappears. further investigation showes commit http://sourceware.org/cgi-bin/cvsweb.cgi/src/ld/scripttempl/mips.sc.diff?r1=1.2&r2=1.3&cvsroot=src cause this error.
-
-So this patch disable this flag for QT4 mips. If future binutils version fix this issue, this patch can be safely removed.
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/configure b/configure
-index ca14279..5db9926 100755
---- a/configure
-+++ b/configure
-@@ -3035,6 +3035,13 @@ if [ "$CFG_REDUCE_RELOCATIONS" != "no" ]; then
-     fi
- fi
- 
-+# Temporily disable -Bsymbolic-functions for mips, because libQtWebKit can not pass the build
-+# if has -Bsymbolic-functions and binutil 2.20
-+# -Bsymbolic-functions is OK in binutil 2.19
-+if [ "$CFG_ARCH" = "mips" ]; then
-+    CFG_REDUCE_RELOCATIONS=no
-+fi
-+
- # auto-detect GNU make support
- if [ "$CFG_USE_GNUMAKE" = "auto" ] && "$MAKE" -v | grep "GNU Make" >/dev/null 2>&1; then
-    CFG_USE_GNUMAKE=yes
diff --git a/meta/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch b/meta/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
deleted file mode 100644
index 1d250d8..0000000
--- a/meta/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-qt-embedded: fix linker error in do_compile
-
-This patch ensures that we link to libQtCLucene where required (i.e. when 
-linking to libQtHelp) avoiding a linker error.
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Index: qt-everywhere-opensource-src-4.6.3/demos/qtdemo/qtdemo.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/demos/qtdemo/qtdemo.pro	2011-01-11 16:06:47.382828004 +0000
-+++ qt-everywhere-opensource-src-4.6.3/demos/qtdemo/qtdemo.pro	2011-01-11 16:10:06.906828001 +0000
-@@ -76,3 +76,10 @@
- sources.files = $$SOURCES $$HEADERS $$FORMS $$RESOURCES qtdemo.pro images xml *.ico *.icns *.rc *.plist
- sources.path = $$[QT_INSTALL_DEMOS]/qtdemo
- 
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/examples/help/contextsensitivehelp/contextsensitivehelp.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/examples/help/contextsensitivehelp/contextsensitivehelp.pro	2011-01-11 16:05:56.598828002 +0000
-+++ qt-everywhere-opensource-src-4.6.3/examples/help/contextsensitivehelp/contextsensitivehelp.pro	2011-01-11 16:09:57.762828002 +0000
-@@ -18,3 +18,11 @@
- INSTALLS += target sources
- 
- symbian: include($$QT_SOURCE_TREE/examples/symbianpkgrules.pri)
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/assistant/assistant.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/tools/assistant/tools/assistant/assistant.pro	2011-01-11 14:56:50.902828001 +0000
-+++ qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/assistant/assistant.pro	2011-01-11 16:09:39.914828003 +0000
-@@ -85,3 +85,11 @@
-         DEFINES += USE_STATIC_SQLITE_PLUGIN
-     }
- }
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qcollectiongenerator/qcollectiongenerator.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/tools/assistant/tools/qcollectiongenerator/qcollectiongenerator.pro	2011-01-11 14:56:50.918828002 +0000
-+++ qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qcollectiongenerator/qcollectiongenerator.pro	2011-01-11 16:09:44.538828001 +0000
-@@ -12,3 +12,11 @@
-            main.cpp
- 
- HEADERS += ../shared/helpgenerator.h
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qhelpgenerator/qhelpgenerator.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/tools/assistant/tools/qhelpgenerator/qhelpgenerator.pro	2011-01-11 14:56:50.930828002 +0000
-+++ qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qhelpgenerator/qhelpgenerator.pro	2011-01-11 16:09:50.274828003 +0000
-@@ -12,3 +12,11 @@
-            main.cpp
- 
- HEADERS += ../shared/helpgenerator.h
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
diff --git a/meta/recipes-qt/qt4/qt-4.6.3.inc b/meta/recipes-qt/qt4/qt-4.6.3.inc
deleted file mode 100644
index 37a15f1..0000000
--- a/meta/recipes-qt/qt4/qt-4.6.3.inc
+++ /dev/null
@@ -1,57 +0,0 @@
-LICENSE = "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://blacklist-fraudulent-comodo-certificates-patch.diff \
-           file://0001-cross-compile.patch \
-           file://0002-fix-resinit-declaration.patch \
-           file://0004-no-qmake.patch \
-           file://0006-freetype-host-includes.patch \
-           file://0008-qt-lib-infix.patch \
-           file://0009-support-2bpp.patch \
-           file://0010-no-simpledecoration-example.patch \
-           file://fix-config-tests.patch \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf \
-           file://hack-out-pg_config.patch \
-           file://mips-relocate.patch \
-           "
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-do_configure_prepend() {
-	for pro in $(find ${S} -name "*.pro") ; do
-		sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
-	done
-
-	sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
-	sed -i \
-	-e /QMAKE_MOC\ /d \
-	-e /QMAKE_UIC\ /d \
-	-e /QMAKE_UIC3\ /d \
-	-e /QMAKE_RCC\ /d \
-	${S}/configure
-}
-
-do_configure_append() {
-	sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
-}
-
-QT_GLFLAGS ?= ""
-QT_CONFIG_FLAGS += " -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
-
-do_compile() {
-	# Fixup missing wsegl header in some SGX SDKs
-	if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
-		cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
-	fi
-
-	unset CFLAGS CXXFLAGS
-	oe_runmake ${EXTRA_ENV}
-}
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb b/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
deleted file mode 100644
index 5e289d2..0000000
--- a/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt-${PV}.inc
-require qt4-embedded.inc
-
-SRC_URI += "file://qthelp-lib-qtclucene.patch"
-
-PR = "${INC_PR}.2"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
diff --git a/meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb b/meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
deleted file mode 100644
index dae8cd1..0000000
--- a/meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt4-tools-native.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
-
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
deleted file mode 100644
index d64542b..0000000
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf b/meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
deleted file mode 100644
index 68ae80b..0000000
--- a/meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
+++ /dev/null
@@ -1,54 +0,0 @@
-#
-# qmake configuration for common linux
-#
-
-QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
-QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR          =
-QMAKE_LIBDIR          =
-QMAKE_INCDIR_X11      =
-QMAKE_LIBDIR_X11      =
-QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   =
-QMAKE_LIBDIR_OPENGL   =
-
-
-QMAKE_LIBS            = -Wl,-rpath-link,SEDME/lib -lglib-2.0
-QMAKE_LIBS_DYNLOAD    = -ldl
-QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        = -lnsl
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
-QMAKE_LIBS_OPENGL_QT  = -lGL
-QMAKE_LIBS_THREAD     = -lpthread
-
-QMAKE_MOC             = $(OE_QMAKE_MOC)
-QMAKE_UIC             = $(OE_QMAKE_UIC)
-QMAKE_UIC3            = $(OE_QMAKE_UIC3)
-QMAKE_RCC             = $(OE_QMAKE_RCC)
-QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
-QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
-
-QMAKE_AR              = $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         = ${OBJCOPY}
-QMAKE_RANLIB          =
-
-QMAKE_TAR             = tar -cf
-QMAKE_GZIP            = gzip -9f
-
-QMAKE_COPY            = cp -f
-QMAKE_COPY_FILE       = $(COPY)
-QMAKE_COPY_DIR        = $(COPY) -r
-QMAKE_MOVE            = mv -f
-QMAKE_DEL_FILE        = rm -f
-QMAKE_DEL_DIR         = rmdir
-QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB += --strip-unneeded
-QMAKE_CHK_DIR_EXISTS  = test -d
-QMAKE_MKDIR           = mkdir -p
-QMAKE_INSTALL_FILE    = install -m 644 -p
-QMAKE_INSTALL_PROGRAM = install -m 755 -p
-
-include(unix.conf)
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
deleted file mode 100644
index 9126284..0000000
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt-${PV}.inc
-require qt4-x11-free.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS += " -xrandr "
-- 
1.7.4.1



