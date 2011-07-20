Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDZ-0001ZS-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753354"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:36 -0700
Message-Id: <e08db3de08c9ee61eecc6aa56d133863bd2403e4.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 49/50] site/x86_64-linux-uclibc: Cache lf_cv_sane_realloc
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
X-List-Received-Date: Wed, 20 Jul 2011 08:36:54 -0000

From: Khem Raj <raj.khem@gmail.com>

If left to configure, it tried to run the testcase
to determine this and that fails on cross compile
e.g. compiling startup-notification-0.12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/x86_64-linux-uclibc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index d83ed1d..d0d0f32 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -102,3 +102,6 @@ ac_cv_alignof_CORBA_short=2
 ac_cv_alignof_CORBA_struct=1
 ac_cv_alignof_CORBA_wchar=2
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-- 
1.7.3.4



