Return-Path: <B54851@freescale.com>
X-Greylist: delayed 865 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 09:49:59 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0124.outbound.protection.outlook.com [65.55.169.124])
	by mail.openembedded.org (Postfix) with ESMTP id 05F5C65CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:49:59 +0000 (UTC)
Received: from CH1PR03CA002.namprd03.prod.outlook.com (10.255.156.147) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:47 +0000
Received: from BN1BFFO11FD022.protection.gbl (10.255.156.132) by
	CH1PR03CA002.outlook.office365.com (10.255.156.147) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:47 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD022.mail.protection.outlook.com (10.58.144.85) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:46 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROe015522; Mon, 18 Jan 2016 02:35:44 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:58 +0800
Message-ID: <1453109582-25485-10-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD022;
	1:DodilV6NQTiK4wxr6dfnu9vptVnrBmAnHNXXr9iKPMNXrL7k9oSaFMD0AsNWDIlWc7IbcKsajnfnJkk3eJjVNxgIXwMp12TvQrU0nPr38QZHmpw4G3GH3m9kRgXol6BwSPmQM/xHb9iX7WLSPkKyIF6fBHvbi0JxTCUxW+tNhVtdTrlx5QEV1i0l1gq0i+216OlPgw2slQEtvFMQqm0OitlAC6/DWTyuilWbWAUidYafCESskSpwrDy4p4pkPbPzBIjHAqmASMiFzkZTK6grh0MDF7g+6nOIcxPkvcT/9sQIrItsA0DQdiWJnw257BBSbz7wPrLcQIhA4vhvQwxEzeR3gh1gZ5ifGRc9YlGFEhaXDIc8/wTbYUxyPSpnQ7w7PI80PrMGGCpo7AgB/Iy+y6emYSIIKlRY9PILk6rKeDQ=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(50986999)(47776003)(5003940100001)(87936001)(229853001)(2351001)(76176999)(106466001)(33646002)(230783001)(48376002)(86362001)(575784001)(85326001)(50466002)(77096005)(92566002)(15975445007)(2950100001)(50226001)(36756003)(11100500001)(19580405001)(2906002)(19580395003)(189998001)(4326007)(4001430100002)(450100001)(6806005)(1096002)(1220700001)(104016004)(5008740100001)(81156007)(586003)(5001960100002)(110136002)(97736004)(107886002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: dc3243d5-8c59-46cf-dd59-08d31feabea8
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:aD5Rlc1i6E+gMU5c2PntjxSwTcoK0PoN3jldGnbIBPwE/YkHwu4cR4iM6CDXqVHfPc40lWSu0STVP6xRuX/wn0Odxf2I7+YE6vC+P4FkS1BoqpGLJXsVU2BIxmXI+HxqyNCj5L51jSXe2pT1v6bJfNvfvxmw37IAkxka3XLQmxN3l9cIyg2aP/IT/JuZ3jgy;
	3:y0UIvgroJDHuZ8fcVWJ+JCiEfbnhgkOfVLqotjejme2pb0DYj+NLYk7Gn3G8q5hQ0hPc7MV41giLAXgUdPigiwV1DuTMYr2/nAonL/z/Y+iXARgzlc4Bo3+H9ik1V8z5sc4OBApK8Cg8UqQ+cDYzAda9JW7yrtldXFDDvcul20E8PxoAXZ+TubcGFT7SZfLpnwa8uMpYKkpCEWMcEYSvclmU0X/fhjQNC0C/tK4PV2c=;
	25:6uXfFKfESyXVclfTSkkducbhuNfgCxaNHcHMosvnKXG+w2oC6zeuUrRXX/gXNIy/JRoQslmCrWvpIa8IH+Tqe7VWA5T6uavnsEKaWGwpbDjN0P8ZpZAwCorkyeB098etJvQ3WJZToOU2M/uzzJ1gJotr8aKwmS5XY5NdzamoJSPCJmGHc5+Avl4t7YFxO8mq+6BOyV9/YSOv+zw4s9PA9uCz9FoE2E6ONkMlwfFyzp9d82AABmMup+qT1wFfYszc
X-Exchange-Antispam-Report-Test: BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1169;
	UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:18uncZq7ou8gBlzaNgm0iugdA45pyh3+9JvuV/PaZKhj7HtN69tJY9Zxr0E8IDplSfiCdfBU4/hSS3kyt3cdW1jZYsDUqLFLGRY3SjrXEg4Yi4uAsBxqXyoEdwSKy1od8vmB5SZKcIq6jdu/OYHiPTDPTU0nldpE+seRzrgNSGbwdGRdjJCSPMdRvs0gl3JqVj21Y3ZSAxCvVkJZ41bZzQ3W1Pwp2FMHHd3dNLf7SMs11rs4ZgdUrh7P105bznlMgi6BTwuDTtRbPNuj4M3Znl3AUOOsv2PDgGVvXZFOCRBr9QGtSvtn1ZLksDPpA/32Dc3GnQ+5Zi4PQ1+S2cjRMWiJNSHQiUwXgPSMM04fCBfE8C3Ae2pmltG0MW4FjVtmqYn7XFRFvL99ZPOdRv/TO7iVWlJvC7Ss+VySLC56Tn7qLs8a+Jz2O4SwF0hiu60z;
	4:xTvfLDD4GY+J1pKAn7Vm3cWUv8mz4ClAsPz2pBRKO00WRJ2okfRbTGgr+vkSzmw2H0YN00JJ2r+or85ikPswCTzouGdaoGNa4fpVTpFZdv/8hqI56Wr1OkPxPZqmGyEog7E1/odTZ45oRggWfyATo3FOmJ+UUSALI0t4lfdxSbmABEWSoW97ALMwgh3fiOgF7cH56Whw4pt+bKUWonS5HOEOniUWjoLYqgJwHj+w6tdrI8t/TlbspMqugL/c1JoE9F2a+/qNcWNbU8+ux71MB/PacbVxG2jlD3KmoAKcq5HImeRdCbvBWuPanCeNV1MGjHCiHUia7Jv7yL+I1ltw9ucoChXm1oR/Cea+bQogxdlbxlsq6c5+NQ6rxTS75PLeM6fWtLU4Fc6BwSkyOeBQbongwDpL9MOQ4ZTDLs+DVdf7dVDpOS4stFJEh9Wtj9eXW6NzMRVd1/5ToZDzBX8u79ZQzEoXuDDYvcf3vI8Qhn78SoUA2s4GdM1PcZt5HRwY
X-Microsoft-Antispam-PRVS: <BN3PR0301MB116937CA48D7B1890676347186C00@BN3PR0301MB1169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:BN3PR0301MB1169; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1169; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:nub/xHTA85cccN5YfP7YsPuB568LxZewnWf6uF6?=
	=?us-ascii?Q?gkBfYMYdC5r4s4F27RbQ+UG68qY+wuT8XgTx5l7Ju58plkg8mssLMsVZM/Os?=
	=?us-ascii?Q?9vu2oGz/+eblnIiMKKPC74B5Ao5k4VL/tH8GFPO78vmowgMCppcF+gFRU0/Y?=
	=?us-ascii?Q?6KUygkJUtNubCNvT3/om9erQ2EqBOxuAtA8sbgyUOGGEiSwASCKYrTD0iR0j?=
	=?us-ascii?Q?ocC4c46dGDTNvspX3NkGCQe2tXc/f/bkxi5sejZv1qhAlTJ3OJ2Ua9kjkxM4?=
	=?us-ascii?Q?xam5cosHt+vrIawz1AOia++Thnw9qLgp9GZo0/xT4s3/utpLAJiZisF0hsb2?=
	=?us-ascii?Q?voYEvHrT91bRohEqhJnuIlqusTTA4gKN9uVQMlty8FTgu/gW725Xk3GUcUo1?=
	=?us-ascii?Q?uI4E4CQ7fMK5MdjLrFQaURVKAu28JlMlc/hbNR/chTohqpnP1bEp3jrmH5/A?=
	=?us-ascii?Q?BEb7LnWFF6aLozPcqOmYqYUJuCP+ZIHiekY4m/RkfNU8yxSZiOr6YdklgJ88?=
	=?us-ascii?Q?0dcWTOAZDPzKvr7esIUwMelDp8bF5dNBnpz+OVSZomZVzNyoOBM8vEzlhEer?=
	=?us-ascii?Q?qFpwVo3X+xznG44hnLs3SlhAslhf5XMePYHIqYlsNvR3Xg7waCDdyNZOzVwq?=
	=?us-ascii?Q?C0cpCgMZkbejPEkRhUaYnXC2pRwosRDC2AO7ZAAV+2b5uJ49xOF329ViR8RQ?=
	=?us-ascii?Q?tO6oMZ9C0N3owbPDfx8wYb6laBQZ9C4aCvzLLitwBiIOdrEms0BjWwY4Y5YJ?=
	=?us-ascii?Q?gx9sAGXoVJq56Vg20IWstHEnmrnjHuL5DIAym5Lv3lxoPkXWKzB9cH+nnkIU?=
	=?us-ascii?Q?BVzCiopomkHnnfVMZJRzV1XmeXTWChH+QCAZmf9Opk5hFqmwOg4/HxKFzISj?=
	=?us-ascii?Q?9XdhqqTYa4WycvrovfK26gc/2d+uxwGJf/D0TMPtSKrZThnv8fyRS7LxfB61?=
	=?us-ascii?Q?yKhPPWhghLF4fWsdjggS2br8NKAssUNpjc0IxiPVRWsEFmo7DI1edTfH23ee?=
	=?us-ascii?Q?8vV6w/MYmuV/Sgiua/npaR+x5n4n9EuG2eGa2ePASHrFGKXQIou6hE0IqSv1?=
	=?us-ascii?Q?2hGpAxU+UeOCaugn7II8G7qTAYPegh5OrkNh8eo2UUPFPPbpiYrOrgGPI6bu?=
	=?us-ascii?Q?uAKSggd4N7amdeQkJ219g+fHwRBdeBjsRJyC9ZD0+BBZV0E6U9haVFi5G5a5?=
	=?us-ascii?Q?R+AWNS7ekq8eJOWo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	5:EL9lH6LG1vUl/12bAvFdxwoWkErtLnrH7jADAORtNPSZlzApTdbFr2tvlsA/sSMwmTngqQSQIWKcKrhV2JasvACM/xIaJaz+kbbfUy9Lc5QvoUxcSZtCPEGAnsxhSs8J4sMcGN6Whd4S5dhPzFGz1A==;
	24:5so9/xJTiv4DB1cQalwEkEJ4oa9d/QuwQ0zfwyvw0WErjbNgYvIk8J3LWjY2pi11k9IK7N5OGtsNBD1s8DMXa4VfSxGvv8BkWWJ/1yHpZYg=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:46.2493 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
Subject: [poky][PATCH 09/13] gstreamer1.0-plugins-bad: Detect picture coding type when drain
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:01 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rse-Need-detect-picture-coding-type-when-.patch | 47 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch
new file mode 100755
index 0000000..81e5f28
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch
@@ -0,0 +1,47 @@
+From 71c688f09c86b2428f58757f42d9ae1ad26227a4 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 20 May 2015 15:15:08 +0800
+Subject: [PATCH 04/10] mpegvideoparse: Need detect picture coding type when
+ drain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Need detect picture coding type when drain
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=749617]
+
+---
+ gst/videoparsers/gstmpegvideoparse.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/gst/videoparsers/gstmpegvideoparse.c b/gst/videoparsers/gstmpegvideoparse.c
+index 54ee13b..c70fa6d 100644
+--- a/gst/videoparsers/gstmpegvideoparse.c
++++ b/gst/videoparsers/gstmpegvideoparse.c
+@@ -717,6 +717,22 @@ need_more:
+   if (GST_BASE_PARSE_DRAINING (parse)) {
+     GST_LOG_OBJECT (mpvparse, "draining, accepting all data");
+     off = size;
++    /* decide picture codding type */
++    if (mpvparse->pic_offset >= 0 && mpvparse->pic_offset < off) {
++      GstMpegVideoPacket header;
++
++      header.data = map.data;
++      header.type = GST_MPEG_VIDEO_PACKET_PICTURE;
++      header.offset = mpvparse->pic_offset;
++      header.size = map.size - mpvparse->pic_offset;
++      if (gst_mpeg_video_packet_parse_picture_header (&header, &mpvparse->pichdr))
++        GST_LOG_OBJECT (mpvparse, "picture_coding_type %d (%s), ending"
++            "frame of size %d", mpvparse->pichdr.pic_type,
++            picture_type_name (mpvparse->pichdr.pic_type), off - 4);
++      else
++        GST_LOG_OBJECT (mpvparse, "Couldn't parse picture at offset %d",
++            mpvparse->pic_offset);
++    }
+     ret = TRUE;
+   } else {
+     GST_LOG_OBJECT (mpvparse, "need more data");
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 507d048..4628018 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
             file://0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch \
+            file://0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


