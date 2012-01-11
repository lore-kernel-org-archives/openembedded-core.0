Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkoZF-0005ej-HC
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 04:09:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 19:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95059534"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2012 19:02:07 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 11:04:17 +0800
Message-Id: <04de28ff06e50515461c4475c87541126697a354.1326249734.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/5] layers: add a new folder to put user added layers
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
X-List-Received-Date: Wed, 11 Jan 2012 03:09:39 -0000

This is helpful for remote users to find the available layers in the
bitbake server machine.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 layers/README |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 layers/README

diff --git a/layers/README b/layers/README
new file mode 100644
index 0000000..88747f4
--- /dev/null
+++ b/layers/README
@@ -0,0 +1 @@
+Please put extra layers (besides meta and meta-yocto) in this folder.
-- 
1.7.0.4



