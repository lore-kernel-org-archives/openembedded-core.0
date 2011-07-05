Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QeBVO-0003rX-Bt
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 21:41:58 +0200
Received: by mail-vw0-f47.google.com with SMTP id 2so5025767vws.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 12:38:11 -0700 (PDT)
Received: by 10.52.173.244 with SMTP id bn20mr10579560vdc.224.1309894690857;
	Tue, 05 Jul 2011 12:38:10 -0700 (PDT)
Received: from localhost.localdomain ([189.191.130.176])
	by mx.google.com with ESMTPS id r5sm493275vcg.20.2011.07.05.12.38.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 12:38:10 -0700 (PDT)
From: Adrian Alonso <aalonso@secretlab.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:38:10 -0500
Message-Id: <1309894692-15230-2-git-send-email-aalonso@secretlab.ca>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
References: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
Subject: [PATCH 2/4] kernel-arch: microblaze little endian fix kernel arch
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
X-List-Received-Date: Tue, 05 Jul 2011 19:41:58 -0000

* In map_kernel_arch function return valid arch for
  microblazeel target arch.
  if TARGET_ARCH = "microblazeel" return "microblaze"

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/kernel-arch.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 692d4fb..86c15d3 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -26,6 +26,7 @@ def map_kernel_arch(a, d):
 	elif re.match('mipsel$', a):		        return 'mips'
 	elif re.match('sh(3|4)$', a):		        return 'sh'
 	elif re.match('bfin', a):                       return 'blackfin'
+	elif re.match('microblazeel', a):               return 'microblaze'
         elif a in valid_archs:			        return a
 	else:
 		bb.error("cannot map '%s' to a linux kernel architecture" % a)
-- 
1.7.6



