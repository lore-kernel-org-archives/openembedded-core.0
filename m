Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJc-0001zY-30
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892786"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:45:02 -0700
Message-Id: <e573adeeb0272294c005c4ae5c03346dd9c938d3.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 11:45:58 -0700
Date: Tue, 03 May 2011 16:45:02 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 32/33] perl: fix Configure-multilib.patch
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
X-List-Received-Date: Tue, 03 May 2011 23:47:40 -0000

From: Saul Wold <sgw@linux.intel.com>

Thanks to Gary Thomas for his input on fixing this for Ubuntu 11.04

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../perl/perl-5.12.3/Configure-multilib.patch      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch b/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
index ef2be3d..9625b0b 100644
--- a/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
@@ -11,7 +11,7 @@ Index: perl-5.12.3/Configure
 -glibpth="/lib /usr/lib $xlibpth"
 +glibpth="/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
  glibpth="$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
-+test -f /usr/lib/`uname -m`-linux-gnu/libc.so && glibpth="/usr/lib/`uname -m`-linux-gnu $glibpth"
++test -f /usr/lib/*-linux-gnu/libc.so && glibpth="/usr/lib/*-linux-gnu $glibpth"
  test -f /usr/shlib/libc.so && glibpth="/usr/shlib $glibpth"
  test -f /shlib/libc.so     && glibpth="/shlib $glibpth"
  test -d /usr/lib64         && glibpth="$glibpth /lib64 /usr/lib64 /usr/local/lib64"
-- 
1.7.4.1



