Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.46])
 by mx.groups.io with SMTP id smtpd.web11.8420.1615814038920918082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=tR1BjTDX;
 spf=pass (domain: topicproducts.com, ip: 40.107.0.46, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtWbkTtxpzigwCgJhskpK8BKcxjBEuPqBmFf9ew5mKI=;
 b=tR1BjTDXaMeJKkSAyRNhDO7vz4Y2cWfMQTe3nnc4kogcdqMMZmvX69PnMRlM+JBHA5KmHgkLkAf+9ASm/1Vv0NZlpZccyfZ1JgeeleYvAGG+TUTv/ZjBhVqAaPDTpofJ+N5NdKL8WiM6mfMKa54OHylxXplUBdLWzrW3+UXZ6Ho=
Received: from DU2PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:10:234::31)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:13:53 +0000
Received: from DB5EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::53) by DU2PR04CA0056.outlook.office365.com
 (2603:10a6:10:234::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 13:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT005.mail.protection.outlook.com (10.152.4.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 13:13:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (104.47.6.52) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 15 Mar 2021 13:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+KXcXH1qZ4F00MSvtR+y4HEHgDDWIK85/PKHhUJrsOcwBDP3sN0nSL48QGnwS808IMRpDA+EPzoMcQEyK8g1iGmrSL/Bfdg+9NyDMilSC8gPIzjUzCbDMQXX9nCvk1lgIWSHEofUse2GfQCfbX9FQ03FY99qaUBzU1ti61pGSDZNTLkzAqr9k1cyqyANTnTO322LnevhGXd503bO3y296NT1NJ6Jwfv7Eq4o5Zw760sIc3qOfqKt3cnP5z/Gue/bsdeElQeKrUqcSBtK2n7tiz9wqF8telmCSJ1pHvE6A70f1nhnQbIKzXCnV0Cd8stBFKeHoNgaBkoKe3aR3lm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za0EtWioI4mC+2lPZjKZLnMGIGyFXsd5LBWZ/Zrdu0M=;
 b=TO4xrWYfeTMlW4faVVmiTMozzGQUf9lHC69eCKAykj5XoKc5pN9frGAU2j+GDtHDd/23fKLSZ0IH+3jUWbMEdVjzoOyrBzb1mraT3SLPLbjqqeCP+AMhInURifxlIqJj8cWPD40/yh+NTBaxJpiAr/9qu7MJCgSP+c4v4K74qJIun+fHdvRypzBVkMkH3tYzQoZ1GvLHVz7/zVPsJ5tRn52i84OLL9l1qDVBpF8YxHmxmm9TRp/dv/RMEnq6ZVU4q01VcgE3D0rKWsKDZ6EyfVMZM/YadO+CkckY6WI5BQi7MnceWB3e86oA4CSxlGa0WGs7QwU4AdI7ig86DFswrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 13:13:48 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:13:47 +0000
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Subject: Build the "boot" partition image (just like the rootfs)
Organization: Topic
Message-ID: <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
Date: Mon, 15 Mar 2021 14:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:13:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550589b1-e740-4151-18f9-08d8e7b42e5d
X-MS-TrafficTypeDiagnostic: DB8PR04MB7036:|VE1PR04MB7216:
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB7216ACDBD4C3DDDE560487AE966C9@VE1PR04MB7216.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 huRu58ysjUWx7Y3CoSdDS8TyQ6Ig91G+cUpNZSkSipZKnaUYCKGxaY9IJPpmtGtoI93lx7apre/CLIwVhWK9kw7JK7jNQS+vH1J9RIjkpb1aJLj0/OJVySurHIFSz1KejZ11MX73SXqfoy4c2mjwQG8zoXnX0kION5OLSTny9JsECE89kjENZ/eNWX4gnEx2bhXp57PB5Yc2j4uUd1FOirJ+TIgCjq1UJLRc/qxoyO0v9HVX/6p8VgDnLu130HNePwFCvpUe6BwcRD0CI04FJT8v/+52kd2Nb78xA9nWghHMLJ/qnpzQM3Dv0aN5/dx29PpXg6vozkSNElsf1cNO2Y5nuUryBEpBpZiacDBtKf8ASnWh78+xce2o7cOtre1LFmN/vtVdGq8svaPJgkGajF1KzYI6q5jhg94HHRepGT/WmcYsJSErzI5Esjm9qA01A+9I1RWTvgQ1/Ne7cWOpf6QdBU62z7j4fSaPL9O3aPHmtJbtgqgSG9Kuev00vJvkfO2fT5XP7BmCLTwEBcHrGJq+vPko4k3Ngs+iMPBO9mq7JOzn7/2G35ape4gK1QNPYz6XmNiKhbJyg+g2H4FVmBT6jD014irwup3WXKhtAR5QATYl90i4wGI5cyg/rktp8Ahfc5ceMK9T82Oh0I8Tww==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(376002)(396003)(366004)(136003)(31696002)(66556008)(36756003)(186003)(8676002)(16576012)(66476007)(66946007)(36916002)(31686004)(2906002)(83380400001)(6916009)(44832011)(478600001)(42882007)(83170400001)(316002)(5660300002)(956004)(6486002)(52116002)(26005)(16526019)(2616005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUNEcUpsMmNpbGVDQmpsQmh4dkRSV0Erb1pEWS9IMVNjOHhyZDZPa0tTSEha?=
 =?utf-8?B?Q0hYLy9CQVZ4KzF3LzdRL0JURVVTdEczY3h2WnJJUi9DVG9Pb3Jhcmovdk5Z?=
 =?utf-8?B?ZWhBNHpBamNWUmF6cW45MzZEaXVWZnJEdGsvMDFmaHJReGhLOGJxb0xjbCtt?=
 =?utf-8?B?Q0xLb2U0Z1BrdFRMRUJPTkQzMkxES2h5ZE4wNC9SakhEUDM1YU5OZ1BxNzNV?=
 =?utf-8?B?OGZFTlo1bURhNU5oYlc2RmVaWTM3RHBaR2tOckZwTFk2dW9hSE9iZWNFU1o1?=
 =?utf-8?B?a0J5YVpRSzlFaCtIZUNKNE54YUxWNlg1ZjJlOEdSc1Q2TVg0SG9NUllwd2Jy?=
 =?utf-8?B?c3dqSjBkMlVoUmY3TVJhMkF1T3RVMkVGTGU1RXhvOWlUSkIvSmMzczJnOGhr?=
 =?utf-8?B?VlNWR0JVM1R4Ly9FenhsalFQcmVqeFUxbDRMZUxldzZrSWQyOTh1RUg3UzhH?=
 =?utf-8?B?SEtWVXJEb1dGOW9neGtIVzJkNzViWFZqYjBkM1RCKzkxQ0xyRXczcTBmS3BV?=
 =?utf-8?B?bmdNM3o3Szd2MWFjT3lZeVpUWmlSeC9aNU9mU2tmeDlZaEdWSEQ3YjNqc3N5?=
 =?utf-8?B?RVhHYWtBZnlwcnpDckZQL0U2eWlteXFteGY1Y1BtZUZIMnVUL292Nmo3azFJ?=
 =?utf-8?B?UjFGUUZuNzhtS3FZUVFmamhBT0tNa2YvMHo3dktsU2VlUGt6eWkvVEc4TmM4?=
 =?utf-8?B?Q1F4OWxFaWMwY3pJZU91U3VKSVJOZzllMnY5U3BuZFU0WDZJWTJOanpJNTBY?=
 =?utf-8?B?WHdBdkQyeHR2c0dLZzhFSHBFZy9PN3AvZ1ZpODBpNmZXWHRFd2dXOStWdUNK?=
 =?utf-8?B?cWlFVXFCSDdadGtleGl0YVFUejdKRFRGa1VRWnZNYk52U1JXK0F2eGIrZ3V3?=
 =?utf-8?B?Y1Aza0NmY2FYbitlT3VtZ2t6V0pkd01iTVVTRjJydUhhREVJT1h0WkRkSDkx?=
 =?utf-8?B?ZWhxSjVWdUp3Q2dSWXZHd0Y3eTM1NHp4RERyYzVaTlRZZ0d0SzVYK0ZOQnFD?=
 =?utf-8?B?UFROL3phU0xnaXk5NVduUkMydGM2Zi9sV3pXUEJDUS9rak9LV01EOHU2clls?=
 =?utf-8?B?TTdCOGIzKzdvUEh0MlFqdVBLdit2amNmVDVaN016K2M1bHdScTNUd3BuYVAv?=
 =?utf-8?B?ZU12ZVlHaFhtcG5Va1lQdUV4bmNKMG9QVzBmYlN1NS9BM25sZDF6SzdnU2Zx?=
 =?utf-8?B?bytvYmNnYWdoT2dtakwyVk1LUWtYeTFKMERPbEJHZmdWQ3ZlQnBPR1lzWjBJ?=
 =?utf-8?B?SE1TcVVhTzlDaFp0WGU5TEdZblRrTjBhOVZMaUtkY1RIZFRIVExMcWd4Wllr?=
 =?utf-8?B?dFJuTkJKVGdRa3VVZ3drMTZlQ3VKMm5DbkdMQUlCa1JIRTR5Y0luc3ZWYTl1?=
 =?utf-8?B?elZ1UkErYWxYbWc4SXhQWWhHMDEzbDdYTkR6L0xtREc3SDNKTFRwRXkxZ1hF?=
 =?utf-8?B?VXdWLzV5QWZVN2ZPZXRCYnBwcURDSDg4M0pvRVZpTHBuNkpTdE85dUxYOTBY?=
 =?utf-8?B?dTBXOVRobXVRUnF4Qkg1NFIyUHJvcGZkOGUwb3g3dUVTdE5lMHgwamVsZlQz?=
 =?utf-8?B?Sk5qZWdmRXpnejl6TzNGM0JIS0xDMUx0TFRmaVJvWE9UNTFTV2dCV3VBbjZ3?=
 =?utf-8?B?MTdEaE9kQ1NIM2Q4a3BJTEdwQjBlalNlOGFac3BaamlGdlZBZTdSczhKR2ty?=
 =?utf-8?B?SUF3bkxDVWd4aVZrZmFScXlQdFFhWmJkeG9qNld1TUFXcXlQWEFiUkFJT1hO?=
 =?utf-8?Q?kXqoEdOFAKAZ/9BIC2qZCx+cj8zOiSVoPGKsQwh?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036
X-CodeTwo-MessageID: af5d849a-7e9d-49e0-b601-57e6a4726d5b.20210315131351@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8fe74b17-765d-490b-bd80-d5971d41488f@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1e9416a1-3cc9-4dc0-8334-9bfb06079d86@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ff6537c7-3121-4b51-c3d9-08d8e7b42b18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qDV84k8ZCRtivAbpe8H07aWOC4FFzQNW976DAEjoG8HMTmz0PxKRPoGt8VCGgt6No27MNkVv/f4eMVOd1vhKycwWspB+7F1pm8h9XyeBweDoTCmMczmBd/wC4PyrCUGibXEXbhCCxuQTwtQDzAhoulE66iHGALsMauxUitAH5CO3Rlt9Ma8e+qLGUWXpOlMwBkLevSg9w+PZzkx624Qw9HXFa/aFzQt0SpE3XecEr6+5C/uY2HOWrFo2et1bpylrhwyrdYk44GtEirLL5/M3cU/tDW6Ex2RTz93rqHpXvnmlsL46gh5po+cluyDSZa6Bj7mBc/TTadEDx9uVQutg7PSagQ1BMa8Us+b611A78u36mN2xfy1vkicN5qweifEzD2bVSwB327QpF2QRkEl4SL2PT7tO0AOE5fhKmWx66ytG/GOT4kHVxBLxvykroNhEvC9mRP/DBxpXsg3bYg8ORAvjpTY4uMzX++5csXYoRyMyNXQIIfaHk7RBOBz3VmvpCZso7p5dO6ah6vdQylKeQqVB8jmabty0Wj34KcE9MTfA/zwUdzHnXeJLz5F0bmNQjE86QNowTmVLdaQpz/2KMUeVKYN6CzcnC0F5plreLCZm+yNDlK2cq5iEqpTeecho7aSZ4kC1ZgA3Msw4SXhkBWRDiQ12ocE7qAY4FDn7CjV0ssBFl5gbBAAm9z6vBvpaXBEAu7mdDzpVh1ez8qRPDTUK44q8YiLztfVls8PWBJwVDmL/y9iWJAkFnfnyzpOthH5068gFHgn9aGhuM6u5Xg==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(396003)(39840400004)(376002)(346002)(46966006)(36840700001)(2906002)(36756003)(31686004)(6486002)(15974865002)(356005)(83380400001)(83170400001)(36860700001)(7636003)(7596003)(47076005)(186003)(82310400003)(42882007)(70206006)(478600001)(5660300002)(316002)(2616005)(16576012)(16526019)(336012)(956004)(36916002)(8936002)(26005)(6916009)(8676002)(70586007)(31696002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:13:53.0468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 550589b1-e740-4151-18f9-08d8e7b42e5d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

For software updates, I want to have what would have gone into the boot=20
partition of the WIC image as a separate file.

If I want to have the contents of the rootfs as an ext4 image, I can=20
just specify IMAGE_TYPES=3D"ext4" in my image recipe.

This image I can feed to SWUdate and write to the rootfs storage.

But I also want to be able to update the boot partition (for example,=20
the raspberrypi has the annoying property that devicetree and kernel=20
reside here).

If I create a WIC image, the boot partition is in there with the proper=20
files (from IMAGE_BOOT_FILES) so I would really like to re-use that=20
code. I could create the wic image and then cut out the part I want, but=20
that doesn't seem particularly nice.

What I want to do at update time is to write the new boot partition to=20
another location on disk, and then adjust the partition table to make=20
the first partition entry point to the new copy. That way, in case of=20
unexpected failure (power loss for example), the device remains bootable.


--=20
Mike Looijmans


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
