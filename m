Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.88])
 by mx.groups.io with SMTP id smtpd.web10.771.1587129754524673728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 06:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O3e/9H0T;
 spf=pass (domain: windriver.com, ip: 40.107.244.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThJbCezc819/PqE8TfYscQe4QisYdJloOkOCR0UyTUwUBlDVq3uum0eZf3gH8NVAyQJEGH6S8WQzqGf0JX+WGpRtR5L13Q22DkovCKwlOATf8bDumD+ojDW+/uPFepD5ihonyMGANGM4sRCTj2xAEjEPsb7iWNyTRv0iTsYYWFUFjTd6zs0nlu0bvx2Ts5bLivuHXRdX5mVb/87nv15F0FqViFFikCzG8Q9WVv4Ei/y4OAQQJQt7Mq0rKwJHrxrQ3nxmPtmkQ/OWnHPYy47sfOV6s9tTboE9LGCnAhOAdaL5pOWFoyjCiYnH+KhGPi81GijdN1X9JyVZXCSWOknrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNvAukO1+2RVYIPpQOkqWLb2H5Rek+KcKLCcNeNr3X8=;
 b=ZR+iWCXjH//4Qe+7ueoQHeaZZyUSp3qAil4fFRWMDjENfM6LJkbm076vOXI9YPD7tJ54NdVm+AJeViA/rlWNv65tm5xkUoq7ANcC87SJqHfUZ1Lb4fjfZV587hhQ9L7oR7BqhMdeuonVutvgbw2SnnSD02J6mR/ChezVd6MWTOz/hUIjJI/6xBMkH6BEGBXOTQKRi0gL91dcStsIQ3a0CwlPjFTfff+i/QPxgPq0yNN5amKp7Bc2SY6bzvQTmwQ3yVqS6jcpaMoKumIAtazXxUbDpdIrF8oZMpyQGhGFeVsyEz27RtPlMqexb5HUyE2aMKDYQiCbvDEfpnIZJSeIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNvAukO1+2RVYIPpQOkqWLb2H5Rek+KcKLCcNeNr3X8=;
 b=O3e/9H0TpFeH1xjTklw1WNVg79lZv9OoV3TKOqZHV6V45o6myZ4BxFtaGPQOHPQ3nXmMfrqjoAPD2rA2CWZa6PoqeEIu8FQ77ol+an7QcDGHKtCYwgx7P8b95W0If6DIX0l6juDTdeAfHpbkBnwHqb5nMyXhm7nxc6vFL82Khkk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trevor.Gamblin@windriver.com; 
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB2004.namprd11.prod.outlook.com (2603:10b6:404:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Fri, 17 Apr
 2020 13:22:33 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd%7]) with mapi id 15.20.2878.027; Fri, 17 Apr 2020
 13:22:33 +0000
Subject: Re: [OE-core] [PATCH v2] buildall-qemu: automate build testing for qemu MACHINEs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200225141115.876047-1-trevor.gamblin@windriver.com>
 <55b9b8f7-1d5d-3b32-772a-0e918d0b0b66@windriver.com>
 <625881f18304de72d5df4ad14fc77b1907f4329c.camel@linuxfoundation.org>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b3eff968-682a-f4c8-c158-24078a81f123@windriver.com>
Date: Fri, 17 Apr 2020 09:22:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <625881f18304de72d5df4ad14fc77b1907f4329c.camel@linuxfoundation.org>
X-ClientProxiedBy: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 13:22:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2958f836-47c0-4892-bbb8-08d7e2d26320
X-MS-TrafficTypeDiagnostic: BN6PR11MB2004:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB2004B8ED763DB2EF6A694DF89FD90@BN6PR11MB2004.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(39850400004)(136003)(396003)(376002)(346002)(316002)(36756003)(110136005)(66476007)(16576012)(86362001)(2616005)(44832011)(4744005)(186003)(31686004)(16526019)(956004)(8936002)(26005)(2906002)(478600001)(31696002)(53546011)(8676002)(5660300002)(66556008)(52116002)(6486002)(81156014)(66946007);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZsV+shx1OUA01KlwczxYWAjbQgVU3pvQgONm4tOTP9BGO4CJ0L8DH9sz0P7GDFwtaQSmagt2IzwKErApSBA1Qz0+fsRxS8wVjeQVEgC6zYc2kbJpRVzocbqQdAdZo8jpHvvTT5vUQgSXNfKL0B4s/WVfX4mJoBL4SdHgNFhAVybkbC4it/nhLMTBGs4UbTvJDQC4XT12iJkm1WUXSG1nc/C5/fxTuMcxCsVQEsvKJGVfslP0A+iPA3dRZWGRJVWTdIleCDbeDzvUCyWre62PTdwPuRbNbo0lOnk5itDBe+fTmyiNsYqukRgPJrGWUnioGmmfj/AOygpIOSxv2eU8gVkbkrfJiB99NX3ksbfZyaAZw+jwpKU8IHnF9EkqWgm//7zeXi6wNnSPQBzr/Uthz8tAj34iXLbn9KDY4KmzKECv5G6UZLBpjh/DXuxHvx0x
X-MS-Exchange-AntiSpam-MessageData: 
	TDQY8QkessFgCGWkQ9aSm/41QbLIly9VSt71jNbJXR7kWcTaMAMj1Eok+Yh3qJYE+mZegcfsnzOadlfyL1ZXI6lPQ9JfR1RW2T8mW1Do7BprnuQtrBkoVPTJaL/gSC337BBzDNgIBGbey/qTmHoIiA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2958f836-47c0-4892-bbb8-08d7e2d26320
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 13:22:33.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fST4A4FLGaVwdp6oCgKES8fVqe70OntmOmpK9Dvf2ekgMavABtss9X8KbbGw6JZUjkhe2SUYuTBLbsIUjaoYI07haH9jSZ62cprPcG1Q2no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2004
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/17/20 9:19 AM, Richard Purdie wrote:
> On Thu, 2020-04-16 at 22:10 -0400, Randy MacLeod wrote:
>> On 2020-02-25 9:11 a.m., Trevor Gamblin wrote:
>>> buildall-qemu simplifies the process of build testing an upgraded
>>> or
>>> patched recipe
>> I think this is a useful little script. please rebase and re-submit
>> once master opens up.
> For context, the reason it was mislaid was that I was put on the
> address list of the patch directly and it went to a different mail
> folder. The assumption is I keep on top of my general email and I'm
> clearly not, sorry :(
No worries! I will do the resubmit when it is time.
>
> Cheers,
>
> Richard
>
