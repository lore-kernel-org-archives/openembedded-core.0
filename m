Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhUi8-000804-HW
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 00:48:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2011 15:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,531,1304319600"; d="scan'208";a="27825174"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.58])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2011 15:44:47 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2011 15:44:32 -0700
Message-Id: <521f9f1e955212a9974eb0897c0b322aa8356192.1310683406.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310683406.git.dvhart@linux.intel.com>
References: <cover.1310683406.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1310683406.git.dvhart@linux.intel.com>
References: <cover.1310683406.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] send-pull-request: default to --supress-cc=all
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
X-List-Received-Date: Thu, 14 Jul 2011 22:48:48 -0000

Unless the user specifies -c, don't pull in any email addresses from the
patches in the series. This avoids having to remove the email addresses from
patches being pulled in from upstream. If you want the email addresses on the
patch to be added, continue to use the -c option as before.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/send-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 4904a0d..be13009 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -26,7 +26,7 @@
 
 AUTO=0
 AUTO_CL=0
-GITSOBCC=""
+GITSOBCC="--suppress-cc=all"
 
 # Prevent environment leakage to these vars.
 unset TO
-- 
1.7.1



