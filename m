Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.1])
	by mail.openembedded.org (Postfix) with ESMTP id 117CA60593
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:08:31 +0000 (UTC)
Received: from [216.82.249.131:8646] by server-1.bemta-12.messagelabs.com id
	1A/91-04524-D0CDFF15; Mon, 05 Aug 2013 17:08:29 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-28.messagelabs.com!1375722508!26590272!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11686 invoked from network); 5 Aug 2013 17:08:29 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-4.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	5 Aug 2013 17:08:29 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Mon, 5 Aug 2013 12:08:36 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.298.1; Mon, 5 Aug 2013 12:08:28 -0500
Received: from log-cln-jviguera.digi.com (10.101.1.79) by
	dor-sms-exch01.digi.com (10.49.8.100) with Microsoft SMTP Server id
	8.3.298.1; Mon, 5 Aug 2013 19:08:26 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2013 19:08:25 +0200
Message-ID: <1375722505-336-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
Cc: Javier Viguera <javier.viguera@digi.com>
Subject: [PATCH] kernel.bbclass: fix typo
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
X-List-Received-Date: Mon, 05 Aug 2013 17:08:31 -0000
Content-Type: text/plain

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 40a6b5b..ca49aec 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -57,7 +57,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 UBOOT_ENTRYPOINT ?= "20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
-# Some Linux kenrel configurations need additional parameters on the command line
+# Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
 # For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.

