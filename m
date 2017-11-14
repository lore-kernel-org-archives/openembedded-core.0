Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 421 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Nov 2017 20:03:35 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D20378551
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 20:03:35 +0000 (UTC)
Received: from [216.82.251.44] by server-11.bemta-12.messagelabs.com id
	39/F9-01772-47A4B0A5; Tue, 14 Nov 2017 19:56:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsXi5LtOQLfYizv
	K4PhvK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePLlS8sBX+5K+6ueMTWwLiWs4uRi0NIYDWj
	xPv/L5khnDWMEhvvd0A56xklZv+4xNTFyMnBJqAnMfnSE6AEB4cIkH31nyhIWFjATeLvmm/MI
	DaLgKrE1Q9/WUBsXgEbiX97F7KC2BIC8hKLv+9kA7E5BWwlPvddAasXAqr5NGEGVL2gxMmZT8
	BsZgEJiYMvXkDVqEgcXHqZEWbOps1n2Scw8s9C0jILScsCRqZVjBrFqUVlqUW6JqZ6SUWZ6Rk
	luYmZObqGhkZ6uanFxYnpqTmJScV6yfm5mxiBAVfPwMC4g/Hd/uhDjJIcTEqivCqf2aOE+JLy
	UyozEosz4otKc1KLDzHKcHAoSfDO8uCOEhIsSk1PrUjLzAGGPkxagoNHSYTXGyTNW1yQmFucm
	Q6ROsVoyXHoxe0/TBzPZr5uYOaYdrW1iVmIJS8/L1VKnHc3SIMASENGaR7cOFh8XmKUlRLmZW
	RgYBDiKUgtys0sQZV/xSjOwagkzMvkCTSFJzOvBG7rK6CDmIAOkgL5hbe4JBEhJdXA6Be7YG8
	Jf6DGn2X1nSrbC059jmPfb3dzEeuPx8bXojbVrEhhX9B/atn8g57vpzHw5Go1XWJa0lixNKTh
	OnOuVJDIpouCW1dPV97J4L7+0bTKlrVnKvbNrX7YEpexLiz47n4Xzkyt1F/cPR/0XW1jrpm2z
	9owtXPx2o4Hcx+uC/1zY/eadrdt65RYijMSDbWYi4oTAUse/EvKAgAA
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-7.tower-200.messagelabs.com!1510689395!39900110!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25502 invoked from network); 14 Nov 2017 19:56:35 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-7.tower-200.messagelabs.com with SMTP;
	14 Nov 2017 19:56:35 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 14 Nov 2017 13:56:33 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 14 Nov 2017 13:56:32 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Tue, 14 Nov 2017 20:56:30 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 20:56:19 +0100
Message-ID: <20171114195619.30923-3-javier.viguera@digi.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114195619.30923-1-javier.viguera@digi.com>
References: <20171114195619.30923-1-javier.viguera@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
Subject: [morty backport][PATCH 2/2] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 14 Nov 2017 20:03:36 -0000
Content-Type: text/plain

From: Jan Kiszka <jan.kiszka@web.de>

The upstream init script uses SIGUSR2 to terminate that daemon because
SIGTERM is ignored. As the killproc function does not support specifying
a signal, switch to start-stop-daemon. Drop the retry loop because
SIGUSR2 is lethal for agent.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
index 6303280aae1d..f90208555b9f 100755
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
@@ -33,16 +33,7 @@ case "$1" in
 
     stop)
         echo -n "Stopping $DAEMON_NAME: "
-        count=0
-        while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
-            killproc $DAEMON_PATH >& /dev/null
-            sleep 1
-            RETVAL=$?
-            if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
-                sleep 3
-            fi
-            count=`expr $count + 1`
-        done
+        start-stop-daemon -K -q -x $DAEMON_PATH -s USR2
         rm -f /var/lock/subsys/$DAEMON_NAME
         if [ -n "`/bin/pidof $DAEMON_PATH`" ] ; then
             echo "FAIL"
@@ -72,4 +63,3 @@ case "$1" in
 esac
 
 exit $RETVAL
-

