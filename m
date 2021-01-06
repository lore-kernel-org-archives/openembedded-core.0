Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.6936.1609935006756585984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NLbsV9NH;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdA87OmvO4afSEML6eYo70nI+ZnH76u09eKhl0cUJaOhawClyI+KRD7zFC1ZCov74RnzVf1bJwko2IvERdvdaJNO13tyc26qGdTqfAciMouPWSKjFmxfzopXah/c5RzpKPTcOFnxrZAaujBxguUUxmtbQooei1waSCR1FSG1gWBXH3puzZ/0O3TBmfCUysruinND3Qe6JXCy3JAbAmjP7HcckMOeEvdQjM83Q2Jxdy6bLSdVhTWZRjV+wyQlR+xQo/x7fYk2dZyRu+7HPTjN3nxeQu9EvMPbYaKnoGe/9rPWnhx++VlGybDX7boBskEzKPUZNsTWFJvWI6i9zUfyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIPiMckDbO/WhZM+LA8qrFxfUZUXb9BlMdeZR4YyYMg=;
 b=Tv4O4UBKKAbud54NxYeMidMc8tZCOdjC8RdgjWOEUVd5sVIiEkbFFTzcj+2Ny6bqXFo4oA7HVhRTcr6IpyUBVv3/JLhMZhr6MuRyu0yZbd2VeUjMv+us+u1GO9YwzMRS3aFHtY5FfsuA5V3aLBhieRhZolJGXgJ9HCmQxJSOvQrJXRtCa0T/yGeO5G1PDUoOiSJO05e5zF4JTQo5R6UQInJ5pDdZ70MPieuiKK+xDzeIfjkYWTJeE8gvpLg73/mK7VR23NFKoi1RoiQOyJSrWCUlh2HzCaSN8HYpi5S3HqPi9V9pfUYOwU0d0aI20DFgKNY2szZJY4LCW7JeTencHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIPiMckDbO/WhZM+LA8qrFxfUZUXb9BlMdeZR4YyYMg=;
 b=NLbsV9NHLOxe0o3FglallSoaRe4agpeyg4KTpZhcwVKtsCqjg464IBjciumMWuvV8ScCD3nJeuMubH2MJNI6mVk3OHymkgNjSnpGkNOiTngg8JjsN/ILBbnLlb5ki4/p7RbyG+DxZm4fD0xotf96Qn8zidYSKlF1y1JhiAxd5+c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB3088.namprd11.prod.outlook.com (52.135.124.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20; Wed, 6 Jan 2021 12:10:08 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:10:08 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] ccache.bbclass: Set CCACHE_TEMPDIR
Date: Wed,  6 Jan 2021 04:09:52 -0800
Message-Id: <da89ef4dd487066bff9cccc2817a99c09324a0cf.1609934927.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609934927.git.liezhi.yang@windriver.com>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:10:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66f6fd3f-f47a-4186-833c-08d8b23c025b
X-MS-TrafficTypeDiagnostic: SN6PR11MB3088:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30889A18C56DDEE1A2B19064FFD00@SN6PR11MB3088.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZkgeQYLP9CNhCpttKP1Z7Ia9SVvf4r7C4eKg7nn4sPLd75CH9/wwSDwNaVVmOOo7GL0UeEfbei5h2AxRxgVUYApG4qSlCfUKQnLZd/6Jwo3ZgCayI/ENDTxjCYkOp7MXhI3qmxt8KGdV2hW47E1tsRqamf/eYAbbhCi9IKJFgbzbkj9xNDqXAUW+/eXZLeu33+XC1eYDETNod5QCJqJcmROot9UxaNeUbOmifYPjWpwmFjvzGxeYgDiPoWTQcVb8z6R0TskGwFxIsp4GeUj7BWusVBe/cFvYMv5cp9FFDiMjgakXo9nvaxRw3X6QrMh4DAx6PTzK7GbtAOilqWMamfdWKIa4Qzp+sXvtcoljOEvN8l9bmbjTigIli13CPfAwCpSK2UHi6VwJadEPEzR2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(5660300002)(478600001)(8676002)(956004)(8936002)(2616005)(6486002)(36756003)(83380400001)(6512007)(26005)(186003)(66476007)(66556008)(66946007)(6916009)(52116002)(6666004)(16526019)(2906002)(6506007)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LIk/nFTwPD6ultCorFOZ/J86Q0oyKeo/WZlbEHZ9wIaYlgA1urDeE8X3P/i1?=
 =?us-ascii?Q?P9yRb2HW5FExti+qE4lkEDQgTW8klNUHJRSGJtMso02TaW24Zk5/qzUzZ+CQ?=
 =?us-ascii?Q?+CCHkltWNSP+8TJ8m3aYqv0V4sMitHFBXZ2CjnJ8V0Xi7sZS7w59u/WZnqsn?=
 =?us-ascii?Q?z4EcX1hGa1H0BQQSO+lbLXanS5UKPBOHWdkoS2sFKlOHrCpSi/G9PBeFjsN8?=
 =?us-ascii?Q?cptWgioojoH0wdaneOKIy7g1mFV1qF4dlZIUlHfS3+Qtbssc0S2kPCn1Adqb?=
 =?us-ascii?Q?S0H/2jm15KS2/lSEUhTmfyqpFO1hJplPdz0FVzLWVYfu0H5BKdBsqHKLIDhN?=
 =?us-ascii?Q?5rPP/aV4vyjANAbWjDFMlEDWJMFgggJBlREbgl4hqwn+i3nviJyHZ+tcwp/M?=
 =?us-ascii?Q?lB0ap/ToCIQWJm8KzxjUWLHaMR7WbgQO2M34t/JVObU8v+VplAPbZ8GH4oHu?=
 =?us-ascii?Q?YrUoV31lAsxTBbIshVJMkhX9jh5os1HnG1+NcV3ORt+T0elz+EmQe7WghH+B?=
 =?us-ascii?Q?JrVokaxobDHLpDkPJSM+ALWIb0AGYdNBFMfo0B7iVWeO0V/sQMuaRsBWbPat?=
 =?us-ascii?Q?YHDon0ppo9dQ5qc9ubStak6S4R14iXndqZPLJaYukjATrpugESJI6/HFk9Gu?=
 =?us-ascii?Q?eY7t4kvDyB8xyuNNIhuBtKIWQsiJGZt0hfwYITr3Hpm9GL2xiWKS3bHUm8yD?=
 =?us-ascii?Q?V8yoGhajPVE4SKRFjVssa09K+/f3k+Wt0bh+pp26/2x6fbT3VhOF2QxLuQ3V?=
 =?us-ascii?Q?ZfuN2M86r8TPQzraV589UVYRpLQmMejN/ztWQgDTZldGXQ84AkYiH7NJMM0y?=
 =?us-ascii?Q?GIfNL+mQtyL2rss9cKkBzzA/MERV07c2n5oeYCGF7xxBetXGnU10TpZSOB79?=
 =?us-ascii?Q?CIYVSAjn5zg2LmUwKHwLfAWAAVVTG6yDhk4bzewGHnIIptMy3O1pOsPFjzJA?=
 =?us-ascii?Q?Zfsii1UgQuo7jH1Np2JEg64yMnZt8oQTYnCIIkT7TQKA1ugVbvSRyrRPbeQX?=
 =?us-ascii?Q?2lv6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:10:07.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f6fd3f-f47a-4186-833c-08d8b23c025b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74j0u2BwKBDTguB8piY3Imx3fn4Zx7mbluhsuae+RNJxuY7vBDgf5BbJzBdKajaUZfcIHZJS+rk4BaezpWYj7/IXYywzGXmYdxGEzD2lazo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3088
Content-Type: text/plain

Fixed when build with buildtools-tarball:

$ bitbake linux-libc-headers
  HOSTCC  arch/x86/tools/relocs_common.o
  ccache: error: Failed to create directory /run/user/0/ccache-tmp: Permission denied

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 11a3f1cb52e..f00fafc292a 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -35,6 +35,10 @@ export CCACHE_CONFIGPATH ?= "${COREBASE}/meta/conf/ccache.conf"
 
 export CCACHE_DIR ?= "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
 
+# Fixed errors:
+# ccache: error: Failed to create directory /run/user/0/ccache-tmp: Permission denied
+export CCACHE_TEMPDIR ?= "${CCACHE_DIR}/tmp"
+
 # We need to stop ccache considering the current directory or the
 # debug-prefix-map target directory to be significant when calculating
 # its hash. Without this the cache would be invalidated every time
-- 
2.17.1

