Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA53776E3F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 07:01:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A71LWF024026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:01:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 10 Oct 2015 00:01:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Oct 2015 00:01:16 -0700
Message-ID: <eb03890358f26691c73d29bd7bbba657cdf01053.1444460443.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444460443.git.liezhi.yang@windriver.com>
References: <cover.1444460443.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] debianutils: fix ALTERNATIVE_PRIORITY conflict with which
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
X-List-Received-Date: Sat, 10 Oct 2015 07:01:24 -0000
Content-Type: text/plain

Conflicts:
debianutils and which have the same priority 100 for which

Turn down debianutils' priority to fix the conflict, the larger set
of tools should use a lower priority.

[YOCTO #8477]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../debianutils/debianutils_4.5.1.bb               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.5.1.bb b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
index 6b665fb..77ab6da 100644
--- a/meta/recipes-support/debianutils/debianutils_4.5.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
@@ -34,7 +34,7 @@ FILES_${PN}-run-parts = "${base_bindir}/run-parts.debianutils"
 RDEPENDS_${PN} += "${PN}-run-parts"
 
 
-ALTERNATIVE_PRIORITY="100"
+ALTERNATIVE_PRIORITY="30"
 ALTERNATIVE_${PN} = "add-shell installkernel remove-shell savelog tempfile which"
 ALTERNATIVE_${PN}-run-parts = "run-parts"
 
-- 
1.7.9.5


