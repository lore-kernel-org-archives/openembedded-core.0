Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 164047887D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w122IJe2026573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:19 -0800 (PST)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:18 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:10 +0800
Message-ID: <1517537774-12847-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
References: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 3/7] wget: update to 1.19.4
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:18 -0000
Content-Type: text/plain

Update LIC_FILES_CHKSUM since replacing HTTP urls with HTTPS in COPYING

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/wget/wget.inc                           | 2 +-
 meta/recipes-extended/wget/{wget_1.19.2.bb => wget_1.19.4.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.19.2.bb => wget_1.19.4.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index e374e6d..3cff656 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -2,7 +2,7 @@ SUMMARY = "Console URL download utility supporting HTTP, FTP, etc"
 HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 DEPENDS = "gnutls zlib libpcre"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
diff --git a/meta/recipes-extended/wget/wget_1.19.2.bb b/meta/recipes-extended/wget/wget_1.19.4.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.19.2.bb
rename to meta/recipes-extended/wget/wget_1.19.4.bb
index c216ea8..fb7cce5 100644
--- a/meta/recipes-extended/wget/wget_1.19.2.bb
+++ b/meta/recipes-extended/wget/wget_1.19.4.bb
@@ -3,7 +3,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[md5sum] = "caabf9727fa429626316619a6369fffa"
-SRC_URI[sha256sum] = "4f4a673b6d466efa50fbfba796bd84a46ae24e370fa562ede5b21ab53c11a920"
+SRC_URI[md5sum] = "a2a2c1dc4ac5003fc25a8e60b4a9464e"
+SRC_URI[sha256sum] = "93fb96b0f48a20ff5be0d9d9d3c4a986b469cb853131f9d5fe4cc9cecbc8b5b5"
 
 require wget.inc
-- 
2.7.4


