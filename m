Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UFXwR-0004fj-NN
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 23:45:09 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 23:28:27 +0100
Message-Id: <1363127307-10861-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] documentation.conf: remove unused variable QA_LOG
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
X-List-Received-Date: Tue, 12 Mar 2013 22:45:09 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/conf/documentation.conf |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 44b1f1a..0bc4230 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -114,9 +114,6 @@ SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the
 IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
 FEED_DEPLOYDIR_BASE_URI[doc] = "Allow to serve ipk deploy dir as an adhoc feed (bogofeed). Set to base URL of the dir as exported by HTTP. Set of adhoc feed configs will be generated in image."
 
-# insane bbclass
-QA_LOG[doc] = "Enable logging of QA errors to log.qa_package. Default is not to log."
-
 # palmtop build class
 PALMTOP_USE_MULTITHREADED_QT[doc] = "Set to yes, if you want to build qt apps with CONFIG+=thread"
 
-- 
1.7.10.4



