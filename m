Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.79])
 by mx.groups.io with SMTP id smtpd.web11.56.1607117721830310501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 13:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=aSTEtuuE;
 spf=pass (domain: outlook.com, ip: 40.92.51.79, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGdzjt8RTg2vKBWazpTGwwzvUNFCa99GkP+Lsmx+sdfQ2/9v7RzZma6JsNnMOHCQp/AwHJccTg2MJnnyygtQSL1B4/JQ6jhthpQyRde9u2tyHQ+5gJbmSj/PPPDbG95jPYQ5rOdSmfHGwDKFFry+g6+uVXcYTHnWhZC0KRd3kxoiuDztCkAvdCJMUgF14Mhk6fl91Ifcmqt8iezvk4VI/h6BgLrHOthxjd2gBiNfT/QJHD6Kr3gwaP1It7ppzeAn6yiTGsSINhdzZP5mJtV1/6rEMSPOZeCfiK5k0udxUlQmJowoLmFywEXQS+fzgMNd48e0X5/2Wy4YJ8MIvmWAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0WsxC06TS/sMjL4/UuJo0KqxZUasKSHX9HMUcbAz0A=;
 b=NgTsLHJ3D1zDznqsNt/GQgNRYIL54UMh9WBOIws8pNN51VztSv0cjFRIunodHmTS1t95FqA8iJeg22l/q0xOM/6h9iS7qywsePh3hTQQrExZY9SrQoOkVRYehsDa4THmkGSuBf66gjT4t6+whKZ/ycv53OV+v3Zl0Kiv3mC02JPwB0ogh/PCARNHKeBTqVcRkVPC87SIlhngbFpENrjJA0X+Py1rrMnYEXjXDJvX23uQ7/SCha29xUcpJliJtOCX37WFSMQ9y64FtOY/LM6BIDx72mkUiTsXJEYrIj5Dq54ClruzIWC/7wjhuxzoBz8cex9fhQFmVKXflK1+2/slag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0WsxC06TS/sMjL4/UuJo0KqxZUasKSHX9HMUcbAz0A=;
 b=aSTEtuuECMOzHTsdbEvIZQGkpNyBTjMlawHalNj4vwvS6nP12DVrjpg5uauvR45Xul/RjJ5PunJA4FFUEFlTyXrO84bH+2536A3eVUHE3QPcPQ4GOK60RzT9qilRQL3LAgk8ukDU5MGd2Vy6fqWtcuPhsWhPYpf0Q8/CeUlSe/pavlm/gFqzM9R1yTXcAmZlzBw8HOpkVEo3NXigklAT6MPYQYnVkvB4X4O9UrsJ/JUx2Firdemouem85DpJF1cKvaxenODUTleO71mTSm9CR5wzwt9GQ5hqnuKhROew16ClPqQ8K9pkd7HtsK0pk+8X9Si3+PIThJ5Iiu2iexrUUQ==
Received: from DB8EUR06FT025.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::40) by
 DB8EUR06HT087.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::379)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 21:35:19 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::40) by DB8EUR06FT025.mail.protection.outlook.com
 (2a01:111:e400:fc35::157) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Fri, 4 Dec 2020 21:35:19 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:67D5B365BA8C94D69E71BFCFF3787B011D74D17B09B9947CC46C8929C7F98208;UpperCasedChecksum:356FE86618732ECB8DA597E3831BA24FD2DF8690406D6697098ED6CBD99DF29C;SizeAsReceived:8649;Count:48
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 21:35:19 +0000
Subject: Re: [OE-core] [RFC]Backport of a patch from master to dunfell
To: openembedded-core@lists.openembedded.org
References: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
Cc: steve@sakoman.com
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB473930BB3590152E9973D066A8F10@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Fri, 4 Dec 2020 22:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
X-TMN: [2a6dUCZBiLXVs6zPL+S9x2A6wDjH0PtE]
X-ClientProxiedBy: AM6PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::41) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <59b33faf-42c1-d330-77e6-88aab97530c9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.183) by AM6PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:f0::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 21:35:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4acbb249-6a62-469a-27b5-08d8989c7f50
X-MS-TrafficTypeDiagnostic: DB8EUR06HT087:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j5Z3FW/a63mY2weIAIn24a4UUesZSiycDdpBVKSEkVJiWT9jtN/nSI2mnVAPB42Y5pZPWtM7yEkMOABiWfP/Hkupi13Np4hzXqfAB43IyF3Z8ZEs4yFr5IJhe6fsJ+TfMW+iWOcazNV2a4mcrqhyT0+LKzX2m/9XLVBSf8NjDmsPAIWe2Kc9WwPB/SZ0l9SXVgBd5O/AsneB94oKpMIK2QwBFWXepGim8V8+JcGrNqE2L1/hD/XgWIUp9ADIsz9i
X-MS-Exchange-AntiSpam-MessageData: 
	XS2ED8gr3chh7d2+hAax8rcX7uq1p8HhjfYqzgewI/IBP51YuzxwKB4v74oLCEja3ksH4lsExC2IuOZDoqic/YQeSoBdi/2+joFUJHQcOg/Mb3HdN3PqKeQ+kUWuvvVWrrwSMEGN27HwSdRsPkvgLA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acbb249-6a62-469a-27b5-08d8989c7f50
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 21:35:19.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT025.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT087
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I would include dunfell maintainer, so he can pick that up in his next 
patch bump
CC: steve@sakoman.com

On 04.12.20 22:29, Dan Murphy via lists.openembedded.org wrote:
> Hello
> 
> How do we get this patch below backported to dunfell?
> 
> https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?h=gatesgarth&id=d9e327063f63193186822d958706081d64ec8139 
> 
> 
> We at TI are seeing similar issues with Dunfell and cryptodev modules on 
> 5.10 builds.
> 
> Dan
> 
> 
> 
> 
> 
> 
