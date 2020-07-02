Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.51])
 by mx.groups.io with SMTP id smtpd.web12.2895.1593654882699337060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 18:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jhpYMx6c;
 spf=pass (domain: windriver.com, ip: 40.107.236.51, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEPmugawhQa36tsTUKNWhjdvAms554nXQOROYT0lwF09U84J6SoOeewETWA/PkXMEyIA3IBrCHzPR2cdYoVTl6qtYmyh1gs6nzMauD49/TA2f2CNhTmbHzV9dbbV0+mzSUqzxdXEonsus8kOPQFh8I5axHZu8AR+DmysvX6NWq2XU+ziY5CF5TemTsnjJwvhQ/ZVZoGeb63rxMCURmjzYFFFYrSPaG5g593oLvrFic0tn7LbJzu/noSlNg4uOv47ANpUiuJMenh89eIswDuQ6NFvK4q+SGgNuAV+4Xi2psuyT0fcAfNR6kEOMk0B8sPKJLjxZdRDr2CiGapItsaNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNb6UyQLeUoolnRuBNHx99koZMHA4Q37qYaa0i3DaoA=;
 b=I9Ey284ifBvfxTNEf2DsbcqzSwmp9ENb45YdNPuzlU62uLVfuRpYZr73biTJYPGhL8DVPzQnJHe70auY/Jf1Hjo47mPgYyMLOP2cmDGbQr+iDxV/WvQ/YGUOyCjHw+N9gUUD+eLlKtFyqBa9xg5wJHS+HzSSiBsfJx37usMJmi5av0WRUQVCHTir0gcRabtfQP2mAn1PoBy1/12Nnf8DkWfD9WK8TB0NyKwnnIi8yGzTdtZpCM/vWV7LgCBYIDNhiV7+l4Np6P4HEh5WUV1t5koTTvkN5HHnQdKUlUOaRyRT/gC7I9NWAXlxLnxGqvYPll0XsfXrm7MrYT9TCai9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNb6UyQLeUoolnRuBNHx99koZMHA4Q37qYaa0i3DaoA=;
 b=jhpYMx6cOapkQ1LaoTPkhikMHfIqP6Tei0JvaVIGFLucIZaWEqDb1/z0RdZoq5Chsh0fyuMrX1TuLQ6bIziRkspb9d8w0AouoZkjzduStV/dkwtxuHCNyY+LT+jz/uLBd9wYUnLTljCXQQI7DKEWSifiFp4+uCP2BLvsRbYJ7Hc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Thu, 2 Jul
 2020 01:54:40 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3131.030; Thu, 2 Jul 2020
 01:54:40 +0000
Subject: Re: [OE-core] [PATCH 2/2] python3: add ldconfig rdepends for python3-ctypes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200701023318.3887430-1-mingli.yu@windriver.com>
 <20200701023318.3887430-2-mingli.yu@windriver.com>
 <77a85da756bb3519f495da8d1653f98ae439c771.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <37b8eb15-2f6e-e4cc-12f9-a2e99ac5dc61@windriver.com>
Date: Thu, 2 Jul 2020 09:52:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <77a85da756bb3519f495da8d1653f98ae439c771.camel@linuxfoundation.org>
X-ClientProxiedBy: HK0PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::21) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK0PR01CA0057.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Thu, 2 Jul 2020 01:54:39 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceb2c9f0-2182-4890-39c4-08d81e2ae215
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226799DC39857FEF4BA907BF16D0@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uAadwcZShWM/Qg6UzwX6rWn8iymzfNFNUTnxgPsAAwBiztCgkOVJsZcArYzz7aZHeIQoh362CpSkVloBDUush9fcNalsxhVpWMW8eW8y23wk5ZygNTK7Teqk6RZeIEk0ayRCp19bETvygM9k2uPxr2HQ6X0YCZB40jIRHQWESWKvci2Maw6Lx7+OXHqwTdv9+2yEQy5CxjTQMWc29GdZomdndrHlgX3iiorHBnjM3DfnY19NIsoyZfzl/sajTaX/I2cxo0r49KhyBXbNJIS0cilnDOZBhm6zUh+SOLStDdGHMpxWWmt6TYMucZkrfcjGUltIX3EXTQ+jUavPEDxtcstaVrK/dAZRv9WX3ebZbgBYVePz8Rs0HSvRYx86FP1NHHLTuv25BUttALZubbKbAeAkdg9UQOCsOCf/wu8eMgQc54Ag8E7bGcUS4JarVjFZzGqasfj/2uS0bhFdjZHsHsHaGQTxuXEz1PmeOAEK3SxMfG3s5Jkby5PYMwpp0BIgOtqtKjXq76M9VntT27W/lg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(186003)(16526019)(6666004)(36756003)(316002)(8936002)(53546011)(26005)(16576012)(8676002)(31686004)(6706004)(66556008)(66946007)(66476007)(5660300002)(83380400001)(966005)(478600001)(31696002)(6486002)(2906002)(86362001)(956004)(52116002)(2616005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	a/B37stFHbkybYOibWLScf+EFS2VYzwjlE0Xpq4z6HppNVzKaQLz6zP8XTrpzAWcOhmPCu+RLiFRhrozqfSYufPA8HzZmUKcDnEy7Fx8ttfR9PJQGwJ2+9zvqZkJaUITSwfT7cg0oybQdUpNrc4ZYfJuCC5iaEBYOtG/OfZgyyw9c+DNDIvUZDlRcelxyV+44jfXNQMWIutY+D5E25Ror19NyZkf8JEoA+UYxKm4VNl8zDMruaCpX5sbBThyZWAo3BUYzSlmDDCHBJBCpBwtQfO9gYOB7wh+xz3FBAELWh+ARVOTJOZI/6cYz7oKaewrqLAJLJ9/lwBMjEAkI8lx6steQFOd2K9+2fQOJj3Qlii7exz0gLaaEhRi1aMvW9zswayDeXHvRvqZUUQbuNDyytchl6Zyjl1/Et48RVYMadwX1mtjXJfp4M7JEAdI7mCZeRz0V+Qgpa+CHZLsE0mIvSefgRWslGsEVFL55qNSs6w=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb2c9f0-2182-4890-39c4-08d81e2ae215
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 01:54:40.5445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjI6npdSkwLH+ZnIcox+MVT0D4bU03GSAGSrQTOoHgw0CnzZWpIbDM/IrtB81ifN33Fam9Hs0vL0IOhbVYsa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/1/20 10:20 PM, Richard Purdie wrote:
> On Wed, 2020-07-01 at 10:33 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> The ctypes module needs to use "ldconfig -p" to find the
>> library path and it simply has below logic if no ldconfig
>> installed.
>>    except OSError:
>>        pass
>>
>> Before the patch:
>>    >>> from ctypes.util import find_library
>>    >>> lib_path = find_library('archive')
>>    >>> print(lib_path)
>>    None
>>
>> After the patch:
>>    >>> from ctypes.util import find_library
>>    >>> lib_path = find_library('archive')
>>    >>> print(lib_path)
>>    libarchive.so.13
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python3_3.8.3.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
>> index 2eb2a422e6..abcd16e63d 100644
>> --- a/meta/recipes-devtools/python/python3_3.8.3.bb
>> +++ b/meta/recipes-devtools/python/python3_3.8.3.bb
>> @@ -350,6 +350,7 @@ FILES_${PN}-man = "${datadir}/man"
>>   
>>   # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
>>   RDEPENDS_libpython3_append_libc-glibc = " libgcc"
>> +RDEPENDS_${PN}-ctypes_append_libc-glibc = " ldconfig"
>>   RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
>>   RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>>   RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
> 
> Throws warnings in test builds:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2123

Will send V2 to fix the warning.

Thanks,

> 
> Cheers,
> 
> Richard
> 
