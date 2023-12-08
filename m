Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE50C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 16:56:55 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.130])
 by mx.groups.io with SMTP id smtpd.web10.41039.1702054609841176575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 08:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=UmLQrzGW;
 spf=pass (domain: ni.com, ip: 40.107.223.130, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI68W0Bd1jpuKcK37KsnE+F48HDnfJ9tr7jlzMuuKAl26LEjsoI2g7nMF0S5Wcu8cXTe0e61YuBehOyfgzvUSV6paAZWcFQwf75tXx8FComExvLyDOUrPOkYdWjO5RPlNT7wYXmxs1zdfdCn1eVi33H8lFEoMRSmCvny6O3MPtSRrjtofXz+Ov816C59Hpw70uiJs5jzZxm+SbJx3oSOM3PrufTDm8CZbGdcOlABSvMpKkg8FFtIrACvP3+6ktp6JBLsdVbWclINWoXxv6aCBnrowpwHMd29X2qp+jtunse9K+aNc4QrY0in1ELkHG8EbaAoLN1pkXa+LE7XMuXw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AyzBA8DkGWDIW0FuQdWnPxkFuPWH+Rl66QXaALsRBE=;
 b=Y7XNgXyTltw3AKguLZV3zFUuvxJcL9uEQVTBfAkBnffCYSzE/8AwLcqA20Y4JwooIeGdlx6aao0F6zguWn52HAs6hbaX5FVnm5lrI/c5tIGtTX6WN+uHVPzZRz1gsc3RlE3vS5oyh/TtccFfXQ9/pi1oGg7XGq9Rh4bugDInQHIwkYeHvg91fkSfIH98H246Vc6s/uJNCYVaz649jpQfrSXjqPldfmcgSDz1dB3MAVg/zV6CTFIdYr1UpJU8u7Ky74GnB/87jt5TzPuh3Ej8BAFiREbyIy2wqifhumdr45qPDyhqa2Ib2ki3QJBe4Nx75rDP5bixXOfm/u/NK7aYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AyzBA8DkGWDIW0FuQdWnPxkFuPWH+Rl66QXaALsRBE=;
 b=UmLQrzGWrcXhpe9KBVTkUjundaXAum8gkdoYwYfJbhX0dX5gN8N7ysXtd2trsdsZwNetk+0EgpWFJXssgfRCEwgB8um9ifikQRBDczOmsyVk4fRZ6vqdelPYVV8J6gyDoh9dYd0/svBhS2M7sx45BcZORy8KwBSWtrkjunnE7UQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BY5PR04MB6279.namprd04.prod.outlook.com (2603:10b6:a03:1f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 16:56:45 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a92f:7f56:2b46:402]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a92f:7f56:2b46:402%6]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 16:56:45 +0000
Message-ID: <117ae053-969d-47ac-b0dd-f75d4c4198ac@ni.com>
Date: Fri, 8 Dec 2023 11:56:39 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: alexandre.belloni@bootlin.com
Reply-To: 20230818174754.988128-1-charlie.johnston@ni.com
From: Alex Stewart <alex.stewart@ni.com>
Subject: [PATCH v3 0/8] Add new packagefeed recipe class - RETRACTED
Organization: National Instruments Corp.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:806:24::14) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BY5PR04MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: d9427fa9-9802-4277-30a3-08dbf80ea903
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BNb6QTmesJc08zKWdkA5N1ld8vk+Yvg76NceeTSzZxSsZ4sr6OOb9pNLIO3/bM3M3wmbYbTqVY5ASz/yOcZCSFIB03EzVQOtNU+t1HQ8i54jx70Wa9M4yZyrHeriaMmSJCMPnGmgkk/I9ZxCmI4dXOgJV3bL41Y1dEStwvxWsUtL95vbDgxT+hxAPHbgQXpZ6ZrKmud49K+NyfmDX9CVNn/3LheCXAKq8AWp4hV+6TQ73J84in4Oty5E2SxoCxEjstNi+irYNwbUG1zoWs+cPR//DW83qXBUiS2SHFgheI4iilz63aZ7UtYmQeYj6qFHlv8YCKzQkiAaFoXdQOuZgnf3F33zHsHAeIFYcipYrZr0gCiVO9ttj5brW62d+Bf8aUuasX6Mn1a4mZo2rx09VwYYY/wpFIMxvYvXver23G9GnZ7kZBvO9APMmuKb0LaDBAbxM6mzN9Re+aczaqR62w+X0zcQTqDNXpe+UbCtO8fasSoaFS4gyrMXKFgWLBd6QdYngP/KkxABMSKSxolDCujMN1n+AQKFmiRvrs6kBDSw4BHqcApzKLBgcfBnWF1CSK8R6s5Dj7cFB5SCXXjNaFaPgncIiVwtIUm0LLYFvth+12G086B3THmmlVKBObHh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(366004)(376002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(36756003)(41300700001)(2906002)(4744005)(966005)(6512007)(6506007)(31696002)(31686004)(44832011)(6486002)(478600001)(55236004)(6916009)(66946007)(66556008)(66476007)(316002)(86362001)(2616005)(4326008)(8676002)(8936002)(26005)(36916002)(38100700002)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bC9xc3dZUU12T3pLWWRvQTYvcnlmcStwREhucFIwMTN6NHlHakJhVHJnUkZB?=
 =?utf-8?B?US9hMzZOY2tpTTQ4UjdjQ2orbFU1RjJFVE8wR0VMVCtjZXFvNUpSVWVncnZU?=
 =?utf-8?B?bkh4VmpmV2MrRG1TZzZmUmU1ZGtBSGJVUnhmM2pPb2ZWbjRqZEhMZE5WRFJG?=
 =?utf-8?B?QkIrdUxxRFNHL2pKbTA1OGtQYUhZcE9UWHdmaUcxNXhHbjZsQ3FqMGViT0lC?=
 =?utf-8?B?Ni9OMU5YY3RzSU84K2krUDhVNlZEVVI2dU9xdkVXSmdleHJlVzZBenI2dDZJ?=
 =?utf-8?B?VnNRbHZJS096eXpDa2pzMUJQbFNnMW1Kak5JZ05Ia2FZR1JXcGcxOEVuSjNH?=
 =?utf-8?B?b2cvV2hiQUNROHgyQUlHZWNCVExHK0tFVXM4cTFoaFdZOWJTME9KZVVTWndt?=
 =?utf-8?B?ZWF5M1ZrUVZyOFF3T29hTmo3bzg3YjJoL1UrODRCckF0Y1NkVE5kOGkvZ3Z5?=
 =?utf-8?B?aVdqRXBkOTZIR21IbTN5cWJFYU1ZTmd6RVg2U3J3MlY1d29CeVpXZ2NHV09M?=
 =?utf-8?B?Tm1tNUNxSmg4WnlndXcydVZOMnhnTVhORS9SQmhyVnliNU1NWk9xekRrcXNQ?=
 =?utf-8?B?b3E1OEsyemVjTFNsMXdIY0dCcmJ4T09UWVFOWjczOC95Wk01b3cyR3ZnSmt4?=
 =?utf-8?B?Q01adG1rVHlCRy80TmVTRkMwMFFhNGJDZmYyTU9uL3pabHNJbkNiUWdEbng4?=
 =?utf-8?B?RlN6QkkvYjl3RUNLY21Ya1NkSDMxU3BHM3FGQjl3MWQ3K1RrVDhkazhxcXFH?=
 =?utf-8?B?TUtETXJ3bDBKSEpKVHArMkhRWTg5RFlkZ3V1Ym12cldhYnA3M1YrdEFuWWlk?=
 =?utf-8?B?NU1QMHpCYTJWamhrSVM0U3ZYZHhBR2duaU00bk5UemFCTVZINDFxS3ZydC9j?=
 =?utf-8?B?WStKVW9Wc3VFZUo4N2VVYWtmVFUyRjE1cUVLYVNZTTF6TjRRZFFMMitLcXdI?=
 =?utf-8?B?cnFFQzBNT3dLdGxkZTFHS1VrOGJsV09OY2NnY1AyV3BZVVRVUmJPU0RTSG9K?=
 =?utf-8?B?STRvNlJabFJkYytBcUg3R2dTdFRxWFdqbFp4eTYzT09FV0J3OGhkcEUvdHF2?=
 =?utf-8?B?NmhYTTZQajJ5d2x3NXhnYmNaZWtEU0FHWEpwczdMZWhwa3UwUGMranIvcEd5?=
 =?utf-8?B?ZDN3eUMzRkpoTkh1KzlNbnpYelR0OGdVK2FiQ0k3REY4YW5PeTJMdmlsZ2NC?=
 =?utf-8?B?Q2VLMjBRMkZEY0gyaDBCekxsdUYxdmNDSmFwL24rT0MwVWMveGdDb0pKTEhP?=
 =?utf-8?B?ZmdGTElsYmpTL1FERnBzQkJ6WjdUL3NsWDhsQ2xlak5DZEJEZXZJZ3ZPOWRu?=
 =?utf-8?B?T1lUTWp1YnY1V3BlYWRuVFNaUFM4SlBadjhuU2dDYjBjcU9WQ2VTQmZ6ZDkr?=
 =?utf-8?B?TzR1NDh2eVEzR3lDMFJxSmtKbVd5NXZyYWdoa1FrMGxwcHFZd2VuamFzdFNY?=
 =?utf-8?B?SE4wTFduVGhaenBRNm5OUzQrQVNUY29NVUxrUFAyZmdmcUF1Z25EN3dwdEIy?=
 =?utf-8?B?YjJUY29OUGlIOUdwR2NJcG1LMVhXVVRDVDB1L1VGMG95Z25IVzd2ZVpzSUVi?=
 =?utf-8?B?K0kvc3d6Y0ZTKzZ5K3pVVm5lOVZvMkpqUWVRZ0o5WStVSC9MQmVxTGVHWlFS?=
 =?utf-8?B?S2lyalZsYW9xZkkvbkdDU2o1aTRHbWk2WHd2WXM3cHBBdWFZbDd2RkRaY0ZB?=
 =?utf-8?B?cjNHcTNCWXBLV296amYxZDFqWm5PT0NoWlVUcUF4US9NSTFrd2FDaEh5d0dK?=
 =?utf-8?B?bDcySnc5V0orbU1Db3FFVUNsYWEvWU53QVNkcHoxUG5QVkh4SURLRVpsazRz?=
 =?utf-8?B?a3hNeG9JUWsyemtNL2l1azNMd0FjUUxwV3hJS1pZbG9NdWlSUFI5YUh6TG5E?=
 =?utf-8?B?NkFCNmVCRlk1cWFacXJ5SkNpeThEc1d6bThraFprNVJ1SkszQit1YkkvaytQ?=
 =?utf-8?B?R0hnMm1TdFhsLzdMRWpLQjB1UmQ0R3pLLy9IWDlzK3owR2I0VWVkcEFNNG1F?=
 =?utf-8?B?U055dGFvSjFaVmpLNjdLeWZyN0hQMC9YOC9NbmR3RHFrbkZFb1pyOFhvcnZp?=
 =?utf-8?B?UU9VWk9NK0dCUFRncEczRVZkTmZXRmk5bTVlZU4rNlB2RHZ1RWcxSU96THJa?=
 =?utf-8?Q?WBNxj9ZBAmv08UBYqE2Gn1Y+Z?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9427fa9-9802-4277-30a3-08dbf80ea903
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 16:56:45.2778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4VjRI+FvvJbQVZa+zM1TQF7ucWZCypAZcadv2isxvXmkhpKiYk98TFOPjBjS2NNGsOBtfy6PDTnPFJb22VJpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 16:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192079

Hopefully, the reply-to has worked here.

This patchset was originally submitted by Charlie Johnston while he 
worked at NI, and was then adopted by me after he left. Now adjustments 
within NI have left me with much less bandwidth and I cannot continue to 
support getting this patchset upstreamed.

https://lists.openembedded.org/g/openembedded-core/message/186383

So unfortunately, I'm retracting this patchset indefinitely.

Thank you to everyone who has helped along the way.

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


