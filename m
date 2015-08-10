Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0125.outbound.protection.outlook.com [207.46.100.125])
	by mail.openembedded.org (Postfix) with ESMTP id 50A3C767E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:46 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB1326.namprd03.prod.outlook.com (10.160.220.28) with
	Microsoft SMTP
	Server (TLS) id 15.1.231.11; Mon, 10 Aug 2015 03:41:46 +0000
Received: from BLUPR0301CA0039.namprd03.prod.outlook.com (10.162.113.177) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:45 +0000
Received: from BY2FFO11FD008.protection.gbl (2a01:111:f400:7c0c::118) by
	BLUPR0301CA0039.outlook.office365.com (2a01:111:e400:5259::49) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:44 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD008.mail.protection.outlook.com (10.1.14.159) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:43 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQV000825;
	Sun, 9 Aug 2015 20:41:42 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:35 +0800
Message-ID: <1439178103-17813-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD008;
	1:ifjFGA4tN770e8A8iv6MUrOW64EHum4MhpYOx4UU0aHVaYTs/j3V0zBe4vxCwuFf/ZRll1cNxpHvhOdYPtplfsRfCxX70Sj8JGBXyPcUlNNLqeWDGqvFh19A400qrxZOU7Ksiz43XbiIKY5qKFxdq5/IVSr9ayUv/pPeUqBRbzKTg9WQiNs4siTf6r4YFyAPzJ8PPKOisXdn08IlVfGJ3YAeWWFojDbuO1W1adl9XqYKOvvCmBUmOiz5euch5tnn6/L0zsS9EXxNsQLzr6IHSyZ47oOooXel+YBPxkL6H8AjhNNKl0ZERBJVYf5JaiR/xZchDUZ64w4ZZuutlODLUA==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(86362001)(46102003)(19580405001)(15975445007)(19580395003)(106466001)(50466002)(69596002)(5003940100001)(48376002)(450100001)(64706001)(105606002)(47776003)(62966003)(77156002)(230783001)(2351001)(5001860100001)(575784001)(87936001)(189998001)(5001830100001)(33646002)(81156007)(4001540100001)(92566002)(36756003)(97736004)(104016003)(6806004)(50226001)(85426001)(2950100001)(107886002)(68736005)(5001960100002)(76176999)(77096005)(50986999)(229853001)(110136002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:6oFztPm3113k/uKGIpOTBm+7MnFY0y3RdsoNGGFDhLt2Nt7p693yCahmELeHRjx0nf2q/s1fX2FvKuZRfiMgiIHaLSxKggrRWxVeXE0+cBTcAa/9SIO3MXjPaL6huoRxIl/ZQgS2rGjGh8ftzcRv/la+Nt/f1lVPaTE2mke2FTo=;
	3:Xk9M9hUr3uVB8FwjviMPqIMEVUBm51zUNAsyJGs+qTwH6amCt+upr/Q9L9V7Jm6Ntde+1vbZaDliscbSYrj3x+QC1cSjahOQ9KgG5Wawje6FjMI7jopx52xSyVUWOYUFGtrWriLHBtiuv8DRf2qHBOZWqD8CBWFhN0UbmBgoYxC2vpIDEpVqtqCSaC6Nex2rBlHrH3Uf8WBIIP/B6ulfO6BXasr+84hH7nANwd7Olhg=;
	25:TDygRGRAoyy3/aOsNCtEdOuaXJdJSIrcHtuJVqmFer39wW0RjgCwefzDvN7UxRohS5A/3injiiGAo3UBXRZdm/r1Em6LivmrPYxc0pBd6DrRWUcamVkSDS4lBvhDsgMJWEuLW3z1eciMaAsQA2RwhVi5A8aKpuG4C5v2cSjDJfTGh7KXJLwDQpbgqtbh9LTYTamWKQB3xJNt422pdaDCGjHuiMUwFzmQHCYojgyK8YebYRqn6jCCOH7I66GlMIpNGmdzdtT8gL76IZOb1X3w7A==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1326; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:27tip96uqEqK+J13qlTS/S3n3P3mOB53+xC/Y7ubdPXnLFx+JCfOMmqGwTSx+q06a6ofe7nmDM4V1piVDdAs5vH4SxUt4MCMKG3AZL7d5McSodauQaYHlfIRjAm1sMJC4COtryZBdN9w4aIZnO3XLDno7agv3rrj76ZnpWpPLabPEO0zUSb5qo6SYVcN+XdmcUdv8yi8baBpPmhwlWoOLhmmg5knxLap4B2AYMdabQIfQlFEO6QwW1ziFKY1OIdHVLGFfdZRdt/oUF+FHhtYpJLl3i192R4jYokxuQxGGCl9aMXSEyGzCEpviauEYsaAs00wxyt2liXsRcv9IjWUJnjqpDWEktqEq1efOaX1AEM=;
	4:4GL2rCcei0kY4j+WHj382/iSwjQRqjez+vT3dsDFZiQKrfBcP873vQh5rFwfdAjlcI44PvwWKI9I4LLY+RufTZb02c7SG3eLhFN+PG/1zJ5t57+xcnebq1P2CL384Xmvxc3hf4KIW1m6UAM9MAa5dd1VBd6NXKPvknk4+L3sQLJlTzD2sAzmTkMVtdldueYnN34jUG5ZHcz7GDYQNo2xZCO0ZXk+jwW/lcB5ELiQCXKUwDtZ0Ag5SK3olEF4a2a1mhSHyWC++c9lQ8LA7mUU//6O5zgK0HvkI1H0AMqFw5I=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1183F675F82FCE7A4061E7E686700@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:DpKxtafmwZoRUn3Oc2fL4kOraX3tXfdsv4o000U?=
	=?us-ascii?Q?8EZImdKssuvMoxeieBF9vSo5jzXD/qcxDbqUeSxJNmBr+4SELuBIoMQxEJAC?=
	=?us-ascii?Q?0eKNr7jEbqNWDRSuMe9R2FNHiOrdhG6kNfNr9e3p8dNFlmm09gl22uVC/6jV?=
	=?us-ascii?Q?4ZFzPj2aqQ8JJTZx92/+m96Ovom3V1YoPTgg+qkS7xfoX/LZdSOUQ/h3vhdr?=
	=?us-ascii?Q?aUxOqm7w5yP4xrGNUCzV9FtZhGRDDYiLIOJ3XlYrgNDPip1j2sVpW60f/355?=
	=?us-ascii?Q?uC/EMfYl2pFX6vyJnbogWD9eQD9LOMAEqkuwgL3D+e6ItcYxWPez0CQy4p7F?=
	=?us-ascii?Q?k2f8Tkuj1gbI69OV48pWsjHQ7POYpGVQ76jt7zIKg5UwGM4wGq2qXOcTVMGW?=
	=?us-ascii?Q?WzvpICoGFG1El9E2qtF4lY2VVgglR/jpF4US0nyTq0uvGjr/3yqu3n7C6R6U?=
	=?us-ascii?Q?zn9zOKsZ/KS+rOwp1zx8XWQnxdQUIpiyNLht6hNgajiJ+r5uBYv1UrcFAsEU?=
	=?us-ascii?Q?OqPG7zSX1kquHo0pipHqvI9YkYYXbpRTEBZNu7nhG2+/cN0bzchvIV3S7tZj?=
	=?us-ascii?Q?L8e3acZoLFgUkBA4/qUmr3G2xr2MFshm9ILahlMkv8DjMdv/U7wt/tRdeOUr?=
	=?us-ascii?Q?YrZ5aTNG8M8bvjyGCWBqbtssLUcVAqUHT/wwpXKzbQdyDFknE8vFu8MKQTT4?=
	=?us-ascii?Q?f8/qMqm3ofrbSqNEe+rNIcufVE5oFPNbnjDYioaZfl7lM062RVegQo5TMaWY?=
	=?us-ascii?Q?HRaYnIA25HGPgFhE8brC11qhsXv59bXMYq9s6v5pBn4vts0d4K3XUKnFMKFY?=
	=?us-ascii?Q?pDIAi6Dlota8UiSVFpF/goZrLQJlmP8CEL2NF8x5J1asECyZJjUdsOXsiaSB?=
	=?us-ascii?Q?CsTE3IHyY/yf+h7jzbKvkq2By6JZ+PVFJhcmPU4u6gGHJMMOAC5F+3R5ervI?=
	=?us-ascii?Q?gSmbkolz6noHytD0SlS2DDejT05nWA/8TTP3MNwUFhyU6g972ywJyIshCfZ0?=
	=?us-ascii?Q?28XYgOZ/AGSTEDKD3ZnXiZRyZvGyPWlTs7tl5LkG187itnwadidvKeJK/Y+4?=
	=?us-ascii?Q?wYw872+cVqhBTVdL58I1gIK1oaUkdl+ELZJ/wG5LJlXqnta88P0/thwJHl5B?=
	=?us-ascii?Q?hF3RqC1dPFuDTCco3qXrnOgEcEIHbVYB14C0FFZStc1rQPMtGa3LtSPGp6Im?=
	=?us-ascii?Q?FnFAHWZ3Gjmb+3RFLhr6Kq4hvnWsbykBZhfQkY35sUCKeUxjckHJv75Fwxxt?=
	=?us-ascii?Q?v8g9c0agSmUs4bBKXsa1JrWoRlz2GewTOyLBUgi6S?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:zjpli07HGcVRVO3YSl0/ktkZZBnVzPOarx0u88ssNoSBzHLLB1Wb7cGRkC0rzYH2FXFrio7LvQBeavTigwP0Pb1AY+md2vbyBR1zi8LpzTiEAD/NIYcORqPLLQjbOK9RbzJvglLz58nPLBsQzL7KZw==;
	24:G9IkI2EVsULPla7avhuh+6uCebY/yB6oguJWPWSjJrPsUStLlGrZ499XkSkD4ZfgJAJbLtR3yIG9Tt17y/IgUi7bUskB9U1s/CbUub/uOEM=;
	20:uSBLJI1a4OJHukD708Dwd6jHg8weqH/cNiMkyycx0UnUkUbCw4QKF/RK2L7oLq1YT4Cn77g6pkawkxFxPiQEcA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:43.8840 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1326;
	2:CmcMu5GNNK06IQS0Hl0zO8YRlRoDe8WUDCmoVqxY12U1y/b4sNSmwcXFmCzjoN2eP9rY2rHDtlE4sRbCbW5YPyy1tjR27vOJlnq2BuwnoGFCT++owqR0TJm1CJA2MjRtDoqvvmeJ9DZPL6BU4QD++naNo9RU9oztnrxhAHdK1o4=;
	3:K0VGs0i3oCjayIvWu2XqxXvERpIus1zCyTV081Nhno4SdJf0BXBRPt0O0ha03ESqnRo9ZmDhFZteBW0KBb0HFAvrCOZo/wOBVY9uoaTs2cSWiQUrmqZS3xBP6gACh5qBpMM8IFfnk//baC+0g3V+OeX0n75IfH8uq32/XBxjQJgkyH2V0a/knEWTJ8vZadngB06GijOhBHHiPpzNlziR4masXiT9g5U2gZl+WoDOqaE=;
	25:5LB+6Qps6/vf7oGV7Tkq9n1SRAZQ4I/nmREevgcp+XDeFXBrBZrBE5FsR2zBYH1dlOga9EQdpvQ6C2lmcjcWkRpEJ9GqRux9YltCRqWlfmS+sEh5B0S/uyCnoS8P7x+3f0975JXqyH4pikD8HOyfY1qFxfZKCloRQeSJDp//5fDfnJQEO9h0kt3RXQ1G8SYcuMgfgwZ+IbWGgPyklS8hu5D5rUZY4tx29sxMFRPY1+FLPTH1AGQLcwFE0e+icP5+3tBRNaNH9ONMLtbdEQwbMw==;
	23:26dC6Zowk+3nEWTRPgfUbmWeEP3CPeLPbUuWIkku4CVcbMZvjVIOrgc/Pq/ES0DSN7HlRMSYn5zzvTSuu8YPl1yDTEvtRZ0Xch6QDAbnLDHWNGVhB4R1xPpszBFx02+lI8V2GKQng+ij0BRiC40N/QRN+fAFW8M5GR9ukf4kHj/3ggLpt2OCRa6ilhBS3o0f
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v8 03/11] gstreamer1.0-plugins-base: Update video alignment after video alignment
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:46 -0000
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


