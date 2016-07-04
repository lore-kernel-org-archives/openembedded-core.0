Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 890 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jul 2016 06:03:05 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0083.outbound.protection.outlook.com [104.47.36.83])
	by mail.openembedded.org (Postfix) with ESMTP id 4913E6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:03:05 +0000 (UTC)
Received: from DM2PR03CA0024.namprd03.prod.outlook.com (10.141.96.23) by
	BN1PR03MB249.namprd03.prod.outlook.com (10.255.200.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.528.16; Mon, 4 Jul 2016 05:48:17 +0000
Received: from BN1BFFO11FD006.protection.gbl (2a01:111:f400:7c10::1:186) by
	DM2PR03CA0024.outlook.office365.com (2a01:111:e400:2428::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:17 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD006.mail.protection.outlook.com (10.58.144.69) with
	Microsoft SMTP Server (TLS) id 15.1.534.7 via Frontend Transport;
	Mon, 4 Jul 2016 05:48:16 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6uZ030562;
	Sun, 3 Jul 2016 22:48:14 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:31 +0800
Message-ID: <1467611193-31658-5-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120848966564840;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(92566002)(230783001)(76176999)(50986999)(36756003)(356003)(85426001)(81166006)(50466002)(305945005)(4326007)(2906002)(105606002)(8666005)(7846002)(5003940100001)(229853001)(2351001)(106466001)(87936001)(69596002)(104016004)(11100500001)(33646002)(86362001)(110136002)(97736004)(8936002)(189998001)(50226002)(77096005)(19580395003)(48376002)(6806005)(68736007)(47776003)(586003)(19580405001)(2950100001)(81156014)(8676002)(145543001)(7059030)(19627235001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB249;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD006;
	1:vpiefXT2rrQPn5R8+iCU/UksPFkIf7CehtzlJCIJL+jeFicOJWHuBzrpQi+Uqgz6u7gJDmkIxSgijSb4gCTu9f7gMxYE16aqXhBSxEMl4TbcfKB29dvejQFR49wA0CpNXZOt340R5KEWEJTlVngZN4iZyDl8CkOE+wFx95oghwOgpHbG+iYnVVK4HjqDY2EVs0TtiIDJrYYZePyS2jl1QiRv8w0lAV0pHV9gyeM3tGybHcX/QK5UjNgSJQMS28ZRKCNyXYFwe5yM8DDvVdpe29/xtfOyPT5/OoW+FQRAjCQMu70qbSE/3urwvsx19tOOUo/lejviGQZ9VgWiHuTAUWW0Uqy80Xeb7+/myI17IBd/qddblIhoNXuyLCgujhPuxTbnJMG56p/U7Il28lelsix5WbbLsbutlfa/fxoEQnYpPA65K9EoKIzAK3z6cGrezT/0jq+1RQvNdHSr5v+q2/YPYlt6NmxP59RYwlfE+b1SabukiK34Z+oEiVL5FsLvUrBg6zJhea4Tz/b+OIvG1/1yBSArq+uKm5o9VMaIH9AqtL3zMBeky9tQknss+YpB8qFrbyI+48MYNCPLTLdF2Q1WDGB+B/caKw3qqYzgcU3OrDgOGwWKPCMOXGWeJpP+9Z/YIXhE/U5D3may6BA1ZEOonFCScNln+jsfUKHzrI8E6VNXuQdjR/qDtUrV/g9OpEGNFmFW07XQTowrq7b4fpyT/chwl+xBuVE5OEAUXYo=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4f042776-8458-44bb-f92a-08d3a3cecbbe
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB249;
	2:KrZNwURFfEgPB1/RZicZ5uCcdSSBsKW6VfoAzBYm9nLwYAu7oLNQ+3tNWAEHaRwq0urfbmbwMTljbB1FsSPgrne44oqrTiGhTUnd1bTcSMYmRpq6F+oQcSkYvnGvp56jb/1DFlBJFWkioWuwYL4Nq5Iivk+z445VO8ENKW0OVxiDvXI6Voi8ksxO8AYbb19Y;
	3:m/Sgoa8bYl9hyTeKFdFa6Q5wxSXfeVSb8YmPm+gvJMl9UhFc19ynPTs+w/++jmbTl6CMssnaQJPX5hPJudQurCXLQh+dSl9gxqnhQAC8+X5gk0L8p/I4q/TYEyX16XwrkH/Y6TU34gB591KZoOv80QtzZ30iIa3jgSn96QJNJ/AnR7fa2QWLW8NAg3lvHG+9t2GMP87U+xbZ+nDbBX2fegCogMNK38RlaC67BKAfD4Y=;
	25:Gg/Sf9lQ9BZmToG+Gixq0ABx64qVnl27uyHj0wjFpmWnnd7WmemlOtCRqz+eeaPzNCCHY9am87ECrWl624uI3gGRRXId1jj6UMO0rTUAcsBRdNn2pMf1toGfnqC79FnUOEOpEcgZd1iv5RKvosU8mKprgkarT5urwifle1tNar5fSyU708lLKNqRQ4aHrf8pPq/tagePXYcGaCTdnknJsZoK66AVbfzBmVPzN3aaN/QjVTev00ZdiiUKBG1b/gf9AXrsy36Lei0zBu5iFY8E3PW9BvOrf6XuHBCM05rC1XDUHIYHRd4kPbU60wsk1gvYNLcpRR06adwqguSHA07WFfwcPutwjenQTO22ugdAZgb1KcBSilAXzAtTLLDBqwYxl/u0xYFbANH86jiibBgk5TLfowKHsTtnNBb2iuQ6RIs=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB249;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB249;
	31:gYaApHO9PDGmq5Vw8XmSwJjFH1QH6TeF4DATU3Qdw0GqJL3GnyB3U8y7r2b7xf9Nq7NtX3Haf1b8dagSulMyaUhRPVKLnQSBKvbFIRn7Z+LtBYb0bv1m2uUeF/VCCEYz4QRHcvRKopgudUe1somKjWPE9+RG32QGDh7aH08Ag/BunzGeLH3JUX97dnpBGl5X8QK315eJLDs2O5VcUv3+Qw==;
	4:d08gCHEvzb/U1Bqhuw1pIpk+Wf0ghaD1l6z6yLRi1DWN9uv3dxx/EfT+9njI66bwaVE9pl96HrOF3bmXAuDvSU5C8nv1CiCq+CYaS3CPn0U1sK9JOUBvnA5nltK1rTY7F8CazaL9UFtMS2tEEsreWxwenerqcKoQPkd3a563l5ATlgfF4r0JuF+s01EIsfCgpdVzVQlqXFND2wH8t1xZtBEUwMOhAwqsUQN4JrJ9aX4gxAti7lhMl3sRjHtOwJE6ZKFSmfZulYGq8c4xERFFL1RPnDl81073QjbJKqJNdUl8VKu1S7fpjt3nWaFq4cC/toNp7sp+iX4x/PMc3A57AUH1sg1k7Zx8fwo9AAr3PMkBojPD+BCAGlpPjZnIpVKLV/E12eQkQLMdoqfwyx8Hb7ad2x6Q6rYNINjAXobGOdRC2lkih+l5QNm1r7JKA2GdtuQDKiYsTDZfNocqxV4V0q480M4hRTb+NPtP+bLs7e1iuUG49T31ZlfpbKPFy6LYd7d3Dn0eKT5yafmLMSUwpQ==
X-Microsoft-Antispam-PRVS: <BN1PR03MB24914DB58CFD27EDECAC36BE9380@BN1PR03MB249.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(5005006)(8121501046)(13023025)(13018025)(13017025)(13024025)(10201501046)(3002001)(6055026);
	SRVR:BN1PR03MB249; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR03MB249; 
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB249;
	23:IOOR3kqDQkzaI2wVkww5m4JhEtUQD0obs2xaDkEN4h?=
	=?us-ascii?Q?2y1x89rS8DOWPUk/ajNviWIVHWMsKtdTqTMR4AomlPEyCP2oX2STTosS7S/a?=
	=?us-ascii?Q?XxSVoRrTBcUh+gDFRLFfSntuQfWfv9qxVPNoBaopQs33eCmqLjG+eaDHh/0n?=
	=?us-ascii?Q?Xr9IFEpOV/4zgeMpX1eYXPIiO56xGwQc+d2UdoN3tF7znVYAsqmLUz/0olHk?=
	=?us-ascii?Q?iCNxk5kddxoOmb63yUA9ihd+kvgmqt7FeQGwb26QAHBJkIIBmRbGLljjfoHe?=
	=?us-ascii?Q?8tAKJDLsbJwbglFl/E8MFoniIA68eMAMU3R+o30tTQA7L+Eb1sQx+EM8dWGZ?=
	=?us-ascii?Q?FgnFGLDdUZUlmv4OqzsEvFVF3OPWBW8Q6VTS3yJ0KZfpoJR8bs5Cwa/i9Uq/?=
	=?us-ascii?Q?iWPd3M4AKXiytDgvkvVmMM/qqXk0Gb6CK4MRnIzTgReSGEEPtACcTS5ATtW8?=
	=?us-ascii?Q?ZPJ1DFb3mf8znL/FRCAHnpfLa65nQ/lLFhoI4wJrQpbiLohd4ZSARq0nSkiQ?=
	=?us-ascii?Q?LAyOwsC4xIlE50zSlfrw41pR22gXiQDZ3vVVSl+tnoVSIKqVh26IsW/ZThyo?=
	=?us-ascii?Q?7ezQQr3J6MSS8+nM28E58NQO9KtoK9VO87mv8BNUVzPor8UGd1sZV6pOnHSM?=
	=?us-ascii?Q?Ucrgl3wdFm93gHCZjpc9fPlmXjJk21UL2ir+uZio/tC5gplMhZOVdWm/H3lU?=
	=?us-ascii?Q?QpXqssHq2v5n5oxsjPJjkIV83kgfwu2C07s7kOarELuHshUqveDYELgMq/bK?=
	=?us-ascii?Q?ASAZyX9Q67kzP/tI/vzRAxcnwHhvpq7PJ6xdMKf7PCzrnCmMbVCakzb29N+2?=
	=?us-ascii?Q?m3Te+NLpvw3RJ/AAEVGYa8GHiCasYA9VEy6CS9qFbZveJ53QsThHc4FBchoo?=
	=?us-ascii?Q?lwUta/+h0vGe3R2SGApDWdSJ7NyaI1230JucWffLc9GIVAhAZ/enBBwHZL5D?=
	=?us-ascii?Q?O13Jhb6jjtHejQnEAJmyj44BszwjgLbjClHdTg3kgRAGfysIQJlelCe7Kn2K?=
	=?us-ascii?Q?qhdeSib2xjDNT32UAKCn5kZvUsMPoC8Ca3Y6OXD1U5A/txIVk2oHNE34+jc8?=
	=?us-ascii?Q?PbI4w5OY4UgWifjw6kO28jQpnwaNfzUf4IBrIYztV/5Sqe/1t7Fnjwqjq3/S?=
	=?us-ascii?Q?8s7vWfs8Xo8g9u/eKgjpeM0/b78zBM/EFCA6nxj6tIvk5UxQFn8FPtmnvdb8?=
	=?us-ascii?Q?jIwvXDvK7QhbmNHeFiP13W6FGHZdhOiUVvRTBpwgGjevNlJYanH/OuSLOhEp?=
	=?us-ascii?Q?B9GG9VoWgZpERmiYm6jgzzkmAiWpabk6ZW0p7cuknTasWcDuP2cEFuAGKA3y?=
	=?us-ascii?Q?zg0jzMGua7NFMass70D4szl/lfYpusQSE+UxK3MDJr?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB249;
	6:f53TWNa7eaPeldzx3xi0MG3KHdpLHJst0DAHnZF3kxnqSR7DczSvVoP2LAJLHq5g+W5eILJwxSljFFokljJKaQxYPzmcGl6c4FXfw+Xk0XWP5rOPsH+es5rxUnU4xsxr9E6iSjY8GtehDhOy445X+9p3hhOlzDCbCRV5vhA7l4XrAFkv8j3j0wNvTLNVMiTQiEmemlx3q6NizXVM6k1ZnrJ99cGH4pEF6H9/4hcxOARHeuy9yy4cOgyIqRvNjxpJMimlhg0l0XHzQPvo/rmtvl7qr7EKw5wkuSF3ST8F0Zw=;
	5:SBuy5CXYtsecBqF0mvx8HhWl7xAEGWcDeA0PplQhBjlKZq1EmXss4nKYMMlwBXO6fm2l8TG2qqnKs73Moa7eU+GyRlRsxxDMArtfvt1zQb0ui4x6+0nJ9ZMEtAgkO3hI9r2ug7QMMVRzlUZxZX2eyUpVc6Oc2t5CS+H2hLxzkIc=;
	24:JkPOIUpnGpy7gDn6FYIl5/LNrcZtX6TWhNWbh11TTyhxfI/S8ARikHmJQLK2OaYrYeVGvmS07THLKYIQpUVnws+0VT0qSibUFz2jSIpJfYA=;
	7:GewgVULgiGF9mpQTZQH0iPbNVxAcyw9MaHwzSsSygqJ5Dhi0YuKCkR3ImB4RhZpnFm1eXynSTW8OCcV6h3UFzRa+99/Q5iFVImHnAtlDL0wUB/MO1AT9CsMmcFi2ussuNXohZG9zKuZhbX7KdAQseCX+ZMPP/kQGLrGRQQic2D0V30pL6BEQYqZi8W8I+j6/cwf1HCPWkPIsZQn1dF/zCMhtTKMNBj87B9ecD914Ay5197UZltOb8cBBOmPCsS8M
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:16.4068 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB249
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 4/6] gstreamer1.0-plugins-bad: Add glBindFragDataLocation in glshader
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
X-List-Received-Date: Mon, 04 Jul 2016 06:03:06 -0000
Content-Type: text/plain

There are some cases where it's needed for
binding in/out variables in shaders.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 .../0005-glshader-add-glBindFragDataLocation.patch | 77 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |  1 +
 2 files changed, 78 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
new file mode 100755
index 0000000..57e9d1a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
@@ -0,0 +1,77 @@
+From 38221080181229d520522a20bcb1663ca19f7aff Mon Sep 17 00:00:00 2001
+From: Matthew Waters <matthew@centricular.com>
+Date: Thu, 31 Mar 2016 19:25:32 +1100
+Subject: [PATCH 2/3] glshader: add glBindFragDataLocation
+
+There are some cases where it's needed for binding in/out variables in shaders.
+e.g. glsl 150 (gl 3.2) doesn't support the 'layout (location = ?)' specifiers in
+the shader source so we have to bind them ourselves.
+
+Upstream-Status: Backport [1.9.1]
+---
+ gst-libs/gst/gl/glprototypes/shaders.h | 10 ++++++++++
+ gst-libs/gst/gl/gstglshader.c          | 20 ++++++++++++++++++++
+ gst-libs/gst/gl/gstglshader.h          |  1 +
+ 3 files changed, 31 insertions(+)
+
+diff --git a/gst-libs/gst/gl/glprototypes/shaders.h b/gst-libs/gst/gl/glprototypes/shaders.h
+index 817e479..6d828db 100644
+--- a/gst-libs/gst/gl/glprototypes/shaders.h
++++ b/gst-libs/gst/gl/glprototypes/shaders.h
+@@ -362,3 +362,13 @@ GST_GL_EXT_FUNCTION (void, UniformMatrix3x4fv,
+ GST_GL_EXT_FUNCTION (void, UniformMatrix4x3fv,
+                      (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value))
+ GST_GL_EXT_END ()
++
++GST_GL_EXT_BEGIN (bind_frag_data,
++                  GST_GL_API_OPENGL | GST_GL_API_OPENGL3,
++                  3, 0,
++                  255, 255,
++                  "\0",
++                  "\0")
++GST_GL_EXT_FUNCTION (void, BindFragDataLocation,
++                     (GLuint program, GLuint index, const GLchar * name))
++GST_GL_EXT_END ()
+diff --git a/gst-libs/gst/gl/gstglshader.c b/gst-libs/gst/gl/gstglshader.c
+index 9d96784..9f09236 100644
+--- a/gst-libs/gst/gl/gstglshader.c
++++ b/gst-libs/gst/gl/gstglshader.c
+@@ -1306,3 +1306,23 @@ gst_gl_shader_bind_attribute_location (GstGLShader * shader, GLuint index,
+ 
+   gl->BindAttribLocation (priv->program_handle, index, name);
+ }
++
++void
++gst_gl_shader_bind_frag_data_location (GstGLShader * shader,
++    guint index, const gchar * name)
++{
++  GstGLShaderPrivate *priv;
++  GstGLFuncs *gl;
++
++  g_return_if_fail (shader != NULL);
++  if (!_ensure_program (shader))
++    g_return_if_fail (shader->priv->program_handle);
++  priv = shader->priv;
++  gl = shader->context->gl_vtable;
++  g_return_if_fail (gl->BindFragDataLocation);
++
++  GST_TRACE_OBJECT (shader, "binding program %i frag data \'%s\' location %i",
++      (int) priv->program_handle, name, index);
++
++  gl->BindFragDataLocation (priv->program_handle, index, name);
++}
+diff --git a/gst-libs/gst/gl/gstglshader.h b/gst-libs/gst/gl/gstglshader.h
+index 21410e2..2200b89 100644
+--- a/gst-libs/gst/gl/gstglshader.h
++++ b/gst-libs/gst/gl/gstglshader.h
+@@ -104,6 +104,7 @@ void gst_gl_shader_set_uniform_matrix_4x3fv (GstGLShader *shader, const gchar *n
+ 
+ gint gst_gl_shader_get_attribute_location  (GstGLShader *shader, const gchar *name);
+ void gst_gl_shader_bind_attribute_location (GstGLShader * shader, guint index, const gchar * name);
++void gst_gl_shader_bind_frag_data_location (GstGLShader * shader, guint index, const gchar * name);
+ 
+ G_END_DECLS
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index 7f6b918..825d100 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch \
     file://0003-glcolorconvert-implement-multiple-render-targets-for.patch \
     file://0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch \
+    file://0005-glshader-add-glBindFragDataLocation.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


