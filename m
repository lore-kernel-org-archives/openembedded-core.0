Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kG7-00063K-87
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93r9i011843
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:54 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:53 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:39 +0800
Message-ID: <7245dc9a29b1509bb9621406497e17e1174c27e6.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 4/8] alsa-lib: update to 1.0.25
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:39 -0000
Content-Type: text/plain

Update to version 1.0.25, rename the patch directory at same time.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../fix-tstamp-declaration.patch                   |    0
 .../unbreak_plugindir.patch                        |    0
 .../{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb}   |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/fix-tstamp-declaration.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/unbreak_plugindir.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb} (92%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/fix-tstamp-declaration.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch
rename to meta/recipes-multimedia/alsa/alsa-lib-1.0.25/fix-tstamp-declaration.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.0.25/unbreak_plugindir.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch
rename to meta/recipes-multimedia/alsa/alsa-lib-1.0.25/unbreak_plugindir.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
similarity index 92%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
index 83e663d..90b0cba 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
@@ -14,13 +14,13 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
 
-SRC_URI[md5sum] = "7cc05f25e1d5b65da8fb3fdcd540f226"
-SRC_URI[sha256sum] = "a32f7c21015b6c71f9a80ff70a2b6a50e4ff4d5c77c744ff0793dea7ba7a2517"
+SRC_URI[md5sum] = "06fe5819020c6684b991dcffc5471304"
+SRC_URI[sha256sum] = "5a1a805cf04106316d549ec650116ce6711a162e107ba8b3c551866680e286e6"
 
 inherit autotools pkgconfig
 
-- 
1.7.5.4



