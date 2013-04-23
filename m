Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UUZIR-0005qV-6i
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 11:14:00 +0200
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 4632FFF90D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 10:56:16 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Apr 2013 10:56:16 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (paul@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 23 Apr 2013 10:56:14 +0200
Received: from b5-vm-mint0.betafive.co.uk (b5-vm-mint0.betafive.co.uk
	[192.168.0.100])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 3DA1A16009F;
	Tue, 23 Apr 2013 09:56:09 +0100 (BST)
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Tue, 23 Apr 2013 09:56:07 +0100
Message-Id: <1366707367-53247-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.7.10.4
X-Ovh-Tracer-Id: 5525353793966672322
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeifedrfeeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [PATCH] common-licenses: remove HTMLisms from OFL-1.1
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
X-List-Received-Date: Tue, 23 Apr 2013 09:14:06 -0000

License text is clearer without HTML entities such as '&amp;' and '&#8212;'.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/files/common-licenses/OFL-1.1 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/common-licenses/OFL-1.1 b/meta/files/common-licenses/OFL-1.1
index 34f0659..e644bce 100644
--- a/meta/files/common-licenses/OFL-1.1
+++ b/meta/files/common-licenses/OFL-1.1
@@ -31,14 +31,14 @@ copyright statement(s).
 distributed by the Copyright Holder(s).
 
 "Modified Version" refers to any derivative made by adding to, deleting,
-or substituting &#8212; in part or in whole &#8212; any of the components of the
+or substituting -- in part or in whole -- any of the components of the
 Original Version, by changing formats or by porting the Font Software to a
 new environment.
 
 "Author" refers to any designer, engineer, programmer, technical
 writer or other person who contributed to the Font Software.
 
-PERMISSION &amp; CONDITIONS
+PERMISSION & CONDITIONS
 Permission is hereby granted, free of charge, to any person obtaining
 a copy of the Font Software, to use, study, copy, merge, embed, modify,
 redistribute, and sell modified and unmodified copies of the Font
-- 
1.7.10.4



