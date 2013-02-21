Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.thalmeier@hale.at>) id 1U8T6g-0005kH-Pa
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 11:10:28 +0100
Received: from [62.99.145.13] (port=25270 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <michael.thalmeier@hale.at>) id 1U8SdG-0007Wc-3h
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 10:40:02 +0100
Received: from [83.64.51.210] (port=2752 helo=gateway1.hale)
	by smartmx-11.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <michael.thalmeier@hale.at>)
	id 1U8SdD-0003Bb-HA for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 10:39:59 +0100
Received: from mail.hale (mail.hale [192.168.100.5])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id r1L9dooi029366
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 10:39:50 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.hale (Postfix) with ESMTP id 8BD97662BF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 10:39:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at hale
Received: from mail.hale ([127.0.0.1])
	by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eu9gUiq+sl9p
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 10:39:40 +0100 (CET)
Received: from entw49.HALE (entw49.hale [192.168.100.117])
	by mail.hale (Postfix) with ESMTP id 606DE662BF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 10:39:40 +0100 (CET)
From: Michael Thalmeier <michael.thalmeier@hale.at>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2013 10:38:59 +0100
Message-Id: <1361439539-19732-1-git-send-email-michael.thalmeier@hale.at>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: r1L9dooi029366
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: michael.thalmeier@hale.at
MailScanner-NULL-Check: 1362044391.96891@8Ub8AYBkgtNqYpLZkEhGiQ
X-Spam-Status: No
Subject: [PATCH] python-argparse: add RDEPENDS on python-textutils
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
X-List-Received-Date: Thu, 21 Feb 2013 10:10:36 -0000

The argparse module uses the textwrapper modules contained in
python-textutils.

Signed-off-by: Michael Thalmeier <michael.thalmeier@hale.at>
---
 meta/recipes-devtools/python/python-argparse_1.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
index 7c15575..752ad64 100644
--- a/meta/recipes-devtools/python/python-argparse_1.2.1.bb
+++ b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -3,7 +3,8 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
 SRCNAME = "argparse"
-PR = "r2"
+PR = "r3"
+RDEPENDS_${PN} += "python-textutils"
 
 SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "2fbef8cb61e506c706957ab6e135840c"
-- 
1.8.1.2


--
Scanned by MailScanner.



