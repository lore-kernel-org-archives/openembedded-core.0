Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.69])
 by mx.groups.io with SMTP id smtpd.web12.16503.1601475273356880966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 07:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ob+1RKan;
 spf=pass (domain: arm.com, ip: 40.107.5.69, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDshCy+icX4ezQTu60YtVCUHjb08VGUYB6vp7ppu86M=;
 b=Ob+1RKanoS/9IgHEkhqnSWUtjJ/foyzCi52u1vTknwFBu+9mVRC6KgUM1KqjoPngF1D8QhXgoaDyC7O6WjcmwNwcjpu4olSGD6arYz7Hf3u5oInED6UX6uk2e6ZZ++rqi80mzgyd4yoRLbe98cSOzuL39sSt2GM+i57aJV45eHY=
Received: from AM6PR10CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::20)
 by HE1PR0802MB2395.eurprd08.prod.outlook.com (2603:10a6:3:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Wed, 30 Sep
 2020 14:14:30 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::6c) by AM6PR10CA0007.outlook.office365.com
 (2603:10a6:209:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Wed, 30 Sep 2020 14:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 14:14:29 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 30 Sep 2020 14:14:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00c2c2b74d6fc72f
X-CR-MTA-TID: 64aa7808
Received: from f55d826be119.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BAA2FC3C-E30D-4029-BC12-A4AB77C100EC.1;
	Wed, 30 Sep 2020 14:14:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f55d826be119.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 14:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leMvd0uZOUHwU4dUes4oLm5cEp7/Dn55LPJ25Sv7vfKF/1Yk7n7IcCZUJC+qExZY++AN0vxtYm36cpt5kr/XlFIz2I6WB03hAOvbOR5hqX5TPyX4seX428kir0SiKzQkiD5nekmN2NqqUcowlAk+ZpgYE7oPRDns0oTFeagpO7v4SN1ixJUjZ2VIWvAUCFgxMCYE76IyQ+XDkJvI3DSbwDZOXC5PHjaycphBeViebjdN6WAnjVlPlBwnrV1Ht+BLDGtEi1ux/UJF9z1cOmh6eqUF7h0o4VkuBkGU8aMXhRm6gafTc9DJYY0Yn+N7WzBn5Gw8DR1B+1I5IVptB/UMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDshCy+icX4ezQTu60YtVCUHjb08VGUYB6vp7ppu86M=;
 b=AVSD/+Cu6NKq4YA1SB5qfed1fmOuu+VPUdxxHViiy5hRyHcdIVFbUIT59HTQWCIZiWUYGg69q2JBooNywrJxbKTpDZlSfbpJqcekvAwuw6uXMDhPo9E1X3Kj0aW9NIFfsTL9T6U2Y48ht6lwL5+9w5uM4zkmo0+JOsPs4nR1ak71vXScnzQYC9Ay0lKjcahT+DsZUjoG4u11ky+P2HUC5iXR1tN5OdDlemEoD3OrRXGiOQxIP8aYhGYQIFB+x9qSxhsrOnKe4HD8WKO5Vl5YyNGGiEDkSWoVJrR+tzr4xw1er0hChh0bFGsNlPCDAsNOYPC2Lr0lmtGSgkQYvwxEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDshCy+icX4ezQTu60YtVCUHjb08VGUYB6vp7ppu86M=;
 b=Ob+1RKanoS/9IgHEkhqnSWUtjJ/foyzCi52u1vTknwFBu+9mVRC6KgUM1KqjoPngF1D8QhXgoaDyC7O6WjcmwNwcjpu4olSGD6arYz7Hf3u5oInED6UX6uk2e6ZZ++rqi80mzgyd4yoRLbe98cSOzuL39sSt2GM+i57aJV45eHY=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM5PR0801MB1796.eurprd08.prod.outlook.com (2603:10a6:203:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Wed, 30 Sep
 2020 14:14:16 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 14:14:16 +0000
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: generate openssl RSA keys for signing fitimage
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20200930104800.27569-1-usama.arif@arm.com>
 <c1505edd28fbc0d3298ead49957cee8eccb668f0.camel@linuxfoundation.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <f095265f-3a0f-830f-c980-d94f5494df6c@arm.com>
Date: Wed, 30 Sep 2020 15:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <c1505edd28fbc0d3298ead49957cee8eccb668f0.camel@linuxfoundation.org>
X-ClientProxiedBy: LO2P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::20) To AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LO2P265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 14:14:16 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b487eafa-81dc-4639-6934-08d8654b2560
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1796:|HE1PR0802MB2395:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB23956B6D7D9CEF6CA6F2A19B92330@HE1PR0802MB2395.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /jf0Opq0F1ULPXOJS85xL5LZ00nV1i+bxPTTENnv7z4TvmGA6sUwX/DL+jbxAOmjgjmep4Jai81f/8ZzqlfTGm65AshPt5wFOsTAxO2+JqdHHbQrRB1oc6h8U+wmhwspLr69yECjXiP2WIOGh/KUWhpR2D95KgRU73/xRRtrr/YM43sBr21GSho4waxVqjXfLq/C445TS97lpYtN0r2U1g7F900/U7n2KUQNDH3mVaZBemOlUxb2TXPDkCLj5BwIblj5n+Ycb+7+73lIPub2wUynKfm9oFE8hlKnBXyzEoCuTRzX/4gOORQHx4JkbHt0SiVgYRiiwHlSIE+6CxXU9HEkcI1p0dKfSt60+LWEDkoYYHjldAexY6hd4iBS6KzBOdLSg/jhp1DPOBsUWsSoWJVgnuRLaD9nQw2CxLCfUCvXR/mXnfPj76O7qYcsFw3aLErsh78xYkll9b3FmQY1Ox5ycwDzmnGqQYNmCSWLM8oaVsDI08/zo7jBdaVijMvZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(956004)(2906002)(8936002)(8676002)(44832011)(6486002)(5660300002)(2616005)(316002)(31686004)(66556008)(66476007)(16576012)(66946007)(52116002)(966005)(53546011)(478600001)(86362001)(83380400001)(26005)(36756003)(4326008)(186003)(16526019)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 HNZk8xUFPh3HCI6sC9E5P6GVToMHOEVjarHTz9fDRIwQOuof6Ng+5o4yaMJVfVFj3zKMSQGo/clluiTXAD9KP7MBRq31A0+Ia856Muibz9o/QzFUT0UrzNX4HLjLDgwG4C+CpdV6q846l96QUa/bIFz7IF0SE10aPz2GVNGyjHNfayiULE1yY4eELsBWVToGdXV6Yt09XZen1/BsREEX9czb4U1mjvh54DSMHYE2FHjY5kCQ8VL/oCRajwsfGa4Q9GR065yvqOan1KF+HJdwOrVKThkbUJk4Oy5hCF9HbJYhuBBueZTikAbaE7R3IhqWsA7t7uXm4tAFkjJye62Xe06KM3XQVkJqZjTE3UppHJqjpZOF5+LB7lhWXtRpcRmtDS3JSxFiFkZta2BHU1fTxYcxPf5NE1wLF3MhohAqgenoSpqafKJNPqq3QjLpgckY8E9wRDsIAKWxTVAgJgjwXfQFmD7hNRZU3X0epwPFcr+P23INn6UVsxdq/Hw8itEgG45lwDNklvNFhorZbsQrT5IxCE9v6UC6Lci7HpzHBB88rguaz+q/O2bRNjS6WiVwa9rLf/Is3e+zkl9XAyTcfBKN437y5eeqC4czy111RZmDQE6LGhomHLyYDqjj5/F5OrfUjV3TEwu9/w8CumiCOA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1796
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f669fe64-f195-40ae-a221-08d8654b1d4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0fn+JsWcZp9ioOZVQapW9k8iO2quFMjOAcXqWZFP9J/qfM6UiVDIXvsg1PAhqixcUyZw5K8+ArFYjQJAMTRCnylOf5hNxPB/XRCaiFig9Zq5oLZSTgzpCuWbjht+9IOjChlNhqNpOx4n+A+Q4FAKQ9RE0pebhLkmxCDwAkL3jNpqr62wJ6YvmVsfkluO8S7rIyaDuBpC0+k7oDRNT8Gw2+STAkof3yyrIHjt1T3Ra5+T0+cJ9D/jltHGMHIdX3sMahq2uWBQTnxiJQPskJ2xjPufUwEKG1zohr4FsYs80UNX/h00ULMcdeIpkAQ1ODHY1MlA/07fgrIz+hD1smEVaFg+BSrLbKPL/MD6J6zB2mg9pATTPrQgs1zjs27ZWDISNOGVcXXR8ldl1bYIH+4fvi2VbtemQqMPDkcDRnjz6dlViIJ7OY7AMm7OxHrWLqQpBvAnkg0AIIsPA+Qwjq38PRaLyVQGl5Mu9Lbp7oG19UP61B/K/gj4oAfMFZ6UH6MqoZx7iG/r46Rw8egmYtrBMXn56gVWyjsEomOk4s2aNIAAghmhytAzChm7ZLAfbI64
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(86362001)(16526019)(6486002)(2616005)(956004)(336012)(2906002)(47076004)(186003)(83380400001)(82740400003)(36756003)(16576012)(53546011)(966005)(5660300002)(26005)(36906005)(316002)(44832011)(31696002)(8936002)(356005)(31686004)(8676002)(81166007)(70586007)(4326008)(478600001)(82310400003)(70206006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 14:14:29.6313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b487eafa-81dc-4639-6934-08d8654b2560
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2395
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 30/09/2020 15:03, Richard Purdie wrote:
> On Wed, 2020-09-30 at 11:48 +0100, Usama Arif wrote:
>> The keys are only generated if they dont exist. The key
>> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
>> The default key length for private keys is 2048 and the default
>> format for public key certificate is x.509.
>>
>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>> ---
>>   meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
>> index fa4ea6feef..bb2f3c4ccc 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -56,6 +56,22 @@ FIT_HASH_ALG ?= "sha256"
>>   # fitImage Signature Algo
>>   FIT_SIGN_ALG ?= "rsa2048"
>>   
>> +# Generate keys for signing fitImage
>> +FIT_GENERATE_KEYS ?= "0"
>> +
>> +# Size of private key in number of bits
>> +FIT_SIGN_NUMBITS ?= "2048"
>> +
>> +# args to openssl genrsa (Default is just the public exponent)
>> +FIT_KEY_GENRSA_ARGS ?= "-F4"
>> +
>> +# args to openssl req (Default is -batch for non interactive mode and
>> +# -new for new certificate)
>> +FIT_KEY_REQ_ARGS ?= "-batch -new"
>> +
>> +# Standard format for public key certificate
>> +FIT_KEY_SIGN_PKCS ?= "-x509"
>> +
> 
> Thanks, I'll queue this. Could you update the documentation for the new
> variables please?
> 
> Cheers,
> 
> Richard
> 

Thanks! I have updated the documentation in 
https://lists.yoctoproject.org/g/docs/message/406.

Regards,
Usama
