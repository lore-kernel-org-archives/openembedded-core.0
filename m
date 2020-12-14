Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.64])
 by mx.groups.io with SMTP id smtpd.web10.275.1607970046487209772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=b4jbrfnl;
 spf=pass (domain: outlook.com, ip: 40.92.64.64, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLPtClw7nQ0T6F7QyPp1jL8dHRKHANdAdNc+ds1TAyE7PI+IBLrgD6TRUS9GQfC95ST6DDggr8QVfro3iph0S7ljDuD2gBrLRTvEEgFUlkyxeTNWxLNVDS80orlVF9MnbigtnV8Jrk3RuGPIHEuT7tRz+O48s1Dit5OS/TdyhcMAY5Zrw4ydaMFOFXdTMsOQZ/NVv6SjLgFq3PAoumvHyexAe4RoXvP/bw3KAY8R6yZF5IqrnI/100YjLUeuS2GUim6oPhYYkbmwzY6nuolOfBZAa2fIytFVAJTQfnDPcRTiQMtkMLXGmnwg3ovX8TEIq1cDd5fNUP3W5X6x7GWIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqtBUArCcMfsqzuQr+WzOnwANjm0XEqDZ8kjPJnBrQ0=;
 b=iGbvBFGks1QlVTQxW61mULDCemSY1fEuINKNN1Me/A5HwATynaSkmxDfZq3jiH0bGVEGkNPGkEwn6bgdxtNH05uT8OmgHg6P7yFtO18/WJV26pJkh3fcBLJOKtgmXk8QvPkqiUHvJt6oA77dhbMv29Xy52wfp5f9ldzB70n8jiZHbSbPGRCOD+CXc75WDaxxdWF73Np6PAByZ1KVMeCsgIx/UU1YbZM7JOqSc191J3tZe+eyGF0Z6gowcdF1TrcL+2+kUS6LrF1TDTjbrXVHy7l5m2cW1VYRX1rwBQews1J5KvoGwxX6O34I089khYu6Bt75FtH7WIFuyYIdNZyfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqtBUArCcMfsqzuQr+WzOnwANjm0XEqDZ8kjPJnBrQ0=;
 b=b4jbrfnlAgDQQn+9DgwN3r5tEQqNfB0I8QJrruhxij8E43T5B88KDGJXWYpTqO37X11KK0eJTHdgj1DsREWuJVPOLcZ5dK6iIvcNLqSehlmiSBUmjjYc8XlXyK5L88so6syIYmCpDAq3lC7ZF7gjLGwleVMoIrCo97uL7V3pFz3a6voZxqYWbnm5W7FVCrrhZb4d1ZK/DcvlFIWrH9ppnF1f5AdNBLykID2jYVuW0EGaDLSpMi6LbxCzl9qqtxXo5p4X4f2Z+GoRq+FfhC7T4CZxsdR40muq/3lbQILGe9OO+XVeV9lC/IXE2e/iWXWhLYfodO/NfXucJpzwmju11w==
Received: from HE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::47) by
 HE1EUR01HT024.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::251)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 18:20:44 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e18::41) by HE1EUR01FT061.mail.protection.outlook.com
 (2a01:111:e400:7e18::262) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 18:20:44 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:9632FA139B009AE0D499817FF40F3CB530D13F8D75C13563E9A19272E364DD91;UpperCasedChecksum:EC79AEC44304945256569B50F61426C87E918A539A394C0BE2212CB0479CB594;SizeAsReceived:7878;Count:48
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.021; Mon, 14 Dec 2020
 18:20:43 +0000
Subject: Re: [OE-core] How to create a directory in multiple packages?
To: openembedded-core@lists.openembedded.org
References: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
 <f44dd44e-ac73-8ed-674e-d6f3cc289c@crashcourse.ca>
Cc: peter.kjellerstedt@axis.com
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB473919AC57B98915E0E96A10A8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Mon, 14 Dec 2020 19:20:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f44dd44e-ac73-8ed-674e-d6f3cc289c@crashcourse.ca>
X-TMN: [PazS+7ClhZLeY+TYoHUY4yjoqg6EhDik]
X-ClientProxiedBy: AM6PR08CA0046.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::34) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <f8853058-e96c-a463-be65-541dc0965618@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.83.178) by AM6PR08CA0046.eurprd08.prod.outlook.com (2603:10a6:20b:c0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 18:20:43 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 43e52ce4-ed6f-49b9-8cf7-08d8a05cf87a
X-MS-TrafficTypeDiagnostic: HE1EUR01HT024:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qJ9EpfmdkbH3iuK1tR75GcDMFODF3scVl3E1W3BVvnFRph66MMweIvT7I+7LZN+zcWpw5qc42q6ZF19ZID0kjISTcECCAZ0wLs4++aVyD3cZwoY0tJyHeaSXbdpwgua5RcA6phh6JjdNYru5Xg2Il8LAU9qx0VeTisBZPyMirIta8JsZ/51Pe6oEQsb7x4vXtMQonVhmP8b4dhyu8UQw1xVq3aSV70xO95ywY2+UprsDGjTRCzIzkO6K7Y/Pd/Ki
X-MS-Exchange-AntiSpam-MessageData: 
	jAMWvJqYzC9meqRCfoasmMF5ECORipmwgxEUtIgvy+N7//Z6G7UgSGCgEUSpzkOA3T/bZwDg4yk5vQF+R1jHocvnJQke9RDo/3TEGTMvDMWUKwiImDpJjhvrqzZY7eQUSK9c9Vw2zXtqXHtm9XumuQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 18:20:43.8046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e52ce4-ed6f-49b9-8cf7-08d8a05cf87a
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT024
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Clearly an empty dir seems to be sub-optimal design, but if one would 
need it, I'd recommend to add a pkg_postinst_${PN} script and 
dynamically determine at installation time if this path needs to be 
created or not.
So the dir either will be create by ${PN}-bin or by the script - I think 
I've seen at a couple of times like that

On 14.12.20 18:46, Robert P. J. Day wrote:
> On Mon, 14 Dec 2020, Peter Kjellerstedt wrote:
> 
>> Say we have a recipe that creates an empty /etc/foo directory. Now we
>> want to add a new file in that directory /etc/foo/bar and package it as
>> ${PN}-bar. This means the creation of the /etc/foo directory is moved
>> from the ${PN} package to the ${PN}-bar package. Is there any way to
>> make ${PN} continue to create an empty /etc/foo, or is the only
>> alternative to introduce an /etc/foo/.dummy and package it in ${PN}?
> 
>    it strikes me that creating an empty directory for no other reason
> than creating an empty directory is less-than-optimal design. the
> proper approach is that all file installation should create
> directories as needed.
> 
> rday
> 
> 
> 
> 
> 
