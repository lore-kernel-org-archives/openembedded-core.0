Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.197])
	by mail.openembedded.org (Postfix) with ESMTP id 8757565C66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:13:22 +0000 (UTC)
Received: from [216.82.241.132:20028] by server-5.bemta-8.messagelabs.com id
	6A/18-05345-040E4445; Mon, 20 Oct 2014 10:13:20 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-45.messagelabs.com!1413800000!37675295!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26745 invoked from network); 20 Oct 2014 10:13:20 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-11.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	20 Oct 2014 10:13:20 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 20 Oct 2014 05:13:11 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 20 Oct 2014 05:13:19 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.181.6; Mon, 20 Oct 2014 12:13:16 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Oct 2014 12:13:08 +0200
Message-ID: <1413799988-50345-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [daisy][PATCH] file: add wrapper to nativesdk-file
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
X-List-Received-Date: Mon, 20 Oct 2014 10:13:27 -0000
Content-Type: text/plain

Backport commit 69a3ab3 to 'daisy' which uses a different version of
file package.

Author of the original patch: Hongxu Jia <hongxu.jia@windriver.com>

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-devtools/file/file_5.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.16.bb b/meta/recipes-devtools/file/file_5.16.bb
index 46dbf88f8db0..a15d952e3de6 100644
--- a/meta/recipes-devtools/file/file_5.16.bb
+++ b/meta/recipes-devtools/file/file_5.16.bb
@@ -32,5 +32,9 @@ do_install_append_class-native() {
 		--magic-file ${datadir}/misc/magic.mgc
 }
 
+do_install_append_class-nativesdk() {
+	create_cmdline_wrapper ${D}/${bindir}/file \
+		--magic-file ${datadir}/misc/magic.mgc
+}
 
 BBCLASSEXTEND = "native nativesdk"

