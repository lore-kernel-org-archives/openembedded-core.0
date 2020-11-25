Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.59])
 by mx.groups.io with SMTP id smtpd.web10.410.1606265246921180614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 16:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FdgZ3krz;
 spf=pass (domain: windriver.com, ip: 40.107.77.59, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SocfYIb5txldKp1Uju0PcBe/35338ED8dUJktO1Ce/c6tlMTyY5Qn9QKrJASQXPpakVLmxCmKVtCmDURZeKhsYtW671f+kOVyYOOpgu+fhRP63ExIKS7LCFwOhLTM1LZvvVGYLPCaIJAOxGMZnbsv0CzavArqpK0oQUu0LeLy+jtDnoUBKrGx4X67TsVe5XjlFOsj9Zgqm4RSJBQHoPaOMZUB0Uuw9gek3DrHyFG6thHjTOBh5UEunSciOhbUjEU4/NQxNopknWf3SySE1ONAvzIIlZZtZ1OZT2OhcS88bZzEzUFlNZnjlvldUWf/9dMpXCLP1KN9SveSCdueXc2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC/0O46JL3OWSpdfyyCBaRVbUanXbderZ3qEiCwng44=;
 b=GQi6jD4AKG4uWwEcbo7rBoi2xtvuEWzR4j8GQIf4T2q1RwaZ5lmKagstuIqoypfbJ+mQ2YaN7IMNoEgIzpf03uv8NBvUxiGRMCemigeHcR0BiHZxfjoMCHLjJTKAH9pNha3CD7cJ2444TZqMcyuRBQgSIHEU49okY/yWP9sjlSEaOrdwYJeJXR6d9qz3bPB30zwyXSWoZ9fkfSmMuGsgRp5czPKbDZTKtTSf03jzZAvcGoKISpNqLRpw9xUrQwFjhnibu3SGtJSQyEuuts1Xd3HAilH2zL9qSOBcq1866dCtfu96z9gsV5UXiAMqUrLBV2fqeHUAnyj8XTpPk/1NJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC/0O46JL3OWSpdfyyCBaRVbUanXbderZ3qEiCwng44=;
 b=FdgZ3krzrmEY3+QecC1wRkztZbJ28gouHCIwkCPmEcDm3z9fDNMWG4v7XsEQ6DqjBVMOW1ypY1tc2u4fHLInAOEWUtOAdiQtiwx5gi6N1Uqgm2bjf/83oQqAe1h4SO12P36Ia/BmPEx3wwz1shvDuC+/IrWFOIYnEKrWZs8Ljqw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 00:47:25 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2906:8fbf:ad33:c618]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2906:8fbf:ad33:c618%7]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 00:47:24 +0000
Subject: Re: [OE-core] [PATCH] buildtools-tarball: add wic dependency into buildtools
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201119004832.23088-1-changqing.li@windriver.com>
 <fdd3fff795db407382604abaad4f6173d7028a9a.camel@linuxfoundation.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <9bdd286d-402c-0090-8089-23adfa2cd746@windriver.com>
Date: Wed, 25 Nov 2020 08:47:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fdd3fff795db407382604abaad4f6173d7028a9a.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:202:2e::36) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR06CA0024.apcprd06.prod.outlook.com (2603:1096:202:2e::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 00:47:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b55b4523-1748-4318-7c87-08d890dbac4b
X-MS-TrafficTypeDiagnostic: SA0PR11MB4637:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB46370AC5EE14713730E54DB382FA0@SA0PR11MB4637.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	58Nt2Zqz2IP6prOUqccBHOd5fb3SxTGMbDcWCYFX5ohyeziDpGjAlpAwtJbpwnm39MoD4dAVq+5K8FES9y6+vXHgy4MPkE+FY5oNfQ/oT3SYYryAzvGG81hoCL+9eUiDvPd3wltvpVK36ZEUYzIlC++xJwMWZ8ENqwnPxbaVCaFRPLWKXt++d9s2Siw2ECL2RSeDrTLkrNfcpbJqFpX0h3A5lWK5AYaI66JS8tzkaXwGoudCsPRhdhUxqE8qWlQLPRuYfSuOY3nXZHKyNKZN4259We6ty5AoEnGEtEQLWH7RzGmllvkYT8ql9e3TvKAnFTnVEKQJpDthnb+9vu5FRF1UW7IMTzvDelGq79vIoc2CVLBW5wy3b66lzq/3iiE68Ziy5vsaBJAHLdYcSkNBuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(2906002)(66556008)(186003)(6666004)(26005)(66946007)(5660300002)(4001150100001)(66476007)(8676002)(44832011)(16526019)(31696002)(2616005)(8936002)(956004)(52116002)(31686004)(6486002)(478600001)(6706004)(53546011)(316002)(16576012)(36756003)(86362001)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	i6D07sceW2HwFGX4MLsZs1vWnbrf0iN+bnj53auTda2bULMrbBV2Mu8tx/izQ4cZ2KYrYJX3uenYUR5hz9nvADgZBb0MEoLLnw4FEQ6Z2nL6SiaE4j1SVxP2L8bmAnDozK0TPVIfCi16ID30SdpWAHbP6ipFa3ivLY9VHhrQm000+17jpbhPrDIOrNLM09SpEQE6uBqULHaPmg84XskrNj4reluA4o2VEylmYmbPx1H/1IgHskehJ5sx36SwQSSb53+Mcg+MIL8WiGznDCkjV0NlN1xJtEhMBjDpWbbMjCBlUmShhv2Zf0/5p37OqQvhiM4joWEMizPo32Y695tZqbt/6TNBFGa2rVTU+3e3hdi4t0U2dzsvn7BGhONTp+UDgAIJxNXfxteYUWcYfu1S3Tgw0yPb3xnMpLfZLoaRcsHJQ3NwyvKInPTCCjA+cVnGWS9sCjVpEuUcnxe8Jee5lTH0LIniIhSDXKjSv+rPXh/NtZIZb0vtzBjKvedHTDiMOaPST7LkNCzuJVJUpHprkORC5xMiYMyum/ymeA+x2fpVxQWwA+QFk4shvOUZJE4P6dPj/57kVTorHxL2K7aFmjReQyBZ2VhKFAzCfs/PDuRnSrgWvsjEc8SbPt5JGoPa/6m+hSyGgFR1S0J/p0QxqgYC5xU9jrstFoFbx/rWZJuU7Wh4INWf1T+GHLIEOII8IDtl/SiduYf6cTLtUAYoqGID8v0Xwb7uF8QUwPofPugRyD2wSdzp0J72Umvh8nVPNI4Bgpu6yOFAm5s3KR+hSe+/fefuQuW0Ljps+BVjQdTnbQ87za7EZxO4TbGV2QjuGP9giDzvDeicXOl9qGuCmQZvDe7TUIpyyNs6XxvMrmnNfaq3Z+0TmghLHXLm9gsPptenIUTy21ulAGCWQusq4g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55b4523-1748-4318-7c87-08d890dbac4b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 00:47:24.7004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQqy0kxK/Wx27BfiB8ncu8OIscrpReNUqEVKtwKdlWNTBJOAakbqZqeIKTFpNLQZDWCkmltAtVkmTL4eFCs6MU3UogjYAi34A7dbCzCz+Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 20/11/20 7:07 pm, Richard Purdie wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2020-11-19 at 08:48 +0800, Changqing Li wrote:
>> fix below error:
>> wic ls ./core-image-minimal-intel-x86-64.wic
>>
>> ERROR: Can't find executable parted
>>
>> wic depend on some tools like parted/mtools/..., and we have those
>> tools in native_sysroot. so above problem can be avoided by
>> run command like wic ls imagename.wic --native-sysroot <path>
>>
>> but this cannot cover condition that usr don't have build the
>> image, the image just copy from somewhere.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
>> b/meta/recipes-core/meta/buildtools-tarball.bb
>> index 560b8d67b9..7783fabbf2 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -29,6 +29,9 @@ TOOLCHAIN_HOST_TASK ?=3D "\
>>       nativesdk-rpcsvc-proto \
>>       nativesdk-patch \
>>       nativesdk-mtools \
>> +    nativesdk-parted \
>> +    nativesdk-dosfstools \
>> +    nativesdk-gptfdisk \
>>       "
> These sound more like something which would be in buildtools-extended-
> tarball. Our rough metric for inclusion in this recipe is whether the
> tools are needed by an OE build and these are not, they're only needed
> for standalone wic usage. I'm therefore unsure whether we should be
> adding them at all.
>
> Any other opinions?
>
> Cheers,
> Richard

ok. I will send a v2 to add them into buildtools-extended-tarbal.=C2=A0 Tha=
nks.

changqing

>
