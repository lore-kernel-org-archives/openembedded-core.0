Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.13])
 by mx.groups.io with SMTP id smtpd.web12.11150.1591182232700170684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=ItRrsHN/;
 spf=pass (domain: outlook.com, ip: 40.92.89.13, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOP8r6ECwtsTt3tetka1RITArafJRQ2AEomkpKz4OBTtv1ohRkJgFcFwPEHwbzVoGp1MeIArl5F9qR7AHwhdbrkpEsxO6iI6x09i50dlpqAWxT5xLSHNM240xKjsC7IeEgYOKQrMKf8q812PD1yCZKaIKCY54sxi8IIazh9q/5WTDNIwPaJn+FyR7asg5nb+c24T7YokS43SOA4hoxjTZbSk2JvGCTLt9xHjTcpMY1INnNlYCL9ARJUManYYrLCvJqLRZVK4znhtz7Rf/ZnUpiBuofkvmYlxadppzm6Z9aTG9UgsuUO0DrIJ6agF0lEevvpTeUKft75dGCdKGHypLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khRxA5s7GUnbewd9hdpKNh4UGav8TcLyRGd3M7ZX6pM=;
 b=G+z5WQ7TqI95Y2w2eea/IkhqI0k/0bNJMQPnWxxKLSx6GBemXm05WYtbHoNrlHcOn91Ut+75F5ziLHkYSTJ3TcrlPGVuoU1v9z0F0BRKsEVcD0LqH2usJdOcMjUtsYDuVPhUfEZ9+SDu1sYWJRdLBTMP7qMYFoMIRmfCAbCHKD1+h4VWlJ3jRrWiMVDs7WlKROoNbvn7TaBXhcXfS25uFWetVkInQwCpYGcYiaumKJc6xFYe+8Ucx1BPiaeLdxc47rlu/5A2mHppSI9BcNPHs+DF3r7KWyref3hogK4BQl9qHdYWe860AmUI+BgEIk0ZutkEa3yhhCNsAnAazns4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khRxA5s7GUnbewd9hdpKNh4UGav8TcLyRGd3M7ZX6pM=;
 b=ItRrsHN/ZSZM/hK6W9s1AUA63KkqiX/uNGS4Cck112+bGPVptbSgzikAxTHBRS8T+v83iS6dlM8WjPXCog5AtDslST5nVCeCaHEkCZT30cciYCyam3phAwtudWrwYWejzlvjWocdkYZDceoyuqNftsaWgf3beUWYiiZRuRy3/BhiB0HcQQWlYLcxw4BIU+VgIbsfc0N0+Och2BEdBhf2XfdCTnZMsBwMS5YkQtWa2a/QQTm5TPBIZo3D2MbI+s3uD2AAi/SSNjipKt72E7nVdQUm+e6OzdcexzjMIdCKFlP8EZlkOsUrcXYf7gP3ZR19h1c1XN98g/cDepI4iX3DCg==
Received: from AM6EUR05FT016.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4d) by
 AM6EUR05HT149.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::453)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 3 Jun
 2020 11:03:51 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc11::49) by AM6EUR05FT016.mail.protection.outlook.com
 (2a01:111:e400:fc11::243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Wed, 3 Jun 2020 11:03:51 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:0B33D5ECB9DAA024EBF3E848CB4B5221713FCBDA0D24586923346A1E8332F7BB;UpperCasedChecksum:79B2A95EFCC2F1D3A26879B129D033552E5E5CE82D097D8BA391D37481713A54;SizeAsReceived:8992;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 11:03:51 +0000
Subject: Re: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200602204418.26224-1-kweihmann@outlook.com>
 <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <7deef78bc70f79f48cc8d9da5c0e18bcb305cfbb.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB68817744EB44DC11D7870292A8880@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Wed, 3 Jun 2020 13:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <7deef78bc70f79f48cc8d9da5c0e18bcb305cfbb.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <0f0af3ed-ded8-8743-9a21-b198e760a5f1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.150.34.102) by AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 11:03:50 +0000
X-Microsoft-Original-Message-ID: 
 <0f0af3ed-ded8-8743-9a21-b198e760a5f1@outlook.com>
X-TMN: [mwRD5uMSBNOB4D5NDNHjDS0YQlhuVQZ9]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 91255302-8144-4c17-d1f4-08d807adcc0f
X-MS-TrafficTypeDiagnostic: AM6EUR05HT149:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zhMMFy7AGPe3ikrXwIzvHEXQkloKCcvNaPABvIA/U1qJ2hPZFjPFD66OgxrK0I4qHKTM2zN3C1lcQALaJtKCn+aVng3qUuMNmXpUvXwZmq7ftXujd7tTyDxvPGPM/H7NoZyUxoaDwo7/+twztw7Li0xLErfTt3PK6OfmnkmdnADlVscEci8Jo54q3EghuK3rAdYJbhTX3H89Gwemc4swIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	xAfaXYdvJRcbazu0NvMpIC+6gPtFmawgxQZXAjQs1ReNnH6vSrCwheRLQrWVmdUbjcHPMyTQMrGr01egNgZmThDQbJmBeuNZic/1c9PbnhxKDlfv2HnPbCzuVkVbnfX7CCrk8V9pbyWclbKoBCgKcA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91255302-8144-4c17-d1f4-08d807adcc0f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 11:03:51.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT149
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Well I see a valid point in keeping them separated.
PACKAGECONFIG is just a static list of things, while the other setting 
is based on DISTRO_FEATURES. If we merge them, we kind force any 
override from local or distro.conf to copy the DISTRO_FEATURES block 
into their code or remove the DISTRO_FEATURES check - none of the 
options is a good one IMHO.
With that in mind I personally would like to keep them separate and just 
fix the append.

Regards
Konrad

On 03.06.20 10:44, Richard Purdie wrote:
> On Tue, 2020-06-02 at 22:44 +0200, Konrad Weihmann wrote:
>> As ??= assignment will be overwritten by += in any case,
>> one can't define a default of PACKAGECONFIG in this recipe.
>> Using _append instead mitigates chances of accidental overwriting
>> the default
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>   meta/recipes-devtools/ruby/ruby_2.7.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-
>> devtools/ruby/ruby_2.7.1.bb
>> index 3dd9fb0a62..3d7d095fbf 100644
>> --- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
>> +++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
>> @@ -12,7 +12,7 @@ SRC_URI[md5sum] =
>> "debb9c325bf65021214451660f46e909"
>>   SRC_URI[sha256sum] =
>> "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
>>   
>>   PACKAGECONFIG ??= ""
>> -PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>> +PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES',
>> 'ipv6', d)}"
> 
> Shouldn't this just be:
> 
> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> 
> ?
> 
> Cheers,
> 
> Richard
> 
> 
