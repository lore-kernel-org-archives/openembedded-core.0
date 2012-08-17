Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1T2MQG-0005r3-5p
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:17:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7HD59Fq023493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 06:05:09 -0700 (PDT)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 17 Aug 2012 06:05:08 -0700
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 16:05:00 +0300
Message-ID: <f3b626bf0865fc3fbccb898723f162f900aa244f.1345208249.git.andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345208249.git.andrei.gherzan@windriver.com>
References: <cover.1345208249.git.andrei.gherzan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 1/2] python-dbus: Native dbus python module needed for dbus tests
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
X-List-Received-Date: Fri, 17 Aug 2012 13:17:08 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-devtools/python/python-dbus_1.1.1.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-dbus_1.1.1.bb b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
index 51d5bc2..35149a0 100644
--- a/meta/recipes-devtools/python/python-dbus_1.1.1.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
@@ -23,3 +23,6 @@ export STAGING_INCDIR
 RDEPENDS_${PN} = "python-io python-logging python-stringold python-threading python-xml"
 
 FILES_${PN}-dev += "${libdir}/pkgconfig"
+
+RDEPENDS_${PN}_virtclass-native = "python"
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



