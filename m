Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.1])
	by mail.openembedded.org (Postfix) with ESMTP id 5995065CC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 16:29:13 +0000 (UTC)
Received: from [216.82.249.131] by server-1.bemta-12.messagelabs.com id
	C0/90-02067-A5792C95; Wed, 20 Sep 2017 16:29:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsXi5LtOQDdq+qF
	Ig+vnJSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozGLatYCvo4Kw4ct29gnMnRxcjFISSwilHi
	9q+zbBDOekaJ62cfsXYxcnKwCehJTL70hLmLkYNDBMi++k8UJCwsYCvRcXkzI4jNIqAq8WB7M
	xOIzStgIzG5+y0LiC0hIC9x7sFtZoi4oMTJmU/A4swCEhIHX7wAiwsJqEgcXHqZEaZ+0+az7B
	C2icTFq7vZIGxDie+zvkHNlJbY27eQeQIj/ywkY2chGbuAkWkVo0ZxalFZapGusYFeUlFmekZ
	JbmJmjq6hoZFebmpxcWJ6ak5iUrFecn7uJkZgsNUzMDDuYPz93/cQoyQHk5Ior+aUQ5FCfEn5
	KZUZicUZ8UWlOanFhxhlODiUJHiTpgHlBItS01Mr0jJzgGEPk5bg4FES4fUFSfMWFyTmFmemQ
	6ROMepydNy8+4dJiCUvPy9VSpzXAqRIAKQoozQPbgQsBi8xykoJ8zIyMDAI8RSkFuVmlqDKv2
	IU52BUEuY1BZnCk5lXArfpFdARTEBHZG84AHJESSJCSqqBUaFUYdKXRXe3H3Jod9F2rSnlMX7
	VUf/q4e7sf9r8kytffb3mkrPuZfqaSeuerbyWMK0z6WmEQ42TuNmn4P1XDRkYQwxfVZvwNJ1z
	eLk/mMNWdPKazptqKVMCBP5eqLzXdWqq+P7QINdvPmzW1g6fXS6v1H781Vjme8DSsuhnxSwcS
	YcdvpWLKbEUZyQaajEXFScCAMMR86+8AgAA
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-8.tower-28.messagelabs.com!1505924952!75943466!5
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4586 invoked from network); 20 Sep 2017 16:29:14 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-8.tower-28.messagelabs.com with SMTP;
	20 Sep 2017 16:29:14 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 20 Sep 2017 11:29:13 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Wed, 20 Sep 2017 18:29:09 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Sep 2017 18:28:56 +0200
Message-ID: <20170920162856.24278-1-javier.viguera@digi.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [PATCH] curl: add 'enable-ares' packageconfig option
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
X-List-Received-Date: Wed, 20 Sep 2017 16:29:13 -0000
Content-Type: text/plain

This build time option is needed to use the '--dns-interface' runtime
parameter to instruct 'curl' to use a specific interface for DNS
resolution.

Not enabled by default, as it depends on 'c-ares' package from
meta-openembedded (meta-networking).

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-support/curl/curl_7.54.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index 54f3b667c8a7..3a5f1ae7abfc 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls prox
 PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver zlib"
 
+# 'ares' and 'threaded-resolver' are mutually exclusive
+PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"

