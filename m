Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 177B47D534
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 20:33:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e24so4628744pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=x/EOjyFmsn0pCmxrjdtCszGRiAd7RWtUe4Qf7gxF20c=;
	b=i2c8iaXxEDhTatSxoCFoVaV3lPUhDeUTsdH5ZVDwF/iiEBVFVaEpd5a8MYH9OF5lpT
	/QRZoY8xzDnnCl24jhRmmHcm5ofYeKQNRZ1nw3W0GqX/RRa7C8kxW059iQKMYgR+nyBS
	7Gop3eMJj962lo7kJX9OkDgWfPKSiCblI2XG+IlTmxZvn7gWYw4g/f4I9Ln5RVDD3sNr
	GBXp4iRa1gaZtbVL4Hd87a3ZWM8wdaniXGwJ0vMnEpxbzDjEZKt35apgxT39Q6+TGqzZ
	GWwtLPeMiHLLQo3V/U5RXUlNNs+HgIJr6C8jgI16nTZdbXB8Zu2tAKAkPZkymE7ltMk1
	giOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=x/EOjyFmsn0pCmxrjdtCszGRiAd7RWtUe4Qf7gxF20c=;
	b=hSpxJv2aQAuRbXjq4j3Db58R7C7evOmwAMakAF+wus5bKC8RQkGF3A2G5Iyhe0WZoP
	Lcs11imTCJxTgpFbcJP+D/+rzOCOEzbfZGWk8COvCk4/xys6TJRXLKEZ+h2XcHo8f0lD
	IC96vwI4du/RPjXKFxdbI8VNXcPmHBh4mCuofBo/UD5sXpp49NJ/FyMHDnvNzu9iCuqo
	6tbdmxAvsH6/SXIXm7MPVXQ4fi/J1YghbgXIDv8VwWz855E4JVzznpUC0Hz16kWJqNZ3
	U3TbOzv90inR43Wh35N9WSkLzQzn684JofWl6Lz46TRJZZOCZTtPrUb7pZZdaWdiQCsx
	7UDQ==
X-Gm-Message-State: APjAAAXl5gXazSvuA4JraJEP+0dW4OTbifR+y51/o04kwWckmjl3EXcs
	6gEnVqszZXU8QAKeihkdmImuW06Z
X-Google-Smtp-Source: APXvYqysHc0V0hswKLAGu5UuirWQEIvsSUGyAOKA3OSU24b9beJ0NIEFDqRKzqwTTqpW1kxpaqU3ug==
X-Received: by 2002:a63:124b:: with SMTP id 11mr14975448pgs.115.1557002034795; 
	Sat, 04 May 2019 13:33:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e5bb:fdcb:954:875c?
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id d10sm6904395pgi.6.2019.05.04.13.33.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 13:33:54 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1556983501.git.akuster808@gmail.com>
	<6b6aa062a72aa2d50a8318dc03f8d91a32c21e94.1556983501.git.akuster808@gmail.com>
	<20190504160956.GE11633@localhost>
	<e26f8733-d1f8-4ea8-03b1-900b12f69f73@gmail.com>
	<20190504174000.GH11633@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <07c2be50-6c4b-afef-e026-8e35a633f0fa@gmail.com>
Date: Sat, 4 May 2019 13:33:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504174000.GH11633@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 40/43] waffle: supprt build waffle without x11
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
X-List-Received-Date: Sat, 04 May 2019 20:33:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/4/19 10:40 AM, Adrian Bunk wrote:
> On Sat, May 04, 2019 at 10:05:11AM -0700, akuster808 wrote:
>>
>> On 5/4/19 9:09 AM, Adrian Bunk wrote:
>>> On Sat, May 04, 2019 at 08:27:16AM -0700, Armin Kuster wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> respect DISTRO_FEATURES to make waffle support different platform,
>>>> gbm platform is supported by default.
>>>>
>>>> [YOCTO #6077]
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  meta/recipes-graphics/waffle/waffle_1.5.2.bb | 7 +++----
>>>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
>>>> index 43c3edc..31572f2 100644
>>>> --- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
>>>> +++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
>>>> @@ -15,10 +15,9 @@ inherit cmake distro_features_check lib_package
>>>>  
>>>>  # This should be overridden per-machine to reflect the capabilities of the GL
>>>>  # stack.
>>>> -PACKAGECONFIG ??= "glx"
>>>> -
>>>> -# libx11 requires x11 in DISTRO_FEATURES.
>>>> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
>>>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
>>>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>>>> +                   gbm"
>>>> ...
>>> Changing the default PACKAGECONFIG does not look appropriate for
>>> a stable branch.
>> Go look at the bug for more details.
> It raises the additional question why the new feature of building piglit
> without x11 is considered appropriate for a stable branch.
>
> You said before that adding new recipes to stable branches is not 
> appropriate. Changing the behaviour of existing recipes is a lot worse 
> than that, since it changes what gets built in existing distibutions 
> using the stable branch.
>
> And a 5 year old bug asking for an enhancement of an existing recipe
> does not sound like an appropriate justification for changing the
> default PACKAGECONFIG of a recipe in a stable branch to me.

Seems like a good argument.
will drop patch

thanks

- armin
>
>> - armin
> cu
> Adrian
>


