Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0134.outbound.protection.outlook.com [157.56.110.134])
	by mail.openembedded.org (Postfix) with ESMTP id 256EC763F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:26:13 +0000 (UTC)
Received: from DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) by
	DM2PR0301MB0880.namprd03.prod.outlook.com (10.160.216.142) with
	Microsoft
	SMTP Server (TLS) id 15.1.219.17; Wed, 29 Jul 2015 10:26:13 +0000
Received: from BY2PR03CA061.namprd03.prod.outlook.com (10.141.249.34) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 10:26:12 +0000
Received: from BY2FFO11FD032.protection.gbl (2a01:111:f400:7c0c::110) by
	BY2PR03CA061.outlook.office365.com (2a01:111:e400:2c5d::34) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:11 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD032.mail.protection.outlook.com (10.1.14.210) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:11 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TAPtZP004765; Wed, 29 Jul 2015 03:26:09 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 02:25:39 +0800
Message-ID: <1438194339-13618-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438194339-13618-1-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD032;
	1:x5pleZf87nsMx/6cPUadGXI4ue5yhB6Iozo8egw674bnyjbjB5lrO1dqxu568syJfD2xe+t6Q1xJT9BQicTkL+X0lIWhwlxzFhYAyCNs8mskk5jhHnkT9sjCdEhen7yVFD1GU7CAtiemLSdcE4tzinpnUToOWSjswU4SvBlFG1Yppd5LGMCd+vmoxMLCSVOK5TAI1RPiUV3mPRIkgJYqiOBwdx9QWli/qo2uJzA4ViFNU91pU1uWTWJ0P+WLLdhvpVwJXlu3aOEUdoGUMQ9YAKmRDx6VKLvj4gvuXISuS7sn7pgqzMPQLv340mt3sJ9MJBJrwp5v/2UpSMwRYxtcsg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(15975445007)(189998001)(76176999)(50466002)(2351001)(6806004)(5001960100002)(229853001)(50226001)(19580395003)(105606002)(33646002)(19580405001)(104016003)(77096005)(48376002)(230783001)(77156002)(86362001)(107886002)(62966003)(50986999)(87936001)(575784001)(110136002)(46102003)(47776003)(92566002)(2950100001)(85426001)(36756003)(5001920100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:5lF2Guq4IXb4/Varm+Bf5fQ8kmtGTXz74lmjLsXD7kWErtS2IOEoW9MXFXyuOPhv/3L0pNlg/JdQ2GBPlIS0i3MwC6Z+uR7bqhDvITLixdfUwqpuAZYEEnn/x/tKtmKycnVAWHMnSIr/7BpDq3JVTR1MLkQQPxRXn8jmF35Hbrs=;
	3:3CtjByvGY0SsD/VaoivPtxkiqEX3ZhJpZhM9aiMFOlsd+V6czQBuPedeAfKg4jxCGxVoGmpAjsYzUpZUqc03VIYtrIDCA+dVupERJ+3MOG3ZPNcJcS/Wjz5St2nHV2gqMBo7HpZt5GWq5s6nSOuAzq0GVGu/M/UKkl/uZjY1RowDpq2FHVEZu1iLFB6/kdbePQH8HnCQSgSa+3mpKRp+8RcwtWzvJgm3c4LDptnuBVg=;
	25:Ye1xUiquEIeTx0ugXuxWzH+r1hbDocmjX5Tydsyuj49XmbQKGB9LeqQCxQu7INHRmopTARBMdfslryNAfqzCRShuECFpTiKcXTWRV2qWDa8h373ESP7UZhB4Yx3aRep6SYL2VwMCDEJssHVYOuZhjgEdag+Ya8dM8Ot4TAB93CSkBdiHRyYydrdnPwa5dx5ey94Z/JNW/8T85CJKAv7NwpLJaqGgwzz0yeb0nKaQj5qEj/GogM6vFpgufT9DXJ4XPV8+rPklvyDlvh5hCxYCAg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1181;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0880; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:MQowEsA2MJUm4sp57lZLzfX5PX49C0ZxfqlY4c3rqdbFA2Cjth0hLqe0CpC/4kwHjkRQXrruxCYFud7D/YQJObmI00BMP+0bFCbYsAO1WA6Iqp16CozOnaGjiXoI4iXtXFwMUQxnBokO0qJDi6Ekg0R87GnRHeAzR2H1HePYxOVUGcwjJmTlApmw38ehwZNAEYdn1pr+/5yUG2Kenby/nOgvMWzcQ+i96t8q/RLEcASNgxVYpfKMtpXLSQqf7L5hr+NMm07M5wQ4rBCvxsIdEym4gAHToH13kpRMapmRI8wY1I9MIbjMbujuIKZBurgmQt4D/tPQ4nzF9BX/xmfI8UZi8JX/TG/132+RyGsnzUI=;
	4:FU0zbnEnVilCiMcrl/KKuSjVSJS2tmXUFnKF+nXp96LcMMc5+XyJ3AJsX4GrECRIHF9HJS7Xb0L7J+kLl5gaiTcHlSGAxH2aG/PHoPhQ2nYgV+6uosc2r7sTdEfkyKhv6UUNj6tDPgai/Ofx53nC3gPK//eL0LNaur47dCM2OxAF2Y2ItSVkuHaOvJZP5hT0Nz8djNKUb5kS66PN0KCHpvtFIlfQXqQGdohXjwYP+qnLhjb6wEM5hirxK0/RPB6rASA1yUUAId/Hawl0CcOlzT2LcZP+bnrrsvT9PoMsmIY=
DM2PR0301MB1181: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1181CFCB5B4EABE71A4BD87F868C0@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1181; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:KpJDoqVq+EOM+NhuWN5EYPz1XfknZsNGhbSkJLc?=
	=?us-ascii?Q?4qP8n5xH5oo74P4FdWqlLtR2andxM0+lRkTJYsxHts8BzD0WRoK3ocrNlZ6I?=
	=?us-ascii?Q?nno+nACKKFCbboBdqZIRlNF0OShYs7lXU66qFBTHvdU2jEzww5uJo3npcOli?=
	=?us-ascii?Q?Go4MUPgnF4Rhv6fI8+K61XNqmH5+F0qUD2jxdnQ+3AISZzv4P8Klbp1ZWmHm?=
	=?us-ascii?Q?yfeGKVAARVahS6sYqjZbydqTfxVnNTUAtkZzxtWw0G7TtvSFz9Wh6Br/1B5U?=
	=?us-ascii?Q?IfqhmA32zjs56Lo2p8t3gOCC2otwIPcl00+ufoarZkNRwPHerFPoXIBoSbJN?=
	=?us-ascii?Q?koPDgpeLHQHZSKurH3GN+EJ/XMgFrhx4Eo3yCb1h3NsOZzcEQ7rBxuVVzonm?=
	=?us-ascii?Q?RNifgHJt43PmtDcLDChIS9WK+naQPqJooA+KA9lHkzLcc6sMUEpKguN7VCHp?=
	=?us-ascii?Q?/PiK8DydbjqdVeAKhMDrKpNixo06FwufnAwvaem7jBYG95DjsbK4+Qwz9KOE?=
	=?us-ascii?Q?l4zkCiz5/+/U+w8KB/t+mwfuoPkm6yY4WE5gv5PmNnCgLwE1iTJj/myWC786?=
	=?us-ascii?Q?wVrU5jL/UGB/6mwW2GRFWdVGiYcA6lTBpSQlXKCpWqKE8B7qEOmWPG9YOCMZ?=
	=?us-ascii?Q?g0ncGRseF/+uKe6sp5XANv/D15QbggaDTOeYNE8z+uBDXKa3UHAgBCZKXXNU?=
	=?us-ascii?Q?mRT5MFCD0hEMtbLHcSQVQTB9eKbj9iD8YJSbRNARXMu3Z8o5vL/HyIplb0Cf?=
	=?us-ascii?Q?rOpR68y99Adtt/9sr4pncjPYXedmbkXczIDc4yUrMLWcpg7hqLAX8sIMSfMO?=
	=?us-ascii?Q?SAoOy8hw+E2s0FQELjwHK9CxM4VYz3yKP9f8+FLpAj1xjqyibJkcjuetxPYF?=
	=?us-ascii?Q?bCfOCMrQqidZYV6uOt/4nQmqP9e/uMOMZG4vdtTGRHqD3hDByJyd2Q5BX/yl?=
	=?us-ascii?Q?lFWcuQek+MVuhBbyoSuGj4XE2Bb2sklg+Af7lcFQL6vYu+K2HsdE/JWgWcgA?=
	=?us-ascii?Q?o4Boh1748NMSkUIY7UuznKoZ6?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:jldqvzP0vRbEUAWiWWu3oTnHE8A8zuoZvIUBlZwPJ3+f6u25uTgofxYd74SsI+wynoXS+jiBukOFwsi3avX4s/9l2WCnf0/VPflnJYEvQrBaCwcPPxyxTBNzsMYOAOMtt3Jpf2yy3DXjKX8Ueepzlg==;
	24:8CJVFUx/FcOuKwshRrqaWH9IVsRD7ODbodxvtniVMV+x6mS2mgCWgp2BZMeKdhDsd8imw760AQDmtMItkeRXHryuWHMhpEWcTAxAx0GpLVk=;
	20:F6oXyZoFrw2drVF5aSmhxS2bsuGY2QYP865lHDLNd3wkkGIEvRMDz/B0Ut/19rV+lvMax1JOOIdqxpJfJegK5g==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 10:26:11.4376 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0880;
	2:oWwPkVKrj+aiiraWQbMb/wwAK4OzlLeZCtM16IVIGsEU97gpQUAfEluhscAYZIi0;
	3:ItkCMHYTISFnXu8gJyEC/Tbj3oNlkdgucIEhfA6ETrChwJ38w2raLVS/5zz/AZGPmKVlQCjzvece7oacRYzXzLJ2ayTXrIYq/JYSEqdlR4qen9SvYXkKxYKFF0auqK5ZiiV+ncJkebAmQy5YjNwEOSFglahBRUgeA8SxlrTQPue1zXycLsV17D71iqTj3xomtMx7yH+rhOBNzDoweEPcRwJ1w4MagRJ4oGgQEC8IZMo=;
	25:MZ7ATNyzIpoeN0J2ieXw+qJar08sFPY89VBw6FXD9T/fJZZ/BvgN9RlOONkugMeX5tl8f9CLyp7uQ/L4ygAU0xqkcE7NFn2+jBIlVtT+d1pn92rkquSWz/v2hGs2scjyvsBMYRzgnL6GGx199NWn05Z2V26Ojr9sEvNLxL6JPLUqqoppz8JeUWeSmfiireTDj8CiO/R7gKnVwLsPnfvRTk5XeqXflnz32qGktNy46E3e4Dk5V5Luif3U2M5+YCAudNnQERkmA5CJfz+4DwrWeg==;
	23:SiyAKNnIGFlFVfkD/atal31qPp703qro2KJucPqro7Rxvu9U87QCidbvS6hWGxpxICloeuY60Hx4vUzpuZlAjjrOcZqpoqO5YBrTVC0u5rT4PW2GR85s16tRXj3pBIQN2GsbsuNc7+vJm2KUwSDWXv8uC7x+20jfyn6/iPSs2//GfRzgZK701oBgRD3PgnUSc1bxtB2adamlbhntHqHU+eE4yFImV8NHxrlGvTolZE3Oxf5sA15XILSIRbqeW3pt
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v4 5/5] gstreamer1.0-plugins-base: Add videoencoder related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 10:26:14 -0000
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
+Upstream-Status: Backport [1.5.1] 
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


