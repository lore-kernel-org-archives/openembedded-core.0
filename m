Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.41])
 by mx.groups.io with SMTP id smtpd.web12.1343.1605740095941884561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=fBWQILQN;
 spf=pass (domain: outlook.com, ip: 40.92.16.41, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+vHdPLw5JGyuVJoCG2YRCnXbaw30SxorMaZR83qbkPKh1Li+/9dgm4PFXxczuYj7hgFSUlkLtv7+TrWv0SsSCJQS3qtBHag7u1613uylUoHsSobt0GEM9Xhxa1JLPJu14oaSnPhw1lNH9oS0HmOU+fZaP2P+B655Ut9bwID4B7l++7OFFg8z44IeBwTLdzLLMdAAFVnvFf0qNcfLp+Ld6Xnq4LWu9lI2FHtNDD++Q62a9CNZfWj1eS5+gUA+wNJyQu408K+0wPixTVwwvakhq0p09lX3oS2LwP9wCuw8rNyEP0Sl4yqWlHosjqL3HWHZX7OBlTeQ7+Ja5iTv+oH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFHVS1GKOfhsPn6EiOw2K8ydUrYyyZaw2accwWngMn4=;
 b=j0PCV0yWX1Ii76APA+n94d98zj6unqyE6boQxk2DlJeFlSQTny2J33MkV+7bndgfdfgSM2FDNZw2FBTZSZwbvhhmvrf2nxT1k4HmHZOphURX9ocCAP0uGf4594Q0TSo0BYwlKUj4isXmSUlHOnlBXvIicj5la0LlNFosabGxTkVN+OD99vCHg1wcD3JFENVkHQUEtwLAh2XkFmDPe600FRIcfVYy32jxV4S7s/zRkXz8muLyEhKUjzOQKXhAfRRQ2xACSZgg6leY/7SWKiSwUZceXwwchtRNzEPMntZ7DUWEPOcHoXmY/HFmQHNke3NEkPvigf48d/Fm9pO5a7iDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFHVS1GKOfhsPn6EiOw2K8ydUrYyyZaw2accwWngMn4=;
 b=fBWQILQNG68rPyhbQz37Uj5y4kIX1pd/zQyiYEvbBoh3meSoOdfYslwjyS1MELPoEtFIwwppG24RZt+tuQWsWtcFa1aQPyvws6Tq1ld/QpJJPZpVVxA9uV8DFwxuO13RLLCfujBITejc/AOL8ui9zi8TkQY/nvqXXUa0ZEJXjg1D7bucLZFYdYmjkh3PkUCoCMOCZHk1Rb5v1nZkdlT2UMQx2TMbhTTmd7WtA8KVyu0IS5PHPjixaIIeGCXQzoHjBK5iri3EADLwoAeKkbQLot82x9vFFHu3M4xAoMDf6e8rUzLI1CQm/JhLKvRqL5qWyJ7Vm54JPC5UmvKGx3mJMA==
Received: from DB8EUR06FT040.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::47) by
 DB8EUR06HT046.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::345)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 22:54:54 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc35::51) by DB8EUR06FT040.mail.protection.outlook.com
 (2a01:111:e400:fc35::293) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 22:54:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5E7E4CA5534BAD0C6A11A28953509484F5A99D5AEE7B5BF89B2BB7A7A20B4651;UpperCasedChecksum:ADC0AF0C49FF04B92EFD1AEC672F75B2E03341062E06839B2768E7505DF8A04D;SizeAsReceived:8856;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3%6]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 22:54:53 +0000
Subject: Re: [OE-core] [meta-oe][PATCH] volatile-binds: add /srv to mount and install
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
References: <20201118223708.9664-1-okaya@kernel.org>
 <VI1PR01MB64628148F729E6775EBD6651A8E10@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
 <bbf1fd65-f132-b869-496f-c29bd4adbe23@kernel.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <VI1PR01MB6462F6496DC3A219DB436A7BA8E10@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
Date: Wed, 18 Nov 2020 23:54:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bbf1fd65-f132-b869-496f-c29bd4adbe23@kernel.org>
X-TMN: [fWANlpkqT4n0HGx2vGrECZA4wUNRUmv5]
X-ClientProxiedBy: AM5PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:69::11) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <38a57c28-32a0-c8d1-1775-5a6083dd17e6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.85.68) by AM5PR0202CA0001.eurprd02.prod.outlook.com (2603:10a6:203:69::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 22:54:53 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d4f010c0-cf09-47d9-ff80-08d88c14f67f
X-MS-TrafficTypeDiagnostic: DB8EUR06HT046:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	joOcedPJ9aPZ2ZXY8p54Pv+MVeDtQsOaconyy6qcZbhqH/KWQQCNSuc1o0vmom1WnWk3x2+pbhiL8IyksRJPLcV0kiEupmpVwd+rWlVo3mR6/tvwd4+kf5mQ43fMEaczeobD1pfEvFB7Z6uT2GaJt8folNZJq6EM83JFqzJjwvzrUKOCirK4LDz+SIJy6PkOvZi+pyDootvMp6u3EbyKIw==
X-MS-Exchange-AntiSpam-MessageData: 
	IW1RIwrUX4RLUe1m15fXs9h0GCk2A7EtmgsVgTm9vWH3Hxk7wMGwDV2sH2c80lDXtJc9q4nWVMHLcdL3Z6LD+XZLfoHziKXVzeOv1XuXzWmQADXueYfGgXwSSRbcYabYoTQYVsxJP/yZDK77ha6xaQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f010c0-cf09-47d9-ff80-08d88c14f67f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 22:54:53.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT040.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT046
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 18.11.20 23:53, Sinan Kaya wrote:
> On 11/18/2020 5:40 PM, Konrad Weihmann wrote:
>>>  =C2=A0 =C2=A0 FILES_${PN} +=3D "${systemd_unitdir}/system/*.service"
>>> +FILES_${PN}_append =3D " ${servicedir}"
>>
>> Just out of interest, why does that need to be an append?
>> Why can't that be part of the line above?
>=20
> I can fix that. I copied from a bbappend file.
>=20
Yeah please do so, appends are pretty invasive, better leave them out if=20
there is no real need for them
