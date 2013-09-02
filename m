Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 8883F6BDA9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 05:08:34 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 8AC9040096;
	Mon,  2 Sep 2013 06:06:47 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 07:08:04 +0200
Message-Id: <1378098484-19371-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] boost: adding serialization to BOOST_LIBS
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
X-List-Received-Date: Mon, 02 Sep 2013 05:08:35 -0000

Since its initial commit from the classic OpenEmbedded repository
in 43e94412c45b4b79485a64010c76d89b245bb235, serialization was
commented out, reportedly due to some issue with powerpc in the
boost version 1.36. In the classic OpenEmbedded repository,
serialization has been added again since version 1.4x.

The commit removes the outdated comment and adds serialization to
the BOOST_LIBS after testing `bitbake boost` and bitbaking some
applications using boost from the meta-ros layer for qemuppc.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/boost/boost.inc |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 5d20b11..5a219c5 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -11,15 +11,13 @@ BOOST_LIBS = "\
 	iostreams \
 	program_options \
 	regex \
+	serialization \
 	signals \
 	system \
 	test \
 	thread \
 	"
 
-# FIXME: for some reason this fails on powerpc
-#BOOST_LIBS += "serialization"
-
 # To enable python, uncomment the following:
 #BOOST_LIBS += "python"
 #DEPENDS += "python"
-- 
1.7.9.5


