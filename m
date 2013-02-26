Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1UAFR3-0005m1-3K
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 08:59:17 +0100
Received: by mail-ve0-f182.google.com with SMTP id ox1so3087305veb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 23:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9vHAk50c+BHu22A4nfg8vPj1203gAjZFwePmyhuoqr0=;
	b=TabsLAB1K9dtwkdPCQTuZwZak8umxdOECNnOam10TCF/Rj5UcFVxfnT70TOfecNeCC
	oWnEF6RHpf5r8TJmini3ZrM643trn83YXo1nY1+ZtsfGfJ2JU5KfjST3RzR/6br0ppay
	XdtPxpkOssY1n6OFbgAoj7rWZH2bkILC/mXIbB69IcIG9bk1aBqspCnhYuzET1HydlGT
	0h4iVlrGwsWgwWGovfOFdfD51XRovPx9ooXslkIVb4Z2tAVOy7xj9dIzjhFHTUZwGCly
	WRxmb/X3gHnoS0V+piTZxUB9y2l79Caf5dIP7xZ5SY2Shdp5QskvgH/XRynvLCW/ZJcl
	Q8fA==
MIME-Version: 1.0
X-Received: by 10.58.239.38 with SMTP id vp6mr11631947vec.13.1361864549651;
	Mon, 25 Feb 2013 23:42:29 -0800 (PST)
Received: by 10.59.10.137 with HTTP; Mon, 25 Feb 2013 23:42:29 -0800 (PST)
In-Reply-To: <512BE70F.4050707@linux.intel.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
	<CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
	<CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
	<512BE70F.4050707@linux.intel.com>
Date: Tue, 26 Feb 2013 09:42:29 +0200
Message-ID: <CAF6bG8fPGOjUB_nvNML1SAckQngEOSijzDH43dtSSQ7FmCmquw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 07:59:30 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 00:34, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/25/2013 03:40 AM, Marko Lindqvist wrote:
>>
>> On 20 February 2013 16:32, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>>
>>> On 19 February 2013 19:12, Saul Wold <sgw@linux.intel.com> wrote:
>>>>
>>>> On 02/17/2013 01:00 AM, Marko Lindqvist wrote:
>>>>>
>>>>>     libffi: update to upstream version 3.0.12
>>>>
>>>>
>>>> Not sure what's going on but I saw a batch of failures with glib-2.0,
>>>> take a
>>>> look at the autobuilder failure:
>>>>
>>>>
>>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/808/steps/shell_29/logs/stdio
>>>>
>>>>   or
>>>>
>>>>
>>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/931/steps/shell_29/logs/stdio
>>>>
>>>> Not sure why, but glib-2.0 is not finding the libffi library, but it
>>>> seems
>>>> to exist in the sysroot.
>>>
>>>
>>>   I should be able to take a brief look next weekend, but tonight and
>>> tomorrow I'm busy with other things.
>>
>>
>>   I've found no way to reproduce this on my own computer no matter how
>> I've tried to invalidate parts of the cache etc. but I wonder if it
>> could be that for some reason libffi didn't exist in sysroot already
>> at the time it was needed, only later when you checked for it. I see
>> no problem with glib-2.0-native dependencies, though.
>>
> I found a way to reproduce it and fix it, I believe!
>
> Just curious, what's your build host arch?  and what does gcc
> -print-multi-os-directory return on your host?

 x86_64-linux

 > gcc -print-multi-os-directory
../lib

 > gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.7/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian
4.7.2-5' --with-bugurl=file:///usr/share/doc/gcc-4.7/README.Bugs
--enable-languages=c,c++,go,fortran,objc,obj-c++ --prefix=/usr
--program-suffix=-4.7 --enable-shared --enable-linker-build-id
--with-system-zlib --libexecdir=/usr/lib --without-included-gettext
--enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.7
--libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--enable-gnu-unique-object --enable-plugin --enable-objc-gc
--with-arch-32=i586 --with-tune=generic --enable-checking=release
--build=x86_64-linux-gnu --host=x86_64-linux-gnu
--target=x86_64-linux-gnu
Thread model: posix
gcc version 4.7.2 (Debian 4.7.2-5)


> It returns lib64 on my host and it causes the libs to be installed in the
> <WORKDIR>/image/usr/lib64 dir and not get picked up by the
> populate_sysroot() code.
>
> I commented out some code in configure.ac and that seems to have solved the
> problem, but I am not sure if we need to start adding lib64 to
> populate_sysroot or tweaking configure code!
>
> Sau!


 - ML


