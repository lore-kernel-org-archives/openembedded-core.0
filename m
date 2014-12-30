Return-Path: <B50113@freescale.com>
X-Greylist: delayed 62763 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Dec 2014 02:54:59 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0136.outbound.protection.outlook.com [157.56.110.136])
	by mail.openembedded.org (Postfix) with ESMTP id 4925372647
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 02:54:59 +0000 (UTC)
Received: from CO2PR03CA0029.namprd03.prod.outlook.com (10.141.194.156) by
	BN3PR0301MB1251.namprd03.prod.outlook.com (25.161.207.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.49.12; Tue, 30 Dec 2014 02:54:57 +0000
Received: from BL2FFO11FD005.protection.gbl (2a01:111:f400:7c09::168) by
	CO2PR03CA0029.outlook.office365.com (2a01:111:e400:1414::28) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.12 via Frontend Transport; Tue, 30 Dec 2014
	02:54:56 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD005.mail.protection.outlook.com (10.173.161.1) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Tue, 30 Dec 2014 02:54:56 +0000
Received: from b50113.ap.freescale.net (b50113.ap.freescale.net
	[10.192.241.89])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sBU2spuK009052; Mon, 29 Dec 2014 19:54:54 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 10:55:52 +0800
Message-ID: <1419908153-18661-2-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419908153-18661-1-git-send-email-b50113@freescale.com>
References: <1419908153-18661-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(21056001)(62966003)(85426001)(110136001)(92566001)(33646002)(2950100001)(87936001)(50986999)(84676001)(48376002)(450100001)(105606002)(31966008)(106466001)(77156002)(76176999)(2351001)(104016003)(107046002)(6806004)(47776003)(19580395003)(15975445007)(64706001)(99396003)(89996001)(68736005)(77096005)(575784001)(4396001)(46102003)(50466002)(20776003)(229853001)(230783001)(120916001)(50226001)(19580405001)(97736003)(36756003)(86362001)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1251;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:BN3PR0301MB1251;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN3PR0301MB1251; 
X-Forefront-PRVS: 04410E544A
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1251; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2014 02:54:56.1878 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1251
Subject: [PATCH v2 1/2] gstreamer1.0-plugins-good: Decrease the rank as havn't this kind of decoder for asteriskh263
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
X-List-Received-Date: Tue, 30 Dec 2014 02:55:06 -0000
Content-Type: text/plain

When streaming H263 stream on RTSP, asteriskh263 will be loaded, but it can't
find this kind of video decoder. So decrease the rank as havn't this kind of
decoder.

https://bugzilla.gnome.org/show_bug.cgi?id=739935

Signed-off-by: Zidan Wang <b50113@freescale.com>
---
 .../decrease_asteriskh263_rank.patch               | 25 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.4.1.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
new file mode 100755
index 0000000..7f94f50
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
@@ -0,0 +1,25 @@
+commit d71d74daac8ed54156ed103958ab455c63c72b0e
+Author: Song Bing <b06498@freescale.com>
+Date:   Mon Nov 10 11:25:47 2014 +0800
+
+[asteriskh263] decrease the rank as we havn't this kind of decoder.
+
+Decrease the rank as we havn't this kind of decoder.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=739935
+
+Upstream Status: Pending
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+
+diff --git a/gst/rtp/gstasteriskh263.c b/gst/rtp/gstasteriskh263.c
+index a01fbc8..8fa3194 100644
+--- a/gst/rtp/gstasteriskh263.c
++++ b/gst/rtp/gstasteriskh263.c
+@@ -226,5 +226,5 @@ gboolean
+ gst_asteriskh263_plugin_init (GstPlugin * plugin)
+ {
+   return gst_element_register (plugin, "asteriskh263",
+-      GST_RANK_SECONDARY, GST_TYPE_ASTERISK_H263);
++      GST_RANK_SECONDARY - 1, GST_TYPE_ASTERISK_H263);
+ }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
index 441dd51..05798cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
+            file://decrease_asteriskh263_rank.patch \
 "
 SRC_URI[md5sum] = "eb3a3296b2f6009def1f5a09590ce767"
 SRC_URI[sha256sum] = "8559d4270065b30ed5c49b826e1b7a3a2bd5ee9a340ae745a2ae3f9718e4c637"
-- 
1.9.1


