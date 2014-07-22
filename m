Return-Path: <B50113@freescale.com>
X-Greylist: delayed 859 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Jul 2014 07:03:42 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0243.outbound.protection.outlook.com [207.46.163.243])
	by mail.openembedded.org (Postfix) with ESMTP id 7039B65E48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:03:42 +0000 (UTC)
Received: from BY2PR03CA074.namprd03.prod.outlook.com (10.141.249.47) by
	BL2PR03MB274.namprd03.prod.outlook.com (10.255.231.19) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Tue, 22 Jul 2014 06:49:25 +0000
Received: from BY2FFO11FD013.protection.gbl (2a01:111:f400:7c0c::191) by
	BY2PR03CA074.outlook.office365.com (2a01:111:e400:2c5d::47) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.7 via Frontend Transport; Tue, 22 Jul 2014
	06:49:24 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD013.mail.protection.outlook.com (10.1.14.75) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Tue, 22 Jul 2014 06:49:24 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6M6nIY0017680;
	Mon, 21 Jul 2014 23:49:23 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:49:20 +0800
Message-ID: <1406011764-4955-2-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1406011764-4955-1-git-send-email-b50113@freescale.com>
References: <1406011764-4955-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(2351001)(50226001)(86362001)(107046002)(79102001)(84676001)(46102001)(44976005)(50986999)(81156004)(97736001)(76482001)(229853001)(15202345003)(26826002)(20776003)(62966002)(87936001)(81542001)(64706001)(77156001)(15975445006)(102836001)(575784001)(92726001)(21056001)(104166001)(89996001)(4396001)(50466002)(106466001)(76176999)(80022001)(93916002)(47776003)(83072002)(88136002)(74502001)(92566001)(99396002)(19580395003)(74662001)(85852003)(69596002)(83322001)(110136001)(81342001)(6806004)(95666004)(31966008)(105606002)(19580405001)(77982001)(87286001)(48376002)(36756003)(104016003)(68736004)(33646002)(85306003)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB274;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 02801ACE41
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] gstreamer: fix a bug for gstbaseparse
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
X-List-Received-Date: Tue, 22 Jul 2014 07:03:46 -0000
Content-Type: text/plain

self-comparison will always evaluates to true.

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 ...ix-self-comparison-always-evaluates-to-tr.patch |   32 ++++++++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bb                 |    4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
new file mode 100644
index 0000000..d077496
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
@@ -0,0 +1,32 @@
+From ed7f4802222234eef192aa3f74bc92268f338f97 Mon Sep 17 00:00:00 2001
+From: Sebastian Droege <sebastian.droege@collabora.co.uk>
+Date: Tue, 6 Mar 2012 12:28:02 +0100
+Subject: [PATCH] baseparse: Fix 'self-comparison always evaluates to true'
+
+This was really a bug.
+
+Commit is ed7f4802222234eef192aa3f74bc92268f338f97 in 0.10 branch
+
+Upstream Status:  Backported
+
+Signed-off-by: Sebastian Droege <sebastian.droege@collabora.co.uk>
+---
+ libs/gst/base/gstbaseparse.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
+index 851ec1d..108ee89 100644
+--- a/libs/gst/base/gstbaseparse.c
++++ b/libs/gst/base/gstbaseparse.c
+@@ -3899,7 +3899,7 @@ gst_base_parse_handle_seek (GstBaseParse * parse, GstEvent * event)
+        seek event (in bytes) to upstream. Segment / flush handling happens
+        in corresponding src event handlers */
+     GST_DEBUG_OBJECT (parse, "seek in PUSH mode");
+-    if (seekstop >= 0 && seekpos <= seekpos)
++    if (seekstop >= 0 && seekstop <= seekpos)
+       seekstop = seekpos;
+     new_event = gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
+         GST_SEEK_TYPE_SET, seekpos, stop_type, seekstop);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 99eee81..f08908a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -13,7 +13,9 @@ PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
-           file://gst-inspect-check-error.patch"
+           file://gst-inspect-check-error.patch \
+           file://0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch \
+"
 
 SRC_URI[md5sum] = "a0cf7d6877f694a1a2ad2b4d1ecb890b"
 SRC_URI[sha256sum] = "e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de29b5d82bb41ae7a30"
-- 
1.7.9.5


