Return-Path: <B50113@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0209.outbound.protection.outlook.com [207.46.163.209])
	by mail.openembedded.org (Postfix) with ESMTP id 80EFD65C70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 01:50:26 +0000 (UTC)
Received: from BY2PR03MB285.namprd03.prod.outlook.com (10.242.37.16) by
	BY2PR03MB1141.namprd03.prod.outlook.com (10.242.239.19) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Thu, 7 Aug 2014 01:50:13 +0000
Received: from BN3PR0301CA0036.namprd03.prod.outlook.com (25.160.180.174) by
	BY2PR03MB285.namprd03.prod.outlook.com (10.242.37.16) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Thu, 7 Aug 2014 01:50:12 +0000
Received: from BL2FFO11FD020.protection.gbl (2a01:111:f400:7c09::146) by
	BN3PR0301CA0036.outlook.office365.com (2a01:111:e400:4000::46) with
	Microsoft SMTP Server (TLS) id 15.0.1005.10 via Frontend Transport;
	Thu, 7 Aug 2014 01:50:11 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD020.mail.protection.outlook.com (10.173.161.38) with
	Microsoft SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Thu, 7 Aug 2014 01:50:10 +0000
Received: from ubuntu.ap.freescale.net (ubuntu.ap.freescale.net
	[10.192.241.184])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s771o4nb007780; Wed, 6 Aug 2014 18:50:09 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 09:50:23 +0800
Message-ID: <1407376223-3139-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(6806004)(106466001)(77156001)(64706001)(575784001)(85306004)(86362001)(105606002)(19580405001)(93916002)(36756003)(62966002)(4396001)(80022001)(50226001)(19580395003)(83322001)(31966008)(104166001)(15975445006)(97736001)(87286001)(89996001)(99396002)(44976005)(84676001)(83072002)(88136002)(92566001)(92726001)(81342001)(50466002)(48376002)(87936001)(74662001)(74502001)(79102001)(33646002)(104016003)(50986999)(110136001)(68736004)(77982001)(46102001)(20776003)(26826002)(76482001)(47776003)(85852003)(229853001)(2351001)(81542001)(95666004)(21056001)(107046002)(102836001)(42413003)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB285;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 029651C7A1
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-OriginatorOrg: freescale.com
Subject: [PATCH] gstreamer1.0-plugins-good: fix the bug for gstrtpmp4gpay
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
X-List-Received-Date: Thu, 07 Aug 2014 01:50:34 -0000
Content-Type: text/plain

set dafault value for MPEG4 without codec data in caps

https://bugzilla.gnome.org/show_bug.cgi?id=734263

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 ...ay-set-dafault-value-for-MPEG4-without-co.patch |   62 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.4.0.bb   |    4 ++
 2 files changed, 66 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
new file mode 100755
index 0000000..53147df
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
@@ -0,0 +1,62 @@
+From c782a30482908a4b4dd9cd4abff9f9bc4016698f Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Tue, 5 Aug 2014 14:40:46 +0800
+Subject: [PATCH] gstrtpmp4gpay: set dafault value for MPEG4 without codec
+ data in caps.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=734263
+
+Upstream Status: Submitted
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+---
+ gst/rtp/gstrtpmp4gpay.c |   19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/gst/rtp/gstrtpmp4gpay.c b/gst/rtp/gstrtpmp4gpay.c
+index 7913d9a..1749d39 100644
+--- a/gst/rtp/gstrtpmp4gpay.c
++++ b/gst/rtp/gstrtpmp4gpay.c
+@@ -390,6 +390,7 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
+   const GValue *codec_data;
+   const gchar *media_type = NULL;
+   gboolean res;
++  const gchar *name;
+ 
+   rtpmp4gpay = GST_RTP_MP4G_PAY (payload);
+ 
+@@ -400,7 +401,6 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
+     GST_LOG_OBJECT (rtpmp4gpay, "got codec_data");
+     if (G_VALUE_TYPE (codec_data) == GST_TYPE_BUFFER) {
+       GstBuffer *buffer;
+-      const gchar *name;
+ 
+       buffer = gst_value_get_buffer (codec_data);
+       GST_LOG_OBJECT (rtpmp4gpay, "configuring codec_data");
+@@ -426,6 +426,23 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
+ 
+       rtpmp4gpay->config = gst_buffer_copy (buffer);
+     }
++  } else {
++    name = gst_structure_get_name (structure);
++
++    if (!strcmp (name, "video/mpeg")) {
++      rtpmp4gpay->profile = g_strdup ("1");
++
++      /* fixed rate */
++      rtpmp4gpay->rate = 90000;
++      /* video stream type */
++      rtpmp4gpay->streamtype = "4";
++      /* no params for video */
++      rtpmp4gpay->params = NULL;
++      /* mode */
++      rtpmp4gpay->mode = "generic";
++
++      media_type = "video";
++    }
+   }
+   if (media_type == NULL)
+     goto config_failed;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
index 33a75bd..2d392c6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.0.bb
@@ -3,6 +3,10 @@ include gstreamer1.0-plugins-good.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
+
+SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
+"
+
 SRC_URI[md5sum] = "8007d57a38f6b2882961b2547fa4597c"
 SRC_URI[sha256sum] = "48a62e7987fffa289a091dfc8ccc80b401d110632b8fc1adce5b82fc092f2685"
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
1.7.9.5


