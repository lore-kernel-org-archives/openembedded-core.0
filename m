Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.1395.1623273092122014041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 14:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=4h7mtdmg;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=1794ea71e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 159L95Zq022185
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jun 2021 16:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=BrBtE3TscBY3nPq0QySD82hcDaiV4VwR5SjJ5MKlPIM=;
 b=4h7mtdmgiaR4hQmPS9QPzqvzQ2M9L3zib8S22NGzdrxco8ah5RYn9uLiYv5+UrS/81XT
 qIECKSBLch9NY6mNqPldT2bCOKJM2mUx0eC+KtNx02amRS0nwvMUvVm6yaECQ0teUbcI
 ujMrqrs6dlWIIJgHk21szt9vpVoQURTH8SwnDJG/9cJyk1ioQzhsDMFH21ajLoa/l31g
 cwpJSPLSi4d6M/MO+rZFXL1+DXSfnZjxf9k1Z+bBVZMVKaLoVS6f049hjklFATlH8Wkg
 Pt39dujalm7djPwFwhajnyy2HSu/P4iIEJCx8V0Bs11J6fVbOubJWYcxLULfRkBgPB0X 7g== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0b-00010702.pphosted.com with ESMTP id 392r1sshj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 16:11:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjIfCzA4efQcKpMdkctyiZKD3ddzaS2ZQOC/2JZTxdU6/7r0LkFKtT/nr6/nUi8SBhGHahFMaeQ8ot0teuftiy93IQCRNTpf0EvQytqoJerMOqblAat5IQUTDzkKkcexPbFhz1pAxNe3n5m1vksuAIsfHGNawOOPislUmiFbc8jF5ka/AH3j3S/yNrrah1gynK/qGIeyQpzKy4/dwrfu7BPkytw3czO+QQ7lbpzBncObpdOrP+kxep4p33+VG5+SwplT9e5smwIkPKhBNtxjw+kMxdnSkkwPpJ3OQRlASruRxegUuoelBnvfKnfilSpKbAoF5X3CDebT6E1RSCkVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrBtE3TscBY3nPq0QySD82hcDaiV4VwR5SjJ5MKlPIM=;
 b=LCZt6dCh55Mj+Gd4kVBP6dFIcy/+nf0lJMyVezmYeG1Da3mVZe1AzkR+5zvwLCeM/C7KthTuVqmuy+Thu+ZbLfVl4JwJkpcqiNTOO3dyOl6uAs/KGSEMjlcUt8SuqNi4JGgI9h5Arv4w8sVt5qgcxMibq6ijfl4wNBfRHy8kEfx/OpS8pcBzDk7SWg4LPuLQlQmEroKvTNkGZge4NuhQwaZh8Cc0myQ7tZJOJfJoX4ED3AviQnFyKKb0CxrT+VAhPOQcROerzW9q6xhxMtIaYYkKXQgR4tggTpvVKWT7PbrMNuzexKhpXMCXFi1VtJvzCZK/AmAA2jefCdst/PoJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrBtE3TscBY3nPq0QySD82hcDaiV4VwR5SjJ5MKlPIM=;
 b=PpEadxZI1rGa74KveRSRbJ0YnH7wsr9SoCM35rCFBrA+GiT6Z4tuK6ckbGmBaAzy4EL12xWVIvl3jkYtO+jn90RR269KlBD2dq7JPhf7ztR6YNrwAousZ40iqKK/CqyN8usbRTAYL96XOactCjC/Cd38TwdS7NbJHkQVKrkyqBA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SA2PR04MB7674.namprd04.prod.outlook.com (2603:10b6:806:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 21:11:29 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185%7]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 21:11:29 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH 1/3] opkg-utils: upgrade to version 0.4.5
Date: Wed,  9 Jun 2021 16:10:42 -0500
Message-Id: <20210609211044.853609-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.32.0
X-Originating-IP: [37.19.213.129]
X-ClientProxiedBy: CH2PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:610:4f::13) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (37.19.213.129) by CH2PR18CA0003.namprd18.prod.outlook.com (2603:10b6:610:4f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 21:11:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc741d3-1d30-42cf-e271-08d92b8b2649
X-MS-TrafficTypeDiagnostic: SA2PR04MB7674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR04MB7674A1F6185ECAA44E6FE463FE369@SA2PR04MB7674.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7A9UEMp2JOQGFjFXPIOp8WMWckp+A0JDb7gOkt+/SbqgmBXNsZBwazd7vusCCVNcLlAbJVpatHQUWHV5H90MMHfIf69lbTmt6P2KTAXXvvY1MUqf2MB73uzCv1EhT+O6zdcRhzq6qI+GT7tzZtaen69jsZQCS8TL6P/qwgF9d1WnbvHgau4VND6ikg7UMNUzdOzmRmL1hP/OVubRg9QWqX2C+KX0IQbYHViU9S3jzsJpHvG0TeI2YgIF2UzOHtKEbn58uxiefyymlG2sQari0wTzdlnMXAkI6K2eUCCZWgGo6dhfchsjt4zqb8PwRnlh2S+MajKDKWq/HrTaU3GwhZh3LycVuqnw/Pr4LoNOWa5qTmcWfILT8JfyIq+vSL1IoHjkUgeNRjDz1w0tR0SsRoH3GghiQUPIWbcu9CsuQkIyk/2gvxyaeQZbUE1b4RociKpK3Jtqvb834oseGoZvEWKFQCV+ynR7BjWZr4tocNpf8ymaU5+K1yVmfA4Fzom/bFOc9YJ2MBgT6RlXfu7eT9mD0kUfMGqip7ea7kCWSGoZBa5g8a1w0PmTchd6qY9oqs+ZVGtwEmLmkdTz29PeEXXGpVRPHnVt5ssKi41OwVwxPWcj5YbSt8nuv1KVDzW2oxbJUEtgb2JCtZ+BzzfNujVaCNSZ2ESuIBXTnbcnDOdUV8Ei/Qb8Fq+R/3goqYn/phzlBfPEUpiI7nc0KPowf8szz3mgOBlQrpxzWzd0AVpWlwPHeod6TSM1OnIB7WQFXGxmG2+beFSOxeJcby4xEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(396003)(346002)(366004)(136003)(26005)(66946007)(4326008)(186003)(16526019)(956004)(36756003)(66556008)(6506007)(66476007)(2616005)(5660300002)(6666004)(1076003)(44832011)(52116002)(316002)(38350700002)(38100700002)(8936002)(478600001)(86362001)(6512007)(8676002)(83380400001)(2906002)(6916009)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PeO42wV4OXpTF/OZR6TwqB/2DG4fZgZy51f6BsMXjuXzOV2vZ4g3lmLUOpXc?=
 =?us-ascii?Q?PSjnVkrGGRddsHzrFqMB+YE0HOA3F2uDvtt93fJcXib8dxROTYDV2/gtBSZf?=
 =?us-ascii?Q?cfys1o1wk/7/UPq4O9RSgalWxlBWVhYLnaVTk5UOw9/vKz+XF4lzq+3a2jFo?=
 =?us-ascii?Q?5BMHtUQzxdBXKtHUtiV+SlyhZW5fi+0ZEtJrmAkzEAvUzXu0Ibcjken0CeZ5?=
 =?us-ascii?Q?UEnbmfyEYYATu8OAbaWA9t9SpNR08stJ2MN1WIrL+RlXw/MN0AqV6mAJxqkV?=
 =?us-ascii?Q?9q7Nvb6OfnGFlSyO0xoOPncdLRffNbMhZPXJGDYz9X+wpVd6GHwYTkiZ642U?=
 =?us-ascii?Q?1ul0uIGUp4HUou4dllSfmSpaxkytKHzUmzIgwG3jOFKYf3jiFgcBhm3CYF6K?=
 =?us-ascii?Q?xK+W30IiLstXB20u3v33XZFvvgsAU/uU+Gb7JSEn7kAAetITm37xxWKSpIwY?=
 =?us-ascii?Q?mY046oAIkEgh/W+bF0X5G6MPZuHdKPUHp7tbOYxlxEAf8sCAvg1zKYFmdcQ5?=
 =?us-ascii?Q?/NENGgyCjkpoOckkK8SVTHYvqyfrQA0WbVADfiEwVXFjd6tu3cYP6CngWTrA?=
 =?us-ascii?Q?P+mU0Go5zc2fgWE/aXz50KaPKeK/+bCeYsUPoM3kwqwHaydb1JZdhfzksFUl?=
 =?us-ascii?Q?yfLJvsWXDrqdrU7xSXmAr6rfOZPbEAHTcNQl4k4k6KBq7hRef1V2+LDlInhU?=
 =?us-ascii?Q?ux1UO/PQZiyCbQD6giSic1YWmBfP8Bswd6ziZh/1hNpx3GWkYmrjGGN0SzoR?=
 =?us-ascii?Q?UVglV+i965jnUUXrxo0Ul9laZXfHf8Mco88KQzX8mp3FmDdTPGVkH/6APRzr?=
 =?us-ascii?Q?LfkLqd1WJ1+W4AV63QOSQ3/HP+blY2BNvrLFkeMpGcnwruiUwpXTMXO0ecUZ?=
 =?us-ascii?Q?3njB+NJNi7CzvBiLGck/Svo4rpVaRGHYV8I85rRSmLfo7b4Hg9pwLeuDbkXy?=
 =?us-ascii?Q?wHyicW8BvMNBGHUIDAevNdh02kJqHiDQaSBNeZaX4txa3ecdS6Usg5y1QC/B?=
 =?us-ascii?Q?BNBummno56tToWR4iP5Kgc+XfPG4fUksE//Ss7Zoq+CwdkXyp+ZxIySZW371?=
 =?us-ascii?Q?qF6djdRHjG+abJ5rKwn54t5reBYKgTCdTOgiL1KxuCpZDQt0Cf7BKv32nxDw?=
 =?us-ascii?Q?Jnh1BFySUU156x63z6EdpWI9b3OpcgPHHpS3JmN6/N8gSo5iOQyYjl9qTf6y?=
 =?us-ascii?Q?+AToenAsxXiExfFY1NokGowAScAaZeLGY9PY46Fgj9vn4t/a0N5Y0bLJWeur?=
 =?us-ascii?Q?c8fDVkvwafGQjxUuffbuaXQCgqls1Nys1HHgYe7yZbpogzepJGsYihTlnM+d?=
 =?us-ascii?Q?KQ4jS/47+Ns0R0vIGlk9Xn9A?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc741d3-1d30-42cf-e271-08d92b8b2649
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 21:11:29.4669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tLRFC5Vnq6TUmbrbWEi5wTymcdh+kFG6Kryknn9rXAj/bfPeXlZqTNaknAxzcbsypqxZSVOHRpmcmpH8lBchg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7674
X-Proofpoint-ORIG-GUID: M6buFr99GdUE6yaymBHXrx4x6h3CNVFU
X-Proofpoint-GUID: M6buFr99GdUE6yaymBHXrx4x6h3CNVFU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-09_07:2021-06-04,2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 suspectscore=0 adultscore=1 clxscore=1011 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106090111
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../opkg-utils/{opkg-utils_0.4.3.bb => opkg-utils_0.4.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.3.bb => opkg-utils_0.4.5.bb} (94%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb
similarity index 94%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb
index ce299d6b6358a037973cceabe2f343a0daec24f8..93d291110444211990c4c204fc23a84ec86b417e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-SRC_URI[md5sum] = "7bbadb3c381f3ea935b21d3bb8cc4671"
-SRC_URI[sha256sum] = "046517600fb0aed6c4645edefe02281f4fa2f1c02f71596152d93172452c0b01"
+SRC_URI[md5sum] = "025b19744e5c7fc1c8380e17df1fcc64"
+SRC_URI[sha256sum] = "528635e674addea5c2b3a3268404ad04a952c4f410d17c3d754f5dd5529770c9"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.32.0

