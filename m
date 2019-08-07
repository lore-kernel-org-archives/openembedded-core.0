Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF607E668
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:52:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 18:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="185841495"
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2019 18:45:06 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 18:44:36 -0700
Message-Id: <1565142279-8439-3-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH 2/5] ovmf: Set PV
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
X-List-Received-Date: Wed, 07 Aug 2019 01:52:12 -0000

Now that EDK2 has been tagging stable releases, we can also set PV
and drop UPSTREAM_VERSION_UNKNOWN.

Cc: Ross Burton <ross.burton@intel.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 11793f0d1a..c66b751a94 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -18,8 +18,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=git \
 	file://0004-ovmf-enable-long-path-file.patch \
 	file://no-stack-protector-all-archs.patch \
         "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
+PV = "edk2-stable201905"
 SRCREV="20d2e5a125e34fc8501026613a71549b2a1a3e54"
 
 inherit deploy
-- 
2.20.1


