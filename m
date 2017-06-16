Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1305278480
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279526"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:31 +0300
Message-Id: <211f9696ecdb0f83fcb0bd280289d323836c2599.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/32] README.LSB: describe oe-core's deviations from the LSB spec
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 README.LSB | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 README.LSB

diff --git a/README.LSB b/README.LSB
new file mode 100644
index 00000000000..c9dca3fc75e
--- /dev/null
+++ b/README.LSB
@@ -0,0 +1,25 @@
+OE-Core aims to be able to provide basic LSB compatible images. There
+are some challenges for OE as LSB isn't always 100% relevant to its
+target embedded and IoT audiences. 
+
+One challenge is that the LSB spec is no longer being actively
+developed [https://github.com/LinuxStandardBase/lsb] and has 
+components which are end of life or significantly dated. OE 
+therefore provides compatibility with the following caveats:
+
+* Qt4 is provided by the separate meta-qt4 layer. Its noted that Qt4 
+  is end of life and this isn't something the core project regularly 
+  tests any longer. Users are recommended to group together to support
+  maintenance of that layer. [http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/]
+
+* mailx has been dropped since its no longer being developed upstream 
+  and there are better, more modern replacements such as s-nail 
+  (http://sdaoden.eu/code.html) or mailutils (http://mailutils.org/).
+
+* A few perl modules that were required by LSB 4.x aren't provided:
+  libclass-isa, libenv, libdumpvalue, libfile-checktree,
+  libi18n-collate, libpod-plainer.
+
+* libpng 1.2 isn't provided; oe-core includes the latest release of libpng
+  instead.
+
-- 
2.11.0


