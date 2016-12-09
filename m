Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0393E6093D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 15:40:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 09 Dec 2016 07:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="796176012"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2016 07:40:22 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 387A76A4006;
	Fri,  9 Dec 2016 07:39:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 17:40:10 +0200
Message-Id: <1481298010-8986-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-git-proxy: create usage output
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
X-List-Received-Date: Fri, 09 Dec 2016 15:40:22 -0000

Created usage output for oe-git-proxy script.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-git-proxy | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 0078e95..7a43fe6 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -18,6 +18,27 @@
 # AUTHORS
 # Darren Hart <dvhart@linux.intel.com>
 
+if [ $# -lt 2 -o "$1" = '--help' -o "$1" = '-h' ] ; then
+    echo 'oe-git-proxy: error: the following arguments are required: host port'
+    echo 'Usage: oe-git-proxy host port'
+    echo ''
+    echo 'OpenEmbedded git-proxy - a simple tool to be used via GIT_PROXY_COMMAND.'
+    echo 'It uses socat to make SOCKS or HTTPS proxy connections.'
+    echo 'It uses ALL_PROXY to determine the proxy server, protocol, and port.'
+    echo 'It uses NO_PROXY to skip using the proxy for a comma delimited list'
+    echo 'of hosts, host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24).'
+    echo 'It is known to work with both bash and dash shells.runs native tools'
+    echo ''
+    echo 'arguments:'
+    echo '  host                proxy host to use'
+    echo '  port                proxy port to use'
+    echo ''
+    echo 'options:'
+    echo '  -h, --help          show this help message and exit'
+    echo ''
+    exit 2
+fi
+
 # Locate the netcat binary
 SOCAT=$(which socat 2>/dev/null)
 if [ $? -ne 0 ]; then
-- 
2.1.4


