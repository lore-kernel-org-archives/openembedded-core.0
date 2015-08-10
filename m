Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0138.outbound.protection.outlook.com [65.55.169.138])
	by mail.openembedded.org (Postfix) with ESMTP id 9917C767EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:50 +0000 (UTC)
Received: from DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) by
	DM2PR0301MB1277.namprd03.prod.outlook.com (10.160.221.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:50 +0000
Received: from BLUPR0301CA0009.namprd03.prod.outlook.com (10.162.113.147) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:49 +0000
Received: from BN1BFFO11FD056.protection.gbl (2a01:111:f400:7c10::1:195) by
	BLUPR0301CA0009.outlook.office365.com (2a01:111:e400:5259::19) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:48 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD056.mail.protection.outlook.com (10.58.145.11) with
	Microsoft SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:48 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQX000825;
	Sun, 9 Aug 2015 20:41:46 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:37 +0800
Message-ID: <1439178103-17813-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD056;
	1:SoiZaDxL1MwT0N7vaq5y3/ruVRrfQevOQ6o6Z7otJ1qkW8L+9W5jMBzmYc3BApGQn+TUO9bBw1LNTNHSUuFYxSs6lSbdQWsFL3ZL+GDnygalr1xQukqh9Z/FYXAd70jIK0zqRJ2gyycsx7Z5IcVif/+Ph5J4uUfyIttdayNDtxcZHMlBPfC26evXgco2SkXBy+RPNRxXPYmiTOohC7GOon/UtGwG7xi0S9gCXm4tnpzn2KQqXKsfzeaPqZWSyVlxPfQCcpu0GVsxYWGPZRMnbQAeV+AgElwS64rSBooV5z1gVqpmofylgZpWfG0BwcTWI0KfBlW5ppfdZfuwSSQr2Q==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(5003940100001)(76176999)(68736005)(69596002)(64706001)(77156002)(5001860100001)(85426001)(4001540100001)(6806004)(229853001)(189998001)(87936001)(33646002)(19580405001)(104016003)(2351001)(19580395003)(5001830100001)(47776003)(62966003)(81156007)(97736004)(48376002)(50466002)(450100001)(5001920100001)(230783001)(110136002)(15975445007)(575784001)(46102003)(105606002)(107886002)(5001960100002)(77096005)(92566002)(50986999)(36756003)(106466001)(86362001)(50226001)(2950100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:AqiJfIdDf9vADvejWGPqfsbUDZ/xXVn2IPZ9Ou2Ss5bPRbxGFEVNlr4Ww8puEW5mmDrTE81JhB9UvbX31d9RETbqQpdrBztIpwv28gD/f1IHKI0aR5d3OZA/hALPpgu02rtvIRgogeXJJHff4BgSlbB0qOWOlOQB9KOEpm7Plmw=;
	3:kwC692r37tKU9xVSrQ8Nb07K+RXug/5yWcwvIRv4LOTDV5alYr2/cUcjQVYHFVfzZxKRJDJSBheKY91l7GnXTeU7vlgncVGc/fUd6f5OQ3pWy1eDdqBxbj9iJfn+q/aWYKMpg+u0nfsmLk3Tjj0ThiOyw1SRvhbseI9cj0W0kBRycLeNlSnnXzXg9CYSyXYkGJZSku4TorNN2cCIQGmHLAtvoe9s4TY7StxY/HC5IzM=;
	25:QSMAFsj4KvhEFkgrmgNM7PrzRG68mNKQC0mA8oM5TOUnsurZFbRw+vVTVW2hmaQxbwoxnxla2lBr/MKA+YZAhLaFF6mM1pNRq6HceNy0MZi9NhDMuybojtQG0AQI67ebRUkPiEqZd3o+a/vB5KPSTcn39W8QGExxykBWQHuYZD+akwXGUuSrKqgUqscspkBDW7MVoCf7T82ju0I7nDJZUPY+2zHNnKg79ExcLWu6pKJjXA9dN8IPeLCUTCcMLWo0fI7UzMVY+vs4Yz6w88pqKA==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1181;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1277; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:rIPaQvbfPS15xGlnCkKuaP0EbgKypmdBh48CRnh7rUSoNjJwhnxbOqdw+Hk5XGVssIRaqii5rbyC5K9nh9mJxpxLywd1N9iQIdgofp1qlJN9gP7niZMOs+ongD9Eli8ilNlyNVszw65bgTSaFR/I0kAjrl6zJCoWObBmiQmfn4KxB7fshM5UZUhiRwG1HU4isGIuI9f/lux1zVaYWPlDWfdqozeTEGm+j3V28XvfL2x+tbNJMNjH9woxvQ6bpPOrH3TCh/dOh5AEIiBsj1irqL0aOLP5i6k7bDT0QYsIqOoh9c7pEq54nM/2R/0Au8C/sKBNnEVtZ9/C0HRC17/Txet5NQ3SR3PPKco40qBPeS0=;
	4:otEonqF+4xEJ1TV2zv0UUes0hoOz6ohL4UuPm6D352spuTv7fqQffU8UgxHVlZ1GAM2quHM+PbsKFfUGucqNAgrQ844kgkKc/JXRfbzpXQq1W3WEW8C2uCE1CSCrKs5nGLJWH5moXEwvnhMprpQP9CjVEsd1/YoiuPecaOmRSpJqnlBiymhNa21xeUhydsx6BMP+1jiKli57qxY1OKD8sm/AMFzxTDgq1Z4T7r9endrXdaY0Nut1xkXz7M8b3ALvXKymBWbcDVebEbUPPj0nHSdk6jZqJL/y2TWOFG6LqxM=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1181C622B70280FF85A83B6686700@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1181; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:Op1xQ5k5Mf1FILx5vPMmOhCf0xR9OlBPGkCmIN/?=
	=?us-ascii?Q?En6L6ZD6MrH4jqkBoD8/FqXSiE339M0rvvJJ7r77BPogO0OKunPlUjOBMQA/?=
	=?us-ascii?Q?75I10IalK4bzSfjZBBmbo4aBiXWGCYOctZMDcZ/Ec5tCzc0u+2VE8Q4mPnZp?=
	=?us-ascii?Q?XoK1txl3IISSC1wnAj4Ny0qc+Jc8DFpK/p+DBaFuyAs8x5jR6yPVaxDdDgEz?=
	=?us-ascii?Q?Y3xuWIp19/GC63TIOChvSCx76twhHFv+YwmH3oJwxXwWHuymgniRxA6IJ1hp?=
	=?us-ascii?Q?Kb8xCkeYpEFRPr5/plF45/Ah/yvQUfXivRyhRgl+gn7FPPYkZ6zPCaEZ+1hU?=
	=?us-ascii?Q?yo68lw8kgdTS4YLxMMnVSTy/yMyVWEtwHDrHaiCwsGjR8zMd7gAGCyFg5CeP?=
	=?us-ascii?Q?4Df6jCyaLsLhgP5k4aGQJ0lfDhr0Dxf9oB/l5pGoX0YRo+xSC2FQ94QiEVPl?=
	=?us-ascii?Q?Q/JwqbPBY1h5bpZYrI01OW2vwBWyg8USP9+DH7m1zarWMM+Td2mSc5anHOVU?=
	=?us-ascii?Q?Luyumldnld8QeJ3rH1Iw9x8SPh5eTwTvHHhQKKjPY+AKsRQ6CWxloq2IdgpL?=
	=?us-ascii?Q?xE50TKvDo26146BI0yWKzXIyYMFzS2sdfTaU+yo3P1N4F7fIlKTgUyYl9/1a?=
	=?us-ascii?Q?8O7WGoYeXsoyfyMhm3dShQfnkObS8WlCJcmaCIZBIuUs5Xd62KTb0Ij6f9gH?=
	=?us-ascii?Q?o28bBixwED4vtWlOXHQHzgc6d8fOLW+Q9/1THrPZ//AhEP8mLF2wN5roMtIn?=
	=?us-ascii?Q?fOc5gFLRX2gTP2RvlFJH5vGqPXv8/RAJypgV0c1EwWnKI6YNzQKcTZKbPLYT?=
	=?us-ascii?Q?rxJVQGolMzUDoO7UeeKdgwA6oyPyrvUyj3pMiyUme/Wik0OaRMDkusDI3Jo0?=
	=?us-ascii?Q?Dfp3OlKkGZ4hndQT26413ZgNfiXGdgW7HTHe8Y/x9PgOYXotOM23xGQyqzp5?=
	=?us-ascii?Q?Hz8KtaJK6KL++hCXzHtFeX1t8RtTnbqznu+vy6RGbGDjSB5uZ1aFowdY16YY?=
	=?us-ascii?Q?L9iQL2A1VrA6SBt0/eDNQifN4oNFGn+B2Z0xoLVmMXjZiNUZkid2WUToyU9H?=
	=?us-ascii?Q?emurQLO8ayEvTVDL0B2TsgBy2Zpy+Itte9mSQW/8nGEX6fmneIV0gVVLNdby?=
	=?us-ascii?Q?0t0K9wKWrbI8c1rXMSg++0Bz9onXN8UBje0r0AF8vLK9o9hDYkRfUQAgp4Oh?=
	=?us-ascii?Q?97CFizfQdt0MWlB7rlbPFS+YjWXHgeiAFD/5S8QrQwqnO3BoCTx5b31qhMr5?=
	=?us-ascii?Q?TB/FREqqFObLHKfNMYTkgjZySfYOlfyD5xghcbh6uqbh8KxVU/WqP4YYqatg?=
	=?us-ascii?Q?52w=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:gSDFnAAglBQaZhSDIZ+yavZAdIAkdkSkYWT6uBFX4OD5ZDEnnIcXw04sUkuCGHM+tF9imjnLNbDJxDyHSczhihltmqxcSTDd5e3yLuBYMXU7v8VS4VgmolFcobsUU1l03yzskb6n6zjfupLWUjinJA==;
	24:z04tjlb9bHJDEC1owpQNx5yKaAYkmgKhxbW2ywsXjZQwbTB0tAh4YdoiEVRDv0lBdWi25jo7edoB2iqjpql1NTAHcBclcUdox9pkPf932pU=;
	20:2DcpQX8ETtOyly1sN3fTSHc/f/ZB7qFCYws/62z7cJjMAWw6Z6WpYlcx1JxYL+pfwKDYTVZyZpuwWRpRCtRRww==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:48.4483 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1277;
	2:7Ieqavb1iCcX3SHrF6hRsNbEZNbJvqSpaes7rXakiHqW2uGi37R+yVAKzlplwfoRlNZ/lj8w2UhkOUN7jmIMgycdWOAEtOfOKVW2TKRv1WGlS23XyzWq5EuLV1XeW5BrNd2Zzu+uzlYKlCe+WM07i3bgHTHXgZO5iOeM+bpgIIY=;
	3:07GkNo5BuGGd376vTaTiFIqNcItqETyyrKSliipdzzIXAGyoMUPPKyBo+0b9XHszxAlGIexifI6JQzrzAapLFyUow2jhu9YliZWx+T6AcDYKwfwlWt2qcFL+9YqCzYcLYESbTKjWCfAXnWioy1tKHu30EA68bedL5TVWmSQAsTEORuYOxtjkeCsiQEKqd4BN7k3u0eZKHHbbqcJz4BvpKy7cMnXuzWxpQbEYXCgDdbY=;
	25:bfF+WOIp1IXI3x140fm5RZidmf0S5SLH4SZaoT78ftHe3ukNvK8HPNN1zFRz4WNMzuNnGlZhu4uBNEsxcFPaEJJMHRvYmWIOHM5siFFCkthtOhLyDNEKAUy78vbM9YK3FcFENCtOz9h7BUaGPMs83p40Pq4k/uX2AXWVo8EJtHYMjozC2WwnFj2xPU5GB0iT1+3yJ0V7hHAh+NpzZ8MHNAEWrz0YB7NL/xXQhLJwrY7AMO4jt3SdKMEibf4CA5OoEPyplLzDGnhWnVpEK2IXrA==;
	23:DYp0RhybpMRwF6aiU70OygZF0Sfj4OFaCtsOu72xdkCxxg3d85qMSNWVg32YTDtLh6K34OLoLqgSvY+MLRR0/49Zw6sbQflgVAP8iNwbZh7725HuI+UpkHg2E9xFQBWVKxmQ5WDPcjXWNXo90LdRFH2FAipz7W0tuad7hDIm8pl4f7fw+8i4drd+A724IGfQfKlRKUwhkuXXTSK1f/Qfrc8cxjrBWJYlUMk8QvY61EoWeuo+uijVvkUnZraogk4c
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v8 05/11] gstreamer1.0-plugins-base: Keep sticky events around when doing a soft reset
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:53 -0000
Content-Type: text/plain

The current code will first discard all frames, and then tries to copy
all sticky events from the (now discarded) frames. So change the order.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...p-sticky-events-around-when-doing-a-soft-.patch | 46 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
new file mode 100644
index 0000000..b476969
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
@@ -0,0 +1,46 @@
+From c3f7d36b992a3cbcee3386dea85720f3cb04e1ff Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Fri, 27 Mar 2015 13:39:43 +0800
+Subject: [PATCH] videoencoder: Keep sticky events around when doing a soft
+ reset
+
+The current code will first discard all frames, and then tries to copy
+all sticky events from the (now discarded) frames. Let's change the order.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=746865
+
+Upstream-Status: Accepted 
+
+---
+ gst-libs/gst/video/gstvideoencoder.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gst-libs/gst/video/gstvideoencoder.c b/gst-libs/gst/video/gstvideoencoder.c
+index 614ba2d..4c5b111 100644
+--- a/gst-libs/gst/video/gstvideoencoder.c
++++ b/gst-libs/gst/video/gstvideoencoder.c
+@@ -340,10 +340,6 @@ gst_video_encoder_reset (GstVideoEncoder * encoder, gboolean hard)
+ 
+   priv->drained = TRUE;
+ 
+-  g_list_foreach (priv->frames, (GFunc) gst_video_codec_frame_unref, NULL);
+-  g_list_free (priv->frames);
+-  priv->frames = NULL;
+-
+   priv->bytes = 0;
+   priv->time = 0;
+ 
+@@ -392,6 +388,10 @@ gst_video_encoder_reset (GstVideoEncoder * encoder, gboolean hard)
+         encoder->priv->current_frame_events);
+   }
+ 
++  g_list_foreach (priv->frames, (GFunc) gst_video_codec_frame_unref, NULL);
++  g_list_free (priv->frames);
++  priv->frames = NULL;
++
+   GST_VIDEO_ENCODER_STREAM_UNLOCK (encoder);
+ 
+   return ret;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 9c31391..8daf5af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
             file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
             file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


