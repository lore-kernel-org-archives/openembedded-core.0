Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1U1EZn-0000IE-AA
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 12:14:39 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.9])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 2D70A40037;
	Fri,  1 Feb 2013 11:18:59 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 11:58:39 +0100
Message-Id: <1359716319-7445-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] insane.bbclass: removing outdated comment
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
X-List-Received-Date: Fri, 01 Feb 2013 11:14:40 -0000

This commit removes an outdated comment that recorded an issue that has been
resolved in the commits 1c75a5df6845090480deff20f469f177501d2182 and
d2d5456cd3b3bd3e52a5dedccca4d46e3a7986d1. Probably, the comment was missed
when changing the behavior in those commits.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/classes/insane.bbclass |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 015abd5..3693d42 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -557,8 +557,6 @@ def package_qa_check_license(workdir, d):
         return True
 
     if not lic_files:
-        # just throw a warning now. Once licensing data in entered for enough of the recipes,
-        # this will be converted into error and False will be returned.
         bb.error(pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)")
         return False
 
-- 
1.7.9.5



