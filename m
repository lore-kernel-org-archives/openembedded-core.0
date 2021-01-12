Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.40])
 by mx.groups.io with SMTP id smtpd.web10.5876.1610433711260543795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 22:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aSEj5DdS;
 spf=pass (domain: windriver.com, ip: 40.107.243.40, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9cBlwdayS6GwT423xA4pp7hB1AuzeNQhl4vpG00vAdompaJ7FPjmF34aD44sYY3EzcZls+MljzcUoZUjx1rgHGqfoi/8e/f4cW7Qj1YZlF4mmvXKeTN4wLoipBv38bvYu4T3cmcrHQzLqMdCFLLuyu0yPg2lOSKfFD4KqN/DT1mLUgaR8bYi1kw6GHN2+hiB2vdxaMq9IS2gQEcIFWkLRP+BwE/IFJ2SAWMvbvnIz102LxRLqb4gX1OctGiy5/Sh3OTyBhmO++jPd1TtFggkkXGqHMF1jExWiIFq6Ow9jrf7/b+0nsWRKS/AHPtlM7wD2ZNmSvt91t7H2n23LbvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htaz5TFX1usZAY0PaJlVdGBrRrpWMIXQ+XvqaasLV9g=;
 b=U6csIQae++eQCjykbN4d7uOnVIQ3qgTBC1KNTKx+GdchZoMCw/6+fVFHcW6ygVGQAxVUelMKRgpWQLTW6DPHTg5hAJC0+igIV7xWzyla5zJCUy/p8HeIOGN8OfCIVGQwJomUxHQLR3+31zbEDXDhZgBmqPGn2SI0G4jbneHjXZ3774RKDASzpbGKuc3R1ALg/IZ0la434rYQ4al6hNgkqIcBQFDJiy1E/EuRHm8SCatNxT7p/2FfIQYtyJIWIQWBO+Lapqiu94cs5zheEfel/sQWgeAUho81L9aEwW+TQ7tIDMz2q2XD8S5TTSGWrCDLFOAYgz013tEk4vosqzKsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htaz5TFX1usZAY0PaJlVdGBrRrpWMIXQ+XvqaasLV9g=;
 b=aSEj5DdSChF7mlT0PXhxWBtcHDUUPtIxY2se/olyc15MFA3PEdaTQKi72a2p9pXg5BoEg9lDY39zBnOnLfiRsEOZz5TelFI+skTJXhA1oqc2dTPkPlH9Bkd540MqjDYdRR0aDdwK+9oDoSbWl0Tp8H347WKL+HcQt2RStCAdW4M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 06:41:49 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 06:41:48 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH] libpam: remove unused code
Date: Tue, 12 Jan 2021 14:41:29 +0800
Message-Id: <20210112064129.25907-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 06:41:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c78fb7-514a-482f-71f4-08d8b6c52330
X-MS-TrafficTypeDiagnostic: SA2PR11MB5147:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5147DC2C98F541DF276F54F582AA0@SA2PR11MB5147.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qp1d3HJuJBGhzpFr3oRs8s3AvCtQizd4wPL4WL2bXg40iHHH2bDW9TQxIZjSP0NniH/eHopnmD6Iey5BczZfHdzFh4hS5v9ORf820svCUiVUZegCZXSVOmYSEUSnOm1Rr9AmUordwE+xsH0jaKfMdyB+fR87Ma5gqGLc+WLFpPDwuhGYiBFXEKDztrn0cTXYtUDPu6lOILnb5mcCDFj+NyHlSqVIzPuWDdgEc4H5ApdfuamyLXTmVrXXyNGvVrjsESVFt7/uOsrAaGETvRt/n/j76K8tnphvnmnYusmo599hkN+edsEGN++gJn/yHUN6nOE/tS3jJvRgfcodoC6XMPDZ8jWb8FYKKUPZh5b9+/IupHjOiV+3T+0RtXqcaswohCiuhquTRwSFfyJQC0yUjvyMuFNdrBfZfbNJfWlnlhzZ85iwF+tOVpTtz07jsTNI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(136003)(376002)(346002)(478600001)(6486002)(36756003)(8676002)(86362001)(2616005)(8936002)(316002)(4326008)(52116002)(44832011)(6512007)(956004)(26005)(6666004)(5660300002)(66946007)(66476007)(66556008)(83380400001)(16526019)(2906002)(186003)(1076003)(6506007)(6916009)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uDNtwe8m01xn7Ovj0y57+QuYI0QMgcR/f6M1rIOMUg0SKl0XkS5pewzzfRNc?=
 =?us-ascii?Q?IYX5rly+c0ApJ3HWAKaep/ZB6q5EhTFLlpXiC5UGfPFTARS6JxNeLikxxkIE?=
 =?us-ascii?Q?yRFZ0tn9TSdLgpNBLUGMuhR+O0lYmy3GDXUox6yaWD6pYXpjJyhQlyEudKGI?=
 =?us-ascii?Q?uB8YHOS3653Ue8nqxwK3hshmE/tz63unH9cJtdIuCJ5pUWQGunczxlwuYRjY?=
 =?us-ascii?Q?HQfixjh4eGOv/t5MO/wnLu9rkGFmie+qmOjx8z5UZ1Upbhf/xGrpFvQyzrOp?=
 =?us-ascii?Q?aVwiZ6llhlPhNEjqHnAAW3EvB9w0mYmrgzmEicKHdL+i3RNZpL+q/2hBdlcY?=
 =?us-ascii?Q?obkGu8h79nREOPxfnYDUDK8esMRic4Pj73GEAbafPdg5z4xz0nH1wpB22Y9b?=
 =?us-ascii?Q?XbxO5LDroiKhooOInx4HSBtGV01/BI6EivNJ1oiWnaA//YaBvKgSF3I6LugK?=
 =?us-ascii?Q?n7o5uQTMHtMdwytm8E1R3UtmVoAIjLfBvNWyzTpil+l3UyQ9g93207EG5qrC?=
 =?us-ascii?Q?XnNvySmoVS7YIDUYKxErGN0qJcnhdRdoNbaxt5MRukY7DVuKHgsbHwFCOUqx?=
 =?us-ascii?Q?fMr4lIBVfoQruBtWNiA9cNQYulua3abzxLMLzl8mzHCqHB4mVJe2YumMRAbS?=
 =?us-ascii?Q?e1S9BOGSX2nhLdiu4vUpN5zWSnobV/o7xutztIZMAOiKCzQoaLctH97oPJAM?=
 =?us-ascii?Q?mdwq45we7FxhufNAgq1x/5Eu+1z7APaUK6Dc8/lFLvpgwcdDvzHgUqnkC/Zy?=
 =?us-ascii?Q?IZc4OhGCNW5hkMgls3pfnUrrN6/YOO6rHxTGBmU3JH5gi0y2RFoLlZ6T50EV?=
 =?us-ascii?Q?o+gym9oHcvXyz/SJxAbk2Ox72VEe6OXUEQLQ7AwQ2DI0NP/qqX0aCaM1KRfJ?=
 =?us-ascii?Q?hpjs4za+p0qtVsa1h2VQb4cj6aP2BvgRqXB+yWuIPxoay4ON9MLAT8R0gkL+?=
 =?us-ascii?Q?6byLvAuygV2Wsh/qhup/NhhREANRbTzBTo3p3FFYvik=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 06:41:48.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c78fb7-514a-482f-71f4-08d8b6c52330
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMwH8NUGkgu+mMlbTvYIJ+/2AyVTGq+k7bMtEL/6yNsg7tHsiZL6zadYrtz7Dhn3u2w5npg5/C5W1JfefcKOtn5ZxauzxIdfIToO6KZlus8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
Content-Type: text/plain

from commit b0384720a46fb25c4ad180e3f256ffdeb53dc8a6,
which upgrade libpam to 1.5.1, packaging is adjustd,
and the binary is packaged into libpam-runtime, so we
don't need to append them to pam-plugin-xxx.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.5.1.bb | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index 8c008a9701..d6612bb936 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -82,13 +82,6 @@ RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
 RRECOMMENDS_${PN}_class-native = ""
 
 python populate_packages_prepend () {
-    def pam_plugin_append_file(pn, dir, file):
-        nf = os.path.join(dir, file)
-        of = d.getVar('FILES_' + pn)
-        if of:
-            nf = of + " " + nf
-        d.setVar('FILES_' + pn, nf)
-
     def pam_plugin_hook(file, pkg, pattern, format, basename):
         pn = d.getVar('PN')
         libpam_suffix = d.getVar('libpam_suffix')
@@ -116,13 +109,6 @@ python populate_packages_prepend () {
 
     do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
                       'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
-    pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
-    pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
-    pam_plugin_append_file('%spam-plugin-tally' % mlprefix, pam_sbindir, 'pam_tally')
-    pam_plugin_append_file('%spam-plugin-tally2' % mlprefix, pam_sbindir, 'pam_tally2')
-    pam_plugin_append_file('%spam-plugin-timestamp' % mlprefix, pam_sbindir, 'pam_timestamp_check')
-    pam_plugin_append_file('%spam-plugin-mkhomedir' % mlprefix, pam_sbindir, 'mkhomedir_helper')
-    pam_plugin_append_file('%spam-plugin-console' % mlprefix, pam_sbindir, 'pam_console_apply')
     do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
 }
 
-- 
2.17.1

