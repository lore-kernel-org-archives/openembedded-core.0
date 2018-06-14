Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 393EC75528
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:12:36 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s187-v6so4327479vke.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=woaUNE/Iemu3om3JNv0IKuXkUHpzOsI8WivVPKA/yeg=;
	b=qf8kXOcgwg/Qy6zSC2M3Z9RuTYYbsXLR8bXVpxjZdTpegC1LerVG26kBxtvda6GpKw
	KdVtHQLZk+3egf6CZw9uZp4iJ8bjrDXuObepk5Z35qmfoYbopdtlM77aLWiJlXVfZANy
	xhvh18pwmV9mFtPMdC/HF1QDvsw7eV3dZeXHg0R3Nkxm02Do2fe2ddE6sADAm4N3NEP1
	yi24wwXN7FmlwLVm7LE4b0VQw6RYw2pT9IpyStv0g5asF/rTLIwWA7WXQEFUAQYiH2+/
	bcfkaXEj8HCrrOTmV5rKPkLaTYosty0kuyPEcvEtukv+21p7L68RtG5k8ULPazHDPmtJ
	9krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=woaUNE/Iemu3om3JNv0IKuXkUHpzOsI8WivVPKA/yeg=;
	b=Sp2cXFRjBgL5PK9ZsrWer6ROYDl8dgenH0gHJHRFkvkdsihnGE7RA51Vg0BfaiySJV
	GR995ogM/YHZ+ogmLP3mD7/E6iuGcij5OZbsAaGvE9XqgST2WyJiL89kuQ30A0TKwCyV
	IjOa7tb4iuvyqXaRk2hNB1vWFUxmRO/mMSpHzSj4Aj2M4KnlDlIU+fWYBQc4Y+1rAlH4
	wB2YiG1ELloUmFbEsg192zWS5DFMiQDWeiYObLBfvJg5l+2GQOKt+ar9HlUSOjznyafM
	fCde3r2kbo24atCWXKicVNvQ9FxOK4g0aJ7wYQkO9ws+GrE955ddjHqLZW7mrrkjh4O7
	/ZwA==
X-Gm-Message-State: APt69E2CIHwtqxHI8eEPB8luYOEvgvl5P8OT/z3c+pI9n/z9Yae4zHyi
	I9YfC9ibN+5yZIzUUd9oQHlpMV8CNzAl1laXXXs=
X-Google-Smtp-Source: ADUXVKKzu5Oe/IT6q+OdonGIy/hfLgL7yiM+EFlUXJqsTiwj1HAwEQvtrLA/ELuAhJvjQwXnLOKqqCCNUMOptdWHi00=
X-Received: by 2002:a1f:142:: with SMTP id 63-v6mr2370779vkb.2.1529003557066; 
	Thu, 14 Jun 2018 12:12:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 14 Jun 2018 12:12:36 -0700 (PDT)
In-Reply-To: <20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
	<20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 14 Jun 2018 12:12:36 -0700
Message-ID: <CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Thu, 14 Jun 2018 19:12:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 6/14/18 5:10 AM, Herve Jourdain wrote:
>> Hi,
>>
>> I believe I solved that same problem by just adding, in the case of armv8
>> (which I believe may be the new architecture you're referring to):
>> MUTEX_armv8 = ""
>> This way, it allows previous versions to work just like they did before,
>> without having to disable ARM assembler mutex code for architectures that
>> support it correctly - up to armv7ve I believe.
>> Of course, we might need to also have a good definition for armv8, which is
>> the object of another thread.
>
> right thats a better approach.

SWP is not guaranteed to work on SMP systems... and even if it does,
performance is likely to be worse than the pthreads version (which can
take advantage of the newer instructions).

  https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-smoking-barriers

In general, use of hand optimised assembler mutex implementations in
user space isn't something to be encouraged - use pthreads (or maybe a
gcc intrinsic) instead.

I think the original patch is good.

>> Cheers,
>> Herve
>>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Ovidiu Panait
>> Sent: jeudi 14 juin 2018 13:55
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex code
>>
>> The swpb in macro MUTEX_SET will cause "undefined instruction" error on the
>> new arm arches which don't support this assembly instruction any more. If
>> use ldrex/strex to replace swpb, the old arm arches don't support them. So
>> to avoid this issue, just disable the ARM assembler mutex code, and use the
>> default pthreads mutex.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
>>  1 file changed, 1 insertion(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-support/db/db_5.3.28.bb
>> b/meta/recipes-support/db/db_5.3.28.bb
>> index 093ee44909..15b4155a29 100644
>> --- a/meta/recipes-support/db/db_5.3.28.bb
>> +++ b/meta/recipes-support/db/db_5.3.28.bb
>> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so
>> ${libdir}/libdb_cxx.so"
>>  # All the --disable-* options replace --enable-smallbuild, which breaks a
>> bunch of stuff (eg. postfix)  DB5_CONFIG ?= "--enable-o_direct
>> --disable-cryptography --disable-queue --disable-replication
>> --disable-verify --disable-compat185 --disable-sql"
>>
>> -EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
>> -
>> -# Override the MUTEX setting here, the POSIX library is -# the default -
>> "POSIX/pthreads/library".
>> -# Don't ignore the nice SWP instruction on the ARM:
>> -# These enable the ARM assembler mutex code, this won't -# work with thumb
>> compilation...
>> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
>> -MUTEX = ""
>> -MUTEX_arm = "${ARM_MUTEX}"
>> -MUTEX_armeb = "${ARM_MUTEX}"
>> -EXTRA_OECONF += "${MUTEX} STRIP=true"
>> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot
>> STRIP=true"
>>  EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
>>
>>  EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal
>> -I${S}/dist/aclocal_java"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

