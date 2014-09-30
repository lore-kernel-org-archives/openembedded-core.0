Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFA4716FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:17:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2014 10:17:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,628,1406617200"; d="scan'208";a="607677678"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2014 10:16:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 10:16:52 -0700
Message-Id: <81dc4f93370ba302bf730eec5e087ea4e9f7a022.1412095567.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
Subject: [PATCH 2/5] rpm5: add python-rpm PROVIDES
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
X-List-Received-Date: Tue, 30 Sep 2014 17:17:09 -0000

Since python-smartpm depends on python-rpm, we should provide here as appropriate.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 0c9ef5b..fb8a507 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -342,6 +342,7 @@ FILES_python-rpm-dbg = "${libdir}/python*/site-packages/rpm/.debug/_*"
 FILES_python-rpm-dev = "${libdir}/python*/site-packages/rpm/*.la"
 FILES_python-rpm-staticdev = "${libdir}/python*/site-packages/rpm/*.a"
 FILES_python-rpm = "${libdir}/python*/site-packages/rpm"
+PROVIDES += "python-rpm"
 
 FILES_perl-module-rpm = "${libdir}/perl/*/* \
 		"
-- 
1.8.3.1


