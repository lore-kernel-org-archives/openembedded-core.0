Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6DC6FC4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 02:27:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s562RQTq022062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jun 2014 19:27:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 5 Jun 2014 19:27:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 10:28:18 +0800
Message-ID: <6d4c4b72f95fa7b7a4bced0e7747ae341b9af71a.1402021350.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402021350.git.Qi.Chen@windriver.com>
References: <cover.1402021350.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/4] gawk: upgrade from 4.0.2 to 4.1.1
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
X-List-Received-Date: Fri, 06 Jun 2014 02:27:30 -0000
Content-Type: text/plain

Upgrade gawk from 4.0.2 to 4.1.1.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../gawk/{gawk-4.0.2 => gawk-4.1.1}/run-ptest      |    0
 .../gawk/{gawk_4.0.2.bb => gawk_4.1.1.bb}          |    9 +++++----
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/gawk/{gawk-4.0.2 => gawk-4.1.1}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.0.2.bb => gawk_4.1.1.bb} (80%)

diff --git a/meta/recipes-extended/gawk/gawk-4.0.2/run-ptest b/meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
similarity index 100%
rename from meta/recipes-extended/gawk/gawk-4.0.2/run-ptest
rename to meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
diff --git a/meta/recipes-extended/gawk/gawk_4.0.2.bb b/meta/recipes-extended/gawk/gawk_4.1.1.bb
similarity index 80%
rename from meta/recipes-extended/gawk/gawk_4.0.2.bb
rename to meta/recipes-extended/gawk/gawk_4.1.1.bb
index cb2f9c0..474649e 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.2.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.1.bb
@@ -20,17 +20,18 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "4d505dc2c9f1eb3e9f8d6cac87d4bd1a"
-SRC_URI[sha256sum] = "6e0de117c3713aa8d7fa347fc9fd645b10038ae49d8cf947d8c1d51cbb76141a"
+SRC_URI[md5sum] = "45f5b09aa87b4744c4c53bf274e96ed0"
+SRC_URI[sha256sum] = "556464bd2e4bc5a0fad4526b59623e4be40b4c2f4c663dfaaf246af6e2ec1d62"
 
 inherit autotools gettext texinfo update-alternatives
 
 PACKAGES += "gawk-common pgawk dgawk"
 
 FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
-FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/*"
+FILES_gawk-common += "${datadir}/awk/* ${libdir}/gawk/awk/* ${libdir}/gawk/*.so"
 FILES_pgawk = "${bindir}/pgawk*"
-FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
+FILES_${PN}-dev += "${libdir}/gawk/*.la"
+FILES_${PN}-dbg += "${libdir}/gawk/awk/.debug"
 FILES_dgawk = "${bindir}/dgawk*"
 
 ALTERNATIVE_${PN} = "awk"
-- 
1.7.9.5


