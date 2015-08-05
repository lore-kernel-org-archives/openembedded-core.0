Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E017560125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 08:02:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7582gAG023397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Aug 2015 01:02:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 5 Aug 2015 01:02:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Aug 2015 16:02:48 +0800
Message-ID: <827092fd4aeef38511da7f83fb9117bec67dd409.1438761716.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438761716.git.Qi.Chen@windriver.com>
References: <cover.1438761716.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] resolvconf: upgrade to 1.77
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
X-List-Received-Date: Wed, 05 Aug 2015 08:02:45 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb} (89%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
similarity index 89%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
index 797e9b0..916b9f2 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
@@ -11,13 +11,13 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20141013T184415Z/pool/main/r/${BPN}/${BPN}_1.76.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20150511T214718Z/pool/main/r/${BPN}/${BPN}_${PV}.tar.xz \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
 
-SRC_URI[md5sum] = "d78ce30ea068999cd3e0523300b27255"
-SRC_URI[sha256sum] = "c9f40f7405b37399ddbf29ca4205b4911ee35cb9ffd9be7671faa2385b1fa573"
+SRC_URI[md5sum] = "7362d766e47bfc253500f42b30330d9f"
+SRC_URI[sha256sum] = "5a6e21e8ba6822a5f93075c8c8fe7977e34780ba551af51930d0b31fdd99ab56"
 
 inherit allarch
 
-- 
1.9.1


