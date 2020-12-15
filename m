Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.591.1608052554852946748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 09:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UXbvYPXI;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id f17so15657150pge.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3/EtaDwnYTpeXQ8ySq8KijdBEreXAC4wYluqqoEcPXE=;
        b=UXbvYPXIgmP+zV0ZGIx7LioNbZxziEyEapa2FsuehvH/v/Oi8Ii8h9EA+RWXF1ZW9J
         WlXS0v0DYm5UM4jPGgpzd5clCtkhyJbBbHS2aUdLKofNw/wcg04ixEOLV1hAt/GAyUv5
         O2Scm6eBmE5W9P/xxxyLSiE2V6nMYxqV6YcdFfAmm3D9qVb+61QbMGuiSQplWrXCsG8z
         shrV2kx8BV9a8vvZZPyckqxzFY3qNeGQd1m8iLpljGiq96nkN2+L4/z+ShcFz19hpqIu
         KURHririRCNqEfRIo8P2yIypqFAQej+gNsPkOKdsK7FohPzibbPIOV4SGcIj9Luay67C
         b5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3/EtaDwnYTpeXQ8ySq8KijdBEreXAC4wYluqqoEcPXE=;
        b=WZz46XJyT22ZQ+YLfmCjmRVyJo/s4lgLbsR/gYgMe0lYA7tTq41dFRbN3slOfNAVS2
         JirYJxpGKd9ZKE5FGS7W3iT7eqQxMrNQMxZL75K2pV+H2Cjo5XKKOxppwUjYh5HUdQ5g
         9SfuulC9gaOvgqKwkUi99BKvtT+tzczKqLcsNfom77z1EcDJpG5m0ON1mP1zJWDHVdgp
         qLnZ+gJq/5VLFXVjTG+j4ndoMfHC+gaZ9XBhwEFXA59k/MdXSue9qWKeVDcsTQVhP1gr
         DWGS4Go0t1SQAotHqRs4tgwypRyrMl+wRNi2ya1JTKxMG9aQd22W2gBhytu4pQOSalv7
         7o4A==
X-Gm-Message-State: AOAM530aM3TL3k1nZMAt7b7AM+qPNkb4BY0Y6KZXvroHjkuQ05bPv40H
	GzIRHoTcYJ+1vAC45ba1x8RZdoRhIX2ZFw==
X-Google-Smtp-Source: ABdhPJwPpNEUUm4dhFT5TKV0pMPCZBICFcWJGldNIffjKK9dfrRcbY3YfUtB8M1E7Fa29s4WwbcmtA==
X-Received: by 2002:a63:794:: with SMTP id 142mr3333096pgh.187.1608052554026;
        Tue, 15 Dec 2020 09:15:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::64a3? ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id gp17sm22307959pjb.0.2020.12.15.09.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 09:15:53 -0800 (PST)
Subject: Re: [OE-core] [SDK] How to use the gold linker
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <5776519.IOBmFsySL6@n95hx1g2>
 <942f87d1-4b9d-1b7b-7fcb-9714543f3107@gmail.com>
 <CABcZAN=QdWzV=LObrdHMWfcDx_1VV3Ce-i_nYL3H7WYUcCtSSA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <074c7da4-c8d0-680d-d33d-476dcc51c5b7@gmail.com>
Date: Tue, 15 Dec 2020 09:15:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CABcZAN=QdWzV=LObrdHMWfcDx_1VV3Ce-i_nYL3H7WYUcCtSSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/15/20 8:50 AM, Christopher Larson wrote:
> This can be fixed via two changes, first removing real-ld, then adding 
> the missing links to fix -fuse-ld=. I have this in one of my 
> not-yet-submitted bbappends:
> 
>      # Remove real-ld, as it prevents checking for ld or gold in the 
> search path
>      rm -f ${dest}real-ld$suffix
>      # Then add links to fix builds with -fuse-ld=
>      ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld.gold$suffix 
> ${dest}ld.gold$suffix
>      ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld.bfd$suffix ${dest}ld.bfd$suffix
> 

right this looks ok. Can you submit this for upstreaming please

> On Mon, Dec 14, 2020 at 3:09 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 12/14/20 3:14 AM, Christian Eggers wrote:
>      > Branch: dunfell
>      > Arch: arm
>      >
>      > When I set -fuse-ld=gold with the Yocto SDK, the bfd linker is
>     used anyway:
>      >
>      >> .
>     /opt/poky-tiny/3.1.4/environment-setup-cortexa7t2hf-neon-vfpv4-poky-linux-musleabi
>      >> ${CC} -fuse-ld=gold -Wl,--threads -o test test.c
>      >
>     /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/real-ld:
>     unrecognized option '--threads'
>      >
>     /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/real-ld:
>     use the --help option for usage information
>      >
>      > When I call the "real-ld" with -h, I can see that it's the BFD
>     linker.
>      >
>      >> ${CC} -print-prog-name=ld
>      >
>     /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld
>      >
>      >> ${CC} -fuse-ld=bfd -print-prog-name=ld
>      > ld.bfd
>      >
>      >> ${CC} -fuse-ld=gold -print-prog-name=ld
>      > ld.gold
>      >
>      > Compared to other cross toolchains I use, the output of the
>     previous two commands
>      > miss the full path to the linker. The gold linker is part of my SDK:
>      >
>      >> arm-poky-linux-musleabi-ld.gold --help
>      > Usage: arm-poky-linux-musleabi-ld.gold [options] file...
>      > Options:
>      >    --help                      Report usage information
>      > ...
>      >
>      > How can I use the gold linker from gcc (without making it default)?
>      >
> 
>     This is kind of known and kind of works as intended, see
>     https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc-cross-canadian.inc#n132
>     <https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc-cross-canadian.inc#n132>
> 
>     You might want to try commenting it out and see if it works for you in
>     resulting SDK
>      > regards
>      > Christian
>      >
>      >
>      >
>      > ________________________________
>      > 
>       [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1.jpg <http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1.jpg>] <https://microsites.arri.com/stellar/ <https://microsites.arri.com/stellar/>>
>      >
>      > Get all the latest information from www.arri.com
>     <http://www.arri.com><https://www.arri.com/
>     <https://www.arri.com/>>, Facebook<https://www.facebook.com/TeamARRI
>     <https://www.facebook.com/TeamARRI>>,
>     Twitter<https://twitter.com/ARRIChannel
>     <https://twitter.com/ARRIChannel>>,
>     Instagram<https://instagram.com/arri <https://instagram.com/arri>>
>     and YouTube<https://www.youtube.com/user/ARRIChannel
>     <https://www.youtube.com/user/ARRIChannel>>.
>      >
>      > Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
>      > Sitz: München - Registergericht: Amtsgericht München -
>     Handelsregisternummer: HRA 57918
>      > Persönlich haftender Gesellschafter: Arnold & Richter Cine
>     Technik GmbH
>      > Sitz: München - Registergericht: Amtsgericht München -
>     Handelsregisternummer: HRB 54477
>      > Geschäftsführer: Dr. Michael Neuhäuser; Stephan Schenk; Walter
>     Trauninger; Markus Zeiler
>      >
>      >
>      >
>      >
>      >
> 
>     
> 
> 
> 
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
