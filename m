Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0132.outbound.protection.outlook.com [207.46.100.132])
	by mail.openembedded.org (Postfix) with ESMTP id C06DF73D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:26:05 +0000 (UTC)
Received: from CH1PR03CA004.namprd03.prod.outlook.com (10.255.156.149) by
	DM2PR0301MB1184.namprd03.prod.outlook.com (10.160.217.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 10:26:04 +0000
Received: from BN1AFFO11FD033.protection.gbl (10.255.156.132) by
	CH1PR03CA004.outlook.office365.com (10.255.156.149) with Microsoft SMTP
	Server (TLS) id 15.1.201.16 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:03 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD033.mail.protection.outlook.com (10.58.52.246) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:03 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TAPtZM004765; Wed, 29 Jul 2015 03:26:01 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 02:25:36 +0800
Message-ID: <1438194339-13618-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438194339-13618-1-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD033;
	1:33T+u7xOpr3b4yG5ni22afE0SBKle7FrXixsjBSyC/ERVtP0uigY0Bm+RR/yGA+3+URsPZgj9ED+60qTdQewPdCr56whJbsWHd+q7w2PlcLJgdGpoY8NuNUakQO3tF51xb3cvmVJOIZgF7YddwaGdpYj4E1uXDj1eH010Z7dUYlm4el+jmCjkaolAjfBmPd2zSyQb7kkqhM3rCCJLNs0M4KqNH4LWDr6Fh0oaGopF5ebVEs6SAgqAIiKdX/J0WpkQZR5XNA74TLx32vOxaavY+Q7/OLI3He+TQUvJD8sn6rnmOePDbyAiCisZIwDDWdjonFsTkp4cRiR3nLi5brL1Q==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(19580395003)(47776003)(110136002)(36756003)(189998001)(5001960100002)(46102003)(92566002)(230783001)(15975445007)(19580405001)(104016003)(50226001)(575784001)(105606002)(107886002)(76176999)(48376002)(229853001)(2950100001)(2351001)(77156002)(77096005)(33646002)(86362001)(62966003)(6806004)(87936001)(85426001)(50986999)(50466002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1184;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	2:bYlIDJb4xh4I6OPVSuPAeLiWb17n9rAUQXAbqrbsR14SAVk09VxBrm606rc/AhnW0RKPCq2Mi3/OVeCK4jCWmPXGlhSKCA1TL1KV5WtjPCw+r8dkd8FE93sxhnfFmriI7wq7oohet1sJpSrWrnCE4c2D7tWK2tMPH2uMzV/+1Oo=;
	3:TPHxygRyO658dzZslDexzV8+2CPFbwOgAL6xryXJRND3K21bv5KmpAgQVxzaCPWTk4MduvkXrQSehVlCo+zB0X4W2+8gPn5IrHUCFjIalHh1YzH8Jz9PKpi1cwVw9hL+jPNm/shIQHFAciESHDlDnfK/gb6LJJuF0Jglgs6C0Tb+5Rwz1D2Xg539sbS9OzhWFpp7Z4o04XJGNJ1bTxAGh6K7gZHKFrJcTRuMg/hU7RU=;
	25:SlgPq7aJRVzHeI888746RZ/R7F7k1TbhftjUzzXYGjlEKVRBREKU5j08o1YhKDViLLVPwbnjzReH3JMkh/TAL+Qs30RUoJg/th14dyxarTlORvMiR3hS/c2DqrSGjVfQLY11ZbBdBI8CfgPwrAdpYzYaDpexRs7HARoJZ1frdu/8y6DpXICBRZ8bhY8KXXPWA0NTxFOZji8FH/JCfU7vresIxxV2lmasB7H2xOHnBA9TqWorVYGMzBdxiQtJzZrWS2UHp3PeNmlsz+DJBrPmww==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1184;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	20:/Occd6uGUTe6TYfhg5rHBfJCEHM4lVjDY0YIH9MSUGEBmRKmy8Jz8eqIzFwhy3FREZHfgQlZgSvsWsO+kYb1ZajP0X07yKVRi5SFV4ZJfcfSNJ8EiW7iKHprAY6V9XxIi4YRtgVJDofolJAowu01NaK6DFWVyixcyT0yUx24Ds1F7Wr7TCdE0dvrbEUWNanKsxE94AVBvXG4EC2E8ZJvSdQmtM4qBUyuop0Jw4t+YIloE4H1nusuqdOpMknkY0xO2T9mNsGDdyDJ9WGdUHiXjJ9C+Ab+zMMjhGSxa8fEuQJ5QvkC8Ehkpaia23aDgzFQMGsSl1+8ExLq8Amxg6DOG4AtyJ4VYr1i0MQnmw9tiqI=;
	4:9yZRgElqYXcq6LyizdFd+1PwF7wlbq1ky7sUucV6MTeEOzHou+RxI7YrNuh8LKWBs7CM1WbQBJX/a5cLNdt5HAPV1gZX9Rm6V6V5UKjHfgetbI8OvCP11Xy5ysgFqtVbB/Nm/KFIu2QyTPRYNVdIVi25wZccx5oebQVsgzlVXcjcuKvvQVnk3AomZsgH3ZwCVSoEdE/ZYwazEeNUmlU2Wg1hoNo9LrTGKR81VPg5nBOELSbXIPQKTNpWAI/W63H7AzTMQtxxnk6eztCA17bNXg3qHO466JsxNhe8Sd8hv1s=
DM2PR0301MB1184: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11845E012641F6A4CA6ED858868C0@DM2PR0301MB1184.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1184; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1184; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1184;
	23:7kcssm/fRe+/BoqGAe1ITPIHZch+F+e9v1NEXqT?=
	=?us-ascii?Q?0J+jHVv0Xi+K2Mdg2pC1U0pI0zYXI2ywBk9FZijyvt7DDZh9HgqNjS3ct7+o?=
	=?us-ascii?Q?Ehw6VkSsXEodkbBDANXv/zXTe1o2ss06cLZG5Qy3sTDG6mHzMH0H1ZOlKvlf?=
	=?us-ascii?Q?2OeH3uUg3IUxUt+4OTvdVOkoU9yp0fm9TxNdW7iWeihXFr/xV4/F3ee+m/t2?=
	=?us-ascii?Q?AnCBqoU/2b+SmWhxuj6dskX63ZH+1Xn1t+BgRFWn1TgeOSqF3fH00tbVv87a?=
	=?us-ascii?Q?SNUjuqvDGHO1axrktNf2rBahUx3cGoPi788kIGP2hioU2RMr6hUx1FOawuls?=
	=?us-ascii?Q?2+dAAgWrFnLQ5w6jpPWTR/uSnt5WZpgmbny8b2oV7ote0/gCcGdid4SasUHf?=
	=?us-ascii?Q?acSWCdLEV8Ppz9bzhYKc1nM9p4hJqIiLBTRYfRe0J7c5SaJtGkIw3UYPmb3+?=
	=?us-ascii?Q?qhooJlQn0LfGVCxLjw1eDD6QClZDM8IhstplxS0u2J5RMVxwHNpQMLhPpwn3?=
	=?us-ascii?Q?YfaR0SU3kByt1m/Flu7QaEA+ydrnr158Ii1y7tqeVwGLsc+2P3na7mrCwD6+?=
	=?us-ascii?Q?lrBNRPOtqnjDfHIXGC+plaROGIxNWxpKwEyTRBMrP8ru6xcyFaFYwF+YG8Oa?=
	=?us-ascii?Q?veR4EoBTHlH/IVdYkmAg8Vx4my8K6Lks7MAJu4BCqAt3Nf9zldQS1Xcd3/4D?=
	=?us-ascii?Q?CpQsMpd7TwsarFd6poPteQrDbqKY8N1P7IM/hxk5seSR1m/iTb82iUThFr4G?=
	=?us-ascii?Q?orDrM4cj2s1Z42cWHW76HSIlJN8Z35ZaSQpFp4vAQeMGArWdLh8cGCEDQAo1?=
	=?us-ascii?Q?R1LvRkzeYz52UFNf7qscx5rIDYUR6iaMROXc2tpO7hoRfd6NvapJt1KfroxO?=
	=?us-ascii?Q?gjsDvt/hdq32+L/SYyBSPDiQo/i4jgvB5FgHiyIqlaeHfqoYG+BkZ+22Of+b?=
	=?us-ascii?Q?cyCUJZ7/w1r/kLWNhITmdAoyTMAt5aiBtmItme4RKMY5ZLtntCHo9rrqeJjO?=
	=?us-ascii?Q?oLXM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	5:ljJIrlHWOYK5xkVMrm0fZ0NM1BX1eavMj0Zsiu8Nl4B5uZ6JQgVSnJWDJvW0yM+3HQXJBCWt3hFuKZhQaya8PJMu6bOFCaKn/3msrFlqkF1xttZSkTrXWtLHHTSWX25UKotod7vrIQUTxoXN3KbpuQ==;
	24:bXMRltyK5cMcn7lxheMcW4N50wMuEux6MXzblNCl5QwoU/5pJqCWv1L+1BnzZkf1L+DHFeb6iqvvS+U4o0oiOHLVt6VuPY958knbSlj7V98=;
	20:KPTiORSxsDHTM/8rJIUqHhZG8eXTVIz9wLPpz/5VJPIj6g+0T4cXs6E5teJKOz/J+3vQqt4eEk2b7UtKXcM87g==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 10:26:03.5098 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1184
Subject: [poky][PATCH v4 2/5] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Wed, 29 Jul 2015 10:26:06 -0000
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


