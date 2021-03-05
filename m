Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.42])
 by mx.groups.io with SMTP id smtpd.web11.9278.1614933012275641259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 00:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gPK/XRq8;
 spf=pass (domain: windriver.com, ip: 40.107.76.42, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q16mdo7gm8pNnnDo82mgnGqxMRN/wng+DmIYyOG4TPz1defo088UaC9/TJVtdhGH5he4VPOAkD3+DWGFY4CWQNxPQbm+K6RbDRkovqdgCK63JpemAi2wW3YVkeShxARUQpD/bg4hLb+gK+t06nofeyegggjc5nerauF8TZ2KTGqYGZTnYS9rR6x0Mm1Lvy0EnPxs94/u+G/1wd4oMOtARWFli/ueeOKNWT/Idqb4ZhK9I7xl9nY8pM2FYyghilFqKgLmE6ZMYwMFBQD8/xJC7lPJ9rUgis4MOVRHR/4d47W9ZxU5233nqAcF1J3VaQdGspJij1KKutYsnDu0xHu9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN9+2HNE4FczvzSX4ZPxI7a5xbufS+XEXk6uzAaQUo4=;
 b=czuEBtBJT6jdkx6zUYF4y+bV2rGMHRySmjvzBOwp7NU10gElcDb+/Etfg2DeWmMw7bprECpzr7t6ypedC86FHiq6O218fDscdTgltaJsroHmC31NRz8CYLCY4QUtePyIAobt+pG1Dro9upVako4l37Tok3O+as0lXevhcqus3FgjC6u7xZnqAmv3PI7Fx0JGfMEg2bzdYc1SUDD59XnrHAIx6Q4e58oDtH66mfOaUIUrd1rX5iFYt14HbO1Je4QPUYXKCius4S0mlxthcCx+0EsKfXp8GBOMrPaMZlptOQpaNSfNXwHbVz66w3oq0cwceLm4Q/IcZIBdM6Mkwo2ymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN9+2HNE4FczvzSX4ZPxI7a5xbufS+XEXk6uzAaQUo4=;
 b=gPK/XRq8v7WCAGYy/bfgVJ1Qxvin5Qv3lu1tynByIUqxA2GSI7oS5A58EXwR0HhRIu58OfMz1D3FwKEUA1+JzNSQP/im17GFly8cfUqo8F/WwQrXQK8GOTIMXwZsfMRP8U6JuahU2BuKGyjcogzyJ5xKK+BQ+T3wnlonErXq6Oc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 08:30:11 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 08:30:10 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-jinja2: set CVE_PRODUCT
Date: Fri,  5 Mar 2021 16:29:54 +0800
Message-Id: <20210305082954.9556-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR01CA0051.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 08:30:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4bb53f-126f-411c-858c-08d8dfb0e3fa
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB484587B823307FD6BC50FA8EED969@SJ0PR11MB4845.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Hsn31xteuGE+LdnB0GlXB0Ei2FQBieeokPg0swwfP+dRaPz30HeHNzVAfd0k8+Rm4AW+i9jkltb0ajTgSkyKXUSff2DAipNJu1KVWDb1UmAVwvEkM1yedrSJLBUrusd0WkLx5grSfG8Y9WVqR7fSskrKBEd0z84t53mvu3SJa6r0qqHTHyAIO8SbNVlWvqA9ZpmC/QxZYdGBEa7XU+y5xNx7FEcrdRhTqm9ICX2E3HqvOHsfAWj8th3Ho1A4r/XUsfVUCdYMfqX7KM0W+tDlYZbWkMBWhtekK69+zpGvEhs5/aUZLWrAzC/k7VqO9FiVq0Qgp1rDtUFjHFrxXWN34ts/R9TNHAYiDOpjiLU4Ojgdr53Qe5w3wI4thBgrf663DiFIoYoaZUFtOcQ/smj/PuDZf/+261Lv8b4yzw3CRlPwZZCzoVIEBLYjeRSp0iUNq1Kn3rs1QkNNaBP0d1ZuLMR+Px6SjuQo0ApAPsDhf/DWl8jURfzVq4nQFIeE8Az2gy5fPFtXjPkvw8jPcMmPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(6666004)(52116002)(1076003)(16526019)(2616005)(316002)(478600001)(6486002)(6916009)(8676002)(5660300002)(956004)(66476007)(4744005)(2906002)(86362001)(36756003)(6512007)(66946007)(26005)(8936002)(6506007)(66556008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?CYqijU/PphANfYP6m1dwRs2k7EfMQLBBHn/roqUXAHG8QJY8hooViuzRtvBv?=
 =?us-ascii?Q?kuyvQ94EajWReJIizUKgFX+KSRO0AJdWj0t6+WxHlFOoPfwNF4JkxhNh6Cq2?=
 =?us-ascii?Q?i9cDIjyPUWc1Br1hCTqnR8QgBImIwBND0pzvkIeauV8eBmx5UFdHMHDeVjx5?=
 =?us-ascii?Q?BsKpCaPW+GiNwT58Hpsb7iRobrpMILwe++ljkdAa/I1HYq32O/fv4XjrJanP?=
 =?us-ascii?Q?PyinZ2B11bXiVwBH81ltKbRStEb+GQqmOJJWaP+6Rj6uKPbBIZixSvYV4r4V?=
 =?us-ascii?Q?ppa0/t/7rXIYqflMnqsg41o++PpJlY9RlhfZTtUb+IwGl8HJcLpoqkKS7Xrd?=
 =?us-ascii?Q?luVMhC1Py1C+351HGp6M/jnMr+7i8JaOh0XKFC+sXQ5Kh7szFM4yoYswvS6Q?=
 =?us-ascii?Q?oVhj1/81z8ZJK8hPgq1r8iRpRgsr1+jlIhGayLWKF16PisOa6hFi6S4bkZWk?=
 =?us-ascii?Q?8z6KvXPFPrNCSY6q3a2eiBiQuX6tUxbFz9r5a4XRuRza63EQxFPdjILT4VVR?=
 =?us-ascii?Q?VJb814p9FX0VXmsAlqHJrGyjHOFnxUNcKI0g8aaulLYtJYGIxcqlRqg8mtd6?=
 =?us-ascii?Q?iSc/BJQOcJwguaEPYKJQBJ6JmMvMT00kd0yuAEhfD15XuxheHCdq4PNSHuvl?=
 =?us-ascii?Q?ClWQD8xVVX2+nUEL/DVbeQ1HraxbZJVtgmJQp1GeoR8jAXBCPxMdl944Pa1q?=
 =?us-ascii?Q?W1oy0CniyMGINXgAIBqx2spnZI2gOy0Ed7XPb+RULRaLaDetqJ+ADamApwPE?=
 =?us-ascii?Q?LoHIEDI5sSUH1LPwba8V4Wx7NFbih77ynAb5EoZhGI4xyaNKilo0jWI/uBi7?=
 =?us-ascii?Q?9qoNFstMXTZKXqgEGreMpA6W1ikWA/JHrfgG77Qo+1ECGLGDdIld9YaToYIY?=
 =?us-ascii?Q?MgQzljOCr3SoLnlJvA8p8kuWCyMYReBmxA2inB64Qyy9hJvQt5UOI+OtRhzB?=
 =?us-ascii?Q?blBuWCHDMFjB++xsmUArn7WbtykLWIDnps7mIBJtSKsNdY5d857qHwQwJrRY?=
 =?us-ascii?Q?lhDAlHn5eLpqnXqteTmGAHj7r00ZqoingPiHuy4IrG2Wa1m2ASQC6tEJR4VL?=
 =?us-ascii?Q?d4NvQzac+llOHc0IWGrWk2UtkwUniHrqmVXNwN/HRV28eHqEvOeP15p3RKN3?=
 =?us-ascii?Q?N2hzOXlB9+Y5zBx2RABGv/2fZkNjTd8KV7Xl/aiF9zhW+jRjNiZElhY9blRo?=
 =?us-ascii?Q?yas+8aUPyRSoSE9R81wJgt566OXZFJfNHN7ZWKRtvNdVztGYw1MqKaTAnu45?=
 =?us-ascii?Q?0n3aEhl4erXF2DZCQK57RCwhBCGkkZ+b/UJEn+csnlZeW21vWQyJJ9Kocxb8?=
 =?us-ascii?Q?YyajUzA95OSFAQ73TPA1UsYZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4bb53f-126f-411c-858c-08d8dfb0e3fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 08:30:10.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnkTTctwKid2e9z/nmg8YL1+zP9YJM73JthG79tDzu2W8dNLID1YiY4m3aAomykGQ72db5IsYVC9QFfG+JSoTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
Content-Type: text/plain

Set CVE_PRODUCT for more accurate CVE scanning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3-jinja2_2.11.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 19a4eee11a..86604aeedc 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87
 
 PYPI_PACKAGE = "Jinja2"
 
+CVE_PRODUCT = "jinja2 jinja"
+
 CLEANBROKEN = "1"
 
 inherit pypi setuptools3
-- 
2.17.1

