Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.103])
 by mx.groups.io with SMTP id smtpd.web08.12968.1607082047091858724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 03:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=epW1grDd;
 spf=pass (domain: outlook.com, ip: 40.92.66.103, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHiZ4IRZZsk17jcxOBXIk5rEsvDw6MMfl3bEqSzovo5OnU8V4nF7iqlf9OIC7eFEf6A/OiAKpRhJpQaGEe6ZnOejCMiy7R88ki7v8ffZIViaU8x5RsQy/MR0cvzQED6TYzUqAjqnD6QB87sIQsuZNB51QHTRTQwHsejjm/682u7AkJi3t5u0X5QCDO3fSP5xqaesfsDGDszc2Xy1kUPh7gSqEMBHj6sj51cEV59KX0hmDoKTNWfwfF9dWAjA79OSa+HB5H7GuzZBpQUYxQVsgH3vc/8o4z7PDuWVkNzLxHuhI5taZLudy+T6/sJeZDv9UBZxXiILdSjLlAdoa9IpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo9jG2eXTYrdhuoQb59pihtLXleevuaYphpg+sdueQ0=;
 b=ixoYAeLIIbe0mzKGoAtPhHXoxgxQ09c8lQq+WecOs+1LUC4jhiHJ5ULu/CQ2z0avoMkPtSwgRglUODF+FLPl4+nHnBKvswCsy6pndV7Nx9zu7BJWRuV2Z8EUtOXaYwDYimLRgCh+LiETFk5KjPWpu6T7axz6WTMIjdi7IBrA8EUjcFFoGBl1v3o5UFMTyytbZXrQp2KwoW9+/iFdchFeRXEFjj7WYHCezy3ZId8LWyCTcd9bsSPfqzKFCl6BJgVF4X/yuE+1zc0IWg7eFcCUAwkbShBM7LSkvCtJJTx+0Nay775q9c+M2GF3B7/2AXVrEDrbvVQjAFIO9JzbQF/R1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo9jG2eXTYrdhuoQb59pihtLXleevuaYphpg+sdueQ0=;
 b=epW1grDdzn0lJJ3b1e9Zog4MKn6tg1jGR1X8uO3U1qBa0FOu1qiqj8D16SM+8BHjaupWD938PHKWMJsOgrX3iAU5ScXcTehnIWTvd4siu8ZuGP0GCHiht7TMrUnwMbsFFhZWoJx0ixo4NfxWWdDzmHU/jXXKmKERDCoS7QqARUw29AAvD7hWw0Hmm88/tg9/YmxrCM2zaZG9Lrz78MMnSYweITY7MaOahQDsLQnBukEEAUEiXZ5tQKptGjQnGrGeZKZqIJoflum4bhSSkqHf2/K9c3FwDFf6F+sxmAjktw7yBK3CaKkVwuYMk8zTxxZxlLq8iIgmjuIfLdqGYUaB8g==
Received: from DB5EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::4f) by
 DB5EUR01HT169.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::279)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 11:40:44 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1a::41) by DB5EUR01FT046.mail.protection.outlook.com
 (2a01:111:e400:7e1a::487) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Fri, 4 Dec 2020 11:40:44 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:E508EB93EE4EC677AE5BDC4BC222B5C6048BE5308611F6044A63042DC755916F;UpperCasedChecksum:76778B2DCA8FBB8343F57815CBDEBB9708CF29CA3EDEEA8BBCABB4FCD41D1FDE;SizeAsReceived:8688;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 11:40:44 +0000
Subject: Re: [OE-core] Conditional inherit with PACKAGECONFIG
To: openembedded-core@lists.openembedded.org, robert.joslyn@redrectangle.org
References: <aebe57d858d895a9266a9a25e90b60c8a34dd9e3.camel@redrectangle.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4739B0A08A5E56EC85975D76A8F10@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Fri, 4 Dec 2020 12:40:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <aebe57d858d895a9266a9a25e90b60c8a34dd9e3.camel@redrectangle.org>
X-TMN: [NtOsXYknOFvx4WRkkFFQB2SZA9UQeCxP]
X-ClientProxiedBy: AM6P194CA0099.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::40) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <96897d47-f664-c516-c521-e5a1673fb424@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.183) by AM6P194CA0099.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 11:40:43 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 23abedde-f946-4aa7-fd64-08d898496f54
X-MS-TrafficTypeDiagnostic: DB5EUR01HT169:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Igy8rLj8ONqVi43LypYHCsB0YMaBs/iLFnJobMB2Bf7cQvUHYcE0bccqLlPe12ge+abosxR48oURL9Ps0iOyomYhtzw6VSYqEHJOlf25Fq0bcdBo5pmK5gyKLgkVhkuac0mfpNUPJuWR4Kr7r3e4GXWiDarLD8EvWkefLdpjyXlAzJxDngY7MCDf1aFDtiU828kzeMnS9L1WWeOG0ZJpIxx7HdOno/P/hzpAlLhgoIJH15xcYjWls1r7PvfTTMPt
X-MS-Exchange-AntiSpam-MessageData: 
	4IOMeHRerCIPZG2toZnqzTZfxxjX2WP+ALqvQnt7PhrIWEdqj+QBmu5in9ypImp1xwDNG1+THbT/90/1z23WuoKPWcpHOcYNIwb/6WIQPt4zJ4srriPwnqo53vv6r2o/Jv5rnCWsp6XEaB+c/B6blQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23abedde-f946-4aa7-fd64-08d898496f54
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 11:40:44.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT169
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

PACKAGECONFIG_pn-btrfs-utils = "foo bar" in local.conf or distro.conf 
should do what you had in mind.
But yes your observations are correct bbappends are applied *after* the 
initial recipe was parsed

On 04.12.20 05:34, Robert Joslyn wrote:
> I'm trying to remove unnecessary packages from one of my images, and I
> noticed that some conditional inherit lines don't work as I'd expect. In
> my case, I'm trying to remove python, and the only recipe pulling in
> python is btrfs-tools. The relevant parts of the btrfs-tools recipe (I'm
> building on master):
> 
> PACKAGECONFIG ??= "python"
> 
> PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-
> setuptools-native"
> 
> inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base',
> '', d)}
> 
> I have a bbappend removing the default PACKAGECONFIG containing "python",
> but I still get a btrfs-tools package that RDEPENDS on python because the
> distutils3-base class is still inherited. If I modify the btrfs-tools
> recipe directly to be:
> 
> PACKAGECONFIG ??= ""
> 
> then I don't get python as an RDEPENDS. If I have the recipe modified like
> this and then try to add python to PACKAGECONFIG from my bbappend, the
> recipe fails to build because distutils3-base isn't inherited.
> 
> My guess is that the inherit lines are parsed and expanded before the
> bbappend modification to PACKAGECONFIG are applied. The bitbake
> documentation says you can have conditional inherits similar to this, but
> it seems there is more nuance with how the parsing is done. How should
> this be done if I want to be able to remove python from this recipe using
> a bbappend? I'd prefer to avoid copying the recipe into my layer to make
> the changes.
> 
> Thanks,
> Robert
> 
> 
> 
> 
> 
