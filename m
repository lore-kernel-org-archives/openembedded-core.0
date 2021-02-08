Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web08.148.1612799739626434071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 07:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kiYqMR2b;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id f2so3540336ioq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rOy6iwmYI5xzxTZnFYJVK7OrlK/fVh8tpC5r5phgZ4g=;
        b=kiYqMR2bE3zpiyt6GBJXPH00YhyTGmb6kQESqswusKIl/Cw+lpu4LTglWr0Qd2GQXA
         tRpzgcGxvZm2aiHJtktNWUSeSofBvnJFTwaJWhgbY3h6ZY6H5pgp9g/Q6uqEWjKmk2jf
         MZhHYnLZiNl73L9fgmahgLZiy24NU59kE6v/QBFKSKP0v87kWQd1l5M5DCMnMXmjg+Cj
         UN2H58JDxA7zUcst86Zi8Dpx5AByU+bpkjj2IirPCb5EKlSkXqCR4L/8LAQtHAZgYs/M
         Hmg0al3OFhR6ARngZQAtm2j3fZcxA2a2nQfHjKR2ckBdRh/jPaCAFvVlQ5hBzWODJr3b
         MFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rOy6iwmYI5xzxTZnFYJVK7OrlK/fVh8tpC5r5phgZ4g=;
        b=H92DTmvjGL0OlLjVMK6GN500xnJ3NXhG+TnQFhFpvfn7QJ6LdfWSpi/y2AjWZX+A7D
         R5IODcdFKv4QWBpgNrow49FJpG2MlWgAWwtixMSpS5+DMyM+BXegGK9LWAoS+SrhucS9
         XQOTUOqTqSMVmJ9J3W71I1FEpW/BZMR8Hymz6DufNuLW45k+4Ab+0D92T1PLJgYw8LXH
         mr8cmmRyxGNWcuIbPG6AFgTdQs7MCFzY++fKNJssQppp/D1VRS/VP3ecvwDVmO1BdtSx
         u4HNy3N+nQcYb+Uf2hyTvVZSgzVinc5tEwRfs4QxCLhn5+Rb6RopzHWAF4QZ85NeiDKs
         pGxg==
X-Gm-Message-State: AOAM5338xI1oXvWKtr0aNa2Txogr09zktqTHXo/oLMfLFPmnBZM23pvw
	gyBRAfvWfS1X260GFONb5OJ9QeS0zMwI7g==
X-Google-Smtp-Source: ABdhPJw5FVGcEZ0zHIeIIaOpsmHOSgGjsSp9tq/1QdyCiLibO70CA/Oz2UFKmNA8ytlUiejMK5ytsg==
X-Received: by 2002:a05:6638:12cf:: with SMTP id v15mr18263735jas.77.1612799738751;
        Mon, 08 Feb 2021 07:55:38 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8024:4784:a3c:6cf6? ([2601:202:4180:a5c0:8024:4784:a3c:6cf6])
        by smtp.gmail.com with ESMTPSA id i20sm8729139ila.82.2021.02.08.07.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 07:55:38 -0800 (PST)
Subject: Re: [OE-core] [PATCH 2/2] cve-check: add include/exclude layers
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210208055130.892351-1-akuster808@gmail.com>
 <20210208055130.892351-2-akuster808@gmail.com>
 <86120a48209d7305382958e303e55e0f1a012da9.camel@linuxfoundation.org>
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
Message-ID: <3df4f82e-49fe-8550-b686-a60d79b586da@gmail.com>
Date: Mon, 8 Feb 2021 07:55:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <86120a48209d7305382958e303e55e0f1a012da9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/8/21 2:16 AM, Richard Purdie wrote:
> On Mon, 2021-02-08 at 05:51 +0000, akuster wrote:
>> There are times when exluding or including a layer
>> may be desired. This provide the framwork for that via
>> two variables. The default is all layers in bblayers.
>>
>> CVE_CHECK_LAYER_INCLUDELIST
>> CVE_CHECK_LAYER_EXCLUDELIST
> Do we need to document these?
Yes if and when the patches are accepted.  By doc do you mean the
manuals or documentation.conf?

- armin
>
> Cheers,
>
> Richard
>

