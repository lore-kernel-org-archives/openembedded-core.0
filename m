Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.40])
 by mx.groups.io with SMTP id smtpd.web08.8415.1612534142592637448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=M/k6ESqs;
 spf=pass (domain: kpit.com, ip: 40.107.139.40, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpUp7sdRhoQ27fA0vr8saEH5INOsO7BISH6+eF012oRWGR5qha07LPBYYV45qKXfy+x5iqn+vfSykwdm9XT85Ip62wIBKvTo5Wyxi8uTnMLnnVw9QmPR7qpp1SFq6Y5/j4y6N3o4/fflTGPUqCmViA5V2voyxLHrAEOtMy2n7Lt6XcTtxn60rn7B6GULyH9T+h3BdFbpWMsGmqytc8MtBS05/0yivOHeCxAMA9ED4yNijLii/GbM5o06+3/Yk+eXpJ58ASiq2je0Z6uQw700GMsYviQjk+aj4EA2IsIHyRC30ngZPm9ioGLth1zsofXh7eHKJ26Aawjwrz1CG9cj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9czmjKtMvJVxge6sPR/d7BDzy4VSU8lqcPxnkXWSDk=;
 b=UrWaMzfTl7JUoD8VXKMw3F/pmKB8z9iRlUGn2mxOBxFsH9PwjLKxQCTHJIvI6qOrsHhyWBH95W45MJ6lLe3P9E19AZXsXwBbGoyp/dzEOQ3Dngibk4chQxt0LPz47I286sDJdhgZV4vuFwIoPqeaQhUaZ+Ar80fEIu6tBK57VfxqMGQ+LzI6+SIeYjHmvyMxJaAtRY/LbNuevNF8rxRhkgisaq0kP5TTYBT8N5PuC5ZBolfvEWZ7K66mNoUwchSWsdXZDomCjDvkQf/6wKbqa3bwBxFxRY56UmzO9vboEHIx4ldNjUpcfTkm1g2HmDksDX6arWQ+WVH3SSlo8n22qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9czmjKtMvJVxge6sPR/d7BDzy4VSU8lqcPxnkXWSDk=;
 b=M/k6ESqsJ9pvvboxAVtzr8copDZIdet2sipiiQ/3zsby5AEEPhIS8LqmYH76Llj2TudCJn6nGj0RiJs8J3dVJse8A4Dxf0TDX9kfuFwBUhadGug/xYENT5xLKoa4yTvSD6MoR5TvUts5DH1N1GXzfTwtM7oKoyZXu9nYgkDY3xw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB3891.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Fri, 5 Feb
 2021 14:08:58 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 14:08:58 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][dunfell][PATCH v2] libgcrypt: Whitelisted CVEs
Date: Fri,  5 Feb 2021 19:38:34 +0530
Message-Id: <1612534114-30444-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2e10:1952:e87b:d65:9b3f:2ae2]
X-ClientProxiedBy: BM1PR0101CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::20) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2e10:1952:e87b:d65:9b3f:2ae2) by BM1PR0101CA0058.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 14:08:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 88c446a3-8321-413a-3e81-08d8c9df94a6
X-MS-TrafficTypeDiagnostic: BM1PR01MB3891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB38911C46CD41EB5A1813F69D87B29@BM1PR01MB3891.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BWLX3xUE+H5P+J54a7yNE3hvglHZiNAbeYgllSq/zHt16ayheFVMQXW5KFpE12GFLCT8XHQUIbw4JWLcsjXYYDnV9viShMgZCRXeUcA1PmyDILf8oeE57Dpqi+9vpMbHu74iXxVrbfwxAfHJTTYT34iVKjOL7Rm5wCEqdxv37sxwSs2D8OJcIGZLtUuaB8UcLF3hgymmaaf68WEcBAamrROHpXS6MjV190xWVbXxg0Hf6iPJpkNKP9xc/DyJ9FayCElt0JXf2hgP7e3lyeVo4aY0KtWxGDkkBrmT86/H/N1WabWFPUijodWKNLXWkfUDie56rVOIfGijvSJyoM93wf2cGKA+pwVIyJjZT5YBdyXBZ+GTviYe71z052tmovoYezaXU0qKhtTjRthEaaFyhuZkbQrGwkVFR/jKMi2oCgVBiXwnXcXWJNYlKrS9jfgGBLc6TTjVPjjWCkh0LIUlFY2u1W7FK8d5aLUQGb1ev7jIi8qju3mwt/KRqPxAURiruDkKmo3dxFBEo/4k52Er+ZNmMSB1oOa90rlrNbFexfuGEjUeYxYpvuLFAwrO+O39sWavTN3EDFpsRTCiWL+sgv5ASIXy3+GRxshqUIpp7nc7BISmudbgNwzq8WbdfuBweuW1OkwvvYE7BQnrJjEK/vy/FWknLy94NOzwI5OPXpL9ES6rxLeglLXYroBFGZD8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(366004)(136003)(107886003)(8676002)(186003)(16526019)(4326008)(6512007)(6506007)(66476007)(83380400001)(6486002)(66946007)(36756003)(69590400011)(8936002)(86362001)(66574015)(478600001)(2616005)(5660300002)(966005)(66556008)(6666004)(52116002)(2906002)(316002)(83080400002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uko4vrglVnf3BjYinecYpLondeJMRfUmvaWToRzceyHxa+ysl0oPkU/xyYmA?=
 =?us-ascii?Q?LtOutTYttZhvky0soM7xXbUN2Rdv72jlrEqYmY6TimSC7GejfXaerk6v0GWW?=
 =?us-ascii?Q?41mtAzD6ApnFqQ3MbezahoLWC8GFHwhyjP9XQGKxHDWXPLiQduoXeUuqB6ln?=
 =?us-ascii?Q?6hLH9Wh40fqSZufL5AzMPcBjSOpNtw7aN8uAGmESiT2G/53zoSXipjwdSfAP?=
 =?us-ascii?Q?/Fiybyn23gHeE6cwj2GWgUOIstDhhFnX9d2e7qyClV3fm1J40P179yXTlriR?=
 =?us-ascii?Q?Va4Zo4uZ3jN2qZGU7L8WNhARwEJqxM+UKUrMzCLjAssF9oSGmdLYkqpkuNX1?=
 =?us-ascii?Q?4usVfPNFDY/NjvKGFMr7qg6Ftlydaia5f6YzJo3XEKO1Apmr3WkFlNlHgEZ4?=
 =?us-ascii?Q?yxEwIn3+lMiV0pgEwOBBB3TWRHv8GzOiXuTYwS8BGPlDzO4UROLcctVSuAzS?=
 =?us-ascii?Q?4Vb+3sDVkAPLV+kUEdlp6rfy6d91JsXll+XlBH/m5T0+yeglMTT07C6A3efs?=
 =?us-ascii?Q?Hd832kMLhFYgN4ZuJop4AH7WUaLHa93tfZ8LMW4CD/8rTfMkP+yP0OpVBKOI?=
 =?us-ascii?Q?Y3jG9CFb9e+p+fopFXb3WupYirwHjZLerz2FRb1xMWiPdu6+ofkNG/jBzWtE?=
 =?us-ascii?Q?NrumFKG3YRCBTxcnHt6K82TYdWD2XYYGbfq3rtqno8WG6Moiif/fGhv5h3W3?=
 =?us-ascii?Q?ZPHnJVUbuPpX+9aT3LLoBWweA6VIL3EL80ZbFz0AxtVI7POzUUyDcqbiYt44?=
 =?us-ascii?Q?Uk0YNkplsqXhxE/st2kuY1ojYvz0sOG+Oa40cCLp2vjxajT07kQ7NTP2LCYz?=
 =?us-ascii?Q?DWCDsNOUADeuLRm4xGESOS689OkGUgnTrKn0al1DuPD451xnFy8F9+oNuQP2?=
 =?us-ascii?Q?ykj1cFiZcTYqQiHyuZVfMSqCRGmnQkeKFr/+0/N6eJ2LVgsjC6iOxsyMAfkp?=
 =?us-ascii?Q?CQ7evR7EupiWX2YAkSokHpUY0T43EUA9aVEJ/0TPH0/OOURTpoJh6Y+2AmRF?=
 =?us-ascii?Q?/S1X5dmaoUCHA3OUduY3NXG3x56lAbbb+CLxT7iOmHROfYCzhGHKhmekiTT4?=
 =?us-ascii?Q?u7nZecj6dvOhfosV/pIswMvY+SlUepC7K/Kx2HrlsNDwGPx7jZIiqLGPAOCx?=
 =?us-ascii?Q?kYD09nhhmWem2tKHL2Wm/0dDeQpFk+H/ThXA6D2Nc8F05kNANvGmjtblN6PS?=
 =?us-ascii?Q?gtZ70MXmuszKwIyAR04Mml/64fP9uRosrtILYzECl4Pfdzqq5IUYhhWCEXSb?=
 =?us-ascii?Q?PQvyxJ++v0W79qEYDM5RrbG18Yn9uVDpd34a2VYyZGKu9gB/xFabGaHGg8rU?=
 =?us-ascii?Q?wkzubLtAzpJNYX7ku/bjxZQH6PuSECJ0vhtTXA2nKvwHRxLjhV8VYc+zpI8J?=
 =?us-ascii?Q?sJrI6sn3jGZwzsA+LcVX6XA9/vTC?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c446a3-8321-413a-3e81-08d8c9df94a6
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:08:58.6375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT5QQ+5/UT7Fj/d2pkgLdwDkWvBNmITIPKavk0KOzzgks4bLytbdrtehayyTSmC0zvWupMd9XDLhuACkAf4qEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3891
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Whitelisted below CVEs:

1. CVE-2018-12433
Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
Link: https://nvd.nist.gov/vuln/detail/CVE-2018-12433
CVE-2018-12433 is marked disputed and ignored by NVD as it does
not impact crypt libraries for any distros and hence, can be safely
marked whitelisted.

2. CVE-2018-12438
Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
Link: https://ubuntu.com/security/CVE-2018-12438
CVE-2018-12438 was reported for affecting openjdk crypt libraries
but there are no details available on which openjdk versions are
affected and does not directly affect libgcrypt or any specific
yocto distributions, hence, can be whitelisted.

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recip=
es-support/libgcrypt/libgcrypt_1.8.5.bb
index 4e0eb0a..ba3666f 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -29,6 +29,9 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.ta=
r.bz2 \
 SRC_URI[md5sum] =3D "348cc4601ca34307fc6cd6c945467743"
 SRC_URI[sha256sum] =3D "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339=
cdada0eb577ac3"

+# Below whitelisted CVEs are disputed and not affecting Ubuntu and Debian =
environments.
+CVE_CHECK_WHITELIST +=3D "CVE-2018-12433 CVE-2018-12438"
+
 BINCONFIG =3D "${bindir}/libgcrypt-config"

 inherit autotools texinfo binconfig-disabled pkgconfig
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
