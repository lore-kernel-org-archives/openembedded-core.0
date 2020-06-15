Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web11.8819.1592185839238848857
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 18:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LiVKqNr7;
 spf=pass (domain: windriver.com, ip: 40.107.93.82, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTNF+HojCiVXVT9vNzu/jyDsoBxHkZcWVRfer7Beyx4sC7s+LHjeuuvCDubjOi+tNqBuztWcDDN5R2YLjOklgzfEN0eava5XX8x9rcLOuzMdigwrxGcdrVBcNyVWpPHqfx2Ekq8mtP26M+F7s57ISDqAwdy6WcjDnQKw5i9tJsXBH5o7Njkyy4sVYjBCnF0Sl5In8p09WZgE3DPsZWZhDN5y1igzpeIsz33gul322N7VqEPluHbzujf2hs6/VDlTVcQc0MCsZfUQTcG9/8WvdWFIfc9hY3MZOYAeo/gN4y39ikFVytOESPCEEKXjtdNKTFwXBmEyQuzXYwdHo5dscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sllMvT/lArAousV0wMyKYnxRAxmfaHzazPUhYtFXhMU=;
 b=dcCkJtOpBB7Yqfzq/Gj3nd/f5vtSiohx9uvleZ21n1YN4tQsAMm5OdZQvb81X5I2uUKibHcCYZFbqqq8JDmZgdt1sWvDCu7eem8fWyJN23Z4H35/L888qbzx5bFNW6DZkajTKsqV8fHRxrpHXRt33hfPm1t7XnVUCsjrZd7gUBw4VQHq3a6zvOoO9Q00lYGoq2z0NrzVW1AW1YIbU4XC8uhrlR33QlWW+U3XTNN72q6H0IJn7/l9zeP0NKO/llW2RfELQNgrMS2/CMudzaXBYYmvBxO69wy7rA8pVcxSMsW+S4EE0ceyASsciOYhGM0+SclDCYNod5G593juvODrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sllMvT/lArAousV0wMyKYnxRAxmfaHzazPUhYtFXhMU=;
 b=LiVKqNr7DZrWzgzwU0mpaSQPLlMzlpywAZCUNpixPWlW297V8+fZrHKOA+/x+9N42tHHFITQYZV6X0wanaN/g3G0yve5Nq2PTK0T+qNj58TJjySsCRNr8zAu9+MCLFXbJ/sMw9Bkt3jt8sKyjFqy9EAQRzOfCZHh7Y6iz3iCOHs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Mon, 15 Jun
 2020 01:50:37 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 01:50:37 +0000
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
 <796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <4e4710a4-8e06-b2e9-f718-f77f374bd66f@windriver.com>
Date: Mon, 15 Jun 2020 09:49:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Mon, 15 Jun 2020 01:50:35 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31124f82-df24-4048-b170-08d810ce7fd7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29046A6246E3759A06998BD3F19C0@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7kmVEQSd7AD9xqFldW8z0JvfHq3VUBS7sP19/S75wU8Ocj3P36LdKiqhltg7UJZj7w03up2NIWV+zP8u4a67eOsx/Kcjh4KDgohMZZ8keGiy/viGxJD7/0oJ+gdPdeuFj3gxXka6Aql0Zal6XJlsGrtRiu9i//9/ryQjN3QyrlDsfD3GuPdtvZ0BtUk46PqLuwCQt4W1vkQhl6BIg1ry45Y4k92oKEKe9ex198uC89+moGyKpctt+OTJE0L1bWE9e9ysqhvSf4suOl77WGujZsCwrQGXEIi+k0DS17lnmHkhi31xTSbaKswzeQ3qSgRoNzIA/fzGgWPlNIS5SHg7suxgKNvls7DvQcF95KqmXap3jjuam8Zl+Gxa19EtUCBHHKNBZpHYAZ+24LhuZSzJRJJZHRkRveUGz3oCsrCf8wfvA42XO/t1gyhgHfLre0f9eCDpYtiP+G0ac+ShFvUVtGUXi6EmbzmtsvduboirC6uzn3le3fLr+r+Hkn8kwP3nHXapyJPQUUecccmcw28BLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(39840400004)(376002)(366004)(396003)(52116002)(31696002)(2616005)(956004)(86362001)(83380400001)(53546011)(966005)(6666004)(26005)(8676002)(36756003)(6706004)(5660300002)(66946007)(66556008)(66476007)(8936002)(186003)(16526019)(6486002)(16576012)(31686004)(316002)(2906002)(478600001)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ii23HTfdLVEcxVpj0OKn3mswU7Xx0OTQPZc4X1DJx+4aymfS2ZDksnAshYWN9K1KROWtvFYPpbXO+/GQLbOS/FE45xeZ0YlS/eVo5Y0ppjDw/0x4WWZSVoPbO4Qnwg1eFOtz9iWbVqlO1h5Dp1lMcm6LRwkGDvNy9x8KpOPKUjuxOgRu04ODFBuigP+eyWp7QcyI28uInYrPQyCGbbCGhhVC+yVHuXlVadH6RmJhS8fjR00BKsQQOjiCyLRTbVFZamexDoHy4MTNvVBqi++aidzVVIGft27lC5RZwzIg7fwPhW+mmv1NGPpy+FGMvvB25QH0xxrujGTxuEyRZ2FdzfpdunYSqGTcfFV1MSZI3z7iH2kb6RHW9Ef/ujvXs8FOGXF1DE5JOH7souOJbQFNQ0TkUFqqmV0WinoP8qh3jUUp9P+DuS7fJeFPLLBH2tewfNRWrMXznaAjjeqWsH/hdtj3B4TZuVRpEzprZF8957g=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31124f82-df24-4048-b170-08d810ce7fd7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 01:50:37.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLdOo6r5mWwrwF/twv85JdIH1YqujOZ51612/0QdvRyZIYZ7+S1ROp03hgUrINVSVWHyTO0JQUmjw6DWNfHV0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 4/1/20 5:20 PM, Richard Purdie wrote:
> On Mon, 2020-03-16 at 17:24 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Use git repo as the the previous URL only stores
>> the latest source file and fails to locate the
>> source tar file if we don't upgrade timely.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Breaks reproducible builds:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/825

I run reproducible build locally with "oe-selftest -r 
reproducible.ReproducibleTests.test_reproducible_builds" and It succeeds 
with this commit.

BTW, the netbase only introduces 3 files as below:
# rpm -ql netbase

/etc

/etc/protocols

/etc/rpc

/etc/services

And I did the three files' checksum and the checksum turns out to be the 
same when with the commit and without the commit.

Thanks,
Grace

> 
> Cheers,
> 
> Richard
> 
> 
