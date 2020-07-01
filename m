Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.67])
 by mx.groups.io with SMTP id smtpd.web12.12397.1593569238437235987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 19:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VatFCiyK;
 spf=pass (domain: windriver.com, ip: 40.107.94.67, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISttpfrf7pd+GRGfJUCoL+oKNvxvJ13MeUlQ/pCyabtnZ+kWxZZUbbH/Q9LTCouck4pe0j7UvtPR48EGpxuD5rmmOkCR5G3K7NPfpc/Wjz7pbNjrqfmLIbeipI69HnUJ/V9tiO9c9kT/038hQTPOZP9k8L6PESJaOyLMBu2XJy2Cc6/Kyqx+5YTJAPtz/OKmSy3Itu8lrVNSHY6EG7rUe4egVB/lTBjY8Z6jtWr3+dCWJs83fqGZU8vAKAW12p52lKxBsBIDRB5vbartt+DZX+x1JXiw4vFOrZ0ez6b3ePp13Ugk5Yv+qTthrb60eCShZmLVbHMqOzsT9VqkRo7CSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4y9BbCes2jiNJrMAyryLy2esMP+8or9qX3fmMDkuv8=;
 b=jV5JdFXfzjRHRQFeMnVPpszolMjke/sVSlacPq60VfYD72HWuUSyvIhDjqE/IWEy2xN4kGP49eg0RLXKXz4VsCCYnmtI5NTkTOR4ltWCBIbvE+wX99uZSSuyGikykNSBPe8icBa/k08eTt8KxIbm3rXfZHujNs97qGI8Lu0vX3VjVjHM4Mef+4JdtnWeUJWWxY2GDrXlwzpxixL8cVs4TYQil1mAzenqvca3jyj9kIfzzg5DbcsuDQmSkszPOYhWWMjZIDZzGWx6nXQe6ETRZCk5c4sbjKRnxe6njqXVRk6qDaN9zTI1eyMd6tzkhtEXycuPRyiISwsSI75JcVtVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4y9BbCes2jiNJrMAyryLy2esMP+8or9qX3fmMDkuv8=;
 b=VatFCiyKefOGGINjZ71ZqiMQmf1YUNXHFvqEvH5WdjI8+gmjpd7w8DVoWz9QXTLQRa+r9msysjxBpZ49slK0dwpQVEjndTdZ073fAWskSpGRsC8fSS9+Bz8pMUPzhRDjmwVVrIkZFi4lTWVCqCNeJf5gquOar/btJcQ2+8Bm+HQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2596.namprd11.prod.outlook.com (2603:10b6:406:b2::20)
 by BN6PR11MB1268.namprd11.prod.outlook.com (2603:10b6:404:47::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 02:07:15 +0000
Received: from BN7PR11MB2596.namprd11.prod.outlook.com
 ([fe80::e18b:a052:267c:beb8]) by BN7PR11MB2596.namprd11.prod.outlook.com
 ([fe80::e18b:a052:267c:beb8%6]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 02:07:15 +0000
Subject: Re: [OE-core] [PATCH v2] netbase: use git fetcher
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200629043119.1798934-1-mingli.yu@windriver.com>
 <c3e569088010a8242703f559f99de658e427f32b.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <3c5fff8d-aa64-5f36-7db1-2570bbbbf520@windriver.com>
Date: Wed, 1 Jul 2020 10:05:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <c3e569088010a8242703f559f99de658e427f32b.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR0401CA0021.apcprd04.prod.outlook.com
 (2603:1096:202:2::31) To BN7PR11MB2596.namprd11.prod.outlook.com
 (2603:10b6:406:b2::20)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR0401CA0021.apcprd04.prod.outlook.com (2603:1096:202:2::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Wed, 1 Jul 2020 02:07:13 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd146db-662b-42e8-9ad5-08d81d637948
X-MS-TrafficTypeDiagnostic: BN6PR11MB1268:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB12681862E69C1A7B5ADB4734F16C0@BN6PR11MB1268.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oVYjOeThFeJNfU3S0Mmmm0Z9pYKngFTJ9stRhpIC0pVziBJVV4seOO72Fu1DC+yqYhkEYhCCNThsRq+M/uS84SE7yZL1LUJKzLF7pEs16LS5G2u8tt3c57jFfoYkaP3ssKCKzuJ6LUUjhfoh51qVM4DX1YVAOUgvs9coqoJPOyPEUU/45Mb8qF4ebUXzzEoiYSbifIdUXG9I3z5CKPmJcJYlKMdsits2P738j0hSLc9YsnvQSojotWA9/XAtrVETMoy2KQAS9JLDXumO43NUu2CNnVWIKsVngF4zhh21/oDCuzajYfIvYW9bR1cTFi0oDBd9FQI32Fea1zbJmRy7UssLZ81BxYsXrs5IKf8bHzyhbBXusaYOQLnXebTUINJUETgDYJ2ciuTGrzc5OIX/jHiMOlj23KsAZdw79o05nLMz+NEHaJZY7lCiDUB0VqFBl2lRW77cSJF5HOi1KHwbAwbN46/WYG5OBgfhgSmMxkFGk/brmfSxXTCjS68WbDjKPda/Zv34oMOOfDTAFRiUjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2596.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(366004)(39850400004)(136003)(376002)(966005)(83380400001)(66476007)(66946007)(186003)(6486002)(31696002)(26005)(16526019)(86362001)(66556008)(5660300002)(8676002)(2616005)(16576012)(316002)(53546011)(52116002)(6706004)(478600001)(2906002)(31686004)(956004)(36756003)(8936002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gxJ7lj7iBsETZ+TzGxLc5ntMlycsCj4wpnWQP8h3yPMU7OeSKmXEWy4+y4gfqaQInxPTfrpkbzA1A/PMh4HJR7m9GO9JIf7wgMMOQQVJxelefGsLBcFTNTYiRgigwd8QSKisxvtX791bTSJgWSHo57ObCsvytxnTPu9zW3DtqLTJA4QmeLoXbdzcdOEqgoTrfsiU+E7ulbf7X0QdmkgDvuzWxVqsKlQPev5cl4M21Ir5PY40reeslxj72Nni2g9F57XCj9zvlxT0s3/kAkXcLk1VzRBinyyXlf/rRq3oQQSztMytzIYdrfTvyIa1OmYdj66oZnu1PfjQZl8b3SlQsr5aoNvu0RuQ39LEzHazjSYCleMYBxeqcil3HSNBsFwVV1cskEjfywAscxPXyDXEZ6oQ+3BAS9qdeNdL57qAFdUsPPRz1Ul3r/jB7mDlTMKqvSWJl5Aox9QU9K/4vCSKIoo9EMChGpurYYogy9eBWgs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd146db-662b-42e8-9ad5-08d81d637948
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2596.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 02:07:15.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTftw4j7MbxiHCvvuWUKkZs68D2835hqpdGLgukLmKtluw8JSY2a8B2MLPsU5FafRcKjADXXBE+nGD92EtkJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1268
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/1/20 4:08 AM, Richard Purdie wrote:
> On Mon, 2020-06-29 at 12:31 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Use git repo as the the previous URL only stores
>> the latest source file and fails to locate the
>> source tar file if we don't upgrade timely.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
>> index bc0049c020..c13685e8ad 100644
>> --- a/meta/recipes-core/netbase/netbase_6.1.bb
>> +++ b/meta/recipes-core/netbase/netbase_6.1.bb
>> @@ -6,10 +6,10 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>>   PE = "1"
>>   
>> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
>> +SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
>> +SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
>>   
>> -SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
>> -SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
>> +S = "${WORKDIR}/git"
>>   
>>   UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
>>   do_install () {
> 
> This still breaks all oe-selftest:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1095
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1087
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1083
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1098
> 
> oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

It's weird, I did run reproducible build locally with "oe-selftest -r 
reproducible.ReproducibleTests.test_reproducible_builds" and It succeeds 
at my side.

BTW, the netbase only introduces 3 files as below:
# rpm -ql netbase

/etc

/etc/protocols

/etc/rpc

/etc/services

And I did the three files' checksum and the checksum turns out to be the 
same when with the commit and without the commit.

Anyway, I will investigate the issue again.

Thanks,


> 
> should reproduce but regardless, this *must* be fixed before this can
> merge.
> 
> Cheers,
> 
> Richard
> 
