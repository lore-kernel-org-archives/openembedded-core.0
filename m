Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcIxa-0000iO-FG
	for openembedded-core@lists.linuxtogo.org;
	Thu, 30 Jun 2011 17:15:18 +0200
Received: by wwf22 with SMTP id 22so2071236wwf.6
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 30 Jun 2011 08:11:34 -0700 (PDT)
Received: by 10.227.37.89 with SMTP id w25mr1911315wbd.31.1309446694756;
	Thu, 30 Jun 2011 08:11:34 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm1700276wbb.18.2011.06.30.08.11.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 08:11:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Thu, 30 Jun 2011 17:11:29 +0200
Message-Id: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Thu, 30 Jun 2011 15:15:18 -0000

These were turned off by:

	commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725
	Author: Richard Purdie <rpurdie@linux.intel.com>
	Date:   Thu Jul 8 23:51:06 2010 +0100

		insane.bbclass: Relax fatal errors for now until we get have time to work through the backlog

The current metadata triggers so many of these that they need to be made fatal so people will actually fix them.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/insane.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f7e5524..e06d2b2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -115,7 +115,6 @@ def package_qa_make_fatal_error(error_class, name, path,d):
 
     TODO: Load a whitelist of known errors
     """
-    return False
     return not error_class in [0, 5, 7, 8, 9]
 
 def package_qa_write_error(error_class, name, path, d):
-- 
1.6.6.1



