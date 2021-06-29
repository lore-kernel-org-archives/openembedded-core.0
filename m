Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web09.4775.1624949561899044973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 23:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=WcRtC85t;
 spf=pass (domain: topicproducts.com, ip: 40.107.22.77, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNtddpGBtLyuTrkxgXzWdrb1pl8QUxYMQ5Nxeas67C0=;
 b=WcRtC85tLfTcqqzooUM8LoHRT1W0yBQ/fEo4N4L4/7F3lzAnuHe1L3U3d83UwfZvr0YCcKpGQmSJ+9fYqRr9QO1ue1ABk8CdF2q1ndB8rOY8rKbxQnlX4SpSjhcgN5wDiSMf/nOiVtHApcD0Ae9zidPllw5nDMObx7lcblSLjIE=
Received: from DB6P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::34) by
 AM0PR04MB4803.eurprd04.prod.outlook.com (2603:10a6:208:c7::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20; Tue, 29 Jun 2021 06:52:39 +0000
Received: from DB5EUR01FT031.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::d9) by DB6P192CA0024.outlook.office365.com
 (2603:10a6:4:b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 29 Jun 2021 06:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 DB5EUR01FT031.mail.protection.outlook.com (10.152.4.253) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 06:52:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.59) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 29 Jun 2021 06:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTqADgKFmcThz+ms3qmggOFyDZW3lJ4liicR7pNORwgE5xqZeGrkGoBt5NSl0DFoOikwnxRs4uZ+aPWxWmk3Qt5oeyKnbJKOfYG3iWLWmFHhyoaG72SZDvVcJdlA8Y9OjXasdEf+FpOkzCRG26Nxlc76il03rgmFsoZ9v0wTh497lcs+9DOwHQD0vUyUqBMS4JwRUflutGPa4t1dT89Kui4BSKTqEHcBZP3ffzGMACf0hpe49jG5n7O8OfMQmT14vdESsvYwDqLZmcwlb6VPQGTqE9CuGcsv5eEsdU5hKCbKXP0kR44vP7vjz9irfu05sIJY6Rf9f0xhUdKySMTlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy8+JS2q05o3l4ExdVfjOGF6o4NjLWrQaEUUp1Yzm/o=;
 b=k2tiRsZkS/SlilZep7KteudLrIl5mtKKzJfA/122qcABkOvcBdj9FRCJHjuMWfs/WWZKZABlkBTLfijBu7ZRb5Iw6hbHTIQVro0WZQjaU3unq41eeFZ+zkduOQfdoPEn8Kmi1AvT8UqTy7ES4wOjFD6azrHezSz2tXv4+DhQT8gfjIJJLyw6dP2t9rW9wbEkzSXpL87ig+4laELVUjpLtVFCd68LrBbclRSH+Mvcosa5Dum/WHIdpUu3hApkQQvSNHCn2e4+rMi5cWnmQd82FsEyvl0GOsUP5kt6733HSLZCji/gWg5+LEEF6WIkci/P3F7kGxcleCGpo7SnUllDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB6044.eurprd04.prod.outlook.com (2603:10a6:10:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 06:52:33 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4146:176f:d6ca:6321]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4146:176f:d6ca:6321%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 06:52:33 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
CC: Leon Woestenberg <leon@sidebranch.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <2acc547d-9212-d753-81fd-8f4bf6edbba1@topic.nl>
Date: Tue, 29 Jun 2021 08:52:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <165E1F647C435468.32571@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:208:1::39) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:208:1::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 06:52:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a63c3bcb-aff0-437c-f364-08d93aca7c20
X-MS-TrafficTypeDiagnostic: DBBPR04MB6044:|AM0PR04MB4803:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB480305FD8FC6798943D1703796029@AM0PR04MB4803.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 73BYb7/54iaIgguEawfMmNYxgthrTvBw6KuC0pzSCrrWzgtIt0v8ehEd7AeyvjG8oTK9CVtMYVoFtL14Hwn0Ep3AOVVLbCGyKXeWzIZH6PCgzcPkyO4/VELpScyJVVfzAQUtZDIy486MW3gM7l7XZfkNjbsjt25Gh9Sxtp4SryLwp4LG/OxiYxSAiwG02nLPvYsqOM/xOmyC5pLe5pIAy3FnughBrp1XT4QDVLvl6ak6/674aPwD2MUWLljlbCDUvU1mOrpnsEvWSlbbpTux/GxLq7HrV0juiKAXDgwOKhnLz3h5jpqxwSnfEhEWi4fIggEdKH5yl1guZOhLkEkTH7938hH1sPrAR2zneLcWuuOQjoryqd8KjyH2wjU2KBRb9uo2qZhrO/YAx43Q2awlOtPeAXrXZ7NMcm1AkqfWgACFFI4rFSKznE3NNfePavebNcAyDqA0O8djHSBoEw6aoOu3oEHLDKRv732FUeISwuoAaCYz7o4OL8JADBP0gAP7kaTc6QdmVLQB/jwzPLsRF6w/ZBwvm9bUuwW0Ox7yNReB5DkEN3YckFJeMYdLxx1DmxnKoWzDOz5yjSfH6fo9i3EkkCpN8Ds3CwtbIkfZAtGZf6dT8AZXbg2Lv4TBrvE+OK7sZn+HVfRmPRMP7k6BcVzQwfLtgMH2WgMJt9q5BfZAIsaG2xVhoqjqDWbLehLB8PmRTNB0UsWxDdBSPbr7rlAKMV5vuDXxS8lAby3tBYEUYEB/xperlm8IuK+cWBO2+AkQecgZLhK1ITfkdjIZLoFwqoz5cq4OHCPd4nNy2bQ+m+kXQ4TCdl0lZMTNmt6t/WeCNIlTtYwrxMsbPB2ziLbJEmS/Qmwgns+z9+W46Yf6gv+3zrfs7KqL1DyJmNwqPwUs9Lox+ZUIi+IXm00m9w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39830400003)(53546011)(83170400001)(42882007)(54906003)(36916002)(16526019)(6486002)(316002)(186003)(26005)(5660300002)(31686004)(6916009)(83380400001)(38350700002)(966005)(2616005)(66946007)(66556008)(31696002)(66476007)(44832011)(2906002)(478600001)(8676002)(52116002)(956004)(16576012)(4326008)(36756003)(38100700002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0xML3FVeGRMTHBEeXpXWUR1QktXZDhpWEJ3TGFEaEpMbDFoVHZya1hXMFBx?=
 =?utf-8?B?cnZZWFRDcXpDSm14eldmYWxPSG93VFNIMGpFN2VWSmN1R2NEMnRJc2dvRnZI?=
 =?utf-8?B?S2RqQlJucTkwUU5RWFM0SENROW10NmJ3ZjZIVEV1cVUrc0J4ZjY1NWR2YTB0?=
 =?utf-8?B?YTZCd2F3eUcycVBhU2hmTjdVeTlHUmhnQWFDTWV3SFRCYURjRHBTS2Ezd3dI?=
 =?utf-8?B?Z0xSbjFnRWlxc2t1VFJxdHEzRmIxZnZmTkJhbVBaMVRzNjRIai9zbUVObUhB?=
 =?utf-8?B?eHUvWFZnT1lnRk82QlV1K0NwQzNjM1VRalFCTTBDTDM2T3NCZ2NKRW1tWTI4?=
 =?utf-8?B?Z2lMSEVPeWVZYzFPa2liQzZwNklNd3BMNXNMeFhXS2Qza0RvUW43aGJrTnRX?=
 =?utf-8?B?S2cvNHc0bTJzbTZ6djJFZU42RUV4WUhvdDlZM1l4eWt5OTBnRWNhY2RPNkFL?=
 =?utf-8?B?WEhBNTFKZk5Ua0tBaEtMNEdaMzllZkMzbkk3bm82Q3hlMzRqaXpQSktKRUlu?=
 =?utf-8?B?UXM5aVZWVVMwSzVkbWV5OTlMOUhDWE9HalQybkFiNG1obFpvV0k2STVBSFpC?=
 =?utf-8?B?UW1BRGRaVndMNnl6VU15TkdlWlBSYk5yVUNjRUREbHBuL1d4NjNBcVFwNTBx?=
 =?utf-8?B?WXhDRXdzV3FCbURyd09rbXR3RndPQUxiUWgrN3puakxNb3B2VWkrSWdmVkVH?=
 =?utf-8?B?T3hPOEs4b2F1VDR5aVlqNTNSOWhheW9sZmZsWUk5QmhhSGFmdUp0ZEpzWjNZ?=
 =?utf-8?B?UlhRUnJXVVUxM2QyRVBZd0ZvdEhacXp2TSsxb3F2VEZEOFZ2WHZmOVg4Nk56?=
 =?utf-8?B?VFR5K2QvSm8rSlhOd2l1SFlqWklocG9TTzhJNmw0RHNyNDF6Q2tkQ3JYNUc1?=
 =?utf-8?B?dEZPMlRmWkt4ZkRxUm5ocXpjRnk1UVR4QW50Rko3enVDNndWaFFXcHR3WHk0?=
 =?utf-8?B?N09VbTVRZTQ0TTdWK3NPeW9ydjJ4S3FmTnpNSi9zNW5NaGdhTCtaK0hTZjE4?=
 =?utf-8?B?aUgxVytaVlByMWMzSDgyWGY5SEQ3SXRHL212L3FXSE1YR1NySFhVdEFHYUYr?=
 =?utf-8?B?M0RSODNoRVMwSTZEUzdsSDIxY2NkYUZsYlNSOUxURWk0K2UreHZxSnVaSzFU?=
 =?utf-8?B?YUJtL2pERmZNdmhDa1lZRUMrMWdXWWZpOEtJa0VyaUE2MFNIem5mVXJHYVJN?=
 =?utf-8?B?VkF6a2locHBmMlJNajlwRkRSb0RnZDNQWkE4Sml0STF6UnB2Q20rRENIWEZh?=
 =?utf-8?B?bGFSV25yVStzNG81ekpvSU91WCtzUTZqQkRodldhM2lTOUhpZnk5VkRGV1lO?=
 =?utf-8?B?UEZ2OE8xTnhZMTBvTHlzOVN1WTlWWU8rOEl2YlY3WHFlamxlYUpqOGVvSHdl?=
 =?utf-8?B?ZjkvdWhJaUNxRllMVGFlYlhrZzM0SjZNUklnam1aSmE4cXlTK2FXN0tYbTIr?=
 =?utf-8?B?TUVwdW92VUt1OVRZQm1tMTJRU29YMEtWWUUyUWJGb1NjcXJYT0t4SkQyV0lr?=
 =?utf-8?B?TTArQkdMVk5MdjBjT1BMb00rSVhFZ0t3MTZuY29pcUdDZjllUDhJSUVNV1Jq?=
 =?utf-8?B?Q3pRM1p1YmZwN0RUaEFiYTljOEZPNVdFV1o0bEtubjZVc2hNUG1aYUZmOEQz?=
 =?utf-8?B?NG03Z0h0SnFTaG9rdGl5YU1ZZ2o3THFhbGpScWhQZmxVTGtsZFc3NkwvMWxz?=
 =?utf-8?B?Vzlnc0hiWVNuaHlHRHFXblBVQnlpeW1tNVlObkhQa3N3QmtNemNmQ3Q4TlpC?=
 =?utf-8?Q?27MdgNlXX0fy4hokvekAQwnYbspWT5gF9SFS6Nc?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6044
X-CodeTwo-MessageID: 7e497f3b-a57d-40ba-8b75-efadedd01e17.20210629065235@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	43063ede-7c92-48d0-15d3-08d93aca789d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	90uBoObSpFHLU2KyiDhVyuZEhl36rOwG4B4KO8SWmNtjaFjekUMzssCsA6+0+2Eg1IS0CQp1prK0jivPk9D9XeZVq4xOrM/XTK/yEvJQd49aCLQtTtJFtehOxKzxhRasPR7gh8ElYrdnp1wCDCggt2h/+WZ8ImpSwAdr8JOu1Xd1TJzlcvI0TpKByXwdZdNjALq+ljFlCbdJMMhrqFtwA6oJthpeRC7aFd/E/awhkd0cVU8AIx4LbNDWwVCV+ROOGPGz8FfvsomOUX3Unuld280+2VKLp1DlZ07qysMi9xvyMwbzsPnuUkH1srX2HpVA4owjVQQrsjD4eOdBh64MPFSknN5bWzSPRimS0eNtIa5AxN1/xHPA8OLh8+24RkD4KMUHM8NE+iJVeKjiLJIdBstsXPdvchNfOjdhrD9jS5luDwQ+n9y69lDBSqpQEXagFFTUAEJjsjnv4xKvDqCeVsZYd//1CqIRbAjtoGK/nTCKmi1h7pyo27V/634Uad0ZbQnuF1iXg8MtzxpaNqGu4ajUPlTroqdl4FQW7EDmeWXz7hX0xpapHpuBzjTiKm4r0VGN9TvXKwYE85xxVytu2W3iwe75ZHqf+hwdtjc42WEA13PHIFriTzKEz/5+tCCRk1d/y9w2yu74Cid0NI2owHldro63VaAOYISphPip6T/Ee0QvKzpW2A1/wm78EB7lJ2AZ4BsHRL0aHFUnR7E9rw+kwAPwaQxwXYQw1aNeC4/i4TfDQkFpfC9hrR5SFou9yo01TG/RF86Ns+9K1BY/4fwCkm8jaETzfnUS6Cm6uNkqxt8eme82DU1E9jWwk9DepWE6dNF+1AfXL8/IaTHZ5f6T/dGPiK7THCOPJHvYrqI=
X-Forefront-Antispam-Report: 
	CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39830400003)(346002)(396003)(376002)(136003)(36840700001)(46966006)(316002)(53546011)(966005)(70586007)(15974865002)(36916002)(6486002)(36756003)(16576012)(6916009)(26005)(44832011)(83380400001)(5660300002)(2906002)(47076005)(70206006)(54906003)(42882007)(31696002)(4326008)(478600001)(7636003)(186003)(336012)(82310400003)(8936002)(8676002)(16526019)(36860700001)(956004)(356005)(7596003)(83170400001)(2616005)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 06:52:38.8477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a63c3bcb-aff0-437c-f364-08d93aca7c20
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4803
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Ancient thread, but might be of interest to others.

A while ago the power supply died. After replacing the PSU, the error=20
below hasn't occurred any more.

I'm not 100% certain, but it's very likely the issue was caused by that=20
PSU on the brink of failing completely. Not the first thing to come to=20
mind...

Apparently gatesgarth is more power demanding than hardknott :)

Kind regards,
Mike


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 27-01-2021 16:10, Mike Looijmans via lists.openembedded.org wrote:
> When doing large builds, the GCC compiler tends to crash on random=20
> spots in the code. There are a few common denominators though.
>
> It only happens when compiling for aarch64 (cortex-A53), not for=20
> 32-bit arm (cortex-A9)
>
> It's random and usually happens on "big" sets like kernel, openssl,=20
> boost, u-boot etc.
>
> It always reports "during GIMPLE pass: ealias" in the error, for example=
:
>
> | during GIMPLE pass: ealias
> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check':
> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler=20
> error: Illegal instruction
> | 1239 | }
>
> Compiling the same thing again usually goes fine.
>
> I've never experienced this with the zeus and older branches of OE.
>
>
> I've already tried upgrading to the latest gatesgarth status, and=20
> cleaning out everything and start from scratch. I've also run "mprime"=
=20
> test on my machine (over one hour) just to be confident that the=20
> system itself is really okay.
>
>
> Ideas to diagnose, fix or reliably reprodruce are more than welcome.
>
>
>=20
>

--=20
Mike Looijmans

