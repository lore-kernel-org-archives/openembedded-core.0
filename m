Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0142.outbound.protection.outlook.com [65.55.169.142])
	by mail.openembedded.org (Postfix) with ESMTP id BE0A1761E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:27:22 +0000 (UTC)
Received: from BN3PR0301CA0075.namprd03.prod.outlook.com (10.160.152.171) by
	BY1PR0301MB1176.namprd03.prod.outlook.com (10.160.195.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:27:20 +0000
Received: from BL2FFO11OLC005.protection.gbl (2a01:111:f400:7c09::147) by
	BN3PR0301CA0075.outlook.office365.com (2a01:111:e400:401e::43) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:20 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC005.mail.protection.outlook.com (10.173.160.91) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:19 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qh011344; Sun, 26 Jul 2015 20:27:17 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:44 +0800
Message-ID: <1437996407-29463-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC005;
	1:uCiO6Gq5DDo/siJ2Q6xefsvTQOq7uzcpgFQLEObH4nSA/KvbJSvgAsqHzSJXNVUNf78N31PGtp4JlOHmhqlp9EdsVwkAYlBc8gOxO//Hjl1ZwVMJEUUVGjtmvhilfExGPlcrFM5kWYnf7XM9J0n/LUiHKaNTlzyBCdchQChjaVYdkvZInT2TY/9WCtarfygJpu0mKqUWC8b8Eg/cS+n7FLCmG5emBpcod89X5nAmrdab+Gz5o//bLbvWNlSdXPEcKHWSe/U+NyZtNfl0fTDHtWEOgO1mKm+lzjwaveXPGQFuV3NwRFRWBxjX/i+tGfUxGlNvJ4z8/wPx2Su0NOQdWg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(104016003)(50226001)(33646002)(86362001)(575784001)(229853001)(2351001)(47776003)(85426001)(87936001)(46102003)(50986999)(76176999)(230783001)(48376002)(50466002)(105606002)(19580405001)(19580395003)(6806004)(107886002)(5001960100002)(5001920100001)(110136002)(15975445007)(62966003)(77156002)(2950100001)(92566002)(189998001)(36756003)(77096005)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1176;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	2:lhR0KepiYmWaKBompRD55PouiPdWswqNP921l+NIoyKwrhkiitATI5ef8+VO5lv6zdKgTUge0oT573FAykQK+dIhccNCjo/keHkE9OuKMgQwsTpic0UMWcs6pZkpUChPRN6N/E7/FQ13FjBEr3dQlJkgyswIxca/oQr/TjH3+tE=;
	3:AjXLiZJYj3oi6t8l6e7ggcd+OYz4PCUQqKGWQjNn0IypDymYFbeGzDmV1CubDsf0zhBvBtjwEPj5AwSPO8CDtinpqRF3yw7NZWQnnYHtp3jEYcu05hrRXm7VOubWWz9MWi9TrttTgVySluvZ7z7soipDjBE+dE67wQ02ea5QW7aaro0sTXmr710exGVZdBe2CHlNJC2+ha1gg4wz/aEBuyWexEfnz6Ak1TDQ85jYpEU=;
	25:iTQh/EVix16e8yZ8V5RS4AfcvCOZARA06uLcXDAIcln4/MAJ0kk4WKECtzbYXavH+z+DKAP5SmLqqGJKF7AJM0d6QSzXgsXXI8SQBdDnQVvituKF9UXSHH4EMWBmSRoPHXai2nnKPKyMqG/vaEK1JLE23Ucg2XVN43s4Woj2B5mY1NWmzxkBEw4zAvXPtqmbTR//V3hG4Ji0Xbj+YnLp6i13QnU4jvV5H3JO80IEjpCcaJ9S7/z2CD5ivDEIKXLvwCMnR7TKYnKsEYBz6W12OQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1176;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	20:kvUZf1I/eqxX1DWK+NNXjDDdKa4O2kYdSXSHWNn6TrK+PR5hpg6rM2aNWcL92QjV2LVcmlQTy8c4JGiZDEowuDN7K1ogvV1iPkKdwF8aFv/DHLIQga6bZJRjmJljlxca50S+f8KShKQlh9+86pt9IikbKOo8YNPusSCHJt4GEJvWckkcwe9M7MWzpqv/wlnpPyxvqFhl58GnzjkQdaWC1K32n0qa4tWNXQCybJT3ObuJq3SVtnlpb396CJd0fSZdKuVX72EkryC0gzXdAVJdhQK/7z7GPA4Nbdp0L+meJn/VjwAZE/91hVJd7VTnSIyb3P8knDTPeEKsKzFd5WRVJdacEIF0+hkBlf7a+1lZIOI=;
	4:f1ZTySAoithxy8WXywwpn0d9YzogpSPGqIwMTNtVy2KZ2H43cEbNgf2aHzXDWcHAhTQZ24vbjTrBAfacXaHY32ivxtRHG6mrEshq2stlZrfClnVKH/aeS3Svn3I8vTklHFpDYeaH6c4E23Z/TMgxbkHjxNISVQcHVuRl+DxyyTtgWQkvRWErk3N9zTLHsuqGhDmWbiznyGp4467ZLlwxPoOt++mHTfngdanmfPMuH8oSOkdbdDvBmv+6XyC089JmktkgHOw5fUuc4uDpWQi9KqqAdqK3eyvP4Shk4S8e2aU=
BY1PR0301MB1176: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1176B796D9AB81149B4236D5868E0@BY1PR0301MB1176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1176; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1176; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1176;
	23:EySWjflNtIjqmQy1WoDOwk3OqJoDSIuHtIP4uMn?=
	=?us-ascii?Q?wlYXw7BkoUxkCn1xsXvpR5lkRqmmlDJccth+OJ1Elil7Kl3zGtnIFgxYoexz?=
	=?us-ascii?Q?mtsoiptvkrLl+4BGOZdodJL96SrHuMbKsA0rtDe/M5S8ZKoRu3VHIvsSgiDz?=
	=?us-ascii?Q?VFOBpZst48/NfnEfn9ZvboPvmV/xqNFm40NNfK6i0UM23Q1j28xrfFPXtmUc?=
	=?us-ascii?Q?wWIqUrTF/b7GxK2FeJ+47vTKD+IVkSUwvxMn1RcEC6AJ2z020f7AGul2rmk2?=
	=?us-ascii?Q?LcCVlwzpWIFsHLIQZDgDxnU5fZ0bCtDEagP+OAjWQuJrxdmnbmSkTruxETt/?=
	=?us-ascii?Q?npKx2UAFYNtopl8SLXJkQR8J9JrLK3+WF1O1csGfFpKWo5PThUPSGwDV73gb?=
	=?us-ascii?Q?4ZPXxP72+nppZkmAW8yu3Wc24VLvxFys0JQ+3VNh8oxsXTcyQtEscjBKgKbK?=
	=?us-ascii?Q?ssLVYfBbkELV4TbQ0hnCTxmVFyZUbCemH14ByllwhHq1VrkKuQXiwuocRRlv?=
	=?us-ascii?Q?U4DGn1cdpF7ZNXwlYJFVsYHqScWdiXtSBuh8NBfN/SicqrMhIPu8IRhLudY0?=
	=?us-ascii?Q?0+OHssJ08N7PxyLow9gNd7+Us0TiVyybF0jgifmx+1c7c4uPvl191+t6hiEh?=
	=?us-ascii?Q?5VTFWKApJgTzDPL3Qkksb0/thRnQ5byo/NZ4RR7TMh8JGh3z1TYZrh+68Vps?=
	=?us-ascii?Q?imhNOqRGI/6TpaWuSf2EiLsMFqLSQLQ5HhgBV/GFXe7NB/yH3XlPgpYI8DIb?=
	=?us-ascii?Q?Hn1YnnMSkrxmcRUtsXD0A8+mmb0SNtbHt3elpMb5hSIGhcvqWQG995/qW6xs?=
	=?us-ascii?Q?38S3hV0YabLmdQS4DroPnW5BLANhIpTUID6V58FUqAusrZWe5hMN+nZ5VXBi?=
	=?us-ascii?Q?GXssHpnjclbV6KjB47eofx1uJ05kEhMyEBEGiS4nyfLf+ZGYt8OD3hPUoQrv?=
	=?us-ascii?Q?PYpi7bMvA3wXvg/Tp8+hXL9I0EOFK/abtjvRIs50d4aiTvnyiwLrCcFr9BeC?=
	=?us-ascii?Q?mcGvBy74Hd5oXE2zzW5LrhzhG?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	5:wi+Hj7T7dEaEkD0m/jP/aaGawTF6PpVLIAtp/HEREHFkF1q03bs9KY8DHxHlB+ZQJyJnBwhK96QTwQLxZOkFojsCmbtTWbzj3KestNgmXNW+sBPW0kF/CmvOS92Q5XRbw+xDEpGUnu1HAi9X907lfQ==;
	24:8kzgs3cJvYcTFkrynoSoxWbmhusJ1IbCUyazb2Fuf91A3JqRtYA/aWM4O9yptp8FSTeFzeJXEqNtohS2V514wy/LmR8V1t0FIJfoKKk1vEM=;
	20:lhc3k6B3ukRw0cpJxr4MOWa9E1TG6pc7ofKh1db4SUtcdt4pYHbl/uAZnp+FBlQ53nhCZdsjeDkSpTDaghH/TQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:19.7922 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1176
Subject: [poky][PATCH v2 3/6] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Mon, 27 Jul 2015 03:27:24 -0000
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
index 0000000..57edd8b
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
+Upstream Status: Backport
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


