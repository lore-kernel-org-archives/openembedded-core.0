Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.29970.1620023054816153951
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 23:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jMubh1WG;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t22so2968175pgu.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 23:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=neNxSu72Ut7nUWxd0OXzg5M1fcljwHc6Zfs28PC6OhQ=;
        b=jMubh1WGXa5Yo4lDWdTH+0S/d9iceq/grR0Vs7QxoCg+vJXFy0zBZJX9956fPNelLe
         5NW90AoSanmE07aEPArXAtcH5yCc8FKpNQMg828H6XUPt6pL8QqB1Zh0bcnMSaOOTLHS
         9sdFgQBphLvJVAgonEUsiBnN1pwzioBoT4yxldFE3zHEF+Rlze+uWDGDg1ZOE637neAt
         7smMSw2/MFQPGjt45F5S6McKLHDGJbOPI1szV5Mv8P3zR9CVoyvyj081lCEE7+ZZMP6D
         1eoZIznTta7Q2Q8Bibl1jUKnAELE1tEE7NaeKefjPgJ626Czs28FTlwpW/CJ/KsCq7My
         ho7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=neNxSu72Ut7nUWxd0OXzg5M1fcljwHc6Zfs28PC6OhQ=;
        b=sqbjVSWaVIqdrD2PhZ37GSaUKr6LBvihsND7gztNSmDB4dRDNO09A/EjYeH6MfkZm6
         szJ75gqA8ZNekIzr86IqRdocav6Sv/LBC8FmwG54+qr1pZRD63EX/1gmlt/Ufhhj0JSr
         FAqaRkUIc59Adb+NhGynB4PHhdGGTfuV26lJZeMBtzrxAzxHQDEEvVZUCZVANy89n/Fa
         LTuPHWLyas2+ZJog8B0WoKa4YWzgMVpCA8l+y4s7wF79dOEsKiZksg+f54vDTMDhLBCk
         1BNVhIo/nj5glnGWwbQIQgcAPG8rfzfLel601uRYUV07m9o1rbgOc3UBpj3W83AWRhap
         YsJw==
X-Gm-Message-State: AOAM5329RPJm+WeANB78RhKSMdVReEot4ThaQzvZCV48T/K9AblnTGrj
	joIP5WgDTETlpRa0q4dlBTnGv4lalSLxkQ==
X-Google-Smtp-Source: ABdhPJxA0hm8VBdC6HbYMYhE0yBCIMbq4PqRZ6C+Lr7rQbh5L+s160EanOBaPD22qv1M7q6ErKFL6g==
X-Received: by 2002:a63:1b55:: with SMTP id b21mr17051976pgm.160.1620023054011;
        Sun, 02 May 2021 23:24:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:dc35:22d6:72af:c1da? ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id o9sm8513817pfh.217.2021.05.02.23.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 May 2021 23:24:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] testimage: hangs if missing debug-tweaks
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210502201227.3587958-1-akuster808@gmail.com>
 <f9d76fc95bd43c5418eb5c947c48399f5f15b7a2.camel@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a7d93e2b-608f-b5f3-e3fb-16abb2cba514@gmail.com>
Date: Sun, 2 May 2021 23:24:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f9d76fc95bd43c5418eb5c947c48399f5f15b7a2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/2/21 4:00 PM, Richard Purdie wrote:
> On Sun, 2021-05-02 at 20:12 +0000, Armin Kuster wrote:
>> The only clue is this:
>>
>> WARNING: core-image-minimal-1.0-r0 do_testimage: Couldn't login into se=
rial console as root using blank password
>> WARNING: core-image-minimal-1.0-r0 do_testimage: The output:
>> root
>> Login incorrect
>> qemux86 login:
>> Login timed out after 60 seconds
>>
>> Poky (Yocto Project Reference Distro) 3.3+snapshot-65e75bd5d40c10509a34=
16026e551b7b7111c42a qemux86 /dev/ttyS1
>>
>> qemux86 login: <<< run_serial(): command timed out after 120 seconds wi=
thout output >>>
>>
>> Hangs here....
>>
>> We should issue a error and quit.
> What happens if I set IMAGE_FEATURES =3D "empty-root-password allow-empt=
y-password"?
Do you expect folks to use undocumented internal only settings? (Just
added them)
>
> Should we disable the serial monitoring if these or debug-tweaks isn't=
=C2=A0
> enabled?=20
Will look into it.

> I'm surprised it causes the image to hang, it should just trigger the
> warning but continue to work...
WARNING: core-image-minimal-1.0-r0 do_testimage: Couldn't login into
serial console as root using blank password
WARNING: core-image-minimal-1.0-r0 do_testimage: The output:
root
Login incorrect
qemux86 login:
Login timed out after 60 seconds

Poky (Yocto Project Reference Distro)
3.3+snapshot-65e75bd5d40c10509a3416026e551b7b7111c42a qemux86 /dev/ttyS1

qemux86 login: <<< run_serial(): command timed out after 120 seconds
without output >>>


Currently=C2=A0 1 running tasks (732 of 732)=C2=A0 99%
|#################################################### |
0: core-image-minimal-1.0-r0 do_testimage - 10m15s (pid 879458) <<<<---
how long should one wait???

TEST_SUITES =3D "ssh scp ping"

not testing much.

- Armin

>
> Cheers,
>
> Richard
>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>> =C2=A0meta/classes/testimage.bbclass | 4 ++++
>> =C2=A01 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bb=
class
>> index 43de9d4d767..18ebbf90ec5 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -142,6 +142,10 @@ do_testimage[depends] +=3D "${TESTIMAGEDEPENDS}"
>> =C2=A0do_testimage[lockfiles] +=3D "${TESTIMAGELOCK}"
>> =C2=A0
>>
>>
>>
>> =C2=A0def testimage_sanity(d):
>> +    if (bb.utils.contains("IMAGE_FEATURES", [ 'debug-tweaks'], False, =
True, d)):
>> +        bb.fatal('testimage requires a blank root password'
>> +                'Please check if debug-tweaks is IMAGE_FEATURES.')
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (d.getVar('TEST_TARGET') =3D=3D 'simpl=
eremote'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0and (not d.getVar=
('TEST_TARGET_IP')
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0or not d.getVar('TEST_SERVER_IP'))):
>>=20
>>
>


