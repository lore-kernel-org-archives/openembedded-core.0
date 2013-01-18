Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1TwDPF-00089Z-NO
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 15:59:37 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 7D0E92543409;
	Fri, 18 Jan 2013 14:48:04 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1TwD1Q-00085p-IX; Fri, 18 Jan 2013 15:34:20 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 15:34:02 +0100
Message-Id: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [PATCH] archiver.bbclass: Archive the native builds as well
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
X-List-Received-Date: Fri, 18 Jan 2013 14:59:41 -0000

On my build no copy of gcc/opkg-utils was archived. For gcc it is
bad as libgcc will end up in the image and the sources should be
provided. Update the method and comment to not exclude the native
version of the build.
---
 meta/classes/archiver.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a4a2158..516f947 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -187,11 +187,11 @@ def get_applying_patches(d):
 
 def not_tarball(d):
     """
-    packages including key words 'work-shared', 'native', 'packagegroup-' will be passed
+    packages including key words 'work-shared', 'packagegroup-' will be passed
     """
     workdir = d.getVar('WORKDIR', True)
     s = d.getVar('S', True)
-    if 'work-shared' in s or 'packagegroup-' in workdir or 'native' in workdir:
+    if 'work-shared' in s or 'packagegroup-' in workdir:
         return True
     else:
         return False
-- 
1.7.10.4



