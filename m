Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0112.outbound.protection.outlook.com [207.46.100.112])
	by mail.openembedded.org (Postfix) with ESMTP id D9B0976767
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:46 +0000 (UTC)
Received: from CO2PR03CA0013.namprd03.prod.outlook.com (10.141.194.140) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:45 +0000
Received: from BL2FFO11OLC016.protection.gbl (2a01:111:f400:7c09::100) by
	CO2PR03CA0013.outlook.office365.com (2a01:111:e400:1414::12) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:45 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC016.mail.protection.outlook.com (10.173.160.82) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Fri, 7 Aug 2015
	06:16:44 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN1028512;
	Thu, 6 Aug 2015 23:16:42 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:37 +0800
Message-ID: <1438928203-12256-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC016;
	1:epr+uqr+l4iBVvC8kyKa6b61FMmsacCsD4pRjhfSfHr+oulivnr1cMUFvYNyqWT0WFMpwmUffTogy2iFixV2JayR+b5YHRmmxie+j10gqnbgRsPdsko/rLCVBsNaBubTYkhSZLZqWUrYAXa62owTEA0h2oYFPm3g4JuEdLmqWRsu+uL+CMg2XHfyvRRaoHJ691Lj7uYVk0UEYz1zjq2YqWrXZ/6+xjVERyRyjN8ww1U4FXLV3WcafSUS3hPZ4ZKL6xwEXkbykJKY1yN3bExZUGO6sMo7BawdAXUw59LC1sqG5lMygrxSQK66ydIT2+KilBXtB78r8bJtjqXMmwEc3Q==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(76176999)(19580395003)(19580405001)(106466001)(230783001)(86362001)(575784001)(85426001)(105606002)(47776003)(64706001)(46102003)(229853001)(2351001)(33646002)(92566002)(77156002)(4001540100001)(107886002)(62966003)(69596002)(68736005)(104016003)(77096005)(189998001)(81156007)(5001960100002)(97736004)(15975445007)(110136002)(6806004)(36756003)(2950100001)(5001830100001)(5001860100001)(5001920100001)(48376002)(5003940100001)(87936001)(50466002)(50986999)(50226001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:N9JVVCKObpBp4qNIg5VEPpijciIa4fzyksQ+XGTmjF9LNhYJl1rUYCbxbb2lFFr3R9oGH2Z+Z0Bg9Ed7kvT1OdkCzLUzGzDt1sb96905/6gruf0C4/q2ygZfG8W5NYNGrlegghRHYXlt+1oQoAomhKNJSg5WvoJyYGFrtzXq0No=;
	3:W/vc4wYrTYEHglXSMYSBA7ceuieId7dBuOvYO67+6kAztQabV5OAZuh/ljY7CJPFRfZB9oIGBCrL9yLBAKNS13Z0UfDmWLFpj6oEIAiraSIzyAuFqCO3oPd8IgoEXetHK4M2yob6kB+clu9Ye8e531Ct4R8bUujxM27RGgbcJtxPbDmasZb2c8GjQKNVnHM1LhnKlkX4Ya1QCCDFXoGqrmJk+WT0E6D3hJ2WXoI8Mkw=;
	25:X2PywDDbILmxiZkKGxhAqXQatu8XGaOcDKnocymVK06TlTaM6tvuic96dnphYN+bvcn1fX2e98j5njH5ky5piCd3RyaM6cLRO2NaIiwXIjpOcgq4kbNCXDj0dSvptjIZ24Jwab3RbVcmG2R2FljutOq/JGJp2NdudtCybrIMWpCmym6Kd0toyadfTQ3Dk5Jkg/erAAVbYBWcUWPM/WkjdgF8rbtwnPayyrhlbF+4kD7meKGA0axTq/Iew09pzHOM93fJwEGeiG5S6cwab/UKqQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:KkUdqjWWgJSz0SEgO48m7ecbXhdy2z+yr8NOurxBjA4xcU9s9ww1BGJgBeGaXEYCptzTlvOouDOI0tHpTlh101QirkAnMPugwDX4PW/n/5CRsQKAtlAOBdHZ1FmR4p2pAJEIu9m88lo69PHARtkslvaPkXQmEhpilOmevEjS0dZKw4klFxYP97DpMtU8gv5yirwAL+HiTVhIJBP/6aP7yoNSYGPc8hloMUhhLY9PKTccot4fFGnTlx2UJipjS/8bYvJRFxsYhIxiESA7+Ado7WSgx0cBUgHTkt+4Bz5Zb/SJjSwSyjH++phye4s1BiMll0RlzGqwTLGLWRX+sQ334pVTPWDFIqxhHdWuBw+llBg=;
	4:RDfTcbT4kSaYvl3btac2k+RmT26dHY6Tk6lgpLEjUwFRHdJTo+IzJUCFdwTDdwhJYiDIuhhT/lPTv/Q81tuEtf2Pm8rsvYu0L82QjSzml/8itMDhrKTjKBz2TnBspriU8n8wXoyu4BNxCq9CHYrOfKQ8MDpq/wFPa12knk9I8Tv4PO5vIqjXXGUDfXNTPW90jLYWriasTm7aF55HISkRielGka+7aBuerW9LbQBx3ajWRWZNFoO1G75jqMtuCPDM3yCkI2XHe6ClqeGeBhTatSafBSqWaUndwG473HgNkXk=
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1171FF469E56BCA5BC26585186730@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:QPZlhm+y8nHscgI4mxvRQyqRf0RW6Nv7PS2cNy7?=
	=?us-ascii?Q?lXEajRBIeqlBxnpirYqjUG660QtUrP2T+FG9bpo9QXPw9xdKyd+yGcu0pzEH?=
	=?us-ascii?Q?xV8+0LSNdAZ4FmOOAXPcU6mAV5XjqTlmfCPFkVMmA34BdfuGAj4YH35ORCd/?=
	=?us-ascii?Q?ixZ1bu+TDd7QcCulCdljlLkSFzGKQNLtcvtIaSZKCmScTVgRNGnoQhcih35H?=
	=?us-ascii?Q?I7nD2UV/4Zx1a+6z3Cmatax7G64ynnAqIliVnH4V4XC1HagLx/yJ6eXCF9w9?=
	=?us-ascii?Q?NX3GLzo7WOxP+E7sIB7uhGPZ+PUmR8RJqjav3b+xbTl5rxGU6BJ9J43Ta3j5?=
	=?us-ascii?Q?uILskcBtDTu+BQqIWCM58I7GNcvdKab4v15snHw8lMVLz7x9bPuBoL0WfrrR?=
	=?us-ascii?Q?t+sueGrhXeYz8kd92nVBeIfZPmlTv1mvetswupO2v7dD+NxBXQeX5FMIAt8M?=
	=?us-ascii?Q?8diRNxRv3oNVW1Pq0SNIWT3uF1igrNv+Gj1C1T4bsNQfN0+AIRysn5TS5yHH?=
	=?us-ascii?Q?MO8nJeyWsUBbNKp74L/X6cHmgNYIp0+4YY6c33YUxphayELdnn7LcIB0T4IM?=
	=?us-ascii?Q?rb/7Dk5C4Y65JW2XFfZpb46DN/za2EJ81bwGItgQZ4iaZLhcmFpsg/WtgWUF?=
	=?us-ascii?Q?oR0iT6JAh2hmDT+v+NvSleHpZ2DE9gZzwXHdvQU7qw2ds0aTIcexpUHAlvhR?=
	=?us-ascii?Q?0jl5B0uCOBQeXQ4Lx1Nw5u43Y9oFVQSqKlUsV25zMx+3zvTmE24Q8H7yS7wG?=
	=?us-ascii?Q?Ik8j3dfrNiGYns/AZ46s5qxYud1AWW4d6g0qJPv1+JU5PG+/3R8VcM/3Tm/H?=
	=?us-ascii?Q?70sL8qEfZSw/Xvk1TAHvC2n87h0qH9lwN5T8eYW0ZisQ9P1bCt/gyhbhy6Q+?=
	=?us-ascii?Q?8iFuxxpBxK04Dxw8XNXd0nZnlIWXl/etjvbE3Fqxwq0Ww6GittM+fzS60pTz?=
	=?us-ascii?Q?XefVUtx7R+ZE4whf2A6Z9qJqEHy9RV06VRzTAHH+Zw2GRRnkpj3jfZwHIQn/?=
	=?us-ascii?Q?E7/4wl8F6rMitAg2u0a241A9KbAvveOVjdDXIM0wvtTHnZlNnkg+r+ZUDc2m?=
	=?us-ascii?Q?mr61PwrdMAYe8cE07MOjgnywFQOVF4GLTkOlgnG5PvvK7VOVkZrwWVuWv1nC?=
	=?us-ascii?Q?jsXjX1pGUHPkYvLSS1Vcw31RXPndZYSor5zEFAWRsQ0HMKnecoxCqb4yeOc7?=
	=?us-ascii?Q?BZTQbWB2lAIPcENU+lrkw9ez9RJqIMo60EOWpPTB69gA6+0Un2s1qVX4QHoy?=
	=?us-ascii?Q?VayDyEUjsgVaX+uP/hqImZE1qsO9HhTvDWV/ojkz7?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:CUr1RjnPIy5KKoLi43cdTPOh8GrbXQHBjYNI1stXNm+DIfo96xy4NwUUlgfCMjRzIC36jxq+JZXZwRTo2vFZjewYWRcHbIggpB7UVnd0t4eyKusD9FnwpZfyARPIEUKRImrjmrcaZU/JCUDI1njHuA==;
	24:JAllhLRjGlNrLCjP1DgyN1xGnQcjZA42Eo7EgFTdVMx6L2fxq542bsEfb9H7yFrY0yH+kZQTpOHRTBGLzKIuJkYDdaa+A1zGhf1E9N/eoT0=;
	20:JSSfP6uhcsTfekUTScs9rNwVKLyk9KcCeIG7Bct5zqy2UIvFAj3/71RpsldVMf4sJ3jJZ1Xk6wq4wmdQGRA+SA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:44.6359 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH v7 05/11] gstreamer1.0-plugins-base: Add videoencoder related patch
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


