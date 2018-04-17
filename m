Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFB3744C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 13:57:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l12so2812270pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F0Zs+AE4ncUpCQQ/tqOWTyYeYSPA1CK/FOO8tNeDvTw=;
	b=oC7FeX7wDilhRWfcoBshjGpvN1YDRtVkrTRsdHZz94jbCJozIHug1nUSu47vzaZWOh
	wSSLHLpQit0xzuiccL9Vp3iEYmyaUrGN54HSEkv/9fIqOUxRcv94BAbuvJipeYlmIj4T
	TZkYi6+hI7bgxlASmiujc0RL3vGVBeyJ0g3w5p+vBZ0JUJB+lPPA8M4zzIjYyNzrqVzc
	lww9G6+aVQ+tRHsUHID9yAfOxyk9s35VI9ihtZjV2DxJ/ayXpVM0biBwFI/5EwH8kGic
	xgT6/wM5QfsKKw2owVuuvGNTYmWe8thDR+qXZ8lSh34nSaA71bG26HaTzef8zFqWNtT+
	gFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F0Zs+AE4ncUpCQQ/tqOWTyYeYSPA1CK/FOO8tNeDvTw=;
	b=D8o6n738LH2WUo6CVG26RxB46ni6PqsLp4rSI20CrOeuCpWIGvoHaN0ytLl1GsaboQ
	64yXteAv58IkJF6cAxefcTLlDj0vElAvLoMkFLpNTEkYRI0d9h/OJNystWd+FzO72Pf5
	9XPqJsmmYTa0KvqHv2Y+L8/oz5W1tI+KvVFGnQLbo+DPwtO0I/vK2Sgp4kSJeoVAHHTd
	H2O0VpM0Ttkh8Mkblj6OaV34EuoBdYqd8dnfXr09HGbGmz1eOJ/dqGNtq4N6uSj8eO6L
	qx+aINRse56ChsZDJnR2ozSuDkfNVloDzedrqXBpiqIJs5Tf5ZP0Z9+M1fUG6mBadTMi
	dgoQ==
X-Gm-Message-State: ALQs6tBmmTFn8pTuW8u4iQySMH4hb647MBDOlagEYnQL/hkTaol1dhjo
	BeMztxmy37b+B9ftKN5eoz9h1d2UP34xci8soaA=
X-Google-Smtp-Source: AIpwx4+Ip0+mUq5vQnvAL/m9JE2yg5O8DVpSSOrT8jZwf/0Z8XM/v2Ebt3AmvXOGwhlcUuNuzPi8Xdu37XF8PA5GH/I=
X-Received: by 10.98.7.83 with SMTP id b80mr2084318pfd.133.1523973451089; Tue,
	17 Apr 2018 06:57:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.138.98 with HTTP; Tue, 17 Apr 2018 06:57:00 -0700 (PDT)
In-Reply-To: <1523961729.18865.20.camel@linuxfoundation.org>
References: <20180416065014.29385-1-raj.khem@gmail.com>
	<20180416065014.29385-3-raj.khem@gmail.com>
	<1523961729.18865.20.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Apr 2018 06:57:00 -0700
Message-ID: <CAMKF1spfMJCKwSPBErBYH+74DxB=vO5x6xUOU75dF2fT2-koiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Tue, 17 Apr 2018 13:57:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 17, 2018 at 3:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2018-04-15 at 23:50 -0700, Khem Raj wrote:
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 97365a21dc..b4e5539575 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -24,8 +24,10 @@ RUNTIMELIBITM_nios2 = ""
>>  RUNTIMELIBITM_microblaze = ""
>>  RUNTIMELIBITM_riscv32 = ""
>>  RUNTIMELIBITM_riscv64 = ""
>> +RUNTIMELIBSSP ?= ""
>> +RUNTIMELIBSSP_mingw ?= "libssp"
>>
>> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic
>> ${RUNTIMELIBITM} \
>> +RUNTIMETARGET = "libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
>> 'libquadmath', '', d)} \
>>  "
>>  RUNTIMETARGET_append_x86 = " libmpx"
>
> This last piece looks like you removed libssp for everywhere, glibc
> included except mingw?
>

yes, since the needed bits for ssp are already provided via libc.so there should
not be a need for it needing libssp on glibc based systems, I think
its due to the libssp
patch we are carrying in gcc, I will take a look at that and limit it
to just musl tuples

> Is the source file you included in the new recipe the same as the one
> in the gcc source but linked differently? If so, I'd be tempted to
> build that gcc-runtime with a musl specific do_compile addition...
>
> I assume this is post 2.5 material as its fairly invasive changes at
> the tail end of a release...
>

yes this is for 2.6 we may backport it later if needed.

> Cheers,
>
> Richard

