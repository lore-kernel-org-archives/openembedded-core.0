Return-Path: <anibal.limon@linux.intel.com>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Dec 2015 23:05:43 UTC
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D50CF60796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 23:05:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 14 Dec 2015 14:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,429,1444719600"; d="scan'208";a="841133956"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.48])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2015 14:56:10 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 16:57:09 -0600
Message-Id: <1450133829-17751-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450133829-17751-1-git-send-email-anibal.limon@linux.intel.com>
References: <1450133829-17751-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, Nathan_Lynch@mentor.com
Subject: [PATCHv2 2/2] ptest-runner: Add a recipe for install ptest-runner 2.0.
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
X-List-Received-Date: Mon, 14 Dec 2015 23:05:44 -0000
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


