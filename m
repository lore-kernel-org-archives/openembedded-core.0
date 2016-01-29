Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9C02A77197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:04:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 Jan 2016 07:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,364,1449561600"; d="scan'208";a="891900238"
Received: from mshai-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.30.5])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2016 07:04:33 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:04:30 +0200
Message-Id: <1454079871-4658-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454079871-4658-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454079871-4658-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] Make sure that the directory for CONFIGURESTAMPFILE exists
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
X-List-Received-Date: Fri, 29 Jan 2016 15:04:48 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/autotools.bbclass | 1 +
 meta/classes/base.bbclass      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 7bf510b..7f60c2a 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -122,6 +122,7 @@ autotools_preconfigure() {
 
 autotools_postconfigure(){
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
 		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
 	fi
 }
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5fc9271..0eb1870 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -292,6 +292,7 @@ base_do_configure() {
 		fi
 	fi
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
 		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
 	fi
 }
-- 
2.1.4


