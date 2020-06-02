Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.122])
 by mx.groups.io with SMTP id smtpd.web11.4513.1591127767519313431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=fqhhwAbP;
 spf=pass (domain: prevas.dk, ip: 40.107.3.122, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8oBJbKWhhzPNa431OWiiJLjrH9u3LaXTSy5uOBIFvCxYLY0aDoBIJkT7WeEeDkj0foxZETEP1opmsSAPNFHqROCQPsmOOZdJS5jUQLcZ35mJu9lQgnU4Yrb2kdYAsd8O84Fxxk+q1kC57uw6wMa3GLd0aiij4rcAN/2NpYJ5Wu72WwZkTioYMSP8s0Yvtl1F3BYr5p8LQknN9PjUFZ6GruewYtYAlzDAJXjualywWmP1RMe4X8zQRTWhsjhdonxICfubleglDmBG6D8qmUYIMQKcG4ei8gSvuF61IJcAySrEDudqrPpMLOU05q/+M0VhyqQDybUDoFiu7TB+F3WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQCKytAUcdQJknPhO1P6/GIJcUYfSGYkcQJvcgZYOXA=;
 b=dE2o5RNwe7SXoO0iH9+HJBFxYP3VhntmB2PY39tJFwAEHemKUBbNeOPRxFwybmozzDhOuwh4QQzigLUTKBGn8ZgGIIHg5aIXn3d1zgNG+ZyDq8FUggsWl+WLUr4+34TVLAAnU5Dvbw7UlZvdzfXqLmrMhfr9yBZgiasnq3DVofv8Gp9SNTXWVT28xNrrpQfz0/Dv2sbys0G9fl/y+dFFsPka7MpnNPqZQ/Djq/BnxxsvsQEjvdhv/EiB6oXXEsgzfJF/WcDlmngvYVjYw6/sex0SGrlOwG0aIMpqGUurwLo9KMVWZyeZiDKL9AvDbIgS/MtPC4vuexClKfVWetBdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQCKytAUcdQJknPhO1P6/GIJcUYfSGYkcQJvcgZYOXA=;
 b=fqhhwAbPpOnOVJ5N2+vKn7yu0fPC+25Q64kMQndhYk7EVeq8CRD4j8s3xfy/+6AsEpyXC6LWpNHRjPEFb0PKQFGrrR62OpXBwyDewbp6P1RMzT+3jSR/F5u3fQcOL+4wugzvmCLVKXnqXo6x3kQh21nBM743ijhddUgmLNwcH60=
Authentication-Results: pbcl.net; dkim=none (message not signed)
 header.d=none;pbcl.net; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB3695.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 19:56:04 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 19:56:04 +0000
Subject: Re: [PATCH v3] glibc: move ld.so.conf back to main package
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>,
 Andreas Oberritter <obi@opendreambox.org>, Phil Blundell <pb@pbcl.net>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <CAMKF1soE46Cvvr0xFP_5_NYaYeNOoimkXsFHgZYE+gSFA7nbWQ@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <06a5a615-2681-9af3-66a7-e2f6950b74f2@prevas.dk>
Date: Tue, 2 Jun 2020 21:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAMKF1soE46Cvvr0xFP_5_NYaYeNOoimkXsFHgZYE+gSFA7nbWQ@mail.gmail.com>
X-ClientProxiedBy: AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::40) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 19:56:04 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18456513-641d-46a8-3840-08d8072efba0
X-MS-TrafficTypeDiagnostic: VI1PR10MB3695:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB369509FF73E40D24F1546AF7938B0@VI1PR10MB3695.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O6SZXHrYKufO7shuQYwOog55ioV6A8aSlQMrTTv+Z7xI9cKYND49lm7HHx0+AMtkRfmpB59jWmoPGLxErFLjwRl4DEFvwAU7VhLdA/4KoqR9T7Jh2siQeO+vXO+OXMoLguaDjoXyH9Lqu71LqMnyLVZLAxSaVHA7n0BKWwDutdFUY6NHqBgGWlq6o9a33yn3wdAAQvYKUSmK3YLJG4BndDhsMLfaFXz9LxHA9fE1VQ7/UTPq7SKptGjD1N0FBC3RJErE1lGKUTUqIkd1VGcGMTs0mQoUIPJy9F3L0IZnbeFCpN12murIpBK3M5LRiyyuvu5vCSWqyK0TQ3N9s3Lmv8xd9yG20CcK8mONM+EBY6eXr7pywgFhtJInAtgmytjb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(346002)(366004)(136003)(376002)(83380400001)(86362001)(52116002)(478600001)(53546011)(4326008)(6486002)(186003)(16526019)(31686004)(26005)(8676002)(2906002)(66476007)(66556008)(8976002)(8936002)(36756003)(5660300002)(31696002)(54906003)(316002)(2616005)(6916009)(44832011)(16576012)(956004)(66946007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	2vgDV+AuQKNlTiqwEc4Hh1AWk2bB8y5xqkTyz0QA66ZoiXk+WXSYpoQ+cWBcVYtLEl6r9ydSIPaFBPrHD/NH1HZwhW9yOkqg7Tc1gsYKPWs43aqt+I77j/IjexJLuiqWfrivrFbCjs7GUgHNplBaq+y/cKK/OBDHx17Q35MnAi91N8pmAsgyNd1EZ+2UApd/8Bn5ho0FERDA8VKFRh9iPMvCyKSu2yopjFGJkS/Knkw5LtUxeb8FoEu9lz61iQhXhNIP0SfXiM8Uae622TplKUyZEj/80GqlcCNtYIcL1y2ybiCoEMxoQHybAXVVPR9cNeA2a/bvIRxL5OW/8qgPb+ktl/e0vEXxzdxudQ2Dk38uISn5h/HzV2YmUAVqCT5pdUHPg8MYjWVmOrMVHwS+uSePF/m52j5scpT5EzVusVGfqlQVQC7NZ0NhWdK1kDxbHN2LzGoiXqthrcWpwNedFPCJzAjvtB0xmNPWO96a0G8=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 18456513-641d-46a8-3840-08d8072efba0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 19:56:04.5875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGfpWJb3cEIiXR3SQp+NJLw/d4iIiMrlHomYjX+sxcGe+wEkUI3R3BfAffOTBCHhUM1CDhwvSxabu1QDpMhdb5BSM3OY50k5R0UEKF6IrzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3695
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/06/2020 19.58, Khem Raj wrote:
> On Tue, Jun 2, 2020 at 5:17 AM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>>
>> There are cases where one doesn't want ldconfig on target (e.g. for
>> read-only root filesystems, it's rather pointless), yet one still
>> needs ld.so.conf to be present at image build time:
>>
>> When some recipe installs libraries to a non-standard location, and
>> dutifully drops in a file in /etc/ld.so.conf.d/foo.conf, we need the
>> ld.so.conf containing the
>>
>>   include /etc/ld.so.conf.d/*.conf
>>
>> stanza to get those other locations picked up.
>>
>> So change the packaging logic so that there's always an ld.so.conf
>> present when the build-time ldconfig runs.
>>
>> The ld.so.conf and ld.so.conf.d/*.conf files don't take up much
>> room (at least not compared to the 700K binary ldconfig), and they
>> might be needed in case ldconfig is installable, so leave them
>> alone.
>>
>> In case of a read-only rootfs, one could add some logic to remove them
>> if one really wants to shave those few dozens of bytes off.
>>
>> While here, fix typos in the bb.note (add spaces) so one can just
>> copy-paste the line from the log-file and redo the command.
>>
> 
> The patch, in essence, looks ok, have you considered the feeds based
> distro's case
> will it keep working for them, or if there are changes e.g. they must
> include ldconfig
> compulsory etc. then it should be documented.

I don't think I understand the question. All I'm doing (now) is making
sure the rootfs always (well, it comes bundled with glibc, so for all
glibc-based systems) has a ld.so.conf. If there's an update of that
ld.so.conf, that will change the hash of the glibc recipe (it's a
SRC_URI) and hence of both the glibc and ldconfig packages. A change of
the provided ld.so.conf will lead to glibc being rebuilt (no?), which I
expect in turn will cause glibc on target to (need to) be updated (no?).
That seems to be the case with or without this patch.

But maybe I have no clue what a "feeds based distro" is, I've only ever
done wholesale replace-the-entire-image (in an A/B setup).

Rasmus
