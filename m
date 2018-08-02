Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCCCC78DFA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 18:40:28 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id m11-v6so5395428oic.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wY0zLCNgmSAB+iNy/YD0lpT9QL3IBvszeL/gyaeM7GQ=;
	b=nqRNILqZtke7uSS84ik7jQcuSW4rV5VmrkNsykyd+C1weVB/iOE8KcwUqScx2KieFy
	bzegeHd4reV69FRNw+QByDxQ1tI/cyWaf7acpMDIpwPdAwxzeUqx6BVc7VzIFX3hCEFh
	9wbX8MehYBUy1KyAValrGEq+ZtsDEEFLXhcCTA9yh0vVO8lBGjc2Latsz0aHtfdj7gQX
	hbE/fbBlskpsqClPzphFkqTRKhdAQF5iWXpQZnXen6Zm9Ggn0cNsoy+TJNrgRcbP8prL
	lfdOlUE0dj7emjCcBC+njifHMStM96ro2SeTZI/5/uya4A69X7TrxG3vtPW1zGQQSX5u
	kFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=wY0zLCNgmSAB+iNy/YD0lpT9QL3IBvszeL/gyaeM7GQ=;
	b=XwmVO+/0rJc/6lZHXEIuakZS5gFUchNciZwZLx6fDtDVgkA3qmOMbyvsW0vq4WpboN
	BEblEubR3ST1cOBhUZ3JMNDPN1+bTQqSOZ2jOZoJr4v89jEMCdx4UxIfnfPuVmZpaVjB
	lCTdK/ziZST2EcEZ3eXUpWiHE4RKZUKVgQsD0iIJKsqy0wie0kTyxCD+k+Vt7AH3D/8w
	jKevunXvhXPFk6oSezCWIW1nlOZm9pxf7KZVMB4p8npzqTRh95e1dVoX4w3cpeiaK6nV
	84poMxCLC4jLK/9Yi/EDqpD/nfSM1Uout2tW+fJYxMhQS1MOGuSSvxbCu0JEaPuLQPt0
	wZLQ==
X-Gm-Message-State: AOUpUlG9J9d2J1gsku0zNTWzYpSWWmMG8K/19ckJ89gGwZzZ81cJhuWK
	xzGW4xqUrWiCyY0HXagpMqE=
X-Google-Smtp-Source: AAOMgpc4infQn0RMVRu/akfvi1AGb2gnPFnYnXhfUp2xIXkAOYk1O8DHahlaVFKjxPsGOMpm5Zl4SA==
X-Received: by 2002:aca:6044:: with SMTP id u65-v6mr76649oib.323.1533235229566;
	Thu, 02 Aug 2018 11:40:29 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	y85-v6sm2897052oie.25.2018.08.02.11.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 11:40:29 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20180719163102.15234-1-JPEWhacker@gmail.com>
	<20180731171913.5202-1-JPEWhacker@gmail.com>
	<f6ed4f2afd6d43944565fcffa8bc90625770ea50.camel@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7c66e19c-7af1-4693-5f6a-48cf90f445e3@gmail.com>
Date: Thu, 2 Aug 2018 11:40:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f6ed4f2afd6d43944565fcffa8bc90625770ea50.camel@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2] u-boot: Fix pylibfdt generation
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
X-List-Received-Date: Thu, 02 Aug 2018 18:40:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/02/2018 10:25 AM, Joshua Watt wrote:
> On Tue, 2018-07-31 at 12:19 -0500, Joshua Watt wrote:
>> u-boot attempts to build a Python library called pylibfdt. By
>> default,
>> u-boot would attempt to use the build host's Python interpreter,
>> which
>> causes numerous problems, not least of which is that it fails if the
>> host doesn't have the Python development package installed
>> (complaining
>> about not being able to find Python.h)
>>
>> Rectify this situation by including the proper build time
>> dependencies
>> for pylibfdt and passing the proper arguments to make.
>>
>> [YOCTO #12867]
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-
>> boot/u-boot.inc
>> index c2bcf998402..95c2f4db14d 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -7,8 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>  
>>  inherit uboot-config uboot-extlinux-config uboot-sign deploy
>>  
>> +DEPENDS += "swig-native python-native"
>> +
>>  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX}
>> CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
>>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}
>> ${BUILD_LDFLAGS}"'
>> +EXTRA_OEMAKE += 'PYTHON=nativepython
>> STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
>> STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
>>  
>>  PACKAGECONFIG ??= "openssl"
>>  # u-boot will compile its own tools during the build, with specific
> This was applied to master as 581a2cb7f8dfc88af785d55ef5ce40b0939c465b.
>
> Armin, could you please backport to sumo?
Got it already in my next build series.

thanks,
Armin
>
> Thanks,


