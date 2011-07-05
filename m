Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QeBVM-0003rX-U4
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 21:41:57 +0200
Received: by vws2 with SMTP id 2so5025767vws.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 12:38:07 -0700 (PDT)
Received: by 10.220.169.14 with SMTP id w14mr2609213vcy.206.1309894686942;
	Tue, 05 Jul 2011 12:38:06 -0700 (PDT)
Received: from localhost.localdomain ([189.191.130.176])
	by mx.google.com with ESMTPS id r5sm493275vcg.20.2011.07.05.12.38.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 12:38:06 -0700 (PDT)
From: Adrian Alonso <aalonso@secretlab.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:38:09 -0500
Message-Id: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 1/4] insane: add microblaze little endian target info
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
X-List-Received-Date: Tue, 05 Jul 2011 19:41:57 -0000

* Add microblaze little endian target info to
  package_qa_get_machine_dict

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/insane.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ec9886b..c1db1ca 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -86,7 +86,8 @@ def package_qa_get_machine_dict():
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
             "linux-gnu" :       {
-                        "microblaze": (47787,  0,    0,          False,         32),
+                        "microblaze":   (47787,  0,    0,          False,         32),
+                        "microblazeel": (47787,  0,    0,          True,          32),
                       },
        }
 
-- 
1.7.6



