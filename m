Return-Path: <net147@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE2B6A961
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 23:52:29 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id t12so1313004pdi.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=e2wDz/W9Y1+MrFTXJb31g7TZOalt1N7h4peuFotSWwY=;
	b=egF01oc6xTLqb4fjtUg/1OeWqbrgOtyg6uqotgPZa3lsF40e330yrzA/tYpCG8rv7x
	L92NFiKLDZpbNemFl34Ii0rd8FSu5MqfeN1ChB7RO253A5g5Gb0CrSLiBvjpoKcPLSew
	O5P9ppkkd5kU/GAcEvEuexaXile3Y0n4Js5T1V8e3m8/26ndl7E2ojJA6IJdAyhE3ULl
	ImAXg798dERyjDw4iUyxT/DdHbP7XzIReI3L3ob1N2sYr1p5k8+IuhzJl6d9SBX2+qCg
	2niAIrP2+bsD/tb1gca5sNkqrl2AjpULDtvYIZ0NY0QtoWQcdyWo2ncU8ME0J9YgAvoa
	3jag==
X-Received: by 10.68.198.65 with SMTP id ja1mr13763765pbc.175.1372463550740;
	Fri, 28 Jun 2013 16:52:30 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qi1sm11029846pac.21.2013.06.28.16.52.28 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 16:52:29 -0700 (PDT)
Message-ID: <51CE2096.1080309@gmail.com>
Date: Sat, 29 Jun 2013 09:47:34 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Upgrade to 4.8.1
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
X-List-Received-Date: Fri, 28 Jun 2013 23:52:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

I get the following error building gcc package for atom-pc on x86_64 host:
libtool: link:  i586-poky-linux-g++  -m32 -march=core2 -msse3 
-mtune=generic -mfpmath=sse 
--sysroot=/home/build/git/poky/build/tmp/sysroots/poky -  m32 
-march=core2 -msse3 -mtune=generic -mfpmath=sse 
-isystem/home/build/git/poky/build/tmp/sysroots/poky/usr/include 
-I/home/build/git/poky/build/tmp/ 
work/core2-poky-linux/gcc/4.8.1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/gcc/include/ 
--sysroot=/home/build/git/poky/build/tmp/      sysroots/poky -shared 
-nostdlib /home/build/git/poky/build/tmp/sysroots/poky/usr/lib/crti.o 
/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1/crtbeginS.o 
.libs/asan_allocator.o .libs/asan_allocator2.o .libs/asan_interceptors.o 
.libs/asan_mac.o .libs/asan_malloc_mac.  o .libs/asan_new_delete.o 
.libs/asan_posix.o .libs/asan_rtl.o .libs/asan_stats.o 
.libs/asan_thread_registry.o .libs/asan_fake_stack.o 
.libs/asan_globals.o . libs/asan_linux.o .libs/asan_malloc_linux.o 
.libs/asan_malloc_win.o .libs/asan_poisoning.o .libs/asan_report.o 
.libs/asan_stack.o .libs/asan_thread.o .libs/ asan_win.o  
-Wl,--whole-archive ../sanitizer_common/.libs/libsanitizer_common.a 
../interception/.libs/libinterception.a -Wl,--no-whole-archive 
-Wl,-rpath - 
Wl,/home/build/git/poky/build/tmp/work/core2-poky-linux/gcc/4.8.1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/i586-poky-linux/ 
libstdc++-v3/src/.libs -lpthread -ldl 
../../libstdc++-v3/src/.libs/libstdc++.so 
-L/home/build/git/poky/build/tmp/sysroots/x86_64-linux/usr/lib/core2- 
poky-linux/gcc/i586-poky-linux/4.8.1 
-L/home/build/git/poky/build/tmp/sysroots/poky/lib 
-L/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1 
-L/home/build/git/poky/build/tmp/sysroots/poky/usr/lib 
/usr/lib/libstdc++.so -lm -lc -lgcc_s /home/build/git/poky/build/ 
tmp/sysroots/poky/usr/lib/i586-poky-linux/4.8.1/crtendS.o 
/home/build/git/poky/build/tmp/sysroots/poky/usr/lib/crtn.o  -m32 
-march=core2 -      msse3 -mtune=generic -mfpmath=sse -m32 -march=core2 
-msse3 -mtune=generic -mfpmath=sse -Wl,-O1 -Wl,--hash-style=gnu 
-Wl,--as-needed   -Wl,-soname -Wl, libasan.so.0 -o .libs/libasan.so.0.0.0
/usr/lib/libstdc++.so: could not read symbols: File in wrong format
collect2: error: ld returned 1 exit status
make[3]: *** [libasan.la] Error 1
make[3]: Leaving directory 
`/home/build/git/poky/build/tmp/work/core2-poky-linux/gcc/4.8.1-r0/gcc-4.8.1/build.i586-poky-linux.i586-poky-linux/ 
i586-poky-linux/libsanitizer/asan'

Regards,
Jonathan

