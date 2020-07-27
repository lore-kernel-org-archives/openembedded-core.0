Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.78])
 by mx.groups.io with SMTP id smtpd.web10.62514.1595874393556816925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 11:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=YvcN1mgj;
 spf=pass (domain: outlook.com, ip: 40.92.51.78, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM9o9PnVIr8WfGNmM2W8VGfxV93XzYdBSKvnaPHizN+zY/tTEVpW3E8yX3ESyJFcdv0e954L97+7JSebhFYR5ZuragBRb/mMKVXZpLccCAdFaiNVBDQu8Gbt4MMhngOcjTykrnlm/wQUab8hNBe1EQM7ObglI0/UieRXjgRZ8pZoIexrFxHn7jlu5ALwz8ybwDhc8vLHIN2MxewVXVmnkFs/Q9BJ4kbhcT8saVO9ZiChEwz7M7Tm/zhA+w4RF5QEKJ84BXlDZHptya63N6eXKEP2wxQshm27fZ4/NXsnpczr56RLMIgE//vVF595kxS5OJx5VWdQK4sHQGsEezEYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKaJOAKsuOgnuGQmlzvESSMmTd68+TmdZPcvuQphrhc=;
 b=jwA0oWGbb23zvF5NRPEMUaSaFb9aHlyJJ8+FXOONUKQR5KDF3lgE5spx+2AlC6Mm+GNSNdCrnCHPJYD0r3VnbGYUp40Kg9fbN7OnEDQtFmUKH+Q5sCgK6qxrixMXMDcj1dkVzJKyfTjtxo35O7BV1UKDArtfiCEwKBBVGdQweiEaB0fjoTDlnrnOTQRMCNLWjK1JMDRD6NuznidKK3ST1m9j0Jbc9Qr7aMhPqrg/zAB2yF+9iDwLgx57MmEwYSBMv2WOC3PHh6B0Vw7YGDG1Gh2QnLPH7pYVdkelXOCyKyEUeQT73eob5baaAEKISR8Ec8aqq2FpXQPYutlnSH5Bbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKaJOAKsuOgnuGQmlzvESSMmTd68+TmdZPcvuQphrhc=;
 b=YvcN1mgjABlSaAHaVFWsbNVKm2qoaa9Pj5c5TTg31rE0FmDYb+t2Y9ile1AavGcD2Wg9IhDkxU7HymC9XsBkXaNMds4TMwMI6dPcgvVOR+3WbH4CvFGHwZmKsUKyavclMOyJ9+yT8z6w+tzAZJFcVgDUKr/pQTlohG1DvyD8BJvTXlFU3YJ6YG2a14p1vuSZaFWCnzSsF6Dnb27dHV8xCjAeZowZvR+sHisL25sCLWGkH97y2qS/04Ya76xXJGyDqKEVPmJat/J/9+NyQ1c3+eqr8bylRHoo5L8oEm7okCbPevWBEtB/pHc3GF3BEpJZYqWNJwFuL4NXLmInVktuuA==
Received: from VI1EUR06FT056.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::49) by
 VI1EUR06HT235.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::397)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.31; Mon, 27 Jul
 2020 18:26:31 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc37::51) by VI1EUR06FT056.mail.protection.outlook.com
 (2a01:111:e400:fc37::162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10 via Frontend
 Transport; Mon, 27 Jul 2020 18:26:31 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A29B7FB21A958E800E660FBB11A911F8510146AEF5249AEF2B5438E9EC73E180;UpperCasedChecksum:40C41374146D5AAFEA59C9A9B3478230BF1339F73C1B5570FC15C645351027AB;SizeAsReceived:8794;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 18:26:31 +0000
Subject: Re: [OE-core] [PATCH v2] cve-update: handle baseMetricV2 as optional
To: openembedded-core@lists.openembedded.org
References: <162552C22941F232.11956@lists.openembedded.org>
Cc: akuster808@gmail.com, steve@sakoman.com, anuj.mittal@intel.com
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB68819E7C05243F00A918121DA8720@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Mon, 27 Jul 2020 20:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <162552C22941F232.11956@lists.openembedded.org>
X-ClientProxiedBy: AM7PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::17) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <03a6bf81-49da-f103-69cd-8fa269986811@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.85.53) by AM7PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:110::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Mon, 27 Jul 2020 18:26:30 +0000
X-Microsoft-Original-Message-ID: 
 <03a6bf81-49da-f103-69cd-8fa269986811@outlook.com>
X-TMN: [uvmsn10dykwNTklCO5oJ4vmMWT3CKvZ0]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5cec8e44-4052-4501-d8d3-08d8325a9544
X-MS-TrafficTypeDiagnostic: VI1EUR06HT235:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Op5xM9l7W5AHDZjTdkWavZbGKm6Gqt2n6H+ctnGixLSB7R5UYdzuFENHptPJaWfN7qHcgf4qZsbYGaQdkYo2zHnYQdiSw1q2uc8cyrZR7umKapF6x7xFJRQIXIwFl9bw1Yc6gcS5G4SfpO7SnloBzPAUtm1bMXb9L9SMAdTKBy+JX5yGCoHHJZ7fwWDwlX58jnvus+mws/DwvKLhPu//C1AY5UtE3YfhH5TS30L2eH4NMhjA+wLpaAXW78If79Fx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	pwj8NHx8ENR+I+X1SAAMbWjtgWqwdXamdan9xcotnCBEHzo9wM7qLsIGa3KtuyefqlkmxOSgdoQ0XcFDpj4ot6Lgxoo3NBRdgequEnEvLjasz8jVIjhRIR/xiWwRUKjRdrjv96Q01HRvOZq9TJ1VhA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cec8e44-4052-4501-d8d3-08d8325a9544
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 18:26:30.9520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR06FT056.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT235
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

please consider this patch to be backported to dunfell/zeus and warrior.
Master-rev: bbefe04a622e166d95093d5127c316de91b27d20

Thanks
Konrad

On 26.07.20 16:10, Konrad Weihmann wrote:
> Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
> Let the parser handle it as an optional item.
> In case use baseMetricV2 before baseMetricV3
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index f27ade40db..32d6dbdffc 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -176,15 +176,20 @@ def update_db(c, jsondata):
>           if not elt['impact']:
>               continue
>   
> +        accessVector = None
>           cveId = elt['cve']['CVE_data_meta']['ID']
>           cveDesc = elt['cve']['description']['description_data'][0]['value']
>           date = elt['lastModifiedDate']
> -        accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> -        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> -
>           try:
> +            accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> +            cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> +        except KeyError:
> +            cvssv2 = 0.0
> +        try:
> +            accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
>               cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
> -        except:
> +        except KeyError:
> +            accessVector = accessVector or "UNKNOWN"
>               cvssv3 = 0.0
>   
>           c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
> 
> 
> 
> 
