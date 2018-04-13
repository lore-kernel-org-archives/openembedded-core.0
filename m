Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77DD774500
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 10:18:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3DAIkgX015059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 03:18:46 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 13 Apr 2018 03:18:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Apr 2018 18:19:57 +0800
Message-ID: <50aecdbae86d3e4797fc72e78d88386749c7b238.1523614724.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1523614724.git.Qi.Chen@windriver.com>
References: <cover.1523614724.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] man-db: add groff to RDEPENDS
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
X-List-Received-Date: Fri, 13 Apr 2018 10:18:45 -0000
Content-Type: text/plain

Add groff to RDEPENDS_${PN}, otherwise, the 'man' command cannot
work correctly on target.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/man-db/man-db_2.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.1.bb b/meta/recipes-extended/man-db/man-db_2.8.1.bb
index 528903d..8328a67 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.1.bb
@@ -25,6 +25,7 @@ FILES_${PN} += "${prefix}/lib/tmpfiles.d"
 
 FILES_${PN}-dev += "${libdir}/man-db/libman.so ${libdir}/${BPN}/libmandb.so"
 
+RDEPENDS_${PN} += "groff"
 RRECOMMENDS_${PN} += "less"
 RPROVIDES_${PN} += " man"
 
-- 
1.9.1


