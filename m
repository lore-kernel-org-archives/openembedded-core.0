Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0144.outbound.protection.outlook.com [157.56.110.144])
	by mail.openembedded.org (Postfix) with ESMTP id ED87C771DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:05:34 +0000 (UTC)
Received: from CH1PR03CA008.namprd03.prod.outlook.com (10.255.156.153) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Thu, 28 Jan 2016 09:05:33 +0000
Received: from BY2FFO11OLC004.protection.gbl (10.255.156.132) by
	CH1PR03CA008.outlook.office365.com (10.255.156.153) with Microsoft SMTP
	Server (TLS) id 15.1.390.13 via Frontend Transport;
	Thu, 28 Jan 2016 09:05:32 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC004.mail.protection.outlook.com (10.1.15.184) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 28 Jan 2016 09:05:32 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0S95RjC031680; Thu, 28 Jan 2016 02:05:31 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 17:02:47 +0800
Message-ID: <1453971768-27844-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453971768-27844-1-git-send-email-b54851@freescale.com>
References: <1453971768-27844-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC004;
	1:PfMmSDIkdED4sdHEZ/5FO7NlhxPtXdze9X9Bc2ivMAfbSjjUL6bX2yBeUrZxY1X2K7sGd5hP/NdLQ6b2lRQgu7iAYSl/t/R12N7iPhPC172Xjixe8SZZy633+C8roR3hTGgYd/2jAJsdwyMw4ZksjQJdRdJeS21k2Dt1Q7OZovbnnbLmvwgWO4MuB04UJwb/6hO+LNT46FDa3TIv/YbrXJkzK1r8aiop+eUVr+D/hU0sznE6enFRMMb8oIout77EkpQRau+2BxTw1zjHo2sJVkLtwUrtCHPYLuLYccqiM0z0n0hxgGDpilG/umHsqio+7zrIhS9tyPt1YRSmSUCwvo/AYMZYZ27T1KJDcigSIcz6E4F6+vMTXKdhEuZGVvE/ckES9Ruaqzt3GTqhq56zIithyqUpLXxmLon1+HWi6lxbQqCQbMx1gFf9knNGU8wJ
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(77096005)(450100001)(15975445007)(48376002)(586003)(47776003)(33646002)(86362001)(229853001)(36756003)(5003940100001)(4326007)(19580395003)(5008740100001)(2906002)(81156007)(97736004)(19580405001)(230783001)(87936001)(2950100001)(92566002)(6806005)(50986999)(76176999)(85326001)(4001430100002)(50466002)(106466001)(189998001)(104016004)(5001960100002)(50226001)(3470700001)(110136002)(107886002)(11100500001)(1096002)(1220700001)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c5020c97-f66f-459f-e7d2-08d327c22d62
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:k5/zC/wMASY66PL3NrSQWhhWD5Fo+lNtDffbEYc2gy6nzt2b8qZGXHRffo68XxDmOOEns6e8IFhEhX5m7pmHSjgPbmLYiVa/fBfFhfJmTBNtjK3Wiu5Y/3S3d63JBdUg8fDMmnQ1V/G1bRB42MznrU/tbVDn7H45kDgR4vyroy6PWGgNrDqwoLvMGiJ9qcCB;
	3:STVUZsjZC8GyurkTGQISAeUWjQcEEtjM0vnSy2qGSZvpfxQW2F7mDSCnDtSYhrZVvXrhrF31Ei5x3O+10JWroVo9NjKVs9KgJX59FZkWYSotCYaQAHcEwY03H+GU5DJZPPQeWAZj5cJlaIJ9xbykUPXu3zEYLAvZ8byp+vQuTEU2k60wZDmRNEnyzqOmePNsZpgUMPUXV8JRhIptYU5mvx+BjfirACgcCBlcJ2WKpGo=;
	25:t2bUY6R0C1Sgbr/X5V4Ix5+HVF+GO/IQOnNSgu7G6rcPX0dkUT0UMdevLuy9NSyXl9XIbolha8kYe4dbiPac4/rpCMckEdzlve4fh0c/faaWbbzZsvmTmenWMvRXMPXzmVGS0m1BFC9Jr+488HI0ius/Vrua3skn809z3u9xW3JOewg83tJr8HKguga0ubx40mJeqDX7VjgSEk64r+gV2y9kkGRdtGehEJnwdKkGX9ik8H4+PBW3kFkp8o+BxYZr
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1169; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:vhgitW2c+WHut5jOBB0mDPtGEhMM4NEdhFGdFXb3w4Qva96U0UZpOytu39lk6IxdtVSF2FiHepZ9LeoaWoc/twl33BMcdZ1GiFO/v6LjATXIOXKpO7ADhTjEK+mX9lKbBI6sC3wkyhvuyMoluK3NzI+p2UB7feRuIXqiFNBgGsrtDeGWIuid147DUTHjpMdhMkxcNjWi+nBY+z3h/XdRZOK6bU5hTNE8gbgFHd3yqhxgHnxAIxKtOe2o++C/GiVR0fhow5irgI7VFJlfO0na+DQOOE78GITEhmXz9nMu+fWZe7K2PppEQ8K4JUPA9dQzSu6JFGqxKxG2EBjXwZdZlxI/M0YjREpv357u6s4DR+P0ZXPqkMMcX9O/nPD2v82Ynu3VsbduILiYlfL2E1LcxraOxVIHY/DL9jn2lJTdolA9PjySeGXudUdSsFhvdrgs;
	4:7jGf/J6lnvKAVDdwzZ24V1yYho6+ZPiqU7qtKEUXpfzeH6JJb3RxJb6+pubUNCbXZhvaE5bnnPVEjnw3D9F2+gdwMIXPmvlmEp9gXgTWRIvy5cNpMztN7DVNowHkPcTLKdsozsHeFtVyOErabU9Ys1OvZ8g+SLdMdKja9+AA0kS6qrgJ+xGcL8CsAyPCGqiNOxrRd+Qvki1ytUWTr8iR4IvHEULgnb7TT02zMn2hzdkAJXbl+Wl1wOKmPGhXKQ/Bg3borAFxDo6/N/LZZFeqVtKQHFf8hUt3tPjrppsxmIeEgy0fL7eq1mnkof1HleNlaBalRqRj4oEJo806/Na7oSuzk3Ch0SWlPTBMElzdBK4L3et7jPfskrBjcVmrePqbaiXKoffgwStF4bugI8qKx5AIj0LtXy0l/0E99ZcQkLoYyjOCGBTYwv7PnaNuUfq1MvTulJm7j4hqVmflmYtOcj1zg4v/NjpMVNXzq6jN4DHhuo2S3xkIAxd99v1YaRax
X-Microsoft-Antispam-PRVS: <BN3PR0301MB11698DF94A1C8C31C10BDBB986DA0@BN3PR0301MB1169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13023025)(8121501046)(13024025)(13018025)(13017025)(5005006)(3002001)(10201501046);
	SRVR:BN3PR0301MB1169; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1169; 
X-Forefront-PRVS: 083526BF8A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:6UbxKRDWEvn70uP4gIBr31VeT23vtZ11VI0bTkg?=
	=?us-ascii?Q?HKg0N2f9Y9Px/AOJHXfVv1gGnqMCiYgrzIckxyaiGdN68q7d144ZIadyXkpT?=
	=?us-ascii?Q?ATPxW40LqTZC5NqFMf8qoAAOmXd+uiA8uGVJ452azA+muBeM3nFcVbtJI1Ao?=
	=?us-ascii?Q?6tZP+aHeRy66DAGkBv1nyuHqp7QixAxCoWGhiyUAGv4OSgnmcCApzM4lB08Z?=
	=?us-ascii?Q?81/8DzH0SF/Y33FuSPYmKG058jX9aDdft+R29GObhJ7Kls1PH2s6+uMZ5jB9?=
	=?us-ascii?Q?RjDMk5glVnNu5V1EPGRmLxaGkjprTYlZ48XgxZtWm4T7h1kP3ImRkMg0os+H?=
	=?us-ascii?Q?W4Apt7fTMWcN6P+ZDgt+a443EXBjtOcEgKqpAPnO/PFIDcxQYXBpBpi2B1SO?=
	=?us-ascii?Q?wrhS81bvKo8Yqc5VV7pDxINUgwG3jVbXWerBSxVhnk36cMMewVaTwBydGDZ2?=
	=?us-ascii?Q?BLQ6c7dwU7OZXSH/SoRAdthwPXpUsnXMOgNhKbzBZu0WDCQIAtW3pi0fCcAU?=
	=?us-ascii?Q?sdlEncjvYQyYqVsOeZSDdzhq+F2MWIzrDFdg+gOq13i+rJ3Thn+jhYg1Upua?=
	=?us-ascii?Q?lEiyk9MWOTMpcVAK1XX+I4BWzdR+6yUnWLzbln/2YDbYu4JQ07nMgfQyRT2p?=
	=?us-ascii?Q?CFcl6t/B47UhubwxP7LMmMlssXyR6nOGT/4AGQYIxQzwDD9dX1pzRaEfA9fS?=
	=?us-ascii?Q?sXnx830PVH6iNvzOBdjMJi+qPokVFQBumT7dDoS5H7DEHHJtySLS7dUJ1aDw?=
	=?us-ascii?Q?P3+5AwIHV3G7kk7KFs243K7OFsgL5aUmiY1QNwwF/mmgqrTu9a1F61nhaAWW?=
	=?us-ascii?Q?XdArU7SnDUMsQMMUD7x6zqVCJT0HRYhjTqqObudc/7pjxt2JF0EpFSxRuC1i?=
	=?us-ascii?Q?wRMDIlLVo4SJxaHVjwz6mzBSuwirIZ+Hu4/tFrIkbR2OydxH+DG9qVmqlprD?=
	=?us-ascii?Q?nN0CkvMZrBf+XlLkBJcpIX6a/5brfkgkZKngfk41L/acIMunc1+eRTLRzWoa?=
	=?us-ascii?Q?pURTlcS4MXXawZ6WVFW7FyTwdbqCfyx2SXevY8goKjGuhWU6XpAlA9cyDqXV?=
	=?us-ascii?Q?e0VJeDR47sAREy1Vj8sRsdv+gz9FizI8B8oeyHk/4X3IxsSv0vNC8qHLI1C4?=
	=?us-ascii?Q?VnC74zXXj1Pn9W2SVi0oh1j/ijACdXzlPykXlhMe0B1geJAm9hv+G2puea88?=
	=?us-ascii?Q?u0XCWx3v5iVuc/xg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	5:jZMbC5sBKqKJcZwQrt5lMZ465psp+zCSvLK9x8EoBha/pSkSmLJMWx93OL7SZhCdAHN00QyiiyWXOSBaW2ebBMUSrXTxmsOxZ1h9V3YL4GpXgoiGJmx6+NVC+uQwhzyNIiYwmgwQ6lW3vqiJ1cYcSw==;
	24:SXiErA962jEdqt2NIfl2uF/BEtRUXkjul7g8isAkaG8VleyY0p/4J7N6dd82GIl3P77Ie8VrRKFJN9TwCR55WXtxNVF5sbnvp1sWD+mC8QI=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2016 09:05:32.6095 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
Subject: [poky][PATCH 1/2] gstreamer1.0-plugins-bad: Fix memory leak of navigation thread
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
X-List-Received-Date: Thu, 28 Jan 2016 09:05:36 -0000
Content-Type: text/plain

When exit navigation thread, call g_thread_join() to release
the resource hold by it.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...window-fix-memory-leak-of-navigation-thre.patch | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
new file mode 100755
index 0000000..3491a15
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
index 4b9143f..c51a637 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
     file://configure-allow-to-disable-libssh2.patch \
     file://0001-glimagesink-Downrank-to-marginal.patch \
+    file://0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
 "
 
 SRC_URI[md5sum] = "4857adcafe41e4b9b8805cf88303bd55"
-- 
1.9.1


