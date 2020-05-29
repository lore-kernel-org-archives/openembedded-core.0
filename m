Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.74])
 by mx.groups.io with SMTP id smtpd.web10.34479.1590758976312116749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 06:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OOz41v2i;
 spf=pass (domain: windriver.com, ip: 40.107.70.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWCOIy/e4JaN10oI8tPT4xTNv8TIt0AhV/xN5JTIgIfQl4D0FAZN0ohSetimo9fMsXPO/iC42d42N1CYOY55e9kD2gyNjda/3AL5xOAz1ZFJ2NLMZZ+4zZn8j9Ja4/fCO7TRuFdkCe9eVjJ9x2Uxkkwe4/lE5oGEePsEh0jbG1ZdzuJ0OxRRkhxjSSYyVaKGNLvcTeUglia6ehpdB3WE+qPvUpRhGRXimGOMp68xWO6fFrTYirwyRbF4XwSF9flhDz66aJhZsP+zNbTMGp3zc/j+PmDQeR9sYuZPSgu+3yiKfsHbDPAlGxx9E9e99gTtfVD0kLT7WEnyZkPksPO6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUfogDyXUMze7tHk/xqhT9gsQxH1XreEQBCtb5oqLfg=;
 b=RoOdg0N9dRQCvr8NfB0OK0mP9clm+LH9MAFCqgUOv7CBsmggnY3lgoBvwgwRKYxM/20cPkHo6bXU/b7XMe4i2g122fpOaZSayfkXSTGd34FuOJ84YwPgSpoI0sKlPukJs8xNWM6QbENq/CNYZaeB5yM5j+P0emMxmNytPPy3y1yT+SeA74VQuO6b/thKtsT7oCPJdTqLexGKbY1hS6122qVyJGLxNIq4Xc3gmuc+900Yp0AeyFgsCj6ZhB2zNRP4gNiD1v5uNlvSgY7P3RMoskwYU1fb9sz/hkMrzyGdnmZGvs91DhAIrJggFqK2Kg2mGncc8OgBBRahD1X1qyG6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUfogDyXUMze7tHk/xqhT9gsQxH1XreEQBCtb5oqLfg=;
 b=OOz41v2i2EutiZVy2NO31xkvYdo1G/McUAw26GaGuUxBNpFJjWxHdvg5wDZNQbjC8HuxEzbknJlXpzQMr1f8GDYwJ1kc7sarIczjENpVhBcG63dTzElak6cC+CeH5dp3yDyZeOcOlbbSsNRyYYCS51q22tTD19mTOZm1mfqD6CU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3985.namprd11.prod.outlook.com (2603:10b6:405:7b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 13:29:34 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 13:29:34 +0000
Subject: Re: [OE-core][PATCH] llvm: upgrade 9.0.1 -> 10.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200527134844.105405-1-trevor.gamblin@windriver.com>
 <CAMKF1soY7W40VRw-puspRKkmQ0FEiFk35=W_z=uz93Hj2mWVxA@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f6d9c9c0-71e1-439e-f20e-00f7cc721c0e@windriver.com>
Date: Fri, 29 May 2020 09:29:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAMKF1soY7W40VRw-puspRKkmQ0FEiFk35=W_z=uz93Hj2mWVxA@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::10) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Fri, 29 May 2020 13:29:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d89b94fc-1c7d-4e7c-b98f-08d803d45333
X-MS-TrafficTypeDiagnostic: BN6PR11MB3985:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3985F2EDBBE254759A3B9B969F8F0@BN6PR11MB3985.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n1oL93WQZ7T8yyBopZfx5B55hIwmGPvTTZbdKOVpDkRzX3lzhxdczpLEd21oY8wWN+gYbPbObDKbm0xv7pn/KX0kuRNIWt7OXtnPsijUGn6d6kw6Pyn3zRhZVWJe/DOLeFvzehtlMpDSatnZ5btu+/bzy4Fy5CRboJQb8AzBtXdR0GTL8aeDc9hxYv2G4JXregpUsPoOCyIkFVbB5FKfZYUWjjnpXOcLGtex9lXFOyamCnkurcC+wTmNZcGutAAawqNTRGhyp2FXFftiz6xj0hckEaAn3+rbApHtlUkH/MKeLJMNtqfsajR5NdjDttLw1b9c4K5+38ZoKDQxa1Yy4FYnS7ZUoc57w2GViroROyCUnQXSVIpC+SC9NDFTGkBtccq7mazT60CpLTzqiMmta5/reqNmAcujKVZlNXeDUxYc3g27SmHr4DLDP54SWNR1wveVzNqFRmorrQiVpMGicw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(136003)(346002)(376002)(39850400004)(8936002)(83380400001)(6916009)(31696002)(16576012)(966005)(2906002)(186003)(316002)(478600001)(36756003)(31686004)(26005)(66476007)(66946007)(86362001)(6486002)(16526019)(2616005)(66556008)(956004)(53546011)(44832011)(52116002)(4326008)(5660300002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nPTLA1U8VIV+1imQiGHw3sNXqslJSvIsrJLcF7cWHcLwK/hSbYS8uAQm90M1VHa5XmmZHh7FRU+eT7wPvJMVsnIIOWUgh+mZe4PVSyJ9bpeuiB7V+CEcFp13h2l/PBWA+BX+Sq0j40LTRNFpqnuNrXG3PkdRBz/Abt7R/OX2Mp0vy1bkeYZ1p5XcqCp/AUrxlEdnBGcWAo6N1RbOU2BTK5Y+Hg6HXS7k66M5fUdxj5Yg26BJMHMA6OSThF1UBpZYdmG7LTGi1Lqait0U5D+iP9zKmaO/WsCYkIZOEkRquxAxKRAD324PA7KXNqTKcdSHHXZXcssmiX5R3rk0EF8hhyTamu9gNRUzCQUH7Xc9Q8sqsOc7lw6MOHt5uROUJz3PdtaAEMSwpy1uUcKVxyB0+MXZUT7PiHOwEDdCFiBFGbckdVzjfXs+u9HGcb04m+1YAFngE/9I3Z5HzpOWoSWAW3v9ZUlkAHch9K0jXULsoNaEFO19n0dOOMFH/oX/qij/
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89b94fc-1c7d-4e7c-b98f-08d803d45333
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 13:29:33.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9fZSL4onxSgN7FxgUJGM+BEEeQz6be3bXlwxHFT6G0r2/iOY04xXGCuJXfMwH8r1cuONnwfQy9Izt0au24+aEgqNCvemZ3pXvhDrocgyEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3985
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/28/20 9:57 PM, Khem Raj wrote:
> On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
>> index d24ed761bf..787cc3adcf 100644
>> --- a/meta/recipes-devtools/llvm/llvm_git.bb
>> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
>> @@ -19,9 +19,9 @@ inherit cmake pkgconfig
>>
>>   PROVIDES += "llvm${PV}"
>>
>> -MAJOR_VERSION = "9"
>> +MAJOR_VERSION = "10"
>>   MINOR_VERSION = "0"
>> -PATCH_VERSION = "1"
>> +PATCH_VERSION = "0"
>>
> It also needs updating LLVMVERSION in
> meta/conf/distro/include/tcmode-default.inc
> secondly, I would suggest to wait for 10.0.1 which is releasing in a weeks time.

Alright, I'll watch for that release.

Thanks!

>
>>   PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>>
>> @@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
>>   LLVM_DIR = "llvm${LLVM_RELEASE}"
>>
>>   BRANCH = "release/${MAJOR_VERSION}.x"
>> -SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
>> +SRCREV = "d32170dbd5b0d54436537b6b75beaf44324e0c28"
>>   SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
>>              file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
>>              file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
>> --
>> 2.24.1
>>
>> 
