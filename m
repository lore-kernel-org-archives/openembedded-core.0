Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.55294.1606708348310392903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 19:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IjiRrnmj;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id b10so8159876pfo.4
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Nov 2020 19:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cXnCarkTjokgjDr06kJua362RdJqvcYz4fr41lzOrcs=;
        b=IjiRrnmjQmaPGX5CHoxxldrELvv5lQ0P793p5t5Z46+cp207coQlvZYnb1vwU2NMyX
         Hda4aYFEIFSV1u5zpKJ75e43TGYY5p7UtmyciuYIarf1oC5LEyhA0xdjfGj5a7jhuMRJ
         iKqhVA7pZ2Ta9tg2KlF/5MS0x5FcSexQKryhYv+7k1xd1eDdMYK48jueHCIW/kUs+Et3
         b+uidAxtHfJ3F80HDTQT0pbhsB5EaSGUrWKqq29FcDQJBjWfygnw+RBqfv4zG4NaE6pQ
         N0hKyCmnwY63ChE4WkxbnXzD2kzZ5Y2A/Wnjrt1mcT+U4rOz+JxKRggFEh4o7cuBvPE+
         ajTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cXnCarkTjokgjDr06kJua362RdJqvcYz4fr41lzOrcs=;
        b=AsYqoQzOd5NPy2uiMU/GbEnFBzvHFvowKRJEN30F65AaOC0Vj8plyOahtFIr9cafuz
         DRAUUmTWFqypIrVj8RdEFu1Un/QqYKHtJGOd+pHoBisqK1HZQLdtN3CtbNjEpEyy7PWF
         bskkflTA8gt1igB8YRRSGwljJzUlIo7nrEJ6dyy3dhppJeYQPeBlEWjTMsK0wXcC/+E5
         5RLJRKumT555Q70nUmX12044phBeIMk1uO7PeaSPv/ok8Z5glqNOdYX/XnZLkQwonqV2
         sXHizZdSVp3bStk0AJnBU1MYDjfawSYO4Vyqu4UCM3IUW4dyg2pI34d9eaxqRFa+kY14
         U6pw==
X-Gm-Message-State: AOAM533QswxT2Ge5jQMK36R51UarMQHEArmza9mB9DmrRW73WGKVu2RV
	d4K5eg/4G6T/whn48XBfiokgj70kgZLY1Q==
X-Google-Smtp-Source: ABdhPJzrJrpPGPiT2cq3AmvTtGZ25/7oSEklB+pZloJCxpKeQpKvUjnNtBC+jNRuYkIlZ4x3LkS4mw==
X-Received: by 2002:a63:e54b:: with SMTP id z11mr3874686pgj.158.1606708347305;
        Sun, 29 Nov 2020 19:52:27 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:50da:b39c:9932:258b? ([2601:202:4180:a5c0:50da:b39c:9932:258b])
        by smtp.gmail.com with ESMTPSA id c2sm14787219pfi.21.2020.11.29.19.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 19:52:26 -0800 (PST)
Subject: Re: [OE-core] [PATCH 00/18] Move python3-pytest to oe-core
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
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
Message-ID: <1e770a99-711b-c9e6-829e-497e5180a31f@gmail.com>
Date: Sun, 29 Nov 2020 19:52:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/27/20 8:24 PM, Tim Orling wrote:
> From: Tim Orling <timothy.t.orling@linux.intel.com>
>
> We are increasingly needing pytest in oe-core, so it is time to move it
> from meta-python.
>
> This series first imports the recipes -- as-is -- from meta-python.
> Second, the maintainers.inc is updated to add myself as maintainer for all
> the new recipes.
> Third, the two recipes that have stable updates are updated to their
> latest releases.
> Finally, a fix caught during ptest runs is added for RDEPENDS for
> pytest.
>
> This was built on 'nodistro' with only openembedded-core and tested on 
> qemux86-64. All the new recipes that have ptests pass all tests.

cool. This will reduce the number needed from meta-python  that the
sphinx recipe needs.

need to rebase my work.
-armin
>
> The following changes since commit 6e3785a3f1f3cf68f5fe101cd6bebe91db165973:
>
>   uninative: Don't use single sstate for pseudo-native (2020-11-24 15:53:04 +0000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib timo/add-pytest-to-oe-core
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/add-pytest-to-oe-core
>
> For convenience, the same series is also available at the Git repository
> at:
>
>  git://git.yoctoproject.org/poky-contrib timo/move-pytest-to-core
>  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/move-pytest-to-core
>
> Tim Orling (18):
>   python3-atomicwrites: move from meta-python
>   python3-attrs: move from meta-python
>   python3-iniconfig: move from meta-python
>   python3-more-itertools: move from meta-python
>   python3-pathlib2: move from meta-python
>   python3-toml: move from meta-python
>   python3-py: move from meta-python
>   python3-setuptools-scm: move from meta-python
>   python3-packaging: move from meta-python
>   python3-wcwidth: move from meta-python
>   python3-zipp: move from meta-python
>   python3-importlib-metadata: move from meta-python
>   python3-pluggy: move from meta-python
>   python3-pytest: move from meta-python
>   maintainers.inc: add self for new pytest packages
>   python3-more-itertools: upgrade 8.5.0 -> 8.6.0
>   python3-importlib-metadata: upgrade 2.0.0 to 3.1.0
>   python3-pytest: RDEPENDS on python3-toml
>
>  meta/conf/distro/include/maintainers.inc      | 14 +++++++
>  .../python/python3-atomicwrites/run-ptest     |  3 ++
>  .../python/python3-atomicwrites_1.4.0.bb      | 25 ++++++++++++
>  .../python/python3-attrs_20.3.0.bb            | 20 ++++++++++
>  .../python3-importlib-metadata_3.1.0.bb       | 18 +++++++++
>  .../python/python3-iniconfig_1.1.1.bb         |  9 +++++
>  .../python/python3-more-itertools/run-ptest   |  3 ++
>  .../python/python3-more-itertools_8.6.0.bb    | 23 +++++++++++
>  .../python/python3-packaging_20.4.bb          | 14 +++++++
>  .../python/python3-pathlib2_2.3.5.bb          | 13 +++++++
>  .../python/python3-pluggy/run-ptest           |  3 ++
>  .../python/python3-pluggy_0.13.1.bb           | 27 +++++++++++++
>  .../python/python3-py_1.9.0.bb                | 15 +++++++
>  ...he-setup_requires-for-setuptools-scm.patch | 39 +++++++++++++++++++
>  .../python/python3-pytest_6.1.2.bb            | 39 +++++++++++++++++++
>  .../python/python3-setuptools-scm_4.1.2.bb    | 21 ++++++++++
>  .../python/python3-toml_0.10.2.bb             | 15 +++++++
>  .../python/python3-wcwidth/run-ptest          |  3 ++
>  .../python/python3-wcwidth_0.2.5.bb           | 25 ++++++++++++
>  .../python/python3-zipp_3.4.0.bb              | 19 +++++++++
>  20 files changed, 348 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-atomicwrites/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-attrs_20.3.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-more-itertools/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-packaging_20.4.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pluggy/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-pluggy_0.13.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-py_1.9.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pytest_6.1.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-toml_0.10.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-wcwidth/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb
>  create mode 100644 meta/recipes-devtools/python/python3-zipp_3.4.0.bb
>
>
> 
>

