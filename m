Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.870.1607983777968547388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 14:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g2XUV20K;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id bj5so9684082plb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GeOlGElK5sH3gWt1XleL3KiUnH9svU+7nPvuNhAVJMA=;
        b=g2XUV20K0M7UFKKpvFLUGKbK5SeJ1OkZXdbHao0LGnlqaRgf2/zsnV7iGQrBnnJs7Y
         MmZhpjB0SihlUdKKlZ2duSB4cUF4oA2WkXeHR/Wuoz+FZiw9/ZJGnJe3HLxXnBscvl76
         TSYGSdijoxV+e5edtb/UvTqGSXoCT85Hjqf6x9fEqKhFxZbw2wQFeIJqtAFQiKToyFBN
         V36HgHThUn4xy1FqVCryRxS/yIi1jmecBqXw9XaPK4oRjnroNerjdaqx3hn8x0BtpT7F
         0zMwQpG/iMxoe1bJ/KfeJSMxWUrbMzTId14oNfOhTb1zAjurugReOuh0hLUF0oAJsmY3
         9H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GeOlGElK5sH3gWt1XleL3KiUnH9svU+7nPvuNhAVJMA=;
        b=ODdnpe7k5N6f7Z1+xXRkOAWnRC/YWYzafq4CA4Vhq9dwQ1gTRp5AN/WPWIyDpqb1jP
         6HUcL1NqhhmMjjKYxOQKr1vap3MbWjHU1SiCM187+ma6dFZPAIm8kMFOm7iP4ZMV0iL5
         osyfpsFNEzgqZ/stYTV0jtNwDNahfd2zQioNCoN3TZqGtLOcV0BWWRif0VHp65zU7giI
         HHAEnkw5thS0p2P8QyB/jI6Gal1Mziu85EAtDixXeeCmMO12ztLRJIgq7FOC0THOnHn6
         +XT4xQll3r26e/7Gm7c0ICUW1pZiXn4n9lkdDniI7poWtHhiTxMutEUhUF12IiMTgiFS
         GG4Q==
X-Gm-Message-State: AOAM530Cv1rDI1RvUYVWkVLgACVxHqQZ7JAD8MUIBBdDNPugUpvye04H
	vON/Zf3DsMpYS6d6FbQ40j/zWraSFP1u6Q==
X-Google-Smtp-Source: ABdhPJzSIC1E6uSrlA9Q3UDHTwxL30f3DeJ2Gs/Xmh0IPCPlalhvkPhud5VYv/V2abqcPuEAyFWTBA==
X-Received: by 2002:a17:90a:8c8b:: with SMTP id b11mr23424806pjo.54.1607983776817;
        Mon, 14 Dec 2020 14:09:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8805:68fc:996d:3100? ([2601:646:9200:4e0:8805:68fc:996d:3100])
        by smtp.gmail.com with ESMTPSA id y129sm20851578pfb.3.2020.12.14.14.09.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 14:09:36 -0800 (PST)
Subject: Re: [OE-core] [SDK] How to use the gold linker
To: openembedded-core@lists.openembedded.org
References: <5776519.IOBmFsySL6@n95hx1g2>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <942f87d1-4b9d-1b7b-7fcb-9714543f3107@gmail.com>
Date: Mon, 14 Dec 2020 14:09:35 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5776519.IOBmFsySL6@n95hx1g2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 12/14/20 3:14 AM, Christian Eggers wrote:
> Branch: dunfell
> Arch: arm
> 
> When I set -fuse-ld=gold with the Yocto SDK, the bfd linker is used anyway:
> 
>> . /opt/poky-tiny/3.1.4/environment-setup-cortexa7t2hf-neon-vfpv4-poky-linux-musleabi
>> ${CC} -fuse-ld=gold -Wl,--threads -o test test.c
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/real-ld: unrecognized option '--threads'
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/real-ld: use the --help option for usage information
> 
> When I call the "real-ld" with -h, I can see that it's the BFD linker.
> 
>> ${CC} -print-prog-name=ld
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld
> 
>> ${CC} -fuse-ld=bfd -print-prog-name=ld
> ld.bfd
> 
>> ${CC} -fuse-ld=gold -print-prog-name=ld
> ld.gold
> 
> Compared to other cross toolchains I use, the output of the previous two commands
> miss the full path to the linker. The gold linker is part of my SDK:
> 
>> arm-poky-linux-musleabi-ld.gold --help
> Usage: arm-poky-linux-musleabi-ld.gold [options] file...
> Options:
>    --help                      Report usage information
> ...
> 
> How can I use the gold linker from gcc (without making it default)?
> 

This is kind of known and kind of works as intended, see
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc-cross-canadian.inc#n132

You might want to try commenting it out and see if it works for you in 
resulting SDK
> regards
> Christian
> 
> 
> 
> ________________________________
>   [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1.jpg] <https://microsites.arri.com/stellar/>
> 
> Get all the latest information from www.arri.com<https://www.arri.com/>, Facebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRIChannel>, Instagram<https://instagram.com/arri> and YouTube<https://www.youtube.com/user/ARRIChannel>.
> 
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Sitz: München - Registergericht: Amtsgericht München - Handelsregisternummer: HRA 57918
> Persönlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
> Sitz: München - Registergericht: Amtsgericht München - Handelsregisternummer: HRB 54477
> Geschäftsführer: Dr. Michael Neuhäuser; Stephan Schenk; Walter Trauninger; Markus Zeiler
> 
> 
> 
> 
> 
