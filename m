Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 862 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jul 2016 06:02:42 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0054.outbound.protection.outlook.com [104.47.32.54])
	by mail.openembedded.org (Postfix) with ESMTP id A334C60557
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:02:42 +0000 (UTC)
Received: from BN3PR0301CA0035.namprd03.prod.outlook.com (10.160.180.173) by
	BLUPR03MB246.namprd03.prod.outlook.com (10.255.213.18) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.523.12; Mon, 4 Jul 2016 05:48:16 +0000
Received: from BN1BFFO11FD002.protection.gbl (2a01:111:f400:7c10::1:172) by
	BN3PR0301CA0035.outlook.office365.com (2a01:111:e400:4000::45) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:18 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD002.mail.protection.outlook.com (10.58.144.65) with
	Microsoft SMTP Server (TLS) id 15.1.534.7 via Frontend Transport;
	Mon, 4 Jul 2016 05:48:18 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6ua030562;
	Sun, 3 Jul 2016 22:48:16 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:32 +0800
Message-ID: <1467611193-31658-6-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120848984632143;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(97736004)(230783001)(50466002)(48376002)(92566002)(77096005)(47776003)(104016004)(68736007)(8666005)(2950100001)(8936002)(356003)(6806005)(305945005)(7846002)(50226002)(15975445007)(76176999)(36756003)(189998001)(229853001)(19580405001)(110136002)(69596002)(105606002)(87936001)(586003)(81156014)(2351001)(106466001)(33646002)(50986999)(5003940100001)(2906002)(11100500001)(19580395003)(85426001)(86362001)(8676002)(4326007)(81166006)(7059030)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB246;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD002;
	1:TD6rxMTfTgbRIe1a3+2nMd+BNsgw2hLIHGUsWgie9z3MJbH5LryWbjD0Kb+Mdmrf0Okm6v1AXcrw/1S0Mbp2RSsNk9Y1wFKbGlk+CS9pGUfvcXyUeGzwVZAAeLIfKadKuU7hIEl+hi1vr/3vgMWdWwAA4Pl2xRArDm3cvrUNlOXEJnT/EhR6V88Fl32odeXxsPKX921Kh11MRsGluox/6z+QnvhJmSz9c8C7Khw2hzjFTwE2REOyd5cFKgivw6jBOfe81WAMwVb4btyJP0swT3lO5Qu9JjMjEDlPmNxoN0c3YV3qkZt4gKYxNV2eDzJCam5Es45AVPBf4Yt+VjM/pDpMzXf2qinUyaaikie/wj1CmL/6ZtOUDbi56RM/jN0OHSQIetTk2YKag7OFbd+Rosfp51y7z0Ut4uh/vlLxaDtQTSfJPFmxGaSb2YsuCpBnEV8r7fyPxZDgTEsNTjJHQ/2nee7Rysl+Z9vhrMD84FxVj6KC1GbvgXg5PnjuHwn6q+qTMnbG6OoM9HqQKc0hoeFP/pUcsMpQFdb7t7VBMgweoUbEKKv5nyFBqPHQmSHpZ2kzFsaYu4wFICqRcpyO1MbsFGsFn8sQ73/MKGKqOde9t9ryno4K9yXPBK3gKsBcR5ZDM+Xz5pdYHSAjgEhqMdwVCGFzRTiLi99Yv9Zkgwc2quNdqTEQueQxaHNSqZSUiD0nzgAZLQJr7yM+kak5Ct1l/PFQbsaR5YJ0OZOAJVU=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: cae7ea15-4ddc-4ebb-09ee-08d3a3ceccd5
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB246;
	2:oEBPissilMUEEW04IxawIIRBVApaPwJ9o7dooPKBagqjLzT11EY64oY9lKVNGljXAmK02ourJaMYRn+0UzN+xda4RzXXJf+1kdW+dR+1POP+MGd20SwCRKPMgPsRYnDDillmmssjAhMOUAbAjfGlDyc9l/5X9u+pGWyDz9+MrMxpPgMM3XRvQQV+I6ojN6WK;
	3:pkUre/Dl5/gBEd3yhbPFcMUcUxoS36d+wUfyoB9rn0M084VNIAK62CEmFuRzMTScog6JJfL74fw6/XeiyBiXLL2QqkvyulwGN62ztyFkyqD7A3IMUlstFbX4jMIt3Tv+4rB5HSd8Na0ctK206RFKzzOvmWIc8PYvSD+ypsHwJvzAZVl8OusUlK07xtXIOPCnSBECbH68dL7gZ7cvO8MAfBru60/134UIBQVoN+Ws5qc=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB246;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB246;
	25:DyEUWpl1P7ltQDpiRigyh3BcXH1Bnbbay28tHE1DYVG4QigRkXPqj8O22HwHaLaYdvizN9m941R4b99WYwOm+KKWEwdctGOYCqRPvke7udbcZpYI43TBmFazmg2aU5YV/1mFkkpRlImYUVc2Y9LWiGDdHcUJn0epQ6ya6UmQihE00RNjVJeH+jwS0spbR68y0MgNn5yGIFw1/vz/QPS7lBjqGVxasvU+ncb3iF+mB08lY8ocN8JirrPIBAX/AVX0td+8eG8aTFah/fWTIZbWKhfGwk1u5hTWgOrHlVvm+eP6vXBLwxoU0zHkin70ao1D0+EUELIhlV96ufKH2ZlE9PzVB7N6LqlpgZZbpm0RWx8v+YtUwDmMRwa8hpFqU4YDhMPX2JO0EolbQlkGTAjhIIS2guFZXUD8dkGG23v96kH6zc4Qt7IJBEK6Rhr5J9XIbtXOCROrfXqhCZrUWkTckpU5zTwERtoyiPPuw/F8aw272h3TffUcYIkF7bFdfF1w5a2V0YljQTjDKA4xORZPX7lt7lfUDJmJk136udWiRVPv43iN7/f4wzkeecA70JFkJo1/UaztbmyyO3D4d2K2BH4cCgsLseaBiXXPQdHnA1z5KMaxVGSLvZ/CarYj7X3Z65Ku5uhb6Ti0LYNjtaUnmlZfAHQLO6/yDljVRWHdIYXD6GY5980HfglaARBFzLjIT+r/g90CMWEmbaZCAr50nViyqpPa3bj8JczRjtcH83qGNfsi3osJ9h2oCuzMS7Y48ovGQ2vwltLKAFWa0SYJdFYwPZsmjsZN0tBSxnD5J4DdOOmZCUVGatglZ0iCsmg5J1VFC4KIoU4FWBQmvwXW5A==
X-Microsoft-Antispam-PRVS: <BLUPR03MB2460B875806B15F65BF2D3AE9380@BLUPR03MB246.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13024025)(13018025)(8121501046)(13017025)(13015025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BLUPR03MB246; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB246; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB246;
	4:DzVNSDKUG+42tbHzXuyWqvzV4vskcndtcGieoxEhaeapTZR0iHfe9D8Y0HkQ/XGu4DMWsZha7+MeTd25hbiu3LKlSfixO2+c46jDl53+g4OC7tQLXxaEIG73iy3m079OeukDFII5NJYJkOEYsLprm5HB/FzTBZUtAD2rFbVqN1l6D2auk/QQpKQVdL7bW8+feaWwFiytN/DMkUjLeaLsCwjhmRPmIIo1VJ4FeO996AR9w/iW11YvdGEMMpHO2OgO2oxFIfRoZiYEcZ8N9huQypEfzYgFW7xZr4jpRTi/5ozRfkS6D1TY4KiFowirZATLRJ9HNsPspSYP+KnJ/Fd06Fm9wXC2ULVb4+XTf+aKqKO5AUJ0MEtoOkfUO39DLoGoYdeeEIA4zQjGx7txFqqnVBy+O/Osi8lauR4NTUjzmMdB3mlaoc9n/0IdSf/10/LoLPa1ou+nBszfpCNyZl4360OAxrHv4g8yJP+swhgeYdqno3M7WJFuGWvf/5K1HiT1d+RY3z1z8wp9Wmz/dZ6rBA==
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB246;
	23:9x7NU6iNqz6YEq6Ub32iJiaAtJVLlS8PQzPKCnGxbe?=
	=?us-ascii?Q?x9dcooI/p89XB3UdGsxV62HUQezN+M2rZCFzGMjpEzVT05yJTy6oDW0vXATB?=
	=?us-ascii?Q?hioa3u3iisVQdhNq270HDryTeXjljbOl7dQV88OaZlSXsT84oakTf8j63U9m?=
	=?us-ascii?Q?G887oe1oaaPeWL0txKfJFyckOY8NW0o5PP75Hn+mP7sYaqtSihpz5vHNjOr4?=
	=?us-ascii?Q?sbNyj0SiVy/qcV3kEwCyu2EX92Dc6YKr2/ollDmyuTu9WfrIBnoXhTrCdmM3?=
	=?us-ascii?Q?TfcxlINPQqG3JhNIyZJk1NwZ9DD8Nd64pQA/XetAxpzP2Bl+Y87g4fH4p3fG?=
	=?us-ascii?Q?Hu/n6k06g7Q8EMjvtyPmWwETNGAwUwZPjIxuYw5wB5U2HpBDghV9pFiETdRl?=
	=?us-ascii?Q?xXhL8he32V86Jcq9erEbZzJJmlufHOnBqDvgOh4zHUEBoN/K9WW9sEtRB4v4?=
	=?us-ascii?Q?kfCXNdoRHDD7i06lb3a/uP6k6tYb/5cyd0epyb2FEnvMD9slDFe27Hzxt5eV?=
	=?us-ascii?Q?0ARJgfBrb5lBVPfXmHyHcs7DeQhXtO9cM0brwwzC8KxG2qC3Nqd/d9TEHOmu?=
	=?us-ascii?Q?0J88KKU7AbWwdILio63N46Y4FX+3kYtGsohL0hUMFV8qHq7aTl+em/f+Ypeh?=
	=?us-ascii?Q?Nfg/yjd5khaXyTQI2N493GbYzoA1VlN2HshFx8tfiMeNU9zDBeLKny2tRjxT?=
	=?us-ascii?Q?rKniibh+BjiYH0HFFmXj9viGBYhpC3vZgPIeyoSFqrpP+jgvWlbLHfeTz/Xq?=
	=?us-ascii?Q?DCoBKDP1ZvYUXvvGxqwJkvdkTKwe51mkWY7xq/nWEHBYm4Ee+ATB7VtlXqDB?=
	=?us-ascii?Q?wMBybSLcX1ISLiBLgymoI8QrOF6VRXbG7nW2zl5monjrtaBTtDitdxb6uKkk?=
	=?us-ascii?Q?KAHcZDIFpQgZypI9U+jFnpuAQ+h1bdPZOow2grRI9x6BTx5f7vTGynVZ8UmC?=
	=?us-ascii?Q?WTEypOAxXTFxyFd4/9KO1vBx4iUbj7NNay+5uKr/nd0Ir6es8ibVZahYa4xZ?=
	=?us-ascii?Q?xKhebnJLuXuxNO+tEyExbu2PogKajzj2zgKtaU2ww2nFHlYernPLOvLAhjAE?=
	=?us-ascii?Q?Iel05BZ9ioBzDqQwQJVY3IStas91w2bJj5CEKTlQRPzO0R8vnqiD6uTJ3mYb?=
	=?us-ascii?Q?DfiBu6fIhzbWL6jvFlw2/yOl2xLjwvzM5cCdHTACj2PYDO+mu+4pygZeLY8f?=
	=?us-ascii?Q?Xf9HcNQCgb/wnzmlpu1Tq4+1vPzNRpsEZ+0zVyTi5NLDwIbvzXGasUSxqGKv?=
	=?us-ascii?Q?2kr4BJKp70dTg5dgs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB246;
	6:kp/Bzvb0eHeoiH2bT9z5WQL5arrQcNeTnuW7QNfQJZggCSrznpMKLjX3nYdzQSFZkBjF6M2GQ6llsa99k+mq0I53T4DdhJchT/OiLZ9YdT5u4CO59lymDzlXXMI88z+GSyNE+PHW4Q153/oCkISIJPaA4H3Cb4JZNjGOxWmAD3U/MXYDzhGyVmWKZRLBoM4KNEvFWkmxLg6ts1QKg5XghWLAiASD1Msu+8KH137ZFcDiYpfO1ivCmHMbYJ5nUth2zUhb2biowBRijZucGTBdxM0l4yx+94oRFHodhZKHGI80mbDfr54Ye8Fd3LIdLzNx;
	5:MvSzqB4MEuFiLlqAlTIU9KDmBk2qTU/Ckn8nbluXoTl0tXNYdWXnvtoaBhHVeyI4CWvTE94rW4gOcq0UR6/q3cbzOfQYwUVgqKok754NtEziKAX3+AEwCVwA6PJ6lU+x8N6OvEe6Cv2jMPeroAMGmWtsQRBFT0QgKcXY0H6hat0=;
	24:ZSjfJhbwtfoofWyOdwcsGCaZDdI8JESe9IsfYvBa03z8jos0QD8G//BQ2NsRjGAo/d37q0074Fzhivr6RhNHXix3NdGfimRRMUjK3qzvoUM=;
	7:mJQwvukOmZ7GS97Ca8xZ+MZLF09sN12qdD4J0gxZhpQGfCjuj/6Jsg6ftF9PmtlGj1KgUz0FEAk77H1PLp/vn9PqWqjreq9nRADYsyyl+ylu9kNBQS+E9X8rC13gFtH36X9xKMa4rKDW6m37PRsbFDAWJoYLgADScK8Kdb3ATQtMW+Vo/DsdPDgiKcfxdoEfwyld6qnE7KgKU0zy+yaiZ92/z5EbJP0uW8S4AyGyxDsUcF2S7a93LJIoSUEM1IbLk7YnmXzsu1d/cWTRPC5KLA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:18.2292 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB246
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 5/6] gstreamer1.0-plugins-bad: Use the newer texture() function in glcolorconvert
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
X-List-Received-Date: Mon, 04 Jul 2016 06:02:43 -0000
Content-Type: text/plain

GLES3 deprecates texture2D() and it does not work at all
in newer versions than 3.3. The new function can fix it.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...ert-GLES3-deprecates-texture2D-and-it-doe.patch | 51 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
new file mode 100755
index 0000000..79ef4c8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
@@ -0,0 +1,51 @@
+From 764fd69f8482eca9f925cefe72ebae090ae59d43 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 19 Apr 2016 19:27:33 +0300
+Subject: [PATCH 3/3] glcolorconvert: GLES3 deprecates texture2D() and it does
+ not work at all in newer versions than 3.3
+
+Use the newer texture() function instead. This fixes glimagesink and other
+things on various Android devices.
+
+Upstream-Status: Backport [1.9.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=765266
+---
+ gst-libs/gst/gl/gstglcolorconvert.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/gl/gstglcolorconvert.c b/gst-libs/gst/gl/gstglcolorconvert.c
+index c23624f..f472d5d 100644
+--- a/gst-libs/gst/gl/gstglcolorconvert.c
++++ b/gst-libs/gst/gl/gstglcolorconvert.c
+@@ -1716,7 +1716,7 @@ _unbind_buffer (GstGLColorConvert * convert)
+ 
+ static gchar *
+ _mangle_texture_access (const gchar * str, GstGLTextureTarget from,
+-    GstGLTextureTarget to, GstGLAPI gl_api)
++    GstGLTextureTarget to, GstGLAPI gl_api, guint gl_major, guint gl_minor)
+ {
+   const gchar *from_str = NULL, *to_str = NULL;
+   gchar *ret, *tmp;
+@@ -1730,7 +1730,8 @@ _mangle_texture_access (const gchar * str, GstGLTextureTarget from,
+   if (from == GST_GL_TEXTURE_TARGET_EXTERNAL_OES)
+     from_str = "texture2D";
+ 
+-  if (gl_api & GST_GL_API_OPENGL3) {
++  if ((gl_api & GST_GL_API_OPENGL3) || (gl_api & GST_GL_API_GLES2
++          && gl_major >= 3)) {
+     to_str = "texture";
+   } else {
+     if (to == GST_GL_TEXTURE_TARGET_2D)
+@@ -1898,7 +1899,7 @@ _mangle_shader (const gchar * str, guint shader_type, GstGLTextureTarget from,
+ 
+   _mangle_version_profile_from_gl_api (gl_api, gl_major, gl_minor, version,
+       profile);
+-  tmp = _mangle_texture_access (str, from, to, gl_api);
++  tmp = _mangle_texture_access (str, from, to, gl_api, gl_major, gl_minor);
+   tmp2 = _mangle_sampler_type (tmp, from, to);
+   g_free (tmp);
+   tmp =
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index 825d100..49b3677 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0003-glcolorconvert-implement-multiple-render-targets-for.patch \
     file://0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch \
     file://0005-glshader-add-glBindFragDataLocation.patch \
+    file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


