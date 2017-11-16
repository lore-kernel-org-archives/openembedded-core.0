Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 5623 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Nov 2017 02:42:07 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0086.outbound.protection.outlook.com [104.47.0.86])
	by mail.openembedded.org (Postfix) with ESMTP id 398C9787FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 02:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gocOGmbcuFcG65STGJf4U7cTGhnBcIx0gVA88Qty+7I=;
	b=lFidZmexF/dITUNdNejfSjDtHrmjDSeDR00uEeh5JOVm8kZXkGoD7hY7dc/MHHljGDlH4esjolxRwIHu0kZWk5NG1DdWUZBhvoZFnNPOstneZBGwZIrbthd81J75FmWq6wY9bTe+dFnYjKDKKFGbCEZNxNdQQ92syw/QpM9kTF0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	VI1PR0402MB2830.eurprd04.prod.outlook.com (2603:10a6:800:b6::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.239.5;
	Thu, 16 Nov 2017 23:36:40 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 17:36:29 -0600
Message-Id: <1510875389-6932-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: CY4PR19CA0037.namprd19.prod.outlook.com
	(2603:10b6:903:103::23) To VI1PR0402MB2830.eurprd04.prod.outlook.com
	(2603:10a6:800:b6::7)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd532ec3-d734-4230-4f4e-08d52d4ae363
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:VI1PR0402MB2830; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	3:rQMoZImSlUlds1pAOFfcVyAtyJPYuamYkik8Hr1Pf8ONSRDGnkCawHWHI+wZYjg+hG9tygG4Vff+OR2ic/9tdzQR0iSQ/FYsg4xmURtSHwnWHeRzM+CHJgLraxSIN9UlnwnP636FuqAXWgoDEhw8aw5r2pJTE2wrM5qbM/Vfzp6h77fhEijxQ8L90RE7P+RMob0pRjFNqo9YYKFLWjmxPOgdzovbzcpqtOFMfTNvDCa/GV999eRLPcGT6B5JT+S8;
	25:B9mPDW2bI7UFLrTq5ihYlQ5qx4n8wwrWQnfm2OEFNaV2gRrTMSt2PqqbTSY0Te9eCWto4Q/8TVFrX1pxMEPwejadsUIc1VKmVrVVmEdXMbCO3mmyX53GV8FMMSQOoyWtG9cAbMrn4LnKwLpQ+m4CJ29UEsr4P1uY3ijHOxGjWwOv4ncl/yvM1f8cRKCR6TVVqWeIQbKP/Sh833NuEZWN1NhTY5USYvHC4cWoCgn2EvrCcum6lmXdivxHVbpS/F+316vaO5elYia40ulRaAod//JOJYyyfRspoJ8c6Oj2XWcn7eCCWsnMKZPWduHbSSmw+Daxx0lET7BwOyLmW4zuMw==;
	31:k9eHlYbRv/mMSrHBGq84S+dGo9Rc3HPPSMG+RAAtcgPf1ncfkqCkWwdroa+cVZG6UVl9SMUEDPl+jB+Znxywcpbx61IBFuP91QXpKjrt85ZowaPAaDaDdUAjQRSeOSPIuG39USKCEwiLBEQqAvJyNY97BLHWsQpzvILv0Pr1ywRnAt+uRdWvSaUc628I08/ZLx6+LsS/7Z3VjrWBSx4E5LfKeBPrCYfNqjagT0tSjPI=
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2830:|VI1PR0402MB2830:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	20:A8xe/L7MaPppByOwZQWNXE5DX2qspDeZnaF/6T0y4eoCkondOmfHSv5mlqMFKi6XGnOgEYZmAYSWOfmXXr6FbFc+6ogJzIZklgdfnWxHQmU40+tS4QMG3hdOM73OYSfpdQJ84bz5QIdnOEY19j9z175CySRZ4U3Y8HbODdU19A4EihDqMzWtB8qcrf0xmG0Oetup8mEUM5OY9kmZ/uL9SokEhPFOeGCP0bpxB//awS1yWaO3ycQIuYTa+6qlC2y4nRMgO6TBkd4iS4EZ9qXJRWsHK0Gku2KbiJ1mkRm3usmKmu+xvIi4x0hXOAHie+qslmZwreljA7r+gypiH8zOJchoENDU8YHjbxV1HrQrBr3pr96XZRR7ADxmmE4PaJ0DcD++Q7RKnjDuD+HXdPH+0cuDseW0+hm7NgzR1MEZTzN4SwQ0gI4AWQzUmt9FpDv3jKDIOjZ4nKnS6YaJVpM9gasob+bhI+zK/o9g2vMRva4/ATqGqlbqv0pBc7D9KIJY;
	4:BHEjQ3gH4i29/tDpGz6L7HsLh2gyRjvrHdGqRrrBUwC8DqufX8C52GVahVX55CzFYajvGSXnlgxmWQQNAyWyvcyrmZLO0IUoa34Eer/ceEcHqiu+xdJqaQChdEB4svqh7d/tzHC+fbV3wBef1w6hWTiiVn+xN1Sqp3IcbFNxrb/xzrzuH2yrJuWZrXO28ls2gMoa2AtdR3kICzR+I1XhoRSkPBkAVAxnXi2zhtWd4Lo2Oz0gZBlDFc2NS2zzQAV+1I8wFMA+VMG3oChbSd8bl1fxEKguTvu/z8ck/OwnWz8q2srqf13Y10HLH0WuBc3Q9YQGVmvuoFJMQKCa42vRpctD+9/1YC6jg3Xli2ew+BE=
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2830459DB67E801FEADB1E41E22E0@VI1PR0402MB2830.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(3231022)(6055026)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR0402MB2830; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR0402MB2830; 
X-Forefront-PRVS: 0493852DA9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(199003)(377424004)(189002)(68736007)(8936002)(105586002)(2361001)(2351001)(106356001)(5003940100001)(50986999)(6666003)(50226002)(33646002)(101416001)(86362001)(575784001)(6116002)(6916009)(3846002)(5660300001)(305945005)(81156014)(8676002)(66066001)(7736002)(2906002)(81166006)(47776003)(6506006)(6512007)(6486002)(478600001)(966005)(189998001)(4326008)(25786009)(6306002)(16526018)(36756003)(316002)(16586007)(97736004)(50466002)(48376002)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2830;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0402MB2830;
	23:Ly/zaHUzrrle3BkG337YM80LCxZZ4lyPmQp99Pf?=
	=?us-ascii?Q?GB733na/c9PL6IS261EiDETJlhaU806Eg2531LjQtkWQFEbhsksiNEQSL8QU?=
	=?us-ascii?Q?yTJvdoa7Ms4VrZyea5VuPk0e/V+uH8jYxWhUgdhNtXlfn56cBCKlI4/NR5L4?=
	=?us-ascii?Q?0XvrqGum4BU1hNRvT3J/9b4NSzE9bXbJTFKtwADyd3hMg0YUWc6t3Q1bzYGg?=
	=?us-ascii?Q?55jh6guss+VzBRejfgHXuk+4KDSdq/jYpp71jSx+A+UlMfFwKOvKHg9jyzYR?=
	=?us-ascii?Q?vyK7pouIhOSsqmrbRL7h7FvcbqwPa2j4C3BQIpNmROlm8RIMSeezfI51RvOE?=
	=?us-ascii?Q?fpXoF50NTKFXesTr5c2XSO39yQ/2abyyfYhaWA6WnOzoVodLBeVZxffY0Ir2?=
	=?us-ascii?Q?p1JisZZbBnPq5cUnUJ502wxkDqSgOooSXoeGdC0w7C45A8HRVV4TzFqJAgnI?=
	=?us-ascii?Q?/rJVVZd3zGEmHihioqFeIfRd68ZKBvUk4PcB9erWKOZTr360PB0Zg20cbX1y?=
	=?us-ascii?Q?9nAcytq3iiOe41pRsylt6ZhgXY5L4/6sfXjxmi5ztC7RZiT9MfztdWp3TXjL?=
	=?us-ascii?Q?+5ajtiQYhV/ObpmE7WE2gBEuBdrsvaEpehTCLJGNWCJYdsMJDZHmNW47MYEt?=
	=?us-ascii?Q?oGZo3iy5k+Lm1B0Ew7npV7OYKCfsz4FcX+yoLWoRk80fsfBj8greHLFKISIb?=
	=?us-ascii?Q?9jLDE06rCJllswWWxowvg8U9zZdprIV5ux62OFJ4PJlGAGDYRPSQyPT5Hl/i?=
	=?us-ascii?Q?kaeFrtWYbVsS3dDqrAyU76nW6bUVYJQxeeEb3o74ctRJh+CSneI6VTbG2DTF?=
	=?us-ascii?Q?0JfKdZxTj0dUR7rUST9hZW7euZ8m8zyzgeMIxOkhj5FdAz2UYVOzmhOlAzfj?=
	=?us-ascii?Q?mJlLgCT6NZSRKoeApfxBwJpF164LVQf3WJvvDkTmVn/XTagUs2Smpk8TUunR?=
	=?us-ascii?Q?zsX3lonbIGr8mvffcsmqRKBoKWpiE322Y3tqChqY88mwqBhKNGmiyCHeRftB?=
	=?us-ascii?Q?6fL4YbVMiOukYtggTS2iOi+A+A2XQkvmbxbQ+Os5ccX+Pqz4/SG2elUe4Zs8?=
	=?us-ascii?Q?WW1RkqRlm2AZZ5C6kjmTteS54HO8/GNE9YRMezHje2L1qFhTU/V9RXy2w3oP?=
	=?us-ascii?Q?95p8Hr1KWHXuIDXI1LqJ2R4zqTfrz1nClpu1NYfFaJJHSeLhWr73tHQ=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	6:83uTFD0ik7yFLyPSg3lImR1SK8rKY1G7MTZmFdB9DJglJN3zHnII1Vn34CEmz55gw+F3V0M59WrvJ/+CyLknkNUqyRRYNWATyS49cq5E0i5dGrnPi6pKXuzZnENhhQoNlFbr3PT4Ny7T6RJ31AWIRBkl7jI4VFZrZG8SsaDr3pVw4uuotnD2m/+mpoWfcslmO5VdCYo4RFSS+f5u+9YCKUROhtIigQFzMq2otMEw2uoxs3Obgxc38FAybYViish0j11GL+D8v71AtvZK61N73PJc3sOdOttbsPuksJbNq0zovEijL2Dv2nae7G3uukgNvaAMH+NUR+V7yDF1iPpAYX42EnAbYlfoc60A9FVbLjU=;
	5:rRnsNTazi8/Al2gsyE47VkYXPPHhJXcWN537wRbZaZmsBZ+nH8VVqCjyHaxpK8CdkaaP1XEufM6iNgE3qHYHwusuLOpKGst+gqo1QKvhy2+3XaQxjAvkAua1w2dyXfI6AEG0M1IbGdnPIvkVQGIJN0y85bPgKGSPQIOA8/cfQUc=;
	24:JFmcrTswCdPvhishXi3T66S88/LOsgog/Ukxp2eMrnAk4WNOMUPN97PqnqmWr6tZ6sXWwehekjD9dUMXN8r1F0belOoCl0G3baUGGytmDxU=;
	7:dAGa10vLtzAgEfeKz25NCJM7wrlo+qZuopAJs2kjWzhm/RKPZdYK0gbHSZFPJKU+svyV5uRj7GElXuxGeAtO5d18kO6xO5FcHZK30rnZU+EbVSp+StSbiCfxDD6+5pC8ev5B3J4VONhCvWbXFJGf2mErGCbJbQAPNVrppWjbNOr/g4oTMDqhmyf/zm430UHgAP6uUgPwClQFzO+0fgNvgmZSkxmTuXQGgki2+gntSTHmxczYHvEZ4cXFKqBjYBZI
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2017 23:36:40.0903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd532ec3-d734-4230-4f4e-08d52d4ae363
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2830;
	23:+zQAPvCXLwTLBjooKOeQ3MVpTpZm99R3fOOIhzkv/2S1D/KYMMNcLEg4bJSMQCynpZVCDEjWYuEXQZmpp2lW53YNfBYCi0zSChzb/dt8hYxDtY40FTlarYzskjQmfnaCOyD/BV6B0IPXtPi1qAvKYA==
X-OriginatorOrg: nxp.com
Subject: [PATCH] libepoxy: Fix build break for EGL_CAST dependency
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
X-List-Received-Date: Fri, 17 Nov 2017 02:42:09 -0000
Content-Type: text/plain

This is a backport [1] to fix the following build error:

| In file included from /home/r60874/upstream/xwayland/tmp/work/armv7at2hf-neon-mx6qdl-fslc-linux-gnueabi/gtk+3/3.22.17-r0/recipe-sysroot/usr/include/epoxy/egl.h:46:0,
|                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.h:32,
|                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:24:
| ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c: In function 'gdk_wayland_gl_context_realize':
| ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:179:43: error: expected expression before 'EGLContext'
|                                          : EGL_NO_CONTEXT,
|                                            ^

[1] https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../Add-fallback-definition-for-EGL-CAST.patch     | 31 ++++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
new file mode 100644
index 0000000..daa1785
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
@@ -0,0 +1,31 @@
+Add fallback definition for EGL_CAST
+
+The EGL API update from d11104f introduced a dependency on the
+EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
+don't provide eglplatform.h, add a fallback definition for if we're
+building against Mesa 17.0.x or similar.
+
+https://bugs.gentoo.org/show_bug.cgi?id=623926
+
+Upstream-Status: Backport [https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8]
+
+Index: libepoxy-1.4.3/src/gen_dispatch.py
+===================================================================
+--- libepoxy-1.4.3.orig/src/gen_dispatch.py	2017-06-06 04:24:13.000000000 -0500
++++ libepoxy-1.4.3/src/gen_dispatch.py	2017-11-06 12:45:43.594966473 -0600
+@@ -491,6 +491,15 @@
+             self.outln('#include "epoxy/gl.h"')
+             if self.target == "egl":
+                 self.outln('#include "EGL/eglplatform.h"')
++                # Account for older eglplatform.h, which doesn't define
++                # the EGL_CAST macro.
++                self.outln('#ifndef EGL_CAST')
++                self.outln('#if defined(__cplusplus)')
++                self.outln('#define EGL_CAST(type, value) (static_cast<type>(value))')
++                self.outln('#else')
++                self.outln('#define EGL_CAST(type, value) ((type) (value))')
++                self.outln('#endif')
++                self.outln('#endif')
+         else:
+             # Add some ridiculous inttypes.h redefinitions that are
+             # from khrplatform.h and not included in the XML.  We
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index c8b398f..0172322 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://Add-fallback-definition-for-EGL-CAST.patch"
 SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
 SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
-- 
1.9.1


