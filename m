Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Oct 2014 08:13:15 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.12])
	by mail.openembedded.org (Postfix) with ESMTP id 10F616AC6B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 08:13:15 +0000 (UTC)
Received: from [216.82.249.131:60947] by server-12.bemta-12.messagelabs.com id
	E2/E3-09687-E670D245; Thu, 02 Oct 2014 08:06:06 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-5.tower-28.messagelabs.com!1412237165!33638536!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6688 invoked from network); 2 Oct 2014 08:06:06 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-5.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	2 Oct 2014 08:06:06 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 2 Oct 2014 03:06:26 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 2 Oct 2014 03:06:04 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.181.6; Thu, 2 Oct 2014 10:06:02 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 10:06:01 +0200
Message-ID: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [PATCH] nativesdk-packagegroup-sdk-host: add nativesdk-u-boot-mkimage
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
X-List-Received-Date: Thu, 02 Oct 2014 08:13:25 -0000
Content-Type: text/plain

Add the 'mkimage' host tool to the toolchains generated with 'bitbake
meta-toolchain' or with 'bitbake -c populate_sdk <image>'.

This allows to use the standalone toolchain to build kernel images of
type uImage (with u-boot header)

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 0c6a530be6f9..ab68e2ffd3a7 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
     nativesdk-makedevs \
     nativesdk-smartpm \
     nativesdk-postinst-intercept \
+    nativesdk-u-boot-mkimage \
     "
 
 RDEPENDS_${PN}_darwin = "\

