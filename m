Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.61])
 by mx.groups.io with SMTP id smtpd.web12.2877.1595358656714154092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 12:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=msKXodQ/;
 spf=pass (domain: windriver.com, ip: 40.107.92.61, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWi/YcjvY8tOxV79WQsfJFypPCKk6B4oOqd4fHHJ/b5M+wxaUF6cEQ3yS91Xz8o5TvMT5nyMKcasw9F7Ua9ndslnGtyN/cKeZNEXR6kXfkeCougDc7prnRRQk0tq6Holadw0oP7utr1yp5bNnhDFFxshXt/dj4D0GPHDCPawqaELGHFElUSKxK+xA4pjE6tbL5coUBCRGUZcy13hS4xVBAxJ7VG5Y7XTzvoadviUPPtM8ZCBSYwurnXFu1MFUh2QxCPDhKUd6W2cWai+98bPFtJnVFyhohxrGFOsHSEUZKlzYlEOHynQaVbdXuyPJvIteT3PWZCV6Rr4h/JjiOdmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiLRzLrUCEUKY6iZt0KrGgmEvA3oy/XIEoLl8fZ45FM=;
 b=R5bzzYUOI197oJiMXvOJAxwzglQm799UYDlzUq++sjSpp7gZVSC+Hmj/w5SB1MJCa2/tYX22dQaPiOk7+EJkp9cj/ta8mcWNamYzvDMoJbA2NO651c6TGRX9xtdqDezPTtuwg1i68HYdaNz9+G52wWDQyOlsj4ZoO8Mdq73M/mHzZZkLe0+ErfhhYJXlQeDGe2kifJuspBlVVpHmLvcG4/0qsCMLLLUhlfMBDfwY/uxa+jkbhqvsyAkkv4DH4xHI92miY3co8WPFnIIBUaGzs5yTHaOjzOjm1D+7ez27S7BJGA1FFnqicbYWC+YfgNpmqxEMqhZvMhDk1uyZKgSYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiLRzLrUCEUKY6iZt0KrGgmEvA3oy/XIEoLl8fZ45FM=;
 b=msKXodQ/F0PyqOJDKyIcxFVhLaAJxvVMFUuDcHzd/BADMdXHry8yPTa0uii+bMNEvr8izXXlBI8GNUXCd6qYaJXGiPZQRVpxldKKl2nTk3u82IFukMlMlzBj6awTD6EwLSPNDkJrBbusKePH+cIPAZdzng0aHhbB9xIuA0VTHxA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN8PR11MB3843.namprd11.prod.outlook.com (2603:10b6:408:88::29)
 by BN7PR11MB2595.namprd11.prod.outlook.com (2603:10b6:406:b1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 19:10:54 +0000
Received: from BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::9d31:3191:4077:153c]) by BN8PR11MB3843.namprd11.prod.outlook.com
 ([fe80::9d31:3191:4077:153c%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 19:10:54 +0000
Subject: Re: [OE-core] [dunfell][PATCH] busybox: make hwclock compatible with glibc 2.31
To: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20200721180054.38185-1-sakib.sajal@windriver.com>
 <CAK6=ix5bcxMfGME1jnf3hKFUMRFmHjaigCrxR-zOSjpad_LyhA@mail.gmail.com>
 <e38a0f69-f72f-3826-7105-70dd41b06431@windriver.com>
 <0ebff3d6-7325-5263-9ebe-760bc25e8e3b@gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <dbeb139c-6305-af4d-9983-302309807014@windriver.com>
Date: Tue, 21 Jul 2020 15:10:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0ebff3d6-7325-5263-9ebe-760bc25e8e3b@gmail.com>
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To BN8PR11MB3843.namprd11.prod.outlook.com (2603:10b6:408:88::29)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.148.47.76) by YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Tue, 21 Jul 2020 19:10:54 +0000
X-Originating-IP: [184.148.47.76]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3fd2df5-7cca-41b7-088e-08d82da9caa8
X-MS-TrafficTypeDiagnostic: BN7PR11MB2595:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25956A9BD075D9BAA4B49783F2780@BN7PR11MB2595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	shuh4bFK4Y6bJcTRj0VKGnelP6Oid8E40dK6nrziFwlnVU+rrCigc+Ac+tl3e4NI694iLFygQr3++NHunnIPEW49NzGltC9kYTI35jr5/mBDwW53YSg3aoYmZxEe6qcBc1YbJgQhkmndh3PcI+INU8XypRpU6zU8lZZRApZU7PYkJDik8Nk/XanyAwKgXFpk2JTz0hoR4qQuvaExj//HYsdnV4rv9WDDiE01Jhoj8it2Bj9PnMUkkdP/53s6wLjUUoMM8cl8DSB59zqtgZzKa6YLFYhXee21usuSQh47N37Kpk6tcqcTcklsROTxBRNfcS6uoAm06co72J0bhVC4P8LXm/2puSAXTbgKEKmwkKtGRzMxtpbc2NYxqc1JIHQccBpS7p3k+WrIJVwbCi7rXvzlrRgsXXFImr9e4rycN4ZMWdDuIXvBHpxJTlwzIoj5dwaleDot9pb6B7Qn5uJC6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3843.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(956004)(5660300002)(2616005)(36756003)(316002)(83080400001)(478600001)(966005)(86362001)(8936002)(16576012)(2906002)(83380400001)(110136005)(26005)(31686004)(186003)(6486002)(66476007)(66556008)(66946007)(16526019)(4326008)(44832011)(8676002)(52116002)(31696002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	N3mzT+sPzkXBOqGf4UKLIQC8vW6+zFmdvTxDCd8+mCJe6cEGzny8XDDGlYgGdmCmo728+shbsj0lbWKum0pt/leERO11ij/lGOUiwkOL1KZ8C9/OEVkWbTKp8CEiwS9Mlvj2MWvdrRxPR70CA+Ne0LRuzcKZSrG9tlnpjv6qEjMyJWObND/mJBxemEqlMLVRrH/j5tQocOwHjHk5CFMgFuQyK/1vYjtwVPcl/C35CBnxIDxkL6bl/nQ5me99Q2zNJvt6Bukcy9dmLxYMadjWLxLipoeJXne+o0C6RnFddhUEt3hTcH9nkIWIokyYLWe00RhnUgSa5CayjgPKOEZXCclfCGd8J/+NW+tDSMLGNCb6YoNNJozmp90w9XIrFK2i7FpPnY/ZIVKDDvE2VsbutkSEJ+GyNUCsuPILSTNMyoXIkwl6g8a+mROY82VoAolm+gTGaWreVDDkwIb4txRDni9o3SIWSP9xf4sn2qulFf8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fd2df5-7cca-41b7-088e-08d82da9caa8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3843.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 19:10:54.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFIWfUWiNaJIORDqtbjIriOpW1IgAQeekK4hlLVe024y4UpNxAX84kf+EJFEATkRUJ401MQwep0Ltd8xMQ+s9NDOAbd+l5cHjMKPXI/gKvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2595
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2020-07-21 3:01 p.m., Khem Raj wrote:
>
>
> On 7/21/20 11:54 AM, Sakib Sajal wrote:
>>
>> On 2020-07-21 2:11 p.m., Randy MacLeod wrote:
>>> Hi Sakib,
>>>
>>> Did you check this busybox fix against musl? I forgot to ask you=20
>>> this when
>>> you showed me this patch yesterday.
>>>
>>> Randy
>>
>> Yes, I built core-image-minimal with musl and everything was fine.
>>
>
> build alone would not be sufficient, runtime testing would be required=
=20
> too. The patch however seems ok to me. Also send it upstream to bb ml=20
> as well for review
>
Sorry, I was not clear enough, I built and booted the image and ran=20
busybox ptest (glibc and musl), as well as interacted with the hwclock=20
through the various combinations of options allowed through busybox=20
resulting in no errors/failures.

I am currently awaiting approval to be subscribed to the busybox mailing=
=20
list. I will send it upstream as soon as I get approved.

>> Sakib
>>
>>>
>>> On Tue., Jul. 21, 2020, 14:01 Sakib Sajal, <sakib.sajal@windriver.com>
>>> wrote:
>>>
>>>> settimeofday(2) has been deprecated as of glibc 2.31
>>>> which hwclock makes use of. This patch makes hwclock
>>>> compatible with glibc v2.31
>>>> See patch for more details:
>>>> =C2=A0=C2=A0 busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>>>>
>>>> Fixes [YOCTO #13981]
>>>>
>>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>> ---
>>>> =C2=A0 ...1-hwclock-make-glibc-2.31-compatible.patch | 83=20
>>>> +++++++++++++++++++
>>>> =C2=A0 meta/recipes-core/busybox/busybox_1.32.0.bb=C2=A0=C2=A0 |=C2=
=A0 1 +
>>>> =C2=A0 2 files changed, 84 insertions(+)
>>>> =C2=A0 create mode 100644
>>>> meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compat=
ible.patch=20
>>>>
>>>>
>>>> diff --git
>>>> a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-comp=
atible.patch=20
>>>>
>>>> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-comp=
atible.patch=20
>>>>
>>>> new file mode 100644
>>>> index 0000000000..8d1f272120
>>>> --- /dev/null
>>>> +++
>>>> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-comp=
atible.patch=20
>>>>
>>>> @@ -0,0 +1,83 @@
>>>> +From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00=20
>>>> 2001
>>>> +From: Sakib Sajal <sakib.sajal@windriver.com>
>>>> +Date: Fri, 17 Jul 2020 17:27:21 +0000
>>>> +Subject: [PATCH] hwclock: make glibc 2.31 compatible
>>>> +
>>>> +NEWS for glibc version 2.31
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>>> +
>>>> +Deprecated and removed features, and other changes affecting
>>>> compatibility:
>>>> +
>>>> +* The settimeofday function can still be used to set a system-wide
>>>> +=C2=A0 time zone when the operating system supports it.=C2=A0 This i=
s because
>>>> +=C2=A0 the Linux kernel reused the API, on some architectures, to de=
scribe
>>>> +=C2=A0 a system-wide time-zone-like offset between the software cloc=
k
>>>> +=C2=A0 maintained by the kernel, and the "RTC" clock that keeps time=
 when
>>>> +=C2=A0 the system is shut down.
>>>> +
>>>> +=C2=A0 However, to reduce the odds of this offset being set by accid=
ent,
>>>> +=C2=A0 settimeofday can no longer be used to set the time and the of=
fset
>>>> +=C2=A0 simultaneously.=C2=A0 If both of its two arguments are non-nu=
ll, the=20
>>>> call
>>>> +=C2=A0 will fail (setting errno to EINVAL).
>>>> +
>>>> +=C2=A0 Callers attempting to set this offset should also be prepared=
 for
>>>> +=C2=A0 the call to fail and set errno to ENOSYS; this already happen=
s on
>>>> +=C2=A0 the Hurd and on some Linux architectures.=C2=A0 The Linux ker=
nel
>>>> +=C2=A0 maintainers are discussing a more principled replacement for =
the
>>>> +=C2=A0 reused API.=C2=A0 After a replacement becomes available, we w=
ill change
>>>> +=C2=A0 settimeofday to fail with ENOSYS on all platforms when its 't=
zp'
>>>> +=C2=A0 argument is not a null pointer.
>>>> +
>>>> +=C2=A0 settimeofday itself is obsolescent according to POSIX. Progra=
ms
>>>> +=C2=A0 that set the system time should use clock_settime and/or the=
=20
>>>> adjtime
>>>> +=C2=A0 family of functions instead.=C2=A0 We may cease to make setti=
meofday
>>>> +=C2=A0 available to newly linked binaries after there is a replaceme=
nt for
>>>> +=C2=A0 Linux's time-zone-like offset API.
>>>> +
>>>> +hwclock had two calls to settimeofday, in functions to_sys_clock and
>>>> +set_system_clock_timezone, where both the arguments to settimeofday
>>>> +were valid (non-null).
>>>> +Therefore, split the call, once for timezone and once for timeval.
>>>> +
>>>> +Fixes #12756
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>> +---
>>>> + util-linux/hwclock.c | 12 ++++++++----
>>>> + 1 file changed, 8 insertions(+), 4 deletions(-)
>>>> +
>>>> +diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
>>>> +index dc97d8f..cf346e8 100644
>>>> +--- a/util-linux/hwclock.c
>>>> ++++ b/util-linux/hwclock.c
>>>> +@@ -131,8 +131,10 @@ static void to_sys_clock(const char=20
>>>> **pp_rtcname,
>>>> int utc)
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tv.tv_sec =3D read_rtc(pp_rtcna=
me, NULL, utc);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tv.tv_usec =3D 0;
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (settimeofday(&tv, &tz))
>>>> +- bb_simple_perror_msg_and_die("settimeofday");
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (settimeofday(NULL, &tz))
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bb_simple_perror_msg_and_die("settimeofday:=20
>>>> timezone");
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (settimeofday(&tv, NULL))
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bb_simple_perror_msg_and_die("settimeofday: timeval");
>>>> + }
>>>> +
>>>> + static void from_sys_clock(const char **pp_rtcname, int utc)
>>>> +@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gettimeofday(&tv, NULL);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!utc)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tv.tv_sec +=3D tz.tz_minuteswest * 60;
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (settimeofday(&tv, &tz))
>>>> +- bb_simple_perror_msg_and_die("settimeofday");
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (settimeofday(NULL, &tz))
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bb_simple_perror_msg_and_die("settimeofday:=20
>>>> timezone");
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (settimeofday(&tv, NULL))
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bb_simple_perror_msg_and_die("settimeofday: timeval");
>>>> + }
>>>> +
>>>> + //usage:#define hwclock_trivial_usage
>>>> +--
>>>> +2.24.1
>>>> +
>>>> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb
>>>> b/meta/recipes-core/busybox/busybox_1.32.0.bb
>>>> index 0dfdfdb549..aeea40fbc1 100644
>>>> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
>>>> +++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
>>>> @@ -43,6 +43,7 @@ SRC_URI =3D "
>>>> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>>>>
>>>> file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>>>> file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>>>>
>>>> file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patc=
h=20
>>>> \
>>>> + file://0001-hwclock-make-glibc-2.31-compatible.patch \
>>>> =C2=A0 "
>>>> =C2=A0 SRC_URI_append_libc-musl =3D " file://musl.cfg "
>>>>
>>>> --=20
>>>> 2.27.0
>>>>
>>>>
>>>>
>>
>>=20
>>
