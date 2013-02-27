Received: from smtp-fo.knology.synacor.com ([64.8.71.118]
	helo=smtp.knology.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyle@farnsworthtech.com>) id 1UAluY-000340-UY
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 19:39:32 +0100
X_CMAE_Category: 0,0 Undefined,Undefined
X-CNFS-Analysis: v=2.0 cv=QerkT7nv c=1 sm=0 a=gvO/T8MMVPT0XnXDMvgFBA==:17
	a=N3B7nCLa1w4A:10 a=dWUxHrtDoX8A:10 a=4Du6mIFzAAAA:8
	a=7w1dxWPA5toA:10 a=WUnmM7GpQmbua2Mf5poA:9 a=sz1xIsRsWmcA:10
	a=gvO/T8MMVPT0XnXDMvgFBA==:117
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
Authentication-Results: smtp01.knology.synacor.com
	smtp.mail=kyle@farnsworthtech.com; spf=neutral;
	sender-id=neutral
Authentication-Results: smtp01.knology.synacor.com
	header.from=kyle@farnsworthtech.com; sender-id=neutral
Authentication-Results: smtp01.knology.synacor.com
	smtp.user=kfarns@knology.net; auth=pass (LOGIN)
Received-SPF: neutral (smtp01.knology.synacor.com: 216.186.251.41 is neither
	permitted nor denied by domain of farnsworthtech.com)
Received: from [216.186.251.41] ([216.186.251.41:30776]
	helo=host.farnsworthtech.com)
	by smtp.knlogy.net (envelope-from <kyle@farnsworthtech.com>)
	(ecelerity 2.2.3.47 r(39787)) with ESMTPA
	id 4F/E7-05672-07E4E215; Wed, 27 Feb 2013 13:20:33 -0500
Received: from farntech1.farnsworthtech.com (unknown [192.168.1.66])
	by host.farnsworthtech.com (Postfix) with ESMTP id 4EFB1813CF;
	Wed, 27 Feb 2013 12:20:32 -0600 (CST)
From: Kyle Farnsworth <kyle@farnsworthtech.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 12:20:30 -0600
Message-Id: <1361989230-3382-1-git-send-email-kyle@farnsworthtech.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Merge linux-gnu entries in machine dictionary and add sh4 machine.
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
X-List-Received-Date: Wed, 27 Feb 2013 18:39:34 -0000

Signed-off-by: Kyle Farnsworth <kyle@farnsworthtech.com>
---
 meta/classes/insane.bbclass |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f52fcea..e1827be 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -89,9 +89,6 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
                       },
-            "linux-gnu" : {
-                        "powerpc":    (20,     0,    0,          False,         32),
-                      },
             "linux-gnuspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
@@ -99,8 +96,10 @@ def package_qa_get_machine_dict():
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
             "linux-gnu" :       {
+                        "powerpc":    (20,     0,    0,          False,         32),
                         "microblaze":   (47787,  0,    0,          False,         32),
                         "microblazeel": (47787,  0,    0,          True,          32),
+                        "sh4":        (42,     0,    0,          True,          32),
                       },
             "linux-gnux32" :       {
                         "x86_64":     (62,     0,    0,          True,          32),
-- 
1.7.9.5



