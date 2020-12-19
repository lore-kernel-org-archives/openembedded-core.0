Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.12527.1608400292044630927
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DGZeRcx6;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 143so5226619qke.10
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CrEWvNS/P9xagm/t06xu0hHMAzcyLJ2xs4n/sTG2L6A=;
        b=DGZeRcx6baM/Ueb12Vp/wiB+Dw/3Q2NHuUiB3WkPlmxa1Gx+sDKJoDvn3C9lEuwaG5
         WIxBmRbZ7154klk04d405/9AUGBiUsW/PUtrnlcwwOcK0FLayXlTpgkpCWRNk/S/yr0p
         qJca0nqz59o0nibwqTyWmdz5Mj1diq+jEv1bpsYGnS2SSiHcD0EBOXQeSlOS96ldG/T6
         4ATeX2D5HkDvLTihtwYH0zrIz6l2UImmjdf0HVKxfCMYHl2saMwH9shJF9ttXompC+7t
         ylXsVziVguUp1pWZ/mQi5Tdi79JpQaUqU1G8JO46A6sUQVTqbh4z9JStrE8KzlZ9ndCF
         B1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CrEWvNS/P9xagm/t06xu0hHMAzcyLJ2xs4n/sTG2L6A=;
        b=W6qnLtN+I+WIRqYPTFnwFHb6KK9cgrF44RVnjwyHADbInX1tZuDffx+Qi8zK+o21xi
         +nqanzqYXd6YSsDCSR7DwbOzPX4aXIAhONBdGYt0lK9qQiTgwXfFnIjCEdclLgPz9/+O
         48kZ2mlbZFmsiPWEGHnsw7Sicvk8k+txzqgnY6xOQL8uP2QukaEHi2A1TZl+DgurVeiw
         04Z7m8vivnGfydOLXPK7UPmLUEgh65GQ0BQis+MbJccVmc8+ZHtdNh1OisrKxDiY0xLl
         ym2zCmmT3JYN2+yYL73yj/w5z19E8TSveKjBxfgK/yCOXoIg0rN5SmMeuI8QHy2wSDNZ
         ncFg==
X-Gm-Message-State: AOAM531Mr/sGhZMI3PRpDS49qBrCL3lEiH0krcBdMBMeaLbLOcllGlMA
	vZKlSwlFtwqI+yFcrdYM3G9mOHWi/Kx2UkSpaj8=
X-Google-Smtp-Source: ABdhPJxLTqkS4myX3tS3tR4KrfHftnmi2zL/w6ZK0fw3aSXtkZf/re0hbSGB/u96WuggmV367q1z8sAlfjFpwUZ+rDY=
X-Received: by 2002:a37:744:: with SMTP id 65mr10229993qkh.71.1608400290867;
 Sat, 19 Dec 2020 09:51:30 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org> <CANNYZj9YhbVH+r-wC71nuj4p94MBhmrE13KGtKh-rced6fqVKg@mail.gmail.com>
In-Reply-To: <CANNYZj9YhbVH+r-wC71nuj4p94MBhmrE13KGtKh-rced6fqVKg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Dec 2020 09:51:04 -0800
Message-ID: <CAMKF1so=CwgX9Vw5nMWNxwhcc=CLv-XK9GrmUeFb8ME_vpqc+Q@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Shachar Menashe <shachar@vdoo.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 9:45 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> What version of oe-core does this target? master already has 1.1.1i.
>
> Also, I have doubts whether we should maintain 'deprecated crypto' lists, as we are not qualified to judge what is deprecated, and crucially, keep the list correctly updated. Isn't openssl upstream supposed to make those decisions?

upstream openssl enables almost all of the algorithms it supports.
Providing a way
for users to add/remove algorithms with some defaults I think its a good thing.

>
> Alex
>
> On Sat, 19 Dec 2020 at 18:36, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> The OE-Core list needs to be included on this so I'm doing so.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> ---------- Forwarded message ----------
>> From: Shachar Menashe <shachar@vdoo.com>
>> To: "yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
>> Cc:
>> Bcc:
>> Date: Sat, 19 Dec 2020 16:04:30 +0000
>> Subject: [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
>> 1. Drop support for many deprecated algorithms by default
>> 2. Allow dropping support for TLS 1.0/1.1 via PACKAGECONFIG
>>
>> Signed-off-by: Shachar Menashe <shachar@vdoo.com>
>> ---
>>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> index 8159558..f9764bd 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> @@ -33,6 +33,8 @@ PACKAGECONFIG_class-native = ""
>>  PACKAGECONFIG_class-nativesdk = ""
>>
>>  PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
>> +PACKAGECONFIG[no-tls1] = "no-tls1"
>> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>>
>>  B = "${WORKDIR}/build"
>>  do_configure[cleandirs] = "${B}"
>> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>>  CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>>  CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>>
>> +# Disable deprecated crypto algorithms
>> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
>> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
>> +
>>  do_configure () {
>>         os=${HOST_OS}
>>         case $os in
>> @@ -122,7 +128,7 @@ do_configure () {
>>         # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
>>         # environment variables set by bitbake. Adjust the environment variables instead.
>>         HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
>> -       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>> +       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>>         perl ${B}/configdata.pm --dump
>>  }
>>
>> --
>> 2.17.1
>>
>>
>>
>
> 
>
