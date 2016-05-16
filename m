Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 7346 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 May 2016 15:55:06 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0088.outbound.protection.outlook.com [157.55.234.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9FB560589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dsBk3F9wm1akDYm/3qTrBwX9cKaTKzYeMrX5kGxFqgw=;
	b=fknjPLkuk4RhF7Bd0U+ze0gzp/oRh4IKZ5HnFBLVziINyqw9210aFkrO8pN/1FsxFPbEzYyqA94PY7ShmOf5Uo4wTuoyHLrUqJQMDtzl1AIxpAuGYOCb8u/UZkOH2ta30nTKgRKDElaCeKCjE8DDOHBJ2q654X7ziP6nQ9HRudg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	AM3PR04MB307.eurprd04.prod.outlook.com (2a01:111:e400:8825::24) with
	Microsoft SMTP Server (TLS) id 15.1.497.12;
	Mon, 16 May 2016 15:39:16 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 10:35:33 -0500
Message-ID: <1463412933-15923-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: SN1PR12CA0036.namprd12.prod.outlook.com
	(2a01:111:e400:5174::46) To AM3PR04MB307.eurprd04.prod.outlook.com
	(2a01:111:e400:8825::24)
X-MS-Office365-Filtering-Correlation-Id: eaacf4f6-32d2-42c5-bd67-08d37da03d66
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB307;
	2:PQVuo8GHtyWzqHrIxzZ86uw1ZKKE4fA8McVAJpYn9l0rWChkMm8FvDuJHIykJn82Pm22jfat6/4nH0BXfpTW4O4Bq6SiTatixuguLMGVH74op4jwefeTv4sUUwIK9yImn6oI+Z+hL2TyiE+oaRzwL7Tdmi9DkHCreghUOVgyxJmtXmy9+VhNPauc3QXxj+N0;
	3:SgBOw+1/MdnmsVXVHqQw1r6BLALaJFtdFblw0Lcopn4kNbFfCpZpGBA+0wu6CMw0O1a6kDaphjFrssVS6dlSkBol0o9pvxvIL6JxtByBv4cOCyd+ZWukopT+KyROjuAT
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR04MB307;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB307;
	25:Gmyrnh4sRUwRvwZxnyQJKiSt9zGZLOmsPLoEUxAPHfKra+JlHQZi1r1giWKTLxv+0ilrUz3NWDHPUcMrA1bFqjVJPqwvX24w4LIJbE0qBbKlsXm6iZ6rovVKqEMMtd6DH5jO+h6+9xyGhN0/K9bX7zu1QQE3Or0NBZU+TcYADeGdWkZH4+9R8SMR/orup2svia8ndrUeAo83SfCPewCTWVnZcPMfHblHGjsxL5ekwoAEXUkk8XJuAA4l+kb0HsAUjPxtSzo+p9+xwunkFkKobYYk7BHoOw5bP0mKXG1eAQj9EfqyupemLMtnBBYj2pne3wf2hmWL3s2AbdShutPTLJRhT2JYrCwkUrIFRQMnzWLm0Y1ZcWV094fooIEsBDOnV40W5Epm/LuM4opM451jaK7iK5pqouMqePVZUvZkKXwx/zY7HdH1jkY9zYFQSokclLUO41gGuFVx14Y/GD7CvnjNKgkZM8OUKcSFNaOlLfobqY9QsS/Ar8EE27ceWPM9SYKPXBnIoOd7az/Uz+xUx6FFMUzVvxOZ4aOkvd91T2WUfB8g4pi1m9TB7Abwn/9VCWlKs595oJm616R/onDNSH5YOBL+N3aRCDpPc2NNwsUwUkydjE9kxJsHRb8aT7iKmyRiQ6mn4dhySyzfOs76j38XEo9UugiOI546lOmftqRzud5J5g0BzaYLopu7JdM2b9pY2qfYeq9SI9TRmcGNFg==
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB307;
	20:wSeI2df2gOeETH21+pmuqCPwqwEGBlpfoMdOuX6ufwLgkES+gc3RemD5q5on0ASo8R7Op3bJsLglT1Gy9+xh8WfnJ+uiFh/yeSse0PCC1B/A+EZqUuYOwToa2GDqOEYhaLJgF4Zc7PByfsAms5IG0SOEGhXJ0/0qVn15A/tQYY+UtqPUiOGrhFReAKQ/5oFC5lveljtMb8mfrDxTnTaojL2adOnYVLGK0faR7OE7eQYCANFfv+J+3RIGPH36w7nRDJWW8Z5dOgFNhCiUmFVt5hyMuHvkXkA+ATvF0JoMM97OnaxQ6B9m0wPebJBpEI7ZytK2hQ/mmfohQjHuVlQxj4RIe0tEACPajmXP2LQWmMlmC9C9KU3zRj+V19r6uXMVhqksrY7Zb5+DGg53cs6xPi2LmZhmSdhejZQtz/4EAACmMc+FnuhX8s5FM05cMXy0wpE2hbbsYgbBza6lae5bdaoxBK/wed0oCTlM8u5GJSoL40CXnkKhid59Er2dASge;
	4:fKvG59IKLu8JQTH6hQEiqqSeZSRJmXH06hlAR8sKAqgK0EGvD+FikMCsvJhH3essQv4b4XFk9aiHC+yv2FkfVgLqnCvjWlD8VOpMOz4xfitM+soij/W+9n+gBtUfjGfHX4utsRIHTKvSB1m+tIdKW5a1xlsja5SthxmzCKCt/wXxA4BeEc5BQ+elca+wnf0cEVA1ULXI2ZQqnFfXMeoVD/fOpL1wSLUsuxB2OsLDSC5/Raz3Wq1qWPGN/e2nzmPTqUj6qUeBmhIJLkGHtTLNxGFHSiA565GVCYJ5Cafugs9vyCi+rdVH4V+E235+t21rsBBp/bv8IzzNzzKpkQFDUd/XwiPF3SL35XJX3MIBUFEl7Z7ofLJFnk0gZtMaQVsdvdO5cgntttCYpLfVNtz7rQ==
X-Microsoft-Antispam-PRVS: <AM3PR04MB3078E1F483428C56C1AE1ADE2770@AM3PR04MB307.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM3PR04MB307; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB307; 
X-Forefront-PRVS: 09443CAA7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(86362001)(575784001)(92566002)(36756003)(33646002)(229853001)(2351001)(50226002)(66066001)(2906002)(47776003)(5008740100001)(19580405001)(19580395003)(6116002)(3846002)(4326007)(110136002)(189998001)(586003)(450100001)(81166006)(50466002)(5003940100001)(42186005)(50986999)(48376002)(5004730100002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB307;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB307;
	23:5vMkmrN0mpUPGUJeE3Dx9DHLuwkiZ41iapwMtPsQy9tKRGrfJGzraVXDbnyuuDLQRaubxcPQ9ulJv1EBR/1+xR5QvLHZbnFFmYmQ9iRBlZoR0fc9uOGaqoN0pD8esBqKNqkrtHdvGZTyKNM48bdcQX9aQxp0n/XdR5VOYeJYdkjNqAPO/BXdSQuRAkmqsM92sBkGrWqncoqXbxtzqdECWEiRY5ruJhELNYg7oUu9IpRw9OHJc5UjZTroZS1AN7Z+80vhiaLa2hoFpG1MBJxGMa91dva+IH34JRp7RoDmGAtSCaMCVTN56waibAwBLOXxwRtaoHjYt9xMC1xHOCKgtKJvSBvz7zTEJ+2Wc7M8nV3FefR4jt89OKijPUMv8/ZOyV+Wt8T9FzmBLzF7NmyMwIumHw55X1103gGKqwtnXXgaFm+Aq1f0ZXcl1bu/ZuV4asBFuwhkEnwtAXJMqInSmJ0oQ7eNdixM6E24G9taSzsVUYhGJruSHPMJOE5qLoJu+OXHcEMbf8qs5qM2DnaeW7j5xwus2P9eMzte/UFWqlVAPX4EX85aDLtMmVfhMt2wAiWhL5Ro1IPq+xWlQyyeBgTTyfAnG0kvdNpIuhCL5ouUYWgrV4BxWQ2xSD5uMkhJ7JCqumMtn9h2UfrkK+sm0fb911oFWhbO7WxR6gG0gzsYJKKUwZgIBUwfQn3Sn7346Wwh8jeaS3lw1oo56sMA+p9An8JcSUghJ7B0abxSS9TS3JnMHo4OSKm7Ql2cB131WXHFwLa5Rc7T3L/T/sMMvKmOFjmm72moeKzCsdKmtO/lfkkO97Wn0WEAhQB4DiV2P1YFulDiIaEeTX0YYnH4Fj3hM41Ygo1V8hcJ6nPN/Gc=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB307;
	5:5b5olcMPB5a+4v5Fku97c3P4GXMkrdPUWBr2nGLJ54aC1xlUboU/aTiJ13DosMJM68NEQZ/IJOtP1emtYE76JVHsBZIBCJpDNmkOsXkK55xgvEz0WLgaGsN9HhCaJ9tHnhGHvoinmWMOPFxKDQZ92g==;
	24:ealEEdt92b8c6Idhq2JIONyVWgPE/kcs0XgmweZ0JQ9ehLhSmTGrgKQzO9l7l2rnjSTELFZDgWkGqARcX3XrIxrdKTQLbfVlMFf+lbSrf8M=;
	7:qgqIhjfAUEOsheT+6TyxLBj3dHfvzWK6c8jPxy9j4Ol9SZcvPJz6sVzcvwgADwxbbU9yCMC0rlCyQs0D/NvoxXjNu+8VbwlEv4GHXaM7CXkU8G+sn/xlEr/+FFtFtkTpHntUTWfElPiftWmFGtFthQ4C0VAO1RbQXSzwF8RCMnqAEAFC1iFZL7RpjszJhflJ
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2016 15:39:16.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB307
Subject: [PATCH v2] mesa-demos: OpenVG demos with single frame need eglSwapBuffer
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
X-List-Received-Date: Mon, 16 May 2016 15:55:11 -0000
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
index 0000000..c687647
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
+Upstream-Status: Pending
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


