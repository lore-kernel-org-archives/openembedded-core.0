Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58C2060746
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:46:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0S9ke4q010662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 01:46:40 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 01:46:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 01:46:37 -0800
Message-ID: <72cdd5db4b60c2b93b71ab366c1c7eb85ca7e88b.1453974352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453974352.git.liezhi.yang@windriver.com>
References: <cover.1453974352.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] perf.bb: add python scripts corresponding packages
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
X-List-Received-Date: Thu, 28 Jan 2016 09:46:42 -0000
Content-Type: text/plain

Fixed:
/usr/libexec/perf-core/tests/attr.py contained in package perf requires /usr/bin/python, but no providers found in RDEPENDS_perf? [file-rdeps]
/usr/libexec/perf-core/scripts/python/sched-migration.py contained in package perf requires /usr/bin/python, but no providers found in RDEPENDS_perf? [file-rdeps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 33acb42..dde6046 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -201,8 +201,12 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
-FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
-FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
+FILES_${PN}-tests = "${libdir}/perf/perf-core/tests \
+                     ${libexecdir}/perf-core/tests \
+                     "
+FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python \
+                      ${libexecdir}/perf-core/scripts/python \
+                     "
 FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
 
 
-- 
1.7.9.5


