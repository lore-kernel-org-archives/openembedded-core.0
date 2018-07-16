Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC0D75048
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:28:17 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id i12-v6so75954663oik.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZPZHA9kEaIhKIn53BvN8iFKmF1wOoP+MYYdBLPKOHy4=;
	b=KaawBMj/BUV0rWlFYjp8Eq8ponLj5VqRpmbYw2ZIsWImAkBXsQd6e0w92YzpsZNYw8
	P2nqfzLA2xuq6brYV7vPX0LwdN82dSlVKwBn0nW/DGHa7tB4Jvz8+TKmLJE4NFw4KOcR
	BvUzfkguXfHLYgPs+GW0g4tej+KPyKqTgq2rKHk3G+8ydNOsDCYISrSCaYTWo642Abwr
	SjbwqsrYsfvtGOjiRtc2QX2n/Rfc0gtKAVe6jHabRQPjd/7fWSkF7Dkb/dlhhEOKsiOE
	EqAcC8uPadrstmdp1fUIel3NP0CiK6WHMXuwU9KuWTN5SH6UqLn+g/5VYler2xzP4uP1
	hbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZPZHA9kEaIhKIn53BvN8iFKmF1wOoP+MYYdBLPKOHy4=;
	b=nbBfw7j/IKq2bjpXuLHv8tX8rsfuyNX5NuRkgMwTwfOn9jZBJ8uqk/S83Db6WAdl0T
	WadYDn4O4R1Tro3XjJWquh4ibfkgxioXNdVM398R97XI5kmrtRIl07ARWRQFYQ70bjAy
	Ttq69xtQdbauoY+0hYiY6NTXBUVjjO/yUcYfYwcNdukyjf5PpsOf8tBv1BY8uVVsqUNS
	t3P+u1fMKs3rx4YfUF/xlmCz/5Nd6CrKcCHn/pi4AwczOnr0WdRKmLaUvGfF6Yzmxatw
	RLwcbxJkqcS70d93ffVIDOr5gQF5cG2X74OBNTLA4XLuD54iorMDrjrE3NGPdG3hl0qt
	XflA==
X-Gm-Message-State: AOUpUlEVi9FpGenRXQlpuUIwhKX9J15aJJ4F7TUtan4jvXUW0Hx94lCT
	GpvJkEO42s3e81uvzoxv/OH08mdOpCURc0zI0Y66Kw==
X-Google-Smtp-Source: AAOMgpdnsGmGF422FV1XdmBl/7OhdHnzTL85vOonDhBFmNGB+jRii/RUF4PGIRxEY0cK8YXWfnYFbjvEK2OqTllsHYo=
X-Received: by 2002:aca:3f41:: with SMTP id m62-v6mr60340oia.18.1531758498394; 
	Mon, 16 Jul 2018 09:28:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 09:27:57
	-0700 (PDT)
In-Reply-To: <f44db656ae844fca53fedd6d2a10a503bf94d853.camel@linuxfoundation.org>
References: <20180716153005.16552-1-ross.burton@intel.com>
	<f44db656ae844fca53fedd6d2a10a503bf94d853.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jul 2018 17:27:57 +0100
Message-ID: <CAJTo0LbC9tz2+0UA8dP4joiFj6vYmd__w3Oy2T+MREZyB9MfJA@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] atk: add explicit gettext-native dependency
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
X-List-Received-Date: Mon, 16 Jul 2018 16:28:17 -0000
Content-Type: text/plain; charset="UTF-8"

There's a bug upstream but non-trivial to resolve.

Ross

On 16 July 2018 at 17:17,  <richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-07-16 at 16:30 +0100, Ross Burton wrote:
>> In native builds we attempt to turn off i18n but this doesn't work in
>> Meson
>> yet[1] but as the gettext class reduces dependencies in native builds
>> we need to
>> add gettext-native to DEPENDS explicitly.
>>
>> [1] https://github.com/mesonbuild/meson/issues/821
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-
>> support/atk/atk_2.28.1.bb
>> index a051247d8ff..d64df37f5de 100644
>> --- a/meta/recipes-support/atk/atk_2.28.1.bb
>> +++ b/meta/recipes-support/atk/atk_2.28.1.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd00
>> 2f49e7bb854063f7e7 \
>>                      file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9
>> b30f619ca8d819bc12d3 \
>>                      file://atk/atk.h;endline=18;md5=fcd7710187e0eae4
>> 85e356c30d1b0c3b"
>>
>> -DEPENDS = "glib-2.0"
>> +DEPENDS = "gettext-native glib-2.0"
>>
>>  GNOMEBASEBUILDCLASS = "meson"
>>  inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-
>> introspection
>
> Can you at least comment this in the hope we can eventually drop this
> again please?
>
> gettext-native is a huge pain dependency wise and slows down builds
> significantly. Is there a way we could tweak meson to avoid this?
>
> Cheers,
>
> Richard
>

