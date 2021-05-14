Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.12])
 by mx.groups.io with SMTP id smtpd.web08.8082.1620995970985633910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 05:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=n/iBljLE;
 spf=pass (domain: outlook.com, ip: 40.92.90.12, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEoxnTeNxWs/jOxsi0XSO3JeMjyZJDB9pRUnzDQ4PijC1a9Qqs2ynVB7wKlLjZnVV2v9XPZiMl+sq7iH1ZtC+mjtFgTcVhEC0LoV+K/U4BmROdiIZySmJwfi0rYBWsC0N36G7gcGAYllksF86o32ahtuV3KbFRl0WjkghnaMEo078pmJ82gcWiA6l/t+MjHABWBv6zPBS0xQyfMhck4txIZOuqA1OO2mfyojNKDcUzGKXCFomutV4XZZ4W1yAQiKK6f9Cx77HERAMALQKtoisY4OAUWTthJgB1ikLJPl5RbRRQt/NWvVL09w2YFzYwcfCnUZyTXECgXROnZuL9wDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tXHzPYc5tG03CcT22XRVm9s6goRPHh/G4DPH+9gSl0=;
 b=TRVfMOSxRaPkk0hA2QWb0Iy5PQb/dKXfPOBAO0LHEiCgPLXPgVUKpCU96QOmvndu0DiFgwDEi6cCNN4/ZCHygPxIm4HPiPYxhUxa9PZv1GkrUZxgWRWWh8KkChiaf5n4gQFD62/qnlmJANQnw9nmE2rFrhUmOnC92phyKweEVdp+H/xd1x8hhIkpxtwrZtlTc3iTSET0vWmW+bKtWVDyRCyMpYMq5Tgmzq4GDdo5/gOBvt6DQpcxiA0NTlfGbl3gnzpYbyg1dmTJGSMXa70e1DvuW4FDGA1U9AeQFqrOUxvC/3Gbq0BRJX+rM0lExFUa33n3xsGnIgA9rPvpJPI5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tXHzPYc5tG03CcT22XRVm9s6goRPHh/G4DPH+9gSl0=;
 b=n/iBljLEGHN0yLcYnuKFYKTV7JQey+CAUoXhjAMCEnt9XQVvxyoBrGqy5wRe+frih0ESfC0eUKYSoGx8y64HfbQCmSRrG6jWe/cM4BHHzX0jRKT+ifDwfPm0nJu0aof+eAhDN+XkqbtwebsE1giWOlvenh4R+jSVvzJ0GGxPX2VnNQkG7Uk+88NmWlEMqQPWAjtVOBvrMDFF0tssdR0Bkk60tgbNayZIJlyuqhIp5MJ+SytT+iUaGqTB3mgI752hQ6Xq7ew8RNApXcqb0dPJjT2fo/SiJQKB+V/8dWfTyKwJ2f41PwLsMUo6vRiBZH3PzzYn183cNgGrQBLIsrMcSg==
Received: from VI1EUR05FT008.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::46) by
 VI1EUR05HT168.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::246)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 12:39:28 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc12::43) by VI1EUR05FT008.mail.protection.outlook.com
 (2a01:111:e400:fc12::437) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Fri, 14 May 2021 12:39:28 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:52579903454BE69DBCDBCA6C32DEB6ECC5F1C37C6F22E1629A5A4E6AF5E36732;UpperCasedChecksum:C5400A3CAB607B3C1FBC53C0705B75E8D1B1139F0DAA7B7642278D371826C66A;SizeAsReceived:8841;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 12:39:28 +0000
Subject: Re: [OE-core] is there an easy to prevent *creation* of some recipe's packages?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: openembedded-core@lists.openembedded.org
References: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
 <AM9PR09MB46423C546EF564C11A177062A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a7ff2123-a71b-a4d7-abb6-85e17dcfe6e@crashcourse.ca>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642F9F7EFE632E2F9E2443BA8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 14 May 2021 14:39:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a7ff2123-a71b-a4d7-abb6-85e17dcfe6e@crashcourse.ca>
X-TMN: [lbrccIqf+MuWHNAuIFNO9YvndnM0dZXP]
X-ClientProxiedBy: AM7PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::37) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <fef41158-b285-b09e-c4d9-dee5b13c747d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.18) by AM7PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:110::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 12:39:27 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b9d53a53-93d9-416e-7948-08d916d55049
X-MS-TrafficTypeDiagnostic: VI1EUR05HT168:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i9+9ogmfk0Lc/n79sMkiWh7m7JCUwvW2Q3PY93aaic8iDQHYcei2Ssm27cztJ4UNaF9buLaFB+4X0y6JP/L25llhHBpwHAIajkkIYRyr6CwsjY7z9+lS1bwhpq92rJMmBEldX+rWQsFdzWDld6/tMdCGRVuiXKVu8vdU61bZjtcaJpUeAeuD3BqkXOgpKRWgIn93qeRdBtTHokoFRtQizLiHtwtXARH/FXVbG63xNfInY19CA1LdSx5747lcaeVyJIWrALyX719Kdj293+jfvNU2RWfzxkhTwv3UCRsbZTksA/fScpeb6GXyW0T7vqW9bi+f2oBM9Vs7AvQ/uoyfq/QqPiaQqltT+wa+El6rQVxaWdh/Ajl0Pk/mPt1C0/c7d8RvYC+1TLSa6C4+UgTJig==
X-MS-Exchange-AntiSpam-MessageData: 
	ZU2v9/3W02854XnjYG3GZ5e20HezwoINu2UBhTOJb4Z7dp65GMQA1t7d4BTPFuZh9Rwdf4aVGpcOv8/59dtNEf6n5tId+qgRcoH017eTQlM2OzAHgbSdBJGoHrRwSXbWF1DgW8RX8UNQQcQl73Vt0A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d53a53-93d9-416e-7948-08d916d55049
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 12:39:28.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT008.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT168
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 14.05.21 13:52, Robert P. J. Day wrote:
> On Fri, 14 May 2021, Konrad Weihmann wrote:
> 
>> On 14.05.21 13:16, Robert P. J. Day wrote:
>>>
>>>     pretty sure i know the answer to this one, but was asked the
>>> other day and wanted to make sure. in order to speed up the normal
>>> OE build, someone suggested bypassing the creation of packages
>>> that weren't going to be relevant, such as -dev, -doc and so on --
>>> the idea was that that could make a significant difference in
>>> build time.
>>
>> I pretty much doubt it will speed up anything. If for instance the
>> -dev package will be removed from PACKAGES it is very likely that
>> the files of that package will end up in the base package ${PN},
>> which results in larger target packages that need to be installed
>> (and potentially further RDEPENDS)
>>
>> Furthermore this will break DEPENDS for recipes that do rely on the
>> -dev package - so chances are high that this will break (or
>> magically change) something further down the line.
>>
>> One thing that you can do to speed up the build process in terms of
>> packaging time is to delete any **really** not needed files in a
>> do_install_append, if no proper configuration option (cmake flag,
>> make flag, PACKAGECONFIG) does exist which prevents the creation of
>> these files in the first place.
>>
>> I would recommend not to mess with the packaging defaults for
>> reasons such as speeding things up - as this is IMHO addressing the
>> issue at the wrong end - just make sure the files in <workdir>/image
>> won't get created
> 
>    that's the general idea i was trying to get across (so let's confirm
> that i was speaking accurately). i suggested that the majority of time
> spent in processing a recipe was doing all the fetching and unpacking
> and patching and (mostly) compiling, the end result of which was to
> populate that recipe's WORKDIR/image directory, at which time the
> packaging step took over. so unless one wanted to dangerously mangle
> the package definitions, if it ended up in ${D}, it was going to get
> packaged, correct?

yes... *but* what the packaging does it to loop over PACKAGES and for 
each item pick up the corresponding FILES_<pkg-name> var and "move" (I 
think it's actually a copy, but that's just details) all matching files 
from image to packages-split.
If files ending up in image that don't match *any* of the 
FILES-glob-pattern one would get a QA error.

> 
>    so unless one wanted to go back and mess with the recipe's build
> configuration to, perhaps, not generate some artifacts, those packages
> were going to be built, whether they were subsequently installed or
> not. so short of mangling each recipe file to change its
> configuration, just leave it alone as the payoff just isn't worth it.
> 
>    sound about right?

yes - the results of trimming down the input to /image will much more 
have a positive impact.

AFAIK packaging speed is directly linked to the number of files in 
/image (worst example I've seen is a ruby package containing 250k+ 
files, which takes round about 20min to package on my machine) - 
concluding from that, reduction of the number of files in /image is will 
do the trick

> 
> rday
> 
