Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0043.outbound.protection.outlook.com [104.47.2.43])
	by mail.openembedded.org (Postfix) with ESMTP id B95616612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QcgDrGiqNUZBB/1cFQU76vBG14tS0HHb5uZ2emH7g8A=;
	b=LGdBfv+DJjcAQ6ny5pEsYOieHR019m4kcB7yzQYWl7oLc3A7CDgx6J50NiD8jmD/t//uX79L2syZXd6SdZSXKcyC9Mq55BYlryvYBvCg+ko5bBJYiUjAhRVPzrIf9OtxM/d4LPGOyT1awY93tPrPnq9xpG0NIwFo4YF3YrAYP80=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	AMSPR04MB310.eurprd04.prod.outlook.com (10.242.107.20) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.8; Mon, 8 Aug 2016 15:50:00 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2016 10:45:16 -0500
Message-ID: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: CY1PR13CA0040.namprd13.prod.outlook.com (10.162.30.178) To
	AMSPR04MB310.eurprd04.prod.outlook.com (10.242.107.20)
X-MS-Office365-Filtering-Correlation-Id: d7ba7772-f798-426d-cada-08d3bfa3a85d
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	2:fa31xPcUL4bwz/YJnQDnEzYlfPI4kVajp5krXhjlcDpElJKn+XDmflodWFFtBotQfnf11Ixtrd87cNlPByz4t6ubrDAik9Q1Y81Wu+Tv1P9EpXhR/hRpk7UNDRD70kV65skoOkeiKT6ZarktTbXMO54jf2Hysi7i44sc1Nw5jUFrEuqrRjUwSKYYWWXa2m3B;
	3:0Csbn8xQGV31T8/eIUVC5Fy6LqFejPZFQufmnkzNyxr7kE2Xs5HQuAqQ5zZaMhuWbtExneGMEWLPdbnKnjb0+kx6BfUvj2u9RI/I2I5Bc386GUWxFIyi4Gpv9TUMmnln;
	25:vdvJtEQ6jvlUPEkumsVcTDupJJJJ2fT4ihmSrVjNQo0aXoQuxABfj1jj4A3mfl7XioDn9jlgqIYEJD1ewR5iLjV8zAVMLCoZsJiA5ISu00xkJcGiMzoco3DJ/KjI/xqMfm1V3uTwVPVl87QhunG2uj/tYVjBfvtxBWTCs/D+b1GERfznupTxUskRTGE/IBAd5x52/YGu7n7DY9Rl6hhtt9QA17icWA2ulKs8mylIsCM4vfd1H4Vkwh8USl152MGoJeX0DyHZIx6stx30rPcgaz4o9uCd8AkzSXgC9hlb5q0g2YiYgR99rdLwzDx8M+WKRUa4kOwExzj2CPb86PzJzRdpapZFjE9iaG9ZuXwCw8EDRelhCRPeEPfM9JIXZTg3Zrdj0pBI6aorH0tHf4TmVUfOUND1IG8Y5+jYyN8Ezic=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB310;
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	31:yjX/m7NT7rkqz4HJi0SIIDdhCiE32S2u+BTbUzb8oyjDV4j+ajQQdEBu8KGsbnkGIA7HRweY3qtd8jR9w70W29rnRfgIUFdX1BUwczVkxb1SOurF8mG5z1Ks4yLlrjulGeqcjtomJXXpGUZJ1C+m5i8tU8Pc68GTqI/fzSJefjEAquX3zDfLlsrUxx2AHUU2DUlmwEgipeJwMPSGOdiErmmBO6Y3flkdPPzIisvHQvo=;
	20:Pc99qPKVTBUQXAFaeCp+epohPxMCrgAZaPmd4Z7Dr8fgq58dg6thYx5339BP8H59pTZ08T6RKnyUYCkg9DmXEezaykGx+HkKwHHxZrGi+wQBiKgjQsB5pIO21wMuo+/VKKg3JZg4HTv4ihEEPNkQyXRWV4i7Th1C54fFcs5IpcOMEnlGGsQg6JsOUyC6CZLgPCLAOj9Tcujd8AD99Pm/5USIui6YlCQ6npyoyhDD5Eav8HvablckcHdFE/Q438wtr4tK9uqzODB9H3c7YWbv7VNwHpVvew7ptmy1G++g1Iq0zurE+2cbMUEHI3YdtSaf7mttpsbuNZchuIQWcipZ2e6FppTW+BEZbRfU6sMoKERFYtKBQkjQEQJDn3TyCuwfo8ONA63QEy9UnFgG6ZaX4DylBbNeVBLrWjxfVFVRI+W77sI8/HMTJC+F5sTs5z9VACzBvtO6yu81TGKHlgjtTZQTSlB8tz1vopv9c+NNHKMJPTTPAFzXz9E0IeU1oqW/mNoypFQEJG4WfJjZcMFEqoLM1kMXbzdO7Pr2GZLkkGRdZangwGJyyC1C+Mp6umLqxKHoF0B2z8N3NI09Semew6xd4Lgosli0q+lRCrasjhE=
X-NIPS-smtp-INBOUND: xFSL-EDGE
X-Microsoft-Antispam-PRVS: <AMSPR04MB310A7A309E5159FA2CC5AFBE21B0@AMSPR04MB310.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AMSPR04MB310; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB310; 
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	4:d+VM5zvd2SijtuAHXDNI9uu4ISETF3WHU34TEYsYmrJZyMwvBgQ4RcmL0s0yxE+tuQ1DHZec0gQr6ct9F1EXgW4bttzzoQ2Zf06Gv50kcx3UIDQ/ez6bMyFxosXWMAst+fvlrYeCrOYsASDV2o4151psfUMecBWHHr//8YhF+WmQ8tYV+3pc06pwWlWBn/ArNzbmPU3knwk8IUNwcN0RIM38k5AiFXsDzrhvPPW1GZGb76Pc1DttHNKVdzSc1SbbulGTpqjJbVgF4eKyhqVmbDECE2ZBwmUZkHmc+iYrKEVw+05TGUVWjSBzi60NXn1OvIGnHiiJR+Fe2F5xG0AiV+TtggrHv2LN3ikWPVzZlTwU61qS7q8Hw7TNTdHx06quIDM0a9oR7LDa1dNN4tGLCvzOIRFEAyhXbT0rf8oFsIP1eg71YFh+olNzxgE6HGOB
X-Forefront-PRVS: 00286C0CA6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(199003)(377424004)(189002)(229853001)(86362001)(77096005)(110136002)(97736004)(3846002)(189998001)(36756003)(105586002)(5003940100001)(50986999)(92566002)(586003)(450100001)(7736002)(6116002)(68736007)(19580395003)(66066001)(106356001)(50466002)(48376002)(81166006)(50226002)(7846002)(42186005)(101416001)(81156014)(47776003)(33646002)(2351001)(2906002)(19580405001)(305945005)(8676002)(4326007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB310;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AMSPR04MB310;
	23:lDR1eylgzOCABEdnX09yTyob8LQAud6jb1Ypgaelw7?=
	=?us-ascii?Q?vrM2DpbCqIQdTNuYMtU70+F4o6vJVlmIIpgPuysttioYvLI3cldib4SF13PJ?=
	=?us-ascii?Q?LRtxzzUAZ8ha/WjZYKHop84+FwX3OcJUbbNfTpebsXDRKAyavHgmKfhJwBpi?=
	=?us-ascii?Q?2V0BTOHwZFM+3I+kyfFMhxB69Y9gMOEGNnIFdryKovkEhk029HorIcavSdav?=
	=?us-ascii?Q?YF0Vnlg0uuE7g8fSSJj1redBm8/iKgWYl67CJ7uY9RIHJLUWDE5CeN97FHZu?=
	=?us-ascii?Q?u7PTPrgEDdnOsoDQQX1t1C/lmQc4/SNFXwnxJNQp72SDpV5ybRbcuDUXxeQW?=
	=?us-ascii?Q?J5xmk8s9lwFW/Xpu+kqTsFolnp+QT74dwX3JEFs0jU+k9MLU1Zbz60H7hSKI?=
	=?us-ascii?Q?NHZ5m8SPV9B2XVV2oPmpOvCtrcF9P3sRgvXNcN1CqdCPDn6oWAHPrfkbEQLc?=
	=?us-ascii?Q?Ak2EAnqrVhzwcx6BTPGj6SNuihnCOQIdA5DjZNQQXpi2bg2WLgeHWR/bFeHb?=
	=?us-ascii?Q?v1BoYUEZoc2Q5rAvnAToS2KzNgCnX9Cgf1TPbhJl/uj+DAmQjeUy8y0/9ncP?=
	=?us-ascii?Q?AoRK1qW7Hh6WuJ1lAW0jcYA2jtMgQtYUGTPtJT1h5TbeMwGzs82zG1hLDIux?=
	=?us-ascii?Q?RWBa5IQCTO6NYpv/pW+44VLEB+rc51MFAiA4l5MOtGWFN5dajuXuil8GQ1RM?=
	=?us-ascii?Q?3ugZf1kdB2o/U7KSwosPAOomW52VRrK07ZxeKg0gJ947gVX6MpA6hi4unqNR?=
	=?us-ascii?Q?B4Ds00Z7YI9rKx4X1qdzeF43fPSDehy/u7HKzic3B4aOnJqyf6yN6HsegC7y?=
	=?us-ascii?Q?+xMVehBk48Fs7QtKH4ByZmuYFX1NvMTKimURqRetKN8pkncdcVTupPxjIONY?=
	=?us-ascii?Q?7TdDb+vZp98K2t4JiH7k2QHNFVdoCJewQ2r9mjLoNiB+lcAT0bXUH97FTCPT?=
	=?us-ascii?Q?YY141CAcXUscGwNuHq6Dh9ZasSZxnVBsrU0bEZ0jkOvrzUbSLeIKxf5OXGzi?=
	=?us-ascii?Q?BOiBa3toaPtvslaA+YF+HcTo5+c+YzjpM1wMc1gPv04WghekqvFMCt5MoZ4S?=
	=?us-ascii?Q?Yo2/eLzIG5GQc/+TOGB602w3mF?=
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	6:jaNGczH7kqeoRp91kTa5rKSBfa1RDI2925O8/deCsXFqaDHO+ssyJFUFup3woRx4zZpbqt2I2BiGAXwNQRGcnASqp0kjwuYH677v3KQ72RvsMTVmLU0zOROofjRXuV0RJc63m94LIJH0CLviXGJsKhFB6lCrldgOD5reVyXzDMkYr95FJQbgWQ8x88stdqkAgza09uppxViolAv7qqtNj13Wgbfs2piHn8jO/8wntbpZys/0bDJ61QKPYTTFYNr66TI+AhLgeJbziwXW0EDSBHE49xIC91M47pgFbO3yygZWZzSNOzgm0Saja+4c1orP0DvrNLXslQ1NV4DuYDh4GQ==;
	5:CkwTiEzkGJDLT76f2kyd4n9hPNT/UnuUf435f48JtWpI6p8uuW7yn3q+61i2QxqZY3HMeUaG3zS9aMOFbUgd4r9DwoJD/m22raQm20YCsa++2zrI9kruNVAToS+ICQNCsj2T8Om38x1N4HdhMFnGUA==;
	24:1yKs1kQ7Og/Yp0/1q0pOpyaq5MYJPewwuYLxDMjlpPsVI4ALVtC6QiYg1sNIOum0vpO+WLXFpAFIIvqotrES7yOrJ5d9STvFwCMIPS/RHgg=;
	7:EYpvx1mInONmsyXdPmDhsoq24zvnfregRbiG0RwiOoMeu/yaMaiVmG7w7FA6yEHYxl5dyqBPUvxDOUm+hXMG5Z9pqPlQlt1Nhy6QoehzJn/wYeJ6j+L+qHD5DSbfzZ1vICw7r+zoYHMpvySREd3v7cVzAAkU060KRCbZaR3B6XVwhTeNVKW9JkbPLcET1Vq1CQjTe2hbVxDBBYeH92CEmE2Ffc/UY480uUyHXINUW9Xt7ATvWYmGgrs2rP+GLdoW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2016 15:50:00.8330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB310
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	23:znVGi9DIVCo3KNobs9Jn8F0vJiIWpx0ku2SQc+sElPQsUrnD6+E+2PUifsZlwloCsa83eU1tv6ir8gABATWoGD1YqzfqXKZOFLx/H6gx24W/IUm9x2Lghqnben1EfRO7uNhveyoI3dY9t70+NnW1x9lMYflfJgUlXLQztQ1qE2ypxnFoxDip7eYIZDbErHAz
X-OriginatorOrg: nxp.com
Subject: [krogoth][PATCH] mesa-demos: Fix OpenGL ES configurability
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
X-List-Received-Date: Tue, 09 Aug 2016 07:38:45 -0000
Content-Type: text/plain

The most recent patch 0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch
incorrectly removed the configuration constructs that allowed the
package to be configured without OpenGL ES support.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../mesa-demos/0012-Fix-gles-configurability.patch | 39 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch b/meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch
new file mode 100644
index 0000000..0b437a4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch
@@ -0,0 +1,39 @@
+Index: mesa-demos-8.2.0/src/egl/opengles1/Makefile.am
+===================================================================
+--- mesa-demos-8.2.0.orig/src/egl/opengles1/Makefile.am	2016-07-29 10:52:50.131729547 -0500
++++ mesa-demos-8.2.0/src/egl/opengles1/Makefile.am	2016-07-29 10:59:26.000000000 -0500
+@@ -36,6 +36,8 @@
+ 	$(EGL_LIBS) \
+ 	-lm
+ 
++if HAVE_EGL
++if HAVE_GLESV1
+ bin_PROGRAMS =
+ 
+ if HAVE_X11
+@@ -76,3 +78,5 @@
+ torus_x11_LDADD = ../eglut/libeglut_x11.la
+ tri_x11_LDADD = ../eglut/libeglut_x11.la
+ endif
++endif
++endif
+Index: mesa-demos-8.2.0/src/egl/opengles2/Makefile.am
+===================================================================
+--- mesa-demos-8.2.0.orig/src/egl/opengles2/Makefile.am	2016-07-29 10:52:50.131729547 -0500
++++ mesa-demos-8.2.0/src/egl/opengles2/Makefile.am	2016-07-29 10:59:03.000000000 -0500
+@@ -33,6 +33,8 @@
+ 	$(EGL_LIBS) \
+ 	-lm
+ 
++if HAVE_EGL
++if HAVE_GLESV2
+ bin_PROGRAMS =
+ 
+ if HAVE_WAYLAND
+@@ -53,4 +55,5 @@
+ es2gears_x11_LDADD = ../eglut/libeglut_x11.la
+ es2tri_LDADD = $(X11_LIBS)
+ endif
+-
++endif
++endif
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index 2df9bba..8e12d82 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
     file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
     file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
     file://0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch \
+    file://0012-Fix-gles-configurability.patch \
 "
 SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
 SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
-- 
1.9.1


