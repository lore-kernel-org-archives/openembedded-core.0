Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.86])
 by mx.groups.io with SMTP id smtpd.web12.52642.1594018520621194905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 23:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eNQSvyFS;
 spf=pass (domain: windriver.com, ip: 40.107.93.86, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8Bt8lQHCbSJHMcwF9WnIn6yjqPy6hptncJYbdRwFpTpm7RyeA4bAkqaHCZpwfl4Qlt5zQeTQEIPCH/4x3ROjlEXEUF4dYXL92PzCCQzHvnEtra03j0ShJIeXcS1l0anGpVnG1zpQlMtIipYCFw8gmlwxwtj02cwaPK00F2gZQc3LjA3s14RqMQTW3/6Mt6mLbduEi80qIpky/zBjFdEIlcIKn7brwGcFfaRGTWdkJEbvhI8FpKL2rgdjWiSMeTvV3wHTXfxc16OnmFufzeUTzlNW+SaMv6utZPC2yXDCl/VJvdhS+VevkW9bXudtKlfHXT1cPtXLTwwDkC2CXrDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjFZG49dBVnuDQkin0Gk0BQ6xpw7pGq81GpmCY5KyWw=;
 b=KVv3CEHLXIownImKAvy4Aor1Br0wgOM/82WHgeFBxQ0rvgSqCp6VEnze4b262YsXjUxVR1aLl6ckCpnZstH180/dCjG2JLaDNMNepeke56c+ORF+THI+im5m8SaKfaNJ+oxcYfrl0Q/5XxHaCL5aGFrq3Uk0jI+g1tB5Z2hqpXnYSPUqzjnIYlr5MkJVatJCFAz6eteP1d3RnFjhKUlbvZ2ZwT1Nuh/s8mgPgYSfVGuaL4inntPe7bLZ2Q8WBKaPVrUz2P2Pie0QhQ6+PY4LI95Bl0jmd1PLOe/PzvmKiD3Gjb8BZ7xtZFAY4SwQHcIUg4dot1Q9sM6ZoU+q3o5sIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjFZG49dBVnuDQkin0Gk0BQ6xpw7pGq81GpmCY5KyWw=;
 b=eNQSvyFSGQ20JZgiTEKmHEZ4xcqyP9KDEAh+DksGSf+6QAAxyov5wPX8uU3Cj41kjtMR7i+dNgvmNO7sYcDdqZC+QyvDttgWo1UyaBY0tq7js0H67BUq0StZvZnyFP2dSyOEojIE5ZxhOQ7wTHHJg7k4IO5lEEPlj5PpPhieZ3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3032.namprd11.prod.outlook.com (2603:10b6:a03:8f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Mon, 6 Jul
 2020 06:55:18 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 06:55:18 +0000
Subject: Re: [OE-core] [PATCH v2] netbase: use git fetcher
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200629043119.1798934-1-mingli.yu@windriver.com>
 <c3e569088010a8242703f559f99de658e427f32b.camel@linuxfoundation.org>
 <3c5fff8d-aa64-5f36-7db1-2570bbbbf520@windriver.com>
 <aa8752ad52e2075016d4f14b84bbef8e9b40b7cd.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <86d83844-062b-ea35-4971-25c0441d1b88@windriver.com>
Date: Mon, 6 Jul 2020 14:52:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <aa8752ad52e2075016d4f14b84bbef8e9b40b7cd.camel@linuxfoundation.org>
X-ClientProxiedBy: HKAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:d0::27) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HKAPR04CA0017.apcprd04.prod.outlook.com (2603:1096:203:d0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 06:55:17 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf2b356-7063-48c2-f3da-08d821798b1f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3032:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3032F1BAE40241AD3954BC79F1690@BYAPR11MB3032.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	an6R33OWAfNe0FlVN50EKePrYDqRiJICtKxsTl82WQnNquX+SMaPgndXM/FNut3icxIMj+p85+liB8EKJZ7+kyHGUGn6mUvws0T2BlM/JESexOL+Fhzg1+BbywQZ0Rcyc6xdxYu4uzF6xjEqPPy3jwc/IWJxSG8HGKHNOPFsUTTs8tfW1rWqs7wiOWSKq2+1YkIj7I2dG1R7r0AAQWDpX+E8hXN/YuDogAwWBuYohN8kzzgyqOjaGK4X8Ft7Jvirg+/OBXwfreIcwP+of2K7qfleBx7CliXvHTqn8MFJ0p7Fl+HfdqPpDQlIoMqSFS+HHlXD47g14rCK5XPO3bR5uPS0pwA6q/uin95PCbeaQRMsBUkFBFtsVhzkaW1/+ZyVjMalrIP7uvial0mygFHpqwfmG5sdBxFTgQUEwo3HLVBZRSBe5g+w/gx0YOdjpm7zpW+fZHOtfXsiu/hU9/Wj6C6hkFWIkNWpcsCxKAoEKSi4XnaH4YLNSB+5dVxZxK23S6NH4Dpnl4JmhkOjOi/JTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(396003)(376002)(346002)(39840400004)(186003)(16526019)(66946007)(8676002)(6486002)(66476007)(66556008)(8936002)(6706004)(36756003)(26005)(956004)(83380400001)(53546011)(2616005)(966005)(478600001)(86362001)(6666004)(2906002)(52116002)(31686004)(5660300002)(316002)(16576012)(31696002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UENNJeBYiNTYwvTQC6n4rGUyNhEGqKDiSHjobeCSem9NDUfTkG8SdtyldHUkDB7NIARV+ye9zJxeKOeSbpVOwg4AqyNO9b4Nc3ySLrrZz1eBQ5QkRI+YbHgW1AjFJHvSrYNS6BAMIdr7lbC3B0FDXpgKqyJBXTv6IQcHRHESaGVNoSqwSAWAQ7EGx1yXuFdaMlo6dUqIGEs1/JRI0+C3Ow90hLhtHJZs5FQ0mJLcZqOhZV6jNgJ2X0Y+lLlAgHgkcMgXHxq4nC+HLUg6916oaV0xp8jkuEd6CNjrP9mbulNgdoQf/gAUAxBrvz9ps4dLxNTd3XLRZFoOBW3zu5IRxaxq6gTfrOD54gan7z4WhWGkP6DckK46Wy778E5SO6ylJIeKPcjwvRcIvu30vOtkl0w2YMulUsgSttI61kR+CyCiJQunmCqwvCMSWByzvQ2SxpPOcfLvS8x3/OZMpbPuS1lTKiC6GlAbOj5BCTmVXWE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf2b356-7063-48c2-f3da-08d821798b1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 06:55:18.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4UtzEHEYlunFuVetzoyZb+eMZNbb1KiT5ioz/csk2ebGg+sSEz9URiBh6Htptv+5ZBPA4Ty1802FE9+ADC/Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3032
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/2/20 12:35 AM, Richard Purdie wrote:
> On Wed, 2020-07-01 at 10:05 +0800, Yu, Mingli wrote:
>>
>> On 7/1/20 4:08 AM, Richard Purdie wrote:
>>> On Mon, 2020-06-29 at 12:31 +0800, Yu, Mingli wrote:
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> Use git repo as the the previous URL only stores
>>>> the latest source file and fails to locate the
>>>> source tar file if we don't upgrade timely.
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.1.bb
>>>> index bc0049c020..c13685e8ad 100644
>>>> --- a/meta/recipes-core/netbase/netbase_6.1.bb
>>>> +++ b/meta/recipes-core/netbase/netbase_6.1.bb
>>>> @@ -6,10 +6,10 @@ LICENSE = "GPLv2"
>>>>    LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>>>>    PE = "1"
>>>>    
>>>> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
>>>> +SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
>>>> +SRCREV = "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
>>>>    
>>>> -SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
>>>> -SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
>>>> +S = "${WORKDIR}/git"
>>>>    
>>>>    UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
>>>>    do_install () {
>>>
>>> This still breaks all oe-selftest:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1095
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1087
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1083
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1098
>>>
>>> oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
>>
>> It's weird, I did run reproducible build locally with "oe-selftest -r
>> reproducible.ReproducibleTests.test_reproducible_builds" and It succeeds
>> at my side.
>>
>> BTW, the netbase only introduces 3 files as below:
>> # rpm -ql netbase
>>
>> /etc
>>
>> /etc/protocols
>>
>> /etc/rpc
>>
>> /etc/services
>>
>> And I did the three files' checksum and the checksum turns out to be the
>> same when with the commit and without the commit.
>>
>> Anyway, I will investigate the issue again.
> 
> This is the diffstat output on the result:
> 
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200630-_jn1koza/packages/diff-html/
> 
> It shows this is a timestamp problem, the timestamps aren't always the
> same. It should be using SOURCE_DATE_EPOCH.

Hi RP,

Many thanks your hints!

But I still don't understand why the reproducible test succeeds at my 
side and the corresponding SOURCE_DATE_EPOCH in my env as below:

$ cat 
/builda/yocto/builds/poky-build6-st/reproducibleA/tmp/work/cortexa57-poky-linux/netbase/1_6.1-r0/source-date-epoch/__source_date_epoch.txt
1581895519

$ cat 
/build/yocto/builds/poky-build6-st/reproducibleB/tmp/work/cortexa57-poky-linux/netbase/1_6.1-r0/s-epoch/__source_date_epoch.txt
1581895519

Thanks,

> 
> Cheers,
> 
> Richard
> 
