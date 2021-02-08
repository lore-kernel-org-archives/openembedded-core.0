Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.71])
 by mx.groups.io with SMTP id smtpd.web09.31762.1612765293461991089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 22:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y4DOQmIC;
 spf=pass (domain: windriver.com, ip: 40.107.102.71, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmKHy9h+XkdPO7kAvY5fjArKe4jeo6mBji6CbLGQCUtHkC7bc4fhRwefyX5ejQIl5CK0mj/Gp/oNkJSiDIxWfmwImkiAr0D4rdCkmkG4pQVZ32ItaINRDTMpykrCiNajaaBKEQyH2qL4/ALg66zj6INjTiXRcgHs8NcaBENo/9AYJMfG/Qqvr3nrueNuXfAwv1SokKh4fZN6f7DpHFaVLefDBLrCNfmx5lVqseQbvR4soA34vIxY1AVR7ADBJ+4W4JtD+F1AAj+Mp6gGxEsyql7B/Dxgba5yKTgxnQHPOkGnvgakLhZQJe/LMYm9q7pkmyg8T8tJBm2R//zGB3RmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG3a+qbBkcFawf51Iyv//csElfZmgx/cLfNhginhvnw=;
 b=iBcg0VTrCX3HrDCz1jl+bjKZrNojfNBkj61L/wmBCjD0qykJoQSrPGOVFNV5FofCJt4X+se8550HJMzGsMbUOtExx1tRccx3JtF56SpKzZbEdQyJx4SE7xktQUyCewYMmTj+9HNg+ulfsXTEGxc5nxUFZrJhwhkQYCCX2DiYueabA7L2eKjCANrXGqLFKrCbiiHOf9rvCmRPk1xQsosOhlmVsQ25Xj+wda5FjWDBHSxRuhhJ1j2qaDLqCrCFgOPr7PTaOzf6YZKRToYwW7NIL4B7fiyv5NVPvkPRAkZ6EPuZG0oWFu48wcW5j+zAwSAsQFHrt5K8b3F9JpJRKB0Liw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG3a+qbBkcFawf51Iyv//csElfZmgx/cLfNhginhvnw=;
 b=Y4DOQmICbGC7vM1J0SWS9DE9BbwaX9tArXhd7UllYCFuVAvbdkR5bMPhnX1BL/+IWuKkBjpSg3fMJMyus4ZDzfPcVu4520b1jsVDHaMmGzyveuZVRAN61N2kFDsbAHnPpKwRsXxHGl0sCv7tBETZCgUUUjLFLBQmFeXnL6rWCbw=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 06:21:30 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3784.026; Mon, 8 Feb 2021
 06:21:30 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] cryptodev: update commit id to fix build error for Linux 5.11-rc1
Date: Mon,  8 Feb 2021 14:21:17 +0800
Message-Id: <20210208062117.6653-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:203:c8::20) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
Return-Path: qiang.zhang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HKAPR03CA0015.apcprd03.prod.outlook.com (2603:1096:203:c8::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.10 via Frontend Transport; Mon, 8 Feb 2021 06:21:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e707b374-9b3a-48be-b346-08d8cbf9c5f8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103CF563ADA39C2DA0BE7C4FF8F9@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dZqQydkYpsYv9kcfZIh6R8qbQqnISvR2fdrApEcG4DReNuzwo95zzkVv6Tr6qXnZgih4j5uDnuWaCyB1vizulYbC3cide8C2mr28aU/qwjwJsDR8LUN48GXZ2gqvRJSLpQDqzy15NRp9slwr3p4aqR56X7CMOXGOp7ZcPcWvFbcOaCiqW4+b+4sxmLOKSbdHVzyffYQeGCrc4ZR2ZmxKLVXnCTuyRsQLZ4RLp4XpvmxmcW9SuBoou4RAuv1HSIUzki/MXatpy46hiw5kGRkWWsby0Hrb24/bU+hOc3lNjbR6IazAnwA1QFdmUAhP50e/TWKss0AglQX4d+9z12BZeMt59/zxeNt3dQ28TSYt8iqgPDOEh5GXfBnxY65IeuowblfFVVsLp+txe7kxdGoDRPPrA5WUQFQ4J7NxauAVSopiJo1mfpw0OFKhsW58UZdpxiRZ8vfAVS/gBvBI6ILIwSFhdK8RC9QjAXPI7xSUWk5oZfluQDciBWqpfunNVf8x/dv3rphQzdXzMAycQAHoGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39840400004)(52116002)(4744005)(6512007)(8936002)(26005)(186003)(83380400001)(6666004)(16526019)(9686003)(6486002)(8676002)(2906002)(316002)(4326008)(86362001)(956004)(2616005)(6506007)(66946007)(66476007)(36756003)(66556008)(478600001)(1076003)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3Dc7OX8vsE5nL0bGhp62zJjwrqV0S6dw7W7oJ8a2ZwNFHdD911H/49JmM69L?=
 =?us-ascii?Q?+pqcTOV+n3SjOpClImSGzzg47emxNkcXfiejD4p2aFOu86PYUjSnGszOh1Z7?=
 =?us-ascii?Q?ZHAIdtiQ1rBQhSrdYR5zS18oTXtvnwq/RWmx+K7D8eBxByuGeOZHFk7gRrkM?=
 =?us-ascii?Q?p6qaVfrymPLFi99ZxTr7itul5J8+pu+W4ApNTidkVMdncCDw9TAmTGwn0yV+?=
 =?us-ascii?Q?VjgRYK9mQ/LEWmLlEo7mXQUgEMDQCFnY8PdhjFhrGe77cK59sSu9vRLIv2Fh?=
 =?us-ascii?Q?V4QieAw/LgsN2YxiVSFQJ8+mFHWVUqTJWDvPRsZ6jODxulj4Gx7FcpUIp5HG?=
 =?us-ascii?Q?tuGIo4bKLVg41y/t/FXPRI96d+n1CqVF5u+TgcONtyDzmwpEiv5RZF+nDP/v?=
 =?us-ascii?Q?Wj0rOcz+9VPxPeNE62VxUn+8c8M0I5wVGfRIKFm2AwHorlHdpjXgH/aTSivB?=
 =?us-ascii?Q?sbYXaj2GiP0kQ3lYPhDRbG/+jzD9kTvgFQRGBLcIPemRBMHL73gYlJSz3FGo?=
 =?us-ascii?Q?YPMoThyTgucbYUUn4nmCqbWwgDe9eyGW91y3bFghhjDlJ0gLmWirnqY5020G?=
 =?us-ascii?Q?Lo2ue24GR9evWrz4rAEJAJONXEZd0gE8DVV4R5sSLYG+A1SRtO+m+AgznVZo?=
 =?us-ascii?Q?EOilWrOszM7z6auLq6DGh7QM/U1gApaTn8j3SGQohOJOE3hf36xd+HAJ4+7f?=
 =?us-ascii?Q?ibg21pRmyVNvxI7wSrbtQRj9F+X2JkIJMJEWxK7FaTWjNILIRlcuwlWDsqos?=
 =?us-ascii?Q?1h1MXmjc3gDFu4XGhaPC5QHLYOm+gbqVLZEq4Ek06B28dB2w8NsipQxOQ6yt?=
 =?us-ascii?Q?gw9RO33b+CCWd9e9d0zxcgSrgnFWBngdnyLRWPlAhXNOUzCij8W6CRIeHQCz?=
 =?us-ascii?Q?u/UPDpVkAZYlhlf4p/MDiZIVVCtPAeisImC18qQ8z5PtrHAVAkfpaia44OkD?=
 =?us-ascii?Q?8GzS3aYc0s1sGyw2cTLrcsHSX+iMN8Kr0KrlkFbvsvXXXw0uq/z8PVb9cVRZ?=
 =?us-ascii?Q?z8X8ZGVeXdiOTF3+f+4bnjw6LGSSTg9dGYv809lYPZlI/dpaTELIcQKHQJU1?=
 =?us-ascii?Q?z3XWgELBkuVjd0NsT6aXH7PFqQWDsN8nUOvdoY5DRleBufQFmIc1ek2NmX3k?=
 =?us-ascii?Q?FiC4W5mV/JviyysNnU3vSFgbx1JarWWHT2GpIhrfcot34G90wBi6YrkOlfGZ?=
 =?us-ascii?Q?I1i5dBHrM+0Tc2rcJNBre77lZKrK/fmV1v1Maqho1SS1lB4FxnDZDvL2qoSv?=
 =?us-ascii?Q?o72P/QEwWG8okFnWolO6fzvnhN0mNsUkHS0p8Z5cbz7XVcX7Lb2YLnyUOKHl?=
 =?us-ascii?Q?+d8W7Qn1cb4SNk/wYEIlvIVC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e707b374-9b3a-48be-b346-08d8cbf9c5f8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 06:21:30.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcBWDE5IBKO0Prax2XHhp6sprLFLDdBS9dQ11k22P9Ht+VOjuhkBkRqafXiy/mW4AVA5q8q9pxdJ2PGgVHvi8T6rVoFHl6LrqzYH+GnyVI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

Fix implicit declaration of function 'ksys_close' build error,
'ksys_close' be removed, it's replaced by 'close_fd'.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index c050eda49e..bce19939e6 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
            "
-SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
+SRCREV = "726cf86d6046350e94ca1235abfe8e55ee3547df"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

