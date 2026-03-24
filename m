Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FDFE9A776
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:44:06 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17824.1774352645757534178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Uli2pFml;
 spf=pass (domain: cherry.de, ip: 40.107.159.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpqas+8a57qow72w1XcNbww20bebzk0WCUhTPAfUsY+7ZF4Az0TY7xMILFWDatR4E8b0dUelVNoyBIA5ZffBgGpm+eAPMXdLH3XR1ziuKW4Kb6ADWySV8Mud2yEWU2RfkrfBaKC3JnsavxpoBpa/hfYByywMju1RoiDtIe23geC/0IrnZPar/uo87AslivGXJXKC6xkpMMo9bB1FQyFPAQZthtunjTjzytLIfdFfqbKbWpya0bKeW9OMrcJ/8BSoxofSwSn0J9Ux6zFrKuVoOLqfLDR9F9vL/TgcI03x9UMWLaNecChGco2nRsmd5mldVPhgO0I+YAx4soTg9uJeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ByP5/NUfEObEpLaNd2E4g4zVrI5MphDJxCZ/4rHiYE=;
 b=decGhIiVZLocRouI6pMz96HSQ3EsLRpP5fFWASczNtO6KS1WHz1mipOSaPDlVNY0Lt4Sx7XoqXYFoW2zOMCvpVntZGjSwhf/xmrdbxMJev+fvigjYSjpgebFm3PaGTeHVkI2pVtcg2Nr/yelScPvHqtaGGGWMaS6hYXMR3cLrzA+sk2tBKSAs/gYBmu8Wn/6aCVElSRy12je6qkY2rx50ZVeRbPobRTk3AYknuGShyNNY0onsDZEnwc41USENl73r99XRhb2yDpJBNWoeu1yA7Wpnd/SQptpBfru/e1ALIik96i8YC07rQ5K4CON6Sxy+ZA9OxNCc/RrwPtEqvEBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ByP5/NUfEObEpLaNd2E4g4zVrI5MphDJxCZ/4rHiYE=;
 b=Uli2pFmlHG2pK5V4bU+xZcQxvKn9spEfxDGrL9B4S3SGhfZH9lV+mTUVGTul6a/7dopRA2IzhjktPgnPnnIsGVrgIEcdpAbWoG39Xs5YdxXIXsqDUObWUGW/WsUDq4k0NHvcsLJtgJ6Bh/dZDspS32LZhgcS2JOcaGGK+waKfNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10948.eurprd04.prod.outlook.com (2603:10a6:150:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:43:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:43:50 +0000
Message-ID: <b4e64feb-8de5-49ea-8e05-a3bc71c5f8ea@cherry.de>
Date: Tue, 24 Mar 2026 12:43:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] mesa: Upgrade to 26.0.3
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20260324111711.2929939-1-zboszor@gmail.com>
 <9775bbc5-cbbc-4d61-961f-868c78123e97@cherry.de>
 <590cb5e1-5ece-45d2-a5d2-60f42c933008@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <590cb5e1-5ece-45d2-a5d2-60f42c933008@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR02CA0070.eurprd02.prod.outlook.com
 (2603:10a6:802:14::41) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10948:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f270db-dd8f-4e90-9cec-08de899a9e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	rtZeFfjwyyPJMT0Dzc38pt8RESZKdnc8QK2crKWWnn+tpJgk9gChgpLo7y+bQn+DfZ9SsjsbYbJ34ixo6OnLpPctL3jVi3o/xjeeoiTPseO9uEP1pHnAix+Aq4Zmk3uz6JXqso26DnvHMD7UVVMSS7xct4/vBc0OMlvXHfe2780JcQE761/vGuqyiuFEs0xSsdmdBVCQ867gmp+K/YzMjivqhzZi/TOYdWMeWGamO2tZN+OFsbzTXEoKa5XH9DD/3r9KfCvQgmVGh9wkHjkEFKbmpGFi3BBiPEDC/A8mquEC8MwaKDeCok4PInn5tc+U3iog0cNeo88sLOQ6kpZ8Gi4D9WaV89VD1aoYyvWP87g2alQmwB+AnWIttoFsPNUqrzG+k4otHFE93ifTAgJh5SXP3hanYlxyu5oXQCLujhzsAiB64a6099DBbnpkbcazXVBCIbuJbVTfLEyo2MspTVlaM6EFXnf5rUMm7buorPtxUwUo5KYVLHdDeK8bN1XU2Twd6f/p0tYBIHROJBoBxKY8VmO1+rkdlostZny1V9OjwYai64bFwENcRJFlZ1dIasH5JO8HdBPyYMhV1GMwJ6cZWrPflVh2bAxC8bAOi6DsNlH9vscw0ZkQlL6W4ZKqNPPVJ7Wa4z9kRPvFk1bYZpFOcvLLQYZeyQNB3RmCWjsfCQ6AAbjYic4id7SoSELa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OwGi1ZgUqrgLfILkBmMoxh74wU7RgOsA04xjnkp+TAKGy1IeTZUIGFi5HF4S?=
 =?us-ascii?Q?DbcbSAry6ndHK+JVYv0nCSzccUYiIq11JFaOw/DghB+PSJHeD6ctJJShXTRL?=
 =?us-ascii?Q?g4nld5i1dXMAEMa3K6t9q2iRNjI/+NNKgUkV1vTKHnO8fxSGlCMZeud3169c?=
 =?us-ascii?Q?rx/wGpHUBDyEeOpEXpcEBcovEKJfSO85Gd5dQUitz0YFRhOH3S5G7eZhXGnU?=
 =?us-ascii?Q?XgSW+RhhIkfYoFr1Kz6T5/K0XamO7xDphVXxW3fFRlXXtf9sAn5czbHk04PA?=
 =?us-ascii?Q?xql20SF7eHDNl6yNx751illLZn0v12ZUO/gmJ5SPaLpKhXnBtkuLa1QtprAc?=
 =?us-ascii?Q?TCIX7gp/4JbqvaJP1x/7iL2Et/tVLjX0gHKf/zxwWAW0FpT9tBGXmyu03cAJ?=
 =?us-ascii?Q?3whLnDe+0TU7jQu5SnqS1wLImGRMaMj9J01NBXjpXxIa3RlrHVjfSTvrzESW?=
 =?us-ascii?Q?pzDhPuk0ANgOT6o02TbRgBVODdYuz+Ss1Sj5B1CY2Gw0m1R5KSDLTE+IzdY+?=
 =?us-ascii?Q?pdRmBoi4S9A5EQDSdSQ31fSVUZ8F0a70d42N6IB8QG6+zGFV0OK7FemKsf3v?=
 =?us-ascii?Q?4V/PLnqPJg5uybjuIL1p7n0RwEWQnPJlm2G6IPbrVCEMHPrFLju0Tp2jgvvA?=
 =?us-ascii?Q?3zGSZ5AYi5n2PF460hmy6vbUFWk9x/jkDQYQ8HakqYg/15IDAU4zMZFS2fQb?=
 =?us-ascii?Q?f7vR3AHGpnExH3anDNIDQ6WToQlmqZLizXc1L0/EMFKVnCJS593VMc4p00Lc?=
 =?us-ascii?Q?ORTMQP1fVepQCV3zLe95owghEBkRRdELJ5rRVq1pkfdxysUiZPFTeiPF4P/K?=
 =?us-ascii?Q?SFPwc2C+OeTODc0WhZKxCgJsN6jQEG22VGewK49UGyktnXL70uZyD6829mnE?=
 =?us-ascii?Q?JczEbkRG3YstQFyeix5h3NtfSo7mMQ/rVSuzh0TumfvqLAWlLjs8X8HY5m4S?=
 =?us-ascii?Q?N7Eeco8HYx65NlwiVog1odN6RMm8yk96nnFsIA7ObAa7SDWQNVIa4+hTUcac?=
 =?us-ascii?Q?7Safyilz1lhLF0LGCkFo5+6L+Zt86R/XkPazmEIMn9nSQjqsxbdryEY5yjMl?=
 =?us-ascii?Q?LkvekRoFavJQlsXUVA66+NYVLuIMZaNx5GnMIjCmPQLwp+8HYmEWQntYhUnP?=
 =?us-ascii?Q?bdoX9cJi1BnH/1r9F/GmORYVsGqRTSmVleFhkJ2Brrd9ZdZW5k0YT7cOM/Lf?=
 =?us-ascii?Q?7D2VxP/LF39OUMz4qW5fCeXi20AQXw6w4TUrEJE1ltUdcO5A/EQE0RClCTkb?=
 =?us-ascii?Q?QuamzN7KMD+rc9HdPwUoMB3LQeO+90gyzzSTLBQlq2qupoZopNcY2zWAbBx+?=
 =?us-ascii?Q?GpCx4qhq9MqeB9ibHciBqK0VQ8cuEodtmm25PcqTTqxhv2x1z0km7lbe7Nyu?=
 =?us-ascii?Q?xA0u0U6qvXKMBNyD6QMcAAe1yH4d5lW8JiYFmgElBLgIDUf5pffWH1A66CpP?=
 =?us-ascii?Q?v+DBvz4C3BZKRrz2YxFYWm8wpYlZlRcjoHnz5eQ9L2FoAE6rSLLnM/BjYS9O?=
 =?us-ascii?Q?YK0ZyO4E5VhN3LFug12MVZ1KEotnbCWfI4SxW7uPWxtJ0EfhAhp8lL9kM2dx?=
 =?us-ascii?Q?1tydNGhJJCJD6QBb/jKZZl4pCk5DERwl3t2IE5CcMLrLyy0mmEX8Ckq89Zgi?=
 =?us-ascii?Q?APAOY+oDL6vlhe28vW2xq7oR0LwElrTka2i1LOX7iyMMWnzXicmvOBJZ5feI?=
 =?us-ascii?Q?yqbKsRmBC5UJyrl2bzPiHM2OXJfRxWiFSaVNhGycbOoeUHrXoiUVtEw1qX4p?=
 =?us-ascii?Q?0RfI0C0Hmg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f270db-dd8f-4e90-9cec-08de899a9e04
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:43:50.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2liNZbn1LNhOPEHzfGeY3ghSjyIdm4eoop9NOu8rGc7EBUlsSWdGqIrJ6rDgDt61R4BZ838G6wtRB2zyYtQ5lkNW7rLZZ7Nllg4pChDk1VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233795

Hi Zoltan,

On 3/24/26 12:36 PM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> 2026. 03. 24. 12:23 keltez=C3=A9ssel, Quentin Schulz =C3=ADrta:
>> Hi Zoltan,
>>
>> On 3/24/26 12:17 PM, Zoltan Boszormenyi via lists.openembedded.org wrote=
:
>>> Release notes:
>>> https://eur02.safelinks.protection.outlook.com/?=20
>>> url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Farchives%2Fmesa-dev%2F2026-=
=20
>>> March%2F226616.html&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7C67cb2=
d941b984ab3af3c08de89998e99%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C63=
9099489705377660%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj=
AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda=
ta=3DzMc08oODNovncYV4E0wWC1j4LpT26%2BOolebp1jrA1XM%3D&reserved=3D0
>>>
>>
>> Please add Reviewed-by and other tags given to earlier versions to the=20
>> new versions if no changes were made compared to the earlier version.
>>
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Do not send a v3 just to add a Reviewed-by.
>=20
> There was no previous human review, only a patchtest mail which said that

https://lore.kernel.org/openembedded-core/297bacc5-8e9b-4b35-87d0-8fc505c5a=
f38@cherry.de/

Considering you sent the new version a few minutes after, it probably=20
was just bad timing and you missed my mail before sending your v2 :)

Cheers,
Quentin

