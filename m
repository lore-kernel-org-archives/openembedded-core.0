Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0143.outbound.protection.outlook.com [157.56.110.143])
	by mail.openembedded.org (Postfix) with ESMTP id 06F36601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:26:07 +0000 (UTC)
Received: from DM2PR03CA0035.namprd03.prod.outlook.com (10.141.96.34) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 10:26:06 +0000
Received: from BY2FFO11FD002.protection.gbl (2a01:111:f400:7c0c::127) by
	DM2PR03CA0035.outlook.office365.com (2a01:111:e400:2428::34) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:06 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD002.mail.protection.outlook.com (10.1.14.124) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:06 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TAPtZN004765; Wed, 29 Jul 2015 03:26:04 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 02:25:37 +0800
Message-ID: <1438194339-13618-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438194339-13618-1-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD002;
	1:YMEPSKW2fvCDdLFV9PuCIvNDXS9AF/XNo/I/9ILBQFhHtphHmqLfAIT/1w4Pu4kE7fNzNvwZELnVpTBDF+PSlyc/wEMUwjAgdKXrx4NLJ4QToavmRRuylqg1x6fsu3BVtHELk1VXJw8BzM/F/vJgalh6w5YVDTATQJZCKSJNtHO/YLj3e1Pa3z8+MkcIVdB3DA37XG17gOBypQeFjVqnytCaVWHxpYyeF/wDA/qsss+8I8bPZkJCLKeRyzoDukaqJl26JJliFY9lVDUtiByA/qLvWJB41FM+CGo0R6ZxPNY8HAyVDgsjtXaGfk8iSdrUCKAnWFg+Fj2ZtrzNHALgKg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(2351001)(189998001)(50986999)(76176999)(105606002)(87936001)(33646002)(50466002)(85426001)(50226001)(46102003)(19580395003)(5001960100002)(6806004)(575784001)(19580405001)(104016003)(86362001)(107886002)(2950100001)(77096005)(92566002)(47776003)(48376002)(230783001)(77156002)(229853001)(62966003)(15975445007)(110136002)(36756003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:88x0ngFebMQ9EY634lfnx74sPoqfE9BT/aODDR9PRvt1CWfD7/bUnRa0v+vbksYEWVfRcujyGXX3vlEelpc0F3uJa/94po3X/LMC7uy78GFvTym7SDH3a09NES3oqn3ynGRCGWEwmU5sDXsF141QfMtjZ9Vvll7RkEKUmLbhKJQ=;
	3:zFAldoaPTwIYKCcRJkKSygZ3vQrHYryRUdKjiiovPgswnblbv0+JkInf/e8+0UpM0WwwUqmEeOCoyN4LzJf36qCtb8YUH9KO0jIoVuO0RgY2m8gxqG9KaDGTVU57KqmArB5dEFm2iGCiLowI0M6v5TZ/WAtYkX2r5h/nl8O+xdDyfI7NzURR7nbDp8lMJ0zerWZSJ8FOqBmp/fYjYv4QGl29iS7WtM/YAJ8U1PEzObc=;
	25:A2PCQioxBacL2gJ3rH9lRBdXJw3VnHQVjx1n4x9kSOaVkAhkAbcIfcEOmFt8qNsELd0btgS9ibS9PmXV/5HSkT66IX5vcBA2gd3qzedbd8JgBd8C+UZE6/lEar+WQ7XvMHTWLM1mji3Y0o0wUxXcGZ7iJyk8bCyTAZVDUc2mHQqJKJ05YzyX+hBrk/goAvctUY5KEVPZgHXv9o3Uo0aoAvez5gzEVXqur7ZoO6nhVqVMjdDTB9X0ytbQmfuJck4rhDkmOz4CjoR4bO1K1oh9ug==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1174;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:22SCYe952dfUFdqJCiqqmPNJEQagwOHy8Q3NXir8VHorfw++r/5D3jnYAk0gHeJbtgP8jbBejiWEPnfOT8TV5n2eNcIBCsSH0dcF7lUkZKA4UB9F1dDJi4l25AROMYE/Ri+1F+rzQKm57xpzWy10GvlDrxCntvDUhJFQXIBjGCDxcX5lWEMLtrXr4bY4iJtapj11zCtXjsnU5rMCdJQU23VmQI9z/oqP4v8hM/s/Jt1HHjpVjzaOv+lvj7ZN5M5l9NN2tdRoSdcID2adTfZCkxRdFjBSu2lTqqoa2FWQkqquW0LbzzyeGb1BqeaaoelYAgV+IEWHQ3bAhjXkYciB8DFgwK7Vo5uWzgvnVz2kkKg=;
	4:J+2QSOajfw7sPW8OGRSNiq8eYtOj2VW3Kk7OLE+INE5qWmkmjyxDZufUy3SesV+2OO2sE9hJSwRsQ7B4y5FKdXXms9qdfzjiXdlIhGdFRYdCtNM0ek2axTQMNYpM3JGeUngMvxayGBsKYyatWHY6wdGmeaNpk19+8UUO5bx1vXlLO0rOW55ayxhEGGpigLQDcK9/ivMFQqNGh5cSKHNUzL9Ad9BtGSxwA7Ta6eHEkc6U5iW3twcgtHzPi+uhamTS2ehY0RgDWe1nUZoqwVblH+0Jlv2Ih++U8q9nH6x9huA=
BY1PR0301MB1174: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1174363E9BA9A2E59482777A868C0@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1174; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1174; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:7aOmL/AZ+PmBAvyhqH7TsWe6y4/J7guVEPvqzzS?=
	=?us-ascii?Q?UOWf98E+9fkkPOGLVBHy4EMT8RDkT/d6JX3BxX1mWvU976o9iAYd+8D981rQ?=
	=?us-ascii?Q?enaVWbSWpPKDShEF98oEpjkWPUkHt7kGjOshR8A34oFJjJy96uFo0wHAL4B9?=
	=?us-ascii?Q?erXwgT3+UQTdKiHHseTGIwYV7YfA9sv/cc8J+pVKuPYHRgRNWms+yvt4zYwu?=
	=?us-ascii?Q?jrwJSVmIP0DzCnymzATkGN2iIDD+f20mjsJpP3MXTUfk3Rh8IijttzrXThjV?=
	=?us-ascii?Q?S56wDRn8nZ4fYyUyNe0j9oUFN/ZTo9pKFBfssayZPxIQFSiCypnKXQaMoiSC?=
	=?us-ascii?Q?1WUYkkZztTBY83rNSaBGTi8u1pDVDZ0OM2Qy1lBKqCmnTBd7ATMPGBgSoBV4?=
	=?us-ascii?Q?o/puTRBKluPGbcUMPZuFZytH0rtwdop+2ySJLjY75FzfOHVE6BkJbJrSKhk1?=
	=?us-ascii?Q?+ZPwkk8yIYKTOFoAoQ+BqY12kYumbgT6xQ+YyO9CjoeDNm7u2kJytoU8BgMu?=
	=?us-ascii?Q?KbnHM37bDs9uc5c1UK/Pui55/LYkvKCI41fKLEOlcWhwctygVj2m5XHmSlFg?=
	=?us-ascii?Q?H6eDSESUtivA4auJmIJxO6ZhJhdNwhy3u/AavB7Lr8BUBAQKDPzbGWkSiWQY?=
	=?us-ascii?Q?xghNynYCNAgnNh0G7UMTUWNEQE5wClQwwPJIcbU9kALX9YxIj+EO6QlZCHsM?=
	=?us-ascii?Q?ZohAUzR+KeFbnvvKskqgeC7osXtNlLXdyW/DZrtpSdie57jJWomVIU+RCN18?=
	=?us-ascii?Q?jg/tMJJPA4+n6mJelT87rII+YYlq4NweaJMcRXy5xm27HDq97+q2f7p2fhRc?=
	=?us-ascii?Q?uYIhouKpxe/TvB8eJVDceb51ew4zFBdnUIOoPxMBVBXHvKynf2RZ4febcegM?=
	=?us-ascii?Q?HOCsf6WyhzxoPvCPmSEKTOom3lTvyoYLzS+RRPi0VNJ3QYPFpuTUsdL4ENbQ?=
	=?us-ascii?Q?RkJSKf3SY93wLgH1/qrlu2SMrLeHMhCeZk244Xn1BlBsPp6GHnoyCUgHc/Al?=
	=?us-ascii?Q?x40E=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:phalxnwC4g7R/52jukUj93ERlhJuqnJvLxR75r50ytXdeUoHN6m4GHzvGIXPJuTTDUIuFteFsJkmQhRrU3+MYp+DLINvKYPBhMZwmKGDqPvO8mtM99ZWKrKZjSV0cmg4RhJHr/KDtmsLyUDeY+kSZw==;
	24:RwRTiH+qUYdCJrLnLPrI3x8a0Uf0BtYUEo9NfPZj6tj9NRPW3KRAOp6uqiOxW2eluZVjHKoWlifFLwZIvWmH1H+i3vG26U4tt2nIS0GOwgA=;
	20:Bdk29QErV5/qZs2Jf+TEZi925hhdtzW7O5XYSqPFILX4VItyR7k3Td8FpVeT3RIEtEs/lllprm+gmzetT8bBKQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 10:26:06.0882 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky][PATCH v4 3/5] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Wed, 29 Jul 2015 10:26:09 -0000
Content-Type: text/plain

Video buffer pool will update video alignment to respect stride alignment
requirement. But haven't update it to video alignment in configure.
Which will cause user get wrong video alignment.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../videobuffer_updata_alignment_update.patch      | 53 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
new file mode 100755
index 0000000..8cfda95
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
@@ -0,0 +1,53 @@
+commit 88d253ea23b06289df40401160b606323f16c910
+Author: Song Bing <b06498@freescale.com>
+Date:   Mon Dec 15 09:34:35 2014 +0800
+
+videopool: update video alignment after video alignment
+
+Video buffer pool will update video alignment to respect stride alignment
+requirement. But haven't update it to video alignment in configure.
+Which will cause user get wrong video alignment.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741501
+
+Upstream-Status: Backport [1.5.1]
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+diff --git a/gst-libs/gst/video/gstvideopool.c b/gst-libs/gst/video/gstvideopool.c
+index 4475f45..acef594 100644
+--- a/gst-libs/gst/video/gstvideopool.c
++++ b/gst-libs/gst/video/gstvideopool.c
+@@ -167,6 +167,7 @@ video_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* get an apply the alignment to the info */
+     gst_buffer_pool_config_get_video_alignment (config, &priv->video_align);
+     gst_video_info_align (&info, &priv->video_align);
++    gst_buffer_pool_config_set_video_alignment (config, &priv->video_align);
+   }
+   priv->info = info;
+
+diff --git a/sys/ximage/ximagepool.c b/sys/ximage/ximagepool.c
+index 6cc2cfa..6a1cbc9 100644
+--- a/sys/ximage/ximagepool.c
++++ b/sys/ximage/ximagepool.c
+@@ -597,6 +597,8 @@ ximage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* do padding and alignment */
+     gst_video_info_align (&info, &priv->align);
+
++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
++
+     /* we need the video metadata too now */
+     priv->add_metavideo = TRUE;
+   } else {
+diff --git a/sys/xvimage/xvimagepool.c b/sys/xvimage/xvimagepool.c
+index 244a51a..34b1ab2 100644
+--- a/sys/xvimage/xvimagepool.c
++++ b/sys/xvimage/xvimagepool.c
+@@ -124,6 +124,8 @@ xvimage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* do padding and alignment */
+     gst_video_info_align (&info, &priv->align);
+
++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
++
+     /* we need the video metadata too now */
+     priv->add_metavideo = TRUE;
+   } else {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index aa90179..88c3254 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
             file://handle-audio-video-decoder-error.patch \
+            file://videobuffer_updata_alignment_update.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


