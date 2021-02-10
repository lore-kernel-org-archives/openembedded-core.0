Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.210.1612992058443280718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 13:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oZof/txz;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: akuster808@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id y15so3220685ilj.11
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 13:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hmj09A9v+DhfheD/+rC6NCquRzW6zMjeBHdtXNy7pKc=;
        b=oZof/txz9kHL1kox37KcZrM6PpvaZwX1N11+cNJ+xL/RSl4iqIq/VYXtTdDVsSJzmI
         daqPT5kdRku81VRfsi6Ayk2609DpvKm8UHQsRyOb1/cf1dDNl7wcQc0rfitdXT8CZCib
         +StUCptfSVhCVIvMhPU2tgv3JABfsYN0jupnEhe7DqegoOxvOLUTSxL+bA0gcW5u1LFU
         3ctrDZ1YlKLG2aD8OdZADPWJJQQXWlYVB1DhGL/Y3xMf8MqWwm5lAqzygpfSMvi1NGKN
         1bCnhqNj3NBhaxckyDOKH/zFU3i+Gbe7cR4kcncOoYJztWH4dd5HMUcciZLHtfi6rGwR
         hfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hmj09A9v+DhfheD/+rC6NCquRzW6zMjeBHdtXNy7pKc=;
        b=FuJLirzA60k6nQRR27W7jyyfzfdQSF4fLV9uGUpz0KaWxxKkAaTmPsAzIzJ3s6jyDt
         ip1S2XWDAN1HL5A8sRHsHGECqcbEUYOYVdAG4G29CPRX4lKmoPpeC/YEnZjOFSldBc1H
         nBRCvLZ+f7QY5BNHB04q8i5wkbskS89i3aJMns1VUAU54fUx4SJtYWcm15dZmG+EdOS9
         CQIuy4bDKOc/GLv/UxIK11rTkASUxZhtYH5cMB51eVYC255fI1cMYc82P7WVx514EdLH
         Ym3mlQCEmQSMCa2i0N4Rfdosm/QyHpBNwQ9J0Qon8EM+TxUfHbyu/jYoC3Wpd3Xr5jMP
         YnXQ==
X-Gm-Message-State: AOAM533ekk5tX6JQNEvACjahJLduQpDaNapo4Xw5VD/x9DmHdB1GwCqu
	M+CPleUuHh6fae/F/itJDCHp06C9UZBqGQ==
X-Google-Smtp-Source: ABdhPJzscOtL6QnzMDzppe9R6bAnfSaTdwg7EJKZ6WQuWKnDBlowSARuQotNcU4G/1Nn4E0gKwyMBA==
X-Received: by 2002:a05:6e02:1390:: with SMTP id d16mr2897194ilo.269.1612992054402;
        Wed, 10 Feb 2021 13:20:54 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5c13:19:1e34:e0ed? ([2601:202:4180:a5c0:5c13:19:1e34:e0ed])
        by smtp.gmail.com with ESMTPSA id g17sm1563467ilk.37.2021.02.10.13.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 13:20:52 -0800 (PST)
Subject: Re: [OE-core] [PATCH] connman: update to 1.39
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-core@lists.openembedded.org
References: <20210210155419.1444596-1-open.source@oleksandr-kravchuk.com>
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
Message-ID: <491422b1-e871-2948-7ef9-1d1ed8a7c853@gmail.com>
Date: Wed, 10 Feb 2021 13:20:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210155419.1444596-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/10/21 7:54 AM, Oleksandr Kravchuk wrote:
> Changelog:
> - Fix issue with scanning state synchronization and iwd.
> - Fix issue with invalid key with 4-way handshake offloading.
> - Fix issue with DNS proxy length checks to prevent buffer overflow.
> - Fix issue with DHCP leaking stack data via uninitialized variable.

this update was sent last night which included CVE #. either patch will
do IMHO

-armin
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)
>
> diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
> similarity index 78%
> rename from meta/recipes-connectivity/connman/connman_1.38.bb
> rename to meta/recipes-connectivity/connman/connman_1.39.bb
> index 027c41e9af..df42e9ffb8 100644
> --- a/meta/recipes-connectivity/connman/connman_1.38.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.39.bb
> @@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>  
>  SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
>  
> -SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
> -SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
> +SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
>  
>  RRECOMMENDS_${PN} = "connman-conf"
>  RCONFLICTS_${PN} = "networkmanager"
>
> 
>

