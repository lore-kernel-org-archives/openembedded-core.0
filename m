Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.67])
 by mx.groups.io with SMTP id smtpd.web12.1057.1586200863710727200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 12:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=ZMYIbmv5;
 spf=pass (domain: xevo.com, ip: 40.107.93.67, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0nw10INxNnnLPaHeyI6ZdEdirQpPQGydxSQLrHqNbvCkfdJWUayEGsfUzerGvB5r5fF0nSXwlS0advh4yvBydVGAyY/JokpAhNc/s6hxKirSmr962Go+a9G2rWl069K0Urg6xFnFmxRv38EvW5Uv1QtveewwSlrqIUYUJ+YXJ6uDwIQBanD4aLVhNdsui/3hJ39EPaetavCc9SU9uYzpZ6L3RKlIevwPlY4klE01k/jxruCY55XTL+EUu8CNO9usan9w3K8gB06lOKSjGY9G9rorYQnPYWBJXsvZoRNk4IentUtU7ZJ4wqwhFlaFoNUAXeLCcMs+/2wfAPnXl7Pmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb4N6AeJEOBFZLADer3bhGp0kk+q64zFz+b4ljFPdgk=;
 b=UolcH8QJN81zzujYdeY+yz6F1kv5oRKFgdW6XI/lpuAN88KosyiHh78Y478t7VdmSZkYWsni4bnbnqecWnHUKXxuQRpSv543jit2F941Hd+Koab58QLvtbjToCKXN7OPbG9k0bXO8YvzADQqIcm+mg4rZ1abSj8v0Nl2yPONjPxOgCy4Y9hhJNDXUIrtFW0gv7q3cGyasOq3xDB8jDKyo1sh3PzxtEZ4n+qmYd0gCQR7Huppcy+wu22CmtN2xAbVuODitNjhXfk7Em/DmOY76MxzWw3xCJVj1mrL1KMKJrLCi2hbxvaxotRctFuDlW1p1qmPsRwo70On1MkugilbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb4N6AeJEOBFZLADer3bhGp0kk+q64zFz+b4ljFPdgk=;
 b=ZMYIbmv5Ag7g+Wfa57uSc75Nz+k3BdcK7MapRCskYd9bJXIgI43ykLbQDesfjw09N+zTIFkKkE9Fk6H8UsnRQwjBUfF6M8tQt8Rk4Ap1pnqCHqrbyi0122YJE0gmEHr75PylQ/MJNC7iicCQFH/aqZfyIGtqtPfU/FYlMQokMOw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2252.namprd18.prod.outlook.com (2603:10b6:907:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Mon, 6 Apr
 2020 19:21:01 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::3d:5c5b:af00:a4a6]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::3d:5c5b:af00:a4a6%5]) with mapi id 15.20.2878.018; Mon, 6 Apr 2020
 19:21:01 +0000
Subject: Re: [OE-core] [PATCH] cmake: fix Python executable with cmake
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200402205632.1355452-1-mkelly@xevo.com>
 <CAMKF1sof=p33GFPcw2wL4JO59iAuSh6e0+9ZcaQd1K5HK-MOuw@mail.gmail.com>
 <CAMKF1sqjZGoopbz0Pp7MPySSx6D0MCHtbv1Uf4tPEJhDtnVeLA@mail.gmail.com>
From: "Martin Kelly" <mkelly@xevo.com>
Message-ID: <bf28d882-3e28-4f80-b279-14a6192aa78e@xevo.com>
Date: Mon, 6 Apr 2020 12:20:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <CAMKF1sqjZGoopbz0Pp7MPySSx6D0MCHtbv1Uf4tPEJhDtnVeLA@mail.gmail.com>
X-ClientProxiedBy: MWHPR14CA0052.namprd14.prod.outlook.com
 (2603:10b6:300:81::14) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.254.27] (50.54.140.49) by MWHPR14CA0052.namprd14.prod.outlook.com (2603:10b6:300:81::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Mon, 6 Apr 2020 19:21:00 +0000
X-Originating-IP: [50.54.140.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768285af-0e5a-44b5-0390-08d7da5fa455
X-MS-TrafficTypeDiagnostic: MW2PR18MB2252:
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2252E513D94A2140CC14386DABC20@MW2PR18MB2252.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR18MB2236.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(136003)(396003)(39840400004)(366004)(346002)(31686004)(86362001)(31696002)(4326008)(81156014)(16576012)(2906002)(53546011)(52116002)(4744005)(36756003)(316002)(81166006)(6486002)(8936002)(8676002)(5660300002)(66556008)(66476007)(186003)(2616005)(66946007)(956004)(26005)(478600001)(966005)(6666004)(16526019)(6916009);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TMdHo9whjPrLSPeQzbFQ+mMX/MhKCVwqbFJk7eTYcYijbgTVEJFwSgkBfylT3iX8/BUgIjcpBU/O6AuIIfLWhXmp3B3qe8odJGf5rKE5kHVeW57MCtpLNChfDSQoHnw3tdogdoJRRHqecu58+gv/Kp/BX4+Tt6GbY9hwjKU/XjhT6US3pNluCZQrY26SnV0xEX3lp07VCaDCCE4RsAmvi6vhs267X9rXpcramMZBdk4+1LF8PTTRhXA7Stee2BvwlA5zh3K2cFFVKa5Auwr/ZkJ6vrfIM5NSHzhpkO67Sj30WgTJulFeLMQwPm+Zgmxk6rrqqOlK9bSjOKWGcOkVuvmgrAlMk+ZkxeKvBs6KZ2dDYsJdEOS6eBTcGfG8Xk82N2hJan8E0sIEaegXAfHuSSqalMpTR6gugVTzPd1SOrvS6rggTeJNeC6rrMK9eqBeSgVfxK8nOtKlFHuA1mGGfpQCB+gxoEDEx9cUASarl+w90xF1vdC4lUgKVEN5fPXyu62hTAhHwoyKIqj8aydhKg==
X-MS-Exchange-AntiSpam-MessageData: 
	KR+RskxP0CHm4KvWF+lk/oWDZUBz2F9farv2vrNQPwGcxv8DqtJ0UJ312tIjY7knCZ90QQI2eA+TGa3/s5ykbmoVEC5N3p1kETaEize0ftWJQHm7tdM1zp8DKQKq4djjXsh3D5ziUNpzDXoF9onw8g==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768285af-0e5a-44b5-0390-08d7da5fa455
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2020 19:21:01.3055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CI6qGUsFLCxRepZHaJs9D/KlFR1YGxtwXfxhbX7ybzr/GC6hRVUz02cCTBOF1vPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2252
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/5/20 8:55 AM, Khem Raj wrote:
> On Fri, Apr 3, 2020 at 5:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Hi Martin
>>
>> I am seeing upm package failures, which I think are related to this change
>>
>> https://errors.yoctoproject.org/Errors/Details/400570/
>> https://errors.yoctoproject.org/Errors/Details/400566/
>> https://errors.yoctoproject.org/Errors/Details/400588/
>>
> 
> I looked at it a bit and have sent a fix for upm, hopefully rest of
> meta-openembedded packages are ok
> 

Sounds good. Thanks very much for catching and fixing this!
