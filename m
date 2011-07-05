Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QeBVS-0003rX-1y
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 21:42:02 +0200
Received: by mail-vw0-f47.google.com with SMTP id 2so5025767vws.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 12:38:14 -0700 (PDT)
Received: by 10.220.62.8 with SMTP id v8mr1634523vch.219.1309894694588;
	Tue, 05 Jul 2011 12:38:14 -0700 (PDT)
Received: from localhost.localdomain ([189.191.130.176])
	by mx.google.com with ESMTPS id r5sm493275vcg.20.2011.07.05.12.38.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 12:38:14 -0700 (PDT)
From: Adrian Alonso <aalonso@secretlab.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:38:11 -0500
Message-Id: <1309894692-15230-3-git-send-email-aalonso@secretlab.ca>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
References: <1309894692-15230-1-git-send-email-aalonso@secretlab.ca>
Subject: [PATCH 3/4] siteinfo: add microblaze little endian target info
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
X-List-Received-Date: Tue, 05 Jul 2011 19:42:02 -0000

* Add microblaze little endian target information
  Endian little, 32 bits

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/siteinfo.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index fb8bac3..78b7008 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -42,6 +42,7 @@ def get_siteinfo_list(d):
                "i586-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
                "i686-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
                "microblaze-linux-gnu":    "endian-big bit-32 common-glibc microblaze-common",\
+               "microblazeel-linux-gnu":  "endian-little bit-32 common-glibc microblaze-common",\
                "mipsel-linux":            "endian-little bit-32 common-glibc mips-common",\
                "mipsel-linux-uclibc":     "endian-little bit-32 common-uclibc mips-common",\
                "mips-linux":              "endian-big bit-32 common-glibc mips-common",\
-- 
1.7.6



