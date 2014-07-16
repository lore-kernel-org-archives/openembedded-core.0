Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8DED70313
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:02:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6G82QZk022006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 01:02:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 01:02:25 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 16:00:25 +0800
Message-ID: <5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1405497586.git.Chong.Lu@windriver.com>
References: <cover.1405497586.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perf: split package
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
X-List-Received-Date: Wed, 16 Jul 2014 08:02:30 -0000
Content-Type: text/plain

Fix incorrect paths to split perf package.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 20968f9..781a738 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -166,10 +166,10 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
-FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
-FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
-FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
-FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
+FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
+FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
+FILES_${PN}-python = "${libdir}/python*/site-packages ${exec_prefix}/libexec/perf-core/scripts/python"
+FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
 
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-- 
1.9.1


