Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UIJF8-0001yN-4R
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 14:39:51 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 20 Mar 2013 14:22:58 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 715B1288AF8;
	Wed, 20 Mar 2013 14:22:58 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 14:22:36 +0100
Message-ID: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX03.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH] linux-kernel-base: linux/version.h path update for 3.7-rc1
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
X-List-Received-Date: Wed, 20 Mar 2013 13:39:55 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>

In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)
The path include/linux/version.h was updated to
include/generated/uapi/linux/version.h

Signed-off-by: Anders Roxell <anders.roxell@enea.com>
---
 meta/classes/linux-kernel-base.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 4f2b0a4..b7d0ffa 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -8,6 +8,9 @@ def get_kernelversion(p):
         fn = p + '/include/generated/utsrelease.h'
     if not os.path.isfile(fn):
         fn = p + '/include/linux/version.h'
+    if not os.path.isfile(fn):
+        # after 3.7-rc1
+        fn = p + '/include/generated/uapi/linux/version.h'
 
     import re
     try:
-- 
1.7.5.4



