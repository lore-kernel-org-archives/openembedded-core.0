Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.64])
 by mx.groups.io with SMTP id smtpd.web12.2504.1591323044076874724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 19:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HvI/IJXh;
 spf=pass (domain: windriver.com, ip: 40.107.68.64, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tku6Zi7rZDI1EmdZeodI+l0qXrMqIo1Ss0wDcOAXOFsUuhbwuT+hIE8DfHLi/hmQGMqsgi1K++X77dcOmpX7sFwbsJONZTiUC+3VwnUmxR4OlaFFhQ1G/Fd3TUy2WEozGW+H02Hs2nPCT4B8A9FVPm8V74m8MiyAMh/2btJkm+q6KemAVUePIW+ofcBjogGHv2YZswHI3NUDnMxNEv8zb9EPSzdruI+oFnIZEHxfLqA+IrQ38lMdkw/17gLbFPfjVHxl6fFNWroNLQ+E2JzZVrmGIidA6oPyeFG0g+5XJRotqOz9ntDjmK/6pnd/TDd+NihV3vOSR1OwmHiyRqiNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6DRWkokYWviIwMXjWjxGGTRWnjxroQcEZgNE775AV8=;
 b=EHc50plvn0fqUig05v8d+zBkL4qHNSZ4+Nw8Bvohzb2dDvPLor3bH/6fSCo/9Q/9Dw1Xo+xwXvex5yicOwHD1NMh+rEWGamGWUHCQNce7MnvTimbS0WswPKXckIqCJ4Zf6IFMHiO1NpK5lGmcRfrHCwDpsjwjpN0rU93sW1AA2z6eChgXZSBqFRk/jlIW7dtJlydZSxhzkvvAq5pXt/Wy49Zx+sq+X408gvp2AEV5ftmCm24OtwzzUkMiYdeetZHse+yGNZg6CTfHUxkpZbA2tG0Ey/aRhaIelHW78KR2UNbprscq4clN0Op3jgYeXW7s439KF0cc7ShavLxhDVeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6DRWkokYWviIwMXjWjxGGTRWnjxroQcEZgNE775AV8=;
 b=HvI/IJXhzGXmYYRvUeDKVqBKq8wPRR9EdF7W+tkyE3tKAoiPEGZ4YysFDlbDObW4kpmjTiXxJkkAys8qa9WSm9RFGtmpsjl+pr+DHiOudvoIq3PvjlqdwML6AsQIRIu0vtawGbptTP+wwYDhJE9pLhl6rJZx4fYVGfZXDneox34=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 02:10:41 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 02:10:41 +0000
Subject: Re: [OE-core][PATCH] db: enable verify PACKAGECONFIG
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200603054858.6762-1-Qi.Chen@windriver.com>
 <84ee1d38f14362475fae9900f94794535a44bafd.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <f7fa9cd2-e902-5bb1-03da-1fa081af4bbd@windriver.com>
Date: Fri, 5 Jun 2020 10:13:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <84ee1d38f14362475fae9900f94794535a44bafd.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0133.apcprd02.prod.outlook.com (2603:1096:202:16::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 02:10:40 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93f1b899-e70f-4755-8fcf-08d808f5a5a5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951E5B3EF5D60C298160BEEED860@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0SUsxDNPlms/0E3I7rJeT1jPQd2+EAH1Z8ZBWdu+ZL9hd13wiZEO4U9fH8X6hWRPWmaMxPmbt6lQOWFUdZyCkcjn4OtiJwYJom3bx/CGZLVPkwG9bTMHWqvto7ZFmITHHceNa0ii0YkxOMwKbi2LXVXJDv9NkQizhECITk7a2HYTg0NxANC8K39AE/1wOQnBj5N4ZQiiPi2G8Ung8IQHafO7dMZjUKBzNl9LPGwEWLPbrDJECqiKYovnhy6YfSLgOqqEo4r6PIfU4KsLLbjTkYOYHyTER8qjeJX8kYYFHfWiNBbe/AeI6FpzSa2Kd86WH8f8EjwckFCN9TI5WQ6pYTjFcXs2SP+gNaGEGhYKEN3zWaR8Kz2Bk9vyMhpV1nGCZoHKWIaCKeqwOIwRLJ/EE3fW4IPxCEn3SaLV/9FbW7P3hS9ECW1UItmGQUpldxPr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(39850400004)(396003)(376002)(66476007)(36756003)(6706004)(66946007)(6486002)(53546011)(52116002)(16576012)(5660300002)(316002)(83380400001)(478600001)(8936002)(26005)(8676002)(86362001)(956004)(15650500001)(2906002)(66556008)(6666004)(31696002)(186003)(31686004)(2616005)(16526019)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5klti6EkUozk+SbhqfqoaRiwGHvsylpbrrKy1cFyt5uCuGDVCsKFKCwl4mqkngAPClPz/Tm7GevoJoy9sLeSFJSpfxSIshmf8IohLLe34kBtbK7O7WHMSvhEJybD23B6Yf0R7M4R7ChY/c1KDNUQI1Hlg/wd28VhRlpP7n4rXi0mYRM53rGP+TlGl3kq7LOlR/fMUdfTCLvYHQRIloI/BxU6q4AKIy635FOYTnb/NE1vyssuLYfHlzAAMxg88U1ds7VrOqL9+sBrpyKzOF9AumaBy88DVw/EWOkH15hHBYY20lpgbzZGETTe0HvoU5yNXEIHnkTNXJT2oQlcmvjKbCipIGJW2eIxoYSMvob1z2NrvXpR4qF8XrSgrST/PjWXGfUR6kAbuA0M6FWDkvpYmaEkf1bwl6afqFyb4ixSvAnGEm57jS65Tl/LmirO/BD6ujFdPjNnLRxSgWq9YPhEe1A47DqLVHkOZbNWpv6uW/I=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f1b899-e70f-4755-8fcf-08d808f5a5a5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 02:10:41.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHGKRfOK8CUm/AH60XFgFbo57dVLk3i7iAS+OBiD8RyV8SxGCQ0TyBPMC9MsbBIlfmS+9iDUJVYxSL2eOYgTog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2020 04:40 PM, Richard Purdie wrote:
> On Wed, 2020-06-03 at 13:48 +0800, Chen Qi wrote:
>> On target, when running `db_verify /var/lib/rpm/Packages', we get
>> the following error.
>>
>>    db_verify: BDB0571 library build did not include support for database verification
>>
>> Enable the 'verify' PACKAGECONFIG to avoid such issue.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-support/db/db_5.3.28.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
>> index 3a0923ae36..b64c4c089a 100644
>> --- a/meta/recipes-support/db/db_5.3.28.bb
>> +++ b/meta/recipes-support/db/db_5.3.28.bb
>> @@ -61,7 +61,7 @@ DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
>>   
>>   EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
>>   
>> -PACKAGECONFIG ??= ""
>> +PACKAGECONFIG ??= "verify"
>>   PACKAGECONFIG[verify] = "--enable-verify, --disable-verify"
>>   PACKAGECONFIG[dbm] = "--enable-dbm,--disable-dbm,"
> Do we ever need to run this on target? I'm wondering why we need this
> and what the implications are (extra size to the binaries?). Perhaps we
> just shouldn't ship that binary if verify isn't enabled?
>
> Cheers,
>
> Richard
>
>
Thanks. I've sent out a new patch.

Regards,

Chen Qi

