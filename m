Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web12.11021.1619461161051266621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 11:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OwuGi//N;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: akuster808@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id l9so4861621ilh.10
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=da/9WjzsatMlRCMKbkWdD/lAgwDiwZzxs+0jWmA2Qgc=;
        b=OwuGi//NCGQMQ0TDptgoSBi4LmPvm3d6QX0jVKUtAUeLSKkX8sIMNUnkcxxtk1LbtB
         4t97bM1KfwJIi1jdCQpCJTuOk9zKnj3Z0HV2iNRaYEBlyG5NyOsfokBbaAtoFWugzHk2
         tGJ69iSEGK8KlUGDFeUXKcHJzkdSl8uIbyeRrfZo5G5k2zxGb2sQsYazPPYWYS5EQAcu
         RozwH2Y4yx6B1Y7z6W3oIji3OqM6xHE7k/o8qFpFqilV48nhKqZXwmH5DOpgp/kpXf5e
         leDi+C/vLaKUMvkvnlXsKAjswh6ueIAouwUJayIlZOZ1GBChC8WBRdy1aje1ciwxUB3C
         Y0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=da/9WjzsatMlRCMKbkWdD/lAgwDiwZzxs+0jWmA2Qgc=;
        b=WLqZzJ6Ha1V8KOogpDVRDlrgJ6oHAvtd6DhhOIzb9Fk3sDNP8OU6PORYN6z6UngMlX
         EESkzSX3dCM/HyMNxPIvMuqwGfbLIEyBH1OAXKHFYgKGXFVbx/b0AcLnvz7iAjswr790
         UHXkP67VxSwF/3swcS0A2IAuUDhbc6WSWiGh27nR9+hPJysOt7RI4eHwB5kcrGcxQdxz
         gsfJS4jgELgr+BHYiDr91hoRcvA3o4vD6puXaVe18tgwWWv72xcpjjjLa8Uwb7U3RMt9
         MDQsNSH0Yf7VAOqs0DTT/EJdOoUP9C/mwgrw/9pP7RIY8m5W/OS/qrGh1+Cclg9T1N7C
         MQDQ==
X-Gm-Message-State: AOAM531QKmkVLzECapp/Unqx3rO5CaDIlIEKh4TZq4Yy1UdD/+8CYy7a
	TLAAtV5gDi5VyoKC+MnvdJ4AnQ2whFRmxQ==
X-Google-Smtp-Source: ABdhPJxxxNIsoMB++l3hI4cVeb3m7crSVG8jHImvIR5k1GIfwA525xvoQnVjxGI/TNJKL123fYH9/w==
X-Received: by 2002:a92:130a:: with SMTP id 10mr15225242ilt.159.1619461160264;
        Mon, 26 Apr 2021 11:19:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:1c81:c15:4155:b74d? ([2601:202:4180:a5c0:1c81:c15:4155:b74d])
        by smtp.gmail.com with ESMTPSA id k14sm7522477iov.35.2021.04.26.11.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:19:19 -0700 (PDT)
Subject: Re: [PATCH] gnutls: Point to staging area for finding seccomp libs and includes
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210426180615.2837459-1-raj.khem@gmail.com>
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
Message-ID: <efaec314-294b-8689-a777-d8d363f72174@gmail.com>
Date: Mon, 26 Apr 2021 11:19:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210426180615.2837459-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/26/21 11:06 AM, Khem Raj wrote:
> This ensures that if libseccomp is installed on build host then it does
> not resort to use it.
>
> Fixes
> checking for libseccomp... (cached) yes
> checking how to link with libseccomp... /usr/lib/libseccomp.so

Thanks
-armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
> index 3e1958c969..350d0a018b 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
> @@ -31,7 +31,7 @@ PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
>  
>  # You must also have CONFIG_SECCOMP enabled in the kernel for
>  # seccomp to work.
> -PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
> +PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
>  PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"

