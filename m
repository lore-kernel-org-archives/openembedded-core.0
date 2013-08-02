Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 039176B46A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:52:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r727qqGg003381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 00:52:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 00:52:49 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 15:52:57 +0800
Message-ID: <a9a8a2cade1d537dab1ca51ecf52ad5b80c20214.1375429844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375429844.git.Qi.Chen@windriver.com>
References: <cover.1375429844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 2/4] qtdemo-init: fix bashism
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
X-List-Received-Date: Fri, 02 Aug 2013 07:52:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
index 0748fcd..3a1f2cb 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
+++ b/meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
@@ -12,13 +12,13 @@ case "$1" in
   start)
 	echo "Starting qtdemo"
 	if [ -f /etc/profile.d/tslib.sh ]; then
-		source /etc/profile.d/tslib.sh
+		. /etc/profile.d/tslib.sh
 	fi
 	if [ -e "$TSLIB_TSDEVICE" ]; then
 		if [ ! -f /etc/pointercal ]; then
 			/usr/bin/ts_calibrate
 		fi
-		if [ "$QTDEMO" == qtdemo ]; then
+		if [ "$QTDEMO" = qtdemo ]; then
 			Xorg &
 			export DISPLAY=:0
 			$QTDEMO &
@@ -26,7 +26,7 @@ case "$1" in
 			QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
 		fi
 	else
-		if [ "$QTDEMO" == qtdemo ]; then
+		if [ "$QTDEMO" = qtdemo ]; then
 			Xorg &
 			export DISPLAY=:0
 		fi
@@ -35,7 +35,7 @@ case "$1" in
 	;;
   stop)
 	echo "Stopping qtdemo"
-	if [ "$QTDEMO" == qtdemo ]; then
+	if [ "$QTDEMO" = qtdemo ]; then
 		killall Xorg
 		killall qtdemo
 	else
-- 
1.7.9.5


