Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web12.16040.1604946984609438607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iy6srWD3;
 spf=pass (domain: windriver.com, ip: 40.107.237.66, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI1c2eIdM2L0Mn1cj7aiGcTapE8JShQXEjDJ5aRsKx2bB3MK99SkXV/ErtCLfbrhLarln3+u65FH/1Ktp/ozfsK53j9AXURzHRoYuGxTglvqA2HtVcElzCAtzKLWGn2MFIo6QvNyP5aWeWV6QZB8K2lxygtJfO9ZdL0mR3LeJgABUZpN2mjEDtWHJG1X2JCJZ/jJJvUxjioF+UeHlS5AWliQNmbh3YYP9m70ClSvUTVr7AMWdAw7ImdrMpUHIYLdXN+uutGeeG8Qpr2WZEsnZOMEHyFoXEGgIHmyp2eieggJaE24J4J6dCtbV4yeMp6ky9OD63gISTdkbMFNEClzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFTggTgcXVjLNATNXce4rIVaNWspZMq51HN4TBUwHlA=;
 b=kmR6KN51q08pRPMGRn93UIWytOqA+TpZwKYA9C4XjDTzR7jUFxWXPSdquy9SgjJPNjHjhiso8Kq6sJBDxagqaEaUmqiQ2erH9VzcVTXPWH75BJ7Za9Os+5ajl4E/HoM/IrOHF3+EBFVQqT3XnAW2UH7AI8hL9mxxFKg0iVlHK92wEGkUyuS4iGuduMhE4aaB0uou8eV+Zk/Xl3su3JUwk91y2SnmQou79mgX4K6m5WXsTrIX9TWgLxQIK1NJF+WQXs9oRYw7M27KEO++JMWPrabkfbZm3EtoJKnfYqu76DhH429JNHVQqP/HHb64XbqBHrs+ZDNOQaHxCQq5UzGedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFTggTgcXVjLNATNXce4rIVaNWspZMq51HN4TBUwHlA=;
 b=iy6srWD3SHmAw94KU0Wk3V8cvJjrJXsfezqxI06zcZtZDLZaDqInAMBrxqhqjw1jCza/d9cPNJGYYj9ywHHWkEmUPb6tqohTTepdDv5YdyVO0BJOntSt2zE72pfKObS9p9QJu5JCT2dni8Z6h/0wPcgujxNB7JKOu1Hjmc25WcU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4441.namprd11.prod.outlook.com (2603:10b6:5:200::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.22; Mon, 9 Nov 2020 18:36:20 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741%2]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 18:36:20 +0000
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 08 Nov 2020 07:30:01 AM HST
To: openembedded-core@lists.openembedded.org
References: <20201108173417.B6D3C960213@nuc.router0800d9.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <e4aa0ed3-53ca-fad4-2168-2395d2855c27@windriver.com>
Date: Mon, 9 Nov 2020 13:36:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201108173417.B6D3C960213@nuc.router0800d9.com>
X-Originating-IP: [174.88.220.58]
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (174.88.220.58) by BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 18:36:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71704350-96b3-4dbd-64a4-08d884de5a0b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4441:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB44413ABC62C3EB53FAA8176EF2EA0@DM6PR11MB4441.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Ldl31nlcB8wz5CuYMH0QsgQlAdTtWTnm/VBckLi14ylEL0xTyJKYeqpJ+PLST1gpwbohqrz16/lNhD3KxLy2tW2uZ6DopE0VNs9RgbHCz7tTcaKoLLGnUXMx4IjsKFLFwmHqWcg8hB3FAcTeFR0SiOrV8cijIXkDjZTMblLAglIIEF/pgoLnT6i+1RUtAG42tmI1LVIk65UWHFl6Nvj8ZNEmX7/dVmiOuJ36zUiozLzVBDwuyjZsPq7lPoStY7dkqxWSzJqismHhuYK7a7K5NfO28qqntBLQbrHLWC/lJbdupMNPDXcG4hk9MbQz4hYuLxcfUSJbCBTSffQ4HsCWcN+9G83J2fpu8Z4pUqgoHXy38y2KDcJARe/01qPVFnIJPn+5TwHW2sFrjCo7xubwew1HU01sA03C9VwMMkackVw9F3ksUSEor+t8jjjoiU3UjFSWe/+5BiykXE2llTFpdTQvWabmBn4dIKnSOjtBN4BzyeDjvp7PJSC2hVsOpEH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39850400004)(346002)(136003)(2616005)(166002)(44832011)(52116002)(478600001)(956004)(8936002)(6486002)(2906002)(31696002)(83380400001)(86362001)(83080400002)(16526019)(186003)(30864003)(5660300002)(26005)(66476007)(31686004)(36756003)(6916009)(33964004)(66946007)(966005)(16576012)(66556008)(53546011)(316002)(6666004)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tJUaLPs9gMpCbzdWLaf2i9vnOra7e8mC7Y4asr56hJNzhspGFpB2PS24iF6gIbXc9AGig06i3I3qvjj+y2/6KMRjcEEuydFvw+Yrz/8lVjYJZIgX0arZrarnZG7KBRgz2RraR+F7z8ByvqIuZBjmjb9vo6PyFslvionmqg7IxWY+T+kioeWmwk8OzYjjG17sviDbd6Uec50gEmIrPeMg+qnu+R420zyut6fmmwBjcE3I+dzUh/4LKktG7NsHFKZAyDxSIyg2OOUXuq0wp1IozmzpScptoFJNgrWGW9wKnKaOAmV+S7NlW/+OPtd8l86LZng9ct1lsZ605oNNl5nEILPKaMKcYhkzCsQY9uutP5FDWiqEz/e0EsDJJ1GYurAxq7+SFuPeQPC4AB85azHeT6clvA0cRo8XipeyV5dX/S51fgQj7wX82tkLnOZAUPwGbvKNOMhwHfSVTMaQLdADf9oFjvZpnOA7zTmjirzSDzuKiY/5SINOBNwx5yizNuiMBxzJvGzYf90hvOv5uGqpTzVrAnHC3M1HI4XHotjMhS9sLvqOFVjdNJ0giz+RBKb95bCuVuUZqLOwBdlp16FjGVwVdZyEMuIiflKG7NW6/Bfoh+OyKnXJe6CgCofeVaOYQGOZT7Q8ADyFFN/MZbx9vgrJbmRS8N8oiEqAV1BBDcayEMgQ5WQZGgleHTYfuzLjmcG/62IkHWl07AqwFmvD18eTowTe5eVmg9TyrOHfqrXgENuTpR/5hjXqDv0xxM3/7QXi1UNRXPgO0lc7ieO+eDek6MVr31GTWxgoGRs7GKg8BUPwAIgb+lMOJHt5A4zVUO0z+ZtiIZEF8sLesYx7ZL44L0oY9ibHRrg3Znt3JrhI/NAUCH3w8CXR0pQdVQ7LVUNtN7P9VWERiwDs9FDBNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71704350-96b3-4dbd-64a4-08d884de5a0b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 18:36:20.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ3fQJLIeMQGnXGlI8kmXS9wCL5vJprPSBrd1RK0kj6JF/63WKbtjPpx3KspMm7I4SH9ho3Y/H6Q9QaBjQxSnfRfWG8pACbrUsR9qTa/2fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4441
Content-Type: multipart/alternative;
 boundary="------------C74F3420B20BA20EB34B7820"
Content-Language: en-US

--------------C74F3420B20BA20EB34B7820
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-08 12:34 p.m., Steve Sakoman wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Branch: dunfell
>
> New this week:
> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
>
> Removed this week:
> CVE-2019-20175: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175 *
> CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
> CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
> CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
> CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
>
> Full list:  Found 86 unpatched CVEs

I will look after the qemu CVE's from CVE-2015-8345 and onwards.

Sakib

> CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
> CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
> CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
> CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
> CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
> CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
> CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
> CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
> CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
> CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
> CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
> CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
> CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
> CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
> CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
> CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
> CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
> CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
> CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
> CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
> CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
> CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
> CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
> CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
> CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
> CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
> CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
> CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
> CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
> CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
> CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
> CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
> CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
> CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
> CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
> CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
> CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
> CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
> CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
> CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
> CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
> CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
> CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
> CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
> CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
> CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
> CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
> CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
> CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
> CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
> CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
> CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
> CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
> CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
> CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
> CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
> CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
> CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
> CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
> CVE-2020-14308: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
> CVE-2020-14309: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
> CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
> CVE-2020-14311: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
> CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
> CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
> CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
> CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-15706: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
> CVE-2020-15707: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
> CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
> CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
> CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
> CVE-2020-25613: ruby https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613 *
> CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
>
> 
>

--------------C74F3420B20BA20EB34B7820
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-08 12:34 p.m., Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201108173417.B6D3C960213@nuc.router0800d9.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Branch: dunfell

New this week:
CVE-2020-27619: python3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619</a> *

Removed this week:
CVE-2019-20175: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175</a> *
CVE-2019-20334: nasm-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334</a> *
CVE-2019-6290: nasm-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290</a> *
CVE-2019-6291: nasm-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291</a> *
CVE-2019-8343: nasm-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343</a> *

Full list:  Found 86 unpatched CVEs</pre>
    </blockquote>
    <p>I will look after the qemu CVE's from CVE-2015-8345 and onwards.</p>
    <p>Sakib<br>
    </p>
    <blockquote type="cite" cite="mid:20201108173417.B6D3C960213@nuc.router0800d9.com">
      <pre class="moz-quote-pre" wrap="">
CVE-2012-4564: tiff <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564</a> *
CVE-2012-6094: cups <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094</a> *
CVE-2013-0800: cairo <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800</a> *
CVE-2013-4235: shadow-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235</a> *
CVE-2013-6629: ghostscript <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629</a> *
CVE-2013-7381: libnotify <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381</a> *
CVE-2014-9278: openssh <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278</a> *
CVE-2015-7313: tiff <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313</a> *
CVE-2015-8345: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345</a> *
CVE-2015-8619: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619</a> *
CVE-2016-4002: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002</a> *
CVE-2016-4614: libxml2 <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614</a> *
CVE-2016-6328: libexif <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328</a> *
CVE-2016-6489: nettle <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489</a> *
CVE-2016-9101: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101</a> *
CVE-2016-9596: libxml2 <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596</a> *
CVE-2016-9598: libxml2 <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598</a> *
CVE-2016-9907: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907</a> *
CVE-2016-9908: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908</a> *
CVE-2016-9911: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911</a> *
CVE-2016-9912: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912</a> *
CVE-2016-9921: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921</a> *
CVE-2016-9923: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923</a> *
CVE-2017-3139: bind <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139</a> *
CVE-2017-5957: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957</a> *
CVE-2018-1000041: librsvg <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041</a> *
CVE-2018-12433: libgcrypt <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433</a> *
CVE-2018-12437: libgcrypt <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437</a> *
CVE-2018-12438: libgcrypt <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438</a> *
CVE-2018-12617: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617</a> *
CVE-2018-13410: zip <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410</a> *
CVE-2018-13684: zip <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684</a> *
CVE-2018-16517: nasm-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517</a> *
CVE-2018-16868: gnutls <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868</a> *
CVE-2018-16869: nettle <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869</a> *
CVE-2018-18438: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438</a> *
CVE-2018-19665: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665</a> *
CVE-2018-21232: re2c <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232</a> *
CVE-2018-6553: cups <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553</a> *
CVE-2019-1010022: glibc <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022</a> *
CVE-2019-1010023: glibc <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023</a> *
CVE-2019-1010024: glibc <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024</a> *
CVE-2019-1010025: glibc <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025</a> *
CVE-2019-14865: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865</a> *
CVE-2019-20446: librsvg <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446</a> *
CVE-2019-20633: patch-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633</a> *
CVE-2019-6293: flex-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293</a> *
CVE-2020-10648: u-boot <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648</a> *
CVE-2020-11022: jquery <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022</a> *
CVE-2020-11023: jquery <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023</a> *
CVE-2020-12825: libcroco <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825</a> *
CVE-2020-12829: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829</a> *
CVE-2020-13253: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253</a> *
CVE-2020-13434: sqlite3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434</a> *
CVE-2020-13435: sqlite3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435</a> *
CVE-2020-13630: sqlite3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630</a> *
CVE-2020-13631: sqlite3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631</a> *
CVE-2020-13632: sqlite3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632</a> *
CVE-2020-13645: glib-networking <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645</a> *
CVE-2020-13754: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754</a> *
CVE-2020-13791: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791</a> *
CVE-2020-14145: openssh <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145</a> *
CVE-2020-14150: bison-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150</a> *
CVE-2020-14308: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308</a> *
CVE-2020-14309: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309</a> *
CVE-2020-14310: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310</a> *
CVE-2020-14311: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311</a> *
CVE-2020-15469: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469</a> *
CVE-2020-15523: python3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523</a> *
CVE-2020-15704: ppp <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704</a> *
CVE-2020-15705: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705</a> *
CVE-2020-15706: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706</a> *
CVE-2020-15707: grub-efi-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707</a> *
CVE-2020-15778: openssh <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778</a> *
CVE-2020-15859: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859</a> *
CVE-2020-15900: ghostscript-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900</a> *
CVE-2020-24352: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352</a> *
CVE-2020-24553: go-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553</a> *
CVE-2020-25613: ruby <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613</a> *
CVE-2020-25742: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742</a> *
CVE-2020-25743: qemu <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743</a> *
CVE-2020-26154: libproxy <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154</a> *
CVE-2020-27153: bluez5 <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153</a> *
CVE-2020-27619: python3-native <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619</a> *
CVE-2020-3810: apt <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810</a> *
CVE-2020-8432: u-boot <a class="moz-txt-link-freetext" href="https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432">https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432</a> *
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C74F3420B20BA20EB34B7820--
