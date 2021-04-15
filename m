Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.85])
 by mx.groups.io with SMTP id smtpd.web08.968.1618524005554902932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 15:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZkWuXNIU;
 spf=pass (domain: windriver.com, ip: 40.107.94.85, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXdO5Gnq3rJYT/h9oOLZDsd18De+7h3XyvXMrsXhQWnxi88mrfBt7RBfIwcefg5rU6m4FUJpGveIa4Mlx7tBcHHPMV7UNHNZ3Ya3VxxSOA/UfwbjEOm4lbXACz0bm4/QUn6cQsoHDCL3FvY2M5vhF6UeQ56Tub21QbahbVgQ60udRlfbS+9IAH4Ou2VPe3jiQF5RVPR/h2RLk0sThaWVXeqr0MZGqfd3GF2ESbp5t8jndrq0o4PJndUf/OSk0EZozSYv/2XGjpcbx8bumKDgfNiX8QXQ9yBxp7mJQHO+4L24dAIVP+ML0/uKOiKB3AWefUJlrBgVGl7ZIT9Z616U6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuHjOmN/sRUgS7eIn90mCGR3V8lrhCg1+lODQfM5bhE=;
 b=eeAIrSLwoiD7wQ4Gon87iJukla2gE4ca+qCrakfjALN328OR52iFJ/T4PxzWjep9+PZ6kwCKR23t/Gy6zATDIwH4pQ6inv+hsQRpcTpgVJiDJFCvIm85/KCcYPniHvaUQmlt1tAh7A+1IS+XG/my+yz2PIhbKmb/r6sXdxpwtPDXdWbjMqwWWQ9p+qpNVKL1+52hb5mA/qdp1lVb1Crkuhxiqhn3o4Nu7Nxe7+AK1Y9RArd42z6odvYaY2w0s0P0Jgc3jvvigbkPDAkkuESVPkGkqwbdlZQ5md/qqzWFLsZHK5VbygIGhHg12J/YhfefwJnrcBiwUEnzNTz7QxDwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuHjOmN/sRUgS7eIn90mCGR3V8lrhCg1+lODQfM5bhE=;
 b=ZkWuXNIUhhqb+9reat5/LOuSFzgBZCBgfHeTufWRKNoNugqMDhw+hkafwmYDyE2WTRa0utN91BeOqXvNMpzmOzkYESkve1nJQ+E1y5uFUCQykLWisFpcSHV1XP9D7HvAbPFr96vPmkw3VyR9zgxlXN+/TUA8NQH+xEw7djXckJI=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 15 Apr
 2021 22:00:04 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 22:00:04 +0000
Subject: Re: [OE-core][PATCH v2] scripts/contrib/image-manifest: add new script
To: Paul Eggleton <bluelightning@bluelightning.org>,
 openembedded-core@lists.openembedded.org
Cc: Anders Wallin <anders.wallin@windriver.com>,
 Anders Wallin <wallinux@gmail.com>
References: <20210408180336.2670839-1-anders.wallin@windriver.com>
 <3067223.aV6nBDHxoP@linc>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <735f8bb0-fc32-42cc-f55f-8a8eef4f4790@windriver.com>
Date: Thu, 15 Apr 2021 15:00:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <3067223.aV6nBDHxoP@linc>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:301:4a::25) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR1201CA0015.namprd12.prod.outlook.com (2603:10b6:301:4a::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 22:00:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d102fc-6784-40f0-42e2-08d90059d308
X-MS-TrafficTypeDiagnostic: MW3PR11MB4586:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4586E9B5F85E4C5F84C78DD3EE4D9@MW3PR11MB4586.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1woOxClcz+2VK31PecUAG2eOq+MP1UirxvVfDPftkeV1+TPLVVd+LBDDiu+jEhMarqM8e1XHVoxiGvlsd4ZkjWz9jWU0hRSLT49w58pEGI2FCVSM8H2z44XjvPwi8Iec2+SAGZsd571uyRfAHS1DEBwCMuINl9dgEjG1BmbHlQ9UEjlmuPRT3HSGw2ucaCprYowF14QK5f8KmYbJFEIiCvzDxoV0E2L2UiGeDcEEa4W2Pn+4E8XtiJnrHfMjlYbTz3JjvUIq54VJ9Rk/7Uo9/g0Vc5KAcCJwEbvJZ2XRMMrviO4UJz2cHUbfd0m09LNAf4LfW927Kn/9MuRZNLId4IKaGaVP5Ky590rB74HcdA44iFjidI5VrqSQjAyUt3O8gi4ENv1bRMJnHgjpFMIFZNCW6OScUPXFhv1tjuzPktrcNtEQ513eC7Abgy26TojkwR2zKSITn0osxOABbaOxrQCiCwX15nM01eNpPuz7PPPtl1OZKzdou5qDccBqK3I6L9ELzJowPTierlgkJ5fUlZLPXN09Nf+fNKmYjEO7KdG1hWfomVrC7Il0Vs9ClQtfbRr++dGZfpGuYxn5yZdsprDRRF+rKRdx3W6S2jkA7RaJMArkhCaGgH9bGcI8SXZi+Mzdi76am2FotZ04OGGHydNcgc3MxEV7uYUPWTNLT8F6IEig9O8ec5VXrwfFo+jgIKhjMoxHSsYqfkXMzqPpwro7/B4TxamjA26K3bwwNmgz+ZOZyJpPIObdLgbAd+hfOz385/7FEMpuRDMAE4+zEnOOsL3/FRBghD13huWwaVc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39840400004)(376002)(346002)(136003)(956004)(54906003)(16526019)(66556008)(66946007)(66476007)(52116002)(8936002)(86362001)(31686004)(36756003)(2616005)(4326008)(31696002)(26005)(6666004)(16576012)(8676002)(5660300002)(2906002)(83380400001)(38100700002)(38350700002)(186003)(53546011)(966005)(316002)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NWFycmc2VlBRa0tHd3QxSXk3akNRMVdldGdKMGlyMjl1SXhtNGRUYk82YmNS?=
 =?utf-8?B?bW9HUHUycVRibmtkcnZnaXlEaVJmSkhtVjNDaWpBWWRyNzh4RlRSVUkvb0dH?=
 =?utf-8?B?R0hoOGNoeUFVZ3V6KzVma1czN2dGY3c2WHI2bU8yMGo5S1Y1RlJZb09DMTZy?=
 =?utf-8?B?WnFyeS96MHVmOWt2a0o2S0ZVV09xd1kzeEE3eFJGbUEyNXVrU3pJTkEzMWhk?=
 =?utf-8?B?ODdVOXpWdlFoVk1wcHdRSWpnYVUxd1NXUDd4azNUSlBGN2w2blYvMzdaWU1j?=
 =?utf-8?B?Mm5ESG5wWjdYejdhby85OUlXMzRvaTEzd3JobE11YmNZc3V4QVl6TGVkMGlT?=
 =?utf-8?B?SUhrQmNzKzVEZmZVU0VsVzJvSTVKYVI3RkJNMWtBaHBkNWViU3pNa2FxLzJZ?=
 =?utf-8?B?bWJRYkpqWVF3eXBEVW1WN25zVlpiV2tteENtaUMxTUNMbU83NzdNOHBocVNx?=
 =?utf-8?B?cWhlYllWWmNEenBLRnMxY3ZScm9vTFRqaDJkcDBIakpNbGtTd1YvZWg3UkFm?=
 =?utf-8?B?ZS9TdHNHOTFnQnZIejRXUHhSMUE2ZzRnRmdxa2dvdktpSXQrZzhTREpMd3g0?=
 =?utf-8?B?cEhweHNJNmFKN3B5QUpzTXpUN2ljbjZlc01CRTNvcVVPeHdmd1JrelFrc0lF?=
 =?utf-8?B?QVlBcGlJUzlvd0pGem5oWm44NFgxS2oxaGF6YUxxVWlxWi9ycDl0c2QyREFI?=
 =?utf-8?B?TlRXODBYN0J3b005OFBORmpNRUFoWkUxSFljQVVndlhlbWJCRzQ1Y0ZhSHNX?=
 =?utf-8?B?SVQ0TllVU1l1b2RWR0VsNkNCQnAvdVdteVNIUFhXNWx4MktQOTVURnNua29M?=
 =?utf-8?B?eElTQUVxODNpaVRnOEhhMDlRVTB2N1J4ZmNIOWFzQzVqREhLU21WUW1YQlg3?=
 =?utf-8?B?RzZZa084TDRaUHo5UCtVYzRLa2c2WFkxa01lUGhEQVF1Qmh3aDJiL3BNQy8w?=
 =?utf-8?B?em80S2Vuc3pqM0xBSngzeEVXYTY4aDhrS0hFRlNaQ01VdDF4dCsxRVNIS2pl?=
 =?utf-8?B?dEdiT3hFWFVqc0RSRkdRYWdxaEQ3WVVQQWsxYXN5eFd6MWtUTnlJb1dBVjc2?=
 =?utf-8?B?eXBPV2M4OFZhVUFZekZYbHZWcWNjZEo1eTgvclg3endBVUdtRUN2VmFoK1pG?=
 =?utf-8?B?NXBEZXkyT3dFZC9LNGNNNU93NHc5QWlROXFIM1N2Z0hCb2hpWklxdTR4M0RZ?=
 =?utf-8?B?Y2FvVVRHckVMckFjaGF1V0VrWmRVekpEOEVxWitrZXZNUzk3SlFhU2FuS2Jj?=
 =?utf-8?B?MDhiWHM4UWpIK1l6eGtYalJyVG9ZRmU1YS9sdllyOHVzdmxMa2FKejlNUUZ6?=
 =?utf-8?B?UENlZVNPbExpRlpycWZGbzdyRDBNZm91L0toYmFmdzBnR0FDUFAyeUJma2Vu?=
 =?utf-8?B?cVJsYlNVQXdUVmNDR0syYTMrVVZacWFPOWR0OEJIaFIvdkhrS1Y0T204V2hO?=
 =?utf-8?B?ZXBqc3YxTFBJRzAwWElpZEc3VGRxZTFVK0Q2K2NtQ2dWLzZCa0gydWdtZUVt?=
 =?utf-8?B?MVJCZmt1aERObHFPYXI0b3VSMW5IbVl4YkZYdG50cWpNd0RmUzh5dTBtdTRR?=
 =?utf-8?B?MXUvR2djOVF3MnNSeXp1Y1BlUmwzY1VTcGo0WDFVcEFqamVuOFdVMGxhc2dV?=
 =?utf-8?B?UVpqaWk0N1FoZEFtcVU3ZE0rK052c3VDZFJIeDN6dUo0NTJpUDZ1V1g3RDZu?=
 =?utf-8?B?ZjRNalY5M2ZzaDlYWFNrRVhnbER3MDdBMDdERGVyYlQwaDJUWGdPOFJrSlpS?=
 =?utf-8?Q?rGMw3wElBcK9oNJJ0dp9kC8XVoyLfu42xmzALod?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d102fc-6784-40f0-42e2-08d90059d308
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 22:00:04.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDOI82qYdfLnv7k5dPkHeqFx+cNqVQT6HH0riMQ+xRxfu4N1dPKzDXezG1EOZUhqzERHhVmVDUMab6W+ZrItuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/15/21 1:31 PM, Paul Eggleton wrote:
> Hi folks
> 
> On Friday, 9 April 2021 06:03:36 NZST Anders Wallin wrote:
>> image-manifest: script to generate product/image specific BOM
>>
>> The image-manifest script generates image specific reports based on
>> an image manifest file. Currently there is data generated by buildhistory,
>> pkgdata, and license manifest but this data is poorly formated and spread
>> across multiple text files. This script can generate a single JSON output
>> file that is machine readable by other tools.
>>
>> The manifest-info collects package information and stores the information
>> in a tarball. manifest-info can be configured using a json configuration
>> file. The default configuration including all possible options can be
>> dumped using the dump-config subcommand.
>>
>> image-manifest takes an image manifest file as input to get the runtime
>> dependencies. As an option image-manifest can also use the build dependency
>> file, pn-buildlist, to get the build dependencies excluding native
>> packages.
>>
>> This script extends the oe-image-manifest script [0] done by Paul Eggleton
>>
>> [0]
>> https://github.com/intel/clear-linux-dissector-web/blob/master/layerindex/st
>> atic/files/oe-image-manifest
> 
> So I've thought some more about this. At minimum I think this script should be
> under contrib/, and looking at the command line options it seems like there's
> been a bit of scope creep such that it overlaps with other tools that we have.

Yes, as mentioned in the above commit message there are other tools, but 
the problem is none of the other tools actually provide the required 
reporting / compliance information in a reasonable parsable format.

> As a matter of best practice, for reporting / compliance usage I think getting
> this information should be something that is integrated into the build process
> (a la buildhistory) rather than something that you run afterwards -  that way
> there is less chance that the information doesn't match up with the images
> produced. I wrote the original script so that it would work with older
> releases where the logic wouldn't have been able to be practically added that
> way without otherwise needing to patch the code, so it kind of made sense to
> have it as a separate script that you could run.
> 

Paul and I had an IRC chat and I will try to summarize here.

So a possible future direction that generates this information would be 
to create a bbclass that can work in parallel with the actual image 
creation or image manifest creation depending on what hooks are 
available to insert and gather the information needed.

> All that is not to say this script *shouldn't* be used, I just think that it
> shouldn't be something we have front-and-centre.
>
Thanks for your input and support.

Sau!

> Cheers,
> Paul
> 
> 

-- 
Sau!
