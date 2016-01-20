Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0145.outbound.protection.outlook.com [157.56.110.145])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3ED71951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:38 +0000 (UTC)
Received: from DM2PR03CA0007.namprd03.prod.outlook.com (10.141.96.17) by
	CY1PR0301MB1180.namprd03.prod.outlook.com (10.160.165.23) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:36 +0000
Received: from BL2FFO11FD019.protection.gbl (2a01:111:f400:7c09::158) by
	DM2PR03CA0007.outlook.office365.com (2a01:111:e400:2428::17) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:36 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD019.mail.protection.outlook.com (10.173.161.37) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:36 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RM004523; Wed, 20 Jan 2016 02:54:34 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:39 +0800
Message-ID: <1453283501-3982-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD019;
	1:Cmu9nI3+QF6Vx+SWFNJjtxETlfNuFlDNfRb8L7Fzgv0uxkPZd0pjmusunCeupZsYQ+giJbXXH4Ay+mswxHaYF6VKef375/nxZyaOHjhH4m+YE+qh9hQm2r59piTUFxUsKcOFhz2Iu6txdnPyzJTZZ2e3bUSD51+V2et9uHhJuGb2VL1igKQEY8uiLRaeu/LuaPerLFg+dEsY135A63FjvgAGDf5WEO7CyP598/2/aQoefK+ZjrNxZtngBZSFuYoZo/XYJeEykwL+8MitW/rqRHEyAFv642xwmxG/ZWBYD99P7+M+C/oz0hsvEJY3/a/HOW99EX8vt0INgUd0BmxsDyvjVSFVygjwEaIaF/EsnnsSeLW753HYYzw3u26Ue295QjwEOtCYyXKSxwX15OceF8JS34RfYrXRQQFefaEcHvS7AoEI3HCV4cwy0/8gIaPD
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(36756003)(50226001)(97736004)(2351001)(4326007)(86362001)(575784001)(87936001)(50986999)(11100500001)(5008740100001)(1096002)(104016004)(2950100001)(92566002)(4001430100002)(81156007)(33646002)(586003)(6806005)(1220700001)(2906002)(229853001)(450100001)(5003940100001)(19580395003)(19580405001)(230783001)(189998001)(50466002)(106466001)(15975445007)(85326001)(76176999)(107886002)(47776003)(110136002)(5001960100002)(77096005)(48376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1180;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 666d21d6-57b9-466b-5d38-08d3217fb47b
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	2:MQqLd5QdkboqLaP2C/jCCVmugB63GF/7aS/GaIpCqKD3nYjGLmt1zYGZPt5C0aujtcQnMr9lk3nOhxeyrhVhoOCvVCfGNCvOEP8LEfYmnuG6FTL+qqUVNizjT4bykki/CAR98uucrKzDboSDNriym3GUC4RrnVvfVR/mzXk/kTFzntAl+bNZmjK61LJS3XBW;
	3:WKWq2FfH+mq7uDEDKdhipcE6DQIeUDBccM08KmbbCABuvnI/6Gwf2P8937A1FjX38ncaMe/+WlZAh2EpTfDNb7ZZkTyBRhuutbZBulBeZm+XQ3oT8QMkHaDPQexmaVj5z8YAWoVuNICDOG2rL1NGTYm8DlLk9XGrilAzwgCHPc+yFD/CO7v/GrRIXwpm3zk9zOxXrrC946H79D9S6S6cuI4Dhg+EyBolhbu5akC0Mj4=;
	25:IAGa9kQZHuFK/28EZASXjkZHx/zdfrXwmP6RyLfio0+H6v3ELp8QG+3Ogafnha4GnsPWyKSC0PPaIjMBRmPCKPWTjnqvzJQpl8GOzGToSBymew4XU1Kg1er2M6Qr3Hd0AimyCZlrdmh2TE5NcWubCsZftYnq6ZChdJhLLTSA03YtnR8ELI/E+EzjTXwyfnoCeeAiIg6OIbHH9sKiYr6a/TdheVtEgIUeDU6m3r5rV342ODS4VMhn4iga3lzuygX2
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1180; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	20:uavI3FBe0HXPjXHECEf93ydHM9+PErPltA7eRVH3CGiBzk6CdWeiahoHWUnJqd+1cTlXPpcLz2Cuzel6LSDqv/+pdkefENTMbICw60WSrJQQXqkAvzxKaEIx6ecDd88hwOnZSfK+mVxI6L0Xk2mez5t9GB5Sn2ea7xSfvKmfeUKQjQSpdS4igGsxm9/j2MeWk5hLepC46j9uVRulEWCQNMuNO/mbbXiEyJJ9zYKJemK1DH4cdFhPnv0I6kVUo+iLFNBbutGUZUSSg2uTGshzXvBRC3PcK+zmLU/P1WNSeQ4JxO9zDQCbJ9h+bj0e1qAiZPQ3gbupUkwVdc8oJvKIAuRw1I5KC4GWXufIdKfUksr1We0F5+vkZKTY3I4AMVCLJULqnf9fx76fCDWG21MLX10I5Jv1bnqMLIckfKId8dKlKV+WpaTs/+QgNGm9JUaR
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1180C555EABB376A2334526A86C20@CY1PR0301MB1180.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13023025)(13018025)(13015025)(520078)(13024025)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB1180; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1180; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	4:Cag2zY3gKw/6ZRhjzQM5GLrsZjjpTf46kxho39cmyEPCYjuot/i6N9v+EasmLvJg+w/TmV33J5K5KwtSb2HhP+DDeEGoJOqFW+kC89mC3zvZQtQ2eQG7W2+/BTzehhptYHjQhQ3KSAQWFOTpXOVmkYNIErc12RCJffU76Vdeb8rQ+QucNb30D8OHtJ0ATo5INRTL8eIC7MudZA3T/CoGGbXjX5ohvWE1qy0e35szpw1Od0mjjUVTUAcFUpLHy62sJheo9y9h2Loun83r1vsrv1bP0VJB/VL/X0qjCBOLwsnOl+nZ9IXgaCf7YPitNAJsZFqmltOr0vGF+JR8L8kIU94lFnZywFur2BGPCUBo3HWOUgzLhRtusfZeJeV0uIBQ3VO30HCgmy9R3ZHrHwaYyK71dCETn7zH5ct15oYqSEzIJXasyL1ojfEX9kO8ZJocQN0icZ/JMMhZp9NsO4RraBGjlx/GDzAn8PfxhYEC38HMAC3dG5lkNWyjdwpl0nvTcbVM79D9ELnJjuY7xHVktQ==
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1180;
	23:rqLjip5fmea8Ir8PA0Wgv05HTSEFRKFCay4BEtR?=
	=?us-ascii?Q?9t3OrvWM5sTqab7VLiDw2SRnw0+/08tzrTvhkVZrKzLryLa6T26OjLHROi0n?=
	=?us-ascii?Q?V4sC2S44VT5VCIMrnkTJZoAn/G5S/2l2OLA7BL7Qtpw08dl6Z1+UUXjl7cxI?=
	=?us-ascii?Q?1L60vVEEQGJ+N+wZN3ZRhXG97n9MdgPEYiW/0URXkOdnx5rfpOMHFnhbSvtV?=
	=?us-ascii?Q?9jUBt1Q2vp26Ctu6e7itlZEyRffRYeWMK4Pj509axlTz7qtYx2e29V6UzhvW?=
	=?us-ascii?Q?wLXxKdudIzBxhJIdfQHONT53y0oHGpZpDQfX0jmMPotavwBx1dO01wWLgZ3z?=
	=?us-ascii?Q?kZ2C9VmJzOuZFJvmqNGCe/HJSVOgv/UIM/Bf0PimiiIF+UGGDX92MLQNmIw7?=
	=?us-ascii?Q?FKYB2xWmdS3PIaEJM2eVV9d+4RACToYjlmTH0JUplm9m1vO4kZULaEAC1cMZ?=
	=?us-ascii?Q?GbTb+/LKn1m8ozVhQp83IDBneQ/C6TiDBS27jKwCHccNiHhB/XkvofuBci7m?=
	=?us-ascii?Q?FcaBG+lJNjtOP8cxqiK39OHhP2odNmNQSeXY8OOXeK1Ym5jpQerhMWWX4l/+?=
	=?us-ascii?Q?gOJOfF4cfCrC706wt3vEZshhAwjSHW4erTkjnPj409V0w9uNhZMC4lZrBQyr?=
	=?us-ascii?Q?+BaI/493LpfUN94srPdrJIaX0K6NisDCHYXEnCjAfa7WwUyFAW0GLy60QLpC?=
	=?us-ascii?Q?7ILpxay9db6YOc13GkcvpZgtGD63yck2N4sL9jKBbyG4xtXI8eChspiM92X3?=
	=?us-ascii?Q?zHD1ClE//Jwax+ECzscbuQX/GrkPjUuhlWWgKH3NX+1OKoQZpsl9PZQAI8q9?=
	=?us-ascii?Q?dJk/eqfdXCC/y8xFtZWtbMVeN1Qm8mRQXTvzhulFKeyltpqEJ8G8r75iNnrW?=
	=?us-ascii?Q?2VqWc939nVH0J1qT+IM+X98wEaufCX12Oyge8HBzfMkbsBBEqCxOjWRNGP8J?=
	=?us-ascii?Q?Dh1lePbcMOzxmJ5h9N6OgmXKy9URUrLWKVxMwgZQBJ4cTrb5bUnfGnK3AWZP?=
	=?us-ascii?Q?ab5w0sArGddDaOW1bCN8a7JmPFtRLYzjG4FG+bvKqjrc+xoqjDb/XeSNMo1L?=
	=?us-ascii?Q?B+tE5i34XRQSZqZZp9c9WlIe0GwRk+3W7uN0+6AfqXJbVMTRf8/9Kzff1S9M?=
	=?us-ascii?Q?Fd8XHXC4xKJJhRRj50EltnXD1Uvr+rA8NB5APh+iOqT6klrWdXLdi2+4INcv?=
	=?us-ascii?Q?su2+WkGtcHrzWFAc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	5:wUsSC4GHppv0K3dcTp3mEtVPTzWIX54ZAaN+eSwt/sWj5Rz3iHBSEEzgxR7ncEFEALFnwoG7e1Fc/Aw/8SxAR8YuIrNk17H/c2OFnXgIy20c5RwCkpfyGezxMapYVFcQyTzCDyVPcllfXyj/kR2f7Q==;
	24:kMHwdrhg09w412IkF4eF5/QP509nouXB9RXHTTRdp1VW2zlT0l2rceJ0BxWi4qA7XeAFHIUJ42YZZms8TgPRIfH1+JDB6KXDQuyiL2m3wqU=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:36.0046 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1180
Subject: [poky][PATCH v2 5/7] gstreamer1.0-plugins-bad: Add detecting picture coding type when drain
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:39 -0000
Content-Type: text/plain

Our use case is demuxer only output key frame when backward playback.
Every frame is DISCONT and KEY frame. mpeg4videoparse will detect coding
type when detect start code after VOP. Our use case will drain after VOP
and can't detect start code after VOP. Add check coding type code when
drain.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...arse-Need-detect-picture-coding-type-when.patch | 47 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch
new file mode 100755
index 0000000..3f09d4d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch
@@ -0,0 +1,47 @@
+From f712092e768347b59719f5016714c91d4d82483b Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 20 May 2015 15:13:20 +0800
+Subject: [PATCH 03/10] mpeg4videoparse: Need detect picture coding type when
+ drain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+our use case is demuxer only output key frame when backward playback.
+every frame is DISCONT and KEY frame. mpeg4videoparse will detect coding
+type when detect start code after VOP. our use case will drain after VOP
+and can't detect start code after VOP. Add check coding type code when
+drain.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=749617]
+
+---
+ gst/videoparsers/gstmpeg4videoparse.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gst/videoparsers/gstmpeg4videoparse.c b/gst/videoparsers/gstmpeg4videoparse.c
+index 53db2d5..dbbd6d2 100644
+--- a/gst/videoparsers/gstmpeg4videoparse.c
++++ b/gst/videoparsers/gstmpeg4videoparse.c
+@@ -502,6 +502,18 @@ next:
+     case (GST_MPEG4_PARSER_ERROR):
+       /* if draining, take all */
+       if (GST_BASE_PARSE_DRAINING (parse)) {
++        /* need decide intra_frame */
++        if (mp4vparse->vop_offset >= 0) {
++          if (G_LIKELY (size > mp4vparse->vop_offset + 1)) {
++            mp4vparse->intra_frame =
++              ((data[mp4vparse->vop_offset + 1] >> 6 & 0x3) == 0);
++          } else {
++            GST_WARNING_OBJECT (mp4vparse, "no data following VOP startcode");
++            mp4vparse->intra_frame = FALSE;
++          }
++          GST_LOG_OBJECT (mp4vparse, "is intra %d %d",
++              mp4vparse->intra_frame, mp4vparse->vop_offset);
++        }
+         framesize = size;
+         ret = TRUE;
+       } else {
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 3f30f86..507d048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
+            file://0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


