Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0144.outbound.protection.outlook.com [157.56.111.144])
	by mail.openembedded.org (Postfix) with ESMTP id 20F1773D26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:42:44 +0000 (UTC)
Received: from DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) by
	DM2PR0301MB0654.namprd03.prod.outlook.com (10.160.96.16) with Microsoft
	SMTP Server (TLS) id 15.1.219.17; Mon, 27 Jul 2015 03:27:18 +0000
Received: from BN3PR0301CA0029.namprd03.prod.outlook.com (10.160.180.167) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:27:17 +0000
Received: from BL2FFO11FD039.protection.gbl (2a01:111:f400:7c09::179) by
	BN3PR0301CA0029.outlook.office365.com (2a01:111:e400:4000::39) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD039.mail.protection.outlook.com (10.173.161.135) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:16 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qg011344; Sun, 26 Jul 2015 20:27:14 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:43 +0800
Message-ID: <1437996407-29463-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD039;
	1:DNWrsdq3qwETYMXDQtcsYA79b6VTwNRypX5L0VgBe5oG0kSKGEP+RyT2c8pY7PoaxJVwgAeESV9aKSqAlve8olu1VbuVTBgiDNt6Y+vO8pmeDyr9X1Egm9jj7l00HEs2UMadVBmWMW7UdmBfr/pOXPRwGPccuaT4GVRa4Qrd+2hqspQo7/Wj6t8DvRWe0HaeclU95hpwgPxq3okNVapuEc9/YK9F2swuWxdOcAoGxj4dLlmO111ZPQA19ypdBjHpeDur5BO6Ib1ORlrUyOERDYZkNd+oQimsucjdO20M4MvR1TLxjZPPGuk51OkWUfWZ0wAJIYN+Zua5U0gw75zDuQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(229853001)(50226001)(189998001)(2351001)(33646002)(19580395003)(50466002)(6806004)(19580405001)(104016003)(105606002)(77096005)(76176999)(5001960100002)(110136002)(5001920100001)(77156002)(62966003)(48376002)(575784001)(86362001)(107886002)(50986999)(87936001)(15975445007)(92566002)(47776003)(85426001)(36756003)(230783001)(2950100001)(46102003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:UsPDTsZBWU5PbmP5qQMUul9RufIqPl7HZPsgrsfafjdsl6mTyMCrtxb0J2phpLcz2Mn/BaZMuGOYcKd3rhrRYrtlI7J8wT0H9s+65XdeI1/jXjzsjICYAPko9iUPhmpmgHBkKg5yB5vPJ5i8B74z7s0y7uxhd72It0inIK4Rrio=;
	3:z17Q2nBDAr5asoVZtFFXbSKirybDbAOGMov+bzbUIDjZKJyBS/4NuVVmib3IxPrUA6y5hN7aDWR7J9UGi/8aFV9W+NyOzsdS9NmrZmFnGkvHnn1PzApnFgc3kpvvloddjIMXF5PkQLyTH0rWxrTs3Rnk2u7kHplgzGlxvxDifvMHpAiCChOP8pZ56KvnWcr2Q/Zwz9FUhle9MwfzyxyPNIs3JNnpKqhIENTQhAfetmk=;
	25:NsgNvegjQ0nHxW/Qlf0eB8oetVwm/gqarzoL2BPXp4iWTaihPcssrQkAJn899eoYvyZRsadt2Nib1ttgCnAkH/ZRXoU05s3jFoNy7aIjUDalAW4tqKs/xi2tv1iLdmoxfBiCjA3a7O63C3wR3pEohn00rSVu9Mcs7mLaEQLMj26T08iOFXT+LeWfWphFLYp7jGRF8S7pp/jYpVOFIsQ4OwkI4fcgEJQQXSeI5jd+Bb/fVeADBm0ByzHz+Xd7sZ2XaSfmtjTfSullVarVhMFFUw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1181;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0654; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:DJWc0AJ3AhD9fej5UMNVgHgstn/gKOOVKRRMCgog+BYukymueopFVccKkxIJ966I9fUwNWNFlxzy5QJLtVOvk0n31ARs77TteFm7rk5onX+dbIWjC8TWbariMJzpvI18anAx7UTzLJiu39/DzvLAFFDF1L0U2+QyJNjhBmXVKdhX9X/i1eHFJ3l5sRqa5HUGH/pvWObCni1bvIocZhbQhWRAIL0UU0kp565fTKY4/FjdewO70dhMEQ9nqqcBt5LFTi9mY/ZnQgJ5HjJL+9URi5rOABnO8M7F9JAWPFSHKDIgqwm0EZ0mg+UWhZ2XHhuwKiovRybT5BjD+Tes9PYiSwYYXp6ZBNBn+1LxVa3ZB7M=;
	4:8mPF3S7YLl1wrCKO0p9YFhLIy5vZLjD93GnmExu7vQeIqFjkJT6ndmWLQCddXFrwUcFlDl/j6N0c0SydNfdNe1bIWkdaDU2CJR5d0nwjF3Kukm5jNCabS0+IGLcbFWhHY+PnSXWhgwlZM2MsR7OwhrBfJbVh97t3Z4Bc+QZVOSaYwTIWUzxPjcsO4AyMjabYbCFWC9ZaXXBjl+TNizJRG7/eAoG/eQYWJNku1HjSu9gGry2rybKAzNXlrPkfIEcPLmdBB81caEX9spdt+0mD2iqRzaQY8fAUtp4M4hRSAjY=
DM2PR0301MB1181: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB118180672A7E686EEC632EEB868E0@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1181; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:2bXKrhiZOE+goVmfeiRyAIcCBT3K+0RqgBzzjdu?=
	=?us-ascii?Q?/Jt3C/9zlLvQIIjIMwrU+/HpDl3yhp11umfRIfxNIjIq1LOV271lroYWyOZg?=
	=?us-ascii?Q?ezCMtGvmyBUvEZW1hOi4+92lv+RLrQbh/jgs/qnwr4I14HHytf0IM+VuYppG?=
	=?us-ascii?Q?H8c1d9K2hNyyygmm5DrIU2e5A48SylEjShwCKwU28e8BLdq24yP2zNQ3hbtX?=
	=?us-ascii?Q?jGwGL2WU+58ZSLuDwqu7JnWlE3pmX1ZtS4vx13SkleHXdHUCPk6AXGmq/Sa9?=
	=?us-ascii?Q?9Rt+Sj1Bx9VELetVrb6P9GI/1jYPE0uKzb0NHvrp4RcpfF0eJu4FOZcqetk6?=
	=?us-ascii?Q?V7AlUnUYiTqwns0AxW9NDKhNVXVKfl5XVkIHmMTyeI9GYFrwfma3JcSBmuyX?=
	=?us-ascii?Q?j6Il7HnU/5RkvQ21pMHXnrUDRx0wOAxZmTAw7rtRdBthpQ1U4gktw5WK7N2e?=
	=?us-ascii?Q?g7DGZDwhrx5V2Xib2QnX3LvKi01uMvrKeJVGPesWWls4X11KZBFyU6snvbUg?=
	=?us-ascii?Q?U55g4eU/rBsTdVoMsli1US3Yke199ybageiRTia9OKDjnU0jxD6q8eEOyJyC?=
	=?us-ascii?Q?chq44D7lxDznTl4I1CbDAFDVJW3YxVPgLD40rmE5YROrrha7C7GDW3dk3iFs?=
	=?us-ascii?Q?cOK0GOAH37LofmTfj6QPo1OwoLulEqY0LVNhjqIXBhQBP4VnQ/yHe9oINEqW?=
	=?us-ascii?Q?cIFiXxO+/SeH0RAJ/L4p1yJBKF+/EfgZU4GNV757LcU8pRUgrWNKNYSj0OYp?=
	=?us-ascii?Q?RMTWnI4X8zP6a9a1uLlUxhF/nuGMBdOuVdjmjfCenkEMs+QQcOmQx9DHFUiu?=
	=?us-ascii?Q?QAW7fWCe+mcDOwsGcJiH62P82u+obB08yF6QMito80CqXvimROzdTdQNnpLG?=
	=?us-ascii?Q?ILySaNZ7WbsRRPPLzi7Evcpu27xxYVK+b1Q8TLrQYo/Y0VPYdr163Gt13fMZ?=
	=?us-ascii?Q?3NrGDvazVPig0QBWJuIm4PezrctdJhRULiohCxw3anWfNzlL0IytOKULwK1j?=
	=?us-ascii?Q?B82nrOhmrELIe4XhFdA+lbUbs?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:JAe6jONQW8S4jkNTqoWs2/6kRkGzXlzLMTWLnd2/zzLmNwGlPPvBSMe54HN6UCdZEDD7187oSRNZ50xiUtnLzOpsq/ynskSj2LGJTWB+5gWPTL32BKNKYhI/kbAtu/dIl8+vYesd4WaGy89nC5yXJA==;
	24:EilbKJT8kDqmwR4l+bBtHg2BPxxHs3s2p3WMUcUVuxOS3uRyGJJbbQWHaybADmngFNGNvM1ywHUz3Wnb8A6mfqUfFE6LQNc8pJSBhp4uNls=;
	20:ASCufWIXDjB5uNH233YKUnuNAfnJ5/dBC3THb6+nuUvODnIGWvHmazro9vM7JfBY3HoulvHUDGXfaFPpGTj7aA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:16.2511 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0654;
	2:9j3hAIWWF4ay9iSTwbHv2BILtZKRyR07/Z48K98p3M1D0malK4ihNqDDF7etSThR;
	3:M+5bevkWdxaM/8+LIdK9ppkf2SEE03T6/+ZmScuGP6e7fVquDeR+RaJHZrvYVVQ0D1EAYCS0K1sa6ySX32IE0x8JMEqoUB7TwboCXefMNTwDubwmQk4ZnIPzXewc/Qr09twoGiqsPW5Vu+9s2jgVPZs0UIZ/yWxR1PdvZ7zpCPfAoJ1YuhpkTrthYUiCsyddLQwSm7kttIYariwOW7636pl/1MLP+kSMaU0ec5MpfOM=;
	25:85UhU87rM4IZFDrRW8TBnUMcWCvpvshEUTyssZfVENw9lneCq4XzjAx4xb4uH98V5Cx1ncIzrgnFab3RToFHa80A9K3HDM5Swa6rsyugEpwjoN0+97AkWY72bsHodXzh8ToZmCOKsULO2BQ3+cRBBcpbRf9W2gn4u4QVSZVkCtbod1VPyA0ektwO71o5x57ttGUSSKWAy4c/HAjxrtnMYSNFkRuzXaKpZ/ZPMmT8URabriS+hKKnhtDNHMJkuFJU3FXjdMJy41GtzPVYu65Ogg==;
	23:FbN3jmMKBvhLmFnsbO1xesdu6qOEAaeaaHnVmoeKwLhLMFJHRufgudegeLjMoBHRbO0lPYlIE41s5pzrSuZxhUYvIYvHQ50YXR62DRlmeWiZBQTy0Hfc8k7EpqvfxkXTN6tnGhRXZ97ttjHmxJppMsrWgeSWPoPEByzED6nv3njFptMyvM4Xcm5AE6UfMVkoK2M/d+l+ryVlSpIqZCgANuv2tqwLtZzXSaJUx/0NtcjNSVb9RiLrc01/IOIwryT0
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v2 2/6] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Mon, 27 Jul 2015 03:42:46 -0000
Content-Type: text/plain

When there is input data and no output data to the end of the stream, it will
send GST_ELEMENT_ERROR and quit from playing.
The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
information instead.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../handle-audio-video-decoder-error.patch         | 66 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
new file mode 100755
index 0000000..4451eaa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
@@ -0,0 +1,66 @@
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
+https://bugzilla.gnome.org/show_bug.cgi?id=741542
+
+Upstream Status: Pending
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


