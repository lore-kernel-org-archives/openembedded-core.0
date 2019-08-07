Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9357F3FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:52:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 18:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="185841500"
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2019 18:45:07 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 18:44:37 -0700
Message-Id: <1565142279-8439-4-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH 3/5] ovmf: use HOSTTOOLS' python3
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

Use the variable PYTHON_COMMAND to let know EDK2 base tools that python3
in the host shall be used.

In order build successfully, the host must have installed the
python3-distutils package or equivalent.

Based on an original patch by Ross Burton.

Cc: Ross Burton <ross.burton@intel.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index c66b751a94..834ee32466 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -46,6 +46,8 @@ COMPATIBLE_HOST='(i.86|x86_64).*'
 OVMF_SECURE_BOOT_EXTRA_FLAGS ??= ""
 OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLAGS}"
 
+export PYTHON_COMMAND = "${HOSTTOOLS_DIR}/python3"
+
 do_patch[postfuncs] += "fix_basetools_location"
 fix_basetools_location () {
 }
-- 
2.20.1


