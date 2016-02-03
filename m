Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A539F772ED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:36:49 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r129so142409456wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 16:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mOqOG7Su7B1sVphpVxVOht7HivZt4LauFg8yLyxJNyg=;
	b=v198Y1WJAt6i01UnM8gVg+o/oiaQZyQYHHMVMNazeWtbwltzxocMobweghHJRmixhX
	VhXF2GrxevWk2UpNSNsKXXnF8ErYW8+qADPum7cJXMednUV4jW2YcA5rIZGBJgQnF7fT
	f/XSAleP+otZ9DndwUW3OByLK1+Y0bDGY4ty6Bocy6E9WZjltWyQhOobdXV8NxuI2tm8
	u6+2LPn//9HjF6yBLE6Ok/g2DGk0I4gQ868mssgxPWfG6s/Vf9Od9XJIJTJ4szakLGli
	onUWasg+MlGp274eWzaIdHizU6lFgcJJzYAcET6gFYi504iGEnSuxiJP3f7r8iW3D0xx
	p+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=mOqOG7Su7B1sVphpVxVOht7HivZt4LauFg8yLyxJNyg=;
	b=XDRew0JDjgdCH8tBqbVeZtvklBRtYCs/cUtrlaqKsHzJODVcl9PF/36Nr8G2/qYcUW
	vTHfUGuuCUGIqh+XSGS++GWuwwwgYGotXc02PK2m4O3LeGFgdOxUgiGbT14SYnpbaFey
	e2mwxu8MocZ3tNP17SKKzfRmGqalw+47Hsoo6WNorc0TQgXT5om1NjQKcxEFoZuVepgD
	BRSQTiPAH61JTsUKO/yrSp0aXhses5v7UFdydJ7mO5oM3JMZt2wtqw/2q/FXuZBOcRjL
	D9aidRqtVAh2WMobdTQ8TVMjnw0+/M2BvyUzMmFgmHjQuOwM8iuXvmX+FNOuYIugJMFj
	s4PA==
X-Gm-Message-State: AG10YOR5MXPRnXuh6qI5FL0CkAf7PlLkN6TuSKIELpvKcuQXZ8AF9IVwaQ+g3uzqcdKQhPklvImz+rGnHTBGbA==
MIME-Version: 1.0
X-Received: by 10.28.54.22 with SMTP id d22mr470044wma.72.1454459809821; Tue,
	02 Feb 2016 16:36:49 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 2 Feb 2016 16:36:49 -0800 (PST)
In-Reply-To: <F583CDF2-1357-463D-AC7F-48C93A9C2436@gmail.com>
References: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqRtdCtm0jtGwMtPWJ3cUYmRB5FYZ9m7xmjq8+0q_pTGQ@mail.gmail.com>
	<CAJ86T=VMCnwns4grN6rWFg0z2oR7ifeSbo4Pf2o0te1ZOk2fOA@mail.gmail.com>
	<F583CDF2-1357-463D-AC7F-48C93A9C2436@gmail.com>
Date: Tue, 2 Feb 2016 16:36:49 -0800
Message-ID: <CAJ86T=XKG6FNEW5hjtYOkjXhmaRKV2vnjqLW2TgpEVG=XF0ivw@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Feb 2016 00:36:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 6:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Feb 1, 2016, at 6:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Mon, Feb 1, 2016 at 4:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> What is the size increase in gcc runtime when u do this
>>
>> No significant changes.
>>
>> Binaries which link statically with libgcc all grow a little
>> (somewhere between 10 and 50 bytes).
>>
>> libgcc_s.so.1 itself grows by approx 1%:
>>
>>   text       data        bss        dec        hex    filename
>> 114896        516         56     115468      1c30c    libgcc_s.so.1 (-Os)
>> 116148        516         56     116720      1c7f0    libgcc_s.so.1 (-O2)
>
> Thanks, I am ok with this change. Can you also report a qemuppc build with this
> change and make sure it boots ?

No issues seen booting qemuppc core-image-minimal built from today's
poky master branch.

>>
>> libssp, libstdc++, libgomp and libatomic all ignore the
>> --enable-target-optspace configure option, so are not affected.
>>
>> (Results from an armv7ve build).
>>
>>> On Feb 1, 2016 2:01 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>>>
>>>> Configuring gcc with --enable-target-optspace (which causes gcc to
>>>> append "-g -Os" to the default CFLAGS_FOR_TARGET and so force libgcc
>>>> etc target libraries to always be optimised for size) dates back to
>>>> the very first commit in oe-core git in 2005 (for gcc 3.4.3).
>>>>
>>>> Configuring gcc with --enable-target-optspace is not done widely
>>>> elsewhere (it's not used for Ubuntu or Fedora host gcc, the Linaro
>>>> binary toolchain or in Buildroot since early 2015). Sometime around
>>>> gcc 4.5.x it caused problems for powerpc and so was disabled for that
>>>> architecture:
>>>>
>>>>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
>>>>
>>>> This patch removes --enable-target-optspace completely (ie powerpc is
>>>> no longer a special case) and allows optimisation of libgcc etc to be
>>>> controlled directly by the flags present in TARGET_CFLAGS.
>>>>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>> meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------
>>>> meta/recipes-devtools/gcc/gcc-cross-initial.inc    | 1 -
>>>> 2 files changed, 9 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> index 85e69db..f4f76bd 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> @@ -14,13 +14,6 @@ JAVA_sh3 ?= ""
>>>> # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
>>>> FORTRAN ?= ",f77"
>>>> LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
>>>> -# disable --enable-target-optspace for powerpc SPE
>>>> -# at -Os libgcc.so.1 creates references into
>>>> -# hidden symbols in libgcc.a which linker complains
>>>> -# when linking shared libraries further in the build like (gnutls)
>>>> -
>>>> -SPECIAL_ARCH_LIST = "powerpc"
>>>> -OPTSPACE = '${@bb.utils.contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}",
>>>> "", "--enable-target-optspace",d)}'
>>>>
>>>> EXTRA_OECONF_BASE ?= ""
>>>> EXTRA_OECONF_PATHS ?= ""
>>>> @@ -42,7 +35,6 @@ EXTRA_OECONF = "\
>>>>     --enable-libstdcxx-pch \
>>>>     --program-prefix=${TARGET_PREFIX} \
>>>>     --without-local-prefix \
>>>> -    ${OPTSPACE} \
>>>>     ${EXTRA_OECONF_BASE} \
>>>>     ${EXTRA_OECONF_GCC_FLOAT} \
>>>>     ${EXTRA_OECONF_PATHS} \
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>>> b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>>> index 910f2ef..048b530 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>>> @@ -22,7 +22,6 @@ EXTRA_OECONF = "\
>>>>     --disable-multilib \
>>>>     --disable-__cxa_atexit \
>>>>     --enable-languages=c \
>>>> -    ${OPTSPACE} \
>>>>     --program-prefix=${TARGET_PREFIX} \
>>>>     --with-sysroot=/not/exist \
>>>>     --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

