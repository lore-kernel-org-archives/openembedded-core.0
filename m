Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0104.outbound.protection.outlook.com [65.55.169.104])
	by mail.openembedded.org (Postfix) with ESMTP id C99C7731E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:41 +0000 (UTC)
Received: from BY2PR03CA011.namprd03.prod.outlook.com (10.255.93.28) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:40 +0000
Received: from BY2FFO11FD044.protection.gbl (10.255.93.4) by
	BY2PR03CA011.outlook.office365.com (10.255.93.28) with Microsoft SMTP
	Server (TLS) id 15.1.390.13 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:40 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD044.mail.protection.outlook.com (10.1.14.229) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:39 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RO004523; Wed, 20 Jan 2016 02:54:38 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:41 +0800
Message-ID: <1453283501-3982-8-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD044;
	1:NPCU3PHulp3IGp7xUVMe9x/COPvMPa1eRiGUBfk77a/nH/CNw3weN6ZBJ29EwtM3/mt1ai72NR8EBDBMhVyOeJPZ82OR+aAkRhM51JjuKlC69P60NY6gl5Rfou+CvwuuhZ9P614MyMcelUAQeLwK51qd/6Aa+vBP0YazVFyohUOMTFKTFFzUpxIl//yPZSMIEHYwmNAuNDHEVB9tgcBQnPviiQW1u41QN50OxZZraYiE0WhyUMN3sZQet8AMnd5R5xLeEUY9ric+7PSy5iUEbWJyv1Hfds4bRj5BlY1OnEQe9vWL/lcPx1avbYaGGrpDPfglAmTq87fTklGfKPLDsGeuSEQYPzuVCKc/lYkdxNwMD1aqUfzAB7kJQUQ3QYpe4YcesrS3MW5bxecTyoUaHuc8+rwSVKSvjU5xwUQ8IJ/WACu5Iom2/TLAokDXm9d+
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(4001430100002)(86362001)(106466001)(48376002)(2950100001)(575784001)(2351001)(4326007)(104016004)(97736004)(81156007)(50226001)(450100001)(2906002)(5001960100002)(47776003)(230783001)(1096002)(36756003)(50986999)(11100500001)(229853001)(50466002)(107886002)(110136002)(92566002)(15975445007)(76176999)(5008740100001)(19580395003)(189998001)(586003)(85326001)(6806005)(1220700001)(33646002)(5003940100001)(77096005)(19580405001)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: dd6b0855-3b97-49c4-9319-08d3217fb6af
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:JAzifrL5BQwFiHhxeCpBzPKhOYK/cx9FLe1zAxA/g5UG4aG3Pw1+7OhikN6b0DNSe4ir01ynf+qs5Psq9i+znfQZDciungZhq79xIvtb7j1TZVnvL8X8HWUQQBcU7kl5HWGmSToX3Yr5L4iU3uz1i8gXSiIonfV35o44eJomTcuifW2XcvVDwN/y8IINc5NE;
	3:/uJHgzERQODZYJpgZXaaTm745kOuft2Q06DqadlvvpHE+GtNFzoICJ4HoQtJE/B7VFl4qoYoe5IOM1IzxixrpI6pZCaEIIRzzXdKzTvuFsbHyD9cLl5877ki9KcEspTvKIl2YKNkbC5nZGxNNwLBISAJ8/7CMUQniCILwZk18ZsCaLn55cvLBYvjXCF+6h4jzWCijqVPKvI0P6QumOq9ce/XQPx4VUP79EDqODqcQ5o=;
	25:GMdUrb8AzvQT2K9Z4qGe8w9zpnIoszBMkW5xyfHRiLGmeQ+WdxL1uW64X3fJvfuzjv4go5wCTZOYKwf4Fgb0U+FYCiPcZ6BxsZN2Kf+0dM2Ep6Ad5OlUnKSDZG3ImnyzNpIy+R5CwA87bwwGpUuXwRlaCdaj+IgSDPr5U0POhmmquzk0F6NGz2hD32hkwKWGCU3uTNHt2ycy/va4J5FUrERBMqRZ6fkJJE8kOiL7VPWF7nivf8zrShz96WYmSQEe
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1174; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:eTu5DK8HqKktpclidGMjlsRFRu/CDpCaHBzLl4c3u8jyFXdkH7c9ZgafD3M1N/1+1HJTQkP9LLr62edobXtNE6nB4fvzI8HEDa9HnBQgui+jti7kiN2egK5OTh6N6GHl1Op2MWYv+dQ8ZO6GvNUY4GzW69JO8n7Fw8IdXFU523APQCh07mokWNv/KkTPFx26DPevUjg16C09nzv7iP4qEe4KrzQomMDhcIjeqeEw5RzA6JykxjGHUpgirAmpydEo9pU7dM4x6rtQHiUtydxBaVQvyND6C0EXbmYjJV4Nno0wdGCbFjr3II5dnn/6BeebrVMpqaiSn+Nc74+UShwsPNn1LuuWKuVKCYGZ/ZcN5g3imsGPDzuw/G0sEaRadq5cca4QdEGAHAZhKMEIZDhrb97QAgD4A8Za+Hf7IIWFrjgmzvp5sGm3euiE4GV7ZXr/
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1174AE4A736FFABF2FFE13FC86C20@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(520078)(13017025)(8121501046)(13024025)(13018025)(5005006)(13023025)(3002001)(10201501046);
	SRVR:BY1PR0301MB1174; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1174; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	4:4J0tf43XZdBkhr2AUkKS5Xsenhb6ShNWr1cHN3uxiBx3nLeJ+vPZKUs2Xq7XapolEwXcRjZBQ2SE1Th0NndNhHYgqHJKx7CQoHrgDQQPHnBBfjCE4UfwfJeslgIrjWPAPNKxmDv2jyLz0Nd0dSdzmdPGVEyq1EGZmnJcEydwFrNEKEcaiXwSeiPoSsppOBeai1N9KErm2WEUm3V0Zq6xwTvB5Mnkkr/UNAG8Djj6rraiAfKv2AdNC+CVeIC4dIZYOKaKD/GjhgAS6lyvpISmi4SZW0GXjGVvyUC5dnTwTezq0BOrG5/P/zYGKZNE1sEN55+90fCZa4BA6mq1bX++GvnthH+1/thnXa6t5FgTF14eG3YYnOxKnZeIm9r3iKrXkTmZzoYFYsdYjdJZHBCejrIUsEs+sKAuBZ+Zz6+yKBXmxQeheU31Jjb7Wrm//FdAB8CjsXyzRgQQbrxAAP4bGGv0U5JzSLCOcSzD065mIgP5k5yrg1losIdWUuJHazT2SZISavdZZ3GhP19fioAIVw==
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:DoZHVa0CVszX1NIPZ4hzZIpmRzF3yLk668ZQdAM?=
	=?us-ascii?Q?xl+RjL5viiFKTfjbNkKWwuVlpy3aUvqu/RwQT4GcvS8SOPnBh+CYlnRFhLuY?=
	=?us-ascii?Q?aabiA+k4JWyej5mLu4DiJtj8M3JFGX5zCiN5AgZfzczt77wL0fNqWKywYNTn?=
	=?us-ascii?Q?+hF4+WgU+rAbhSDPeJzRboPvEW4hZWB//1sJ7Al9SUR7MDV6MFzOe6NryrKS?=
	=?us-ascii?Q?ChdiSqu8gSXCylz5oJIEWb/r2vstLpUkkfFerAe6qe4AQj69T7iUCw8wbvcy?=
	=?us-ascii?Q?SN/5xL6lQuzbpBmXTSV9gEKFhcNZBggZq+G+N2qgfGJ1sWUIr5ahTdX4C5YD?=
	=?us-ascii?Q?dyMBsIn4RCAemb6eYkrV25bhelCUEbHEPWbh6S+xJdLgKwwSxdMOWjeC6ItH?=
	=?us-ascii?Q?7d64M+GuFKlmnF4QuhO4OlYdMeqg9nny+vkVPcPqe+JQvFM2jzYxNhkqnLOJ?=
	=?us-ascii?Q?8gLv18plZ5vyZjg9+XvLeKRnX/jdlACUPNoM0jnORjqgrpzINCYA5c9WV1VW?=
	=?us-ascii?Q?mPCQxpPsZ49Q1rfQbhBE3PKAetilmz9sd8tAe9vpZRbxmrDLOqBqynpfshWk?=
	=?us-ascii?Q?8W+lq+qSuqL9wVKd8WrsQLakKgWBGABh2olEBWwgVc9ajOg0ncUIWZcPdst4?=
	=?us-ascii?Q?I/avtTUJgld31eNe/0emnbWECjfR51/9kYj3wf+r7JacP0XVU7ia/3TpLeGH?=
	=?us-ascii?Q?BzbCzM9jsQGYTL/J/feRt4RjQqye2fRctqhWJJuk8Zvy9K1kmea3o1IWIdXL?=
	=?us-ascii?Q?RIOqnkwS2dUYpWelMMEH+hyBG9Wi2LLrgOnSOQuXnbGrVsvGCE0Dg3l3/A9b?=
	=?us-ascii?Q?iftztBn46lwSGuUcDQ6tSELk82C8M7zpTvrqZNqPDcMb0f3ntC/WfYjFrKoj?=
	=?us-ascii?Q?iU6vkT9NHL31ADIaCWfk4gpf33Ea6BTdlXplOrQAeQ7yo1yPyQkW5bYeq8z9?=
	=?us-ascii?Q?SNDMIkMYCHEpGJKp/ohA0Yfbi/zR/UelyKkJ0VsCv5cj/5BKEHphE1IDDYok?=
	=?us-ascii?Q?H71aGS4yyE/gfGGtTMwvt3ZZ2dRhTCvS3nMdlOrXjQrSNUo1IZgDLT8+y8r/?=
	=?us-ascii?Q?W1gmKUNPuin9xMPAUM7ATkNBaMCJIwNZY/LLITTfh/BOc8GvW1yIh+tQuFzD?=
	=?us-ascii?Q?M9T2ej8JL4iBJC6Ln0tiPFuNZpJTpgbThDaMxZy8sWIqIuQsE9GgP7nOCUN+?=
	=?us-ascii?Q?JNC1kmhA55Bt9ygU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:0uLY5Gmbb+2jT4Z27gpurXBkfvcSz3XYCeGpUYBkNngC2Ruw5trdLwJMCjU5WypPl61xqeZCtmk85o7qKbPNz5+Wqq4dG/7zexeqaerB5uBecBcgvQOuvxrsKdrPE7AHGQp1lahroSuBEFwKe3GRdA==;
	24:8vkrF2O3ug63oAvAixaHNWAGEI+ZrFbhRcQR6fxEC4bftYzxpgV2U4UAh/hiKBCmjlhELjAySiV3r+NXSYLYw0FisrBY+iEqrq+c6ZLLFac=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:39.7022 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky][PATCH v2 7/7] gstreamer1.0-plugins-bad: Fix memory leak of navigation thread
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:42 -0000
Content-Type: text/plain

When exit navigation thread, call g_thread_join() to release
the resource hold by it.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...window-fix-memory-leak-of-navigation-thre.patch | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
new file mode 100755
index 0000000..3491a15
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
@@ -0,0 +1,35 @@
+From 95cda7fbcf1a81289d9315c801c8e2b3d896f4cb Mon Sep 17 00:00:00 2001
+From: Haihua Hu <b55597@freescale.com>
+Date: Mon, 30 Nov 2015 09:36:09 +0800
+Subject: [PATCH 2/5] [glplugin] glwindow: fix memory leak of navigation
+ thread
+
+When exit navigation thread, call g_thread_join() to release
+the resource hold by it.
+
+Upstream-Status: Backport [1.7.1]
+
+bugzilla URL: https://bugzilla.gnome.org/show_bug.cgi?id=758820
+
+Signed-off-by: Haihua Hu <b55597@freescale.com>
+---
+ gst-libs/gst/gl/gstglwindow.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gst-libs/gst/gl/gstglwindow.c b/gst-libs/gst/gl/gstglwindow.c
+index 44b74ca..42ef296 100644
+--- a/gst-libs/gst/gl/gstglwindow.c
++++ b/gst-libs/gst/gl/gstglwindow.c
+@@ -343,6 +343,9 @@ gst_gl_window_finalize (GObject * object)
+     while (window->nav_alive) {
+       g_cond_wait (&window->nav_destroy_cond, &window->nav_lock);
+     }
++    /* release resource hold by navigation thread */
++    g_thread_join(window->priv->navigation_thread);
++    window->priv->navigation_thread = NULL;
+     g_mutex_unlock (&window->nav_lock);
+   }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 4628018..0e67fe5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
             file://0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch \
             file://0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch \
+            file://0005-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


