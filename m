Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0145.outbound.protection.outlook.com [157.56.111.145])
	by mail.openembedded.org (Postfix) with ESMTP id C35EE767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:44 +0000 (UTC)
Received: from DM2PR03CA0045.namprd03.prod.outlook.com (10.141.96.44) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:43 +0000
Received: from BY2FFO11FD027.protection.gbl (2a01:111:f400:7c0c::196) by
	DM2PR03CA0045.outlook.office365.com (2a01:111:e400:2428::44) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:42 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD027.mail.protection.outlook.com (10.1.15.216) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:41 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQU000825;
	Sun, 9 Aug 2015 20:41:40 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:34 +0800
Message-ID: <1439178103-17813-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD027;
	1:tXtseZ3A1bmSAO8g5iMXQJ5IbMIUOmvpaZpyWBwTcr29TJ/JgNXdOvKZtHmTUhTlkqz3idJrBcCkBDDa0FfrzZTB41mR+dxlPkV9Mw1FOW/6NNIzmTM6Z58K1ayYwn27XsgXefxUGdDK54PBszMKanfPamo7khCV8fdVNMtMXO4zVT/8pIuCaVwU+ZR9S6rEdbhc2/KS3XuwquBVJSuz7vWypGG4u0WN6o7LEbZq05O5PbhvKRmalAXH9fSXIpzNf95yKVuZ24wIicbpyTmyrWm5RLDaHbKhGfbF/BIgozneFVNGJw4IajjS2udmsFxoff9X41z866gIOGvbk1QQMQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(77096005)(85426001)(4001540100001)(5001960100002)(50466002)(2351001)(107886002)(5001860100001)(5003940100001)(5001830100001)(36756003)(68736005)(110136002)(15975445007)(2950100001)(97736004)(81156007)(450100001)(105606002)(87936001)(6806004)(69596002)(62966003)(50226001)(77156002)(189998001)(106466001)(50986999)(19580405001)(76176999)(104016003)(48376002)(46102003)(86362001)(47776003)(229853001)(92566002)(230783001)(575784001)(33646002)(64706001)(19580395003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:yPFFFRuF8qxeFDZHn7b0RzT3BodmZh9g4J+BV24fy2448nvFvksDW/jjw11YDg3gWvz1//NzTo0WbQFd7pojyLfbFY3TQ/3FAjQd+8Yu2AJB1dkk8cdGi/uk9S14UNQAZcxaNr2I13Rcw6oDkGQn2YJT5DI3n1SugLK3ceqZxmY=;
	3:H/0NDcE4h2e68ndpampfmle03YBugJ3g7ZadBMjkViD+m9jxveigEMJHi+3/FDNllAUhDeY49u6JXgs9LyEvpfpZlfbIDgKL5AjJdZxRpVMhHyJ3p0B+ymr+ZSBLSlEpNamzzQ2fVN3lD8v2AkRRw0jhEdOXhSNqqWfSq3nwOlTP5FJwsb1049aFOWAHr8BORM+qG1t4svZ1nLoIUwodIqabilxEv3z17717Z6o8GBM=;
	25:lFwpbi9rUBaGLXoAAl+qhkrVnpKzOsU1F2dsA/TwqFPmqFP96/VL55HvLGDJDROFJA4ScDvxPoJwEEBq6mcwNHNtsApa0N9Z1iSp1W9evm9RzhePLcCUFxNl1vHNyfQHMcwgGojn4JO/3rnbGXecHmssaAO1dTzURJTwZ1CatBWbI1KAJ/BA14LfxhGQNStx4J0lZ62LRMLcPzfXqFK8etFg879cO2S3RCPgafKTFE4P1Vngv1ffSAvZmlOGhtZuT1L8jH0g5e7y6xaW4kMbmA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1174;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:9eXfBkshKanHJyqal49NCuTz5jyH2dmV9M4I7YXMII8yKogc2BwGisgSB16+ljSNwMce3+0yOFvn0BOw+jRfBeFdC8Tyf4hz7nLjNwfdohnayvV1rg1ue0Pf2/lnu1sisndu+rGsZuv3XXOAIOyP17aOzdNzpRXRFEYglBqvJ4pSB1YuS9lk3oZta6IavRagJTVo9JrvGJrGPyylpNLzptbzw8GOZXPBF1utgrxzH7LLfUjCl8vfNUic6BPkkmwqogiKp5ekP4NSqTYe6QFzgDnSrAmfleKFXVzic0zFWdSqjLas+T7805rWL/bzNanYUNWfbH3p87vMCiawvIhKqlZrc3a+Tsb+Saa+0gnBrIo=;
	4:sfrOkWixmFYhal/Ia4Zau3uGflwv73K7skrQ5BuD4crhsJchZEX8ebkJ1sImmqqjDSIr76Cf58WoQ+P0eZ42FFmsUO9ggD4vATWGbEtLtIdygSTBGXCV4qBjAleyrVXctabhTjoUQjtBOmSjZVpZs4HsPLq4QtvW8GHZR9Bw+i3BiaOUM395MMUAVeWGRB0i8MY6E4BXWtZGGL7iOx2YZRRkObjpiorjbGobPcP3aQLP59V5oAq8jSaKmyHodHtXra3ZOuPNxKQrGM8o+FmjP4hjb9/6ymEA7EfgoRDMlPE=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11748F653DA4D26927D4F3FE86700@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1174; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1174; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:ptyDx9ixSj9j3ncPRLIlKwjkdPmvI+CtzTTQ7aI?=
	=?us-ascii?Q?7baNmS94y/O8j2bB8e6rDD10HX8PDgu77EnV/D0JBKBeKR2QFXp+/5HqQyaT?=
	=?us-ascii?Q?95UQtjfUF9lUh7gktE/9X39hZBXu45oZNzlQZTSEKz8Mhh3RgFMMegv0KMIv?=
	=?us-ascii?Q?ZJ38uh9ghkillyxd9SsAvENbDqsukDf6nget+b4xmSpZiSEiQYzdj2k+SiW7?=
	=?us-ascii?Q?bPGKlaZfmx+su8WTHAjyg1p3mwlIds5ejDqcAYDGL/MhHmd4gwBY8TMhTNlW?=
	=?us-ascii?Q?jkoOMQ5CCWZJ2YaJfMxCB63+KO4dhxux2AV6dJa4VaZ8xLoIBE9lmWVychYN?=
	=?us-ascii?Q?pFBEDmkYq4Qn8WmVg8pE3XYHC243WsBiK/2LwCJQ6ALtS2bupPa1Seb9aSRL?=
	=?us-ascii?Q?UvmMtuZCZzQ64e5X9mOOPyQfjuzFguH/frXfAfw2KfZAnO52FhAfMM1w3M51?=
	=?us-ascii?Q?QlxNA+qI7FFF3ImHf2p9tBh1SnX2GnZ0fx4pojhdTd0V2orqEJ9bLwmnkNwL?=
	=?us-ascii?Q?Uq5M+mKQ1U9PqEqLCySZIoesn6t5ksykoGMDH7F6bgq8Y2wlUfXGINXj7h5f?=
	=?us-ascii?Q?Ts866KhG6+NuQ7KbRKps4PuhsnVPgDhncgQHEEh66v/6+NqLe3F78Wz57CC7?=
	=?us-ascii?Q?MrJg4xLW9YVQy31qJbdxg6TDSEBRfPXoab/t6Q07w0X9do0bkmZhPIlqSxLV?=
	=?us-ascii?Q?K3tiC5dQtkWYnniqqM6gzpnd/N62c2qCdX0RtGxFUjr0v0bz3AqFHCUJo9AC?=
	=?us-ascii?Q?79NAO3Jf56eeVo0sUVlpcVFKI7rdZ6P4cnxxwlKUqmuMx6qh1ULdRrmVfvdC?=
	=?us-ascii?Q?AIdTbBZjjcY9AERUZajEfiZL/UsU+NnVElVTaGVDRBx/WaTwJOKVzPgMQZBx?=
	=?us-ascii?Q?boO+LJU149cOem+FTjI42EthtEUuSY6OqeMbWTGXyMY7Np3tl/4chPFkEXkr?=
	=?us-ascii?Q?EJDZ9xSef0hH77yMsCAMK5zXvXvO+awz2dAi0POc+LKQNUTxWkRlB0OZLX4a?=
	=?us-ascii?Q?LO/liaksecgYzPA0ROpS0Rry+plYIrTLB+0MIJi4Mu87B5lvCiiWuIS+8QME?=
	=?us-ascii?Q?wluBA8Ckz7NoaqmgDR7tTwPQ5oK6Od1ZpMk1994ML3yQ78D0C6VfmYmzlfTs?=
	=?us-ascii?Q?7PeGvu15oaWucu4aAa6ep1SonruJr4rDtCSiYZjiFTb8pnavzWOz2gAFnIfP?=
	=?us-ascii?Q?7Pc4/ZFnXqsjFqp4kwDtXkoxI2jgV6IMPKwd5JRXrgGw5TXvhL1Q//ccdIC6?=
	=?us-ascii?Q?AF7YZqAdgKo81pjZ37CsUGLN+VE2uDDh3FYtco9dL?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:ZbLqWP90SuC4fiNTQiDA6bpwM8L7F0HbqBQpVvYrFCKgcPQhQ2JpUzGP7qFo7HK1L9bJ38/RqJNmZklb12Gi1wbuOLbVKhobhSUdgyPWlCis92W2m7kH1F3FiLgTmKofQ8Km5BeFrsfUZZWobLVptw==;
	24:C5zY/wt4tJ5GdmFIBXlOINFC5NhpMQTCOTHG4nk9z/KeZjDA1yldqRDQoU8A5ON8ICX9ynf97wTBYR8gdVcANd7LuKouEZ5kAeUgQZREFUQ=;
	20:/Fo/+fd4Umump0ndE5zPujGg162whawa0hhJ9MdrskmGqLJEkppeWZKUuav0iGo7QYatv2neRojEg2INtblDfQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:41.9400 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky][PATCH v8 02/11] gstreamer1.0-plugins-base: Handle audio/video decoder error
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:47 -0000
Content-Type: text/plain

When there is input data and no output data to the end of the stream, it will
send GST_ELEMENT_ERROR and quit from playing.
The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
information instead.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../handle-audio-video-decoder-error.patch         | 64 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
new file mode 100755
index 0000000..833ce72
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
@@ -0,0 +1,64 @@
+From bcb2b8b6f49e7c66124a4f5e07dea829d5ebfe59 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Mon, 15 Dec 2014 16:52:07 +0800
+Subject: [PATCH] handle audio/video decoder error
+
+When there is input data and no output data to the end of the stream, it will
+send GST_ELEMENT_ERROR, So the clips playing will quit.
+However, if only one of the tracks is corrupt, there is no need to quit other
+tracks playing.
+
+The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
+information instead.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=741542]
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c |    5 +++--
+ gst-libs/gst/video/gstvideodecoder.c |    5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+ mode change 100644 => 100755 gst-libs/gst/audio/gstaudiodecoder.c
+ mode change 100644 => 100755 gst-libs/gst/video/gstvideodecoder.c
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+old mode 100644
+new mode 100755
+index c2e7a28..891df0a
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2123,9 +2123,10 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
+       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
+ 
+       if (dec->priv->ctx.had_input_data && !dec->priv->ctx.had_output_data) {
+-        GST_ELEMENT_ERROR (dec, STREAM, DECODE,
++        /* GST_ELEMENT_ERROR (dec, STREAM, DECODE,
+             ("No valid frames decoded before end of stream"),
+-            ("no valid frames found"));
++            ("no valid frames found")); */
++        GST_ERROR_OBJECT(dec, "No valid frames decoded before end of stream");
+       }
+ 
+       /* send taglist if no valid frame is decoded util EOS */
+diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
+old mode 100644
+new mode 100755
+index ac581e1..4278bcd
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1068,9 +1068,10 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
+ 
+       /* Error out even if EOS was ok when we had input, but no output */
+       if (ret && priv->had_input_data && !priv->had_output_data) {
+-        GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
++        /* GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
+             ("No valid frames decoded before end of stream"),
+-            ("no valid frames found"));
++            ("no valid frames found")); */
++        GST_ERROR_OBJECT(decoder, "No valid frames decoded before end of stream");
+       }
+ 
+       /* Forward EOS immediately. This is required because no
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index aaa1ecb..aa90179 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
+            file://handle-audio-video-decoder-error.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


