Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PvBiC-0003rb-PE
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 17:49:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p23GlbBV000124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 08:47:37 -0800 (PST)
Received: from localhost.localdomain (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 3 Mar 2011 08:47:37 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Mar 2011 10:47:31 -0600
Message-ID: <8dc1e9c68a9f0b20188b37720db90a3f836321fd.1299170758.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1299170758.git.mark.hatle@windriver.com>
References: <cover.1299170758.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.36.229]
Subject: [PATCH 2/2] qa.py: Fix a typo when evaluating bitsize
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
X-List-Received-Date: Thu, 03 Mar 2011 16:49:17 -0000
Content-Type: text/plain

This should be setting a variable, not performing a comparison.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/qa.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 7adf4d0..d380012 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -40,9 +40,9 @@ class ELFFile:
         self.my_assert(self.data[3], 'F')
         if self.bits == 0:
             if self.data[ELFFile.EI_CLASS] == chr(ELFFile.ELFCLASS32):
-                self.bits == 32
+                self.bits = 32
             elif self.data[ELFFile.EI_CLASS] == chr(ELFFile.ELFCLASS64):
-                self.bits == 64
+                self.bits = 64
             else:
                 # Not 32-bit or 64.. lets assert
                 raise Exception("ELF but not 32 or 64 bit.")
-- 
1.7.4



