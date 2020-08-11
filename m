Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web11.13224.1597147585391146261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 05:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=FTb6qzyc;
 spf=pass (domain: topicproducts.com, ip: 40.107.20.55, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQLxzZceR1k5HbsRAgri/ka1MvEwMYB8ISrCbSOr34o=;
 b=FTb6qzycNz5JgmNcsPKHZNmKnCJjEIvAyOJjVI7yaT5A0JNW9TzFr4JhTOsjNEkHY1+oRsLeO4T4zEXDirBvz3fSySvko1YlPuv6Aaii6V2gFEzSRHdMwmHp1Hl+AB9gU9S/oHqOL1xEsUrxpluxXmz4CXKHJ3T95hZMUYa+gFQ=
Received: from DB8PR03CA0024.eurprd03.prod.outlook.com (2603:10a6:10:be::37)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 12:06:23 +0000
Received: from DB5EUR01FT024.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::90) by DB8PR03CA0024.outlook.office365.com
 (2603:10a6:10:be::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20 via Frontend
 Transport; Tue, 11 Aug 2020 12:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT024.mail.protection.outlook.com (10.152.4.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 12:06:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (104.47.5.53) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 11 Aug 2020 12:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc7lEDqgBCDI1/4Uu1BnW61hipNEbptjdMFZ4yJEiRHanWjZWLIDgMDJuCvSlBW27PS1Plo6eyc6C/+w6tagG3UCIo44VtoivyjINL2b9jG9+W7rZprrsTVIpIyZmeSFXxBo6jCe2yKzwt7IfQfVNDIfuRK2FYgFI4ngHlVNJBHZF58v5ZqZMqNNztbik4l9iiqy2Qn3SS0V5V2qTbExmQfiZOhP/6dBntKDOylTYWlLw4yVzJIDo3ie2ETDJA9uvkWmUjG7PcalghOnIVhJIQKaz8XbxZqdjRHkGWpt/1M8+t+OL3Se2mkziVKXd2eRgEaHEzxnvIsREtwX17JYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0qIsWbLNDyQU5K0XgMyl6Bvo8ONGASUdOZS+Nbw1Kw=;
 b=ZN/ED+rZuFVndzXg6kR6ouInlFudkFQZxDdyz0zzgF+PAv1uUjKrrscQT83w/uNqjVgAiFkNk7GBUSYfB1P7s1Jt62UJNfsuabZdcvRy2adgWs5OKfdJ9Set41scFKBjUKKBDuI3NFE24RvR1tXiTfJdVLKDqiT1sgVH93eU463o2UyiL78W7epcbyikdgCVnUxTAaqijbNEJt23XoX94N896lV/qD3YzfYpA56eyRXlmQBzTH3g7UpiVPgE6mxskP2BGz5BFbU1qvp7TDJV4h5kqTsYVlxjf3Yc3HlEk0NY0HoiHML3x+1edlmdkq8w1nj05L4/uZVzu4PE9896eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB3PR0402MB3722.eurprd04.prod.outlook.com (2603:10a6:8:d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 12:06:18 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14%3]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 12:06:18 +0000
Subject: Re: [OE-core] systemd-getty-generator present but undesired
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7dd10c12-9e0b-46a0-8ddb-524a671021a4@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.391a6b1c-c9c3-4223-bc80-85775254cd6c@emailsignatures365.codetwo.com>
 <62bf02bf-7ec6-83fc-3d84-9ae93b07b4ed@topic.nl>
 <ebf0e077-41b4-2285-8ffe-883f9d588fa0@gmail.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <d6e34e20-7b3b-947a-4226-2d5847e7e4e9@topic.nl>
Date: Tue, 11 Aug 2020 14:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ebf0e077-41b4-2285-8ffe-883f9d588fa0@gmail.com>
X-ClientProxiedBy: AM4PR0101CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::15) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM4PR0101CA0047.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 11 Aug 2020 12:06:18 +0000
X-Originating-IP: [83.128.90.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ff727d-1f49-4144-9cb0-08d83deef747
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3722:|AM0PR04MB7059:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB705941EF3CC3BC0F7ACF63CF96450@AM0PR04MB7059.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zkAAwkC3DFPkI5Mieh+7VezcAomy+bqIa5u7rTrj9HsJs90Pos6qLlckAHv5gURbGwLNyqZEGzFWKbNjEjEPiktVJn/RE+ktvo0q45vDvyY+1pd8JXYRiNCFtYgKmlp3rShHJwzeIYSE+sUGfkbaGrDbC+aVnLmJrmcAHS/LCWG5zeIeP3T2gUJpD2bAyDneFenPZRl5pJpWeUbQR5KXGmaoIulWB3iLWO5bHyn9RjTxKbXG4lO7VjPt4yg+fpMxLBWCSgs3JM2Ubn+jxup/2zMVAG6QHte79C6Rac0LMv5Bf+2sk7xX9kz9s/9pMzt7S9Nxy9Q9wSePAQrosIj9gX7kegKf+1XnyxVIiVtQbARL03/aFh1aPmqAgJu2iD+G8rTH8Clw5Yl8hrPmMxJTkXhqQ0eMqHbNu0bEzptpgOCE9TvPHMHt7QhOiXSFDSjiq382AHXclEGpF39IpJiDDA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(366004)(136003)(346002)(39840400004)(396003)(2616005)(6486002)(508600001)(956004)(31686004)(16526019)(5660300002)(966005)(52116002)(83170400001)(186003)(83380400001)(15974865002)(8676002)(36756003)(8936002)(53546011)(2906002)(44832011)(31696002)(26005)(16576012)(316002)(66476007)(36916002)(66946007)(66556008)(42882007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Z/rknaAyOkxxVZBjSOsbocAzDbw4gCnzJ5R9urziuE5w5QTqUPGEGjdARnspmgzXOnToGs9hpK5YTWw68MhT/gXcWIcbcOk1prUh/NbeSUKBIOjrnT+25zHf0dkXOlWV7Utfly4lv+unsBHytXZ2gVuHDfYG5C55DidX9Vns04AvRmnhfGsYRTRQ0ryo8nGcZMYp962rAf7owvLBXijw4C9mZRUKFjpO9fsJeoCOY4keina8Zuj1SNvXUIci0q4Acw7Ui0rJAaoRFxXGsrrYMKNwPohAslg5GvKI8kDMK4t4p+ZTmBO0dH63vjbfkZG8/UTjuJgovhAeccTC+x7v8HoO7/dwqsHcS3nH2Dspbd2xB9pDbb4vpkkkPXtnqnW1BguWT4phlVG/GBjgba3qgXFG44Gu9/AR/iho/DtkbLwUKe/uYyIhCdr8RzhCqTbFcJ3cuBflyY8UfVwHjsQ0bj3QYRv7MysGTlBonMObeAiGdMos5/XkWs58KtUGDQFklC86fsOPA/wl9U05vEZVj3H6bmEQPy88NYRXMNJytkBl3BJo+dBaBWu1q3UAfyK+M1XwekFP+P4OnVQUtnaGS13IVND46+dIIU/oxx7GZc48ZzrbkVYtOP9ve8nD3TraJeBo9FyWKUvYTpS/ay1cgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3722
X-CodeTwo-MessageID: 3c77664a-2847-4303-812a-4e4a6bb6d019.20200811120621@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT024.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eebd1bf6-447a-4654-8477-08d83deef48a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1+HlBwZkzDVsxw2JgMzojOfuCppxW9SKBB7eYAtmoPGcew+LiSsZ3R6FuMuJ/qbZVgkwtdMKZ/O5aYR7gl9uXTq99DE03uhJ8Wzgjhgh6cjdQjDuyOtPxgwuZxV4yhnDHMGcsffBPK3p9y3AoabTGYg/g+cVo1+BDfZjf7mWs93POKHRQb9vJyr/oy1Y2Taq2FjH4WTOiwzsJ8WNpktx7Ej0qbce1yQsiJkDQAIp+E4xEENtY2ZsdhtZwJAV1JhD/m6dkXH2N4opBhGKYabSF3wZumGkYBS/b6eUgfYUNYxPCeAWMuNNa9CYmp2A7I75K7TAsojvpq9kk/OM+zXln1U33S2Wo6WZjRkOvWhVi0gqE+OWiQvsOTTaxoInbHyEO1OUfCFIm+hvFJLzLfXgb/UVB8x6e+fRPmx3TbARHIUuPib6DBkKcPBRxYTMfiBe+Ysvn4i4QaM/C3jErMKHhapUu9aPGNj07s041MLDBEnlWI80Ck7RDNPqAtBP6X+F
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFTY:;SFS:(39830400003)(396003)(376002)(346002)(136003)(46966005)(2906002)(6486002)(15974865002)(83170400001)(356005)(82310400002)(7636003)(8936002)(966005)(31686004)(508600001)(8676002)(7596003)(47076004)(44832011)(336012)(70206006)(5660300002)(36756003)(70586007)(31696002)(42882007)(26005)(16526019)(53546011)(316002)(186003)(83380400001)(36916002)(956004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 12:06:23.2421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ff727d-1f49-4144-9cb0-08d83deef747
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT024.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topicproducts.com

Please consider the environment before printing this e-mail
On 30-07-2020 07:12, Khem Raj wrote:
>
>
> On 7/28/20 6:33 AM, Mike Looijmans wrote:
>> I had a hard time getting a serial attached bluetooth device to work,=
=20
>> untilI discovered that systemd is running a "getty" on that port=20
>> (which happens tobe "ttyS0").
>>
>> The cause is that "systemd-getty-generator" detects that the port=20
>> comes online (runtime, it's inside an FGPA) and then dynamically adds=
=20
>> a service for it and starts a getty on it.
>>
>> So when I went to solve that, I found that OE already attempted to=20
>> solve that. There's a "systemd-getty-generator" PACKAGECONFIG that=20
>> suggests that it should not be installed by default, but it gets=20
>> installed anyway, even though this config is not set.
>>
>> Is this something that needs fixing in OE?
>>
>> Any better pointers at preventing systemd starting a getty on ttyS0?
>>
>
> you need to add serial-getty-generator to systemd PACKAGECONFIG to=20
> ignore the oe provided serial getty recipe.
>
> I think it also has to do with SERIAL_CONSOLES setting for machine,=20
> perhaps it contains ttyS0 in your case.
>
Yes, SERIAL_CONSOLES is the problem.

It interacts with SERIAL_CONSOLE in strange ways, and the only way to=20
solve it was to set them both and never calculate them:

SERIAL_CONSOLE =3D "115200 ttyPS0"
SERIAL_CONSOLES =3D "115200;ttyPS0"


One would be tempted to code something like:

SERIAL_CONSOLES =3D "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"

(In fact this is what bitbake.conf does, only very weakly.)

This does not work, and results in "ttyS0" still ending up in=20
SERIAL_CONSOLES. Probably an interesting mix of calculating one from the=
=20
other.


oe-core/meta/recipes-core/systemd/systemd-serialgetty.bb contains a line:

SERIAL_CONSOLES ?=3D "115200;ttyS0"

This is also broken I think, it overrides the more correct default that=20
bitbake.conf already assigned. Removing this line didn't solve the issue=
=20
either.


>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Products B.V.
>> Materiaalweg 4, 5681 RJ Best
>> The Netherlands
>>
>> T: +31 (0) 499 33 69 69
>> E: mike.looijmans@topicproducts.com
>> W: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Products B.V.
>> Materiaalweg 4, 5681 RJ Best
>> The Netherlands
>>
>> T: +31 (0) 499 33 69 69
>> E: mike.looijmans@topicproducts.com
>> W: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>=20
>>

--=20
Mike Looijmans

