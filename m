Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0137.outbound.protection.outlook.com [65.55.169.137])
	by mail.openembedded.org (Postfix) with ESMTP id 76283766F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:44 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB0864.namprd03.prod.outlook.com (10.160.215.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:44 +0000
Received: from BN3PR0301CA0058.namprd03.prod.outlook.com (10.160.152.154) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:43 +0000
Received: from BN1AFFO11FD031.protection.gbl (2a01:111:f400:7c10::116) by
	BN3PR0301CA0058.outlook.office365.com (2a01:111:e400:401e::26) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:43 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD031.mail.protection.outlook.com (10.58.52.185) with
	Microsoft SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:42 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN0028512;
	Thu, 6 Aug 2015 23:16:40 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:36 +0800
Message-ID: <1438928203-12256-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD031;
	1:60+WDDUFoAz/PK9G4RqT8C2qeZDGtjLb/iWiqVJtADkkYDylKMFzeC9jCLcga5r+eixvSEmHrbW97flqgrPEkrIvxP3B0I9qYmmUnVrVUai2fsnyKli1DvtW97PtFDq/cJLTbs1P18/whhXWW4/QL0r8QXkx+H65iM4m+Z1lviWmfCbaQnfFe/rnU5CbOi8wcnHYefutXZs26QCYzeskElp+r07gmMTorWLqwttoIj9ixmPIRf1wR7fuhATIiFPY20q6851fC1cF+p0elOmvgaBtc0Y6lLJR0GccYhJQIf2z9DbDjucM8FSw/zVhz3bJ92uNRrhm3xOqqbfF6QiJlQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(81156007)(86362001)(575784001)(50226001)(2351001)(5001860100001)(5001830100001)(97736004)(229853001)(4001540100001)(33646002)(46102003)(87936001)(6806004)(19580395003)(19580405001)(104016003)(76176999)(50986999)(77096005)(68736005)(15975445007)(110136002)(92566002)(2950100001)(189998001)(85426001)(5890100001)(5001960100002)(107886002)(36756003)(5003940100001)(50466002)(69596002)(48376002)(47776003)(230783001)(64706001)(77156002)(62966003)(105606002)(106466001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:R3Ut0ohucFAzKQfN2XYIuldrpWwokUZERh3CDCeonQirSCboMkzRpZdayWnwJs1Ih6qCjmd1QNzxcR60HjWO9D3Y8ehqJVRM20ec96/Hv+ePd26ID8USfpcrGLojpk8RTZEF4u1FKD/aur6AKHiFp1ea0iQfZtvdwQjX73v+SaM=;
	3:BQYjoqcq80Ubq5T8RhCr2QvdBfy66GucGMYDFikzhzXwhOz3Or46Qpf1vE1MVecsGg+dAp1gdgCwKQzNnQNfkvSWDsDaSwRAUxnzkB7Bra9qTTp27oEAkAQHL9tX4e7YtIP6Ux79+RtH77M+QPHa5grSKLL485mCSkr4w0Y4XdUR6FyMM0kZoFuRmETvGUedzQekmq+HSkbZHSf7+lTB9iEOrfZzmVKj8O1vGWh5Ym4=;
	25:UxyKf6DoMp4talPupMj9SxH+TxGMV90BUZQ8pBGwYEHw1Ff/Y2RdJYQQuqBbXgigfj9hoQY0AqrKFR7w5dWI0bbyORDgN1gwohbVpabUPzocDSt4oOF75CncF+TB5ZTmTxtJbRivZato/kQ+eCMqcCEZElqU4Yu15kiovy9Yq1PgCaaQl3UzzjkLgZZ/+KnPm+SXQ+6b+MBHo5sTn9hcNX4ViPPUNAZtVZjMe/nLYVXguk0/Fkt+3cETJ7HEI0OtTKnENUt5d1xYGgIWeEZQww==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0864; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:RggELLxbnpXdEvHlbfspq5CNB3YTGcoejpHlG1g4hHmZFGthmdUuYnQQIsFfBD1O+ZwtkkEzyWTa+H0Z1DvXUhdCL96WfKoLXyEJt9ssfla/3CB6ckdU+WIY5TtCCj7RiA0YzzajwyPBXtMaZVmekzJExqQJGmO3oggZKd+NNkMCa0C6s/iq4LvC+R1G37cdMs6tb9AN1KrJbZ67+lpBxYh4xrhn/aKIotp81M9++QRv43jcXTa+Akz7ecGK0Ckio5DSZkXBFiCq6moAdREoZ9EeSMP8MtDry63Hz7hSyacX0XiByGv3c5QSBNE/fmInq63REGzSP32qY8NhdRbOA/oUPTDkCylnlpP6Cvsou14=;
	4:DwvOgIzs41nMfMx6B1le/TAwZaDFK/XLA1vM57d67Uv9pVQ0vJLXGH07C3UUMq84JJI3+RSqZUUSFK2IliBaFaD/pF+vzazAz2mrPVgK91Uc/6a48aIpdBOncJIXxrZBn1jP6m7ycDf/3wwxJ22mTII1Gl00TzryKWcF8I94am9tCodWZ5XoZKc+BDwzilCbjEfEZbLjnfXl1ZFnrGAlBxhM620WMwlWjfK1yd3kjHq6V6WDrE0v2XyoUkiQIFGB7qDgicNAQERLaTngAaD74SzifDXnznYrjuh7L4idQcU=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11835C8617F2E7DCA2CDB94486730@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:dxFrTVUnYOzal+E8yGpEPQo74G8/2qXfXCX1EVO?=
	=?us-ascii?Q?0tok4TpMJwY3bjF6dEknAYSZQzQl60rlt4DWgsrdvT+xxxS25ZIDbT4Z365/?=
	=?us-ascii?Q?1qDVc87PIiGP4/7Wn9ttEs9PDqJ0GFTfqZHeC/mtW3mhAe5L7gjKdXZD9Dxf?=
	=?us-ascii?Q?gQHs9fRxJAKrjPd3zOwfCuVHSC4a9KFUVeWmL3KXe/wPDiXrlnnTqksc3MEo?=
	=?us-ascii?Q?2tyl6b1nVFCuQp0156awXJvdkMSPh16waW88TWmN0I0b95VIt6R3H9RRXi/Y?=
	=?us-ascii?Q?l+Of5dGONgCChAhgbrU979FAN88ieZFk/lMd1N3VKCDjX1tZqd33/ZkPmaB2?=
	=?us-ascii?Q?mhyP1WemF4F4E28T/a7dUfcgL96jksY+TYfdZaZOS5nMeC15A9qETe443hab?=
	=?us-ascii?Q?DxuU1MHZEyj8dyTjr0Ip2DvZMC3wNvuiqUhGNC8geNewgDhn8LyUNHDnnLZB?=
	=?us-ascii?Q?VV9hOI1ecVEBFSwMfJCWdP/iztf0eoZUj+CXfg3z6sQVCoULK859XM7/J90k?=
	=?us-ascii?Q?OQL1lZCuioxsES8sXmDhtq0Dhi1kzrNhF6Syax8PlPjbpofIpt93OeY67sJQ?=
	=?us-ascii?Q?1XbW7m3zV06vr/shm334bmBfTu2K9DvcA/Qz7RhzS6+d+pcSfvVbnNcQgk/h?=
	=?us-ascii?Q?Wf780g1+8a06qJNeLrSbFtN4SUtiHzeTg8hzHTLq/1CYGTwP4VVzj9WkZe6t?=
	=?us-ascii?Q?6Y/x+tK5sb43+B+9rbbyUIR/Lw7GFO5Bq9GYDpuF415/NBzUZaGpNZYyw4he?=
	=?us-ascii?Q?kmMcovp5grG1Kn1mo9UWr9Rz2D0xY0npcyZlmczQHjMCLgne0Qfnb0eCYLjL?=
	=?us-ascii?Q?Hwh9ZDsI/OFUQ8gaB/x7LGGXNu1wEHJJf+OC4v3HAIv+5wCyUzZo2P5TU4ob?=
	=?us-ascii?Q?3BYlERN0oE4VJbQI689j87Uk9psZy2uk2oCyQ2GmQ6oz6mA+Qe65gAt5K/Tq?=
	=?us-ascii?Q?xC4k4grXOynsHf7yeSbWOog1k0ddnMAuS9QVcK0saU9/bTFHKhh+0jxZEdSp?=
	=?us-ascii?Q?npvST8Zpg6PieuGVteRYNq5RqA5Gxmo/4BJ+XXrsW586LzU03d+QtVGUOcLA?=
	=?us-ascii?Q?NcA40G1qG0zqD5aUX/sT0wtH5vBpFpqHf3ETB+mQdnrNAfvaXHcqkqWTG8AL?=
	=?us-ascii?Q?QFlx6tYPqbZe30Lx47++IW01RWu4ycAOsX5JEa0dOgkkSeVstQr0h0ZKHgGW?=
	=?us-ascii?Q?/6E8Bjtd45B2bn7T4OxsZlyT8pAkDGDzA+NdnLucy50guqZ6qZxsKe7Kt+95?=
	=?us-ascii?Q?plEupHLwYwm+llrPq+wbaPNrgBHdxoqRSaeZ2KQYf?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:u7TyZWCJnZ8IZwYSR0EFTq4Cao/nD3lkkhguOfXOvSEu4B1s9ch1yKfsgvrtfsX7OmfhszKUgVBxVpElU+s/ZuU0F8oobYXy74rdOJWaWLJT/Ik/rNGPbicAYWcA/e569BPkAUNcxTqyktO729Ch2g==;
	24:7zX/bzIvWZuCpYu7TXNzs3F5bexcWyZ71xeEruZMYp8ddh+blOTKR3DzB1kLLZ9IsGUVYQ6Nz0rHZGj8iyKxXEJwi6cB2IiVJKwF1tc2iEQ=;
	20:vmEkM5H5Yln+QVd0HubPjbJgLnW5SCxkcQHZ7ErZEybiey0bpZok7mZ01LpgoBsECpIi2HJLzVUz1sADL6TS0Q==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:42.3487 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0864;
	2:YgdHpeGGwHBMFn8TSVwwwoDRCzOBtYInZUJjVabqnaYnxqTZt73tkGU470b6AIFqwsg/F/NcsIlu/W74Eso6/rMSkI1tChryyrQ4pByGLe2oeePSTP2PnQiQErnbZET03j/7XsjdB7MpReQbuLDQuF+l2TsCTcQnhocEaJBakPI=;
	3:XpzfYG4i4tCYsnNt0WI+8oDrCUTN0EcBINpNSiXhLX6oHQpxLWxvdvntAiTX4S+rAu8fFKOrj7f/AeGkmiE+ZWuS/gOQ1e9R6ssqHio34nm07mU38Zoebk9VZqqTmb8E8XDFyQVzOfeFyB2kRxqvfswDTQHUdQONhq1m71Zq5VtoSE4NJYMI4/tCfAW2wke1H1JwTMR7wW4wnkX3RuxJHEGL0v/mI+drgQInfgblcL8=;
	25:3WCRR6R0JqJMaTPysod5yCB6Oo/mnesHa+BTNpwvSUIqIcqnCaXqTbyET4zS6JCX8B7Y/IiJfFXJi2KG6JXJj0EFnP7sja4QDXgJTkDfR4lPyt4Qu6shWHMT9f1l3D0r6fV1BKbxDKWZx/GezEn02guGEi1LtsW+DOvO6Ugvx+BbRxsAFUZoZGgMNGbYveenYChRTITVLI9mVF+KrZwY47wlesdmgEg6tnw54gvjrEsEiLBhA8E+VwsyGJIk/ifEyJGUGi3DsA5hPOMZn8jYcQ==;
	23:fOPzafu6ZDtt8S3ZK5LX74yG4hOvQONbpHbMVtY32a843hPAhoGUGjwN9un4JdfTJZSGbRkVu83pBM1++m0AR1Djckdde66Wb+ZI/NCnkNCgzvm8/F6JnG4FSS0JXdTCsFli9eVlo3Paof6ZamFdoHCAXhtfO/ogTmAw4mtUtogCp9sGM1wT0VGlwmIGUxJLYQm2Mg1+ZQ9r6PHGHYWir6PCOPEIUTVpIEGuGIH1hJVmPTND1Y4/FftRhfm214jO
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v7 04/11] gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:47 -0000
Content-Type: text/plain

-Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
 This makes sure that the buffer is not reffed another time when
 storing it in the GstVideoFrame, keeping it writable if it was writable.

-Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF to replace the old one because it's kind of ugly.

-Don't ref buffers twice when mapping

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 26 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  3 +
 4 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
new file mode 100644
index 0000000..3db4724
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
@@ -0,0 +1,26 @@
+From 269f642c45d85cfd630ed490478e6bd6b71a767f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 16 Sep 2014 01:07:18 +0300
+Subject: [PATCH] video-frame: Don't ref buffers twice when mapping
+
+Upstream-Status: Backport [1.5.1]
+---
+ gst-libs/gst/video/video-frame.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
+index 01f23c0..8a9ae96 100644
+--- a/gst-libs/gst/video/video-frame.c
++++ b/gst-libs/gst/video/video-frame.c
+@@ -105,7 +105,7 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
+       frame->data[i] = frame->map[0].data + info->offset[i];
+     }
+   }
+-  frame->buffer = gst_buffer_ref (buffer);
++  frame->buffer = buffer;
+   if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
+     gst_buffer_ref (frame->buffer);
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
new file mode 100644
index 0000000..c465b5c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
@@ -0,0 +1,87 @@
+From 40a293d44d1aeccf5eb8e86f23a0b13666111c5c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 12 Sep 2014 14:39:16 +0300
+Subject: [PATCH 2/3] video-frame: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
+
+This makes sure that the buffer is not reffed another time when
+storing it in the GstVideoFrame, keeping it writable if it was
+writable.
+
+Upstream-Status: Backport [1.5.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=736118
+---
+ gst-libs/gst/video/video-frame.c |    9 ++++++++-
+ gst-libs/gst/video/video-frame.h |   18 ++++++++++++++++++
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
+index 537cf70..01f23c0 100644
+--- a/gst-libs/gst/video/video-frame.c
++++ b/gst-libs/gst/video/video-frame.c
+@@ -106,6 +106,9 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
+     }
+   }
+   frame->buffer = gst_buffer_ref (buffer);
++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
++    gst_buffer_ref (frame->buffer);
++
+   frame->meta = meta;
+ 
+   /* buffer flags enhance the frame flags */
+@@ -189,11 +192,13 @@ gst_video_frame_unmap (GstVideoFrame * frame)
+   GstBuffer *buffer;
+   GstVideoMeta *meta;
+   gint i;
++  GstMapFlags flags;
+ 
+   g_return_if_fail (frame != NULL);
+ 
+   buffer = frame->buffer;
+   meta = frame->meta;
++  flags = frame->map[0].flags;
+ 
+   if (meta) {
+     for (i = 0; i < frame->info.finfo->n_planes; i++) {
+@@ -202,7 +207,9 @@ gst_video_frame_unmap (GstVideoFrame * frame)
+   } else {
+     gst_buffer_unmap (buffer, &frame->map[0]);
+   }
+-  gst_buffer_unref (buffer);
++
++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
++    gst_buffer_unref (frame->buffer);
+ }
+ 
+ /**
+diff --git a/gst-libs/gst/video/video-frame.h b/gst-libs/gst/video/video-frame.h
+index 627fab0..f8e6304 100644
+--- a/gst-libs/gst/video/video-frame.h
++++ b/gst-libs/gst/video/video-frame.h
+@@ -149,6 +149,24 @@ typedef enum {
+   GST_VIDEO_BUFFER_FLAG_LAST        = (GST_BUFFER_FLAG_LAST << 8)
+ } GstVideoBufferFlags;
+ 
++/**
++ * GstVideoBufferFlags:
++ * @GST_VIDEO_FRAME_MAP_FLAG_NO_REF:  Don't take another reference of the buffer and store it in
++ *                                    the GstVideoFrame. This makes sure that the buffer stays
++ *                                    writable while the frame is mapped, but requires that the
++ *                                    buffer reference stays valid until the frame is unmapped again.
++ * @GST_VIDEO_FRAME_MAP_FLAG_LAST:    Offset to define more flags
++ *
++ * Additional mapping flags for gst_video_frame_map().
++ *
++ * Since: 1.6
++ */
++typedef enum {
++  GST_VIDEO_FRAME_MAP_FLAG_NO_REF   = (GST_MAP_FLAG_LAST << 0),
++  GST_VIDEO_FRAME_MAP_FLAG_LAST     = (GST_MAP_FLAG_LAST << 8)
++  /* 8 more flags possible afterwards */
++} GstVideoFrameMapFlags;
++
+ G_END_DECLS
+ 
+ #endif /* __GST_VIDEO_FRAME_H__ */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
new file mode 100644
index 0000000..132bf06
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
@@ -0,0 +1,69 @@
+From 3a7cdcdfc9c5b0d20394fe51b3b8cda23931ca6d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 12 Sep 2014 14:41:01 +0300
+Subject: [PATCH 3/3] videofilter: Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
+
+Upstream-Status: Backport [1.5.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=736118
+---
+ gst-libs/gst/video/gstvideofilter.c |   23 ++++-------------------
+ 1 file changed, 4 insertions(+), 19 deletions(-)
+
+diff --git a/gst-libs/gst/video/gstvideofilter.c b/gst-libs/gst/video/gstvideofilter.c
+index e1fa2c1..874b2e8 100644
+--- a/gst-libs/gst/video/gstvideofilter.c
++++ b/gst-libs/gst/video/gstvideofilter.c
+@@ -260,23 +260,15 @@ gst_video_filter_transform (GstBaseTransform * trans, GstBuffer * inbuf,
+   if (fclass->transform_frame) {
+     GstVideoFrame in_frame, out_frame;
+ 
+-    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf, GST_MAP_READ))
++    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf,
++            GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
+       goto invalid_buffer;
+ 
+     if (!gst_video_frame_map (&out_frame, &filter->out_info, outbuf,
+-            GST_MAP_WRITE))
++            GST_MAP_WRITE | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
+       goto invalid_buffer;
+ 
+-    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
+-     * meaning that we can't attach any metas or anything to it. Other
+-     * map() functions like gst_buffer_map() don't get another reference
+-     * of the buffer and expect the buffer reference to be kept until
+-     * the buffer is unmapped again. */
+-    gst_buffer_unref (inbuf);
+-    gst_buffer_unref (outbuf);
+     res = fclass->transform_frame (filter, &in_frame, &out_frame);
+-    gst_buffer_ref (inbuf);
+-    gst_buffer_ref (outbuf);
+ 
+     gst_video_frame_unmap (&out_frame);
+     gst_video_frame_unmap (&in_frame);
+@@ -317,7 +309,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
+     GstVideoFrame frame;
+     GstMapFlags flags;
+ 
+-    flags = GST_MAP_READ;
++    flags = GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF;
+ 
+     if (!gst_base_transform_is_passthrough (trans))
+       flags |= GST_MAP_WRITE;
+@@ -325,14 +317,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
+     if (!gst_video_frame_map (&frame, &filter->in_info, buf, flags))
+       goto invalid_buffer;
+ 
+-    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
+-     * meaning that we can't attach any metas or anything to it. Other
+-     * map() functions like gst_buffer_map() don't get another reference
+-     * of the buffer and expect the buffer reference to be kept until
+-     * the buffer is unmapped again. */
+-    gst_buffer_unref (buf);
+     res = fclass->transform_frame_ip (filter, &frame);
+-    gst_buffer_ref (buf);
+ 
+     gst_video_frame_unmap (&frame);
+   } else {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 88c3254..9c31391 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -11,6 +11,9 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
             file://handle-audio-video-decoder-error.patch \
             file://videobuffer_updata_alignment_update.patch \
+            file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
+            file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


