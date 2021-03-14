Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.6889.1615734061144209272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 08:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=kh6p3/gy;
 spf=pass (domain: topicproducts.com, ip: 40.107.22.43, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pq6w3SJTDw550ylAHjRFUsl9YR5enwjJEerZPOAQR8=;
 b=kh6p3/gyeWggzW+UX/5TKOtGBtMCp4vOSVtHGzIWe7I5OBeqY46rkII2xiB/R5o6dJXkJEAO7eoz03dwBLEu2pB+58HDzySy33IwgtMj6U6ix/j1Trs+QJl+vj4e1YM26efsn6k/oxZqXXUkrGD3rGcBpzPFP6UNzV+AHYUgyA0=
Received: from AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) by AM6PR04MB6645.eurprd04.prod.outlook.com
 (2603:10a6:20b:fe::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sun, 14 Mar
 2021 15:00:57 +0000
Received: from VE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::dc) by AM5PR0201CA0015.outlook.office365.com
 (2603:10a6:203:3d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Sun, 14 Mar 2021 15:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT055.mail.protection.outlook.com (10.152.3.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Sun, 14 Mar 2021 15:00:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.51) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Sun, 14 Mar 2021 15:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz+mTz0T0pHjw0iAnlEzkkBBAZ6zIa6RLGoT2omMvK1uEgVa6Qt4EEhVYOxfc7axJuq7Hp2wPeSIg15xfwnMLlzmQFumoNdZZe4nb2R87BK8iVKFWLEC7v8Qp/eQRfvdh5kKRUlU2BdYuHoVuHTRvzUGHG+EwqbpfYHz4EjR16kmKJVilTpIgByE0zMRt6VU97Gu8omS0Fvhs8p9jPfuaNTEb7wR1/NH8T9vLhj3nAR4k+YfG+13gYrdg/WxZ+6969ry3i1FELbtGFNmWGRF/ZSXcpufuFCh5nyN2NyFiTPVpLgieC9z33azXXDMhiZQciATcMfr8cFET/qVWE29tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yyXLOHBHQ0mdUaLgpdc1nPzz/z1VMPEESHf/oPcfuA=;
 b=WXF5Zwg4T3Z1wG3lOWW9dPn9bYbmoCqk08cba/JfmfHr3dr+lIskLlceSH8Dg2y7o/KvFFG4RzkFYGZiRsPI4esM318PyRfga9Pt9aNfp0VcioFhAMlLDkHOa9Aj4frFty5OCFkXg/7mkBQO1SnhcPhFddn44vYC7NfLLhGfJnD4F06QfOM2pARW6f5v/I2G2PWRKmiVOk4cUWJ+45hQT2pTanBlCGVLwjUAhpfCjf7ipYUYpq/CFBpe56fzhBRxJm/iQeOEeV1Acc4LIiVVSMgooMLMnmTRPwPZx0feb+S9FtMLyy7w2kgrFq3FtBw8D5j4MLgHkE0U6vRyjBXNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sun, 14 Mar
 2021 15:00:54 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 15:00:54 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Khem Raj <raj.khem@gmail.com>
CC: Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
 <9af0d495-c07f-2ea4-4084-bb24fad59747@topic.nl>
 <CAMKF1sqj+tfjzHDeJbaNjeg139CQgNKvhrb0gejDbuxk4TN-LA@mail.gmail.com>
 <166B8838D6F42875.480@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <60c5b306-14b8-4f3d-4c38-b7b35f4ba0c9@topic.nl>
Date: Sun, 14 Mar 2021 16:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166B8838D6F42875.480@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::22) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:208:ab::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sun, 14 Mar 2021 15:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed96cf0e-e8ad-4861-cba3-08d8e6f9f8cf
X-MS-TrafficTypeDiagnostic: DB8PR04MB7033:|AM6PR04MB6645:
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB66458BD6C548B1584E42F626966D9@AM6PR04MB6645.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NyEFUuWpt7J4/cb+78lnKZENpZOUziWzCER1m2Ku9bLwZJy3bfTguU1DY0ZoPiPIGUJkcMtSaZiDPNIAiRpiaG4kyB9EtDbfZOAsLT66hVwJHycR3NX4UtyLkvZY03xvUh4612sSqZendeoXNGd6vikVs409HQWQhXm9H5mpe+KkAZAQVdUYM0HFMDF/Xg6D0kf6S2KilnlP7tDy+8v6jrNHzGAuCW+Cs0A4NBi7n5Cm1aLBxSDHUpwsYQRMdwymEhPI82Hh+zCjG6i1lz7Gy/5/SyiE2LWtJXNLb9XBEtnNf8fDXF8n8nKKYCyhhPxFVzxV9wVow6CbGbEaLzkJWA6FfSXUhybN8FA5puC1SbTP0nM8Q3LqnVIS8iKKbT5xKFFj2YYvm86dpVpoZ3ESR08UyMBbyt+5aoDALR+u5zQTnhSjSrKJWf04ceHif+UaIHGSOCW3A50zUToYc8+pq4SYfc+HRDNOxvv2XTYJTqHXzMC+W0dl3IDplKIZ5i31oZ8ugEhr6BHiSzuXntRwPWCwWx0CRGbDGldsE9modOJmnJ3Dxs2fIIsiTd3unyIOq7qF1k4YhK5IaCIWwP0t7bK81UuO6om95QdYQftsVv4Py1BvAPJhEd6/WLiKJ2Sd85sGMPGCUC3H/F1swem1LA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(376002)(39830400003)(396003)(31686004)(316002)(83380400001)(5660300002)(16576012)(16526019)(2906002)(44832011)(478600001)(4326008)(31696002)(54906003)(8936002)(83170400001)(66476007)(66556008)(6916009)(36756003)(26005)(8676002)(53546011)(186003)(66946007)(6486002)(2616005)(36916002)(956004)(52116002)(42882007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0ZpcEFPYWtsUXhDaE1JZ2tGVytRVStFUnk0K0JWcEphVmE0a25YNDBWdW45?=
 =?utf-8?B?bloza0VIckNvb010QkEyRVVnVTh1WU5vb1dLdmh5cnBGN3ZUT2FaZWQ4bWlL?=
 =?utf-8?B?VFU0Q2pISHdHY0VXSUlqcGh6TnNueTlJcVZjb0M1TVJ1OHRuaS9BajUwd3pZ?=
 =?utf-8?B?UE8ydDg2bUxNeUE1NkVLOXUwTXFZMkF6cmYvOUYzVHFoVDBRU0Rkc1RNVDRH?=
 =?utf-8?B?aFlibE1ZdUpobFVKM0ZMK2x2MXZLWVRTNWpTNnB5ay8vQlFpTnlHL1puNTg1?=
 =?utf-8?B?M3E3dGxuTE5HSCs3VjhFUkRaQmZIem84K3FKcVlKcm4rUDZ0WVRzQ3gybmxy?=
 =?utf-8?B?dndZZ1F4MUIvN2x2Z1c4N29rb2phREgzdzVUYXAzd01oOHJ4NzZwMGVweHdy?=
 =?utf-8?B?WUtDRlEvQWx2bVF2TklQdkRkZ3VqUVc3UzJlVVBOamZoWmdJNk5vR2xzZ1NP?=
 =?utf-8?B?dUpZOXZsRmVMTFA5d2twUGdEMXdJTmFxQjVnN2g0Z3VsK1gyRkJSRjVQVUtZ?=
 =?utf-8?B?ZzRNaGg1WC9vRDVOTUtmVm5QTE90QWJ3QmRQdkFOVjVhTEViOHQrb1pSZmtz?=
 =?utf-8?B?UkxvMFBCVC9JOXdSN3VLR2FrNVY0QkNJdzJiLzM0S21vTUg0Qm9VTCs2Umdp?=
 =?utf-8?B?S3A2UDhBeldQUjlhZUMySlhSb2libTRSUWEwMWtDaHQwb2JPOXJ1UnlXVlBR?=
 =?utf-8?B?NmlYS01TWmpydlFLQTlSL05maDZoMkVvb3phajc4S1I2SjZRNGl5UnpVa3Mx?=
 =?utf-8?B?RDFWVldaUDlPNktHYkVHWjlLMVg3V09tZW1ZM0gxT1BzYS9wN3BNdzdwMlRU?=
 =?utf-8?B?NWRDMm4veGRSZGFHbVJqQ2VvZlozMVJPMzFHU2xEeXJLSTRGMEhteko5cE8z?=
 =?utf-8?B?V2tySk4wZmxRN0x0RExLUmN5bVJaL1lIN2huQ1RkeG05eE85SHNVcHVDQmZB?=
 =?utf-8?B?ZkZ4aktQQU1sRUJkTFJiQUVSSDVtcTJ3U0F0c3dGOFJjY0tURzJyRlUxWEFo?=
 =?utf-8?B?ZC9uNGNyMjdmL2hNU1JUdG52blRYK3BCQ2FBbi9SRGNRYXBTa3FydzR3VklS?=
 =?utf-8?B?bFlOaGo2SGRZaWxLVE81cUtXT3htcnhQaWFFZjFLYTJVTVFyYURua1ZKb2th?=
 =?utf-8?B?Mmg1bm9FOEdUcXd4QnNsMUdLSjhqeTJZRnh3YmhydjNMUG44SFBPcWNVT3Qy?=
 =?utf-8?B?Sm8wZXcwL3hmSElmWG5oekxtU0pEazB4VCtQN1FRZEhIWlNtdjRwcWh5a0dz?=
 =?utf-8?B?OWtvOGpkUDFKbldpaFpzc2NtYmtpbk9aczZHMjlQOGsrSS9xZW9Xc0F2WHli?=
 =?utf-8?B?OXZ5QmhvL3V2YUQ2OGNJcVEzcktTOG9zK0d2RG5FUDg2WUVXTWJsdEVaR0dq?=
 =?utf-8?B?VTBKWHBYcWVHcm9nb3owR1hmM3hlVUlhd1hEKzlNRG5KWDJ1cG9GUy94WVZr?=
 =?utf-8?B?QlorajlxaDdERkRPVEpnRGVVVlIxRm96dWZRZW9ZTzdkcUlPenFQL0hGSEV4?=
 =?utf-8?B?QTh1VEFMTGFpVzFGRXBiNGpBakdSbDRLV2xvWWRyUlBySkJKQ1U0NkNHVWJh?=
 =?utf-8?B?Qmk5ZVhpSXBoZHROQ1ZCWlRMK3JHVGlkekY3WldGOEFNZDk5S2Y4cy9ySnB2?=
 =?utf-8?B?VU9tU3V1YnlVYzNqa2xQWXBOODJnUWxLQ0FoNVc4ekt3eVE0WmZpY0R1d2Qw?=
 =?utf-8?B?bTYyT2s2ODdBSEl4c2xaL3Nld0Rnc0p5djhid3NkRmV1Yld3cnk3aGx0QWtz?=
 =?utf-8?Q?Gjp46kcHYEAb7eu0zSFukQ5TxKNm+iWLzet3tNv?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033
X-CodeTwo-MessageID: 21f65152-0e34-438d-b52a-25f98a987fa7.20210314150055@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0c123fa8-87d0-4cdb-1f65-08d8e6f9f717
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wL3N0doJMrvIpASp5R4T1R0MsFLAD7El3uNlgFQXJ2QYAjK4/NTaxjjBQHGY1OFz17nXiX2JgHnbAqF8fbnPyIAZAAQS+vBIp87DbxD6t5ELKG8umPHN7vn4VV2vDNWlwLeQKpda8ecp3ZR3uvc2adtz38c9NnHMXgBPH7J6mVXejRX9uPrqEplQ16H8kh2dzhfmTAqfeAOJW/LYSOwwUykn35YV1zVdrx5ApvHtOvPcOZQ2Q7KWmuXLEltNdamJL9Ot9QUyBYhQAWf1RN/reX1Abb79R23pbQ6bPGnnu47CNrLkncX9sC2VxRkTxXg6fuUqlWguSiOZiisMByvlEBI6fb4hhreUabG0dF3zdj0HGVE1MOXVxmqm89erJs8OTdmrjZAPrhGr9IGMA22w8hKqr59dcOeGQ67zZFT7Ly8/YSXzKmDi8AHRVCEfWesKj4cUr1xn/cMuDFdrIUPTES36UFz9K/5hukxel3yDT+AkavgbIXShSVgpbAWHcnQIKtjpSbiMyQvjqbBLNzVp5Ghqhxf59k1fAQYjyj5jZS8LMYbX6Zp5eZf6k/91eXIU3o/OTOziSN83WTRbOrJ3Sdmr07dWbEIese90OCgBoA4fPIecDX+pBWMvw5MhgaHnGNOYcOV4rAMey/a6wNO8a0IywSEn42fG2NU2O5A6XNPlBcCMlYlGrFAG/AwyfASbG6ZVYJKzV5C7A5wPwIIGJQa7nDKWirvvmxXuvHSPSJk91aTgfKQrqFil3cYzCBZI8Tf4bi4697Ew13vb++yqXQ==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(396003)(39830400003)(346002)(376002)(46966006)(36840700001)(15974865002)(36916002)(53546011)(16576012)(356005)(8676002)(316002)(478600001)(44832011)(36756003)(6916009)(956004)(54906003)(2616005)(70586007)(70206006)(8936002)(31686004)(4326008)(6486002)(5660300002)(16526019)(42882007)(336012)(186003)(26005)(47076005)(83170400001)(7596003)(7636003)(36860700001)(82310400003)(31696002)(2906002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 15:00:56.7398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed96cf0e-e8ad-4861-cba3-08d8e6f9f8cf
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6645
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
On 12-03-2021 08:37, Mike Looijmans via lists.openembedded.org wrote:
> On 12-03-2021 08:33, Khem Raj wrote:
>> On Thu, Mar 11, 2021 at 11:22 PM Mike Looijmans=20
>> <mike.looijmans@topic.nl> wrote:
>>>
>>> On 05-03-2021 00:32, Randy MacLeod wrote:
>>>> On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
>>>>> I've been doing quite some tests and things last week, my conclusion
>>>>> so far is that the latest gcc seems to trigger a bug particular to
>>>>> this CPU. Maybe even this particular batch.
>>>>>
>>>>> Hours of testing found no issues with RAM.
>>>>>
>>>>> I've also done huge amounts of builds with zeus, no problems.
>>>>>
>>>>> Then googling for "illegal instruction gcc ryzen 1700" reveals quite
>>>>> a few threads on something that sounds suspiciously similar. Though
>>>>> it makes me wonder why I never encountered it before, since these are
>>>>> all many years old. I did try a bunch of the suggestions done there,
>>>>> but so far no luck.
>>>>>
>>>>>
>>>> Any update on this bug Mike?
>>>> Have you opened a YP bug? If not please do.
>>>> I'd like to see if the problem still happens on master.
>>> Interesting.
>>>
>>> I just built the 64-kernel using OE master and no crashes, everything
>>> went fine. With the gatesgarth branch, it'd crash at least two times
>>> during kernel compilation.
>>>
>>> So something has been fixed since then?
>> can you try by disabling uninative ?
>
> Probably, if only I knew what you mean by that?
>
> What do I have to configure where?
>
As far as I can determine I think i'm not using unitative since I didn't=20
explicitly enable it anywhere...

--=20
Mike Looijmans

