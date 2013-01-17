Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1TvmZw-0002x9-4k
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 11:20:27 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 17 Jan 2013 11:03:46 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 4D5DC291D4B;
	Thu, 17 Jan 2013 11:03:46 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 11:03:34 +0100
Message-ID: <1358417014-49625-1-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX08.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH] systemtap: sources.redhat.com is deprecated.
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
X-List-Received-Date: Thu, 17 Jan 2013 10:20:28 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>

Signed-off-by: Anders Roxell <anders.roxell@enea.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 093e62d..3e7bc7b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "48fa6b5e1d3e636c34cbd5650370e6f634efc294"
 PV = "1.8+git${SRCPV}"
 
-SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
+SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
           "
 
-- 
1.7.5.4



