Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 410 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Jul 2017 16:38:57 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.206])
	by mail.openembedded.org (Postfix) with ESMTP id 2AAE671D79
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 16:38:57 +0000 (UTC)
Received: from [216.82.241.196] by server-14.bemta-8.messagelabs.com id
	38/19-01732-8083E695; Tue, 18 Jul 2017 16:32:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsXi5LtOQJfdIi/
	S4ORdS4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNjYQ9zwWKuilc939kbGK9wdDFycQgJrGaU
	mLxzDzOEs4ZR4nrXEtYuRk4gZz2jxJw9DiA2m4CexORLT4CKODhEgOyr/0RBwsIC9hLXGs+Dl
	bMIqEq8ebSPEaSEV8BG4toyL5CwhIC8xJVf/SwgNq+AoMTJmU/AbGYBCYmDL14wQ2xSkTi49D
	IjTP2mzWfZIWwTiYtXd7NB2IYS32d9Y4GwpSX29i1knsAoMAvJ2FlIxi5gZFrFqFGcWlSWWqR
	raKiXVJSZnlGSm5iZo2toYKGXm1pcnJiempOYVKyXnJ+7iREYhAxAsINx3cfIQ4ySHExKorxb
	lfMihfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw1psB5QSLUtNTK9Iyc4DxAJOW4OBREuHtA0nzF
	hck5hZnpkOkTjEac8z5veMLE8erCf+/MQmx5OXnpUqJ82qClAqAlGaU5sENgsXpJUZZKWFeRq
	DThHgKUotyM0tQ5V8xinMwKgnz3jUFmsKTmVcCt+8V0ClMQKcI++aAnFKSiJCSamDsvXJocvS
	X9W4zqvnrWK7kdjbpPNuuZ8vA8TP3xaPD70WOu857sVVeavZT200Ov1Mlizsaug/GO+QeCjmx
	+XaYde6cR0LLDU2MDcqesr3kuFe8qejOxQVzXedwftsR5ijU1/eQafIJ28oQTw69eSdnvJ6sb
	69eopqUIPUx+ofs8qintV1/pHWVWIozEg21mIuKEwEcSjaizgIAAA==
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-46.messagelabs.com!1500395527!70990516!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13246 invoked from network); 18 Jul 2017 16:32:07 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-11.tower-46.messagelabs.com with SMTP;
	18 Jul 2017 16:32:07 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.351.0;
	Tue, 18 Jul 2017 11:32:05 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.351.0;
	Tue, 18 Jul 2017 11:32:04 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.351.0; Tue, 18 Jul 2017 18:32:03 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 18:32:02 +0200
Message-ID: <20170718163202.16781-1-javier.viguera@digi.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [PATCH] bluez5: cosmetic fixes to bluetooth bootscript
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
X-List-Received-Date: Tue, 18 Jul 2017 16:38:58 -0000
Content-Type: text/plain

Fix booting messages wrapped over two different lines:

    Starting bluetooth
    bluetoothd

    Stopping bluetooth
    /usr/libexec/bluetooth/bluetoothd

Also reworked whitespace (removed some empty lines).

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-connectivity/bluez5/bluez5/init | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/init b/meta/recipes-connectivity/bluez5/bluez5/init
index 489e9b9eba33..d7972f2d950b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/init
+++ b/meta/recipes-connectivity/bluez5/bluez5/init
@@ -21,25 +21,22 @@ set -e
 
 case $1 in
   start)
-	echo "Starting $DESC"
-
+	echo -n "Starting $DESC: "
 	if test "$BLUETOOTH_ENABLED" = 0; then
-		echo "disabled. see /etc/default/bluetooth"
+		echo "disabled (see /etc/default/bluetooth)."
 		exit 0
 	fi
-
 	start-stop-daemon --start --background $SSD_OPTIONS
-	echo "${DAEMON##*/}"
-
+	echo "${DAEMON##*/}."
   ;;
   stop)
-	echo "Stopping $DESC"
+	echo -n "Stopping $DESC: "
 	if test "$BLUETOOTH_ENABLED" = 0; then
-		echo "disabled."
+		echo "disabled (see /etc/default/bluetooth)."
 		exit 0
 	fi
 	start-stop-daemon --stop $SSD_OPTIONS
-	echo "${DAEMON}"
+	echo "${DAEMON##*/}."
   ;;
   restart|force-reload)
 	$0 stop

