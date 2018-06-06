Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id CF8FF74BBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:18:14 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id j80-v6so4434280qke.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7yjixclp+giO7Z+gaxmZJSO+pD0SpjlRWQYkVXI2yHQ=;
	b=OVBydqLO7GuDhrTA2JgvffwESqR221QhMZ5VbmDgX8ZIewfqzZhoWcqiiWGkuSSIA4
	yxpeD5wCwXOtISMtnqdzxQ0p6VZIF8gyNq0imwYg8UOG7bWs2RYRy8AQobapfi6izgXu
	bH7tPYxoZfbbol1eD/VNPl9g8yTatV6Dysk3AXwLhpiUumuWTQHR+Des0nbH7aM53hfa
	Kk+9GyI0WINb3K5nc44gYbHzqxfv8jRV5PKakigORaKSaVjEvwfY3DmsOXsVgIzng7tj
	7EL/cULqYz0825Ttn0IA7X/TgLj6GBKoFPbQu7vnEFGpqFEOW09qDb4+157p21kquUZ0
	fS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7yjixclp+giO7Z+gaxmZJSO+pD0SpjlRWQYkVXI2yHQ=;
	b=Cfwc4Hf4z/fC3CGSAjRWCdgVK0v8zN6+O/c6wsl5GTTgrRIPGvYtKagUYCW1afwHMJ
	pbpYslOI+xdV4kRtRqVf3vIocGpFSkwLdmbaJRwP7mWTYJxMzLaq3A0vSSZcLd8gd8SA
	MIKXc79ImjGU/zMGsr7JL0EHVhVbhYa0GnftRWjnPLC5bsHSYRDt7akpiH//ApG8A/DW
	y86heCJ013K+MxpKI/ht3/kvhlFpsgvCHzZ8nuu7T2o/OOR+fh2aHX+FiULfkS6ik2YQ
	c61DJbgqUNXqEAanpayMMWdMeyuGqvqweLWvjFeOH893uL3AA1QurEnvSgjPj07OgdhK
	u+hw==
X-Gm-Message-State: APt69E0G7r+4CTxlJ+AgCaWdBVwURFkRi9xKDnmc5mjUnCxn67uzR1rl
	d31fIb4dgA+0Wxi7FUX29zgn1flmDbqrHSDela0=
X-Google-Smtp-Source: ADUXVKIJ3tPIrS5hD+k6ZJteExRPsPgLwmaJuxAdf3q9xt/CSt7sTrzbKICR5EcXEtpDB2A1TwQxR2D1/ZH/LHlH8pg=
X-Received: by 2002:a37:fe9:: with SMTP id
	102-v6mr3192874qkp.406.1528305495527; 
	Wed, 06 Jun 2018 10:18:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 10:17:45 -0700 (PDT)
In-Reply-To: <CAJTo0LbuaPOcp0WbB0_T9O+kivU9Wye6Zzb6w8xD-kQXXOpJzg@mail.gmail.com>
References: <cover.1527214769.git.Qi.Chen@windriver.com>
	<31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
	<CAJTo0LbuaPOcp0WbB0_T9O+kivU9Wye6Zzb6w8xD-kQXXOpJzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jun 2018 10:17:45 -0700
Message-ID: <CAMKF1sqEzOBqP+ReVAA5zHn1qosQrrpti_2Aigv4OzzU6tF3Kg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libnss-nis
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
X-List-Received-Date: Wed, 06 Jun 2018 17:18:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 9:48 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Try building a musl buildtools and it breaks:
>
> ERROR: Nothing RPROVIDES 'nativesdk-libnss-nis' (but
> /home/ross/Yocto/poky/meta/recipes-core/meta/buildtools-tarball.bb
> RDEPENDS on or otherwise requires it)
> nativesdk-libnss-nis was skipped: incompatible with musl C library
>

I think the compatibility check is too greedy in the recipe, this should
only be applicable to target class recipe.

> Ross
>
> On 25 May 2018 at 03:54, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Recent glibc change removed libnss-nis module from glibc and a new
>> recipe libnss-nis.bb was added.
>>
>> After this change, we need to make sure nativesdk-libnss-nis is also
>> included in buildtools-tarball, otherwise, we may encounter the following
>> error when using 'tar' command from buildtools-tarball.
>>
>>   tar: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2: \
>>        symbol _nsl_default_nss version GLIBC_PRIVATE not defined \
>>        in file libnsl.so.1 with link time reference
>>
>> This error occured on my ubuntu16.04 host with 'nis' configured in
>> /etc/nssswitch.conf.
>>
>> So add nativesdk-libnss-nis to buildtools-tarball to fix this problem.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
>> index d98a9c9..377733f 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>>      nativesdk-wget \
>>      nativesdk-ca-certificates \
>>      nativesdk-texinfo \
>> +    nativesdk-libnss-nis \
>>      "
>>
>>  MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

