Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S851d-0004Fe-8s
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 08:23:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2F7EGI1013159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Mar 2012 00:14:16 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 15 Mar 2012 00:14:16 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 15:14:05 +0800
Message-ID: <936345a9833302928a9f47ce2ed06c548a01a40a.1331793913.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331793913.git.kai.kang@windriver.com>
References: <cover.1331793913.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 1/1] alsa-tools: update to 1.0.25
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
X-List-Received-Date: Thu, 15 Mar 2012 07:23:05 -0000
Content-Type: text/plain

Update to version 1.0.25

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../autotools.patch                                |    0
 ...alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 => alsa-tools-1.0.25}/autotools.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} (83%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
rename to meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
similarity index 83%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
index 4c3e9dc..d5d7fcb 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r4"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://autotools.patch"
 
-SRC_URI[md5sum] = "08fe93a12006093e590d7ecc02b119dd"
-SRC_URI[sha256sum] = "17d43de93ab2db98886d89a53e45341daa46a4ef6edd405db87f4b5a5dc64a05"
+SRC_URI[md5sum] = "57bfec98a814d12e0f7ab379aaeccd87"
+SRC_URI[sha256sum] = "a974d0f3e837796f67d04df88c783aebcf4ac3c5f9ac31e2b65c10e8cb4b1dca"
 
 inherit autotools
 
-- 
1.7.5.4



