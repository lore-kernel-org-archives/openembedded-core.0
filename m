Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.6272.1617798143329035027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 05:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V79i7iyb;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3gFrddLUZOopzd/bRNbKLc2HKX+TLzNAan7Eqz0cnqUYezwQ2WEdIjDDWqAhGZXjhR4PRR2QWarxrwlGqSrET6ejQxv0jpRJAyO5CNnjCoz5gTmAb2DAwJq2P97CFtwmXvzSpu64isw0aaY8JJSVSjwJxSLnAdPgSKG5AKb706dQ1E7w5tvuS9bt8oXy8Oq3sMO23mSPsm/pXNhFIWw64+hSUyyCAkLlRzp9n1+of8E6yi203Hrr3B22dH2xUs4uIPWTD7in6OlAtfrsi3YC02VMK6j4IO8solsHTpQy6fGM+keZmrKsfGfLaL2rpfU6UVBzpKlYKt2VFLuExFLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5YbCv9YsCFaHCD07uTIoX30AzjUi0rcIoAFuTfdAHw=;
 b=AZv6EBi7ZcBl1WILXWRjYnHTAihJZIHQbhDRqAMOBsH6KpK0AhUWNBDb12kKUNW04iWmaTgfS7FPY1bhKyjk1p1yxz0NFh5bTuPOZMwSgK49J75nRfQaUQjmLKUEolokj7YTF6zXLqT4kUo/Z0UyRpb/rSm98DBKW/bkbIHeOg0Lshfe6vXbgxvQXO8GYNX8frrq19UJMOoESBNZOep/NkSfzfyc1waN+hIwRtEGdF/ist1CsFxsZz37NfEc2PpvlLwYGLrWBI54xQMSKM4fCF4NrrQqZee9nVE7rpkcc4Q3N5MwoSkFFsbOjNNxgKZhYqSdj+P2lseJB+U8z1ZuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5YbCv9YsCFaHCD07uTIoX30AzjUi0rcIoAFuTfdAHw=;
 b=V79i7iybsJCDSqv64WEgOyxj/Ag1PGbd4Qn7dzWtVIWzt3CX+YcYdQmZgU6fERneIUaGWfnB1DOi88cKXfnRYdPljImyqUqyHll9L/ob3j7zYqm6V2NheybheTNWlSiYffozmNbPM/kJESge8UeUSzgnnP9hU5asL381xZLmi9k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2682.namprd11.prod.outlook.com (2603:10b6:5:c3::15) by
 DM6PR11MB3883.namprd11.prod.outlook.com (2603:10b6:5:19f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29; Wed, 7 Apr 2021 12:22:26 +0000
Received: from DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810]) by DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 12:22:26 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] Revert "inittab: Add getty launch on hvc0 for qemuppc64"
Date: Wed,  7 Apr 2021 20:18:12 +0800
Message-ID: <20210407121812.4099-4-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407121812.4099-1-kexin.hao@windriver.com>
References: <20210407121812.4099-1-kexin.hao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To DM6PR11MB2682.namprd11.prod.outlook.com
 (2603:10b6:5:c3::15)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Wed, 7 Apr 2021 12:22:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10f84361-42c7-4081-75b5-08d8f9bfcdb6
X-MS-TrafficTypeDiagnostic: DM6PR11MB3883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB38834327F90B4612B511F1DEE2759@DM6PR11MB3883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G186ycSVnZLRVaWJJz2CKQjct65QzYeWX3n7BlRayqTSW1WVmvgzghShJ5YCrRMLKfiq94beNQkIcT6C8hL5GfuTlGgHLMkzHJYrPKhKfvTVRSXxiS1Uj2vT8iKdOQkPvPHyS3HpnOqCuGFvSuMa2DZBHmLllTfgaaSMa/77yDFKkvvBkVy4uSQIUt+aRHD6tEUy5cENgUYECId/bECm8ZPK2iD3BCoNcrNvZnWgUlO6SlAwCuafnob54ZR3XoGFjq3Y75gqc3CrQMtEyj6BeEdKn6VpqF1e6if9wxzRuA+ahmVWJYKsB22kVz9RvQBj3pBmwyrvk1wYsUFgeDoQx4F0VylJdl+kQItRGWwAVayUgA2uNE9bNLfn0t7AkpA6xEFbU+Qkl08B41FyUsOPLUyUUKOsZAUb4iajJzOV0tkNka5l0B9Rcazc+6R2x7t/qm7b/HeAeRHEinA28MPNqk3pxvTDkv7FldP5Q+U08Lzm2H7iL5kcD1zMAo7DmuTWIDq3tju+wXV4zHDQHK7qb3WsA+cBXusB9R9IuMlfn5tVc7aP06oCapb2W8m7CBPVTJid2ksV/RNj8XauK1zGVyELGFrn4XF/31pXj7XJXcJuie4nF/mXWWGLKcmzzRS89CfyPm7rxiGRSEcLawFenoU8nbsJN+JcOCtfbORSbu1uJUJnu+PIaKRpHeXi0B6W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(26005)(2616005)(956004)(6666004)(8936002)(38350700001)(52116002)(86362001)(6506007)(8676002)(6916009)(5660300002)(66556008)(66476007)(6486002)(66946007)(36756003)(1076003)(2906002)(478600001)(316002)(38100700001)(83380400001)(16526019)(186003)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?rmy3UMOmkDGmVIZJftPV4XKAAL1OpNDd2OLDW/6h1xlXGCmI3hq1xh6jng3o?=
 =?us-ascii?Q?xvXww02ScvYQVjeDhfUAr/Hixjtxh0J9Z/c9XwrrMEsK2xy67yddT9tSSZ1r?=
 =?us-ascii?Q?ZfyAjOa/rZ4ZQzgVsSCcD9QEYLT7+jQ8ZTBNftDSyMOTE6SRFz9TuAud3g6t?=
 =?us-ascii?Q?SW+Z2v1Qforc5PmeAFhjKA/ylVJS+fLFf0mKXdBCdDnYX6iOYKfXQBVzfr0L?=
 =?us-ascii?Q?1VVmX0+lNvbs9dHVfmVxYRLf0uhlcOYd7OYxOnomsf3R/U9aPlMzn9/uRRHd?=
 =?us-ascii?Q?mK6ARCTk58GcYOEsKzw2afHJIr3h7WMK+2tnmUzYIcHYgdzESnk63a83zG3I?=
 =?us-ascii?Q?lAM89HXeAj55tKfq7z+xYcfZ9d+2k4xjy0b1nwKUnJdAEdCYK/JDOMUYC985?=
 =?us-ascii?Q?f0yVkYHqpSJAzS9mcVAxYxZR6TnuHzLf3qxSwwWt/uphd8Yu8iwlR1Pze2O1?=
 =?us-ascii?Q?N4ckEnYS8Whtf2/w6aDxm+AC5u8tEtH0yryEpywQ9m9DHgQ9o+ZC7ebjo6hQ?=
 =?us-ascii?Q?lm+9394xpNVompEUflxKIZ4OX33s5sgLsgp8S0KbGQVNvttig7hl7JfRY6ae?=
 =?us-ascii?Q?0CKittAWCvu1nyrvGsqXRLtMPeYn4rg2HV/CYO1Pvr6KmttUCiAKUCsrFCaM?=
 =?us-ascii?Q?ELSQxN+mPPHlCAhvvdlMSrxJrBCw43FIevVwYBih/Ueiln1UaYDj9H/s+VYt?=
 =?us-ascii?Q?kxMdTzx19VdWkTdjO7yMZ31bx27FFy+MJ0d/ywD7rnv4hY+SG7+hFgbXMMaB?=
 =?us-ascii?Q?ReB5GLuzZqMzXDgi1roEdvDWKdt4E10Vx2TU1e1Rk/v7hUFuFofqHb5ds/wB?=
 =?us-ascii?Q?vgHpZU6w8VNANuNitihtdaPF2/Y6Iwep9ilPsNFFChq/qrkXvlAMmXEVJIUo?=
 =?us-ascii?Q?ZwzR3dMwU4einrPq0bhFhGMAwTquw3HsBa+lsdbdyjIX+0JFpVCgbjzcZV0O?=
 =?us-ascii?Q?CWeQgyRW+RhJOk+QTn7wPfkEzPztlmSmxYzJqb2VQgR42p5XAhCn8kgzhm7R?=
 =?us-ascii?Q?o4R876Ut5LosP9pPkORlkaIGdpiDYp72700hT7gilpHS+R4kXGPIIN3qPRVZ?=
 =?us-ascii?Q?Vj1JoPm2DXGaP5zYCa903k+wwDevbA8my5CzhWlM5DQxMmQnCFUzQyaPcrYK?=
 =?us-ascii?Q?dZpSTWDeDY1RntGzGXUIVvC6/zxFVQvTNmrTIrQIXg2j11dtKiSmChec78Fe?=
 =?us-ascii?Q?0a28YG/eAc59AJCyGcaKhl98XfqZfTOTUtkl18I3mPUheGxFOJAGvbaGOtVe?=
 =?us-ascii?Q?O314rvdqDzI1mWvQierHp8oufcegJRHRSiHTSIRHBdTbf9het76mJXPljYAP?=
 =?us-ascii?Q?TBw7MO6fvGaJ4nSEeyvR9VEf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f84361-42c7-4081-75b5-08d8f9bfcdb6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 12:22:25.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6zKBfyCII364Ps1RAq5FJqOpKRD4Euq+WulEo1lsuO7m4WxJ2nUQNinjT59ospYwrgZM6ZWJG+5lAkM0HRVVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3883
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This reverts commit ed69ef20167da0986bc9363d1a91e62001995af4.

The console entry has already been added into /etc/inittab based
on the SERIAL_CONSOLES. So drop this redundant entry.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-core/busybox/busybox-inittab_1.33.0.bb    | 3 ---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb b/meta/rec=
ipes-core/busybox/busybox-inittab_1.33.0.bb
index 0021e45511d7..3804f4f7b2d0 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
@@ -44,9 +44,6 @@ EOF
 	fi
=20
 }
-do_install_append_qemuppc64 () {
-            echo "9:12345:respawn:${base_sbindir}/getty 38400 hvc0" >> ${D=
}${sysconfdir}/inittab
-}
=20
 pkg_postinst_${PN} () {
 # run this on host and on target
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/=
recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 0af116f35cbd..d95d1a63f5c4 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -53,10 +53,6 @@ EOF
     fi
 }
=20
-do_install_append_qemuppc64 () {
-            echo "9:12345:respawn:${base_sbindir}/getty 38400 hvc0" >> ${D=
}${sysconfdir}/inittab
-}
-
 pkg_postinst_${PN} () {
 # run this on host and on target
 if [ "${SERIAL_CONSOLES_CHECK}" =3D "" ]; then
--=20
2.30.2

