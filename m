Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.45])
 by mx.groups.io with SMTP id smtpd.web08.9198.1612537107601658668
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=Lrmp70yC;
 spf=pass (domain: topicproducts.com, ip: 40.107.1.45, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIiA00hXHGcY6DskbqDXdwcFbkTFK+LOuFuplO/ZCpA=;
 b=Lrmp70yCbkbVZcTulZYNe0OpJtg2AVvp8tDDTdCv8zoIL5DxCS9vvUgGdrOJEUDBl0Ok8IKVEKoYMHwKfSYlmaBacD5NjYVq/E1A8+bDgsEdhT3UNvsNWm/mj2T5nVa2pzUP9rQ0mgxlsMsBud8g/rxp6tvD7WXcuplXxImScl0=
Received: from AM6P192CA0100.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::41)
 by AM0PR0402MB3859.eurprd04.prod.outlook.com (2603:10a6:208:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21; Fri, 5 Feb
 2021 14:58:24 +0000
Received: from HE1EUR01FT058.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::84) by AM6P192CA0100.outlook.office365.com
 (2603:10a6:209:8d::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 14:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT058.mail.protection.outlook.com (10.152.0.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 5 Feb 2021 14:58:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.109) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 05 Feb 2021 14:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9lpXNZ31dqyXnlYmtIayUOxUzMiF5Mu0lTa6/C7TxC3je6LO9P14c530u+pdShjVJAA4BYyg8tfNbGk2dngwMA9sGaYVSI+HyateI75k+Uqe+fCZJgUPegEbVkzLuxqvptNmZvfKy3ex7aCYY7QJLCyzoHd3+TzV8wwEY6wCeW5DPLMBGRQiNT6c2NaRMHYSDKnzDAKm07EE0f9ncIvjdZsjjBfwLQCA8NWLHacdvkiRwBQHUsqI+JZ+oQPtkjrTjiX2JgYtbDNlY/9YY8gKJpSX879jowTVWHw++2FHtINhW56u7Qvw27qD2lOdn0bmOzUMn4SVndlGdyXCh5s7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TJ2hYJvYnxbhWVB0OExrK5LZO7FzsvTWdHTM+Tin24=;
 b=FNOhv0qaTNAWmmU6lq/rgsjSGALdtcfhsuE3g3WDr8jM0TgJFF862mGZNj9uT1ErFKNFRpSXxbqmgAj+8xLE2dKP3aug8aKwwUQLZSeBqk4LxybGT3tSKEl0ME+Zo6HJeOtNH6W6yj1cgto9Qb6uxrAyTw8ugBGYUTX/gE0zkcdc5ImcoLSAagGATz+9ICG+Glg/0AQvKSSNfjhjvDSjIoDB2x2dRKmKXpYDqyCqXR1aY46b8fmULbdTXG1IL9kPy3m4oXpNFb4X/JR4u7xJKqRoEta4QTcRiSn2HhWid1Kt1/uAgSdY9jIPC0oqcqhd2s/NnbTeYkgXCZtF/82dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6924.eurprd04.prod.outlook.com (2603:10a6:10:11e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 14:58:20 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2%4]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:58:20 +0000
Subject: Re: [OE-core] [gatesgarth][PATCH] license_image.bbclass: Don't attempt to symlink to the same file
To: openembedded-core@lists.openembedded.org
References: <20210205142427.18942-1-mike.looijmans@topic.nl>
 <89f603997b197c3fe883fbb8e74c710111dd569b.camel@intel.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.2911e63c-9e5c-4e4f-ace5-3d0373a59996@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.0c810297-d118-4896-b755-845b359e15b7@emailsignatures365.codetwo.com>
 <1660E19B8E4F9B35.26096@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <3ea4e54c-fb86-0498-3512-93c5d8f359b0@topic.nl>
Date: Fri, 5 Feb 2021 15:58:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1660E19B8E4F9B35.26096@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::43) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR06CA0102.eurprd06.prod.outlook.com (2603:10a6:208:fa::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 14:58:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4be322aa-70b4-47cb-3c73-08d8c9e67c54
X-MS-TrafficTypeDiagnostic: DB8PR04MB6924:|AM0PR0402MB3859:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB38592A7D96DB49507ED9146E96B29@AM0PR0402MB3859.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ii/rrJzjSm8poUyM0Zj2KMYFGYNp+6BdKaenMZtySACkTZ9dTOc/0uegGgJZcuGnKbr5BFGTxuQOQ3N5j9BFlB1yJG18025zLKaQGPKkzlSv2960CmeCXcZfkYzF+3bJyRTGTA++aZEyGUosw6ZLFP4p02g0t20UngtMN5K3XYKVUQ0UQS0sjRWK8hlQUNvbWkhH7h5oIrv/lD4FBH3Iq2VLZ6N3+snxSS3jgb7DQV9TSUUnDGTkiU/WzX7hqoVjuTWg6fhEofnNvCSDwWlS0gF3lCc8IXDiulP/kZjNGyijOWOVk4Pp8+FRtojuOXWFi1/1BnpsbU6KBoxFAnyR28PA44X8eBifFxmrvdphClo5SUpCmo5vCC1DYmRGiaavCmBv712KZ4VnNqR9+6jQTiY19JV7RWPfQHF3fP1jWj8zT739qm3YTxgmV6KkbLe4yCXgi+63lhNBU2ysV6zOo9N5dYaVvCNAnawSy7QQ3ZkqBXLh6MspFlqjp8o8HVEujs2YWKGtbD12Z1vV2031FfFuw1z7CdlXsM9BIfzrLPVyvk5Vz+222UorG25wIbSWq1VCiUHJdXF6RaosLVkpM+Y4Oh4XXDg/m/Bve+nZWEk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(66946007)(4744005)(2906002)(31686004)(8936002)(16526019)(66556008)(26005)(186003)(53546011)(508600001)(8676002)(5660300002)(44832011)(956004)(42882007)(36916002)(31696002)(16576012)(52116002)(2616005)(83380400001)(83170400001)(6486002)(66476007)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XfOg7+1CBDJqwTcmkibahjcfy1WM157M6KYMUNegL6RdWyx5cKp1Ellcnylo?=
 =?us-ascii?Q?tqaPRvGWtltkSnkjkQyKZ0Yt2VCsbdQ2h6MvVUramX1BmhJ+fvHQ7vg/BA48?=
 =?us-ascii?Q?k6JtbvP6tzP29SFRYg1PVSSl+CPUxVTcECetjCYOwMvqgjk7tX5Hal/HxZHV?=
 =?us-ascii?Q?HYovyNiePlnzsFW+lPaLajw4DVhl8bwbcXGPYp5tde8LvMbvnMuq41syvO7e?=
 =?us-ascii?Q?hzgYqagXwwQxAbFmNcRikbQ9/n38wkVgAsZLZa5rMLLDKEu3VCZKw7z90XWN?=
 =?us-ascii?Q?xZJILL/izMePxvVq1gngBTKtmAU664mJNccU40+GhNq/gagbUKC2uWGUkp+C?=
 =?us-ascii?Q?5/35VsadkMCyfWRmuKQuNui8NjFFo2nEm85mviK9SXtLDvj/l63YgBMCtK0C?=
 =?us-ascii?Q?Qc0hHtrz0PiXFyugPZEbCH9C8WgfY6jJX5AbcFmiPO8478o5ZK16fAx4X72B?=
 =?us-ascii?Q?i4stiP0a4xxbcp9JjV0Rd2eVlkIQk2ImxkOVhGhYOghtpuHg+93tdcRrSlvr?=
 =?us-ascii?Q?hisF7IWpbeJHlMEzgS5jBH3XpTRlEvURwFy/7CRSs9yp1v6gY63uHAlYBCSB?=
 =?us-ascii?Q?NB/S+8ayNLJayFULvm80oVIbSwVMfhYe5yOnacUSXo1TWkWZS2Zju/hWYufb?=
 =?us-ascii?Q?xJldjnR44BkBPOXnhBJxlZJ4eBFDbII+2i5pbfeD5uaRmxImZhLjMGn0SJtw?=
 =?us-ascii?Q?j0/5iTRkdCznkysMYVu1nZOvkAv5awG2aRjJol4c5bESjogZ4XjNmM7V58hD?=
 =?us-ascii?Q?uSJGMBpHk9FNfKrwJbWvGPF9zyGndyh/Aw1L5qxjPXwRr3is2E+aKOf9/Br1?=
 =?us-ascii?Q?mrDu2fhPtPN0w6bVU58NZ2i7UZHo0VZg9AXUKTVM848niMmkyjcx8rFSVAC5?=
 =?us-ascii?Q?rGQIE94bIKUlHZCz+TbplyYdAell/j1mbYZ0q1p8TW0LhmbMoRYGtY2Vr9/4?=
 =?us-ascii?Q?MzljVuPM2d+3btKrjJzEOvYA4B+yzeho/0Owr3N0wFl+as6lHUtdNE/3psZ7?=
 =?us-ascii?Q?s7QVO/jt5LwexDuQ03asHpMgFIROyoWhewKmk5Mgp+WCY4aQgLNP9vBcxfd7?=
 =?us-ascii?Q?IDz8gJEFAHLxBaGpxNjRk6pXsKj7SIvjL7GrBTggJIszqHr3mVFihKKcWPtW?=
 =?us-ascii?Q?gupJV6xscPTBymJsRP9Zb9dKh4EmSOvP6nr8c6iXugM60XGPnqtQ3U5K6jYD?=
 =?us-ascii?Q?uC6BsmLK7+JoxQQohIhlDbnsxzzBhY35w1MKDNHUzHkBr4azKtUVS6bgCj6F?=
 =?us-ascii?Q?dnYwwxeRcoyt5u2Ls2sR9xZdDqqRCPYIKu6gtquy1y+qP9QNAt6go/LqLFxX?=
 =?us-ascii?Q?vMtGeu4VlShGKgifG1LLJzcc?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6924
X-CodeTwo-MessageID: 2e855894-a353-4ff2-8eb0-62b68de15681.20210205145822@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT058.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2402b76d-3b81-4d69-bb90-08d8c9e67a77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PvAIqKm3IBVu7rSuxzZBveXtV7rB9GplRf7hq+T0tgfufVLMlSElCVwUcJWXf3WXC+sBqqgfJqMpo7A50Y/uhuOriFs6QpL+twFYKcOJHPmxcIrf5qkJyHU40OIkLIlk5jIUGeI5vbaKgXDSRhfqFwokWBKMjOsEg5hmHZ1Hy8wECmDb4R1RY6+00/p5KdPqvyMOYM4uwcSkjUHISNSD8PL9QbPzJP/h1ewaVuZ0ldg46nFfCk4FxqojT5XKYtRD4lxF4Oce6rEuul5oqMf/UALEgT9FjeBZrJkp6dsxLLK/q1K7PFt6+T1S0kD/bBgIVDckY3jf4U6mz2QzDemASA7ZXw+0GDsb1wrja49Eu+Wrot8R1pe4LrQVn2IszGWYcDMMKYvoG09BdvPDMCGW1CdxjO4mZ7ntJ1BdR+jfZunralNDtmjiqas+Rx35m03QK1HN47QIq058taG3R2zz57H1B/wyGj+1ZxEoYIl+lVAVROqofg4WBYdijPlAgMss+Dz0P0KBQ6bDmd1Wg/0/ZC8ewqVvuhIsekBCqIpEsg1waI9q4w0Z5VFJtt7NgzRtHzzx2i/HszDdEgHYq7UGH3rEugwaOVgZeIboS/Dosu1sDmvicdf+W8tt9gbTQwj9CGE5ceTsQX+pCxZiVN8f7dUNopgBJ0jEcydYZ4BQ/VWpWoswYPfETCNzFeCxJXoYcN05BNi9Lk9PnS5JKjDB2pTtUJ6L/iZQbeegCxnUf70eLpDC5/pcoU6fBzaPOmpHHCB0Jz4RRUFerB4/cjUfAw==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(36840700001)(46966006)(53546011)(16526019)(70206006)(26005)(336012)(42882007)(83380400001)(2906002)(31696002)(6486002)(6916009)(47076005)(36756003)(186003)(7596003)(7636003)(356005)(36860700001)(16576012)(956004)(82310400003)(83170400001)(15974865002)(2616005)(31686004)(44832011)(36916002)(5660300002)(70586007)(8676002)(508600001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:58:23.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be322aa-70b4-47cb-3c73-08d8c9e67c54
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT058.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3859
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
On 05-02-2021 15:51, Mike Looijmans via lists.openembedded.org wrote:
> On 05-02-2021 15:44, Mittal, Anuj wrote:
>> On Fri, 2021-02-05 at 15:24 +0100, Mike Looijmans wrote:
>>> Sometimes (that is, in all my builds) the lic_manifest_dir and
>>> lic_manifest_symlink_dir end up pointing to the same file, resulting
>>> in an error like this:
>>> =C2=A0=C2=A0 Exception: FileExistsError: [Errno 17] File exists: '/.../=
tmp-
>>> glibc/deploy/licenses/my-image-tdkz15' -> '/.../tmp-
>>> glibc/deploy/licenses/my-image-tdkz15'
>>>
>>> First check to see if this is the case before attempting to create
>>> the link.
>> Is this not required in master branch? I can't see this change there.
>
> Probably yes, too.
>
> And half the commit message got lost somewhere. I'll try a resend...

Oh weird... Apparently the company mailserver that did that. The version=20
on the list is okay, the one in my mailbox lacks the first half of the=20
commit text. Same with the v2 mail.


--=20
Mike Looijmans

