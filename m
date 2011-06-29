Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QbiJr-0005VD-U4
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:07:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2011 17:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="21269063"
Received: from swold-mobl.jf.intel.com (HELO [10.24.0.56]) ([10.24.0.56])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 17:04:09 -0700
Message-ID: <4E0A6BF8.3040409@linux.intel.com>
Date: Tue, 28 Jun 2011 17:04:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemtap: add sqlite3 to DEPENDS
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
X-List-Received-Date: Wed, 29 Jun 2011 00:07:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
  meta/recipes-kernel/systemtap/systemtap_git.bb |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb 
b/meta/recipes-kernel/systemtap/systemtap_git.bb
index aeb87c8..f24c179 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SystemTap - script-directed dynamic 
tracing and performance analy
  LICENSE = "GPLv2"
  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

-DEPENDS = "elfutils"
+DEPENDS = "elfutils sqlite3"

  SRCREV = "4ab3a1863bf4f472acae7a809bf2b38d91658aa8"
  PR = "r3"
-- 
1.7.3.4

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



