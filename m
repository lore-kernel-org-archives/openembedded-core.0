Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 715E57390D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 05:15:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E5FoeT008149
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:15:50 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 13 Apr 2015 22:15:55 -0700
Message-ID: <552CA285.9070909@windriver.com>
Date: Tue, 14 Apr 2015 13:15:49 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: failed to build libunwind when qemuarm64
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
X-List-Received-Date: Tue, 14 Apr 2015 05:15:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Does anyone meet this or have any suggestion, please ?

$ bitbake libunwind
[snip]
| ../aarch64-poky-linux-libtool  --tag=CC   --mode=link aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64  -O2 -pipe -g 
-feliminate-unused-debug-types  -fexc
eptions -Wall -Wsign-compare  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -o 
test-coredump-unwind test-coredump-unwind.o ../src/libunwind-coredump.la 
../src/libunwind-aarch64.la
| aarch64-poky-linux-libtool: link: aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64 -O2 -pipe -g 
-feliminate-unused-debug-types -fexceptions -Wall -Wsign-co
mpare -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-ptrace-misc 
test-ptrace-misc.o ident.o
| aarch64-poky-linux-libtool: link: aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64 -O2 -pipe -g 
-feliminate-unused-debug-types -fexceptions -Wall -Wsign-co
mpare -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/Lperf-trace 
Lperf-trace.o  ../src/.libs/libunwind.so -lc -lgcc_s
| aarch64-poky-linux-libtool: link: aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64 -O2 -pipe -g 
-feliminate-unused-debug-types -fexceptions -Wall -Wsign-co
mpare -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/Lperf-simple 
Lperf-simple.o  ../src/.libs/libunwind.so -lc -lgcc_s
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
copy reloc against protected `_ULaarch64_local_addr_space' is invalid
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
failed to set dynamic section sizes: Bad value
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
copy reloc against protected `_ULaarch64_local_addr_space' is invalid
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
failed to set dynamic section sizes: Bad value
| aarch64-poky-linux-libtool: link: aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64 -O2 -pipe -g 
-feliminate-unused-debug-types -fexceptions -Wall -Wsign-co
mpare -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/Gperf-trace 
Gperf-trace.o  ../src/.libs/libunwind-aarch64.so 
/buildarea/lyang1/test_uni/tmp/work/aarch64-poky-linux/libunwind/1.1-r0/build/src/.libs/libunwind.so 
../src/.libs/libunwind.so -lc -lgcc_s
| collect2: error: ld returned 1 exit status
| make[1]: *** [Lperf-trace] Error 1
| make[1]: *** Waiting for unfinished jobs....
| aarch64-poky-linux-libtool: link: aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64 -O2 -pipe -g 
-feliminate-unused-debug-types -fexceptions -Wall -Wsign-compare -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--as-needed -o .libs/Gperf-simple Gperf-simple.o 
../src/.libs/libunwind-aarch64.so 
/buildarea/lyang1/test_uni/tmp/work/aarch64-poky-linux/libunwind/1.1-r0/build/src/.libs/libunwind.so 
../src/.libs/libunwind.so -lc -lgcc_s
| collect2: error: ld returned 1 exit status
| make[1]: *** [Lperf-simple] Error 1
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
copy reloc against protected `_Uaarch64_local_addr_space' is invalid
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
failed to set dynamic section sizes: Bad value
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
copy reloc against protected `_Uaarch64_local_addr_space' is invalid
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
failed to set dynamic section sizes: Bad value
| collect2: error: ld returned 1 exit status
| make[1]: *** [Gperf-trace] Error 1
| collect2: error: ld returned 1 exit status
| make[1]: *** [Gperf-simple] Error 1
| aarch64-poky-linux-libtool: link: aarch64-poky-linux-gcc 
--sysroot=/buildarea/lyang1/test_uni/tmp/sysroots/qemuarm64 -O2 -pipe -g 
-feliminate-unused-debug-types -fexceptions -Wall -Wsign-compare -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--as-needed -o .libs/test-coredump-unwind 
test-coredump-unwind.o  ../src/.libs/libunwind-coredump.so 
../src/.libs/libunwind-aarch64.so 
/buildarea/lyang1/test_uni/tmp/work/aarch64-poky-linux/libunwind/1.1-r0/build/src/.libs/libunwind.so 
-lgcc_s -lc
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
copy reloc against protected `_UCD_accessors' is invalid
| 
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/4.9.2/ld: 
failed to set dynamic section sizes: Bad value
| collect2: error: ld returned 1 exit status
[snip]

-- 
Thanks

Robert

