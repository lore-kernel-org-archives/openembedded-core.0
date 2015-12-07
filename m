Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A28F607AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 21:25:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Dec 2015 13:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,396,1444719600"; d="scan'208";a="836260681"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.171])
	by orsmga001.jf.intel.com with ESMTP; 07 Dec 2015 13:25:36 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 15:26:31 -0600
Message-Id: <20ec28565a14f3647b0e5831c4d81846a26c032c.1449523356.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449523356.git.anibal.limon@linux.intel.com>
References: <cover.1449523356.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1449523356.git.anibal.limon@linux.intel.com>
References: <cover.1449523356.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com, bjst@enea.com,
	benjamin.esquivel@intel.com
Subject: [PATCH 2/2] ptest-runner: Add a recipe for install ptest-runner 2.0.
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
X-List-Received-Date: Mon, 07 Dec 2015 21:25:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[YOCTO #8021]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../ptest-runner/ptest-runner_2.0.bb               | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
new file mode 100644
index 0000000..64fd0df
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A python script to run all installed ptests"
+
+DESCRIPTION = "The ptest-runner package installs a ptest-runner \
+python script which loops through all installed ptest test suites and \
+runs them in sequence."
+
+HOMEPAGE = "https://wiki.yoctoproject.org/wiki/Ptest"
+SRC_URI += "file://ptest-runner_2.0.py"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.GPLv2;md5=751419260aa954499f7abaabaa882bbe"
+
+INHIBIT_DEFAULT_DEPS = "1"
+RDEPENDS_${PN} = "python python-fcntl python-argparse python-logging python-datetime \
+                  python-subprocess"
+
+S = "${WORKDIR}"
+
+do_install () {
+    mkdir -p ${D}${bindir}
+    install -m 0755 ${WORKDIR}/ptest-runner_2.0.py ${D}${bindir}/ptest-runner
+}
+
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_build[noexec] = "1"
-- 
2.1.4


