Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
X-Greylist: delayed 490 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 May 2015 13:32:03 UTC
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 323266AC12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 13:32:03 +0000 (UTC)
Received: from hulk.bmw-carit.intra (hulk.bmw-carit.intra [192.168.101.92])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 58D634FBFE;
	Tue, 26 May 2015 15:17:46 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 May 2015 15:23:21 +0200
Message-Id: <1432646601-24221-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] boost: extend libraries with log and random
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
X-List-Received-Date: Tue, 26 May 2015 13:32:04 -0000

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index d95d281..cf4faca 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -11,7 +11,9 @@ BOOST_LIBS = "\
 	filesystem \
 	graph \
 	iostreams \
+	log \
 	program_options \
+	random \
 	regex \
 	serialization \
 	signals \
-- 
1.9.3


