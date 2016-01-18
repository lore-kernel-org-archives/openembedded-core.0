Return-Path: <B54851@freescale.com>
X-Greylist: delayed 864 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 09:50:02 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0137.outbound.protection.outlook.com [157.56.111.137])
	by mail.openembedded.org (Postfix) with ESMTP id 7F36B73175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:02 +0000 (UTC)
Received: from CH1PR03CA004.namprd03.prod.outlook.com (10.255.156.149) by
	CY1PR0301MB1178.namprd03.prod.outlook.com (10.160.165.21) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:52 +0000
Received: from BN1BFFO11FD024.protection.gbl (10.255.156.132) by
	CH1PR03CA004.outlook.office365.com (10.255.156.149) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:51 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD024.mail.protection.outlook.com (10.58.144.87) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:51 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROh015522; Mon, 18 Jan 2016 02:35:50 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:33:01 +0800
Message-ID: <1453109582-25485-13-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD024;
	1:lyO1H5nwDjkm0B3CLKS5t1CGV0pyEqUkjNAcHtgTedN9r/QE4yNSFWLJn4ML8qXQESu6YfmUFQOXHcDCxJ2WnBAkiiNXq2qdQlCfXBUFH9Ll0OzJhBBenMCe1GBtmN0qn9Qo8mHMJ/JreDdeTL+SyEeUQ8Gj2A+SQklNxSOtx4w4tOwOLtAnSBPWa+aP0R2V2P/Qv0UAAvdJ6I55luncU1qNPN4zdApsiIhBMo8y+2tDq0DyPQAz56gPZ4cP6IAe4TsZCMWWYtW6LCJLyUe455AUvtqjEjEVLgkdbtEpSUdB57NK/6GB7R8hSHchqvdYx3slSM/5uOoS8WTdy+DzprkDL6/DJre/5TmPuFECh5OH8fi3y/88mbUSb+M1rp72747k/3PTm/8jyDYF35fCk7VGuUw/3dhT0KjrePTnFBc=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(2980300002)(448002)(199003)(189002)(47776003)(85326001)(189998001)(106466001)(5008740100001)(2351001)(229853001)(50226001)(48376002)(87936001)(1220700001)(1096002)(5003940100001)(2906002)(36756003)(586003)(11100500001)(4001430100002)(4326007)(92566002)(33646002)(230783001)(6806005)(19580395003)(104016004)(19580405001)(5001960100002)(50466002)(2950100001)(97736004)(50986999)(76176999)(81156007)(110136002)(77096005)(107886002)(15975445007)(450100001)(86362001)(575784001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1178;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 310939ea-045a-4270-00fc-08d31feac16b
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	2:GyxY1RTzwGhmQKaOMedDfvDzp7gP01dynmtBf85YP5qmHq+XFkC9ptiJ27giJfe86ikeVaSVciOk2yWlGlDz2sogw3zfm9zTvVYeQ2So8OCJIb3dYUh9JHCXwFeuBIdZuUfCb4O/fiXQUHUD9yreHF3ARk5j/KhoGcfCEF+fzLJroy3j7CaHJg0ZYVAz+dEO;
	3:OThUZ1fZ36ASHnveI9etk3jdvCUMLNQXlKjXTNdorxTRTQAVzEOubc18ZLTsx0L/OFrxULz0bFCzcgSdEp1Obe1zHQrKSalhE9XnUtmcU4AD0Qa/iD5E4sji7yblUNor4MfdYKo+fmqb0vddIqd/jTYmOVZEPSXAtzeIquLCw1VA0cLullifHin7wRHgBayJssfJBpqjTo7/I4/BusyrheVqoHKPXA+mg3lK4+DWUMk=;
	25:/SR6j4N2oyYuKdZzDfDrgSmNZ7rBh3Bsw56D3Cby/H6ZyPzWq1KSmW5fm1240ns8HSmCB738P5Lugspma9S0DBat3LEUHgG40vZpUEIdRF5085zSj8vV9lg4iONX1rbM3x2igJggNDfmZEbqfcp1fCGGULpKwlidmyN+omJJcwuNvc4kXaATXlYrb0KSpOXqAoRQVDtSu0FxlE5irUCk5d2bKqG0Oq8BsrgsATQkoai0pbzXgsRmceQ4DgXMpwUz
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1178; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	20:oJ2PFyy7Q1e/xvEcuFQlyMuOLf9gMOIIa7mwHGqAZ88dz+E23L2uCxL9Wvt/BZuyNYWVclRZdMsdk5w+oVjfi6DMzINb83QF7uNSCDiCup9h04uspVv9G73p1QVZRfAa24XsdqlJqMsUqT8uv+BvDoDsGg7BXoiAtMKDEbhemYHiXSW8XrJ9E/8bL5X45UitK+ZVCmh6Iloskskg5a6fFokktuSmsCO3ImWWfW4cUWi6HYZzbdNNOgatyP23axNeBYO2OdgmomwsF5z457U60IsDTU0Xwwc7JpuqP4Rm7TlIjSToLTde1ARVSMiYVse0cZkqK92nTqMroJgb+W4iQ38zNAO37Xdxq5HbjI3kyJnuZn3LH35ShbZXrOogbSYrCW3Fs5Y9pHGq76Th4tmHgm2RmXdjSzb+GGJ9FkJ0hA9NUlniU82qQAgimedVRBhW;
	4:S/nBXRe0E/MgYcvDaMsaxRqzns8xzyX+rvh+A9ksx3OGKkpjvNcXiEJzQgiyMz3ky8UJLimeymRUGYjYGTgiBqWAT79z6d9iRUHMwiAvRm/OZyFzIwhzdqDe2UYkEQSthHWnujLaIzPX54+4XvL59YcbTtpvU8SSscXAqiWxOIx+Mn2feNSM5U+76wPQoGmlTiW8ONTb4rP0jUIVJlmB9zfPtl3q1kFwghWyuAe9tmTh2DGqZwzGBhkiqTAWlzKvD+29cHnCgBux0+87v6ciy98nhfJpuBhM79fhuSdLARKssFXjdYPbQ+N3Y0F/wwR4imgxxfa8a4bp0g5xjX747Im899DV8DKLfTst+gQ8WSZiBDbxA+XHgPr+GcIshPAT5iSZuRWx3jIWo20R1wowLPV5XFjlWofQS7R5eFTQdXOUgR2g1YTykESN+4YZYvM14y7XTIj07lv4xUITfzoBKJ9c5NyWKkEE4o8vyiErzoVfTfykPLgTswi5jxq53vOh
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1178288FBCEE428518FFDB6886C00@CY1PR0301MB1178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:CY1PR0301MB1178; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1178; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1178;
	23:1ACHttenfud48pd4l18LeuTRTUID91Xx2h2np4h?=
	=?us-ascii?Q?8qQIP3/xCLU9TzWrE1BNlbCeS+kuVhCIhdclEhihynuBcHnsJ5uGnvdryOga?=
	=?us-ascii?Q?4nm+WxMEDtlOOjCMHEBaNfStAgvsFjzLE5OZ9uMQOdRdvzfpO7YZLUV4HcyD?=
	=?us-ascii?Q?KS+Z8WV/E6dNeULxFdAKeXmxl9M1Obd8PTeImzem3FN7q35v+lefbgffu6e2?=
	=?us-ascii?Q?gvcUHa1mdePyhqmBMSOLC50Q7A6j6qIroMNlgDO0KfqcKgR6EXlBcX8aLX2y?=
	=?us-ascii?Q?W3QKbxt1fHq/WFrKnQcbp/y0CNU6pmZqU7dThUCk2RJZSATEeNkjsax35cvk?=
	=?us-ascii?Q?OhxeokWzJzolnLJi/ZxTynHCElsYk/1dt08m9OZ2Xh2MV2av4pIyF4ptTpue?=
	=?us-ascii?Q?NJYcNh7IrY1R0lpjKJknJizqsncWQaq5qDiAGz6vBoNVMbPAa/3r+syJpCJN?=
	=?us-ascii?Q?eYZbjCTm5ihcO+mpjNDmh1L9JZM0ckuvRBQzT5LBYNqvp08Y9v1ZyLsPddoh?=
	=?us-ascii?Q?u8D32lS3pSohbQ4l5GFnZUh2zxim5ETbyKridWbvQOAVjZ+DDcjpBbnPEOhh?=
	=?us-ascii?Q?FkqGDyg/gi3L02hI1l/lyeIwi5M7GiYqq8pcp+pwkytkB2qMkOfD93qbyAxU?=
	=?us-ascii?Q?5dbcwLKvb2eeCAsehqwFe7z7kj00GwO0y6MgViqBssrHyPmJtahL5hcb1Qks?=
	=?us-ascii?Q?xQ2NthXrIwAPmGetLmvnKZcWCGU4Kck7le08yFdQkJgbnl8eOUZf9gj/3cEc?=
	=?us-ascii?Q?iJR86dlswZQUhM7UW3ZT5sCa44UE+2FGY6FLEMAW3OMTwYRGk44bI42/Y04C?=
	=?us-ascii?Q?OL8FbRUYlallr2ojpGzxwGmwGGQpfoUW6E62xRU74RATP105fWzsb9R+Fhoe?=
	=?us-ascii?Q?xZBAxSMrwKZBGjc4Q2VMsKrF6sUOzmQEISAcn2GFWSphGH2kDi9U/zfXZV3W?=
	=?us-ascii?Q?9cSKu9813KDpt9IszlsP85GsdjthfiAQ6a2fCwzBUhalLpUQ/453B8qxqxSM?=
	=?us-ascii?Q?27p5Qosuyb4dXQNk5Dn2CQIoTRVef81Fv5Q5vloP9GbaXv3VlA4sKHl8qKe/?=
	=?us-ascii?Q?JT+4YhrCT119wlN07bUTZy/JqZaW1TcNtCbfDnyO2fQS95r41uC1TWRhHUJ1?=
	=?us-ascii?Q?r+1H+s/8j8qM5EuSiAqQV1bCqslIqLGbQ6PIZLVCZPr4GmOB1ZtZRrpnX/TY?=
	=?us-ascii?Q?XrtHWpC1cLLSHfy9S2gt/8P6bB0U0HRbxL7crXOPgJ0Q3iEkME98zY8GralU?=
	=?us-ascii?Q?fuLYpZvZBHVDgdQ9dKiM/MMoTH1MRiZOOZNTexFJ6?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	5:tGuOb3QQrBv4jWQlVfYGKoZBVzFyOTl+G4L6/BYOz8vd51ORi0xktpDWGtup/iHFAqh+aW1pUM+t0QrAWrZri7zQPeQkTEy1dRsbhQF7Cr+ZzQNLntFrbpdLyxYhP60SUhEi7+hngjr3UEX9zsam1A==;
	24:CM4i7p1YaPaXAGcv58j6lN+zxHW2aiywuJToDUy3eddvoKhr0lNU7KlgMjwb+QiO0JM+oBFnVFJrCR05EaGJwAuZr5VOHYcFZe2GmyTCjCA=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:51.5011 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1178
Subject: [poky][PATCH 12/13] gstreamer1.0-plugins-bad: Fix memory leak of navigation thread in glwindow
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:04 -0000
Content-Type: text/plain

When exit navigation thread, call g_thread_join() to release
the resource which is hold by it.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...window-fix-memory-leak-of-navigation-thre.patch | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
new file mode 100755
index 0000000..60866bf
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
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
+Upstream-Status: Pending
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
index a75d1e9..280ec26 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch \
             file://0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch \
             file://0006-opencv-Add-video-stitching-support-based-on-Open-CV.patch \
+            file://0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


