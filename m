Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.80])
 by mx.groups.io with SMTP id smtpd.web09.6237.1615367218065547706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 01:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pjI0a27o;
 spf=pass (domain: windriver.com, ip: 40.107.220.80, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALNQ/2nZRlaKqOqfc9CBgMmN1/nsByLSGZHMGkb5ofxhrl1rbaTgZtEkcuHvIjFJACGND1hy2MM3WvFGmZ4arXmWPB+vhpusGDlWl724d2ukW0nPsZYxyNa4ItOzD+UWFl3SiooWXPQ8kpLuKR4ThQqhOE4gVX2CP58qoDf90cVeBJIEVQJjPbkrNXhrGo2nwUHdJ+pfGYl6xLX/G3rSAQQo4LmJT2wLjGucGmYlsedfQ9FP0uajbmFpe8g5Fl3gZxt3HMAP4sEPNhc1egfy+ouVZdrGVSSA+VeSpYiPWUE4GRnkgQImsLddhM44O3ijMIQ4thWwymwF0buR/nRCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdYyDI5+++jS0nmE13lUY/SOem5EwNQyui2NWDXmTgE=;
 b=KPkp/mB/vUp6vPKcJVAfkCD0LSsrbf9Nn8rqRxuqTjJb0gqdeAYBIMcwlxN9cObE9+qvrR6HugRMZT7MMWVVjW4nGf52orzBLM0FkLbLQ14EtpI6vH/AtNd/vgMvkrEDoacFXM6MqfbAT714DrAk8zGoC0a40b0DesD42OezidYrDrrRgQ7CXKmXDHCAbFU971jekcGA+QT22jv1l//7lB+83PWhLfXmYrmuRu45rtTe6vjSsa8kGVQG4QidYRpWYcDZqwks0GlWdOh2XsUBKQ0yxNJQO+kWjSOw7eVDjggqOTsgkLKtVTyLZRz7MoRj/zGx51phYxxYpMNubCnRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdYyDI5+++jS0nmE13lUY/SOem5EwNQyui2NWDXmTgE=;
 b=pjI0a27oMhQdEMFhwKm0Rv2fF9TaUyn0kuVz0iSOEbZWfZm3d/bFuFh+Yqcy0tbnFJkjglLzK1A6sptgGH217zYEIc0e50vF/BSOis33pKjUiw8vgGdL9vmfngyOSsuNH+LzoJJsKfFmtRTi9WwlAIXAaHPN+dHQETvylVZHraI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2727.namprd11.prod.outlook.com (2603:10b6:a02:c7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Wed, 10 Mar
 2021 09:06:55 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.038; Wed, 10 Mar 2021
 09:06:55 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] Revert "uninative: Don't use single sstate for pseudo-native"
Date: Wed, 10 Mar 2021 17:06:38 +0800
Message-Id: <20210310090638.14640-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0079.apcprd04.prod.outlook.com
 (2603:1096:202:15::23) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR04CA0079.apcprd04.prod.outlook.com (2603:1096:202:15::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 09:06:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0beb2fc9-2fc6-4edd-e7f8-08d8e3a3da59
X-MS-TrafficTypeDiagnostic: BYAPR11MB2727:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB272738690BE4CFF4AAF660F5ED919@BYAPR11MB2727.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YcDSWCNQhdFgkaapto0Q+9k6vOV9s0JZ+31Fpw58H1yrEqjQpjeRKArTQjKexFzcgmyPsYKGlgOjwuS4a9R4XOwfmfu92Mx2JtjJs+pGEK+frDk3tmQ/ieJD0IEcyDjFVrT8eaA2idm5SBqtsaXzHobaQTxdpEqkqimEtbx0cJ4aHpSTKT8DMEZQ6M3m77+drAkRkjO9sUkmEwte30GmCxal3x44sQHfTmZn8d1GZkDFN7MSWNFioFpEAKXEAots68D6E0B8N/CfTk4d6EWuwJDf+tiOmc91XyBN9tGcNF2idaiQuwsuz3HyxEV/F+/sE7R5wzEDEVSpOmznYw9+bt3dycuFd1z0qALDltHlFw30A4sJDVQPS7H9zK6XMV0lhqlbiPOS17WTK/85vEGshT9S7v2ebiJvN2WSVwpLt5wkczHRbZqAZPE4SOZ0MCDCjXPT6MiR+CyHu9iPo2VchPnx04H+y4j5yQ7YR3gT/tURWypcN26v4dWw1hb9wpY5NTjiWd+5Jd6Ne+r51lThXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39840400004)(376002)(366004)(2616005)(186003)(5660300002)(66946007)(478600001)(83380400001)(52116002)(2906002)(6486002)(6506007)(36756003)(86362001)(16526019)(6666004)(6916009)(956004)(8936002)(26005)(6512007)(1076003)(66556008)(8676002)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?AEXVYkPwF+px0sHV+Ho1AJwqftzy1solPhBA2dxpE6SW7EwvQyIS1KAiOAWp?=
 =?us-ascii?Q?ZqGgEtkm8bACMQCbJssVf+W7ELmMRK3AGk5r5dWKWFVaslX8UlshSCFMOSGR?=
 =?us-ascii?Q?sShNeAz7emwgyclzfmUxgBjK1FZO7utODyltx4sz23+7gI1gWZLleIEbxo+p?=
 =?us-ascii?Q?rjt6UO7/7EgZUR99ztn8cCRA3yjfLMDOsG/Fwetxlvm06DJxOWRHZ03uwz0d?=
 =?us-ascii?Q?Kj8K3AMIXkHx2yvASgM6FKhNR2GmTvYXmEj7HykUX2+Og/vu8hDFOoG0swJV?=
 =?us-ascii?Q?z2TSCLz+WjJOsDSydygn1I3VOdk6P4IxXl5dK71NHxfeapKrhyvdlM1IzPjZ?=
 =?us-ascii?Q?LGFv+yuhMA0JY9d5hvNa8BxqHGB6EUmlrrrNBIX8vIJj2jccrcVGSxQvuxdT?=
 =?us-ascii?Q?TbksAC4eM7lNBo+OYohuK2UZ7CGQzuMw7GDAxFc5f2SRTjwMWch9MayUh5yP?=
 =?us-ascii?Q?as1JSWMRUa4NuFp3QSDDSG/X6s7NA6frG3dVHvF1guL4K13exyS+wV57YK2F?=
 =?us-ascii?Q?iKzfynLy6i4x/ShBnRPCmIJTQbWJ2apGvIBfVBschS3raKCs8z7bRxipAU+s?=
 =?us-ascii?Q?xJHNJ2vZn0DvepTrTJ9Tlis+r3kqGQbmvflVMo+je92bPf/VxCLrVFkemxIr?=
 =?us-ascii?Q?g5JWDlF0wLve3hkqegN62DOW7boRY3qWkPoOtd6KiWUOLfNRVxpWJxnKpWLg?=
 =?us-ascii?Q?n1JXv4p3f9LBpT1SnK8k7IP+zhu9Aj7pPds3ENOO332vCz/3XuDqAIElmOXX?=
 =?us-ascii?Q?/4V5FkJ4IpDtoPfwelxu0Wi1Mua3RQvvRNAeSz7iwqunL7Hd9K0lIZE9X7WF?=
 =?us-ascii?Q?4x2U+lJnEUT2r2U+fSw3XFjKW5dGnO8bM5fp09a41OT/eoGgm5TOCB8a1Jfa?=
 =?us-ascii?Q?P+yG66Duu7MErRNZjdnov3CFMC67a2/2SsEc3oAydJJ/f126PIbntudYEP1A?=
 =?us-ascii?Q?QcKoOU1VJDSv5RXPE1HccmsJP4uM5Fs7leeabiL/QziOMok7A3hIdSTwyjqu?=
 =?us-ascii?Q?sahmmY7gnGWAscXzNYdAWuUcI0/yxl1xcbHakBduYwcbfHxYmK7RuR7z06zV?=
 =?us-ascii?Q?eJshcl/KBVbW+djsvnynt4yAOYhjVZvPQtSB4+4uEJSr0bBMfKfwcQdNqVON?=
 =?us-ascii?Q?fRElX3TQGPZAyZX8CzZd8uIMl9EUm0R59NfLsXu4CKzeTeMMVrGYlu2Zco+M?=
 =?us-ascii?Q?r8yvZ1hVwZFvcMIUCyx3+mxt+ux5J0tuUF5n2TgdtRP8SJk8rWPIEBFuLNvM?=
 =?us-ascii?Q?bFrzgKfK94JIFi9AB7MFqqcZ//1maQV1wkPAs1BHjofM3aGF0qg8eENrp6+a?=
 =?us-ascii?Q?XaGLofGJrqEVIGV2BxqSvYSp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb2fc9-2fc6-4edd-e7f8-08d8e3a3da59
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 09:06:55.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKGVivCAe/h+SiilLkFZTfO/+xWI/oyUjkztB6YFX9ZJGgs0AzYwqrlg7xYsZ2Kp3Sr05tlPskeFIS1VBqJd6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2727
Content-Type: text/plain

This reverts commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292.

The above commit causes a regression, making eSDK not able to be
installed on a different host. For example, build eSDK on ubuntu18
and install the eSDK on ubunt20, then we'll get an error at installation
time. This is because the pseudo-native's sstate cache could not be shared
among different distros.

In addition, according to the pseudo recipe, pseudo-native always has attr
support compiled in. And if people change the PSEUDO_EXTRA_OPTS, the signature
should also change.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/base.bbclass   | 1 -
 meta/classes/sstate.bbclass | 4 ----
 meta/lib/oe/sstatesig.py    | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b4160402f0..df7878c53d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -231,7 +231,6 @@ python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
-        d.setVar("ORIGNATIVELSBSTRING", d.getVar("NATIVELSBSTRING", False))
         d.setVar('BB_VERSION', bb.__version__)
 
     # There might be no bb.event.ConfigParsed event if bitbake server is
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f579168162..c1be723b87 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -72,7 +72,6 @@ BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
 SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
-    ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${BUILD_ARCH}_${TARGET_ARCH} \
     ${SDK_ARCH}_${SDK_OS} \
@@ -81,7 +80,6 @@ SSTATE_ARCHS = " \
     ${PACKAGE_ARCH} \
     ${PACKAGE_EXTRA_ARCHS} \
     ${MACHINE_ARCH}"
-SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -123,8 +121,6 @@ SSTATE_HASHEQUIV_REPORT_TASKDATA[doc] = "Report additional useful data to the \
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
-        if d.getVar("PN") == "pseudo-native":
-            d.appendVar('SSTATE_PKGARCH', '_${ORIGNATIVELSBSTRING}')
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 6cd6e11acc..744dbef199 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -434,7 +434,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         d2 = multilibcache[variant]
 
     if taskdata.endswith("-native"):
-        pkgarchs = ["${BUILD_ARCH}", "${BUILD_ARCH}_${ORIGNATIVELSBSTRING}"]
+        pkgarchs = ["${BUILD_ARCH}"]
     elif taskdata.startswith("nativesdk-"):
         pkgarchs = ["${SDK_ARCH}_${SDK_OS}", "allarch"]
     elif "-cross-canadian" in taskdata:
-- 
2.17.1

