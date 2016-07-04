Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0045.outbound.protection.outlook.com [104.47.38.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC73A6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:03:37 +0000 (UTC)
Received: from BN3PR0301CA0017.namprd03.prod.outlook.com (10.160.180.155) by
	BLUPR03MB583.namprd03.prod.outlook.com (10.141.79.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.528.16; Mon, 4 Jul 2016 05:48:20 +0000
Received: from BY2FFO11FD022.protection.gbl (2a01:111:f400:7c0c::154) by
	BN3PR0301CA0017.outlook.office365.com (2a01:111:e400:4000::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:20 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD022.mail.protection.outlook.com (10.1.15.211) with Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Mon, 4 Jul 2016 05:48:20 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6ub030562;
	Sun, 3 Jul 2016 22:48:19 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:33 +0800
Message-ID: <1467611193-31658-7-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120849003343580;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(19580395003)(19580405001)(189998001)(50986999)(76176999)(69596002)(36756003)(4326007)(92566002)(85426001)(2906002)(68736007)(586003)(77096005)(5003940100001)(2950100001)(15975445007)(50226002)(230783001)(105606002)(50466002)(97736004)(305945005)(33646002)(47776003)(48376002)(110136002)(6806005)(104016004)(11100500001)(86362001)(8936002)(575784001)(106466001)(81166006)(229853001)(2351001)(7846002)(356003)(8676002)(8666005)(81156014)(87936001)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB583;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD022;
	1:Ld3BatYeZ32tlGeapeCNcxw8CoJnlgwQVlgsLOgR/SnpDtFFE4vuZru3kwMA1vZTPKSkpFakXtDkyNSFQnEEdf5RpZpmpWsEpQ95SEdyyYX8QZw9fwKyoY2rgHPhdMly9vFfzs3xN+aif5vs5d09OETRej2OrKnWU5ek3fZPUgGSz9kduvB3rSoJAn34CZ/bugSHTT16nwioxP3MpTjwm2o5Ud5ahEi71rCfz6j7CX3kil4FrnxSGso+18zasQRJmGPY+lR/uLLtW4dVQr99OWDkdbvsoRwt9CJWyw+YItbLGxTT6gUwn/vJu6EbwG30gIGctkykZOr0szzS7cRmTDRyzvMx6XkShFsEuNAMz43gwUQ3AgIKvc6BqBQoyFXmt6JaTXA4pTSc4BP7PvqlnP88cdHRMPD+dBVziZH+/aDDyNUi5j6sxIkl0ZZ0hjdCJ9bH//Fb5TTmPEOxXsnIwXrEpXMV2fCRbkQFLiJYsocCctYcFo0uTl2XHlA6HbZrrFkkdv5eJxnnXz1OoXhmxA2oV1QdTw8vaQkCHvS/rMgANn/awmtAPZ6OsdHQ93oK9AytVR7SAGF7vSKEdxkakt8pnYtUopPA3MWlFQpQCOuc8Kp2vgY113VmFQgjDDTxhG+T0Weokhq0vU7viAhhxr7uyNJvt2FZ8uCzw7N6Ev1QKRh4TJqH+tNSjJ+/DH9lnp1TNvTgjlHS1osrqtepsRx/pBGQJDASVLci9sSd6jg=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: abd05cfb-c7d3-420c-eedc-08d3a3cecdf4
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB583;
	2:fBeU/62mLukRbHvNosko7oIPXlb/mFCdedsruWKpxuVpPYwpewWmy3k+0V9iWm2LB3HnUR7OKW3u+sbd7WbpDxb1pDPOiMaFKhmecPFky963bkdL/clB2BX+0WJLFZFRYAHU0GKVFfbG71EGe7dfGeSJ83vy9hWMAjZeWKflc2XMOf9ipOnjKGOduWzGNn/c;
	3:RF5XGixVJwofnhuPjX2agkHvlOk8hLaKL6u+vQOco57Uif7C3Fj0oVmx+Onjed/R/ClrkjrTwH5Uf06ZyFSfECbOGREcPXIYZUBDmdbqO0kFVEAjeRACzCCE+srb3Xl8eAzI8wexoNCE6cuCBuHdk/v5c2lYznOGjooDHJj714iiHJnTt9hFMGfRjvMWp7J/NmrI5onVCR/vGJ6MdrfIrd5+rXYVzcnb1DTibu9vrbg=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB583;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB583;
	25:vHS2OYSbuM0k+8DWnfRPGowmjmSs7pKujY5VMtIyPL4fk5F3ytux27CXcOp/Qie0cPFAd9Y5Dax3fmw38PwxAhbP6wEMsVXymLX2p1h29UWJ887CSdSWcsyWvMpUWIdU6MB0U3EJtO2wx8CV2UTZEdRsvqK7tgPA56YRUU+TwFERbOXsoDFfOgORUXW77j0Oj3LQk0wh/rfBnb8nmqwveFHaOueaySNooASjVFnfugTK5YB21Ryrvi340/GZh7lLX9MJuRXgUJTzRKhxtLBmyCNexkohADt5gfhJuT2xkBq+LJLPX5zmAyolk+ZKcs2DA2rVJlzesXviEcWTtI09HWqlIKjCCvtLXc6iHz880wyKxjHApJaAqxARFoGpLSChtYnMEi/cUOK61gv+5dnlduV35cD9kp4lIE6bW629Nhd0XNUlp/Sap1rC8i43FvA99hER/ks04qL1GMMgdZUcBc2lX8GHSYWOvYpnaXb7dtMxn6ONbtevDwHRtUO78ODsmbbI83NbOw5J6hrupW4CWgaxKejoeTJmR4vwdTCffWFoO794+u07wR8RIOhyDaOj/G+3Nup3ZZwONGdoRXpucywxezrljq77cpUELkFYUZ9jJT35NbBykQGPsT58RGWHOPnjYfPj1mxRpUTJ+3EpCReiwYIu0TPAMRfmHfKZJT2zG79PO2B00HVB/fnsCiP7krLvRWT9eOqZwzrT5P2F1YahqNBDyyxmkacDNGorzk3j93ZOAuPOY1HQnLii5Tr2nBnbCi2LUQvCjMuRKetZp59eGIx/v/w1g3anbPSDyWNrZnj7FQi0VBQiVQvpcNM43FjS40jsHNrVxOCWqDx+IA==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB583;
	31:j7zS4d6UvGeXJJisVGYmPfPFs0gWBOSzzckYDQvqJOjSZXNjyJvg8hsA6mhJOTdFNb4y3A3dt8dkZCzK1hx1lQxJZFM/7EjSAU8rpWfmFCS8gPyLCgYvRYqnqLrRhCn/UR20FaXEhzVTjJQDQ+xBjOyiYGFkIS+wgZNW+LbI2t64ZtKpHfo1G0w6nOlMmItbw6UwdYbrwbRSVhmzkiPtJw==;
	4:Ak4milsQISB+SqMNYgCn8DW5BSjEJ0YOkZq3ViLfZ7mNO97Qnu+83Uw2qgeithijU/IYnlDetnvnpAWk4El2wCIO28g9AD+dwfK2i3NLOpN7lkYuHyeLt+O6P89BjjY6azVFDMKfGLY+8NBvNfPaILtD+7itqsj5Tf5nnIA565upkDUuLrb/wHuFAMMbhukCxrcVuv7NuydgaRQnlKhqgfWZQMtrZ9ODJMfzUrlg6RgtWrpycMNeljFHkaXX8m+JPpaMRLCG2iU7lIZVvwAhPSxulZiD2iCr1+9zMW4IIbtsQkLflhbjcpTHHdYGtGshEUOhh1G/ePLDxhSOsJLQ2bXYi7dOB+pqtwO+sS5Dm99pEzIjE6q6EJHNmLCqklNQGDhK3gopJDINTgw/XcmToY2SEtdVFQXUFkABr1Z1ZJB3NHfru8VDSiXbM2w4YrD7GQijiouWGXCSkGf822yfn8SMYhBz1eod4NUWENxm7EoqZhaNjUsigVPnUPf1BBnRSQkVltUeHOExCXbfRBLZaA==
X-Microsoft-Antispam-PRVS: <BLUPR03MB58399D2EAA2928293E3B577E9380@BLUPR03MB583.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13018025)(5005006)(8121501046)(13024025)(13023025)(13017025)(3002001)(10201501046)(6055026);
	SRVR:BLUPR03MB583; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB583; 
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB583;
	23:ai0wXc95ce/sLPer6GeRIP8EW9ajwq8qdx+GilEQf6?=
	=?us-ascii?Q?lhOemt8qtNFa8JCI5T+OmtPnQo6YhNLpphJ1va/Wlte6ZIKgwscjKaT4VAOS?=
	=?us-ascii?Q?CF4ZeRHxHKTyhCpQYVuKjIbcMHPxPZrs1myNWm8vCyWRZ8neO7xcfHxvGsTa?=
	=?us-ascii?Q?gg62s1WgHt4iWNz4mW2VRlG8b8zcWykOoXy0rD1XgWfrF2ggj3kdj8euncEI?=
	=?us-ascii?Q?R7yNfyK7FQmb58MSFqjAXbU0+36IT/fE7i3H1yXQizyLIEB0yqFue3PZr2/g?=
	=?us-ascii?Q?Y2nZD4icZXQaDb46MLh2/jDZYuHNCu8KoTf1JJo3h8u3hR3T+/n9JAgFd07q?=
	=?us-ascii?Q?DYSOQKOTERQzIrlZS9pRetubPm/gtGwPnEF0HQtyaj1klcBvyJen5bzqLqgG?=
	=?us-ascii?Q?kNnSBkiqAx+jsEUDmiLxYl73i1DVuQVF3wIy84MuX1QNlTdVCXz1B/gbPA+9?=
	=?us-ascii?Q?FcWNKVy4N+4xusR41JUxroDEv+7HL1JXqUlz+IzwnU/2yyMGCYgt0CdNeSrV?=
	=?us-ascii?Q?xxRZ/E9xRoDWW+JqNv+LGeZ9ET8fmxi9afeyhT/NbzS8q4tziiO650HSkUEg?=
	=?us-ascii?Q?jT5RCqEDooLNCwnRvoqfDL1Vh2uWOwg5rGR4EEsqqhXK88igcC6JgrdpV1nd?=
	=?us-ascii?Q?GrnS1SrnXriebS2CuDvmBduB6MO+V3OjJODovC6Zufmma87LvK8462qIg76o?=
	=?us-ascii?Q?15kjFSnVWmz58xMVF88JLZ88cV9bdkfJpDT5ed3mX9TSFBFB2QvCBm87DLBx?=
	=?us-ascii?Q?pR1C875XtJRml8l/9xr0aw07EfpUwA04i+3tUcBouPLuymDZ/rgKEPTPTYhb?=
	=?us-ascii?Q?jRFRhXikjJE/yEXnrF5ItdYGtcgiS/ZEaUU1Az3P/mOtf7YaMQs3OCv47flq?=
	=?us-ascii?Q?mjliFNMrxkpqCu+zfN4uhDmN8q7Ks+y1l6LLB5v3eFY+gneUnNUhrV8wjSF2?=
	=?us-ascii?Q?Fre6OYdSDPdOb/XZ2Bu4OGsknhkLlyFiBe8TvYS91TjDG+oDZ4O6wYW0r4c/?=
	=?us-ascii?Q?9eJ8oLK5gSevARh4lDUAyMrdje8BxFKVfpGs++OouXIznBuhK5SadR1p527l?=
	=?us-ascii?Q?rFyB/uZxv7Mvtg8D6bRYFpiG1JOwHXeWcLH/kbPTO/ORiP4nPjvDKaobGroS?=
	=?us-ascii?Q?0vY5JBCZ/7Hn4mRuf4DT47IKE20jwlOeOlkM4LAkKxWQjL1m/HmBwt2d+VgD?=
	=?us-ascii?Q?diuD0gbm+y4D5lD8iXe6u/ASTHRnUh3pOsyo9AInpgCUxRDynEjsfdUqjvHO?=
	=?us-ascii?Q?b4Khg+ra9PC3R0uZQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB583;
	6:Bz6nvUmb3CPuNYkhaene7Sq7auQ/mfQz8VfEV6ZtqlZ0GSZr1nClCEYkITSJbz/ahltiRFCdbylKOtFBD7jPhEfHlIZVu0SJpP+cis4ATAhsTD3sizzPFvkwp6HlmVdPTs1mGhhbXKlX6NGCYTglrKnKBk2lUnsVKvsn3yUNzdC9ygzr7PepVL49e28OefyjnhI/OznS2vOL/uiBPmO2eJiD3bk7wkIHbzT35r5M+G+7WpVtVZyg+POiZ7loKDzwk+pTytPPPqGre+/3d+P4IIFt1ueIyAQgsdkVOm/5CwM=;
	5:XofB4y4N134oJB4HjKxAL52NPII8QUv3Q0Uws/NxhLmjFjzzED6vhIDgBewH/WQnvMBXLD8UV8euHDyCbnv4XWYfxEEbkVauK7RxcAedOFKJ08BcHysj8qgbiDobeWgVNi1/MMCn1UsE78A41AsJlctFPqe2Wy91HJ04897Gn/4=;
	24:/Dood2Qyq4zLrxBvoCrLPrDAvdJAUMgcEzHEQIE336zVRbskeB3TQvaoxw1Ka4rKprdeVvhfUbhUMYxeiL12q1cq40aptIS3PS/5mCxQ4S0=;
	7:7Og1YYmwKsyykYie2yPchBqUr6udhnhGrhhHgnd47aV5X2sRweReRSed9sQc40dUJPyqgvrIiGyKUHpt/Zr7MC2drfHcfLR1NWK9K7taSKZCsqffiDo2zVMy0QeCarN6EB8mBw+dpX6IF4xvsPqWgtp5lTdbq6tyUgF1GwmnWoGjRTQuQq/prrsgYfUhAahFZ+LswddQxeZoaXWrWMjXD99JK0sA9s/hG5RnYwq2iazI8cc/vamUhrsPWt32JvLz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:20.2251 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB583
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 6/6] gstreamer1.0-plugins-bad: Fix little rectangel appears at the center when use squeeze and tunnel effects
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
X-List-Received-Date: Mon, 04 Jul 2016 06:03:38 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...effects-fix-little-rectangel-appears-at-t.patch | 46 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch
new file mode 100755
index 0000000..90bfba9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch
@@ -0,0 +1,46 @@
+From 43549773608b4f58dc664b7115a1ef0dcb32f251 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Tue, 14 Jun 2016 13:48:09 +0800
+Subject: [PATCH 1/2] [glplugin]gleffects: fix little rectangel appears at the
+ center when use squeeze and tunnel effects
+
+These two shader will calculate the verctor length and use it as denominator.
+But length could be zero which will cause undefine behaviour. Add protection for
+this condition
+
+Upstream-Status: Backport [1.8.3]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=767635
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/gl/effects/gstgleffectssources.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/ext/gl/effects/gstgleffectssources.c b/ext/gl/effects/gstgleffectssources.c
+index 6bdc155..3e87b8b 100644
+--- a/ext/gl/effects/gstgleffectssources.c
++++ b/ext/gl/effects/gstgleffectssources.c
+@@ -100,7 +100,8 @@ const gchar *squeeze_fragment_source_gles2 =
+   "void main () {"
+   "  vec2 texturecoord = v_texcoord.xy;"
+   "  vec2 normcoord = texturecoord - 0.5;"
+-  "  float r = length (normcoord);"
++  /* Add a very small value to length otherwise it could be 0 */
++  "  float r = length (normcoord)+0.01;"
+   "  r = pow(r, 0.40)*1.3;"
+   "  normcoord = normcoord / r;"
+   "  texturecoord = (normcoord + 0.5);"
+@@ -136,7 +137,8 @@ const gchar *tunnel_fragment_source_gles2 =
+    * rect textures */
+   "  normcoord = (texturecoord - 0.5);"
+   "  float r = length(normcoord);"
+-  "  normcoord *= clamp (r, 0.0, 0.275) / r;"
++  "  if (r > 0.0)"
++  "    normcoord *= clamp (r, 0.0, 0.275) / r;"
+   "  texturecoord = normcoord + 0.5;"
+   "  gl_FragColor = texture2D (tex, texturecoord);"
+   "}";
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index 49b3677..d0912b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch \
     file://0005-glshader-add-glBindFragDataLocation.patch \
     file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
+    file://0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


