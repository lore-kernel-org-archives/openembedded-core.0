Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 431 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Jan 2017 16:27:44 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.197])
	by mail.openembedded.org (Postfix) with ESMTP id 4F56B60191
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jan 2017 16:27:44 +0000 (UTC)
Received: from [216.82.241.196] by server-5.bemta-8.messagelabs.com id
	B7/60-29202-1DD7A685; Mon, 02 Jan 2017 16:20:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsXi5LtOQPdibVa
	EQeMbJYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePRXKmCrxwVR1b1sDQwfmfvYuTiEBJYxSix
	+ssMVghnNaPEvT3LoJx1QJknR1i6GDk52AT0JCZfesLcxcjBIQJkX/0nChIWFnCTuPurgxnEZ
	hFQkVj4exOYzStgI3Hp9wewVgkBeYldbRdZIeKCEidnPgGLMwtISBx88QKsXgio9+DSy4ww9Z
	s2n2WHsE0kLl7dzQZhG0p8n/UNaqa0xN6+hcwTGAVmIRk7C8nYBYxMqxg1ilOLylKLdI0M9JK
	KMtMzSnITM3N0DQ0s9HJTi4sT01NzEpOK9ZLzczcxAsOwnoGBcQfj9vPuhxglOZiURHkTNmRE
	CPEl5adUZiQWZ8QXleakFh9ilOHgUJLgVQWGtZBgUWp6akVaZg4wImDSEhw8SiK8N6uB0rzFB
	Ym5xZnpEKlTjIpS4ryZNUAJAZBERmkeXBssCi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEu
	aVBtnOk5lXAjf9FdBiJqDFX+PSQRaXJCKkpBoYO1csumJs0mQqmi3LerlH/xXfrrsX90vzOvf
	c/KQYLHUiOfH+Y0nTPQ2eSyatF9F6qK5xw4jtysFfsyadn8Viw3FOanOu/9yZ3l2sZRKcwlOX
	tpatuVUewP3331LWBwvf7FKw+8GmfOtSyrP10X/S1p8Ty9J/I6e5fBfTxV5WTobVst3M9rfcl
	ViKMxINtZiLihMBGxNDjL0CAAA=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-9.tower-46.messagelabs.com!1483374033!33509148!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.1.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7785 invoked from network); 2 Jan 2017 16:20:33 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-9.tower-46.messagelabs.com with SMTP;
	2 Jan 2017 16:20:33 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 2 Jan 2017 10:20:29 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 2 Jan 2017 10:20:28 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.319.2; Mon, 2 Jan 2017 17:20:26 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jan 2017 17:20:25 +0100
Message-ID: <20170102162025.10154-1-javier.viguera@digi.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [PATCH] mtd-utils: install libmtd and libubi static libraries
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
X-List-Received-Date: Mon, 02 Jan 2017 16:27:46 -0000
Content-Type: text/plain

These two static libraries can be used to program custom applications to
access MTD devices.

For example an user of those libraries is 'swupdate' package from
'meta-swupdate'.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8a3afaf62b21..e83dfce11772 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -31,6 +31,11 @@ EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+	# Install 'libubi' and 'libmtd' static libraries
+	install -d ${D}${includedir}/mtd
+	install -m 0644 include/libmtd.h include/mtd/ubi-media.h ubi-utils/include/libubi.h ${D}${includedir}/mtd/
+	oe_libinstall -a -C lib libmtd ${D}${libdir}
+	oe_libinstall -a -C ubi-utils libubi ${D}${libdir}
 }
 
 PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"

