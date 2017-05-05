Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82E5977D55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 14:10:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 07:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="97700204"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 05 May 2017 07:10:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 17:10:27 +0300
Message-Id: <20170505141027.8381-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170505141027.8381-1-alexander.kanavin@linux.intel.com>
References: <20170505141027.8381-1-alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 6/6] README.LSB: describe oe-core's deviations from the LSB spec
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
X-List-Received-Date: Fri, 05 May 2017 14:10:30 -0000

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


