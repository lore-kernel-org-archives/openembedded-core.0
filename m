Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.43])
 by mx.groups.io with SMTP id smtpd.web10.12503.1595943226146416953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=n5TKfknr;
 spf=pass (domain: topicproducts.com, ip: 40.107.6.43, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRTc/eh4GHKePFOnPrtrfLddC/nMrGytmDEpBMjBQV0=;
 b=n5TKfknrCHgDeyTmeL1LsA7bhE67zZdAvDY2Bqqimqfc+qR0cH9HRTntHSvNN+Iy/KAf2cx1nvCKdweJqnuYDtxSXHkkGU6kxmb3fW/QrnJkmIAsk5SdQBXKpIzwRdSUFRJb1VFje2P2CwDXQ59ENgUhJNa3essWv97xJDOXMWA=
Received: from AM6P193CA0072.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::49)
 by AM6PR04MB6710.eurprd04.prod.outlook.com (2603:10a6:20b:d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Tue, 28 Jul
 2020 13:33:42 +0000
Received: from HE1EUR01FT044.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::7c) by AM6P193CA0072.outlook.office365.com
 (2603:10a6:209:8e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Tue, 28 Jul 2020 13:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT044.mail.protection.outlook.com (10.152.0.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 13:33:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.56) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 28 Jul 2020 13:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1vVvm9IvCiOV0zmEo/i4T+eP/mKCjoz1PmbwCHM2FdWfs8FHK6893nQ3HjTwpPzvnx2nd8db5I/z62yMhAt3vLil2EYN6KCrT7Ujo4dVYxwdH+jAFJEQz+0IEophBujvwL3UwxrihJku2Zp6bJyqwBQTyoxZt4vlKjZKbvV8yE6cU7rpDgb6WIIH7gXJ6GiKMKGRuScp+C8oVrjeK9F4GTUiovgNOg7aWb4SzABgiOgO7BMhOw5ZpQywamAxuucwOujpqBWssUOhbhfiWLolb9V9s1a2dkPdn5efdzYH9+ka5XlejI5yJAn7Hq0ezTPrFflYwUEdoagx/vxxanoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFgFSemSeGch9gVUApLb+yYW3Ga+2bn/VLQCfzOsnNc=;
 b=DiSTVJrE0wXpmvrYdjdQ6ZJYV/Q/RcdFgB5CE9b2KDzPYk8CEK7YpdxQ4ZaO7fJ2WletySSwnBtDAhjpFzHFsqa4zrLkFRVAkOzsRdUXE1q547rvPZb8ely1sB/wZO/M/UCsH/SyIEtsjp5VuXUtyBvIbEiHTM8CtAXe9bF2bnOfe9CdD70yTA8TYgHerHRISsaUVY1NC4CB/AONU2E7JIHEGItLTEfKmtqPLSdB9POBrCIu3M0KFZuNV/xyNpBxr5dpj9oBq6IywHmJqU7SN2w9fbxPrzBOwdwTIjSptRpPFQjVM7gALO9/GjITH5z4bfsOUwUOMxFfAfJurPhpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB5097.eurprd04.prod.outlook.com (2603:10a6:10:15::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Tue, 28 Jul
 2020 13:33:39 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14%3]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:33:39 +0000
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Subject: systemd-getty-generator present but undesired
To: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7dd10c12-9e0b-46a0-8ddb-524a671021a4@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.391a6b1c-c9c3-4223-bc80-85775254cd6c@emailsignatures365.codetwo.com>
Organization: TOPIC
Message-ID: <62bf02bf-7ec6-83fc-3d84-9ae93b07b4ed@topic.nl>
Date: Tue, 28 Jul 2020 15:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.391a6b1c-c9c3-4223-bc80-85775254cd6c@emailsignatures365.codetwo.com>
X-ClientProxiedBy: AM0PR03CA0082.eurprd03.prod.outlook.com
 (2603:10a6:208:69::23) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by AM0PR03CA0082.eurprd03.prod.outlook.com (2603:10a6:208:69::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Tue, 28 Jul 2020 13:33:38 +0000
X-Originating-IP: [81.173.50.109]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a759010-07bd-4fab-0bf1-08d832fad832
X-MS-TrafficTypeDiagnostic: DB7PR04MB5097:|AM6PR04MB6710:
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB6710687E86B4B2433023F1EF96730@AM6PR04MB6710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 c0MsaGfMjEsUjM4q3v6bJLMQlyQE4T9a8TCy+UFsQdQFfmUujdjLgiIYgH3IFY8MXWtDCc3iwbpCZH1h+JzO/yrGDqOSqqN/0Bq2eb3xXY7C3ZwzeaUfnxFhhH1gv4Jkk09srd17lAnJqjKeFJbEx8HDDH+cBd7l5XAzfVOhJwgj/aVyvvRb1azRELk5pG6Bc9GaaccvRcrw3UcDWAZXm6GkGA2cqDcYKvq0TPBF91QZGYnU/SGrfWtxXMRdiE/04lx0k04VuaI/TJa897Sv25gmOqkOtHcsTxtbNvsbbt1gHuC35ffJJxNGzupZwwgIGxxlaQO862HmN91LFtaTE0N2nPCeXhC6XSfStTyqwKsye/UUXDq8ycHW/lQ6WV1ZIY+hdtNHc8WDKK3KQQ+GHKscsc/vLs/bWPI5PsN1IR+C3z6NcEaJs1TdkQGPRmrDeaPMC4IUqy0uKtDrW1FleA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(136003)(39840400004)(396003)(66946007)(2906002)(66476007)(66556008)(26005)(508600001)(6916009)(6486002)(16576012)(2616005)(8936002)(956004)(316002)(36756003)(186003)(16526019)(36916002)(5660300002)(8676002)(42882007)(4744005)(15974865002)(83380400001)(31686004)(31696002)(83170400001)(44832011)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yJknd2mEY0GGaWoo9t03vbyRt4qWSRhkk1bpsriIxPK2VKqbl5okN3QJbkhEIMdXhMPgfj3wuVm12SX5BoqE9d/DkARJ18/i1/PF2lvFR/t/6vcRzX0Q/K5RI5DSOwaZ71RBEP0HN8ff9mXRXFdHm41jFIMmeWgHPFXFUXUsqDip3wB7kKp3PBpzUe+JJUXmctpgaszKe1JuG2CqHAiLgM6tJ/xNnbLS4+KN/162/Zg4AXs8hCACWHq69/ItS/OTxUVakQ3IeanqaYtfhVqhYN5b6xw5RMv742a3h4BhHst/UOnAAAtj1O2RTnvtVkY6yD4ru/MYHcUJZE4KdsSOhFwsDa78XqHNYodxGby6oJ8lVxRaookk+vlmWQvzFRDX4P+n39DvoA8n2z6CxL5wSOzotOAPDi8osyJezyOa0f7DUGThWa9BI+aQ0ooey9RKe8PMiuNLjWTeYn8vLT51r+efulyfEOgQBSH+Ro5saM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5097
X-CodeTwo-MessageID: ca3913e2-93dd-4228-aea6-44a8303692bb.20200728133340@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT044.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	429b58c7-aa54-40c6-0137-08d832fad625
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g7wI+lTz+qLhnJ7z/JQ74N0UdoMe6GyZM+s/ogC0hcWfJ8xorGB4Vl/pGYPH5VTUNVVGjkLei159FkQYEz6LsMKefcb2jhctQCrcCx6g9cCle5SWrwkVsgGHulJO+m8CjkJ+H9dpg895U1Ebc+SttYFvTml+khuKAG7AeWirTvAnVoe+uc3vRMhLpt1zDHOd5oVowmLbXqPcL9Gtwj4Fr4oUhw7Ar/G6JVj8fxnkIaSeB7UJfrSL10oQ3tZ5NoklxHha4l8/yOLiiXG69mBPm8FeElx0m2SwGfpKE1Pv/fBWOSh5zwsaS/zyQQKO87EeoFScmtpSpn9bgo2JwX88GUpxlSdDx2pxeE5taDcRK136zOTqmcWZa3NZ7Ne3Fjs9+rrDywgLbki30F40dAvXmxl9GBjTBNdOZ9jLZGbEgJhMYh7CqSfOvBU0r2lGh9REBVunvWvL6T/PsiAQR0ghINH3Hg+quf+92DZ3axmpuClDtnJQx3gXjq/KUMvVDVuf
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFTY:;SFS:(39840400004)(346002)(136003)(396003)(376002)(46966005)(508600001)(70206006)(83380400001)(82310400002)(6486002)(15974865002)(83170400001)(316002)(16576012)(70586007)(31696002)(956004)(2616005)(36756003)(47076004)(26005)(36916002)(44832011)(5660300002)(8936002)(8676002)(7636003)(7596003)(6916009)(356005)(186003)(16526019)(2906002)(336012)(31686004)(42882007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:33:42.2676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a759010-07bd-4fab-0bf1-08d832fad832
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT044.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6710
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

I had a hard time getting a serial attached bluetooth device to work, until=
I=20
discovered that systemd is running a "getty" on that port (which happens to=
be=20
"ttyS0").

The cause is that "systemd-getty-generator" detects that the port comes onl=
ine=20
(runtime, it's inside an FGPA) and then dynamically adds a service for it a=
nd=20
starts a getty on it.

So when I went to solve that, I found that OE already attempted to solve th=
at.=20
There's a "systemd-getty-generator" PACKAGECONFIG that suggests that it sho=
uld=20
not be installed by default, but it gets installed anyway, even though this=
=20
config is not set.

Is this something that needs fixing in OE?

Any better pointers at preventing systemd starting a getty on ttyS0?

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
