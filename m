Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj1-0007kV-6L
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgQ4005212; Tue, 7 May 2013 13:58:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6jEvSN31oDRQ; Tue,  7 May 2013 13:58:43 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwdmC005190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:40 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRH-0005c9-83; Tue, 07 May 2013 13:56:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:56:00 +0100
Message-Id: <1367931368-21504-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/15] meta/lib/oe: Replace StandardError with Exception
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
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000

StandardError is removed in python3, replace with Exception class instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/license.py  |    2 +-
 meta/lib/oe/terminal.py |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 173e319..340da61 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -5,7 +5,7 @@ import ast
 import re
 from fnmatch import fnmatchcase as fnmatch
 
-class LicenseError(StandardError):
+class LicenseError(Exception):
     pass
 
 class LicenseSyntaxError(LicenseError):
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index aecf4e8..28470e3 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -6,10 +6,10 @@ from bb.process import Popen, ExecutionError
 logger = logging.getLogger('BitBake.OE.Terminal')
 
 
-class UnsupportedTerminal(StandardError):
+class UnsupportedTerminal(Exception):
     pass
 
-class NoSupportedTerminals(StandardError):
+class NoSupportedTerminals(Exception):
     pass
 
 
-- 
1.7.10.4



