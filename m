Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.100])
 by mx.groups.io with SMTP id smtpd.web10.53179.1594021767896886517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 00:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=VkITkebD;
 spf=pass (domain: prevas.dk, ip: 40.107.22.100, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntr2w41gOW8mGwMX4c8LSmEmFzzIoA6PaUXsEkjKm9Lpxn4VXaJUnt4X3wX4IlX8iTh0dnbRPkETcUfylbzQOeVIwYPsEXZb9a6VmPf6cdm1ciIY9uginR+li9kx5/14axox5Fbt+IqtWAmiuETJH33hf6g0WXoTCh6zoTDZdJ5SL23zH4SlVxeWNz3q+5pBmn/yV5rd2WVyVE8f4/HZeZlxtSpUMN4+ODTI+Dyyg+DFOqR8rakjN52R6vbhU7tJ0/yfb9WJpdpad+J01rAy/mp21l/ZGLBb+SWHRMZP/O0N+bRx+cPij+klXlbYuwUJ+l+JUnq+CvGog1EYVLWbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY7fMZc4b94Z/25TFDvkfgV0ddZTkJ6xus6pka43KNY=;
 b=nt/sZtdLZT7opxLSxOTMtE+LzCcvG54jNlE/II8XalNfs+xZWAZfzfgY1HcmVMgxfkSvZ8jxn4K1rKKESM5wJRxVzBXv5m8bmQoGgt+0lWM/hWvFKdfjEZ2w1W258nOEnhCJwPIo2IhlYT0mXS9kqibHvkgxfInc41P2PZWkYcZ1Bfw8QH9PxR5bJeYgnGngr4QA3HnGX+feiwpAU7q+9+itOGIn2MyBvwmkup9/KttD5xhDD7y8oV3ODLnC1Ubnncy/Xp7UpSdUAz9v7dDUiRhLtjfA43ZMh3YEBTTdXWit5GgvfbUDqKQNXZ0K2PCpjuhGPmPAEAT6fwj5qAhgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY7fMZc4b94Z/25TFDvkfgV0ddZTkJ6xus6pka43KNY=;
 b=VkITkebDnqEuQCbWKLsl6qNwrKvZ1L+6HZAuJk325enG9MWKMmGcPVOi4JUsjvqZBDHS4+OqKzyrPtL0+n86Y3NyPkHTpqa1NAimy4f9X1b6KW7CSdjwilXHdn1oYwdOOCrM0+FH3a6vGHjpSd1N3Z0OkC5qUOStEjUunTgUMR0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:159::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Mon, 6 Jul
 2020 07:49:26 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 07:49:25 +0000
Subject: Re: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
To: Adrian Bunk <bunk@stusta.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
 <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
 <ee34bd95-2dcf-cbea-2b3f-e5c11f95e5e2@prevas.dk>
 <5c9d33386f921a0b7fe06bfc480b6d52bfa26708.camel@linuxfoundation.org>
 <20200704211043.GA24166@localhost>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <963b1374-bbaf-dc27-ee1f-c43a4b74769b@prevas.dk>
Date: Mon, 6 Jul 2020 09:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200704211043.GA24166@localhost>
X-ClientProxiedBy: AM0PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:208:122::38) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.153] (81.216.59.226) by AM0PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:208:122::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Mon, 6 Jul 2020 07:49:25 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a31c5817-7cb9-4f02-b2d4-08d821811a86
X-MS-TrafficTypeDiagnostic: AM0PR10MB3521:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB352101AFB394EC85BF2D5DDD93690@AM0PR10MB3521.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hKFowtcWyoVLdv9rUbDnJfDDb5O+DEkb855otx1joRukNOaYlJPxINa6RPIInPg6j85u7PxFEt5Q9jRI/wuvc+JghsNOSb2uVk/kTIY6LyrJII5mc9HQF/dY5SV8bIVFWFVpSM4JG19NBtlQ4+IVjtMPVtcDhMwN3DYQuVqmclohasOOlak7NH2efO3AdmqpuyRUnjzDRlucZU1RjQcqwIEHM0zYDOXnPZjoPlj+S+jDTXsF7vwxdKMvZmlLrqea17rRSjiewhGPxI2mp3ERVko9X3eRjlnRfDb+X9BqmQdFuD7g0Yle4PXne2EL+bi8qZ0nh8l9ErVlFDfqzOOnGpr66B3oWnoWkQsgu1X/rJV03tT7ikbzk7h91wKY2rtu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39840400004)(396003)(366004)(346002)(376002)(4326008)(186003)(86362001)(36756003)(31696002)(110136005)(8936002)(8676002)(2906002)(8976002)(16526019)(6486002)(16576012)(316002)(44832011)(26005)(31686004)(478600001)(4744005)(66946007)(956004)(66556008)(66476007)(2616005)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	UD0O73nqFcYkITEpPX9Q9ATvw44hlx9u2rYk74fCX4hR41FeDmj/TnyIqBqeoBLDYW8SBnbSqLYZs1xQdDDCvM8OWvXVGsfoT0HydyaVqNxTH5UwkHAOybQ2LcXfDUBLkpQaqSNA0XRXTdartwgA8H13ThiwX4EG6m9D3JW6lodcv/eY9TuDgu74Fish8J0jaCwJ19duwkZ7u8pnTnS8OQpGtb0lq5Q7Wrqm3LfTKF4Ql60bXCl2W+mC7Q7P7qPSf1NV0YbbFDT7NjgstQMHXDsP6uOW64/GDO/952fhnlKy0nXw/7HqpECQF3uA6SC2oywfWYAFxACZ3NAKhluR1/k231opXUOOX1VbiZYIjb2Uhk7NyjxPcMFfU/8VMExVB0NNg58LMmbj5qXaUttg7AzyyjL6PZcs0XbZ1xVVWjYQA4KhE9AJzgUQ7iA+teqpqKuA0pEM0fSqLn96zXCXic62RieOWglgQXf7UrEHTvk=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: a31c5817-7cb9-4f02-b2d4-08d821811a86
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 07:49:25.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoVGeF439C1Ma/+U9zmHKwYKp/Yf4tTn7Oqiom3M+uAFHLAXTscO1y0CHcQdG7VmDcqwq7wnZQnMWr1s393DGsniPR3f1cpdOg4MnWiRHqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3521
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/07/2020 23.10, Adrian Bunk wrote:
> On Fri, Jul 03, 2020 at 11:48:36AM +0100, Richard Purdie wrote:
>> ...
>> I hadn't realised there was already the reverse dependency. I think we
>> need to let the package exist in both cases so the two dependencies
>> need to reverse direction depending on whether single-binary is set.
>> ...
> 
> What about no separate coreutils-stdbuf package with single-binary,
> instead an RPROVIDES of coreutils-stdbuf?

That would probably work. That's essentially the first patch, plus a

RPROVIDES_coreutils += "${@bb.utils.contains('PACKAGECONFIG',
'single-binary', 'coreutils-stdbuf', '', d)}"

line, right?

Rasmus
