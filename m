Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.87])
 by mx.groups.io with SMTP id smtpd.web11.19831.1618433219503684985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 13:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dtQIVgMP;
 spf=pass (domain: windriver.com, ip: 40.107.236.87, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koBkUz0o36HQ+enc8gLmjZ/dfTWRoS9wwl2c+Us82G5SPU1j71bnWRSxJxFuPam6RQuH4AngoiU9Usc7rZhc7sxLd4t+7MtHYj1B11XwCK0QTtGy3NMyePP4MApc8mY2Dy/rH0obM59SV6sc2fQOiI1/ETka8bQnveXA5kmAW1OMfWZQNZqTCUYErNBG8elPmA3HQIqaRBNjJRANeKKlc4fkg8lA/WqAZcVIVzmZzeMDFCvL8zUQZ30yIJQYK6idmYii05nTnEBNqq1Fshr0n3xviU+ADzbAN/E9Z539a0xblbnW8LpOOFHCUt+eT88m74+U2k6MO/VBJwB27DwnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYWoIQ8V54pRn6Zs53Z9lk2G0Bxp90cMaoucrn8aAgU=;
 b=Zxc0sN0NNtQldqN8N/2nKa45mIB0xSS6W3zrdpKOhl9Wh58GUqElVIFeP4744FElAououYxb4dc6CXezEJOXWF/29OnopI3+6uaUVoNkNVaFXwM12wq7YGPiahnqwJwcm7o2tS3NRV8jbX+CiHcP9dbNij1ghTqFdZ7xFTRdPBHEMWTvQonDM0EyYxUePfmBV6AGHRhj19yNZZhS7LnMALIIUMI4brjNOKmJuwHv6gabAGO6bzw3SzEUJXpywmdtW7rJrqNAoYxd/7Yel7hX2l9WwY9zicBAwGhcYJhNFcnsQtGgyVk5o1C4KIFiS83MdpUOeZFp1B0+uF0zvzNxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYWoIQ8V54pRn6Zs53Z9lk2G0Bxp90cMaoucrn8aAgU=;
 b=dtQIVgMPkyvvLFKIV3NKEohLbXq7p6NWy+R3o78b1wX3I0Ne1keUEJhniENLQFbenBNlXUo7xSUd1fxOw1vJ3yGsbo44nhdObwzTRQoHAd75f80DeCkWtR2rsbr+4LlywLCqFnHJmICD7+NQt+jQNx/F8IreSnX6Uq+YCf/68fE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 20:46:57 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 20:46:57 +0000
Subject: Re: [OE-core] [v2 3/3] valgrind: Add libstdc++ debug symbols for ptest
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210414164018.2027379-1-raj.khem@gmail.com>
 <20210414164018.2027379-3-raj.khem@gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <0ee405c8-6482-7d0c-67b3-6b80a8a17d23@windriver.com>
Date: Wed, 14 Apr 2021 16:46:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210414164018.2027379-3-raj.khem@gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: CY4PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:910:16::17) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by CY4PR1201CA0007.namprd12.prod.outlook.com (2603:10b6:910:16::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Wed, 14 Apr 2021 20:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c14b41c-fbf2-4790-1d9a-08d8ff867182
X-MS-TrafficTypeDiagnostic: SA2PR11MB4860:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB48608C58AC0A764ABA54637C804E9@SA2PR11MB4860.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ivnfR+HLhyzrrpXc5P3WUzI0/sGHUhaPQDfpNWGoEFb/ShGLwHmU7MQx4Y1MF9klcgTnnZ11H8hJJG9N31fgxsAEoIZt/GXDk8nMyz0LpeSrM8rE6UUbRkW4+yk3/YhPXu1EWkKF/uVYHXqYtiiUa8G5vZjgYK4RzuQgHxkAxq+ZbYtRzUGC2Q06IViAfaggXGwCR5PeOXCupFrgnrcEMRxyy8LFgIGtxml6GqRbjYLU+kFanO+h80YgUdvSBg44hQSyAvWp/XGobQ7YlZh2jrCxwmrzhsZuY2F7KGrt3FhhJqIq9BgnrCADkJgMsHixlyUT0JTzW951MEvLJZoDaR6z4bKECP/jxZaHOSwxaGDGoTJRlnmhMCnftiwvaa++ousMt5JY9rYdkw4yoV/sMm6qT6cpU26p00s57kGonNBYNbAKfRhNAAgOC5UU7Ugh0nREzn6nsuvRnN323CINiXnCXIQkJS+vheOwexJGMnrEzmWmEfOq5+ljbEo1ZyyQRwNJrtG8gyN1fTyR/5tTt5OPOXV+BDvRC5FkbrJDZwafTXPqgtaAaOUF+GKvPZlg2FKqujiQNdZR7Aq+BuJm+1XS2vxQayH6TXFXOca0ABVsQSB+Zvnu0J26wQUkTcdJWunwgfWN1DsGdm74+c48reeXa++b+UhYkijLBExDrtamxXjW2Ieq0I3mXyS8dU1I1r+7otziEtqDRyRDnbHNLTBp2DVBndn5NiVYvC0Y8eC93ANJ82qKR2bSnweBz9rIk1xfgK9Ii+Mrm9IKdcXi5PxU7KVbLFSS54jDHGRk+k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(16526019)(186003)(31686004)(956004)(478600001)(86362001)(66946007)(66556008)(66476007)(83380400001)(316002)(5660300002)(52116002)(2616005)(26005)(53546011)(8676002)(31696002)(38100700002)(36756003)(8936002)(6666004)(966005)(6486002)(2906002)(38350700002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aTdFTUV4TG4veDIxZ1RjRFVrYW5mR0JiUVJuSjB2bUZ1Rnl0ZXM0RXVPV3l2?=
 =?utf-8?B?UlA5eitGME15YVluZzdZeXRFTUEwMWRmdGR2M0hTSFN3dzQ1S1NnT1R2VFlW?=
 =?utf-8?B?dDducE9QY2Q4c3NaNHhjMFZyU1JvdCs0ampQbjdsTTh5N3VkeVlBeUlMTUJT?=
 =?utf-8?B?YlgyYU9CQlRuMUxQMVgzRW1rYTFQVHo0TFhhRlNsb2xoSGpnejZoVDh5N0Ni?=
 =?utf-8?B?TkdWSy96eUhsY09GTE9GT0xwTno0YnVqMTFaNEZaYkRPTm5EZ0ZweXhmYXdm?=
 =?utf-8?B?ekEyZi9oZmYxTzhyaXlXelRxenp6UENEVFovdmZXOFNhMTdsTktxK0d2N0V3?=
 =?utf-8?B?U2hmZVQ4WWprMTZvaXJyMUZORFB5SzJNNkdZRDB0ektUaVJvTTdqYjIzeWFJ?=
 =?utf-8?B?VSs1QkEwbTg4R1huM09ZMUJnVFB5cDBMaDk2NzQyOHkzclpObmtzWG1KVjBu?=
 =?utf-8?B?OUtIcWw5RmNQNHQyZjNyTFJoTU9rcHFGcDVjeGNjS3JyNm1PSVM1c0E1clpK?=
 =?utf-8?B?T05LbVlXM3R3WUpmM2lKdFh6Zlo1NXZBcGlTWmk0bmcvZk9Ic0s0TUNsbjlx?=
 =?utf-8?B?WHEyemJwV1ZPa2pYSkNOYmNuVmlNQjdMczJudHFBdFdPZGh4TUVSenNqV2p3?=
 =?utf-8?B?QnVjcEVYbjJxMGs4dEZLL0k3b0Q2YmxFUzAzbFJaK3V0U0ZBZThGK2JwSE5v?=
 =?utf-8?B?bVBLclFRQUlzSE53dmc4d3FreUVEMDRtblJvWlhZSEhqait6UzYwMFEvcm9w?=
 =?utf-8?B?ZlVZei9qWTkwVFpyMkZLcEJuV3VyeFlYd3pOVG5BeGFyaXdpVG80ZWpIOVhw?=
 =?utf-8?B?QXZmVHYzRTVhSzB4a2xyU09ySHJEdzlkQzdsWmxGZml6VzU4OEhMT0k5NlRk?=
 =?utf-8?B?amxyODFTem02YUZFS1FJV3ZVU0ZlbHZpVXJYUG9mQ0pvQUFHRUlEWFB0WEM1?=
 =?utf-8?B?SnYvZnFYNFo2TkNnd1h2aWk2RVM1WG80VFZOV3ZHVFk1ZHZtS1VnTXUycEZU?=
 =?utf-8?B?cnBYRU5yajFkTnRUT3lIQk1aaVVKVE9kOVhQeVI1am9zVVA1SDljME94SjZP?=
 =?utf-8?B?OGcrTk9QazF4eFJDdHpsUEpmRnlsM3ZrY1ZXdXBVU1hsK0d3N2lsc0xpRHhk?=
 =?utf-8?B?eklrZGo5eVZWVk43dVE1bkE2Zmdtczd6RmJLY1BuNFk5VlVMdWUyMnlrNDJR?=
 =?utf-8?B?ODdSeVZHZ25WR2FXWDRUd0Q1QlpPTzhhdjZlNmRRbTUreDBlVVJJZXdiVysz?=
 =?utf-8?B?VStpUVBYUTFNcWZEL29DRFpKVCtMWkVWT2FqdEFDZy9oNWlaTUFEZWdPOVBr?=
 =?utf-8?B?Y1lPOWkyL210NXpYS3lyUldiMTNWb2NSRnQ4SWc5bzh5dHlrTUxGSFROR1N1?=
 =?utf-8?B?WjRwYTdyYXcyTlVYUWw2TWh6OVZNN0pvY1dubTlYcW5NZFZXcXBabkJPS1Fo?=
 =?utf-8?B?S1YyY2lCYlNQVC85Vzd0Mmc5cTAxamJBTW5GSnROdEFtVnhTcEtWWk5MQXFW?=
 =?utf-8?B?eVFaaTdCMCttbHZUUW9rVmxENmF1Y0MwY2VxQTZ5L29VKzhZUk9YVDF4RXdU?=
 =?utf-8?B?MEJGK3lFNVR6MzZRemtVVVhGaVgzZm1POUlTWWg1ZmdSY3dwckMrWExTTEFC?=
 =?utf-8?B?MGRoK09qWm1sdFBmQW9OakJOR0p5b3ErSjJBZm5UbjIySkkrVEdBZ2p2c0F6?=
 =?utf-8?B?VTZsMnc0eEhrSnFuNnRPU3hDR3hhVjFOZFM4NVY0bjkwWFdqUElyZVM3THdF?=
 =?utf-8?Q?2adhojHg6BVzHL4eRNxFNB7+oWJH7A+QDejvwGb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c14b41c-fbf2-4790-1d9a-08d8ff867182
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 20:46:57.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oPswUmdlLDBEN4aOPF0g1SEbZv77pkFOVc63oRte/tCIJfaZ+yz6g+de6K+FQYulVJM6ghwiKEix6QlYESfhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 4/14/21 12:40 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> new/delete symbols are needed by overloaded-new.post test
this test is passing on master-next on qemux86-64.
Is this failure caused by gcc uprev?

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> index d8324f1dc6..4eb948f2db 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> @@ -136,7 +136,7 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
>      perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
>      perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
>      perl-module-carp perl-module-symbol \
> -   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src"
> +   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg"
>   RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
> 
>   # One of the tests contains a bogus interpreter path on purpose.
> --
> 2.31.1
> 
> 
> 
> 
> 
