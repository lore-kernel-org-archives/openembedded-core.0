Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1SHwO1-0000ek-44
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:10:57 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1SHwEz-0005J0-Oa from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 05:01:37 -0700
Received: from pkl-noor-ubuntu.mgc.mentorg.com ([137.202.157.70]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 11 Apr 2012 14:01:36 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:00:12 +0500
Message-Id: <1334145612-2814-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9
X-OriginalArrivalTime: 11 Apr 2012 12:01:36.0569 (UTC)
	FILETIME=[D8786290:01CD17DA]
Subject: [PATCH] insane.bbclass: Add missing variable bpn
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
X-List-Received-Date: Wed, 11 Apr 2012 12:10:57 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* bpn variable was used but it was not defined. Add bpn to resolve that issue.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/classes/insane.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6298136..1cfb898 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -328,6 +328,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
     target_os   = d.getVar('TARGET_OS', True)
     target_arch = d.getVar('TARGET_ARCH', True)
     provides = d.getVar('PROVIDES', d, True)
+    bpn = d.getVar('BPN', True)
 
     # FIXME: Cross package confuse this check, so just skip them
     for s in ['cross', 'nativesdk', 'cross-canadian']:
-- 
1.7.9



