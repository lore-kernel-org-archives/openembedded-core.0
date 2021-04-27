Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.2258.1619555787672872510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 13:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U2Px2Bbc;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: akuster808@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id a9so2626154ilh.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=o+XafxgxnY9IhEW9I5KaFuzbKY2lpMDNQCK28ttb+eM=;
        b=U2Px2Bbco1FmVKg3Xn0hRVGTQJsYZm74dnvl0i9mpmVDCfuNjeWSK+e8GJASdmh3ou
         P4xA9ikCxu0UoFL/HmcX9+iDaNVNi72eU8CTQEiRYzLWkojVVJ+rlLMwt1ZJ2F7q/2Mn
         8as9MiqTPrXBJlLjyx6YRHagEagU0narZsri82dkLbScQfUb2RmhvF4luX7aJepX/y5p
         OsyDU2pFk/cYNs+ULyYVqHh2MvAU3ysS1ZaiRiyBnPnDijaPlHeyOjyDLw0r6piWmBkX
         vDVfW3Pe2tBgu7t5Yr9jz2nR7T8f9p7LoYRRm9MlTuQe4c+cOEwPSp/gp3ARYg3urvSD
         YzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=o+XafxgxnY9IhEW9I5KaFuzbKY2lpMDNQCK28ttb+eM=;
        b=UIaTOiuraCPnp/fDA2cRcoF9ACBMiU+f7/EK/v4bRPEklI9HYjUT1toODCZ7zjFjEO
         7UYldPr3CJAy3SShES/s9afKyhb1TXLnv1Id/jHu7f1V2Nd0qSsdKdAP/JkAzgqLl6g4
         6xaON25mUNpLwwcpG8TvhsSJyeL1Jw0bcJK7jtyyVR8lFnzXZWPj84k3C0Ioc96hK3PA
         pe2hut0HUpKIygREqDYzRYMvbyVu4Fc7wklRmr1ERPkqBwD5j8sLEHgttWmq0UrEsv5h
         VD70umanMRQ1kEWOh382NES77zFoofrr77tA+viIQGu2TTMPMaphIshOuZhoHtyKcTkk
         UKCQ==
X-Gm-Message-State: AOAM532EnSA1KjkAQOZlZjaMH7bSMyYz8BzOLzOa/VEkRvbk/ZbWN3lv
	Yat7BT+SUnDx+ldLvvsj4EE=
X-Google-Smtp-Source: ABdhPJyEIe1dii8ky76fm2tsfNds+NWSjc07YNnXMAlBx3rKFodFdawyXmg6py5d6Fc9j0JVpElDGA==
X-Received: by 2002:a92:c566:: with SMTP id b6mr19990401ilj.162.1619555787037;
        Tue, 27 Apr 2021 13:36:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d576:9b40:49cc:6195? ([2601:202:4180:a5c0:d576:9b40:49cc:6195])
        by smtp.gmail.com with ESMTPSA id a7sm1812630iln.57.2021.04.27.13.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 13:36:26 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
To: Randy MacLeod <randy.macleod@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org,
 "Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>,
 Kevin Hao <kexin.hao@windriver.com>,
 Yocto discussion list <yocto@yoctoproject.org>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-6-alex.kanavin@gmail.com>
 <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <0c3b5a85-06e8-0097-a71c-42d4dbcc2d21@gmail.com>
Date: Tue, 27 Apr 2021 13:36:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/27/21 9:09 AM, Randy MacLeod wrote:
> Cross-posting to yocto since this is of general interest.
>
> On 2021-04-23 2:02 p.m., Alexander Kanavin wrote:
>> This puts them on equal terms with x11 distro feature
>> (which I think is due).
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>> =C2=A0 meta/conf/distro/include/default-distrovars.inc | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/default-distrovars.inc
>> b/meta/conf/distro/include/default-distrovars.inc
>> index 9fcc10f83a..384ee7fc98 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?=3D "0"
>> =C2=A0 LOCALE_UTF8_IS_DEFAULT ?=3D "1"
>> =C2=A0 LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D "0"
>> =C2=A0 -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfo=
d
>> ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs
>> zeroconf pci 3g nfc x11 vfat"
>> +DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext2
>> ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf
>> pci 3g nfc x11 vfat wayland opengl"
>> =C2=A0 DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
>> =C2=A0 IMAGE_FEATURES ?=3D ""
>> =C2=A0
>
Randy,


> We (Wind River) already drop the x11 DF from some of our distros and
> we'd likely do the same for wayland and opengl so while this seems
> like the wrong change for headless systems it is one we could deal with.
>
> There was some discussion about this topic on the tech call today and
> people were concerned about BSP support for opengl since the software
> rendering in mesa is horridly slow.

Thanks for bring this issue up.

>
> Kevin, Bryan,
> Can you comment if you think we'd have any show-stopper problems
> with opengl support for BSPs?

Err, are they going to check my BSP ; )

>
> Joshua said that weston has a usable RDP (remote desktop backend) but
> I'm not sure how usable it is especially for single application sharing.
> This contrasts with x11 where you can use X11 forwarding over
> ssh trivially for whole desktops or an application.
>
> In conclusion, I see the value in pushing yocto forward but we may need
> to wait for agreement from BSP folks so let's see what they say.
The layer index=C2=A0 BSP list is long so waiting for feedback may not be
practical.=C2=A0 I think it may be=C2=A0 more of an awareness and how can =
the BSP
maintainers work around the default if there are issues rather than=C2=A0
stopping this progress=C2=A0 in core.

I personal would rather see my layer break so that I will be forced to
take action.=C2=A0 I see this as being=C2=A0 no different than when we upd=
ate
u-boot or the kernel.

- armin

> ../Randy
>
>
>>
>>
>>
>>
>
>
>
>=20
>


