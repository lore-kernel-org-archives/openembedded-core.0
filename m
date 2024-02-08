Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B84C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 17:51:07 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.67])
 by mx.groups.io with SMTP id smtpd.web10.684.1707414662340783699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 09:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=a6B4+Igz;
 spf=pass (domain: ni.com, ip: 40.107.93.67, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZKov7sr/x/am2vbs0biWz9YbR0PiS9S20kdt6vRR+7YOBL6LddqAiN5FDZkcwl1Z20fQOWsY8snV0t22hcPgJQZwWuD/AKaQOnQWpHcWzxFxyQJ13xIso7m3QsEcZd51ZkwM/69EuzLcg7veJxw/S78DqvqkaFdQVvvSB3nWShoRZJo2mF1xLhb/etAd6NIM6QRc5J9bRdd0LGJTYsGNRpOMPqucJZupoCtnbCFdW8HdbNfd0KSUuTtnKZRmqCzEBisHUBUXQKOEFUdQ8im4rvFkVlm0d1NvWvuyILuNDFVkUs5lqy5ti44dQUcpoqCQKjRm1o1PCKPSajdZKP2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeuSmFeRCUjaiLWkm4axEOAopqbh7CiHdOAmkI0l/dU=;
 b=VLq1x+9rU4iJcyoG4xzSM4XT35qonMLdNw39kgkZWLS+1Iz7oM/DiRwLgI3eoWGvC3YyELBo7PPbh7pft4sdjY5G6enoX3SvGuEGo2lZxgtQ+On4XSGLTufG7nzu9wywZhpag9nujROGToLTsE282Pe46dTSdWX8Rx0EPEEF+aR1ngAFYatqQ67nW/8hofYPKQKMnT3LplKv/C/V4s5d7OzNrCU2wakg8127PlEwjb1O+4mc6LueV6EVaW/+2SgClIknla7hudMHbi/NjyTi3c2SYPeWsCoiAo5IQWpdkDp0j6tMoxtfsF1sXFfuzd3rnp8B5TEZ/zbK98+wl2wUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeuSmFeRCUjaiLWkm4axEOAopqbh7CiHdOAmkI0l/dU=;
 b=a6B4+IgzXClw2BBPSjVX3n18J9hA8m8EvEZnRlq/KBbRgPNRMd0bu8mPuVdS1v1e1/SAEzcIZOpej60w5VjbRBOuQnHrCzrrNLPL4Ono7LXzy84TiBwAPmFoTXfI6O2ULZA12OXC7mSfXuBLiAfgOt/+1TThOj7L5MRyuDvyqQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7396.namprd04.prod.outlook.com (2603:10b6:303:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 17:51:00 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 17:50:59 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH 3/3] opkg-arch-config: update recipe HOMEPAGE
Date: Thu,  8 Feb 2024 12:50:19 -0500
Message-ID: <20240208175020.1017580-3-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208175020.1017580-1-alex.stewart@ni.com>
References: <20240208175020.1017580-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:806:28::9) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc3f214-0424-4633-e856-08dc28ce823f
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SkklIHO5F31sfwDQMmZhzOGyQcNFi57ajx2t7f2E2YsyrXlIdoU19GDd+8t57wsZxenYAHyQ5C/WkROuDgrqWDxsK6CIn2/+Daf8bLb7revdUkUolgNZR63RbSfuLTe7WfKfcRmvS/P2x3r0s9zxfdt2C/6XYtMoIfsVUmvhAXkz0eYZCq9qDsMfbJmkuB8/fSEtD92CMcJ5ZfDtYZWNi9tAFG/daZ9G4bROA5k08HxKCynkLSFCE06nl5ISUIRrpvqKz+AQfrcZxjnTVwGElZbDoHymgguKODBOj1ir9P7m7pc0yJakXtUaGGp5dNxNeVdVGfI/mFJB4BHzfa6FhOZ1ZpZ1LQG40qLFRjmm7biaMcBxZsDbVli9+QrZQBuEWiXUaSyUaClcd3R3xdLjDyUWa1Y3nnV2fwP6/8HPhY1ZHQvhqW/WUk+rQ2MJrNrg6B11h8hNv8gBu4fyTbbxn+Mj6HuGp8qGdgn361qaSputx60a/A8gmNUO43GmO59pxZVHJpPhMyjoLw6xGWybSv3rC0s8tMiqZp9zTAM2oUY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(6916009)(316002)(66476007)(6486002)(66946007)(66556008)(6512007)(36756003)(478600001)(6666004)(8936002)(4326008)(8676002)(1076003)(26005)(2616005)(86362001)(38100700002)(83380400001)(6506007)(5660300002)(2906002)(44832011)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f067p36NanIfNRsKOTU9sXMdsES62Znl3uIcgcAi8gesv5yj0pMds4cM4lks?=
 =?us-ascii?Q?NkMta/SL+L6CJpPRROXEphGI+FwR1mgdfRW2aZ/ZysjBeRHCj4iacmY5l920?=
 =?us-ascii?Q?2gATrgXPeA5P7XaUHbATf4hzifPnFPcqQKIbY0OGNUgDy13J1+wesp2rfwuD?=
 =?us-ascii?Q?I0VhYPwj7kmbJuMIkePG8Hleh44HKi1UKYj3ecfkw5r7sxdunJWF0iTLeWrM?=
 =?us-ascii?Q?UGww9Qa6VMgnqMBVo89pMj96lrhP3Da2LupDdMUuaXCqZLq/B/upP9KsMpcE?=
 =?us-ascii?Q?9TV+DNAjIY9TPzlDplyDFdOhMEXYPeTSuZqCQe5O2p+7dPRbbKUMp4+2curN?=
 =?us-ascii?Q?E06XsxN2poIBC4Z7reQoNHPFpreKCFQGS1tzX3H8GIH12f/tqJBkq1ZUwSrd?=
 =?us-ascii?Q?uU0vqN0kZhX61YHRknhHNx4ZxzBSmrtRpj3SwOrwMemK6z3iGNY6rL6MCS08?=
 =?us-ascii?Q?MnRVYYbZTdrYCT7lrZ9xxo+qbtzy28sAbtxuDz2sCVIxMOZOKF38KfhlApEP?=
 =?us-ascii?Q?Efv1EyZlsYlO+0GkKKSbsl4quNq/6EpprSRznLufXW4J2ywNrjvi7jXE70Ob?=
 =?us-ascii?Q?5d2aucx5YRhJZpCzLc8ktrao1l6Y9Bq9oujgKanmfJDIGha5/3PX/CRH8d7H?=
 =?us-ascii?Q?ORme9eO26KYHkFmvXWnIzAxe7MqgFydBw9F5h5eU+a+pLMy5Ht+DoPk3kmNy?=
 =?us-ascii?Q?0XnUdUVOD9z3sKUgGjTmDf/TII21n2DihJ1F74g7RjmNDzY4wZ5E7Q0Al4Rv?=
 =?us-ascii?Q?Ea1einqK56BXsJf41h12y7rCKRZ3RCzd9QpXLska8JosiOGnmLwXwp8Ld4L0?=
 =?us-ascii?Q?7miCIjskT5ZwWxTnIuhTBkRdreWhjDVosmAFpZEPzAkJeWsFvygxd/vw6nlw?=
 =?us-ascii?Q?uAHtUgMlpgnN6QaT3nQAz2R4ugSEiCR8ScZ/ySfUkBk3JafMjvs3d9RtnDuG?=
 =?us-ascii?Q?wtKoJmz62ipqexymjmQ5X+BlaI4qsCKoevvnFPK6pixxXtkKJmVDHf56Mcnr?=
 =?us-ascii?Q?PNLv5Uh6m7kT2babtzlqUFOFIiBPJXBMeMpYjzT7pjDmRqCbSIIyZEFr5Qb4?=
 =?us-ascii?Q?AjrRMeeEcq8aQENKVjrW/TSfs9aaLJfSYVQAx8Lh8kVorzcPxf5IGCsacAEZ?=
 =?us-ascii?Q?La31D/Z27rhV6XkeNlD0MgVHi3sukE7GeE4UAXoZnj/Vjmf677u1VBKsNE6k?=
 =?us-ascii?Q?/YauN9z5/Jjo/Rq24XG4FPjbU2tLnGUDvKvAUfJjerlDg8toWl6EQrJovdLF?=
 =?us-ascii?Q?rXSHNmS0lKFk1GWFHyKkW/XRakwYMkW9GOCZGgSva+G2Eyw6KkcrlXOfxhXz?=
 =?us-ascii?Q?X0SgfTfM/wDAeOkIZ7S6tO0sOiscatnd/cPVYcgAzuyh4YCjYfpZZCg2OInL?=
 =?us-ascii?Q?GtfhUiRRVOpBmJ46UMg2iHDR6dNaQyHFyVIovy8ONrVBgTEUaeTOwWxJayHA?=
 =?us-ascii?Q?S3vrdo6nLTKQ0kDu2caEYDRaE7+J+LIq46+qu3k4i7WtK+UGreRqpe9lKbOO?=
 =?us-ascii?Q?PzLLqljzSfpCIi/1c0OUERZPpCw4ZsGQZc7jx8IhW3ft7YMhsuI1iWLb/rTf?=
 =?us-ascii?Q?fZwcdVbiAAd8IcCzOcKSAuniz147CkN8d8KwjPvb?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc3f214-0424-4633-e856-08dc28ce823f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 17:50:59.4551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85btWKfe4CbFhnA78nl7pjA6PnWxX1l2AcGQcgHEVXXdsVypQS9vs794jHt0lFdC7MvaOCIRHgTJLjaZeca/bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 17:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195165

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/reci=
pes-devtools/opkg/opkg-arch-config_1.0.bb
index dfd66a1168..726a259a8c 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Architecture-dependent configuration for opkg"
-HOMEPAGE =3D "http://code.google.com/p/opkg/"
+HOMEPAGE =3D "https://git.yoctoproject.org/opkg/"
 LICENSE =3D "MIT"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
--=20
2.43.0


