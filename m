Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.75])
 by mx.groups.io with SMTP id smtpd.web09.3254.1609987515160431737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 18:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EyfGsdlt;
 spf=pass (domain: windriver.com, ip: 40.107.220.75, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRb8vnBdEdmb4vkun4NQ3oMj2IOEZhuUzGo1vsAcW1gmpbD6+37LjVsWPULIXsCdyHVACfKAmHCQRh2K9tJ9X5qgbELxGmUrxxA0FoxZAhuovWwgl76eAna/3AAaGiBlKTGr14wivl5RwYn1rX3zCEPn7c3hjkcBus3E0XcMIm0rqr87kpcfeUiXhFu+5dzpKdFtwo5cwB3AZPF+nX2HGOFCbxsXCxnouMGwA4lsEPV6pu4MOk7L/Eg5eWvzK08IFd7oyf/MDx3XXKq8Jo218X4ZBySGsHFtir+ospvMRVICcN9kTGbM2foxBxp7jMI0bxKExzCbIn7gXg48gPCzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FupR5JEKCahUwEjsxn6ES9h520lIZAXa1ledzJARAvM=;
 b=FdgMPo9DyOHAVqc3iHq9dXbyT1DditCDCpMtBAVE2MCMa2f2Hiugqr2QzDz87WVrQnxbeCgc38co7b5C+mNFFz1YF+eTEe/JRnvHKlutgbP8nsuXlG51DFEh3ZonYj3ixZ3M4x+80LMecgvDCRgbCkuL+IeefEzs/VV3aBSAVpYtTVcniSuvKw3MKrPPXIZKHMSZms5uEQx/h+LKWAnILhpjw1o8HVNU/bvPsszr1BCP62uFHpINmiar4og9QMMy3haLHgFOQF1NfT30AZt6DnN/RvYpUvjT1N7fairMA6SWGTk9RQlksa0eFdhbj2OjBqi8HHEtlhX2yvl2cHLitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FupR5JEKCahUwEjsxn6ES9h520lIZAXa1ledzJARAvM=;
 b=EyfGsdltJEH+b8bFoTRkZPplZVUIf9QzJs5CU9U3IR+R0LK3AWp5/CQUUh436ArCzQw82KyC2Jm49kfAg1CqReecTJVYvFLPzgfx/Bt2HbjReBBJl9FXltV5GtfS5njX1U15s8u2W2uT4hMN9z+eIW1M+a8Yt+NnT4ip1qzVaSQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SN6PR11MB3213.namprd11.prod.outlook.com (2603:10b6:805:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Thu, 7 Jan
 2021 02:45:13 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 02:45:12 +0000
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1609934927.git.liezhi.yang@windriver.com>
 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
Date: Thu, 7 Jan 2021 10:44:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 02:45:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a12925a-3eac-4d0d-acdf-08d8b2b641bd
X-MS-TrafficTypeDiagnostic: SN6PR11MB3213:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3213CA2B2679A02F04E2EEB8FFAF0@SN6PR11MB3213.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tzhj+VhjtAbXKb9yHsLSj/3LGR5zueYyMA56+7jOUHX8kUwlkrUdYX4K11SmCV5aVbBSp5sd2qt5Fkr4v160i/1xnmB1enDc0BdOYD1qSWQ86l6Zl5jmxbvc7JasgOdK2ulqKXYtZy9qfQ7Wwd7XE6YPZZOnwY1QsQ9WJ8+xbrVhdK825/hKSvPkLVDbmxcmFxiM4OAIF5hjOEQ5DtCu7cPxQa/6Xdk3liZB5czHKg+THAOQC3Jmr/mdZUjoY/saWNeeeiXgng+DKI2qraD/VnFnT2dsP1u9YeyolPITiJpEYRTtA/O/MWbRYtnyr9Mlng64uSb2h1veYI+7h/x7qXljB7vXo/VLFbujRCGaYkJ6tmohMmVBrgq6vqQBmcpWvIw8e3Y0fyzdCbkot2ELFkm3Az73RRnboILkSFBynoTsg7+k8k1JDTLsiTqkDgzUg5KyEZZKYq2bF5WHGj7MZGoa/zyjb7z69hLHBEdBt9b6CNJiLVoO4kreUJMtPGLL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(346002)(376002)(16576012)(5660300002)(36756003)(66476007)(66556008)(66946007)(53546011)(2906002)(16526019)(8936002)(316002)(478600001)(186003)(31686004)(2616005)(6666004)(8676002)(31696002)(52116002)(6706004)(6486002)(86362001)(26005)(956004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?87hXj4bD1Z6JOJ0zjcYuGRWGxPr4TiVz3jfhdKkQKjd/pXkqg2AZSdtBz2yy?=
 =?us-ascii?Q?s46Xgzmo/s3vVK+RKciBPcwvCwA7F56+0FM9cg0kQcqKj5joD2kgeiAcWu11?=
 =?us-ascii?Q?1KzAAlG5lpYO2tTQf5zZx7mFaEO0w7/nhRhuMY8d8RJuzT1ZtGrp82diZA2L?=
 =?us-ascii?Q?F4j8fgcMaknGyeMbaShzUn9UrmJ2WxAMcip2+HqhyOchnSNSWse8ja2nGQNS?=
 =?us-ascii?Q?1pBLRIvKJGT8Kc/8j6LGaVCX/DcdpE3ZEZDj8eW+sZhTS6gLKF4AL23xdYH8?=
 =?us-ascii?Q?BRoOqpu6oV4IraxWUVcoustz1FNK5lf1EiaYSkifW8MEusml8GmqbFmL+UGb?=
 =?us-ascii?Q?j8iBgLpHNHtFhHzlYKJqUfdKUw8uLOfH1AYqb5SHm5La3oIAWfTiFw2WZJPz?=
 =?us-ascii?Q?IP7HEOgfF9BJWsjaeVxChx8gR6oAyGWSAJ4wUe8tPUX/Af5PsZQnDnfacjae?=
 =?us-ascii?Q?0BApFo1/krwoBk9CGj8uQzeP19zoBUzBKNeqlXX4qbL9xTU5U4okaF8iDOxX?=
 =?us-ascii?Q?U6hZNB9nUu1c/tnmah6cwIdvssquFRbiG/6HYKlNN1zOIInFKLpnu1lhwaY1?=
 =?us-ascii?Q?wZjJBqlHYTqRKEnQI9RVIqtFNxjGbMAoqnfqv/tXT4EbwEFz2xEI8q0KemV7?=
 =?us-ascii?Q?Fut5G818KqjdgKSL/e96a3uAdaOilmn78+E6+Hk3S7qCQLY+0Pwt4CKMb/mK?=
 =?us-ascii?Q?+dEQ8fC+iEvRI5Jc2yVkk5NX9l0aUMvkW3Jf1r4YIZdTVylFGiZDy8gxr+8m?=
 =?us-ascii?Q?minLvtGLQ+4cLrSb0z5QVJRRH99y3KrA2iab6Jy9mw29QaJ3f/+yUG/ce/E0?=
 =?us-ascii?Q?Yv9MDG7JetOETe8ubqXD4KpmcPZCpD0m4F+X6Oh7J1gXYXOlm59Fx0f19cP4?=
 =?us-ascii?Q?Kacdu0jKwlo3zdRhsrEs/Uq2xvB8hdBp9xwsxM2/U448rlksOSmwCZr3b1o1?=
 =?us-ascii?Q?WdlL86QrRPpsRovFkZfy/LIuTaACRMKhBCe4w6Uhmbl+0yBPTBDZTtwG8xh6?=
 =?us-ascii?Q?Gjri?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 02:45:12.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a12925a-3eac-4d0d-acdf-08d8b2b641bd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KANgzaJ62IrwYnNKOBaP0hwW4wtBr3sN5D2PYhOItLkkmHJ18LejmxI3/gbcfv3MzDTSCi82YtlJ3JFpBleYgsNsnipw+tfzLeO50ah5gOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3213
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi RP,

On 1/6/21 9:56 PM, Richard Purdie wrote:
> On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:
>> Add it to buildtools-tarball so that there will be a unify version of cc=
ache,
>> which can help avoid various compile errors.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>>  =C2=A01 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes=
-core/meta/buildtools-tarball.bb
>> index 9da81d55235..2ffdd7c7253 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?=3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-rpcsvc-proto \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-patch \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-mtools \
>> +    nativesdk-ccache \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"
>=20
> My view is we should not start to ship ccache with buildtools by
> default. Its something that the user can install if they want/need it


The problem is that user installed ccache may not work with our recipes, fo=
r
example, we found the following recipes failed to build with ccache on diff=
erent
hosts:

cdrtools-native
fribidi
rocksdb


So have a fixed version of ccache can make sure the recipes work well, it a=
lso=20
helps us to reproduce the errors easily when user reported a bug.

// Robert

> but its not essential, required or helps much in standard builds (which
> would reuse from sstate if built previously).
>=20
> Cheers,
>=20
> Richard
>=20
