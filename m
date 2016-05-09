Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 846 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 May 2016 20:24:13 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0093.outbound.protection.outlook.com [157.56.112.93])
	by mail.openembedded.org (Postfix) with ESMTP id DDAA460119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 20:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oT9fA8PZz2hkLWvOYQhEwQihAHR31jjQMD+7DU/VQp8=;
	b=aBaU/59wQwa2v525twFtJziljHtmi1XH3jf2pvkxd8uR2E0Yq8JRA4FA6gw86MhtoK71mhrw52E+v2nNkabZfEzmfQoUzswUTtEAPIODtrrFn7+R7mVtPI5d+PPCE+hPsi5Z5L9R9jmJ05y+Rusf5JLr0dajYwcY9SXb3kZ8bUw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DBXPR04MB319.eurprd04.prod.outlook.com (10.141.232.24) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Mon, 9 May 2016 20:10:06 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 May 2016 15:07:06 -0500
Message-ID: <1462824426-19768-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: CY1PR08CA0019.namprd08.prod.outlook.com (10.163.94.157) To
	DBXPR04MB319.eurprd04.prod.outlook.com (10.141.232.24)
X-MS-Office365-Filtering-Correlation-Id: 529dcf9f-b4aa-4aea-824a-08d37845ea49
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB319;
	2:s+o8GOV7aG3lfjHKTRj90t5mqz4V1zKmE9PH03Wh7cfNdXtIIyKmJiZLFPrirW2rrBTsjRKHZrgkRt+TqA+6cZ+GEOTi5v3A6CJJJKS5E+aXevFIn9SEeQUrrBRMN1z/mw5s535l7YLl31f2xBD6Tzi9QSI/jZvfSvYseBaGcFvdBfMywt8ZgUhB1iVQHKhu;
	3:3CXQQqINHi4gKSx88EozwIDxThHNsHBartzWW2qQ0ctY0Rm2+eRwi5m2ar1mzQnlAOFpqHgGWG30NZTk+gMOdAy+soW3I24Y/rezAR4mMMyZtwqdt3dQcknpHhJ6zP61
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR04MB319;
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB319;
	25:cLKZV/LmQHYlkwkw2gaWh2Gw7ciowlVOdIl8tYOBZB0Y4ZTIp7QF9zr8v88CqAR3HNlEEBZoce63AXmm9zvok5FWkgZIs8WYwbO6czD/qaZVZBNxCFgddk1/bSbsN8nuI5vu+NrUeqPPzjln2jD8+ocAtMJBgplYgQ2dF1UQ5X1+MK4T6Tiwd2GpDMjwvo+7K3xi9ulr/OsBfgQGF7E1c4YExP4hgN+FRaPoDkFvPlZpa5has20LAX2Tl3BLuX3SJVmM4j8AAXQpGET5uF5nNYFp0TRWnbQ5rHn1P+39evgJKdn4554mSmI4KRVihWhQ0p2TtRHgu0F23dp4JzBT93igbAUDQNESVbGUKU/8fGLPWFx8LIAHBvwb5lGwoGc5+4CHIGacnkF2Bij8/P3hLGzBP/KqvkeWDVPwRDO6tXwwrugJqu4vU9kVgzziWDC61MB/Hh6eBrwn3Dq5RCcXgsOfH03ma9BgN1LJk5463I/UINwcb20xsEaFHN1xN/9PGhgeQ3Y0NJyN/kNRG2O/opUOmBYQwM+2/SHsNE0FJG6/KB/sUU2FS2LfjoahNLD2DHYV5vMhqTJ2Tk5Jtgl6xIqucGy5VAqdkIBcxXd0wbpliAUIFmc1XWC0XqOfI/lLBFlYiLXdc/9WbZz/y+iReHW7zmY0YwXdr4HF+ABGkNSduaQVXBLS7VCl/ToDhKHiqIQCU7OQ+tfbHHh0WJwYOxfHTH8hH0tMur1GSLQxm7A=
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB319;
	20:Uza86v+Z0w6MA4PZaVVOqbNSizQgKgvSxcivaaFZewpoDc1r4wb76FTQoUN4StGjMDUMh18hBrMhsDXhNQISCIQzSRnSecrmuVNdrekhJv5gcQKMWhoAfjJEqGMeeWIghsWdaM4ggN+b1yeRHew1ET9ViiIHdvkfJUFBUCc8i2LgvfQH1h/fwJ5UYh8B+8Tkn9bBOjCBFTBT95Ry/JA5Pj64zfEUjjT/rc5gg1Rzidxtwjbfw1KI3BneC3+6gGrDFx4ABh5VAuqnztzUzz0XHXn5m5sl6Lp/FoQc7lMjCXXvBUuDbJ2a2AofRFizjfs7cS6HcLxf9Z+CabhNmcPz2qBotogMxog9BISfSPzd0z4IFHfUeL086G0rbdCUxQA4G1bs8Vokr/Vjs1zVVZhJ3Wyz1n7M+EXOhvsDSd5M75v1R22bUKg67YY4FL3nfix/KzdVatWNmNbF6Xn+X9o/K2XW5/o31dVJ+zrymYmaMf9rNnfp4yDbl68aL+Gu4kki;
	4:DTZttJTSKS/9r6V3AW9fyDsD0NB4jQPv1CzdZbwnAzwbFn+zryEnzYSDM4Y1R7vVwV9QfObBiKexoJRZg2lzJAJ5n4EjEFtQFLFCJmx9q81KIrmMCWDYKAYK9ZxiACbQPYNYJF27tix+tdxbQmctUsv0gmjww6oRKrNmCXNY5wpGZwYcvlRfWoyJM77dLvzaMPmop2UcAnwL7jufbvSVqWXo6SnZ4J8qFgbWfe3Z9T87cgnpUKqMAa62XpOjG9zBbfFVfSGa1W8sNp46tnnLk6sc1+4+CWn4o3bab2ARxG56GaBf9ACaS7RAYgxhIxC79e3Ai4v2tGlgz8BA8KlPRIYmgB5M2pqdDgdPQhzq4cGaCIHa4t/EWRcnfOdD3azewTAcdi1X20rYPK8r9JNEvQ==
X-Microsoft-Antispam-PRVS: <DBXPR04MB319566C43A05799E22C8B3DE2700@DBXPR04MB319.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:DBXPR04MB319; BCL:0; PCL:0; RULEID:; SRVR:DBXPR04MB319; 
X-Forefront-PRVS: 0937FB07C5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(229853001)(2351001)(450100001)(77096005)(5003940100001)(36756003)(19580395003)(19580405001)(33646002)(2906002)(92566002)(50986999)(50226002)(81166005)(50466002)(48376002)(5004730100002)(42186005)(47776003)(110136002)(5008740100001)(4326007)(586003)(189998001)(575784001)(86362001)(3846002)(66066001)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DBXPR04MB319;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB319;
	23:l3QOrGZRT+11a6ljm89pj2j+S43KRUjnlXOxfQJ8UJZw4iXHWY19RjKMtucC8SNWQXb5bvlA9cdI/I0G4P/dmW8h4JyPaheC7Q5T5tHlFL4umWXu0zQy+/V8pKs1iHfApHP9wDzCsLpSEJbIqVSoK8dlqFzdxbdNghuwJePwDcmHxcb8iNH8OItIsK20xrznPQ70wAKGB/RK4HL14VSE0Qxc4MJ9z3G/C5zrfKnOhV3EN2ueed3Jw9RDSI7XQuYkYDAj4eUp0JDn59EQKnHzoqZq8ovfhwaxAqP6ppIwkXXSg6umWL7JDrBU3iymTMPBpGilrhrQUXNb7xtLI8vJcssgznLJhjCagQUI4FSyKpmzjtFiW2W7vGv+rxBTPP7V/Wyfm2Vdk3ZPiwt2pdk3gWmKTGPdjPDrZpmFjsTybgboGkMPC+ThwJ0sjNoyBh3OHLX44knZLKyywCEKz5eAiCy8fZT3Iug90y9Bx0kamWPo53s95Y++mgIJRBDSZs8clJrEzzSYl0uJlQ/ezY08m1T5QGwKNpdnMe3+Qp/zkRsZdtOYL7VEJUMGe1aJ3gvKO+BLYJLf+A8+n90MCsOqBzpy70BHGHPCOC2MNWOUJlSdR4j8uoYw8N/LaJVF3/lW4gfRIXjnEjKtyfekUsbHMyaRKXU2QaMN/NAQaxsaARsuWkB+EQhY8dFTCs5VnHmBSRBzmU1HQk9c/Br5Y5vNCMh6NbEsthU8HWM0tgscTXAGXZNS0m2lmtDbsL7HJ7WeSQVFt6taqmArgKwluV1ctpUr78NbwjAmyoQSlhYuerJDYREwx4hb399pZwd6iSWg3iElJkThfkstMcafLaRpjg==
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB319;
	5:AEHH+1H5/EnGpvO1i90B+2+cXyLGflTyCkup3yWAbnM8fZokaQitWCPCOGLws+FofLLARnQ5l0JU4DAM7o9WejMkmp/R3g+w8lKOdutEBClKJ7+8GwZkrxVAquUKj7WgfLbaJr4axb1/dmyCQvIrXA==;
	24:8cbgeHQJbMgPzxcatuOT9FpsTpG+CEu/AjrCW54nqv/LM0+ne7f5BOMBlgLIrlQFhRfQ3a9j9TGMQqvFBjA2ei88u1gaAhOs6Lt81IiUjxk=;
	7:VjOXDiBIX4wnPy0Z8O1JKukWPsCpHuBFFF0U3sgSrR7v9XQSBxmYpHzEx9Bl4cMUPakv7VJ1DtpdoZGrgIHVPZC/RepYrDgXCQ+0sPo/v88I/70enMmnYK8+y9Z8qwydXpOb2yNO7Y3ikSGcagRBxdZyNlq+xQy3dvWqkp4EZ7kE4gw6JppTF5XlrOrYmJ6J
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2016 20:10:06.2040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR04MB319
Subject: [PATCH] mesa-demos: OpenVG demos with single frame need eglSwapBuffer
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
X-List-Received-Date: Mon, 09 May 2016 20:24:16 -0000
Content-Type: text/plain

sp and text demos rendering single frame. to display the
single frame rendered needed a eglSwapBuffer to diplay to window.
Hence added eglutPostRedisplay to display the frame.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 ...OpenVG-demos-with-single-frame-need-eglSw.patch | 44 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch b/meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch
new file mode 100644
index 0000000..0fae9ca
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch
@@ -0,0 +1,44 @@
+From 3aa84c47e88a4c38446ce1323abf6f2c77389104 Mon Sep 17 00:00:00 2001
+From: Prabhu <prabhu.sundararaj@freescale.com>
+Date: Mon, 16 Nov 2015 17:09:32 -0600
+Subject: [PATCH] mesa-demos: OpenVG demos with single frame need eglSwapBuffer
+
+sp and text demos rendering single frame. to display the
+single frame rendered needed a eglSwapBuffer to diplay to window.
+Hence added eglutPostRedisplay to display the frame
+
+Upstream status: Pending
+
+Signed-off-by: Prabhu <prabhu.sundararaj@freescale.com>
+---
+ src/egl/openvg/sp.c   | 1 +
+ src/egl/openvg/text.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/egl/openvg/sp.c b/src/egl/openvg/sp.c
+index a20c0a3..468e91e 100644
+--- a/src/egl/openvg/sp.c
++++ b/src/egl/openvg/sp.c
+@@ -500,6 +500,7 @@ draw(void)
+    }
+ 
+    vgFlush();
++   eglutPostRedisplay();
+ }
+ 
+ 
+diff --git a/src/egl/openvg/text.c b/src/egl/openvg/text.c
+index f5c6de8..492581c 100644
+--- a/src/egl/openvg/text.c
++++ b/src/egl/openvg/text.c
+@@ -360,6 +360,7 @@ display(void)
+ {
+    vgClear(0, 0, width, height);
+    glyph_string_draw(10.0, 10.0);
++   eglutPostRedisplay();
+ }
+ 
+ 
+-- 
+2.5.1
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index 2df9bba..034e01d 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
     file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
     file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
     file://0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch \
+    file://0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch \
 "
 SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
 SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
-- 
1.9.1


