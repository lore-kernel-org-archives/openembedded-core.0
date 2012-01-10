Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RkVF3-0005Jl-1H
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:31:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2012 22:23:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="94668437"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2012 22:23:59 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 14:22:05 +0800
Message-Id: <11f638f3baae943e31f45a93e61839737565e4e1.1326176214.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4d4ebc691a0d976ab9a5eb0ae30e35889de1e3b7.1326176214.git.lianhao.lu@intel.com>
References: <4d4ebc691a0d976ab9a5eb0ae30e35889de1e3b7.1326176214.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1326176214.git.lianhao.lu@intel.com>
References: <cover.1326176214.git.lianhao.lu@intel.com>
Subject: [PRService/meta V3 2/3] package.bbclass: per recipe PRSERV_HOST support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 06:31:34 -0000

[YOCTO #1126]
Added per recipe PRSERV_HOST PRSERV_PORT support.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 65e6571..f8f0a12 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -350,6 +350,14 @@ def runtime_mapping_rename (varname, d):
 #
 
 python package_get_auto_pr() {
+	# per recipe PRSERV_HOST PRSERV_PORT
+	pn = d.getVar('PN', True)
+	host = d.getVar("PRSERV_HOST_" + pn, True)
+	port = d.getVar("PRSERV_PORT_" + pn, True)
+	if not (host is None):
+		d.setVar("PRSERV_HOST", host)
+	if not (port is None):
+		d.setVar("PRSERV_PORT", port)
 	if d.getVar('USE_PR_SERV', True) != "0":
 		try:
 			auto_pr=prserv_get_pr_auto(d)
-- 
1.7.0.4



