Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6174D757C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t52Emsl1010804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:49 -0700
Message-ID: <98a45b6446fe3d797a2246b360157df31def1a42.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433256486.git.liezhi.yang@windriver.com>
References: <cover.1433256486.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] python-mako: 0.9.1 -> 1.0.1
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM was changed because the year changed: 2013 -> 2015,
the license are the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{python-mako_0.9.1.bb => python-mako_1.0.1.bb} |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-mako_0.9.1.bb => python-mako_1.0.1.bb} (64%)

diff --git a/meta/recipes-devtools/python/python-mako_0.9.1.bb b/meta/recipes-devtools/python/python-mako_1.0.1.bb
similarity index 64%
rename from meta/recipes-devtools/python/python-mako_0.9.1.bb
rename to meta/recipes-devtools/python/python-mako_1.0.1.bb
index 57d4220..5d42b0c 100644
--- a/meta/recipes-devtools/python/python-mako_0.9.1.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.1.bb
@@ -1,11 +1,12 @@
 SUMMARY = "Templating library for Python"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da2a9d126b93cab0996a8287dacc480b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=deb3ff8e4c17aaf7b80889b6b2bf4c83"
 
 SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
-SRC_URI[md5sum] = "fe3f394ef714776d09ec6133923736a7"
-SRC_URI[sha256sum] = "ed74d72b720a97a51590dfa839f2048ceeb76cc80d1d9ea5731a5262384316ae"
+
+SRC_URI[md5sum] = "9f0aafd177b039ef67b90ea350497a54"
+SRC_URI[sha256sum] = "45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c"
 
 S = "${WORKDIR}/Mako-${PV}"
 
-- 
1.7.9.5


