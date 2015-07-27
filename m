Return-Path: <B54851@freescale.com>
X-Greylist: delayed 911 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Jul 2015 03:42:29 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0141.outbound.protection.outlook.com [207.46.100.141])
	by mail.openembedded.org (Postfix) with ESMTP id C48F4761D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:42:29 +0000 (UTC)
Received: from DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) by
	DM2PR0301MB0654.namprd03.prod.outlook.com (10.160.96.16) with Microsoft
	SMTP Server (TLS) id 15.1.219.17; Mon, 27 Jul 2015 03:27:28 +0000
Received: from BLUPR0301CA0003.namprd03.prod.outlook.com (10.162.113.141) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:27:27 +0000
Received: from BY2FFO11OLC014.protection.gbl (2a01:111:f400:7c0c::159) by
	BLUPR0301CA0003.outlook.office365.com (2a01:111:e400:5259::13) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:26 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC014.mail.protection.outlook.com (10.1.15.48) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:26 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qk011344; Sun, 26 Jul 2015 20:27:24 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:47 +0800
Message-ID: <1437996407-29463-7-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC014;
	1:LOlLpPA+gboZuK7Y65CpanyEe0zeAWhca0NsBtnfZXBmkNDcI2VO+wkB8Ax1+wM4OoigX/zf0y2AOsbqRs1lzjteUA9l8x8fpM2DSkKEe12TDNmtHtNSapFW/PVrrqr6kctwQtzpVh9TdXq13TkHEjhn+boT8KzXBLB2/QbZ8aTn82khM9RBtBFaE5/WZL7ZE+nhr3Z+QJcHjrBM2wEQH+Lpf+MNqKCtdxVMuQFp/CCcdqrMOzZRkqh+0VKO+Cs3SxHuTOvv/0dviSO1uy+fBmiMw6qcKd79WPsUBKFK0jKlsefVkHPnBdvBpWmMO3g8Qnb+frdvZV8fa+ybmU12MQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(229853001)(50226001)(189998001)(2351001)(33646002)(19580395003)(50466002)(6806004)(19580405001)(104016003)(105606002)(77096005)(76176999)(5001960100002)(110136002)(5001920100001)(77156002)(62966003)(48376002)(575784001)(86362001)(107886002)(50986999)(87936001)(15975445007)(92566002)(47776003)(85426001)(36756003)(230783001)(2950100001)(46102003)(4001430100001)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:D3bvIiUqBFhD3OustvApv4n4Eb5C1bPvMAO4aIE5uxExfuVmKnRsJJ2xFvo1HLYB4IhWtH3JawmccGVH/Tw7ayt51VfAXnQ+b6ihkOKJGTTO5lwE9BvMkwcoPNPRMHRvDJ/pGvarJruIYKXjCrOffQ01eO4xTbWLDLIY1QlY5KY=;
	3:JXvApZIMY/Qof/5VJEgWfz9REfhO2zV/RPJTc48NKwqSuLu9Nb7kVr/XlGVlKpXANsBWXYNrsCeKgA0iPpuOpBgFZo/HVz/kTgoaxAOd+ALvlvcZuDoyvYira+KP4gOJrrSXuQ9mbyPAGw0/qCaHbZskpZT4FCoupbDEpCul4CpwNkZWRo/VPGKyeaYQhCBK2yQfTifIEBeJsCkl+dBNEJzFnVgExTy5Kl7230CuqCE=;
	25:dPz2ex3JDHu09bCwvjBBCcjerasG4G62MW+9OYkzBy5Rb2gw9S9EPXYEek/XVJA3jUiJIlQEMqD+PUjtQ1CIoX+amCXkZAwKjcQ7gMV7s+sXkgPylzvlOI50AwJzghrv2Nst9oUHHgrms3AUwvV7bfWG09dGn6/gWMXk9CLTyg9x5tR2a219q1EKeH+hnZBM7jvI5pXm4p+EqR67p4LnntSRf4PsBSQ6Yx5E+ZdNIxh0hW+SO3N6zoNL3OHxKN4OiyGvkzG3AH6n1GO6ohMhLQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1181;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0654; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:QqgSCeoswpluh9FddQYa2ID8csm8q4iddN31ExuJNW0mOSarxsnw2BTCg5phTRUWsUWzHmEqNLKgCBEL5BfVODKL00wKYGYr5uqBjne0dL0fFLdpZmUOGGggkJ3NhTBsR2nWCLRsrTNg0xtJaCMDfLcLUAYUbN2bX3ka5bXuTgYurNsY9TsxNxrjXJUcItNqc1oJwxOQOPcDUPiVtUkFg5xj4+rfjPB2Mcso7K3tzOapMRw+b+bWVSf+ztp9gTmIJFDg/MlPRFqDOUJIPCOnSLRqXrIoYuwceN5FBh3uHCAL5pX3HLuTO7kbl/H8szLlihQlqqP40zPUSoKijXCUV3x8gezZ4PkNxTKdNXeM2gE=;
	4:Bb4dJxYndkgzzoOYgVExO/JJXhjAtbnMihE7sAOjfAgeTR7dHxmC2hiB3YXITB+0BevzhqXvXA5BdFVLR+CiPGwHVo89jtZ1BmY1DnkFN9LoxPakrmvyf/ZRLAsUxkeLBZz0FlOQGAAOkbxeE9S78kaNf1FWoKLk5OiDIffXS/YPxzCu12Qzw0hu9OPTtBMdFR1n2YaI7oDcAsba22nKOXcwCF+j4ZaVLmYJgkTqDxqYbxk1KtE4GlOxKCiKeSl2yZVDM49NUE4WQP27QyfX78Hmisa/vYmb+uhpA2jw9BU=
DM2PR0301MB1181: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11815CAA4EA0426509CC5885868E0@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1181; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:2MwyLYwdNGC+4II6xiz/zXiSqO5REvzdXd7cm//?=
	=?us-ascii?Q?8WKjA7o+Hf2xGnf/uZojIeK29+D8tGH3xCykZ/aQLqmO/FKi14QS1+zc8tMe?=
	=?us-ascii?Q?77/K8dRiqeuixBpLrpR/kELJbAOPIQ+SdHEokLdCDq6oUIZuorQSte7ijr46?=
	=?us-ascii?Q?zLywctfUbuZHzM8laCDP/xZe12t48dHe2URkEl5qQhzuDlewqtGfE+9jyU+T?=
	=?us-ascii?Q?ot0xMiz874njjOEtaWPH+CGxo/VNjlj3qUpo45pCnO+1HVBqILWKH8Q1IS0A?=
	=?us-ascii?Q?G1G0QAmnztggeKVL/img5ep/4zXBv+KqVewB/lBal6nIlamu7JugnI8d/7pk?=
	=?us-ascii?Q?bDRVas4k1OmZIyAF/+lEKyP9xHI1p2SB9NbeIG/yXILLtynbB9R2pT7NOCDE?=
	=?us-ascii?Q?KYJz4NRWOQpDilHL++LvB6Zsrjd4fOK3OH20B4Fhq8sr8U2JczoOo8UdI/kT?=
	=?us-ascii?Q?JG+h6Qgv57AAiM7eXM84RKttrCUqZGQq9z2h7QoddZ1OXBabDh932liTam/w?=
	=?us-ascii?Q?fl+z9hYUw3AfFf6V7px5zqrQXRtjCGMPek90563gwv3OXQmVKupUa4lnXg9b?=
	=?us-ascii?Q?8rakZeJ1uM3UXAOsMpuLcb7raTr1LFXvPFYdgp9tprHksj7edCoPCD9PHEJG?=
	=?us-ascii?Q?nISlp5BJQr70MUj9jvuyqvUXZm6hupNwDINyanUhysz+7YllwKehEjrulh43?=
	=?us-ascii?Q?fhEzTrrdWbTTZghz6uDBPp2fgZrVp9iklIFrViOrDpKItIzp3yyq3yesWy5A?=
	=?us-ascii?Q?sf6WL9gO03Vje1JJ8iy0psRWTm1aIVIgK0We1gQzYomsJuoxYNrIDmGfO508?=
	=?us-ascii?Q?/S7VR8HKXeMdYEpCxEjkH2NXSsjCQ/TlufR/ilb3MSXXIGI8JzxSeiwdH7T4?=
	=?us-ascii?Q?haKpydqhu0zrO6V2dDDj7IybiFVDf2x2L0Um8nN2eBaYqHWRhi6eC2XibMLG?=
	=?us-ascii?Q?rAS+O2FrpMttpwWIk1Oe9n4vIntRMYftOEZMzJZ78xow+4i1H9l4LxlxwCRl?=
	=?us-ascii?Q?74qLChF+PRSyxbLAcO0E5YIWhiDKee5qD+jEyPFc5R6MPkA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:u+hhA6/72RPaxORY14ELPiRp1DLaz+nU+CSSBFbjARX3m5CL9nPBZmP4sDmKVKAME2WXhd+WDg9hVuYPe2MQ2OiJTahhu+0+FUaZJ7cNaIUdIn2ht55+zLMRdYfnJJcKX0T6Tddw1sjf0m24d4N1Ug==;
	24:xjYEmbCskWxKV2r6kjC/3I62AP16xHAStCDdrh4Nzg5gr34fDzaY3j51iEtFx2JM4QFCwRSrut85ly1gK+puPqaIeX1EiC0sYw0uYDyebQo=;
	20:8Q9xM4ZcYhb2io6xZIyEJT+ck5HUx7q920knBuwwg9rZ7NQ56CfF5a/mYKE5/qlXkTx2wXwR59u/44hu3FPVNg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:26.5276 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0654;
	2:lob2w897Iza35k3okwYJpZw2RY7qBJyTmfPoTuWKqJ5zoE6RwzafVgUPp4vVuVSO;
	3:wxH4RI3+8F6/scJxKnjAyTk7tFyRaRGNyR4Q3vWrkc1ee4fhdyJEU9+eEi98QFhmHv044YUGnAwmhbGmF6OQUO9ouYjiH3c8B/wT816FyLhqdccTTePjbml1uYO/F9SqUMXmUlG0VurI9G3Ljd8pVHPR1DCaji+nlSS2bB5uJPQn1YESd7mQy/SKxmlnBppv/mWy2WdyuTTGgwDL94HhnyynhSox2XtY1zzcI7GwD9I=;
	25:58FWupP1lvMJ946WrmQzbRQnSR1SJFv8OyP5h5meNrw3w6//wcKcKoMUsSyraO6UPx55w9ZpHz/i0rIRsveSyDcxEwg3aoBuoX/QbrF7USLKTMecWPyTfchbA0NFc389otvCDlC8L9CfwO914C4SuFPqFafl5DL5PbyM42j3DSikTVF+A7U5vyZXMtId/sR2NuKLJm810L+5SHCDExDQAr/QhUGAFWWClMr6O3jUA0wNACzC9kmG7dSruDPPcNddubo37rdH4nC25+ABN47Qtg==;
	23:i3m8AznS1XUWGIYK+n+U26MjMEowsnig4uq7ViceSK0xRp8iOHgZ1jil10Il3rEwQR4XjWbcHOX0uuqRPgN09qHbBAlZQVWkoJmJa24pLmbpQoFBbPgufJy9L9E/ODgtD9n/hOul4bnY35QDH7UkqdmaddyOSvCwLxApQOLjj7eQWrJh5hDrWob59IkgXonEEXjCDmnir6xDk1SDtxUq4WDulQxC7UDtzOnpxJmAjLQA+uF7+xiHw6vBUH/l/gbI
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v2 6/6] gstreamer1.0-plugins-base: Add videoencoder related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 03:42:32 -0000
Content-Type: text/plain

Keep sticky events around when doing a soft reset.
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
index 0000000..fc1cbed
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
+Upstream Status: Accepted 
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


