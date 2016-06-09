Return-Path: <tom.hochstein@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0066.outbound.protection.outlook.com [157.55.234.66])
	by mail.openembedded.org (Postfix) with ESMTP id 79D396E668
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MGtZYzkhbD71MT5JOGiJ0m3yWgvDhlRI1jbsuPCfbAk=;
	b=SkkE0kgbWzKBquWJyyNg/P00WJA1g6xUh3KeieRB/HrEUx8iPtWE+SFeQBeeIKIdXyUkYYNOy4ukW6gzIHN+7Gyn6yfJU0zqD+ZbEc5qvnJlZZME6JGINBdynph08CMXWZu/L7YoQkk9MrG0tmx05SKNXNrTZm6o3iiPYHyLU2k=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Thu, 9 Jun 2016 19:30:39 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2016 14:27:04 -0500
Message-ID: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY1PR14CA0012.namprd14.prod.outlook.com (10.161.91.22) To
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146)
X-MS-Office365-Filtering-Correlation-Id: 58a21e68-e857-411a-1414-08d3909c8ab3
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	2:Lm8JEhukYNT1IA0mOto6/3n1wQm46dlYD4i49EVrR9qcRF+igBhPI4IhJTbV+l6nCacjxgfaNIDBKXew83UXaLd9xYZ2g9h2RmB9xMhJbRNhIDa3eaPyr2GMEyOoMpJxugzNhHYbfAqg8+0HInnkqq2Sul3U05W9MZpEwSbcy7y8Xab/gFD/1TNrN//4Zmgq;
	3:8U+R55hXfVTWv6o3mDSW7CKIWJrt7248GaDcuaaGXXJy0XCuWK5Bprj1pKeHg8oVZcUwb5BaQv+7iViVGLk9J41cin/54qxZX2ENJ9dioR8cJZ3ZON/Lze6FjvccR6tG;
	25:/PHwt/nlEDIXHccQkG0ySA5n7cFZi5aaliA9b7DIxCL0Y15hR73NWYunysx+4r/ixhRwGkIUAAr2WEnBw/th18HjFYOsoyLxJ7U62t9jQQuLZNicE/9EWYeD0On03n61PEh6tgKOjCj1Fs4dKIASkAn139Qw0Hj5gkKdosh5k39ishHeLs1WyzZoeNi/Wuif+N7my/LIW8/ciEnsQbMzMAKCqcQPLphmXIS6pgk/qB5NQR3Le9ziOqbw9zDv4r5pfJ80rtWyWHYRK6nCh0mjmHO30nP7s30wrMUXPljutg5Gsbmm3r/aFKGgScxMmCFDw16qIhGGMrCfS6dBKgFU104LxVxZ9A+JdRl3T53yUoUOO9qlqdfY0cyN7gycSxjwSNIF0ysOTX5KFqDbAcdlOMxtD+tlOG3cjqGOO52CTSc=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB313;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	20:nnkyuweV0t3jZ6wPaXWaMxXYIfxFCp7u3xjo69ArAEUMbCzKKgTgEs3TMal58yIDkybr2egyqs4GwxbDq4o9QVBLiQJU/TwIaFowrRiMRzhjnCyN5SEfne2g+q3PBuf+ghjp6HO0d3FzeOktJotATEQsgF05a8YLvJDUGLRnoS/UWME8xlHvp80fdIFTXPxzNUWzTuNXuahSIZnSkEKgmGuczf5fq7EsJlWQEySVPV1N7Gjnh3KfLhlbfOZ2C8KwBM9y1ZuztmSsWnG9eSipJWik2UA55EEtucabOlRXJFHZyRuShv6Z/vxMg3gP59vo8NDBsZVymTzacGoMClvNUjxzGrug5vzYAf/YJ6Q27+GrOtBHvXY6euV8Wp/4hHfJ58UPAVvmPe8UBlFo57qj/u3HJnsrxx/QrMOsTDdCpujqQjLwBxwB4IyilkSIGA1WVI+yotRCwWyzYTg1XIAfSXS2z/8WbNBuu4zBJNIPL7CsCr1LIkY3d7aK5/YFV331;
	4:vQ4TXQFy7MIcxfmzqgru/EnSPpVCeT0AuDd8dfcMhiMwnX46cE7BojnerlOy2d+nHdUw8HIuXcWhG9nMArla+Ru2ucCO616COXTBFTOvfd/nsmyhv9sMYsKNEiyKGf3pjo6yzhGdUetBEfgDB5YPxr5m0ay2NBDYnpiWno5xJsNu9UjQtGRLHABm48w83hvlWXBb7BFL/0v4qi07cQHyI1mjgpXJVBgh46zTrvvrEQXLSSHCsfTig4bWvyGgoyoNAeWMIdl5N3h2CanTvEW0kcF4/6JQPVYvQVUhT4Po13TA1uxYKoWSqy69yKQfQfTw1s78SrmWLAiaUFbkz7x3yl2iA78xhQvNYb00jumS6isyQcdnedA8P1/97TDBdqnUpEIJWpfxvWyCXR4e3YNdvf7GwNoJrJakNmggx7TZfgWrFuPcfATg/jZpLr0NxQob
X-Microsoft-Antispam-PRVS: <DB4PR04MB3139ED9F7896A0993171E4FE25F0@DB4PR04MB313.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB4PR04MB313; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB313; 
X-Forefront-PRVS: 0968D37274
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(199003)(189002)(50986999)(3846002)(97736004)(586003)(68736007)(6116002)(8676002)(47776003)(36756003)(5004730100002)(5008740100001)(19580405001)(19580395003)(5003940100001)(81156014)(2906002)(42186005)(92566002)(50226002)(450100001)(81166006)(229853001)(33646002)(2351001)(4326007)(101416001)(106356001)(105586002)(86362001)(110136002)(77096005)(66066001)(48376002)(50466002)(189998001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB313;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB313;
	23:1+nZiVk/85d5wNzi63HXiW+NxqQw6d+/pOLaMMB2ze?=
	=?us-ascii?Q?o19k/7M5AXzBmrWkg5VLpZwZNznq9DanEkXvno46sMCBLRrwPIMPKabURuUV?=
	=?us-ascii?Q?h2svqzn/bQU4hFx6UVyZX+8vts8gU3c5qp19F9Oo9SH0XqkVczfZCDEspKO0?=
	=?us-ascii?Q?9szqT0bTJkTFCBWxho4iw+EoCr/ii21N+7TtTTfxbuqbcxAdNNuuZTRXZGPd?=
	=?us-ascii?Q?cgh3TaITTP92KnXWnU+7bwaCAiU8cL2IEddjgn+e4Bsn2OgqkZvKmoqA3LX0?=
	=?us-ascii?Q?UFYHqzz9eiMAiN3BsKsaiGL/wo8rjkwVqfQBWuwfQSgRWmKl7vweGf9kFOA7?=
	=?us-ascii?Q?F+Jjrk4cJUNzcQ1gf/0NsqrXgAOmxw3Jkb56Cw8DpyLI5AKdPCeRBrJY0qaB?=
	=?us-ascii?Q?BcOvUFO+pIURLNVdP5AmcJ5qvAJ5rEIb9AGwgWP/HS8lcb28AJiKQFHcILLv?=
	=?us-ascii?Q?chh8ba3PH4+EWjGKW0yhOIw6nSDCXwPeK7y8eWjL8TN8/SDhX0/bLOcGCjhh?=
	=?us-ascii?Q?8nyJSF4+bJdTCikJDO1Z6PGJYqCb8kRxAyvqltVvjA8DPTy6p6PUpP4VmWtY?=
	=?us-ascii?Q?yLcMxKHYpnmZhhFKw34ifWhAJ6Y339BUeh3dmUKlo6cDFHVIhSD44Zyu+Zai?=
	=?us-ascii?Q?aOaJ7Dd7FHi7t84N2C7vtQp9pWPdTFQL3VfHsvHvi5c7ui4bzGQTyuBPxbFk?=
	=?us-ascii?Q?99W4PUV6JxHdHSWkmbUqOsl3bWmbN3CkTPUONOuBo2rFgH/JEibFK6JugKkq?=
	=?us-ascii?Q?c64VdKPNeN3ICeXVjxm57vPZTX15Fl/km+vjg3Me45YDuBS6YcKJaYSZ/1Tu?=
	=?us-ascii?Q?xGwGjZG68Nh7GDmCG8KW03UxX6bJdsAWVFDpDr4hRFaexa5+WszuYKH4BrRH?=
	=?us-ascii?Q?lRsJPvnQLjbFM2dXEYfWxzP/1toCkxuRmYX1TQR+JjXOdQviJc2OdRDyr8tS?=
	=?us-ascii?Q?gg+PEu+/uqW8vMaPGPZYwTKQ5M1He93SAKQnC7pa8LK1K+K1wl8Tpl5IGSpW?=
	=?us-ascii?Q?xMF5lVJXZvuB+JMM+Je86WKodvq2ngtser0KPFnRsnDw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	5:M7o9NcOhjzSa2Fukbo+RFwsmgCLs3rgB1p1kXgUB59JcbyzetD+f1v+1o07z9UHh9AoMz4mZDQU+S+ZBMOf4W289XPrgIO3lSwhEFRq4dRBTWuGM9CReB6jJi21zwyHNzqbpWBTHytHqPJ8HV+DKYw==;
	24:ngc29dO/LSqyIDQ2U3eXge7l0mirQfiGTEvMbvQvGTGxHX0I/ELjSqundnp0MI3QHxlFmNtv8jplNVImBh7R30ahvoF3W2WluSP953z8J3s=;
	7:+L2+2LMYsbAX6GcwNd5hI8PkCD+dZm7Rz+f3fH8McwEuzokV7rGpXHxGvIi5HCDQD1uvuGOe+XuWgSl0HPRlzC63hlI9HIxwiGDY+LEylzrpy42vOkz6XLumSBTPcWG8Yrj+LnR/LMOiHjPmwmBe8Z9R7BX64cjcgRUBDXtxFgfb8+NX8jbohsTi72SFVEn4sHyKZylU5C94TF4Q8lw8+w==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2016 19:30:39.8005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB313
Subject: [PATCH 1/3] x11-common: Fix XDG_RUNTIME_DIR typo
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
X-List-Received-Date: Thu, 09 Jun 2016 19:30:43 -0000
Content-Type: text/plain

Fix the if-statement that had misspelled XDG_RUNTIME_DIR.
Also fix whitespace.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh
index 91594b9..6bd40b2 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh
@@ -7,7 +7,7 @@
 # In the ideal case where SystemD is booting and userspace is initiated by a
 # SystemD user session this will have been set already, so don't overwrite it.
 
-if [ -z "$XGD_RUNTIME_DIR" ]; then
-	XDG_RUNTIME_DIR="/tmp"
-        export XDG_RUNTIME_DIR
+if [ -z "$XDG_RUNTIME_DIR" ]; then
+    XDG_RUNTIME_DIR="/tmp"
+    export XDG_RUNTIME_DIR
 fi
-- 
1.9.1


