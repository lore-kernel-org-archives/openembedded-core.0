Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 046B06B3D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:31:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2013 05:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="376543229"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2013 05:31:32 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 15:31:27 +0300
Message-Id: <d330d061f5a298f09d441b9b43db50499eb75c37.1374841557.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374841557.git.laurentiu.palcu@intel.com>
References: <cover.1374841557.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1374841557.git.laurentiu.palcu@intel.com>
References: <cover.1374841557.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] csl-versions.inc: instruct user to check local.conf
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
X-List-Received-Date: Fri, 26 Jul 2013 12:31:32 -0000

In case the compiler version cannot be extracted instruct user to check
that the toolchain supports MACHINE's architecture and that the latter
is set correctly in local.conf.

[YOCTO #4901]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/conf/distro/include/csl-versions.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index f3b491c..3938bf7 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -18,6 +18,7 @@ def csl_get_version(d):
 		stdout, stderr = csl_run(d, 'gcc', '-v')
 	except bb.process.CmdError as exc:
 		bb.error('Failed to obtain CodeSourcery toolchain version: %s' % exc)
+		bb.error('Make sure that MACHINE is set correctly in your local.conf and the toolchain supports %s.' % d.getVar("TARGET_ARCH", True))
 		return 'UNKNOWN'
 	else:
 		last_line = stderr.splitlines()[-1]
-- 
1.7.9.5


