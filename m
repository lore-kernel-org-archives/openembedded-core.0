Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2E39377254
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:18:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p63so43625328wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DqxFtSEm6pAQrgvZJ7CSG5CrdR0M8rlMwnrx3NYNNLE=;
	b=KG8DijcSYrHAdyMjeXQ4jghAYboCxMkpB0I8g88yCGl7X070Ol7HVvV76LBzJjKtHl
	nRiavEGFMp1VkhtIyBZItK6/+zb52k39ZitMjmn+4fG5wy/ywbsxsUy9OKIhAha8mDQT
	6F/kqUnu+lB/Kg44d2YnsuUK1tNPwKtOL7Jb5Ybz1Dp9X5kWmCa5evF1d+lz+uKpJg6b
	Sy01p7sEblvGFvlhNaSHrdN2aRbUwnAgCkPJ9CfPhoQeqe7FPymgOHZSWAux9gtBBm1n
	CanIZKfHqYlYLCiO+ICZmhJZRuRQVDW8hQ2EhXAqYfjYkRoXvJWH3AQWnDS9JzwlGytI
	7zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=DqxFtSEm6pAQrgvZJ7CSG5CrdR0M8rlMwnrx3NYNNLE=;
	b=ORpDMjWnR78515BuECGlWBJ1UviQkF28yWVpQtyl6sfL7Iqg3mn8qTmdj8wccBWG8I
	0PAV7ZNfVV47gRrMv/g/HQeOl2iDE0lfvMNwXJy3d+gD/sNwU49/zDuFpYvQnPjGxUKV
	Ag6/yC9Bmj5AvT2vTmMAeQav5wxyeWwIXxzUelagAB3EE+KD7TuF8HbcBlSYLzdEgLsq
	vjPAhf5t2q3ifCPVajqgIn56t+uwz8qOZTuXKy/8ZAmzdPteWux8nNtHBG9d7x8LgG4G
	Z0w+7FJk13+9JwO+UKt9q05Efll2qWEjHv2gSin74E1aRg2TvDrVCy0y4eCPj7GC9tIs
	k1gQ==
X-Gm-Message-State: AG10YOSkHVxLlCdM6pD2WnVYHSCqHjNEUitSOcBP7MsYg0DMShyrLk7u5uddrcdz9+6xOjRTqFqM+enbXmxCSw==
MIME-Version: 1.0
X-Received: by 10.28.220.134 with SMTP id t128mr6884091wmg.61.1454707099989;
	Fri, 05 Feb 2016 13:18:19 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 5 Feb 2016 13:18:19 -0800 (PST)
In-Reply-To: <CAJTo0La-U-9vT_PCnbrBvXbS__v9MdwV6sUC93vr7k7s=JewPA@mail.gmail.com>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
	<CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
	<CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
	<CAJTo0La-U-9vT_PCnbrBvXbS__v9MdwV6sUC93vr7k7s=JewPA@mail.gmail.com>
Date: Fri, 5 Feb 2016 13:18:19 -0800
Message-ID: <CAJ86T=VdL-Ux-8jkyL-e9ZXVjA5zsLCUqDngbi4UOM3tGpk-VQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 21:18:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 1:04 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> On 5 February 2016 at 20:55, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> > Agreed - some may not want openssl at all and being able to switch it
>> > for
>> > another alternative would be useful.
>>
>> sure. but, then I have some questions..
>>
>> 1. which one we default to? openssl?
>>
>> 2. which one we support, from configure.ac:
>>
>>         [choose SHA1 implementation])])
>> case "x$with_sha1" in
>> x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto | xlibsha1 |
>> xCommonCrypto | xCryptoAPI)
>>   ;;
>
>
> nettle / gcrypt / crypto are all in oe-core.  I presume that's BSD's "throw
> it all in" libc.
>
> nettle seems nice and low down the stack and modern.

Nettle has licensing issues for some (GPLv2 libraries aren't
acceptable if you want to link with proprietary code and LGPLv3 isn't
acceptable if you want to lock down your rootfs).

Since mesa libs are somewhat likely to get linked with proprietary
applications, openssl might be a safer choice here?

>>
>> 3. is there a good way to handle 'multiple choice' with PACKAGECONFIG?
>> How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?
>
>
> With a comment saying "pick one of these", and nothing in the disabled case.
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

