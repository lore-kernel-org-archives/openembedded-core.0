Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 299DA731AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5wcP7012762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:38 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:39 +0800
Message-ID: <74f628453853f5f4c103f5197217fe9688e3641b.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452491844.git.Qi.Chen@windriver.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] resolvconf: upgrade to 1.78
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:38 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../resolvconf/{resolvconf_1.77.bb => resolvconf_1.78.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.77.bb => resolvconf_1.78.bb} (90%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.78.bb
similarity index 90%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.78.bb
index cc37541..f4c5851 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.78.bb
@@ -11,13 +11,13 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20150511T214718Z/pool/main/r/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20150828T220730Z/pool/main/r/${BPN}/${BPN}_1.78.tar.xz \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
 
-SRC_URI[md5sum] = "7362d766e47bfc253500f42b30330d9f"
-SRC_URI[sha256sum] = "5a6e21e8ba6822a5f93075c8c8fe7977e34780ba551af51930d0b31fdd99ab56"
+SRC_URI[md5sum] = "373a9f9544c84aa477a7425ae773b8b5"
+SRC_URI[sha256sum] = "961b22e8fcf0c7de7e90a050323e6fa221bc8b25a5348c160be3506f7e73a7a3"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
1.9.1


