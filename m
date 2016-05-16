Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 1997 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 May 2016 14:10:51 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0073.outbound.protection.outlook.com [104.47.2.73])
	by mail.openembedded.org (Postfix) with ESMTP id E733665C5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=63yVxzxKBK6jh5uEwTpSSqssnYTDLSoea9Z8j8YtiQk=;
	b=wS/4bn7P+4ae/IxT9wlC/ab0u1PP+LDD9E13RuRHKtT24KYt2mUUi6bd01DFM0R050rAORx2BhR4Y7D7nySzc6H92NciWkfCXQOT/vaI7Akp0MpaV5a9NejiaFRKZdGXlZ5gW1bcnGGxhzH5ED2KtkQaObnyOPxGzaVmMYjRQKc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB316.eurprd04.prod.outlook.com (10.141.239.155) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Mon, 16 May 2016 13:37:33 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 08:34:15 -0500
Message-ID: <1463405655-14271-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY2PR1001CA0002.namprd10.prod.outlook.com (10.164.163.140)
	To DB4PR04MB316.eurprd04.prod.outlook.com (10.141.239.155)
X-MS-Office365-Filtering-Correlation-Id: fb537aa0-8e89-4faf-9bbb-08d37d8f3c97
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB316;
	2:jyhKArhixF1IDKC7QLVD8gksINWJrbtuFTnCDIkziquyb3UEbDGmw35zjOR23SUlpPQcxXJumYLa4yp8IyCvE9o+vg7X15l8aODlWjDtmkRm4gvpP6QBo+TDNGtLLB0RzEjdokEoGKTWbkDwyjiKhMmUY81nA/q8uiScBrgSTNxn6dsD9HrLmR8CvCQZYExC;
	3:74f7R3N/z4pmCv33L6eDHRAfPbIf3vQDlQoVTkDu0HbTfhbFVuM0a0cweWY6jB2lUZ2NfgHo3ezz7DizedCtyyV2DTOSZTvtxvnw5vpcFii6t2qi4rGTiEP/5phDOsfG;
	25:sQf6gqDhBarji+1HjV4cdP9JVZqDmEGv+9P142X7EqLnPEGf+YoshucqOrqV0/dFhETCD/5Y6qUSFEIr9DG4xA2Mbr/NcFgiA4TnccbgnfQ/UyKQiya9UUj5XWtXgA4AqtSI2KFyKD+fCWwu+hGsKguH5ALc+08lDyKaBk3e+42ptAfQkzUbDCb+upqO6csIo58S1M8ljyU3GnuTeFJWOHktab4+Y4ocSUQ64z8WSrUTS+hORCfu+JI4mLSHad31VvGRgZECse58JximuByWoS3Tddf+G0ZDn7nE6amwDZrXBoMRoxfVBGCX9sbaaip5HUICDe1zo59pdfnPOGvm7r8jNJlP7whFDz3awklVRfugsUQBkwaZv/QN/kvawvgKn/Xb+bbF4d5xzLLY07sv93zMz3ytZzQI0UpddoxWZgc=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB316;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB316;
	20:fF1mKAtW3Zyh7PxJGtXrLDocWmUBF4Vfc4Nn5imeOFxz9Vkr4V6mi02TDFomNY/Dyh6ir4pEsd8x61wPYuByWh9xZbotEEboAvzMr9YaIwgjY57OAROzwxVfGBG9NcqkQZGEvZEeS5ZyaYY1K1170MfaCb5JBKTOpNzPts8Pa6QEgbgEZr+L8tmUUvgfCguV8uWd23h0JdPymS0Pwd5/dBXlRos53XqZwIGGpBz+KefmNTImesjL/N6IocPqqFG5o0QvymmKiMJ1BHxSMQywPEnFqdMmDTivqlEjSXMOYS/Bj8d4OIe3L/AOBW0GDDBD0Tds+QwNbAB2DMSXWazvYc0ORfr3IvFBYvI/qQH9y+plc5VWkxrUOWrJc7phKS3+31dGY5hQYoZAHdS+bWqmQ11H1UrKjmQUf67M7BHr5wjxxMrwu+vHCsjwqfwjLfx2L2j0rVYNWtDS5gcw2Kal9uQaCdNZBy8sH8ySLIRkP3VYpZhAIAiLYX0WrrR86f8N;
	4:WR6wJxi776zftF40fxEM9QteM2u3XiMxrlKVcvY2GnfD+LR3ab68VGv3kndjudAj3g3T6kTtq/8hK5cPEVkY9AYHdGQh/SWdvgyN0g1Tod0E+TCg9hw3llKLZbcpIMVNROg/xBlRZs2qGYa3eqnwRZXJKCgm9Wbn4xVFDqzwPyU0MjyldD3QbeWkqly31h+D3bZVblnMsu7F5p/m7PRc+o4+waXAMuOooQlWP7jsHeh64aAE13otrQOU9Xi5QvyIJCwf8BIMGdSPLtSvYVgF+kUB7kIDTFPiqIUo3N26+9N+Pr4UlBnxuLn1fqrbzFiL5K5Dlxi6DA6lwCErEMCCgjaDT+BFtVicIbpiikTmdtlsQpsovaDup2hvoGaxMiJFbOAFMXEKIBtvG4TtO2QQSQ==
X-Microsoft-Antispam-PRVS: <DB4PR04MB316138CC0B8BF6FB243B545E2770@DB4PR04MB316.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:DB4PR04MB316; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB316; 
X-Forefront-PRVS: 09443CAA7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(377424004)(5004730100002)(50986999)(92566002)(81166006)(66066001)(36756003)(2906002)(33646002)(48376002)(8676002)(586003)(4326007)(6116002)(3846002)(50466002)(5008740100001)(50226002)(2351001)(229853001)(19580405001)(19580395003)(77096005)(189998001)(86362001)(110136002)(42186005)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB316;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB316;
	23:auPSapNFqIYLGc7otACC7v3WOtviHn8C4R+8YygIsCqGfviukB2C9WipwPH9TZEZ9ypqF6JrF7AoVIelBleKMrwxTCwfHKswJkyN0XwnHxL3IUz98EuuaBE2eZGeYdfoo1qwFdFuG5H6M7C+W0usY2+TbtFH4JfC+u4lXhUsCzXIsc4wOX60oBXuStmKp6ULhjltFXrBtQVUcy2DdgB/38RhcJ5eD12VHScxQZVLHbXaFvK08RUF1CwP03cev0sRmtKbF/vlUoLgEgFJgF8YlHZyIOrxA3vxboweWd5vPTOeDvrxgGsOOEWGczP7vd/gWVB9mA2OjOGLXfJU5qI4Y0gAkI47mIeK09OQMK/wVPV3VDVytPRRgGl/BPdedW1H/cNg0a/5Wok2TOlyAyz0NhaEdv2fViEnMIklKiZJ+iOkbo1XC4Kcvz6DYQ8Lcmw/R4Y2FaXiZQ+7O8/mPnBw7iN0a3iqyNoP40Y5tgW7gnOW8oVtFWY0xLzzVHiWYGsh2afLhFd7iq5sxeBNFj8zhpxfiVoAlzPTZirRjpmLaK0SIr0E+ghJMfvRq1KPMmPz28Zh9YA1HlvK0FQ5AXAJdAdzIvid6dHu5HsUB1rdmsC/6AJ35qPtCRPmAfMerOfa72t3u2EQz+5pvoz172TZojJ1NhTCZ66jh+D19+5Mz4Zf0g1Ear7PNTSscqDore/eTJdRlHjFvN32JHUYfJPOR2XQmIAQbSfG4wz3dnCdof5y6tCIdmxxd5M3zvK3GylhjAOkU6R/wnb37b+43PxFOdNSt8TvdmuT02d0uuar21xElhUyS4Sl6HZSSNKU9KLzmUy0hw6t3ub9FuI5l12Ljg==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB316;
	5:qcUQoFH5bch1U4Tn6BxkOlilw117eFKue6aBmIWcTg8IxWfP2llltu2sWoD9/vIBHP5wJffLus7OUEqZXvZHCly8GHGw8cFDej0W7nxK2Sip+mQnar/cvCf24Gg7uX9Ffu/dOAz8Chf/5yyD9BDclQ==;
	24:xOIifYpiOazDJPd+jSssS2PNGN59gjd3S1r35vNH/9vXSrCNkyuAmsfoTEfvqLl6HY1/O/OT+vvB+PCigtWIm2SmfegvjImGB4cCLIFRRb4=;
	7:SI60s5s1RY/6daI9a0OF5F2zsB4cd4n2uhBnC7H0e1D0TVtuNCdlzFpXroRLFcnkFebA4+hj2hW5HbL3RLH7p8E5gmYulO0z2sdiUn2yvpZ6JaOCEjxCKLfi2eaI9FCG/xzx5WeSrpoQEOWiT9XsraYJwMEJR6C2XgiVTHNb94wt9lsAYI1BbT5igOYtOrSk
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2016 13:37:33.1923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB316
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Subject: [PATCH v2] Add OpenVG demos to support wayland.
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
X-List-Received-Date: Mon, 16 May 2016 14:10:52 -0000
Content-Type: text/plain

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Upstream-Status: Pending

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
---
 src/egl/Makefile.am        |  6 +++---
 src/egl/openvg/Makefile.am | 33 +++++++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 7 deletions(-)

Index: mesa-demos-8.2.0/src/egl/Makefile.am
===================================================================
--- mesa-demos-8.2.0.orig/src/egl/Makefile.am	2016-05-09 11:45:51.479100180 -0500
+++ mesa-demos-8.2.0/src/egl/Makefile.am	2016-05-09 11:45:51.475100160 -0500
@@ -26,10 +26,10 @@
 	eglut \
 	opengles1 \
 	opengles2 \
-	oes_vg
+	oes_vg \
+        openvg
 
 if HAVE_GLU
 SUBDIRS += \
-	opengl \
-	openvg
+	opengl
 endif
Index: mesa-demos-8.2.0/src/egl/openvg/Makefile.am
===================================================================
--- mesa-demos-8.2.0.orig/src/egl/openvg/Makefile.am	2016-05-09 11:45:51.479100180 -0500
+++ mesa-demos-8.2.0/src/egl/openvg/Makefile.am	2016-05-09 12:39:30.000000000 -0500
@@ -47,13 +47,26 @@
 endif
 endif
 
+if HAVE_WAYLAND
+EGL_WL_DEMOS = \
+    lion_wayland \
+    sp_wayland
+
+if HAVE_FREETYPE2
+EGL_WL_DEMOS += \
+	vgtext_wayland
+endif
+endif
+
 if HAVE_EGL
 if HAVE_VG
 bin_PROGRAMS = \
-	$(EGL_X11_DEMOS)
+	$(EGL_X11_DEMOS) \
+	$(EGL_WL_DEMOS)
 endif
 endif
 
+if HAVE_X11
 lion_x11_SOURCES = lion.c lion-render.c lion-render.h
 sp_x11_SOURCES = sp.c
 
@@ -63,6 +76,20 @@
 text_SOURCES = text.c
 text_CFLAGS = $(AM_CFLAGS) @FREETYPE2_CFLAGS@
 text_LDADD = @FREETYPE2_LIBS@ ../eglut/libeglut_x11.la
+endif
+
+if HAVE_WAYLAND
+lion_wayland_SOURCES = lion.c lion-render.c lion-render.h
+lion_wayland_LDADD = ../eglut/libeglut_wayland.la
+
+sp_wayland_SOURCES = sp.c
+sp_wayland_LDADD = ../eglut/libeglut_wayland.la
+
+vgtext_wayland_SOURCES = text.c
+vgtext_wayland_CFLAGS = $(AM_CFLAGS) @FREETYPE2_CFLAGS@
+vgtext_wayland_LDADD = @FREETYPE2_LIBS@ ../eglut/libeglut_wayland.la
+
+endif
 
 SUBDIRS = \
 	trivial

