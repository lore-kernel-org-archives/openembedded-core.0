Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.6650.1608009534484290788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 21:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o8uEElVZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id v29so14437643pgk.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 21:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0xlECQJubyU6ky+lY7ASxMVx2V1IPX2mpT9Gl6XJvMo=;
        b=o8uEElVZ+RWDso7K+mKyrg5ImTjWC4bfbA+5dHsuV5FwzG/OndUFZrg3LoAvHEk0rc
         Xm2SLy3f3ZkczRLjIKXd9Jlvl+W4BpctqfJasxH4P+hSGKH7uqBx47x+9eLmxVzd1GL6
         vaWvh9yR83URcNWS7LJvlf2wjMQ+8LmJYXcBJTafIRr8fAmYLTA353BHN7MCRVLOk10n
         TfWSa/buW+6+1ENJFdkMlQZ0Wr/+144FMcSIyMKUh5eEUz+ASxp2Gm/ASPKAYkJ3nv3L
         KLZR14HkPxDZh//YikVRpoKoOJlp3YwA8so72IjF9qlicEf2YsKwicky0vJ81jufKMvX
         q+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0xlECQJubyU6ky+lY7ASxMVx2V1IPX2mpT9Gl6XJvMo=;
        b=SttMa8kWOFrupncE4Q+LEnWE39gNER9txWTQkl0hCb7UIO483qnFPxaSWfjWhJzy4i
         fHOBIh0IAe7/6BYsXNsTOQmOUizhA90rPH4i6kbCRhek99SZNZf8xOZDYwmhekkdnOns
         6lzhEbd4Ay9Uc6vRhuq24gCUSGVRM11tBVlNuALWSinSva/tOV4Fy664IyUaenXzf8uY
         mlIrzpaPXc5Yq5FPxDFhSlsBbqQdiwz2ebsVCxzDyCTV/E3ekImqmPt4cPVGhqHP9PbL
         0jwgOHAwhDNcRab/FtwW43n7AJOLgVmUHlKuddtrIv6tuiTgFoDmaP26kWAhgHrijwQS
         0Agg==
X-Gm-Message-State: AOAM5324ftJrL8t21ZmsYBo/MjPj6uXopluvLmQ94pD1A9NUBfUE5Iej
	4hnVi2lpQ5nV76zjtU0C4p/12LM+ujDvmw==
X-Google-Smtp-Source: ABdhPJyB+IBZOXHL6gcQWGjuFRYFlx3vjyym/ZhPwLr1hGRFcAWvWz9MNQU25IknVOoXKpc45xxBSQ==
X-Received: by 2002:a65:5c47:: with SMTP id v7mr27737496pgr.409.1608009533160;
        Mon, 14 Dec 2020 21:18:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8805:68fc:996d:3100? ([2601:646:9200:4e0:8805:68fc:996d:3100])
        by smtp.gmail.com with ESMTPSA id p15sm21816786pgl.19.2020.12.14.21.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 21:18:52 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <20201214225851.yqscuyms4pwihtfy@apollo.localdomain>
 <CAP9ODKqt6mQeckiFPhTrO8b1kZvbPOWE-S27pQp5PNj09EOviQ@mail.gmail.com>
 <CAMKF1srVeApTW9Ym7-qrmTpSyttY8BG7LofAhMTBX02M4EG_dg@mail.gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] Strange segfault on native Go binaries
Message-ID: <04ea4495-feba-652d-9b15-d09e23c7bc03@gmail.com>
Date: Mon, 14 Dec 2020 21:18:51 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srVeApTW9Ym7-qrmTpSyttY8BG7LofAhMTBX02M4EG_dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 12/14/20 4:12 PM, Khem Raj wrote:
> On Mon, Dec 14, 2020 at 3:50 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Em seg., 14 de dez. de 2020 às 19:59, Khem Raj <raj.khem@gmail.com> escreveu:
>>> On Sat, Dec 12, 2020 at 08:52:34PM -0300, Otavio Salvador wrote:
>>>> Hello all,
>>>>
>>>> I am trying to debug a strange issue on native Go binaries. We're
>>>> seeing it on 'glide' for example.
>>>>
>>>> If I build 'glide-native' and I go to its tmp/work/.../image/bin/glide
>>>> it works just fine. For example, running it we see the expected error
>>>> as I am running inside a clean environment without any extra tools:
>>>>
>>>> otavio@yocto-env ~/.../build %
>>>> ./tmp/work/x86_64-linux/glide-native/0.13.3-r0/build/bin/glide
>>>> [ERROR] Error getting version: exec: "go": executable file not found in $PATH.
>>>>
>>>> Now, if we run it from the sysroot-native, it segfaults:
>>>>
>>>> otavio@yocto-env ~/.../build %
>>>> ./tmp/work/cortexa9hf-neon-oel-linux-gnueabi/updatehub/1.1.1-r0/recipe-sysroot-native/usr/bin/glide
>>>> [1]    26085 segmentation fault (core dumped)
>>>>
>>>> And this segfault is also happening inside the build. I ran the
>>>> readelf on them and it seems to have been modified to use the
>>>> uninative libc loader but I am in doubt how if this is the culprit.
>>>> Can someone shed any light on this?
>>>>
>>>
>>> It looks like a known regression in 1.15.5
>>>
>>> There was a linker regression which crept into go compiler in 1.15.5
>>> which was immediately patched and we also backported that to OE-core
>>> however, recently we have switched to using go-binary-native to
>>> bootstrap the toolchain which means the bug was still not plugged in the
>>> native version even though we patched our go versions, we cant help the
>>> prebuilts.
>>>
>>> Luckily we now have .6 release which came out last week, which means we
>>> can upgrade to it and that should take care of the segfault, I have
>>> improvised on the patch which was sent for upgrades and sent a v2 [1]
>>>
>>> Please try it out and let me know.
>>>
>>> [1] https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_go_update_1_15_5/78964072?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,78964072
>>
>> I tried it but it did not solve the problem. The behavior is the same
>> for this specific issue. The cgo issue documented was indeed fixed but
>> the relocation one is still happening :(
> 
> The issue seems to be in stripped glide binary in sysroot but normal
> unstripped binary is ok. So the issue is indeed orthogonal. I am
> looking into what changes during strip
> step here
> 

The problem seems to obscure editing of the glide binary which is 
resulting in a single byte in ELF header being modified between 
do_install and do_populate_sysroot

easy reproducer is

bitbake -cinstall glide-native

then make a copy of glide installed in image/ dir ( where do_install 
puts it ) then run

bitbake -cpopulate_sysroot glide-native

% cmp 
../../image/mnt/b/yoe/master/build/tmp/work/x86_64-linux/glide-native/0.13.3-r0/recipe-sysroot-native/usr/bin/glide 
glide

so they are identical.

and now compare the installed binary and the saved copy.

% cmp 
../../image/mnt/b/yoe/master/build/tmp/work/x86_64-linux/glide-native/0.13.3-r0/recipe-sysroot-native/usr/bin/glide 
glide
../../image/mnt/b/yoe/master/build/tmp/work/x86_64-linux/glide-native/0.13.3-r0/recipe-sysroot-native/usr/bin/glide 
glide differ: byte 57, line 1

it seems installed binary is fine until do_install but then gets edited 
during populate_sysroot

I have shunted many functions, including patchelf operations and the 
binary still gets modified in place

I wonder what other operations could be put under scanner here, Let me 
know if anyone has ideas..



>>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
