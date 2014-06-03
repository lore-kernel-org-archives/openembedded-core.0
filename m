Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3174660E23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 01:40:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s531eTC1029189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 18:40:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 2 Jun 2014 18:40:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jun 2014 09:41:19 +0800
Message-ID: <324a9842b540fda121d095b0e2f899969cd8fdb5.1401419076.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1401419076.git.Qi.Chen@windriver.com>
References: <cover.1401419076.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gawk: upgrade from 4.0.2 to 4.1.1
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
X-List-Received-Date: Tue, 03 Jun 2014 01:40:30 -0000
Content-Type: text/plain

Upgrade gawk from 4.0.2 to 4.1.1.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../gawk/{gawk-4.0.2 => gawk-4.1.1}/run-ptest      |    0
 .../gawk/{gawk_4.0.2.bb => gawk_4.1.1.bb}          |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/gawk/{gawk-4.0.2 => gawk-4.1.1}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.0.2.bb => gawk_4.1.1.bb} (84%)

diff --git a/meta/recipes-extended/gawk/gawk-4.0.2/run-ptest b/meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
similarity index 100%
rename from meta/recipes-extended/gawk/gawk-4.0.2/run-ptest
rename to meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
diff --git a/meta/recipes-extended/gawk/gawk_4.0.2.bb b/meta/recipes-extended/gawk/gawk_4.1.1.bb
similarity index 84%
rename from meta/recipes-extended/gawk/gawk_4.0.2.bb
rename to meta/recipes-extended/gawk/gawk_4.1.1.bb
index cb2f9c0..a6872d8 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.2.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.1.bb
@@ -20,15 +20,15 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
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
+FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libexecdir}/*.so ${libexecdir}/*.la"
 FILES_pgawk = "${bindir}/pgawk*"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 FILES_dgawk = "${bindir}/dgawk*"
-- 
1.7.9.5


