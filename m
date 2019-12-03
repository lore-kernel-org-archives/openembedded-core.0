Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 253996D470
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 23:05:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Dec 2019 15:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="236058734"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by fmsmga004.fm.intel.com with ESMTP; 03 Dec 2019 15:05:13 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<1b6971c1-ce0d-5cda-862b-d0a84b5be20a@intel.com>
	<CANNYZj-b0Ufwum+4vA5aqNm+=E+a+HM0vso=61UPERm57QrCDw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <661436bf-4167-10a7-a632-473948d8c950@intel.com>
Date: Tue, 3 Dec 2019 23:05:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj-b0Ufwum+4vA5aqNm+=E+a+HM0vso=61UPERm57QrCDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/15] rpm: upgrade to 4.15.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2019 23:05:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 29/11/2019 21:28, Alexander Kanavin wrote:
> On Fri, 29 Nov 2019 at 21:52, Ross Burton <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
> 
>     This is reliably crashing for me when running rpmdeps:
> 
>     Exception: bb.process.ExecutionError: Execution of
>     '/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/temp/run.BUILDSPEC.1481'
> 
>     failed with exit code 139:
>     Building target platforms: corei7_64-poky-linux
>     Building for target corei7_64-poky-linux
>     Processing files: systemd-compat-units-1.0-r29.corei7_64
>     Processing files: systemd-compat-units-dbg-1.0-r29.corei7_64
>     Processing files: systemd-compat-units-dev-1.0-r29.corei7_64
>     Checking for unpackaged file(s):
>     /data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files
> 
>     /data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/package
>     Segmentation fault (core dumped)
>     WARNING: exit code 139 from a shell command.
> 
> 
> Here it's been robust. Can you produce a backtrace?

Reliably crashes here with systemd-compat-units.

Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x00007fd087a2414a in dataLength (type=type@entry=8, 
p=p@entry=0x7fd07ec22c08, count=0,
     count@entry=1, onDisk=onDisk@entry=0, pend=pend@entry=0x0) at 
../../git/lib/header.c:462
462	../../git/lib/header.c: No such file or directory.
[Current thread is 1 (LWP 19382)]
(gdb) bt
#0  0x00007fd087a2414a in dataLength (type=type@entry=8, 
p=p@entry=0x7fd07ec22c08, count=0,
     count@entry=1, onDisk=onDisk@entry=0, pend=pend@entry=0x0) at 
../../git/lib/header.c:462
#1  0x00007fd087a247fb in grabData (type=8, p=0x7fd07ec22c08, c=1,
     lengthPtr=lengthPtr@entry=0x7fd07ec22b3c) at 
../../git/lib/header.c:1406
#2  0x00007fd087a24891 in intAddEntry (h=h@entry=0x55d2e872e9b0, 
td=td@entry=0x7fd07ec22b90)
     at ../../git/lib/header.c:1432
#3  0x00007fd087a258e7 in headerPut (h=h@entry=0x55d2e872e9b0, 
td=td@entry=0x7fd07ec22b90,
     flags=flags@entry=1) at ../../git/lib/header.c:1499
#4  0x00007fd087a23034 in headerPutType (h=h@entry=0x55d2e872e9b0, 
tag=tag@entry=5092,
     reqtype=<optimized out>, data=0x7fd07ec22c08, size=size@entry=1) at 
../../git/lib/headerutil.c:135
#5  0x00007fd087a232fc in headerPutString (h=0x55d2e872e9b0, 
tag=tag@entry=5092, val=<optimized out>)
     at ../../git/lib/headerutil.c:155
#6  0x00007fd087a93fe9 in writeRPM (pkg=pkg@entry=0x55d2e872e870, 
pkgidp=pkgidp@entry=0x0,
     fileName=0x7fd068004cf0 
"/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/deploy-rpms/corei7_64/systemd-compat-units-dev-1.0-r29.corei7_64.rpm", 
cookie=cookie@entry=0x0,
     buildTime=1575413653, buildHost=0x55d2e87ebc20 "reproducible") at 
../../git/build/pack.c:499
#7  0x00007fd087a945e1 in packageBinary (spec=0x55d2e87195c0, 
pkg=pkg@entry=0x55d2e872e870, cookie=0x0,
     cheating=<optimized out>, filename=filename@entry=0x55d2e872e990) 
at ../../git/build/pack.c:730
#8  0x00007fd087a94659 in packageBinaries._omp_fn.1 () at 
../../git/build/pack.c:753
#9  0x00007fd087627769 in ?? () from /usr/lib/x86_64-linux-gnu/libgomp.so.1
#10 0x00007fd08762ff00 in ?? () from /usr/lib/x86_64-linux-gnu/libgomp.so.1
#11 0x00007fd087a92f4c in packageBinaries._omp_fn.0 () at 
../../git/build/pack.c:749
#12 0x00007fd08762d79e in ?? () from /usr/lib/x86_64-linux-gnu/libgomp.so.1
#13 0x00007fd08765eed4 in ?? ()
    from 
/data/poky-tmp/master/sysroots-uninative/x86_64-linux/lib/libpthread.so.0
#14 0x00007fd08754deff in clone ()
    from /data/poky-tmp/master/sysroots-uninative/x86_64-linux/lib/libc.so.6

Ross


