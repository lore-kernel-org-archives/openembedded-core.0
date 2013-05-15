Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <drew_moseley@mentor.com>) id 1UcfJN-0007fq-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:16:22 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ucf1j-0006ny-QA from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 09:58:07 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 15 May 2013 09:58:07 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 May 2013 09:58:06 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 09:58:30 -0700
Message-Id: <1368637110-6785-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 15 May 2013 16:58:07.0090 (UTC)
	FILETIME=[5F44B520:01CE518D]
Subject: [PATCH] orc: Add generic license
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
X-List-Received-Date: Wed, 15 May 2013 17:16:27 -0000

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/conf/licenses.conf        |    2 +-
 meta/files/common-licenses/orc |   62 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/orc

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 3090214..5e06109 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -32,7 +32,7 @@ SRC_DISTRIBUTE_LICENSES += "LGPL-2.1 LGPL-3.0 Libpng LPL-1.02 LPPL-1.0 LPPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "LPPL-1.2 LPPL-1.3c MirOS MIT Motosoto MPL-1.0"
 SRC_DISTRIBUTE_LICENSES += "MPL-1.1 MS-PL MS-RL Multics NASA-1.3 Nauman NCSA"
 SRC_DISTRIBUTE_LICENSES += "NGPL Nokia NPOSL-3.0 NTP OASIS OCLC-2.0 ODbL-1.0"
-SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL OSL-1.0 OSL-2.0"
+SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL orc OSL-1.0 OSL-2.0"
 SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
 SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
 SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD Simple-2.0 Sleepycat"
diff --git a/meta/files/common-licenses/orc b/meta/files/common-licenses/orc
new file mode 100644
index 0000000..2a43304
--- /dev/null
+++ b/meta/files/common-licenses/orc
@@ -0,0 +1,62 @@
+
+The majority of the source code and the collective work is subject
+to the following license:
+  
+  Copyright 2002 - 2009 David A. Schleef <ds@schleef.org>
+  All rights reserved.
+  
+  Redistribution and use in source and binary forms, with or without
+  modification, are permitted provided that the following conditions
+  are met:
+  1. Redistributions of source code must retain the above copyright
+     notice, this list of conditions and the following disclaimer.
+  2. Redistributions in binary form must reproduce the above copyright
+     notice, this list of conditions and the following disclaimer in the
+     documentation and/or other materials provided with the distribution.
+  
+  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
+  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
+  IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  POSSIBILITY OF SUCH DAMAGE.
+  
+  
+The source code implementing the Mersenne Twister algorithm is
+subject to the following license:
+
+   Copyright (C) 1997 - 2002, Makoto Matsumoto and Takuji Nishimura,
+   All rights reserved.                          
+
+   Redistribution and use in source and binary forms, with or without
+   modification, are permitted provided that the following conditions
+   are met:
+
+     1. Redistributions of source code must retain the above copyright
+        notice, this list of conditions and the following disclaimer.
+
+     2. Redistributions in binary form must reproduce the above copyright
+        notice, this list of conditions and the following disclaimer in the
+        documentation and/or other materials provided with the distribution.
+
+     3. The names of its contributors may not be used to endorse or promote 
+        products derived from this software without specific prior written 
+        permission.
+
+   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+   A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
-- 
1.7.9.5



