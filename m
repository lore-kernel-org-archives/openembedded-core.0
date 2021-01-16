Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.86])
 by mx.groups.io with SMTP id smtpd.web12.4219.1610765371905809576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 18:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IMBdcshW;
 spf=pass (domain: windriver.com, ip: 40.107.92.86, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpun1cmeXKabcS4bXQ0bUB7V7ad4kIn/CcCwSk51cHO8DoA1xBcGR4nyAdPpFYz6Zgm6hLjxxxMvybW1ulArXE9EvXLbb4xYLCZ/VGuZVMJd4jVnLPXk514AcyCQpXmtcxNr4R9N9vqTUFc9HD5QWqoVVZGBcDWYtFPy21VBH1mDUg0VpNq8pvqgtiZxf2r41MJ6gS96jrYPrJd+184rR2WvPyK52XDsSPR/PDYRRyb5tWnaSbogycejJtoGb9FLgCiZbZdxMs+iCqgYVMqhP5fiTkmmilPB0hqZ+GfvnnYtuCdC76K71vFRURmPy6zwsEGnDtmc0SIl7qOusLy02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV70Qz5VhhawYwkROG7koCIV7crPLCvpQsAadKh62co=;
 b=AqZwE9hIT5CI8BT6WoNubc/xfWpBZpN5tiKIxJWlq1URSmk/bvsHSyyirOUBckk2nfhYwQ1kQL38aUg28uHvdTWW2TyQ36nFoQ3Arezze48uwRl2tGDZ0/pkO0S8li54t96lHZ7KbbPKEpG4g8Uz+4iOuEpEh8K6qZZsGpRPnTvVTcG1O4afxPOMo0vZeVpfEp8aTIVPNagO+95wT52TxoH7jqot9eD8v54ao8Rz3wGzFZvpgLR2bZDAzOWHLNdYdhlHluwXnrkVDF1d0TXGhwdNcjJ0vXJJAAumgFNddHcPgshTGtQvLaMbZX24tFLIo3Vbq0LMUEFIwUnzWaJ98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV70Qz5VhhawYwkROG7koCIV7crPLCvpQsAadKh62co=;
 b=IMBdcshWK6svmsCH7RM0yMsK6uQnW42SqzE7wI2aWrXKMSOqdYyldkEXBUFnGEFbZjr/rxoI+r0egYpDhgeZw7+vek41RC/Fz5BqtxcvESbzn54lhl7noC/GVAQ/YhV1KapxgLMjMiX+CyZ3JYV9nksv82c9dB2LU27gH7fyo/0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sat, 16 Jan
 2021 02:49:30 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417%6]) with mapi id 15.20.3763.012; Sat, 16 Jan 2021
 02:49:30 +0000
Subject: Re: [OE-core] [PATCH 2/3] apt: add nativesdk support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
 <20210115094536.18651-2-hongxu.jia@windriver.com>
 <165A643B5E417599.21794@lists.openembedded.org>
 <fb1e48e9b2cca8a0acb5d9da2081e091620253f2.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <068fe7b6-25d5-9fcf-a7af-e7118657544a@windriver.com>
Date: Sat, 16 Jan 2021 10:49:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fb1e48e9b2cca8a0acb5d9da2081e091620253f2.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Sat, 16 Jan 2021 02:49:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5feb9a-3e89-4b48-921c-08d8b9c9591a
X-MS-TrafficTypeDiagnostic: DM6PR11MB4705:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB470522EAD7D567B5F82B872F94A60@DM6PR11MB4705.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9EpnMM7CF+EB3sXpxTtPcDADJ52v5WTIP/INA6+bMfq49GCNRux4vNkoxLMYZf0UAwrHhxGRdJCzGGpAi4oaMpB+VqGjH+Q8dQ6LWdMtAHFTfNtGkJgVrVTxcuHEspi3Kce8K8z2MmPvqga83uzaT+4aV37xM6hB8mJtU3syg9Lfv7v0MrT/0e4klkFEKRZxTJuJSgh8THSjcgBEKd2rRDCNK2cZ6uXFNykazea94YT++xegnENrfsCUwp7Lk2nVKRJEVNF1sDUvbxveZiCppX3WkRYBfUM5VlP1q8BPLyVfYm8/GpY5G4NuRbr9EdQVjKwJJVSrsaRbqPKtXlfQF4IB6/iSXi3IYXcr9Lc2/XeOJmHhYbyUVO+xcgzbPGeYeTG8HUR5OKb/MFtM+bDegXkANedHUMHMrkqXBy9OZBebIu1dMZsYNF5pMER/weOMGfQSSfP7C8LtTXlisugvl+uso/EmJEHg41ZfXpZ0emklKx48fr2KWdXaFnbZ9qA5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(31696002)(6706004)(8676002)(86362001)(316002)(478600001)(956004)(26005)(2616005)(44832011)(53546011)(36756003)(52116002)(31686004)(6486002)(8936002)(4744005)(5660300002)(2906002)(186003)(16576012)(66556008)(16526019)(66476007)(66946007)(6666004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a2lzdnJCWURvT3lwWFFlTUx4YkVtQ0RjcXk4UjVYQVJVQTRaQm9sZXl5eFd5?=
 =?utf-8?B?VS9zZFhrU212OUVReU5yVElDRlBMYXBhYzFlNU9maDV5T0g0VUZueWVmL3RC?=
 =?utf-8?B?elhENXcvN3JCWlJER1c1MGJKZTBvVjFEOXIwZTUrU1hDODRiWVE5L2x4Q0dk?=
 =?utf-8?B?eDkrclVtMGZ3aXluZ3dQK0ZBMTFMQ3hYMmpaaUI2RmVRWmhpejhxeGxyc01Y?=
 =?utf-8?B?L3ZDRjl3b3dRdk8zSzU3Q29vZDNzeVNFaC94LzJ5Rkp1aUdOUFFZbHdNS0E4?=
 =?utf-8?B?T1ZFTHZnV253Q2M3d1lZSWVFNkVRMlBGQXRibTVzMU5tVTNYTSsxMkd0MlRS?=
 =?utf-8?B?UDJvYVM1bUQrMFlwZVFlNUIvSU9XV2pZK0o2OWlQL0xpZTNlaW1JdUwya1RC?=
 =?utf-8?B?eEJrY0xFZGpJZWtHa2YycGJ3RkJGUmxwcXk4bWdON2YzUWF2aFdBLytzOHVm?=
 =?utf-8?B?QU42bklNenpNSDFaVkMrZldmL21JNTRLZHFIbTZxeTVPbjVjM2dvVXEzaWth?=
 =?utf-8?B?eklsZlpoK3g4Ui9VZHlTcFFQdlhTVEhSVENFMEdPZHlDbzJneklGelBTUS9Y?=
 =?utf-8?B?N3JwRkdQYXRHMnNDVzltRk5sMFVWWVphZjVJMDZXSGFLTFRZTUMyWGlpayt5?=
 =?utf-8?B?R0MrLytGQ0F2UWo1V1d4NWpxOUcvVXlrK1FaZFdhdExoNStNd1pKMUdXRWxB?=
 =?utf-8?B?d1dxb2ZUTmpXMU9hOUx1eVNTYzFtc0hwWW9FNnEvR3NDNXE0U2puOVBJWm9N?=
 =?utf-8?B?ekpQR3VSYlYrbWpBN1NHOGNnaVJqYUhyS2hvZmFQdy9JbytYTms3MzV1eHps?=
 =?utf-8?B?S0VGN2pSSUVlV2dKTlZxVmhvVzZsSTloTUpXZ3VtZjc3aVU3K3pSVDRqWmlN?=
 =?utf-8?B?MFF4Z0wvUUN2NEsxYTFac2psZnVITW5xeHhiTnYxemtjYXc4TUIvSW1idW9B?=
 =?utf-8?B?amFHdkh4S3YwdnErbHU2bFc0OEJEUzB6MVhTakw4UmRqS0RlQW9DalloUStn?=
 =?utf-8?B?OVZvQTc1QnJ6aXNiVkFFcVhtMElIWXY4dEVhcXhHWHk2SHNMS2Voa1FRRHYz?=
 =?utf-8?B?RFlIb1M4OWhWazkzZWsrc3kreEIxeGpuK29YTjFRenhSV3IzVEZXT0tpcGVV?=
 =?utf-8?B?aTV1QUU5bzVxRTRMRjU2WVNTYjBMZkdDK0tXckFwcStjUHJkWktRczlaYnlG?=
 =?utf-8?B?VlJVRjBWMXpobEhXWFNlclhKbXh6VkNocVpiK2c3K2w0aVE1TU1jd2pVZU9t?=
 =?utf-8?B?dFNXWGgxakN3K3UyeUd5VS9vdUhLQ25YTlRpMUhWeEhIRDhEb0J2Q1hWN0Qr?=
 =?utf-8?Q?SrYVbmatksVTe/iSIlZEKSg4PJUER/E2uJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5feb9a-3e89-4b48-921c-08d8b9c9591a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 02:49:30.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Makpf5LMRfnE/EbGEt6Fq3gO146Woot0lCzZqO+kfQ3cqEaBRhXzlje7tQWWoTbs+pMZ7Sjo6bNOSUWZ5eJ+LZ9IKU/2guvNbVDjQpDYEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 1/16/21 12:51 AM, Richard Purdie wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> On Fri, 2021-01-15 at 11:26 +0000, Richard Purdie via
> lists.openembedded.org wrote:
>> On Fri, 2021-01-15 at 17:45 +0800, hongxu wrote:
>>>
>>> -inherit cmake perlnative bash-completion upstream-version-is-even
>>> +inherit cmake perlnative bash-completion upstream-version-is-even useradd
>>> +
>>> +USERADD_PACKAGES = "${PN}"
>>> +USERADD_PARAM_${PN} = "--system --home /nonexistent --no-create-home _apt"
>>>
>> I think meta-selftest/files/static-passwd  will need this adding for
>> the selftests to pass?
> I've tweaked the patch I've queued in master-next for testing.
>
> I also added a comment here to say why we need this user (it used to
> exist but was removed as it wasn't realised what it was for).

Got it, thanks a lot

//Hongxu

> Cheers,
>
> Richard
>

