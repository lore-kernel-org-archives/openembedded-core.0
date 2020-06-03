Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.91])
 by mx.groups.io with SMTP id smtpd.web11.8619.1591168663164958260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 00:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=TtAT2h3P;
 spf=pass (domain: prevas.dk, ip: 40.107.14.91, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwxkGBAcJhpvkDn+pwHfSbjnbNx8VttSpxw8ALwMljloTYHE1dDFsLLsy/YCu9CV2YtXi7qpiSSN6Q2NEP6k0FzbEaJ1VYPQJ/vmNtXJhY2sdICy2R+rR6pEIH921bpicpg5TUeF28tnVURrYT9APwP5+6P3NFne25u8INTVeD8BHri0a9kPpvAJjZJwmrzTCRsDEOQr8x6/r+CLct5kMT8j0UvD+zuzia55+pg2z/sW+1cdbVrCz/qr5xMrvGepAeivpOOnKb5J1t/7LIxOks5HuFhnnn9l1dW48NuQOIBvSl3GbvxInI20pfJJ2vpc8TOn5ToPZ4Fy4Cs3uNfZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou8nS9JguaGFRxcgzOQkYX1XJ7MkdsQuwb9bPr9clCI=;
 b=HwqfsfMQzx4sbj9Pu6lcNNtLCmMY9d22Mjwuy+r184mR9Mj3hOj6z3hQefzXcQhe7OpADUebLUSOi/qQauHMhbGaTA/dLw/cpQcpxWWUFuTKc3nQ+onp4yMg88ftaIKgYZ1e22iRCP4twoUl5qcdaWeYaCNdaJGIpQkljIBpTyKUzmI2jwe03olYsPF/8wLe1rqEnu03pryqsTqP0IXI6/NAK6CHO+qv7RaMko+/fFlzkbmOFvux+Yu20hB0e02o0lTQq27BcsgQbIRgKkoLNQ41GqXV7XPSUnpS3t4qzECQE0b4syXnsILM8H9qoDjIfj9gHkCqJkIWixirUG2faw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou8nS9JguaGFRxcgzOQkYX1XJ7MkdsQuwb9bPr9clCI=;
 b=TtAT2h3PvFg0sFCqkcK6/YkCkw0Czzg19iYRtQDUm2f6xTL6ApWhCYxrBO2saJzsWLHpledlS3Qorqetmik32PE2Mu4sEEtU68JyGUCoD8hmmQ4dMCJE3zFkQCTeYdQiQkhNR8VkzLMI/X8KCz8VNmxufmEwMHuG8QbhWppmMUo=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB1600.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:802:30::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 07:17:39 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 07:17:38 +0000
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Phil Blundell <pb@pbcl.net>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
 Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Andreas Oberritter <obi@opendreambox.org>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <d3ff5a05-1000-a437-402d-528dccd63d8d@prevas.dk>
Date: Wed, 3 Jun 2020 09:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200602211524.GC2207@pbcl.net>
X-ClientProxiedBy: AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::36) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 07:17:38 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b65f8fa5-b7e1-4821-f145-08d8078e3266
X-MS-TrafficTypeDiagnostic: VI1PR10MB1600:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB1600C5ED5854977DD0AF88D293880@VI1PR10MB1600.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8DazC8a+sbi6xbyiSZSQaqHyrQNU/0dFEkJoyGQnOQp6+WRx1IKm7Dkw1Tvio9aOz1BHv/x8mK1B0PJt0PQRgjdnxCR0VXuYQ/q81wF2epaipu4vJGZqLY9DnZ3m7BZN9ef83DorBPW8EI1UFd8Qe5JfSR8i9XdumR+QiDlzm+7iBF2mTtqFuQlEYvDB0RRfAdiuyU001DwdQe16a0FXOHZgD/CzvVWtmV05AcmWHej9OSGaqidBah774PREq23DZy0N494D53ER6JbpGzNmD1SFRv4yw70hD5IVH6fFjgWHYHFaNvjqmEH1XjW1NFVpICBoMV3ZFqdnBc/tz5xiD2veB37VvyEk2B1uSnZ1kveZrV69qe6gx8h5SPUUGYDo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39850400004)(346002)(366004)(396003)(136003)(2906002)(26005)(16526019)(186003)(16576012)(8676002)(316002)(956004)(44832011)(54906003)(2616005)(8936002)(8976002)(110136005)(478600001)(31696002)(86362001)(36756003)(83380400001)(66556008)(31686004)(4326008)(66476007)(52116002)(66946007)(5660300002)(6486002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	EcZ+l0LsgFYhymuErzr31vxMwA9lFGjweROSjwldMhaasq3pXq9+17HEiuzp1C9+VhaFJoRRIO45yvUy+NqsFFztz1EfBQFGx1GOC0mLB5B1oFZEuWlUwx7jaaNWO05DcD4yCgNUTKZlDAzuza2xxapikzug6gm/8DCQy5wu6qFP40WzByfX0bbAyejr6GZLqndx8LZgaTuVxrC/AelKNJYC1QckKHJbvKx9cXYGl9bHhBpfC+L9Do6St1+ySoht8tkPSunao53cS6A5RhyWCjkHM4tbqrcPs15NHsp1QjZtHdfRIPVZjzPlk8mF/Them8ZJ1dDn+BoLRkPcYCJ1QekQNqmvhXW4S4Zw922/wsPLOClBx26Sn0rxzk4xleg9DWf1mpPJqqCKrAEsMhNE8Lf7OiJDtDOFMuZXBlIcrzIN/C78bpKC5GpeAtlJHT4KLb6xM3Iv9UNp+qK/eSLEMq9tLTn6F5Ih1gEt+Aqip/M=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b65f8fa5-b7e1-4821-f145-08d8078e3266
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 07:17:38.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VV0Vqu1kwzz44r4SL+kiylwLcrk3AM1phW3vi9kYx6+EzN14A3oIdgeZdhIR5O/P/h0zcFrJ6gERbpveqZUdnR6JHT3+w/EIpM5SAkgj7Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1600
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/06/2020 23.15, Phil Blundell wrote:
> On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
>> I understand the concern, I am a little torn on this as adding in too
>> many different controls and options complicates the test matrix and
>> makes things harder for users.
>>
>> You're effectively suggesting a new DISTRO_FEATURE to control this? or
>> maybe better, perhaps a glibc PACKAGECONFIG?
> 
> Yes, right.  I don't think it need be a DISTRO_FEATURE because nothing
> outside glibc needs to care.
> 
> Here are the scenarios that I think matter, ordered from simplest to
> most complex:
> 
> 1. Immutable filesystem, every library installed in the place where
> ld.so would first look for it anyway (i.e. everything in {/usr}/lib).
> In this case, we don't want ldconfig (because it can never do anything
> useful), we don't want ld.so.cache and we don't want ld.so.conf
> because they would cause ld.so to do extra file loads and computation
> but end up with the same result that it would anyway.
> 
> I think right now oe-core supports #1 and #3.  The proposed patch
> seems to be aimed at #2, which is a completely valid usecase, but
> my concern is that we don't want to pessimize #1 in the process.

With or without my patch, there's an ldconfig invocation at image build
time, and lacking an /etc/ld.so.conf in the -r filesystem, ldconfig just
looks at the default locations (/lib and /usr/lib, perhaps a few more
depending on $arch). But you still get an ld.so.cache generated listing
the libs in /lib and /usr/lib. So I don't understand this performance
concern at all - at the very most, the presence of the config file
causes a microscopic performance hit at image build time when ldconfig
goes looking for the /etc/ld.so.conf.d/* files and (usually) find none.

Also, IME, the cache file usually speed things up since ld.so avoids a
filesystem access to figure out that
/{usr,}/lib/<arch-specific-path>/libfoo.so doesn't exist (of course
there's an upfront cost of mmapping and parsing the ld.so.cache, so for
programs with very few dynlib dependencies, it might be faster to not
have the cache). See below.

If you really don't want the ld.so.cache, ldconfig has the -N option.
But adding some knob to put that in is completely orthogonal to this patch.

Rasmus

Here's the first few lines of "strace -o /tmp/cache.txt factor 12345":

execve("/usr/bin/factor", ["factor", "12345"], 0xbff6cf3c /* 14 vars */) = 0
brk(NULL)                               = 0x10173000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=6527, ...}) = 0
mmap2(NULL, 6527, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7ef2000
close(3)                                = 0
openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3,
"\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\36\300\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=38596, ...}) = 0
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7ef0000
mmap2(0xffdf000, 65768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xffdf000
mprotect(0xffe7000, 28672, PROT_NONE)   = 0
mmap2(0xffee000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffee000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libcap.so.2", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3,
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\21P\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=22060, ...}) = 0
mmap2(0xffbe000, 65820, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xffbe000
mprotect(0xffc3000, 40960, PROT_NONE)   = 0
mmap2(0xffcd000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0xffcd000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libgmp.so.10",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\226
\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=551740, ...}) = 0
mmap2(0xff1d000, 591268, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xff1d000
mprotect(0xffa3000, 36864, PROT_NONE)   = 0
mmap2(0xffac000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x85000) = 0xffac000
close(3)                                = 0

Compare that to what happens when I move the ld.so.cache out of the way:

execve("/usr/bin/factor", ["factor", "12345"], 0xbfc7c3bc /* 14 vars */) = 0
brk(NULL)                               = 0x10173000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib/tls/ppc603/librt.so.1",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/lib/tls/ppc603", 0xbf98df78)   = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/lib/tls/librt.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
stat64("/lib/tls", 0xbf98df78)          = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/lib/ppc603/librt.so.1",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/lib/ppc603", 0xbf98df78)       = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3,
"\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\36\300\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=38596, ...}) = 0
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb7cd0000
mmap2(0xffdf000, 65768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xffdf000
mprotect(0xffe7000, 28672, PROT_NONE)   = 0
mmap2(0xffee000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffee000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libcap.so.2", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3,
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\21P\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=22060, ...}) = 0
mmap2(0xffbe000, 65820, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xffbe000
mprotect(0xffc3000, 40960, PROT_NONE)   = 0
mmap2(0xffcd000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0xffcd000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libgmp.so.10", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/lib/tls/ppc603/libgmp.so.10",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/usr/lib/tls/ppc603", 0xbf98df38) = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/usr/lib/tls/libgmp.so.10",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/usr/lib/tls", 0xbf98df38)      = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/usr/lib/ppc603/libgmp.so.10",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/usr/lib/ppc603", 0xbf98df38)   = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/usr/lib/libgmp.so.10",
O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\226
\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=551740, ...}) = 0
mmap2(0xff1d000, 591268, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xff1d000
mprotect(0xffa3000, 36864, PROT_NONE)   = 0
mmap2(0xffac000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x85000) = 0xffac000
close(3)                                = 0

So ld.so is smart enough to say, "hm, ok, there was no
/lib/tls/libfoo.so, is there even a /lib/tls or do I not need bother
looking there for the next few libraries". But (1) we still end up doing
10 more system calls compared to the case of having a cache and (2) this
is the good case, if some library (maybe totally unrelated to this
binary) did exist in one of those arch-specific dirs, the directory
would of course exist, and ld.so would keep searching that dir before
looking in /lib or /usr/lib.
