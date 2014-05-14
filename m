Return-Path: <Yasir_Khan@mentor.com>
X-Greylist: delayed 3293 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 13:00:30 UTC
Received: from relay1.mentorg.com (unknown [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 873A760167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:00:30 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WkXwI-0001yM-LO from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 14 May 2014 05:05:38 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 14 May 2014 05:05:37 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 17:04:53 +0500
Message-Id: <1400069093-37048-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 14 May 2014 12:05:38.0048 (UTC)
	FILETIME=[D1966800:01CF6F6C]
Subject: [PATCH] bluez5: Update the bluetooth.conf
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
X-List-Received-Date: Wed, 14 May 2014 13:00:35 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

In bluez5, agent interface has been renamed from org.bluez.Agent
to org.bluez.Agent1. Reflect this change in bluetooth.conf to
allow sending of dbus messages to agent interface.

*Resolves no PIN prompt bug while pairing
*Resolves bluetooth keyboard connection problem

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../bluez5/bluez5/bluetooth.conf                   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
index ca5e9e4..e21e72e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
+++ b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
@@ -10,7 +10,7 @@
   <policy context="default">
     <allow own="org.bluez"/>
     <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent"/>
+    <allow send_interface="org.bluez.Agent1"/>
   </policy>
 
 </busconfig>
-- 
1.7.9.5


