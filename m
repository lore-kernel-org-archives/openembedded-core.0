Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcU-0000tx-Vw
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584265"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:41 -0700
Message-Id: <bc8c7e0c313a31bd2d105ff35765be361d5aec8d.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 14/14] hello-mod: Move hello-mod from meta to meta-skeleton
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:07 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO #1501]

hello-mod is an example kernel module, and does not provide any real
functionality. As such, it would be better placed under meta-skeleton than
meta.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../recipes-kernel/hello-mod/files/COPYING         |    0
 .../recipes-kernel/hello-mod/files/Makefile        |    0
 .../recipes-kernel/hello-mod/files/hello.c         |    0
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/COPYING (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/Makefile (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/files/hello.c (100%)
 rename {meta => meta-skeleton}/recipes-kernel/hello-mod/hello-mod_0.1.bb (100%)

diff --git a/meta/recipes-kernel/hello-mod/files/COPYING b/meta-skeleton/recipes-kernel/hello-mod/files/COPYING
similarity index 100%
rename from meta/recipes-kernel/hello-mod/files/COPYING
rename to meta-skeleton/recipes-kernel/hello-mod/files/COPYING
diff --git a/meta/recipes-kernel/hello-mod/files/Makefile b/meta-skeleton/recipes-kernel/hello-mod/files/Makefile
similarity index 100%
rename from meta/recipes-kernel/hello-mod/files/Makefile
rename to meta-skeleton/recipes-kernel/hello-mod/files/Makefile
diff --git a/meta/recipes-kernel/hello-mod/files/hello.c b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
similarity index 100%
rename from meta/recipes-kernel/hello-mod/files/hello.c
rename to meta-skeleton/recipes-kernel/hello-mod/files/hello.c
diff --git a/meta/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
similarity index 100%
rename from meta/recipes-kernel/hello-mod/hello-mod_0.1.bb
rename to meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
-- 
1.7.7.6



