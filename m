Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web11.8351.1600781338044348468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 06:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=LNe3ylR/;
 spf=pass (domain: topicproducts.com, ip: 40.107.2.43, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZr06SMEKbHcjlTIYcpJgD8XHyVt+YuvldAVpqQRTwI=;
 b=LNe3ylR/qEBS4Iu+qpqFD4UMYibAXyRYBq6JDenUhUuLLkXSO09DsWZrT/mGdOe9nhBXmLOVg7vMWRTxDPMi2nCLR0Zrjlw0BJLtpp5fwAQNLuJqXouy+c4ed8DWY+V80sYmnu2ofTJYpCe7xOiR2uqoDSw6wgf5GKpJ6CA5OxI=
Received: from DB7PR05CA0072.eurprd05.prod.outlook.com (2603:10a6:10:2e::49)
 by VI1PR0402MB2767.eurprd04.prod.outlook.com (2603:10a6:800:ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 13:28:53 +0000
Received: from DB5EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::84) by DB7PR05CA0072.outlook.office365.com
 (2603:10a6:10:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26 via Frontend
 Transport; Tue, 22 Sep 2020 13:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT023.mail.protection.outlook.com (10.152.4.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 13:28:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.173) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 22 Sep 2020 13:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKPhfBs5aTqHof1g14Cdj23wlH7O1Lw9T0X4GlKg2uNxQovsNhaJfgA/hARwP0+J+HoCy098YB2Td0/9B6ojl2rNMSCHlh8WR7fdoSmpcXL2MvUQRDyaSu8talnTkSsU3KGt+EVuWP3X0haiA0hI634fTIrwxxJXb9oQ/UuVCV+7aSZNzORSOHefSS3dcCCdlrwamBIUmqxWLw87qIVqp/FDbM/KklGOusSxuZp/uTNjpWcbGAWiD1DF8gwyka6GFzkwIznoIBEN0Fzr8txQ8B2Y1x1mqIlblLqHxeM572VaEunCfjPMOcI+fwsuCXjRmuSW2jTo35ys5omXKWXYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkVHbmpJN9BhLCZ8EmbpMRi+Nk6nM9MAc+N3KBZaAYA=;
 b=RCU5AAOJijkhlDctyVtZipFZxzza9vrcjX5VgEJUqq6XVEj196QNumQsWPURy6IkKaGuhd8dKcThclDr8AHn3xKmaBgNu7yhL2H/T0ReVGMLtRMggV+ptUu1TJCJIhrqbkLmgACWGd7MrwYwYn+BFVc65VfQYwKxX8M83KsldhwWP6POa2IgmCtt2q2EmUYp/Yq0Y7pLtEXkTbvhRPfx1A7tYyX6uFowdldWdHxZyX+40vyOZ4WFf4/DAjct3kzHJ4NojHl7JojVJcCLDINb/qTIcDCv84Smtjd6BQ2EcBd/IxNrGgQ2quG4Yb8ZweJTC8lSe/gPV6hKFblT9SGt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0402MB2872.eurprd04.prod.outlook.com (2603:10a6:4:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 13:28:48 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14%3]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 13:28:48 +0000
Subject: Re: [OE-core] [PATCH 1/2] dropbear/openssh: Lower priority of key generation
To: openembedded-core@lists.openembedded.org
References: <20200918060034.2327283-1-richard.purdie@linuxfoundation.org>
 <9a49493f-2eab-d94a-a344-cf7a8ec5ad1a@gmail.com>
 <7f5f0536114fefe76166a0d901c82837278b1fbb.camel@linuxfoundation.org>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.76905e61-10f2-47a2-a9d3-f83899164fb3@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74d10122-7f89-4ea0-9839-3b2878499c45@emailsignatures365.codetwo.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <ffd0bc94-e4de-bcf5-5ec1-cea5dbd33fd7@topic.nl>
Date: Tue, 22 Sep 2020 15:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7f5f0536114fefe76166a0d901c82837278b1fbb.camel@linuxfoundation.org>
X-ClientProxiedBy: AM0PR03CA0036.eurprd03.prod.outlook.com
 (2603:10a6:208:14::49) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR03CA0036.eurprd03.prod.outlook.com (2603:10a6:208:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 13:28:48 +0000
X-Originating-IP: [83.128.90.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c4e93c2-5648-4960-79c1-08d85efb72ec
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2872:|VI1PR0402MB2767:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0402MB2767C6F29390CDE954CD5300963B0@VI1PR0402MB2767.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7T0GuGEfcoS7aCmFem2HGsk4lffHkGNnhGaKdJpSKZpNC8st7W53xRstQaDt5gSKj1WHWS2pc8Wjf+zbz6rF3YXgDYRhPEl641o5Qte03qa+6SaDmq/4/dVsCIeR4jUE9FIwPKVp1fFENEgiqihrV+/A1Hq+s68rwdGUK81caV0wazo9D9ZxpsKh0GAo+0v1oQhRhH3VjN3yb/hY1eW9I30wdD0FalZcidSymGVvf65veU8g25gSb31/8CAV3Sg90+n2qBBCfvvnPeMLgcAWJUVrU6ooWGEOHXyuyAhkGgHCoCK0H+4zdyXDRCjOBQCFKWO8H5CwxiP2pok4griwMkuWOZQdCwJzpAOKXtol5uC59f2bQ/UYWgusGXvvQVdc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(396003)(366004)(39840400004)(52116002)(6916009)(2906002)(66476007)(66556008)(31696002)(478600001)(8676002)(8936002)(6486002)(42882007)(31686004)(83380400001)(956004)(2616005)(16576012)(36756003)(16526019)(26005)(186003)(36916002)(316002)(66946007)(44832011)(83170400001)(5660300002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dyghRdXFsZ20B6AI7/IzPNDRrHuIxcCE+5U7XJqTUgy7wxfRTa+iO+sumlbN5uQhDcHK47pklIdklRiwGlqfdGtAVAsjYlEn3oUvf9YtqFwQ7oKLexP8snj98zU81y+XIIGLeVtDcZdmYQKP/KK3w047j6Kpd9d6/37rNIb4aObPku89CA21DxgdzbHPjB8Utg7mX2c0MkKrh0Rl5EvppOjRXOb9dnTb2KDQSVJVcH55JgbKay9auyrfxNish9P51I/FDomvHsdoBDL+XO2mudDXKjWdJyN3D68wrmarhCxJxOxxuIuO3MvP573bYuoZF6sMux+NdTa16Dy1l4vjeMSS4oC8YiwozzQkGOLIDMoW4A4ojZSvOCdIBe2eZ3Jwmx7H17hmXHFUBOPo7WaqjemslB3dRLrwjxgA0juX52PerL+sTG0s4MvTc8GpFgqW3YYk3y0wX3jb7J17tTWSecWcos5E6kveKkfKKZeMzV5KQqbzCaOsPu+S4XSwzq6+MYDzSnJyTI+qoYEKnMcvzEdybyD27UlcUR78eybS6z1MJskqFMTMURb825P9t7IIM3uPX/Ef3Ar75qT5fHP/gjc2Bd1cPHPyOGP7xb/trqtAKRoEOTWN3KlW7oE/Ng65rKWhyssOaHEEL0nuLB2DHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2872
X-CodeTwo-MessageID: 4d965eb6-23dc-424c-971f-c237d7e29dc8.20200922132851@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT023.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ab91c7d-f4c6-4f21-9249-08d85efb700c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MJLW6ZIjRxwJyDsZVhBEX9mY3AUwdqrTMQfYBE2QPwfBOJ51SgAHd6WDbUgWr9mFLOGNsRYEQqq2OitU4FQNaQESNg4KHvWqL2kDG8qfNnO0VHxTWt4UR3Q4gNcLrDwlZj7CGEMV349aAsT7kYihVuSko1Rt+oGq20Upk4fhxQLvQKadAozfsnAi5Pikrn6jxuVGFYn22HuSSzgEWS6sKELgdOnHjmSbTL6R05u34WXMfb5t0RqUi+kqa12nlBFk9fdz/8LLqCjtOqyNvd6Eg/bk7fOFIYGmMz8ETPvhXWMGPsgNHiAzdr1vdqcQBC4XFVE2PVKO/REEgFrMcnoRmq0Mexz7dJyda+znqlAXnjxHI5wWISnOtHVLOnoW/AKHXivv6PaUJ9nPWiAu43Dav7dtKHJm7WzWsfuQxewi92ZVifMoHEIM656NcMoLFII9drGJ2/YZCwpWgYOjC81hCZuSmYLWY57cJyFjIYdcUFawjnrfzeespNC4cGGywXp7
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(346002)(39840400004)(376002)(396003)(46966005)(316002)(16576012)(31696002)(70206006)(2906002)(478600001)(83380400001)(6916009)(7636003)(2616005)(956004)(70586007)(44832011)(31686004)(7596003)(6486002)(15974865002)(26005)(16526019)(53546011)(47076004)(336012)(5660300002)(36756003)(186003)(356005)(36916002)(8936002)(83170400001)(8676002)(42882007)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 13:28:53.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4e93c2-5648-4960-79c1-08d85efb72ec
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT023.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2767
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
On 18-09-2020 19:55, Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2020-09-18 at 10:45 -0700, Khem Raj wrote:
>> On 9/17/20 11:00 PM, Richard Purdie wrote:
>>> Where we have images with PAM+systemd, serial login can be
>>> extremely
>>> slow. The load generated by key generation does slow down the rest
>>> of the boot process.
>>>
>> this is a good find. So I wonder if its because we have entropy
>> starvation. I see that we do enable virtio-rng while launching qemu
>> so something to look in this area perhaps.
> I did check and the virtio rng is alive and well in the image. Its the
> CPU usage of the key generation that partly causes the issue.
>
>
Another solution is to just have it create smaller keys. The computation=20
time seems to grow exponential with the bit count, a 2048 size key can=20
take 10 times longer than a 1024 bit key to generate, and a 4096 may=20
take 10x that again.

There's been a move to 4096 sizes keys lately, pushing the CPU use even=20
further. Unless you're controlling a nuclear power plant or so, that's a=20
bit excessive.

--=20
Mike Looijmans

