Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.67])
 by mx.groups.io with SMTP id smtpd.web12.7193.1592867907315946410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 16:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O2MYP0DC;
 spf=pass (domain: windriver.com, ip: 40.107.220.67, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTAsnCEhBR8SstZ+EcKImpC5p3yIISdZyaSjI/G+6tWyMv2Zzz/ncRJGQVD4VQAaxHovt8I3TAtJg9enl9C2ekMrsY55LNvO2lg9pM2k6q35CeQWxUTuXYXlnFLcLHn4AF3YL8IvBl3ZSHUKaoACBEVEgQlFZn+EWZLK1kcP+zdytl5dN94h7Do+317BUKUkjOTqnGmYgcQP0idSNvEYQHNJqS7w+15Nv3iXTP0l+IVkgTZUe76e2FzoUu+fcCnfRXhL/CscJUA3t9oNJc8oUwNqRX4wFB8vRft20jLLHIL2+WF+KPxmZUmmMpIgqpSGmSpcbLHnEQnBRRy4aAPdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dfTTJy7oDLtHP0Vn1dZvDcDEVNWCUE4iJWomg3jSo8=;
 b=NEO/bg3eh/yh8hfUj5O8UjMz2eatlYn5zHioQP3FA45vVqKSYEHzUUfhwF3pZDl5RQwPayDGLLAdEU3q1RLQ4WsySGBRG6ZticmT8hH+LyhoxCxKZnjamU8Jh+RSq9MBLolF5qoyS3YlvqCVnx6OeQrtZ+PTjjcwGUI1TVYDEQVMtPmOvgkswRncvxDZL4YvScqex6JLkmL5Zuo/XpydXUKjHezD2vw0Q5tgf1XqtcFDN7/FzczI9/RmU6h5ILW7t41O0pbktf4qBg1MuZ2bu95wsMjWkRxXWeRm8zsoq6T6Ia70ZXyOrvTKz2ysWdRykPUNrhXaHyxWCmYZsVytqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dfTTJy7oDLtHP0Vn1dZvDcDEVNWCUE4iJWomg3jSo8=;
 b=O2MYP0DCjrIuFGNHiWUI2zMQn1Z25J7eFYvNT0OZKRzvROwtMMbEs1uZvLUMFGBopLjE6TtsdeE/KUD1kNXYX0JZYgR4XMuJcNsYuZV+S3AfjT4TIPqRrun3wuL7R6Ji00vhVCD4G6C5LroPXXnXOhGWyK9OFYLLcX9jSw6Xr+c=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN8PR11MB3843.namprd11.prod.outlook.com (2603:10b6:408:88::29)
 by BN6PR11MB4099.namprd11.prod.outlook.com (2603:10b6:405:82::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 23:18:24 +0000
Received: from BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::4d84:7c50:21dc:4a85]) by BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::4d84:7c50:21dc:4a85%5]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 23:18:24 +0000
Subject: Re: [OE-core][PATCH V2] qemu: uprev v4.2.0 -> v5.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Joe Slater <joe.slater@windriver.com>
References: <20200619181259.39059-1-sakib.sajal@windriver.com>
 <161AEE4AD64EFA55.6387@lists.openembedded.org>
 <c954295945368b13368ea14ff92a025a21d207a2.camel@linuxfoundation.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <3fbdbc34-e5dc-60ab-667c-4170b2ced9d7@windriver.com>
Date: Mon, 22 Jun 2020 19:18:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <c954295945368b13368ea14ff92a025a21d207a2.camel@linuxfoundation.org>
X-ClientProxiedBy: YQBPR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::11) To BN8PR11MB3843.namprd11.prod.outlook.com
 (2603:10b6:408:88::29)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (64.229.138.221) by YQBPR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 23:18:23 +0000
X-Originating-IP: [64.229.138.221]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16f1bfbc-5e7a-482a-5250-08d817028fbe
X-MS-TrafficTypeDiagnostic: BN6PR11MB4099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4099A616D6FC097056DC80FEF2970@BN6PR11MB4099.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AIE70DaDn+CqJE0gWdTLBTg4A254grSaloPQOOLJeqne78cwwqqEDPtygHUZhKjdCp90paO7imImdk2LpxbPa/fmHxMMNo4q8c1KWX0jAabzRhS3fjWAsy8K7iykXMvBqh0jtLjsaWnZTVYA0Ad1kt46Ga8WmT0FLiTspiBIv5eEgQoomyl9oE+ojooWzFdF66wBmrjK33pKfFe7d71TSXd5mGR92otjKTPXgcNDeoY+8b7sUc8AKCgOxJb0TG7bZlkuTVwGZJY5v/YokCNGhuRETRYYcdZPUyLI2oXgDDnKTYpwebNGdtbgvkKaH6vq/3NmatybOxXfHGNZzR7zGkUMAsPIF0wDtoV5Ex/IbNlmLWKXGt6icFCmxgLT+vecsVyiGxQS87JTvdAZrg8wg1uaXrpjw0Lwh6oHtkP4f9iU5EzRYTAvd5sGUI5rh72ITCcQfW1BHx1F9rsQaZ/+Rg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3843.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(366004)(39850400004)(376002)(396003)(966005)(2906002)(66556008)(5660300002)(66946007)(66476007)(44832011)(107886003)(31696002)(83380400001)(8676002)(86362001)(4326008)(956004)(6486002)(6666004)(36756003)(16576012)(316002)(478600001)(26005)(16526019)(186003)(53546011)(52116002)(31686004)(8936002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wI8Ut+NHM0wKq2d0KaDJw1QbTxKU/KIkKjLfvxCVHxM7zM8maHPELImFg6PCJh8rGihtP+qXy3b5ssqouz9cEfGCFhY2t1YOh5O07ZUI3N3OvbSXJSEgerhr0CQkmg6Nwa7EKChluh9oi25ZZ0ehnL2Ti+R59uflXJKCkxO9mdfZz29LV19+T6tfIaxBZ8n0iKrp+CSjIaA9T5mk15c5ljnrKMl278/XfrXa0JlkQtvblu5c4JzkXVONYFAVHQDXkbU4bozOZ10KkeUhnyx0Fdm6aBQysO/bJqqjiVPxGoE9wl3d2pcXDmcDkwGIVoSqfkbe3ArERf9Zrriu9yWLdPcYvg3b3RrJh7A47P7lLOmaisSHoM5m6rAv52EezFm8aJtK+atGdxQPKR+uLQLskmK7ZsIyq4W4WpvdkHpmSbzUTO5FgLrS/UVeIm7jSTd0cmgjQKIO2/FonZwgMKOeKJFoctDjt4PfE8oAleJnWB4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f1bfbc-5e7a-482a-5250-08d817028fbe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 23:18:24.4012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPvzAXWFFgeJSLcsEy0j3ZN3ICrTyYmv2+MuRAsMmJfYqNt8DWi4hKtYjQ5d5eR28tPlOCx+kscMz2+j0H1wWSNu062PaV39CRx7OmlUC6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4099
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2020-06-22 5:00 p.m., Richard Purdie wrote:
> On Mon, 2020-06-22 at 18:36 +0100, Richard Purdie via
> lists.openembedded.org wrote:
>> On Fri, 2020-06-19 at 14:12 -0400, Sakib Sajal wrote:
>>> Major update after v4.2.
>>>
>>> Changes:
>>>    - os_find_datadir() was changed after the v4.2 release
>>>      causing v5.0 to not find the bios and not boot the
>>>      image. Fix is sent to upstream qemu.
>>>      See: qemu/find_datadir.patch
>>>    - v5.0 binary had host contamination for dynamically linked
>>>      libraries, "--extra-ldflags='${LDFLAGS}'" in EXTRA_OECONF
>>>      resolved the issue
>>>    - bluetooth code was removed: qemu.git$ git show 1d4ffe8dc7
>>>      hence removed PACKAGECONFIG[bluez]
>>>    - -show-cursor qemu option is now deprecated, updated
>>>      scripts/runqemu to use updated option instead
>>>    - added PACKAGECONFIG definitions
>>>    - added qemu-ptest to conf/distro/include/ptest-packagelists.inc
>>>    - increased support for ARM architecture, cpu and board
>>>    - removed patches merged upstream and refreshed
>>>      existing ones
>>>
>>> Testing:
>>> Build core-image-minimal against the machines in
>>> openembedded-core/meta/conf/machine and succesfully
>>> booted with qemu v5.0
>>>
>>> Ran qemu-ptest on x86-64 and arm64 with identical results:
>>> PASS: 1166
>>> SKIP:    0
>>> FAIL:    0
>>>
>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> This is in general looking good but we did see one error:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/2050
>>
>> which is strange as its only on the edgerouter.
> Its because qemu can't run on mips machines. We therefore need:
>
> PTESTS_FAST_remove_mips64 = "qemu-ptest"
>
> I can add this as a fixup to the patch.
>
> Cheers,
>
> Richard
>
Thank you Richard for looking into it/fixing the issue.

Sakib

