Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.725.1588093758762761178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 10:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFfy9lzp;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id r14so10982702pfg.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JYc7sxkM9qM4fCNsvpUU+j/Qlha/Sqd1uGwx6fMVqr0=;
        b=VFfy9lzpzjOW7+aCKqf0ugMnvKQ01oTMNEc1Qau+HwQFOYdqDIpqQl9cvAA8we9bc+
         75Ir/agX2CXq8uPJ2of9BspPexns9iA+jhGd6NWuYQ0hDzVQw4fqmkrWhXgAOXgC6Eez
         b9bpuF9o/Wfi6pk/NMt6Kp/3r9ZX2yAcApsNhm/NYZcbtUxCFh3HjyyT8IS4hFAk5T3R
         4BfNNRNdXj6eBUN5U8uJEW5o2YyJ3EeW5Jlljwe1TXdvA6l/PF0Zvf49rCsTg4cS4fhW
         fi9GpuPK8c109pS43kdif03VQPmr/dQj1rrsXHqj4uskINLV3QD3URuFJF+rrhISggCQ
         RpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JYc7sxkM9qM4fCNsvpUU+j/Qlha/Sqd1uGwx6fMVqr0=;
        b=fFuGM+zSdOt4UaRwcx3WIbaqyUNJJyDHt3Zw5xl6I3v3ciAB+mw0Ag+0AXt5hqElMT
         SItYLZL+RAjdhN07vGb6ea1mYqrYsvPNZ45YjT0qiuG3IrhlOkFkCtt7SYZK6s54nIsM
         GmbPKhu1POVrK2Ufl03XmzjD6vkyxfCG9j3RfMWM+gQi297MlBu0DSajQgJWjBnd9q7y
         tt+4rbNtSFvMdeRWqJzIdQSE+sleC75DB/x123GOTBvjjzeTG9mCuAQJpkepo7PHdmrn
         M5B2O1SIU4LzVGCWU1pnadHO1b3q7iLEodeJXPiAM1ueBEGC+RSpWGkBhJEKfLkBf7rw
         4B2A==
X-Gm-Message-State: AGi0PuYLNH4cUwcQHvYUNwnYYQ8FCWnDzrVNaEgdWlU49I6mzTIr9vND
	A2zv7X05tE0m9o0FalHD8IS00yXw
X-Google-Smtp-Source: APiQypIpBxfEB/FaO146hjMDOBP7dyTnXS48rkEmIUEv+Am6DAFW01splejlZfmTJLX58eOzCtNHdw==
X-Received: by 2002:a63:5359:: with SMTP id t25mr20046989pgl.349.1588093757787;
        Tue, 28 Apr 2020 10:09:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3c5d:7c09:562a:defe? ([2601:202:4180:a5c0:3c5d:7c09:562a:defe])
        by smtp.gmail.com with ESMTPSA id p16sm2600750pjz.2.2020.04.28.10.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 10:09:17 -0700 (PDT)
Subject: Re: [OE-core] [zeus 0/7] Merge request
To: =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>,
 openembedded-core@lists.openembedded.org
References: <cover.1587931177.git.akuster808@gmail.com>
 <1ef6f737d5b44b11b409ed459438666b611b7fa9.camel@pengutronix.de>
From: "akuster" <akuster808@gmail.com>
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
Message-ID: <1339637a-51fc-d092-1c71-903feca9d6c9@gmail.com>
Date: Tue, 28 Apr 2020 10:09:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1ef6f737d5b44b11b409ed459438666b611b7fa9.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/28/20 9:13 AM, Jan Lübbe wrote:
> On Mon, 2020-04-27 at 19:15 -0700, akuster wrote:
>> Adrian Bunk (1):
>>   openssl: Upgrade 1.1.1d -> 1.1.1e
>>
>> Alexander Kanavin (1):
>>   openssl: update to 1.1.1f
> As 1.1.1g has been released to fix CVE-2020-1967
> https://www.openssl.org/news/secadv/20200421.txt
> maybe we should just update instead of picking Zhang Xiao's "openssl:
> fix CVE-2020-1967" (which would conflict with this PR).
Thanks for the information.

Once Master and then Dunfell have this update then Zeus can take it.

- armin
>
> Regards,
> Jan
>

