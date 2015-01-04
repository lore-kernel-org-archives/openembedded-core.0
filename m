Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87D59727B5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t04A4kQI025864
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Jan 2015 02:04:46 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 4 Jan 2015 02:04:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:04:56 +0800
Message-ID: <1758b73b753789147e688552e740352898ff2ea0.1420359776.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420359776.git.Qi.Chen@windriver.com>
References: <cover.1420359776.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] sysstat: upgrade to stable version 11.0.2
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
X-List-Received-Date: Sun, 04 Jan 2015 10:04:55 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc                             | 2 +-
 .../recipes-extended/sysstat/{sysstat_10.2.1.bb => sysstat_11.0.2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.2.1.bb => sysstat_11.0.2.bb} (40%)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 09a5d28..566cb08 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
 LICENSE = "GPLv2+"
 SECTION = "console/utils"
 
-SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
+SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://99_sysstat \
           "
 
diff --git a/meta/recipes-extended/sysstat/sysstat_10.2.1.bb b/meta/recipes-extended/sysstat/sysstat_11.0.2.bb
similarity index 40%
rename from meta/recipes-extended/sysstat/sysstat_10.2.1.bb
rename to meta/recipes-extended/sysstat/sysstat_11.0.2.bb
index 654457d..ce83f4f 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.2.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.0.2.bb
@@ -2,5 +2,5 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI[md5sum] = "039dcd235dfcfb3d4acc0a05730f9512"
-SRC_URI[sha256sum] = "3bfd1b4c5b99314585709c092096234b6e181741729f601d18d0ed7f0612612a"
+SRC_URI[md5sum] = "27d4ca66869dce132ace3194dd7d7539"
+SRC_URI[sha256sum] = "acd87fdfbe7c796480f14fc26119d8f785d26827d74a0f5bced6c492a91f1b96"
-- 
1.9.1


