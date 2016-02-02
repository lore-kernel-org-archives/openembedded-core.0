Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B15C960290
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:21:05 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l66so1935786wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 18:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Q9VBUO8SNaFXr47I8dUYrJLswinB7PqdIGlBTDXstN4=;
	b=NGzhBBBfGckimzRtBPC1ZoibMiwv/kep/Tc9B/qUlneJ0nUvHTi743SN5VgQjOyYaJ
	3bDJIz/ryIj5+8cjxxF9w08lGJiohhJEYZpj8ezllMWTJv4TI0kOtLlhucMdiL2q4PCB
	Kccq0tW3btMIJNb9QWb/o7NKFi1ItGG0YerDAM769Rjvhs4ORxqedBMEhv/CYyBmnM58
	h9IclUv7VrSbGOIawu1DbaTLaQsQSbErZltohQ1mPk0ALDodOru6jdQ3Cpg4L0WBAVYH
	hMW6rG2eEJ6jE6zHYUK+wEnQ1hH5gt74+gCMP+/u7Yw38hlD/LHvgljr0/XyHo3CPMNe
	UpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Q9VBUO8SNaFXr47I8dUYrJLswinB7PqdIGlBTDXstN4=;
	b=NKJnxOdwPsV6YFMO9O4Fv1OnS1nKBUXxdCnqniVADHWHH+EbALti29hx26qODzH7oj
	0yJp1DCfkOmbIkzZ6EyFcDCFclLW5ZY1kU71o8yiWUm+g8L753vCA9eyjmM62VLMfMB7
	17K0/Xx90wplQ1nPzZGkMHcI4/EO6mM+hSbrspz3DHt7dAuYpmF28MWp4jbmoFLPhBSe
	ZtIsUjo1TKk27YFlVXvmk7PpFGbYRgGKD5Gvnm0LMVyvi7T3ZJO6qaLVZvXHi5UzHS+M
	Z+xQJYXg8gMnDYdFu5QdGMZqjLXnzAvihfsTHiHrwKIcPNC+f3MzX78Kpu/sdTBa9VOo
	4X2g==
X-Gm-Message-State: AG10YORv/5IHXeBw9gAskP6hyFVsPLLVoWbfed6kKbUa+jQv4a+JksWbOa7oaq38n5agPLcWLX8WOBMZgV6dTw==
MIME-Version: 1.0
X-Received: by 10.28.182.133 with SMTP id g127mr14358304wmf.61.1454379666052; 
	Mon, 01 Feb 2016 18:21:06 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 1 Feb 2016 18:21:06 -0800 (PST)
In-Reply-To: <CAMKF1sqRtdCtm0jtGwMtPWJ3cUYmRB5FYZ9m7xmjq8+0q_pTGQ@mail.gmail.com>
References: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqRtdCtm0jtGwMtPWJ3cUYmRB5FYZ9m7xmjq8+0q_pTGQ@mail.gmail.com>
Date: Mon, 1 Feb 2016 18:21:06 -0800
Message-ID: <CAJ86T=VMCnwns4grN6rWFg0z2oR7ifeSbo4Pf2o0te1ZOk2fOA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: drop --enable-target-optspace from configure
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
X-List-Received-Date: Tue, 02 Feb 2016 02:21:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 4:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> What is the size increase in gcc runtime when u do this

No significant changes.

Binaries which link statically with libgcc all grow a little
(somewhere between 10 and 50 bytes).

libgcc_s.so.1 itself grows by approx 1%:

   text       data        bss        dec        hex    filename
 114896        516         56     115468      1c30c    libgcc_s.so.1 (-Os)
 116148        516         56     116720      1c7f0    libgcc_s.so.1 (-O2)

libssp, libstdc++, libgomp and libatomic all ignore the
--enable-target-optspace configure option, so are not affected.

(Results from an armv7ve build).

> On Feb 1, 2016 2:01 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>
>> Configuring gcc with --enable-target-optspace (which causes gcc to
>> append "-g -Os" to the default CFLAGS_FOR_TARGET and so force libgcc
>> etc target libraries to always be optimised for size) dates back to
>> the very first commit in oe-core git in 2005 (for gcc 3.4.3).
>>
>> Configuring gcc with --enable-target-optspace is not done widely
>> elsewhere (it's not used for Ubuntu or Fedora host gcc, the Linaro
>> binary toolchain or in Buildroot since early 2015). Sometime around
>> gcc 4.5.x it caused problems for powerpc and so was disabled for that
>> architecture:
>>
>>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
>>
>> This patch removes --enable-target-optspace completely (ie powerpc is
>> no longer a special case) and allows optimisation of libgcc etc to be
>> controlled directly by the flags present in TARGET_CFLAGS.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------
>>  meta/recipes-devtools/gcc/gcc-cross-initial.inc    | 1 -
>>  2 files changed, 9 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> index 85e69db..f4f76bd 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> @@ -14,13 +14,6 @@ JAVA_sh3 ?= ""
>>  # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
>>  FORTRAN ?= ",f77"
>>  LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
>> -# disable --enable-target-optspace for powerpc SPE
>> -# at -Os libgcc.so.1 creates references into
>> -# hidden symbols in libgcc.a which linker complains
>> -# when linking shared libraries further in the build like (gnutls)
>> -
>> -SPECIAL_ARCH_LIST = "powerpc"
>> -OPTSPACE = '${@bb.utils.contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}",
>> "", "--enable-target-optspace",d)}'
>>
>>  EXTRA_OECONF_BASE ?= ""
>>  EXTRA_OECONF_PATHS ?= ""
>> @@ -42,7 +35,6 @@ EXTRA_OECONF = "\
>>      --enable-libstdcxx-pch \
>>      --program-prefix=${TARGET_PREFIX} \
>>      --without-local-prefix \
>> -    ${OPTSPACE} \
>>      ${EXTRA_OECONF_BASE} \
>>      ${EXTRA_OECONF_GCC_FLOAT} \
>>      ${EXTRA_OECONF_PATHS} \
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> index 910f2ef..048b530 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> @@ -22,7 +22,6 @@ EXTRA_OECONF = "\
>>      --disable-multilib \
>>      --disable-__cxa_atexit \
>>      --enable-languages=c \
>> -    ${OPTSPACE} \
>>      --program-prefix=${TARGET_PREFIX} \
>>      --with-sysroot=/not/exist \
>>      --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

