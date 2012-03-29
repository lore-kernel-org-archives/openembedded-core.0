Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1SD9Ro-0001AF-Ks
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:07:04 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1SD9AD-0007SW-4d from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 23:48:53 -0700
Received: from pkl-noor-ubuntu.mgc.mentorg.com ([137.202.157.70]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 29 Mar 2012 08:48:51 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 11:48:35 +0500
Message-Id: <1333003715-3872-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9
X-OriginalArrivalTime: 29 Mar 2012 06:48:51.0881 (UTC)
	FILETIME=[00797990:01CD0D78]
Subject: [PATCH] libc-packgae.bbclass: Add i686 support in locale_arch_options
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
X-List-Received-Date: Thu, 29 Mar 2012 07:07:04 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* While building for i686 architectre an error was coming that
locale_arch_options does not have support for i686. Add missing support.
* Verified on intel architecture.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/classes/libc-package.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 4acf91a..957243d 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -271,6 +271,7 @@ python package_do_split_gconvs () {
 				"mips":    " --uint32-align=4 --big-endian ",    \
 				"mipsel":  " --uint32-align=4 --little-endian ", \
 				"i586":    " --uint32-align=4 --little-endian ", \
+				"i686":    " --uint32-align=4 --little-endian ", \
 				"x86_64":  " --uint32-align=4 --little-endian "  }
 
 			if target_arch in locale_arch_options:
-- 
1.7.9



