Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0145.outbound.protection.outlook.com [157.56.111.145])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC6965CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:54 +0000 (UTC)
Received: from BY2PR03CA009.namprd03.prod.outlook.com (10.255.93.26) by
	BY1PR0301MB1173.namprd03.prod.outlook.com (10.160.195.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Mon, 18 Jan 2016 09:35:38 +0000
Received: from BN1BFFO11FD056.protection.gbl (10.255.93.4) by
	BY2PR03CA009.outlook.office365.com (10.255.93.26) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:37 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD056.mail.protection.outlook.com (10.58.145.11) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:36 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROY015522; Mon, 18 Jan 2016 02:35:34 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:52 +0800
Message-ID: <1453109582-25485-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD056;
	1:r/Wf8RNZq9cylsjCcEiPr4RW/4guEp9jXQOQjzMzfV8YM5/IKuZK/OT6nyZ2WI2wvhOTb1zyzwFifu2qkRmjcI+gmz310d9KtmBKcJjJ+YZYUmggmTL3vMPVGHTzwB9WG3Yvgj5ZRkRulvQ73sjn7Oe+/f4GorYp1mWE4MlqTmWZH8ogyGDlf6f2tRmYke+qdBJa9yikurskzOUOkAmyZtw3psvJCo7q3mNsrckRNdF3OF0PbgN1oNNyGR82qx3mT1HyVs7GPOc82uZeTAXuDUbTrDIaCksekYpzaC+wd95wU2kOhD3ccKrCVDviwo6W2NePrJZckOYl6MSkfgWVHwvpWMSkGJUSL7TtCon9mn3yDAxYMXYE+Y+AmtQ5TI5xhZvKTENtVZ7LN2f3YZH2pxQkMw4A6QFsnJcWVt8rf90=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(85326001)(19580405001)(97736004)(50226001)(229853001)(2950100001)(106466001)(48376002)(77096005)(2351001)(107886002)(76176999)(15975445007)(50466002)(110136002)(189998001)(36756003)(230783001)(5001960100002)(33646002)(450100001)(586003)(47776003)(1096002)(92566002)(1220700001)(5003940100001)(81156007)(4326007)(2906002)(50986999)(6806005)(4001430100002)(87936001)(104016004)(86362001)(5008740100001)(19580395003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1173;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	2:CzUGm2ZicQOVzcaGFYWKGIfw97avK/3L/H8faa6MiHCkSN6wEzG4BrxkAE3OKNv/jv9UihVXfk9mKTQ5JUFeEMogsdoIupzf3xq8s+uZUvVNsfnpcb75Ts0i3Wi/eRKzhdmrkcxy1PJ8pwfTYWDlEw==;
	3:gmXiqpkTmgv7q7E9ZfiyI1wZliBG54YFL+wKj0dzIch9HqKwKPGzJDkbyiF6ghVDWAtZyfH5WHdEJEqVwlvO+1Lg0WTbJZ9Vz3syVmyGJgXK8b0to06lIYGHwMHptKfeyGiIOQENqZGUsIrTVrJwjEcENgkbo33/ofKGeH1c7cJrqFwCqSxfCB+nX4/9gT6kq/ID/5lXrxfiC/2/VPV6yz6KPkYMADF+/yFDFoUSs2I=;
	25:Vi/T6KcVfbO42osRJOc4W/oBOEPVu3DYi2RTUG32zcl6gKPLRa24YI50SrqI9jd6Y9bCNK1SqTteyE7aYkIBvquOAjS+iNxEFQKIwMKTUGsvH0GLa7FCzVgKWseTIMjMSlpNAN/EWAEHxUNxZTuQW7ec89EjRVc/tPwQXHkYDKxn1uVP02XTpmMN/zFpQs5nwX5LMVc1czP8XB6lRegjEzPmPilAjUtjknU+PeAEqX1rKJ0bT5MBdBDK96VGjg3Q
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1173;
X-MS-Office365-Filtering-Correlation-Id: 0a2d2382-b178-4856-586c-08d31feab8a0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	20:yAS+DcJI0yMFnic9XJPZv6N/5+2MnqurrKGx1XiMkvFor8cBI4qrA1/zHCel4lRu+OrwB7Sm7e6Z6778u+YrPdM7NcskNK85JTrzDegyUwnx7R0G/jKwB8HcTzbM+oSTHU7kdtkGvE4afVeuPXFSR60waUKCwhCTRKQPdB5uIswKjyr32ylyIr8WWqoOR6zwRILAPsVRxyJtq7e1PTysq1JXP3z06Rk3X3c6oB3VYEvjGzp5vuEnft3rSG4ciasEn+NurNKShRGKGu+kJNKj8urmaS1QPkohKNmH4cS16MEtlcaCciQ9jE8USgLmBzDsmZKMgo1+xXJ/aQm1sdgGbGvHZTKAF5OKx/+QxA5zx073Tvn89dcXx0RxVt+yTemSE3CSmLhJRLh/TC3LTu7rJfHp6kfHQEXgq9OSADgeErxmNn2TjbS3CpVbd0gQV/rW;
	4:OEYmvmtdTgap5Hyk3UkinxRi+iuz7ytWuQMDHuMC5Qz97BTg3YM6HgMg+z6rQ2x4Spb/tUhQ71I0eq5AY+2Lo0hDBVofZ7/gZh3kkTtD+HUmSM89K9b8/bKVptxajKQ227QGKKPodTWCpa1g3NyUyFebPkKykg7wWyt+pzAwM1H3FZkz2jen8I4ZgdXMeCuHtZzcmTtMyVKfedMBwy1+3K7Sji5k88XLHb9XLBuZCV0Rqwjckn/u/BJDRYokJZpDdG3n26JrQkGlc+akqSCfTskABTn9DTk49TR+aICxNbynnyb9RjyJDcMEB8Zs0WsxGL6oOCMuqPVq2XCnKNJPrUQYhUvz6uX8RXgWxwIVPInYOJw0a2FFnI0qXxf0G9y+5nlwI0PdJ3ZvU0JatpKknISX3+g05bLFmLceh2lOgN3a5sfK7RyRUU/uKPHp4V/Q3eWIeMpQ+7AV4P5/hoEkfFN7ias9iz5Jjuv2/hPE+AtdQm/aTvlnCaC4V8ZyR8sp
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11731572B5C650F1C85582DA86C00@BY1PR0301MB1173.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:BY1PR0301MB1173; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1173; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1173;
	23:z5xVlXwCbqTDjd2+d7isCehmJZpJ9qRSObat+cj?=
	=?us-ascii?Q?4/yqyRDLzlcdXJSyiMM7wYJcJ4KRz3LZ6ptF7lWwI3Fz+v9mWpZMLyv4+FbH?=
	=?us-ascii?Q?LSwXtl6wyFtozXWG3MvhBAvYAGGLkxbirQVOHsMzmAFI8TFK71JoRaHTsb1q?=
	=?us-ascii?Q?9THtJ/yreEasEToO5Wr7nT1n6LDNDUDr7TK06rYws6Nx4+QxsVRAYtHLLcDN?=
	=?us-ascii?Q?FJLF/onDP9hMnrBVjfZmycbUuDFa1e+n+CiJCQJNHLt7olOV7//Wem+DJlXN?=
	=?us-ascii?Q?lIFyYQNKCaoIBiamT9YNw3c9u7CoMT9hRhKSvzWJCjayR4OxX5llJdkAVej4?=
	=?us-ascii?Q?Vep5I2E4TIjuYJvBMzOVM39Wfk5a6oaUS7EXeShC6Rp5tAo2BTEOaStAH0oq?=
	=?us-ascii?Q?VLC1jlD214ZBfNM/nqo8BT7iCOAU427goAG/A/iI+Tw3TF6nDuypnNZxS9WE?=
	=?us-ascii?Q?qVC+oLafMqxMxraKmg3JjkxozFeS/uzcwYwAmC1gav0B3iVMcvexE5bzrbeb?=
	=?us-ascii?Q?AzqPZMNMtgzmTOZDMNsiUvMAxmvpaC2Ek/5QdGPUnBeijd3+P/AInYYtfPqY?=
	=?us-ascii?Q?YYgv5KbYOXJ02C/AKvIUIQhlIU3Cw6bNJfl5bQYyXzHTsDzgVUQFmI8jG1WY?=
	=?us-ascii?Q?QbH9BV5SAuaKy1HNGxk0gkWjdvYkl4zotaqM8QYgC+GjfgGD9Duqfelj7ENk?=
	=?us-ascii?Q?anHhY0jdwj/jzx6k9/BFgZoOnKnoEPLxCdmOuBjGB25dHWp8HWeYiiGbjxXn?=
	=?us-ascii?Q?XL6Xd3V+PU/AbWqcIaRr6avaJobwZJx2Dl3WT+ONwDNu/5G3ERQ2Sk3SDhYz?=
	=?us-ascii?Q?PrfK5mKbvDH3wOWiyMnLnw6Erh4YB0UStyzgvRlBmaEyh60B8Vt0ARoats42?=
	=?us-ascii?Q?3l2E+FncL/HfkHbzGgcumceuNCyt4PwBJCQBwFlUqgwEzz0cr26utAIrvEXt?=
	=?us-ascii?Q?rfrbSMLgPbrptCCZVAj+RpQw37ETapylP+pU0iYhvlzviKzoKsln4pnhcwDT?=
	=?us-ascii?Q?7TsWbbaOJzLK9uREISM1MQ/CtMH4PGQslArN8kjCwsZ8DQhrCbRFEXnshKoG?=
	=?us-ascii?Q?bNPmNa1+w5/BwrPqZdmjJizQ7Hpj+r/7L7LPBYFUTdpoH6CG8gLFuNNVpvVG?=
	=?us-ascii?Q?c4jVB3eEWoRuPv9+bFpGTOxSAOF10XFql?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	5:frWZ7VZeg+BUKDqwwM+3y9aPOqRs4o9m2axNYVFEy2Yj8P09NCDbzARniP3OfXcZpkDyP+oy3hOSIPnlhRMubdOIVFLugtFM7r+HYS0nQcGeoQfHiFGJ6vMeYOAQQgDCHlpUnWrJrjIuZpCJGo8ItA==;
	24:AURfpgPp9lhH/VrgJYPC4LsYYvAHo2zwXLJiWUwBg/AFNkWDzlG0GHS0M+itd9Lwm6YKo2vqj11yelWr4ZzpU41+rZ7hSyS8ZYC0jW5T8Zo=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:36.1272 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1173
Subject: [poky][PATCH 03/13] gstreamer1.0-plugins-base: Fix audio/video decoder error
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:55 -0000
Content-Type: text/plain

When there is input data and no output data to the end of the stream, it will
send GST_ELEMENT_ERROR, So the clips playing will quit.
However, if only one of the tracks is corrupt, there is no need to quit other
tracks playing.

The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
information instead.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../0006-handle-audio-video-decoder-error.patch    | 66 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-handle-audio-video-decoder-error.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-handle-audio-video-decoder-error.patch
new file mode 100755
index 0000000..2b714e4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-handle-audio-video-decoder-error.patch
@@ -0,0 +1,66 @@
+From 9e2b1ea55e1676649f4130bd15c2cfcceb7bfed0 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Mon, 15 Dec 2014 16:52:07 +0800
+Subject: [PATCH 9/9] handle audio/video decoder error
+
+When there is input data and no output data to the end of the stream, it will
+send GST_ELEMENT_ERROR, So the clips playing will quit.
+However, if only one of the tracks is corrupt, there is no need to quit other
+tracks playing.
+
+The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
+information instead.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741542
+
+Upstream-Status: Pending
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c | 5 +++--
+ gst-libs/gst/video/gstvideodecoder.c | 5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+ mode change 100644 => 100755 gst-libs/gst/audio/gstaudiodecoder.c
+ mode change 100644 => 100755 gst-libs/gst/video/gstvideodecoder.c
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+old mode 100644
+new mode 100755
+index b68f9eb..506c13d
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2304,9 +2304,10 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
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
+index 514c06f..fa29083
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1251,9 +1251,10 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
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
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 3139148..014f081 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
             file://0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
+            file://0006-handle-audio-video-decoder-error.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1


