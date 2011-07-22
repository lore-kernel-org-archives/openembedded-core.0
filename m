Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/uV8PCa8cghFWOnlI6+ehDD9RNfYe50yM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkC2b-0004M0-74
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:29:05 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9OvxM003866
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:24:57 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:24:52 -0500
Message-Id: <1311326696-11745-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>
References: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 1/5] insane.bbclass: Recognise powerpc64
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
X-List-Received-Date: Fri, 22 Jul 2011 09:29:05 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/insane.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 65eda9e..d56c9ed 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -38,6 +38,7 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,    97,    0,          True,          32),
                         "armeb":      (40,    97,    0,          False,         32),
                         "powerpc":    (20,     0,    0,          False,         32),
+                        "powerpc64":  (21,     0,    0,          False,         64),
                         "i386":       ( 3,     0,    0,          True,          32),
                         "i486":       ( 3,     0,    0,          True,          32),
                         "i586":       ( 3,     0,    0,          True,          32),
-- 
1.7.3.4



