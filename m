Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.64])
 by mx.groups.io with SMTP id smtpd.web10.2477.1595357694205639887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 11:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C2GW5L0g;
 spf=pass (domain: windriver.com, ip: 40.107.236.64, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIFZ8/ZvVoDiQZohAgb5KmOKhauLtD2b9Sz/TC7RPSECQHyGeSf4r3PXTK2BkEzqeb9B6ECI+E8ZTghH9kGWZP1m1npdpdzB4DrkhedpC2zckw8ySqFonbi+/IW0vfC0PALssW6esVIrGfq7t1+UyxjByI17CqcX1fo+CeQjkQ/U7t5EJHduleUTF9HJioOfGybeIcoAOalnbj2Q3zdGAU9PnTR6veMz2LQVggQk01M9fufqryaCGh4w8ctw/7n5R3m/5HOG62W4vQyxeZ0GIBSHmgliml2Zs5eO7bQgrTsa4tXNl14NlSs+PLnGfZDpBdtgT+xbRa1ydD8cepOBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucy0iYh4EuZcEvmnYmJF3nKtQRCtx8LEbzgfscuBumg=;
 b=eneHmnwX7Y35eK6Fn0WNO5D8yf+u29Qedbipen3i+ov85iJ4+SEhqmaIOUT/zyIPzQZOotfRSGT8NGs1ZeIrRLU4TMaepW00eREnLZM9gJBMzESgkji1GZBbHYA8oALmSb1pV78Q8GoEfJlClyu1koR/R5wKQOyiS6CvByeemo6M7jKCUrjJravdKa4WLKt19aMWG+IUIji9jz58LeirnOAZUhmTVwTWT/P+u2+gN1Gj1wfAdrYab6jDQ+pre562djQul1dxSSzK8EQvb8Ff2jWv6aplCe5dnomrD08JHbQo77Ue5TCSrLZ0/gXzHRYw6Nl8yylp0eQGzJGAljtAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucy0iYh4EuZcEvmnYmJF3nKtQRCtx8LEbzgfscuBumg=;
 b=C2GW5L0gMab6SKZRI+UPqszY1OVjrbbHQCSafLzRPclwNjkNvf8Xyf1jUieQxfcdbYcRLlVjddRQ+dSutRNkUORSDkjrkKWWnA0SS+K+tBhbO9Ol1aRqTszgdqoLeGlzxSRKJMUqXw+mFycPhr8cEGISdBeepbzM7WHFYVJvc9I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN8PR11MB3843.namprd11.prod.outlook.com (2603:10b6:408:88::29)
 by BN6PR11MB1457.namprd11.prod.outlook.com (2603:10b6:405:8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 18:54:52 +0000
Received: from BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::9d31:3191:4077:153c]) by BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::9d31:3191:4077:153c%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 18:54:52 +0000
Subject: Re: [OE-core] [dunfell][PATCH] busybox: make hwclock compatible with glibc 2.31
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200721180054.38185-1-sakib.sajal@windriver.com>
 <CAK6=ix5bcxMfGME1jnf3hKFUMRFmHjaigCrxR-zOSjpad_LyhA@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <e38a0f69-f72f-3826-7105-70dd41b06431@windriver.com>
Date: Tue, 21 Jul 2020 14:54:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAK6=ix5bcxMfGME1jnf3hKFUMRFmHjaigCrxR-zOSjpad_LyhA@mail.gmail.com>
X-ClientProxiedBy: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To BN8PR11MB3843.namprd11.prod.outlook.com
 (2603:10b6:408:88::29)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.148.47.76) by YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Tue, 21 Jul 2020 18:54:51 +0000
X-Originating-IP: [184.148.47.76]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67818de8-7a57-4888-cf95-08d82da78ce3
X-MS-TrafficTypeDiagnostic: BN6PR11MB1457:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1457DF1E620E76DA51455EFFF2780@BN6PR11MB1457.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IiE9Sgi6bQze7kE9CS8nI4n008iTy3VgWGEJPkKcJEkvJh08c3BLo24YkJdVLioxHQVaaGNFF9VxImTtor/K0xc9U5yzbe07X0j+/T1uYHjtU+sG8zkPHk+y/wGXHWMcqnow/z+HqCz7aObhLr0J7qk5dge3gCleeb2aebnRkbLdnDTsyeBkUEuzucY0ectA2hPAT+sH6XWtLwNBWdjAbutNp6Oy3pZnWw4gmF5IIDibWozFup4slHy+9A3WggR/eckigRAUnFfUgeZEu8B31bYJgQD+XVNkruQ1mAfrQmbyCwSKdUE+qm3jPZ9x6VZKvtXJXIjSYA8p1TdpZDTbe6IBUlu3wOmi+AWHKFJoLO0udRdNvsCwGt468CpC12YoYWafQnvEUZmw3p+sfjyvvHiLTX+6RHit5dQXRLVkQveNYy8VacoWsJg02+JtQT1qegQJfKcSe3sCKj8H5xYUAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3843.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(36756003)(66556008)(66476007)(66946007)(6486002)(6916009)(83380400001)(31686004)(44832011)(2906002)(956004)(83080400001)(2616005)(5660300002)(186003)(16526019)(31696002)(316002)(26005)(16576012)(53546011)(8676002)(52116002)(478600001)(966005)(4326008)(8936002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LSb4L87NazNqt5gTVKL5nOxRDFm0ixaF5Mr0IEtqUOWOh6pxcf4tkxERCKPtpNCkrGjWu96vbKLT7PuMwoADSMqPe4KXX+GVgI9bqy7fT5EINkntA251KqWKOIl8Xbo/UGIweyl1oiu+0vmMCRyR5x9TXFH7uvO+nJHJRFKwxYW3LOwj6/EwpSj6Jon9EiOg0ArkZFJUWbaBJXOsH5lOK5NXi+qJGgjD3YTw//nU0U0aOiBqsKJW46ExFF5obXdaWsPXp5MEPXhIAPsr1o2+pk6163M2LHfHjyi3L/e1vszAu3CV4pc/LfRPkDA6Ccnl05eZl0tCDxc4PSaIMwLJZSP4WryUM6blHd0Adu8KBLyVyU9IisyPp8mtS7FapuMBPkTpSE6ZNnjLH0sEWiFubCbQctSFJplYzK7A9qRPJoXYoyX9pZVFmchpKLc+gRnXPoy4lKftBDeJPu6vLpv4AB+eXti9Rj0NLLxHia4oaDI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67818de8-7a57-4888-cf95-08d82da78ce3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3843.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 18:54:52.1502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clb9R9VRZrLw5vwouM01VYMTO5oS7g3EzOrmU0dlHu0HzGrw9ctQ9+CWlR9x2FezmCiyEBWSDHDU0+LHn7wo6a7vsB32LZLjJXgre44TfhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1457
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2020-07-21 2:11 p.m., Randy MacLeod wrote:
> Hi Sakib,
>
> Did you check this busybox fix against musl? I forgot to ask you this when
> you showed me this patch yesterday.
>
> Randy

Yes, I built core-image-minimal with musl and everything was fine.

Sakib

>
> On Tue., Jul. 21, 2020, 14:01 Sakib Sajal, <sakib.sajal@windriver.com>
> wrote:
>
>> settimeofday(2) has been deprecated as of glibc 2.31
>> which hwclock makes use of. This patch makes hwclock
>> compatible with glibc v2.31
>> See patch for more details:
>>    busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>>
>> Fixes [YOCTO #13981]
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   ...1-hwclock-make-glibc-2.31-compatible.patch | 83 +++++++++++++++++++
>>   meta/recipes-core/busybox/busybox_1.32.0.bb   |  1 +
>>   2 files changed, 84 insertions(+)
>>   create mode 100644
>> meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>>
>> diff --git
>> a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>> new file mode 100644
>> index 0000000000..8d1f272120
>> --- /dev/null
>> +++
>> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>> @@ -0,0 +1,83 @@
>> +From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
>> +From: Sakib Sajal <sakib.sajal@windriver.com>
>> +Date: Fri, 17 Jul 2020 17:27:21 +0000
>> +Subject: [PATCH] hwclock: make glibc 2.31 compatible
>> +
>> +NEWS for glibc version 2.31
>> +===========================
>> +
>> +Deprecated and removed features, and other changes affecting
>> compatibility:
>> +
>> +* The settimeofday function can still be used to set a system-wide
>> +  time zone when the operating system supports it.  This is because
>> +  the Linux kernel reused the API, on some architectures, to describe
>> +  a system-wide time-zone-like offset between the software clock
>> +  maintained by the kernel, and the "RTC" clock that keeps time when
>> +  the system is shut down.
>> +
>> +  However, to reduce the odds of this offset being set by accident,
>> +  settimeofday can no longer be used to set the time and the offset
>> +  simultaneously.  If both of its two arguments are non-null, the call
>> +  will fail (setting errno to EINVAL).
>> +
>> +  Callers attempting to set this offset should also be prepared for
>> +  the call to fail and set errno to ENOSYS; this already happens on
>> +  the Hurd and on some Linux architectures.  The Linux kernel
>> +  maintainers are discussing a more principled replacement for the
>> +  reused API.  After a replacement becomes available, we will change
>> +  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
>> +  argument is not a null pointer.
>> +
>> +  settimeofday itself is obsolescent according to POSIX.  Programs
>> +  that set the system time should use clock_settime and/or the adjtime
>> +  family of functions instead.  We may cease to make settimeofday
>> +  available to newly linked binaries after there is a replacement for
>> +  Linux's time-zone-like offset API.
>> +
>> +hwclock had two calls to settimeofday, in functions to_sys_clock and
>> +set_system_clock_timezone, where both the arguments to settimeofday
>> +were valid (non-null).
>> +Therefore, split the call, once for timezone and once for timeval.
>> +
>> +Fixes #12756
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + util-linux/hwclock.c | 12 ++++++++----
>> + 1 file changed, 8 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
>> +index dc97d8f..cf346e8 100644
>> +--- a/util-linux/hwclock.c
>> ++++ b/util-linux/hwclock.c
>> +@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname,
>> int utc)
>> +
>> +       tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
>> +       tv.tv_usec = 0;
>> +-      if (settimeofday(&tv, &tz))
>> +-              bb_simple_perror_msg_and_die("settimeofday");
>> ++      if (settimeofday(NULL, &tz))
>> ++              bb_simple_perror_msg_and_die("settimeofday: timezone");
>> ++      if (settimeofday(&tv, NULL))
>> ++              bb_simple_perror_msg_and_die("settimeofday: timeval");
>> + }
>> +
>> + static void from_sys_clock(const char **pp_rtcname, int utc)
>> +@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
>> +       gettimeofday(&tv, NULL);
>> +       if (!utc)
>> +               tv.tv_sec += tz.tz_minuteswest * 60;
>> +-      if (settimeofday(&tv, &tz))
>> +-              bb_simple_perror_msg_and_die("settimeofday");
>> ++      if (settimeofday(NULL, &tz))
>> ++              bb_simple_perror_msg_and_die("settimeofday: timezone");
>> ++      if (settimeofday(&tv, NULL))
>> ++              bb_simple_perror_msg_and_die("settimeofday: timeval");
>> + }
>> +
>> + //usage:#define hwclock_trivial_usage
>> +--
>> +2.24.1
>> +
>> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb
>> b/meta/recipes-core/busybox/busybox_1.32.0.bb
>> index 0dfdfdb549..aeea40fbc1 100644
>> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
>> +++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
>> @@ -43,6 +43,7 @@ SRC_URI = "
>> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>>
>> file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>>              file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>>
>> file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
>> +           file://0001-hwclock-make-glibc-2.31-compatible.patch \
>>   "
>>   SRC_URI_append_libc-musl = " file://musl.cfg "
>>
>> --
>> 2.27.0
>>
>> 
>>
