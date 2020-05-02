Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.92.71.90])
 by mx.groups.io with SMTP id smtpd.web10.4229.1588424057994814170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 05:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=gfgk/Okm;
 spf=pass (domain: outlook.com, ip: 40.92.71.90, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grgLHBCwhC0gJEegdDihQ0fbOcDgbJ8BkriVdSKaExGWg8Da4piDjPArF8xLGcaNHawY5iQmCyJdRGrXs5Ce6HYyVeTOlzBsSc2wFKGVJ8xYIk6IsILIhasgCbzqNhu17+9WWio6afleMHNmsZZWfSF0gUd7BKdJ3F+c6oXA1qWRmNfiRpe+i4hKLi1QZFZ1Uee4rn3zAk+bNRrGBqJ2W7qu25+w9UxyYRmvdogvRdKmenkRlLgwrl6xF5PsQUYNv6OV+aaQxNdAh/1DMPbhGy/I0sLBiC7Hqtv/FTpL4FMbZoygmwGR+IlOGaYzeGtRDGhwMTBT4d/0jTVpBWXWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd2X13XTkPIaLjv8YMDMilxK0PG7Txd6UuFwX9Tm28E=;
 b=HdOAAZ0gZQfbD1z02lulZ7S2NXu03UMwIzPtJJEz0DBdTJLjeIGwbeHh2F4XDqHqv3y8MWGjxuTmR/RQMHL+xXPAO+oqCdmbGMi2y7UzJ+VJD0at6VvwiqVm2DKov9JSPZAWT5Jq6gewA2BYdfEw5OIOYDW0WfZcnrAOm8f40D+di5U1qTVEaB6RjbD3UPj0elV8eNrUV9vhLKL/TlKGPvz2WPckGrZPw8EtkHFSeOBqLNLJfiruHcavSZAglgu9CeIfFtClcmRThG517mr/SczuJetTVAmF0Nm5qLa8u9sowGzgne0hGw14GitcNU98lxH1xmLoFGIsCaX7Crhvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd2X13XTkPIaLjv8YMDMilxK0PG7Txd6UuFwX9Tm28E=;
 b=gfgk/Okmfh/FCDNNB8xaZeqOl9T1tyFkRQSlvLFsEpk7X9rva6PI2nDOjwGPZNMmMD59w6miD1C1WylZxKOyt8evlL7nDDtD+2gKuWI/4rR+HaKAD0pXcVOdbO0F451IdvxVwmpoXmy1LLkpaX/MWuqt0hY4pZnIHNWb8+isTmItas6enjwvv86jXJdcdjYZgKFZWZIQrv+7dxZK8rNwalG4eTrpt/oNqDVzfdDG75m7lMaJLP7UDYVRbjiOyGvNvDwYpYoOR+GAprWb2KiBfxn2bKLAtP3/ftE22QCU0wDhgBMfgGICVTMFIRpmumuBZ7paQ1UmwvB5zFW9morpeA==
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::49) by
 DB5EUR03HT149.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::448)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Sat, 2 May
 2020 12:54:16 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0a::49) by DB5EUR03FT030.mail.protection.outlook.com
 (2a01:111:e400:7e0a::144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Sat, 2 May 2020 12:54:16 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A5CBF4168CB103D5E2044442A476939D23AE19E2259F33601B46D3782BE35ADA;UpperCasedChecksum:4C0DFFF5AA16ED45F2F6E56F343FFC04E82B340C35A12809944934CE4841E8BE;SizeAsReceived:8891;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.027; Sat, 2 May 2020
 12:54:16 +0000
Subject: Re: [OE-core] [meta-oe][PATCH 1/2] php: fix zip package config
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
References: <AM7PR05MB68811C880CDB744B1B3C6835A8AB0@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <20200502145205.24892acd@opendreambox.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB6881E1B5DC829E740861D058A8A80@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sat, 2 May 2020 14:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200502145205.24892acd@opendreambox.org>
X-ClientProxiedBy: AM6PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::37) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <fa41828d-b9c6-9bbc-c863-71bc8e4d3257@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.150.33.231) by AM6PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:20b:6e::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Sat, 2 May 2020 12:54:16 +0000
X-Microsoft-Original-Message-ID: 
 <fa41828d-b9c6-9bbc-c863-71bc8e4d3257@outlook.com>
X-TMN: [CVW5jxsKPKPTO18b7SJOUkcnoYqc1Fzj]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 383bf9db-697b-4271-d152-08d7ee97ebfb
X-MS-TrafficTypeDiagnostic: DB5EUR03HT149:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Q3ESRJCuVcm5B/rIMry2sEWfnuozewxrOm9KRsLsMRnRYKP1dC1Pk2IH3ZxaY4/P4VaTO/4WF51eXfwx8mouMc0exiB2gtjJWSSfR/1ZrsLqvR1fhBDv48pY7G5CggZr1AGORYD5USLkXEWlh8CQeXmnlm8lsFKQtZHrkrEEQfraRGSG/PTyRtSvQ54XKLTlYLGDpYeIPn94E5yB6N2Ug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	dzf7hd4ltnh1CjgiEMLE4U1/UXAj3XRjvTEMF0ELe9jP1QQPFxPPCGm6GOTiljxP7taXzCaOmytRbgtaMlttJqMwhoUsTYu9ZsQqfnvqnup45UiOPwqEqx1lrl6pTaifHmJAyLLFGGwX4YXrS8FupA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383bf9db-697b-4271-d152-08d7ee97ebfb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2020 12:54:16.4299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT149
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ahhh, yes...
I'll fix that in the commit message somewhat later.

Thanks for pointing this out

On 02.05.20 14:52, Andreas Oberritter wrote:
> Hello Konrad,
> 
> On Fri,  1 May 2020 13:56:40 +0200
> "Konrad Weihmann" <kweihmann@outlook.com> wrote:
> 
>> --enable-zip and --with-libzip were removed in PHP 7.x.
>> These are replaced by --enable-zip --with-libzip.
> 
> you meant --with-zip --with-zlib-dir.
> 
> Best regards,
> Andreas
> 
> 
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>   meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
>> index ff4c28e13..c1784a78d 100644
>> --- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
>> +++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
>> @@ -81,7 +81,7 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>>   "
>>   PACKAGECONFIG_class-native = ""
>>   
>> -PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
>> +PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
>>   
>>   PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
>>                           --with-pdo-mysql=mysqlnd \
> 
