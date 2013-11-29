Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43F8C6DC32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 10:57:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rATAv1eC009112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 02:57:01 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 02:57:00 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 18:56:59 +0800
Message-ID: <1385722619-3641-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH] alsa-state: add status command
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
X-List-Received-Date: Fri, 29 Nov 2013 10:57:01 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
index 9850791..eee59cb 100755
--- a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
+++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
@@ -6,6 +6,8 @@
 # Filename: alsa-state
 # Date: 20070308 (YMD)
 
+# source function library
+. /etc/init.d/functions
 
 asound_restore(){
 	echo "ALSA: Restoring mixer settings..."
@@ -26,4 +28,12 @@ asound_store(){
 case "$1" in
 start)		asound_restore ;;
 stop)		asound_store ;;
+  status)
+    status /usr/sbin/alsactl;
+    exit $?
+  ;;
+  *)
+    echo "Usage: /etc/init.d/alsa-state {start|stop|status}"
+    exit 1
+  ;;
 esac
-- 
1.8.3


