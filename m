Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.59])
 by mx.groups.io with SMTP id smtpd.web10.7210.1605199756676206566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 08:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GZBi6f6M;
 spf=pass (domain: windriver.com, ip: 40.107.77.59, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcY6hZg9wtV5FnIyOaFWzMfgyyB5trzLSDtZEyzgnBZSCKVXFoTY7ZPKeMr9O0sqJlLLYHX1oa+cX/WHm4VZgdrpxRnTYdXikTct90qBNQVQ2COYwj9ch0OPDXhC9elvg3tac+5mp9VvPJHjE8quRipE6XYsSDXph1Dh2UJIfKaMdYTa5waCrfc26dm9uP9tdLXelmavU5J82NzmGfNlvSmvb/kMNreE1ebYjUykz2QoyXBmHZmy+uwN1ELoHgc72ut/Ifa8wILP67SimolxeVnVPuYv/XooKeIYQIem9OoIdSKhjLrZ/iWOPHe+cMwdE0FDxcYbSZIK3enwc1T7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11l18Zq1TD9W+ymza2xnIuD4JhD/3Y+xoLIcu9SKv/s=;
 b=mz4jIr+ulMJFCjZTtY51KlLTlfFVuUAwF9WM6MJtKqPivwXqnqLutOVDlDZshOJgCIy1uVx2Xw7e5RosKYi73kYB9WHgMQA1cHnQAZTk12FJfNUhCbkodJc/1OiMAFZp2+WagIZ5LWQ+hovQcfJmSPgQokd+GvGMDdKX/FDNE9FM3jz3M07jYsgL5lfpzRwkOQeTJrd4K1eglbrnawV74q0pfn6vaNCwTlkQkvdYxnvtndL5IJAUDCIJJHTPolertWg4NyTciEcZlfpZcQ0S33oTeXeCl4scHRuMjBUaPJBq59qNGxwA6SyqOK4nT+l8UG8MjfK2ILmhG5lftVec+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11l18Zq1TD9W+ymza2xnIuD4JhD/3Y+xoLIcu9SKv/s=;
 b=GZBi6f6M01M/kyxOUP6sLNUv/moYSylvzuO+33Z930aomwjEOm0AC4/Jb61to+yYAy/ayL7Zj5PwnICVdJXJE3MOEs2KFYZW081Q24M1Ii0dZ97i6a1V3k2pl8bs1jmYrzNSIyVhMFpT+fcLqJ5Ycsn7V/IalVxvtsat7brgFRo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1578.namprd11.prod.outlook.com (2603:10b6:4:e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Thu, 12 Nov 2020 16:49:15 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741%2]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 16:49:15 +0000
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 08 Nov 2020 07:30:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201108173417.B6D3C960213@nuc.router0800d9.com>
 <e4aa0ed3-53ca-fad4-2168-2395d2855c27@windriver.com>
 <CAOSpxdadGrW2ntYVbVXSbvDcSZXB1bpiWZbz3XfPcrC2rGbx_w@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <afb354cc-5ee6-6e06-66a9-88f7af538a98@windriver.com>
Date: Thu, 12 Nov 2020 11:49:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAOSpxdadGrW2ntYVbVXSbvDcSZXB1bpiWZbz3XfPcrC2rGbx_w@mail.gmail.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.133.31] (128.224.252.2) by YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 16:49:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60210ed3-47f3-4bf1-d971-08d8872ae37b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1578:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB157856FA9191CBAA92988626F2E70@DM5PR11MB1578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Trs8ECC00bJGVnK3PhAVNeLj9EnKqfZBk/TCD7F5UOJAV0xTU4weOtWxlhFnu61V4q+trhAEEIL55UZS2WUwO1SBdwSZwsQanSnjk3BZ8ccRLOXtKyNSE+T/KyhoEp+BsBsR1/9/xxE9ISQ+/1XjKzBjjYgp/o2YklJZ83aaSAS+rl9Z199Nz96+628kaRjBzTxj4jIdg+YlqDD0pVMoSdrLePsqWM6qSSbJTeD5COQihc4USWZyMjzcU39l4hNVcfrRQCejCCKjKrCGIwsYLRaE3iNQcz1AgQjoBH+ZrzX+2O0uYBDF5dbOpzg1u4t5znj51Y4QZMuEzXxlyhOtoPJVpJVj1dVCEJqdQeGmkadeCWEYN3CD71DZ9GIwKbB6Sft+lKLA5yU3H8ONuCgKew3eEtGi9HGugT66QWOKdT8a4lgwgvkD6RF8Q21HRHv9kK1teRBnCQGnCfzkfBplYtTokenHr5+OgwdmZruSpKqC1oXIwbM9I66qODTI+Agr4460YCIW/RVrFtYV/FeS1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(66556008)(66946007)(26005)(36756003)(52116002)(53546011)(16526019)(83380400001)(4326008)(31686004)(8936002)(316002)(186003)(8676002)(86362001)(6486002)(16576012)(66476007)(6666004)(478600001)(6706004)(6916009)(966005)(5660300002)(30864003)(2616005)(2906002)(44832011)(31696002)(956004)(83080400002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jXiQO8Zrg64kJPTOF022i60XQNwaaKjCX7an3rowipG4VhDJHuc8nbvN9T8r9r2J+DVVxCsJEih5CgmrLZHkvvAcO7f0jDKwlV3ffIcbLYuJzXXDgVX7seyAida7x4UVU5Aoy02wUjSU7d6mNRWdxNrQxGxN8pGaGNuojD4Q0KxkOAQZn4kUP9JMXdBht/nIFCC3LUgJJgHnrdLjZOZ+UQDZ0tAewK24wW9GXFsxTsrTUQIexTx/fEOW02ZbXtudW0ZUDXhvDUwcG4BapGNrLLO4PKHSOs/uDBwewcYmZMH7q9A/K91i32O6ikjbEZNNbI9PAiy4xHcl4tpI4NgQ7daKlo57RXktJpuMMUdt1h6p6DfYCXkbhgwRejvUFb1LFuwLGL+HDid2KTCzxUzDef6jlp6XlFv/3Dv/ntKbEXAFCK6IRFWV5Y3iwmhoAmCK/Opr4dtgfKrOhlRoiJHA6DOMa1xZWJvwOrL/BtUdWILGyeRJMPco9bv5VuGzdq96hIXVtZzjD25H1bjUyM0HwQHuc/EvUOR8wRjoNjaOYrpqyrkG/kv29wH0UiWH2ehHgyTvGq3MIpuvrLwxkzwmupCdhLhwRxpwsqSNYSyHLEYQu30IxBA9jZfmp7O9iCi2vYGvXzuQXs0YvfgwXY8257aMl9u4sU78QMxKFLG+IcSCyNhGOBFWe20ckyVavaZziBzIc6U/+rA++cWDYy8rbf6K5PoPqIuUfYE7fAfCypUMm+5tkjQrEC+MAfLQub0zNuFHYHp78A26NiUZEezlgEiTG6y5z2qTAilx/Y3UnNKHtyFFdpLGtPfJY/O81ISsBUKVdT2NALFR7/02sJQLuopiCvLoS/fUuJ7gTOqxMT/GIb3X5q5DHNrDZXFRckSm4TuysFR3Z5KpQcA8pp0EpA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60210ed3-47f3-4bf1-d971-08d8872ae37b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 16:49:14.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hjou/oOqFw6dHLOTNYiRMedsaS+aEeovonsZc5u/uIztUTnlpOKgfLaSObt/JW2ygjmFPq5UCqoSEvAZfXZqZgLknCEAE3aQvZTk5xl6H0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1578
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2020-11-09 2:57 p.m., Steve Sakoman wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> On Mon, Nov 9, 2020 at 8:36 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>>
>> On 2020-11-08 12:34 p.m., Steve Sakoman wrote:
>>
>> [Please note this e-mail is from an EXTERNAL e-mail address]
>>
>> Branch: dunfell
>>
>> New this week:
>> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
>>
>> Removed this week:
>> CVE-2019-20175: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175 *
>> CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
>> CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
>> CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
>> CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
>>
>> Full list:  Found 86 unpatched CVEs
>>
>> I will look after the qemu CVE's from CVE-2015-8345 and onwards.
> Thanks Sakib.  I appreciate all the help I can get!
>
> Note that many of these are matching due to the CPE wildcard entry
> matching all versions.
>
> So the CVEs may be fixed in recent qemu versions and all that is
> required is a request to the CPE maintainer to update the wildcard.
>
> But some research will be required to see if this is the case.  If so
> an email to the maintainer can get this corrected.
>
> I've already done many where the fixes were somewhat easy to locate.
> The remaining ones will require varying levels of effort.
>
> If you haven't sent database update requests before let me know and
> I'll send you some examples.
>
> Steve

I've triaged the qemu CVE's mentioned below, summary as follows:

CVE-2015-8345 - CVE-2017-5957 all have fixes that are in qemu 4.2 used 
by dunfell.

CVE-2018-12617 onwards have fixes but are introduced in qemu 5.[0 | 1]

CVE's with proposed fixes are as follows:

https://nvd.nist.gov/vuln/detail/CVE-2018-18438
v1: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02294.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02396.html

https://nvd.nist.gov/vuln/detail/CVE-2020-15859
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg05304.html
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg05341.html

https://nvd.nist.gov/vuln/detail/CVE-2020-25742
https://nvd.nist.gov/vuln/detail/CVE-2020-25743
https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg07779.html
https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg01568.html

I have never sent database update requests, some examples will 
definitely be helpful.

Sakib

>> CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
>> CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
>> CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
>> CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
>> CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
>> CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
>> CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
>> CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
>> CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
>> CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
>> CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
>> CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
>> CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
>> CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
>> CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
>> CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
>> CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
>> CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
>> CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
>> CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
>> CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
>> CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
>> CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
>> CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
>> CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
>> CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
>> CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
>> CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
>> CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
>> CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
>> CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
>> CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
>> CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
>> CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
>> CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
>> CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
>> CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
>> CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
>> CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
>> CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
>> CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
>> CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
>> CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
>> CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
>> CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
>> CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
>> CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
>> CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
>> CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
>> CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
>> CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
>> CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
>> CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
>> CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
>> CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
>> CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
>> CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
>> CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
>> CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
>> CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
>> CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
>> CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
>> CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
>> CVE-2020-14308: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
>> CVE-2020-14309: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
>> CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
>> CVE-2020-14311: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
>> CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
>> CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
>> CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
>> CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
>> CVE-2020-15706: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
>> CVE-2020-15707: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
>> CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
>> CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
>> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
>> CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
>> CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
>> CVE-2020-25613: ruby https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613 *
>> CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
>> CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
>> CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
>> CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
>> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
>> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
>> CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
>>
>>
>>
>>
>>
>> 
>>
