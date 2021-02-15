Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.34233.1613408414100325145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 09:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gm7ntWlB;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id m2so4547174pgq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=l2h+vCsgTjF7YS2Qp9JXJCKOsk/fayq325JUX5psBS4=;
        b=Gm7ntWlBxqh0b9mWPKPiK+Xog4pBwGqOCP5Oy/G2sA8xG7OczXPbPR70GRHjWiU5Fp
         woRoXaWA0fpR41z2Pw3DQiD+BUyCluihOmlsXV2lxk2IvQLhorG4nJRDiBsH10nkPa8s
         evM7egAKarWSgS9MDYMT/CwNpeipb7JOt6dRWflIDuzr1IeeU9aO4CsoINoDGv4kETA1
         8Tta1+AYS1vN3Vejd7hZTpYTw6c406sn8/+g/jiFcNsRV+l7/4N9RqsaWmbldG+txaVd
         LvZrb7O7zkrcrKUq+dQyQQsf19SrpF4x7oWrB1Q9YmzhYp6b5YzQ0GO0DQRwJVJdYACz
         MmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=l2h+vCsgTjF7YS2Qp9JXJCKOsk/fayq325JUX5psBS4=;
        b=ZCz/FqaCI961gtZv1TEbThDzhPNvOmIoUZTpP/Isso4NqlWWvHwHbREvlO3JACbSA6
         mAmB6PN9QgVLVm0vRTunGNLSz7K1pqeTSUpn3uLlZ6krC2DZA4yjvThvXLLuBD10TUjf
         F8Vkt7IFv7FX/PLaMiILtseUMMgggAVihOmFU5LsmGlTd+6qk4NMW/sAvbhnFrMzjYiV
         CT8sklzH7Jp+dk0cnDmEirI5miG9712QSS+YZ97+MaZf5T6XFX4TCAf+/EbW8M0VUdIg
         NTHND5WK90RiU1AIKnjKDoWQ7r0MR/b6F9pChdb1PS3iYLZ9x371Rwg6sws6oOsyvctU
         6Bfg==
X-Gm-Message-State: AOAM532V9VIp+dZj+q8Ne2pQkc7pdQck5UpIRwboIj5ozWoKJfgdgTJ6
	5e2Bu66R8OV0W9n359dPiQ2xSiKRRxRpWQ==
X-Google-Smtp-Source: ABdhPJzb+PivFt3OiROJEmwA250bectYw5EgjGUpCpsZtruE5dx8UFyKg+yRdvz+o7bNs85Emc0Uxg==
X-Received: by 2002:aa7:9a4c:0:b029:1db:1c54:d52d with SMTP id x12-20020aa79a4c0000b02901db1c54d52dmr15795588pfj.35.1613408413177;
        Mon, 15 Feb 2021 09:00:13 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:93c:d121:547f:3124? ([2601:202:4180:a5c0:93c:d121:547f:3124])
        by smtp.gmail.com with ESMTPSA id v23sm18642386pgo.43.2021.02.15.09.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 09:00:12 -0800 (PST)
Subject: Re: [OE-core] [[PATCH] cve-check.bbclass: allow skiping non pbn
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
References: <20210214232027.2354161-1-akuster808@gmail.com>
 <YCooECLAFp0akfsC@korppu>
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
Message-ID: <09ae13e5-7a17-5b0b-9e8b-7ffcab548ff1@gmail.com>
Date: Mon, 15 Feb 2021 09:00:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCooECLAFp0akfsC@korppu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 2/14/21 11:51 PM, Mikko.Rapeli@bmw.de wrote:
> Hi,
>
> On Sun, Feb 14, 2021 at 11:20:27PM +0000, akuster wrote:
>> I don't see the point in logging native, nativesdk etc.
>> The bottom line is the BPN has the issue.
> While I agree to some part and do alot of:
>
> $ cd build/tmp/deploy/cve
> $ less $( grep -l Unpatched * | \
> egrep -v -- '-native|-nativesdk|-cross-|-crosssdk' )
We appear to generate a lot of redundant information.
>
> I do find that fixing build tooling CVEs is a good idea since
> they downloads stuff from the Internet.
>
> Hence I'm not sure I like this filter. Maybe at least
> rename CVE_CHECK_MANIFEST_FILTER to CVE_CHECK_FILTER_BUILD_TOOLS
> which makes this a bit more clear.
Yeah, I wasn't all the keen on the name either.=C2=A0 Thanks for the input

thanks,
Armin
>
> Cheers,
>
> -Mikko
>
>> Allow folks to filter out those other package name variations via
>> CVE_CHECK_MANIFEST_FILTER
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/classes/cve-check.bbclass | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bb=
class
>> index 112ee3379d3..0d33d5a530c 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -59,6 +59,7 @@ CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
>>  # Layers to be included=20
>>  CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>>  
>> +CVE_CHECK_MANIFEST_FILTER ??=3D"0"
>>  
>>  # set to "alphabetical" for version using single alphabetical characte=
r as increament release
>>  CVE_VERSION_SUFFIX ??=3D ""
>> @@ -96,6 +97,13 @@ python do_cve_check () {
>>      """
>>  
>>      if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
>> +        if d.getVar("CVE_CHECK_MANIFEST_FILTER") =3D=3D "1":
>> +            # drop native, nativesdk, cross, etc
>> +            bpn =3D d.getVar("BPN")
>> +            pn =3D d.getVar("PN")
>> +            if bpn !=3D pn:
>> +               return
>> +
>>          try:
>>              patched_cves =3D get_patches_cves(d)
>>          except FileNotFoundError:
>> @@ -164,6 +172,7 @@ def get_patches_cves(d):
>>      import re
>>  
>>      pn =3D d.getVar("PN")
>> +
>>      cve_match =3D re.compile("CVE:( CVE\-\d{4}\-\d+)+")
>>  
>>      # Matches last CVE-1234-211432 in the file name, also if written
>> --=20
>> 2.25.1
>>
>>=20
>>


