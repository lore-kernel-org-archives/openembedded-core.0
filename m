Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGMBd-0000Ym-Nk
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:47:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J2fU7M029070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:41:30 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 19:41:30 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 10:42:38 +0800
Message-ID: <65c7a1fd4cc82c9e2366247cdaa0af1e1320f865.1318991782.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318991782.git.kai.kang@windriver.com>
References: <cover.1318991782.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 2/5] xdg-utils: update to 1.1.0 rc1
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
X-List-Received-Date: Wed, 19 Oct 2011 02:47:22 -0000
Content-Type: text/plain

Update xdg-utils to 1.1.0 rc1, set variable "S".

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../{xdg-utils_1.0.2.bb => xdg-utils_1.1.0rc1.bb}  |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb => xdg-utils_1.1.0rc1.bb} (57%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
similarity index 57%
rename from meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
index f54d591..d7e4e47 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0rc1.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "The xdg-utils package is a set of simple scripts that provide bas
 desktop integration functions for any Free Desktop, such as Linux. \
 They are intended to provide a set of defacto standards. \
 The following scripts are provided at this time: \
-xdg-desktop-icon \     
-xdg-desktop-menu \  
-xdg-email \ 
+xdg-desktop-icon \
+xdg-desktop-menu \
+xdg-email \
 xdg-icon-resource \
-xdg-mime \       
-xdg-open \     
-xdg-screensaver \ 
+xdg-mime \
+xdg-open \
+xdg-screensaver \
 "
 
 PR="r0"
@@ -18,9 +18,11 @@ PR="r0"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 
-SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tgz"
+SRC_URI = "http://portland.freedesktop.org/download/${BPN}-1.1.0-rc1.tar.gz"
+
+S = "${WORKDIR}/${PN}-1.1.0-rc1"
 
 inherit autotools
 
-SRC_URI[md5sum] = "348a5b91dc66426505022c74a64b2940"
-SRC_URI[sha256sum] = "21aeb7d16b2529b8d3975118f59eec09953e09f9a68d718159e98c90474b01ac"
+SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
+SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
-- 
1.7.5.1.300.gc565c



