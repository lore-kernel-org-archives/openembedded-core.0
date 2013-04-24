Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47Z-0004Uq-ET
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632444"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:43 +0100
Message-Id: <f63ff84aceed95aab8fc4e694c73afe830df9a62.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/21] readline: add SUMMARY
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 18:08:51 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/readline/readline.inc    |    1 +
 meta/recipes-core/readline/readline_5.2.bb |    1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index b61104c..6c43e2d 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -1,3 +1,4 @@
+SUMMARY = "Library for editing typed command lines"
 DESCRIPTION = "The GNU Readline library provides a set of functions for use by applications that allow users to edit \
 command lines as they are typed in. Both Emacs and vi editing modes are available. The Readline library includes  \
 additional functions to maintain a list of previously-entered command lines, to recall and perhaps reedit those   \
diff --git a/meta/recipes-core/readline/readline_5.2.bb b/meta/recipes-core/readline/readline_5.2.bb
index 1aa44f8..05ab26f 100644
--- a/meta/recipes-core/readline/readline_5.2.bb
+++ b/meta/recipes-core/readline/readline_5.2.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Library for editing typed command lines"
 DESCRIPTION = "The GNU Readline library provides a set of functions for use by applications that allow users to edit \
 command lines as they are typed in. Both Emacs and vi editing modes are available. The Readline library includes  \
 additional functions to maintain a list of previously-entered command lines, to recall and perhaps reedit those   \
-- 
1.7.10.4



