Return-Path: <mario.goulart@bmw-carit.de>
X-Greylist: delayed 456 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Jul 2016 14:09:03 UTC
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 556146E667
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 14:09:03 +0000 (UTC)
Received: from [10.40.100.14] (port=23426 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Mario.Goulart@bmw-carit.de>)
	id 1bQEXV-0002Hc-1C for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2016 16:01:25 +0200
Received: from macbook-bmw.bmw-car.intra (10.242.6.13) by
	CIT-HM8-EX02.bmw-carit.intra (10.40.100.14) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Thu, 21 Jul 2016 16:01:23 +0200
X-CTCH-RefID: str=0001.0A0C0202.5790D5B5.0101, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Mario Domenech Goulart <mario.goulart@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2016 16:00:59 +0200
Message-ID: <1469109659-3336-1-git-send-email-mario.goulart@bmw-carit.de>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.242.6.13]
X-ClientProxiedBy: CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) To
	CIT-HM8-EX02.bmw-carit.intra (10.40.100.14)
Cc: Mario Domenech Goulart <mario.goulart@bmw-carit.de>
Subject: [PATCH] insane.bbclass: Typo fix in do_qa_unpack's bb.note
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 14:09:04 -0000
Content-Type: text/plain

s/Checking has ${S} been created/Checking if ${S} has been created/

Signed-off-by: Mario Domenech Goulart <mario.goulart@bmw-carit.de>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9b2337c..1b12d46 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1246,7 +1246,7 @@ Missing inherit gettext?""" % (gt, config))
 }
 
 python do_qa_unpack() {
-    bb.note("Checking has ${S} been created")
+    bb.note("Checking if ${S} has been created")
 
     s_dir = d.getVar('S', True)
     if not os.path.exists(s_dir):
-- 
2.8.1


