Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0121.outbound.protection.outlook.com [207.46.100.121])
	by mail.openembedded.org (Postfix) with ESMTP id D0C2C731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:29 +0000 (UTC)
Received: from CH1PR03CA003.namprd03.prod.outlook.com (10.255.156.148) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:48 +0000
Received: from BN1AFFO11FD017.protection.gbl (10.255.156.132) by
	CH1PR03CA003.outlook.office365.com (10.255.156.148) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:47 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD017.mail.protection.outlook.com (10.58.52.77) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:47 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROf015522; Mon, 18 Jan 2016 02:35:46 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:59 +0800
Message-ID: <1453109582-25485-11-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD017;
	1:Tyz6hyu2TBKNSl8P2tPQVcyDFhRlWhvfqCZQv8jwAvsQBTy8NDphTMpDr0m8TaGJbHM3jfkQ52thF5pSLsW2vAZXmF8DUxRciJ9aadVvN8V62FDbUvUWsvghvkLpKCK3Tz/0JmdXkTt5Ohqjq7v7/h4P/pwFD+7GFFDNvryYrLLMUgfNYyfdBqukDDMScQ+vb3/Z7DOfuQaTpSeCINh3ImKPr0r6BLBNMpjt6pAMv7Txt40rNzuqByZ7W6YrCnJTGoE2ZEgSkMpl2U/NCqohmY0NCuuhrJOITUDv508O5Qj2F1bAeMRMAOUeQzxJ/BNInbcXBDb/8+GAXj1kHgomJytm3yNF/jb2FlmaSdjrgtGo7CWLtQFM4cs27qk372iGHe9imWGlwMepyv7picWqAWAeNtCKcxAh+JU45kWfO10=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(5001960100002)(586003)(48376002)(15975445007)(2351001)(19580395003)(76176999)(19580405001)(229853001)(50226001)(4001430100002)(11100500001)(4326007)(5008740100001)(47776003)(50466002)(87936001)(5003940100001)(2950100001)(106466001)(85326001)(50986999)(107886002)(230783001)(110136002)(97736004)(92566002)(77096005)(33646002)(575784001)(189998001)(2906002)(36756003)(450100001)(6806005)(86362001)(1096002)(104016004)(1220700001)(81156007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e454590b-7de6-486c-ced8-08d31feabefb
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:fPL9RfgKgPOVBYLdhnUzHSEY0+gDwklEVLks2kYZnzDDrHs9pllsqFSRoSPezDyKc28s2wnKWXFZ5w4KB+OiUUUbBcZsikSIBIKAuS6noGWs0At/sYsSduo3sGlfG999vN7x/c54KpRDVYGPnHtMXc88Oc/WL2MYZO3MqZFwYvtIecqmb8RwS1V5whLrE94K;
	3:pQZ5vBQwJxiboEmMrd6S9dXkDryLV5xV83CMZtjFH0CcNp92oaAtdj90AajRpqSfPTYkmSOEZKLBRsMi7mqb/7mzngZ7628idb7pC+NIwmeeukibJj5bWmU0sNqGdq82Y4lHcR1EPOK6AqekfWWV4XIpA8KGlDqq1a4p/crGWm/v63fyAfMcE0fw0vPA5LuWuChfWIPPBD4bebSNe2IDrf0Wf+WbJIZr6hWac1PaNeU=;
	25:485egnYu8v5hLyKC3rWOaWPD9ZppHZp4OxilZRGtSlj1k8xAyg0Q1ocjCn+BAhdq8A3+wXGBuCdJ59PExJfskHu5knXGVOZqkIWNT86oXWlHclUOF5glXy+GMf5TiMyd6csaGQQabnXe9w3H5viM3mc4gF5lRMWdT//nZNMtfJdG0ds3F5ZzT6ORa49lwwWYubO0ClfLFko7pkYzG2x+kIKsgyCa7gvsGOhTXXabTuNm7jbWC9l/dQyitU/yK1Vg
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1179; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:FObaA4v1q7p606KZ3dTrfKXLtBixPNuPqWczN6Q+1h+nSoe5upDqFUw2exRZyCDfeSFX7VsxIdTr1C/Ls8VShlt/aa4lirSxil8g4koKHGv98PyfTyWSGIhJeBA+ZrwJAdkeJoG76Qe6PsRamrbdGZnt7itYxAZyPXyDp/DCuy0VLia9gdxGwtu1vX8rl0/7YYBQaVXM9h83E/CHYo+e42cr/D0WHIo4F01OS8ntnOLAPzUnZTFZKrxfvm2TIWUqrGLCa9UZBrEx/qVev5o/9cDff5NS3SMQtemzBEXJhRQz4/nPBNmMx46M9BfMgg0cf5Oy4y7vdfsNAPrE3vERJgL+i8xy5RgIDeSrRzi1u2Znb4NGvVAwO7WB6TNVq7joOG4krrtPpjk+0G/uZWE+Rhnc57js1xGlCqtQLt3omzZUKcXoAW45DMbJfVPEjJ2Q;
	4:nWvdMOC7a6W7Ss3Zh+tg5j5DC41jW62Ak7EV96GP9jGQMfanLlJBfUOCdTpMmcIazWAPS0QauLc1OSfcGecBUMPiWoJDwKAbH8uDAFGVYysoKVMqBntM70wgmFYDRDiCpZ7rw0VHK8oKC9gt5gkSB/0IzGB46nfPYXsR8P7mhQOwHmjQNIvH3k6sd7q5bxEMf3W4wHmq9hpagGnLeUc2MAoxHxT74IOoMfDn2s3Aj/mhJVIIKLAi4yQjUTqL0biHGqJaqrQJAl45Xn+o2r5OFs1DmP21HluKOOrzV9MjEiyPY2XJ8p5f+CWeDRhkSRx6P4frqf1Crzu0RRYXr+exlyT1HED+eyNPr9sUfLva55Z8yim3quF1FRApOtGUxb7kC7+9BM4b/IK9y+QTXHSZX38ay3gUb15zO+6HElp1JKJ66GrXWIcxtnOfnH4RM2GZTdXJcwyFFUag36FG2RWCcaTfx2UXMV0xEDD48gHMQfVKzmh5BUyIwG9GWrGRBC+3
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11792275F7A696CBA6D6EFF586C00@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:CY1PR0301MB1179; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1179;
	23:Sz8M1EGBFz1Dj/u8y31cVbv4lxIzDRIWgD38NfZ?=
	=?us-ascii?Q?zOPSuLrBOKTaik+VY2OakjkhhwubAWMr7PRgUmaydiiOqu0YsL1mvoIm7Cpf?=
	=?us-ascii?Q?cjAiV8TULkFkULOUq3yqbgH1kCYMarAMd7YlyDDj4qVXoi3DxmC7epqR18mu?=
	=?us-ascii?Q?817CpXwQqAs+5t2xPBITUq1hz+5p70F39FZ75bp5jKYFcXf9J/DiXOv5VWKg?=
	=?us-ascii?Q?2Qn5trJrC9jk+8nhyY29fKoX6/z8w3Qg+buZTeTDvZkA5sUuDy96uqN+RLjN?=
	=?us-ascii?Q?FSiOc8bqImZuyZEm2aJVJ+qui3t0YDO/LVQH9qdfOUIoFtkYAP/drmZT5W7b?=
	=?us-ascii?Q?JF68pWE4TG+EN9NEsiYYBQyXt/WXef/QQYYD4BFFBBXUMUX+9JI+zVr5eouX?=
	=?us-ascii?Q?vxyZ8pOLo4GH2BZ3q4xpoEcMsVCVW8dQRf72CxD3PEHUVLVj4qzd4Z3UJaqq?=
	=?us-ascii?Q?63j/VPZkr2pNxvpNKnpoEToDFEyBYuFTQSpeFuMMrRNjKHE5/MPfW+/j3xc8?=
	=?us-ascii?Q?05Ix6GTes+iiHZBWeqd4yQ8L2rJFzWkeUak+GO/+CEEIEqtY1xSikmtznUib?=
	=?us-ascii?Q?u9J61ra8Szjmk8HJA9wm0iN5+FOsfSjGEAqQpr02jFk5eQMeaJ9nF+aKjfLs?=
	=?us-ascii?Q?Jh+CIj+mGHGOGk0Dbpf3Za2rLJqrss4vkVsmJo5i5pRHurXYeNVgYIxOAmAP?=
	=?us-ascii?Q?pRRiNh7YIYOzr31qL8ApYbVpM8C2zTK5XgevMJxwLG1BMk/yQs3je4MJ6px9?=
	=?us-ascii?Q?dmD0qohjCB9UezAzs33vdAirnrhLxKfmTOxha7DN1sZ4y7bYtGiUMYn7m3Oc?=
	=?us-ascii?Q?8ZKdduu4nAkIUwmTONhLMom84/rEMAVx/yfgLd/8TccqK328yi0MYo8sbMKP?=
	=?us-ascii?Q?wUJ+hu485r5EAKbFI7Xfj8c4DHWpkggJsBHmeFNzs4lPAUAgnx/UNDfNAh2k?=
	=?us-ascii?Q?JFc6dJ2fH299I6TQy5RjR0QC2f95q10OzecGwQ4nF91c0g0xZa+TClqs5e1o?=
	=?us-ascii?Q?sldzfEbwl3RoMGOU28COcfvl5Qyo9QmCjcZFcQ/FWD+nKi3pLGJSiAM0/hEB?=
	=?us-ascii?Q?imjGUM9xkIrVHx1ZFZoJTBDp/hKMtyWsOkzOEBTW1+1VyRb9pWRx4icI74fk?=
	=?us-ascii?Q?NBDtE8N/9l7940/NFPPdmaFQZhO0t4zRuAUUpwwLO6b0UbHphY1xJnxi+N2M?=
	=?us-ascii?Q?kMUGeT59eZe9Z140=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:18ErFPwyKY9dSmHPhWLVYJmQVRxXeFsT3g5mq49c4+02XqJookBF3xULCQuyNbypc9Xju29I74AQC8hs1bGokw60x9jRxJvsyt1hygxkV+CO2jFE+cmgt5F8QrWUBVoP66RjPqYQi3NHAYNlGv5iow==;
	24:ha4FUTk+e3Cob4l6Bz0tulBJfOzZBA8tHU9Ypvu81AQjI3G5mDAJm7rnDVMfpLi3wxP6l34XD53ez2QjCIC0V7cp3wcXWAP9+KsQkKGCLcc=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:47.4481 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH 10/13] gstreamer1.0-plugins-bad: Fix frame rate info lost when fixate caps
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:30 -0000
Content-Type: text/plain

Frame rate info will be lost when fixate caps. It will
cause down stream element fail, such as avimux.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...ter-Lost-frame-rate-info-when-fixate-caps.patch | 51 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch
new file mode 100755
index 0000000..7313415
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch
@@ -0,0 +1,51 @@
+From 15fcb87bc9abd69377b38ef0f8b48b84a56909f4 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Mon, 8 Jun 2015 17:06:22 +0800
+Subject: [PATCH 06/10] glfilter: Lost frame rate info when fixate caps
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Lost frame rate info when fixate caps. It will cause
+down stream element fail, such avimux.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=750545]
+
+---
+ gst-libs/gst/gl/gstglfilter.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/gl/gstglfilter.c b/gst-libs/gst/gl/gstglfilter.c
+index 78bcbc9..65eba1e 100644
+--- a/gst-libs/gst/gl/gstglfilter.c
++++ b/gst-libs/gst/gl/gstglfilter.c
+@@ -258,7 +258,8 @@ gst_gl_filter_fixate_caps (GstBaseTransform * bt,
+     GstPadDirection direction, GstCaps * caps, GstCaps * othercaps)
+ {
+   GstStructure *ins, *outs;
+-  const GValue *from_par, *to_par;
++  const GValue *from_par, *to_par, *from_fps;
++  gint framerate_num, framerate_den;
+   GValue fpar = { 0, }, tpar = {
+   0,};
+ 
+@@ -271,6 +272,16 @@ gst_gl_filter_fixate_caps (GstBaseTransform * bt,
+   ins = gst_caps_get_structure (caps, 0);
+   outs = gst_caps_get_structure (othercaps, 0);
+ 
++  /* replace frame rate */
++  from_fps = gst_structure_get_value (ins, "framerate");
++  if (from_fps) {
++      gst_structure_set_value (outs, "framerate", from_fps);
++  } else {
++    if (gst_structure_get_fraction (ins, "framerate", &framerate_num, &framerate_den))
++      gst_structure_set (outs, "framerate", GST_TYPE_FRACTION, framerate_num, framerate_den,
++          NULL);
++  }
++
+   from_par = gst_structure_get_value (ins, "pixel-aspect-ratio");
+   to_par = gst_structure_get_value (outs, "pixel-aspect-ratio");
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 4628018..c434a08 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
             file://0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch \
             file://0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch \
+            file://0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


