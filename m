Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.64])
 by mx.groups.io with SMTP id smtpd.web08.9078.1612536722198321396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=pkv5LqKB;
 spf=pass (domain: topicproducts.com, ip: 40.107.4.64, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/PXxZ0nwNNGBOO/q8qX4Scn1xYLPyFYqj6d+TV3GJk=;
 b=pkv5LqKB55Edi/Eaf1HtSx/auFi3KvyKItj9+QBkhA12WFCWPaOlgh2sAJuaUd8WKZFXfPrcGYPdtuT6mrw1QrCEU/EUx0mJoyj4BFn+CY6yLh863FPran8cgRHjbvR8gDElGTFXVuwxsUqZxPLtWvvrHvwMU/Ags7Poas6K9L0=
Received: from AM7PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:20b:100::11)
 by AM6PR0402MB3766.eurprd04.prod.outlook.com (2603:10a6:209:1a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21; Fri, 5 Feb
 2021 14:51:59 +0000
Received: from VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::9b) by AM7PR02CA0001.outlook.office365.com
 (2603:10a6:20b:100::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 14:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT062.mail.protection.outlook.com (10.152.3.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 5 Feb 2021 14:51:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.175) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 05 Feb 2021 14:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH6EN2UQY5LFQJyrVaeoIHgryyZyuLOOdyim6ylcCkNHB5ehdigu+xJ+lpX8PDxB8n7lDcDxauBU4Id3exhZO+RvYs3N6ZJlBRWVcFBo5zUtQImVlxUMES2ni+fKLaloySXX1jWjVRpgkL4PrOQRqiqeW/Ne22h9AZnAavKV3tpEEAjXyMWiY1078+8GfPYsQcXhRuw+zd/EFEx0wZrHTJ5S+m7P0vm1uOWS8H9ViKgyXNw31qEPhYfP4kuWA9wjkzIJP67UWpz4lTTZMqBasmVR03X0Va7irI6/mhWbpzBVgzkNtI4d4iMMeHH+nhjpCFfQprsOgUuY+bkvR49D7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgu4CIlUTuOO8jHyHJnqHm54E78dTbfwBQ20+heQXD0=;
 b=XPQHA1bTRj4OBvtEeRb3ezGmj1f2Um9w1nsOKayefHdNIuHRSyUjk3g1imGdhX4TEKHDgEKKgBlCPiBax5rBhVJaWHfEs50e8WcrScOnrk8TDMJ7aPIflIWKmZ08plwnQg7anvWWL0Jh2zxMc16DVLLoUTr2GfchlOY/kMz9NR50aAex1NiVGD6U2u91DG2d7//0sEJ9MxfMaYRwQ9Zp/N69tPQ5ZsIxvqgdFiIPindCyp9wdziZpVThK56/PkPSjIFqTghSAZLD8r4Y/jUpBiYdLDi23tVivZD/7aqPeyVLWYq0RUiUAcJ+gBXaTYMuuZdCPqAMY3yTcKCzwh8UcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2470.eurprd04.prod.outlook.com (2603:10a6:4:35::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 14:51:52 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2%4]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:51:51 +0000
Subject: Re: [OE-core] [gatesgarth][PATCH] license_image.bbclass: Don't attempt to symlink to the same file
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210205142427.18942-1-mike.looijmans@topic.nl>
 <89f603997b197c3fe883fbb8e74c710111dd569b.camel@intel.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.2911e63c-9e5c-4e4f-ace5-3d0373a59996@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.0c810297-d118-4896-b755-845b359e15b7@emailsignatures365.codetwo.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <75a74318-609e-916b-2180-8849ae7dcf21@topic.nl>
Date: Fri, 5 Feb 2021 15:51:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <89f603997b197c3fe883fbb8e74c710111dd569b.camel@intel.com>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM8P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::18) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM8P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 14:51:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38c9c758-b49e-434c-aee9-08d8c9e59686
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2470:|AM6PR0402MB3766:
X-Microsoft-Antispam-PRVS: 
	<AM6PR0402MB3766A5737412562599C79D6A96B29@AM6PR0402MB3766.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TJOgpY+LL+NyEsquRhbMiDIHmcSMVxudnJPipg4OK5IKSKws2dCX5Ou2Rp8e8zMoaRZdqKAT930Mbr0nsRDq4VSsxzB/h8wNcuGYm0GW5iq9ORV5eDqQGF/5JEz1WYd6ZNCd1NILQ0goDH56QQjVnoFWqyTNP6d6RyMpG+eZTWxF9l5Fhpd6DpOQDVY37AgfabqGwHxDaxX8pbXFnWfSTIfTOEHvDqEXDg3LrUzduBJBbPqw4AoE1dRO3w0l6KCInYgLKHNA2cz3zxqVIt9Md2c6vxGkZ+A0xJJ/bVlw29yirrufbZCWcpBlSLJhgW7x+nX5rQ1VAtUUgibQ5gUBeGYuynNXWM4Gnpswnz+J95J9vLM326BekXX08WW6VVq5zfkE+9UYHTvWcfgzQjyz3RxFujYUAOutc7xXSIdlh2+3/sJvKSjd6mfFVNm8/Jou7lqLrmVupCYe3zAsmz7oPFFbMXh/bZSNkbgyDbxvh18Rca39lkjRCMpGaRdNvWzeC8xYxcBUTrbFbqcPQ6o6rSYrLnCIbp62m+LRXFGGK2poFJWMV4FPY7jcbfs3RKVw6KYIy8cE/CH3RyCm4a8WIxDMyiaZD0iyi3L8hWHLCWs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(36916002)(83380400001)(66556008)(66476007)(31696002)(4744005)(8936002)(2616005)(26005)(44832011)(36756003)(186003)(52116002)(2906002)(16526019)(31686004)(66946007)(16576012)(956004)(6486002)(110136005)(42882007)(8676002)(508600001)(53546011)(5660300002)(83170400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pHlvlWtEVAIpbAOdpLC+yHU81+cF9F1VFo5CeuEk6bZG3HyGx2pz/aC1toBm?=
 =?us-ascii?Q?eUQwGgUzaFtybj0joKDnm7oHACYwBq/ySjUp1NbhQhgFUwx9lqrlH6aOaCsS?=
 =?us-ascii?Q?6fn6qzQc9SJMADpcmVA2LzrzTS7AhZmiab+WYxgQDhSjpFuWlFCfZIK4s7kX?=
 =?us-ascii?Q?7KaT3PgBNe/JgNJ/YDluoU8nKGjjj8XuVB9ntSpfbQ5IyQIanTKdMaHlrF4w?=
 =?us-ascii?Q?7dtPSW8IKV5OmqfAgxyEcuPywz3H3J/5R/DBtzJh3CeOpiWWXy0VsSfArmlq?=
 =?us-ascii?Q?Dh3X3eSyrTbFT9Qv8kI/39zkFMKZxXXoGJNP+bnWM59+Y9xkEnNpo8wpfGQE?=
 =?us-ascii?Q?+5zs+IFRQ8TW91SPd3AcQ1plnCRG9ziaTG5ha/6Kr/2qj5X887bk7AWjpE3m?=
 =?us-ascii?Q?fQscyZ9Dx7CIJNfgk9LPf7FiXeCwWKwmGBxzNI/bme1zOB/RuQUW/L8dxZpz?=
 =?us-ascii?Q?3LNNw7EPEXVGCLs2nFJYkAp0ywuDxxhQBLCTig3sGcRv8Meui+f2JVLCOtum?=
 =?us-ascii?Q?GYskzqpofpjFoRpm2fb8lJ9L2HBxhHP48wSJUXBVvu5RIlY4cHEDei9nMmk2?=
 =?us-ascii?Q?I1ua5a/fG9SQOmnelQ1z/vvVgLnoZyIw7svYS6bejA58Y5mRpy5Q+d0j50st?=
 =?us-ascii?Q?xosY47cJcusAPs1s3GI11men2kTj2Mo2uMKIkclDQy7UbEjOvn6/YpYugVoq?=
 =?us-ascii?Q?l5ZMZpJ9g6XQcm1mFG1SsQvEJ/NQ8Q4mt5hSabRm93Es1ivo1SS8ZHNK/pOJ?=
 =?us-ascii?Q?ApqvXfe4/sQRmcgpuPs8Ae5L1vCsbDTFH5WWG3d+o5c4mFokj8kbthY9LHcD?=
 =?us-ascii?Q?7EfwjUAmW3HGTJzstr1NyW4CTPl1eRPpxazDiqQhfhvtOW9NxNVrNc775Y+O?=
 =?us-ascii?Q?mnzq0IspHYgI0mpISl2c+niwiCrYPMfN16RdEGqHrrhrwM1yauxDNHsW+YhL?=
 =?us-ascii?Q?v8x6McYp+nL1e3oFeb00pOmsBORPt1FuDoi8xdEebP4u6WRqKe2EQQj9U89b?=
 =?us-ascii?Q?gmyc9KzNY13W9TNYirP6qfPPRj0iOuTKmKwA5DMvDa6kelDqUSOF2Wlciw3I?=
 =?us-ascii?Q?XojHVkuzOp0EV81pwHuW9IrWC5mxrBij3E/YpPxLahVtIGzU+jvJxVKTKMWZ?=
 =?us-ascii?Q?AMvL5al4cXWiXQNQtj7qo1el9MTcbXpHf9KsRg1jhQnBRa+Vaer82ABiVIwo?=
 =?us-ascii?Q?4Q4JWikqUQIkd3qzyPR4wXqtSHUyRzpHbRMwq+HI/SRCdZ283HJozu+eTMY2?=
 =?us-ascii?Q?CSSJuxPYru/x5GZJnYy25n54/khpN7Z4ru/gx4SgVzvkF9MWhXxvTQwhy/fU?=
 =?us-ascii?Q?oO7weblVjn4t57qmqC6b7gzK?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2470
X-CodeTwo-MessageID: 025fa065-5c6b-434d-838c-6f5ed875d61f.20210205145157@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3f383538-ae1b-4cf0-eb7c-08d8c9e5925a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RMV4tiz5PiaeRdk3iG7X+es+Gc7afryG99ZrA4KJposXTh5CKNfwLqoQvvdX3LYWwxMbFTHkjpqid6W/1kR4vOg72DHcb40YDGNtH4ZYX2+zzVUuuxI3MttMmPvuNwFdPvOXcAipcA59JFhK5GWvhoAMs5mp+OpHJA0Zxv/GFT5JQUPdn7nqBCXpv4DLqjEBLZc0Qj8UWiiiGRN+u1Ei/qiqyhLxiLjdcZ0DZUj6/ct82FS7+3aEmX29BMSIw2p+vJY8ta+UXH5d58V+xgJ2vEu1sPjIMVkB/Lj8MS0rR5LJLcNBXAIPot6/zduUHPi2O49yzbqCvH6o0dJAqczKujQ4Q9gkwVYa1gWnp554Zjmky4yTdQTG46kdDczHS8BpXMoYAqcKqSDAd0ttpTmhBYqyqEUiOI4ecZhSaYuutL6EJAH3lztoeyjpROsbOVoCv2ipMEqiRIe8Q3rZkiZYZ0SKLDGCtp6kQ3qqAD5B1YEMLUj01RGZHnD5CwywuB4jMiR0YdclpvFXNlXeYjuely8Hx3xk6pfyy947xgFRVzYXd+9ve2C9hfEFm+665dBjfmRBTvj8Kl3cHsah/WiaOXhlhgGxYoudwP6R7tprtZEbL8rTvCsBtxnPwYP0/u2n4t0TAlpCpqdZE/XXI7s46RrZ0eJ9ucsUIvLtmbz+tQbGMlOW0M2ya8ucuh/tuSzj08tOCjqnHiFNjh3EugCk3qxVw8xIo/R5CzBi7EMfw+1BDKDQhURbqFBlHlUaZEGZwQLhvEI+ga06BEYqA7ImKw==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(36840700001)(46966006)(83380400001)(8936002)(70586007)(70206006)(186003)(53546011)(2906002)(336012)(42882007)(26005)(36756003)(82310400003)(6486002)(15974865002)(47076005)(110136005)(36860700001)(7596003)(7636003)(31696002)(31686004)(36916002)(508600001)(83170400001)(16576012)(956004)(2616005)(5660300002)(356005)(16526019)(4744005)(44832011)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:51:58.2308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c9c758-b49e-434c-aee9-08d8c9e59686
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3766
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


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
On 05-02-2021 15:44, Mittal, Anuj wrote:
> On Fri, 2021-02-05 at 15:24 +0100, Mike Looijmans wrote:
>> Sometimes (that is, in all my builds) the lic_manifest_dir and
>> lic_manifest_symlink_dir end up pointing to the same file, resulting
>> in an error like this:
>>  =C2=A0 Exception: FileExistsError: [Errno 17] File exists: '/.../tmp-
>> glibc/deploy/licenses/my-image-tdkz15' -> '/.../tmp-
>> glibc/deploy/licenses/my-image-tdkz15'
>>
>> First check to see if this is the case before attempting to create
>> the link.
> Is this not required in master branch? I can't see this change there.

Probably yes, too.

And half the commit message got lost somewhere. I'll try a resend...


--=20
Mike Looijmans

