Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAF0713A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 15:49:00 +0000 (UTC)
Received: from [216.82.241.196] by server-1.bemta-8.messagelabs.com id
	49/0E-03191-CE2D4645; Thu, 13 Nov 2014 15:49:00 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-3.tower-46.messagelabs.com!1415893739!35815685!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10167 invoked from network); 13 Nov 2014 15:49:00 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-3.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	13 Nov 2014 15:49:00 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 13 Nov 2014 09:48:56 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 13 Nov 2014 09:48:59 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.181.6; Thu, 13 Nov 2014 16:48:57 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Nov 2014 16:48:56 +0100
Message-ID: <1415893736-52092-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [master][dizzy][PATCH] shadow-securetty: add ttyAM[0-3] serial ports
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
X-List-Received-Date: Thu, 13 Nov 2014 15:49:05 -0000
Content-Type: text/plain

Old version of the ARM AMBA serial port driver creates those device nodes.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-extended/shadow/files/securetty | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 7fecda1330ba..ecc246f7997c 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -9,6 +9,10 @@ ttyS2
 ttyS3
 
 # ARM AMBA SoCs
+ttyAM0
+ttyAM1
+ttyAM2
+ttyAM3
 ttyAMA0
 ttyAMA1
 ttyAMA2

