Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB94C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:51:57 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.2214.1665431515779467164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NwWS6cC8;
 spf=pass (domain: mvista.com, ip: 209.85.219.53,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qv1-f53.google.com with SMTP id i12so7739090qvs.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/s4AjLnJZivr6QmMzhXIZfoGy9mQaXvCOglwJriqpPw=;
        b=NwWS6cC8bW5KYuc1N4aMVn7O37v2jZLHZK0aHAqDyoOghYa1GmedaL072YGMTPAEuu
         HBJQOihg4U5nwNqW+jnsUlw4M9Wh3c5f17g2pO9Z1NJkw8zcv7toNHuU+rmTQ1jPpPTg
         AEg2jidW0gdIMr+tKW2w42l5R90LbxbMUEtXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/s4AjLnJZivr6QmMzhXIZfoGy9mQaXvCOglwJriqpPw=;
        b=549qZ4AoPt1rlBcV7xms9FfAFIiAdEFot7FQorel+fLIEfFezwCqwD3aG4W065eIs9
         +L2Y12pCCpAZRpW2jL3In1+u0CUArqWTPk3gII8C5ezirEYf2HGrF6HBboWucW4FSeGJ
         S3qKEGIagWWTd33mTM2EkcIq/04RGjoGgZ6wvmq0TZKDVUBqmhHF5Bfovmr4oGe5r7FE
         MkKFzWLceuwF/oAgqp58ClMKKZ6Y+Bg2lSCRNDH85Q2f6dbMBl8wWq6jgl05cx9m/wPu
         4709/XTZNKJIsrrcEt8JayHC7c3s6woE3iACo8HmuWljr2Jj7Am78w5F+iBZn76x4+fL
         VHag==
X-Gm-Message-State: ACrzQf2U0y9oGlRfAaVq07BbkNbfXtcwMoEMm01QBKSlK62L5tvFsc15
	0Q2/dw/SYqZkvycoxI5GkMwi1A==
X-Google-Smtp-Source: 
 AMsMyM5iCLfgFrX9aH/JDKPHoi1/wIZc0MF50uaNYXJgB9oFeyj/vCbM9ee6dAaq8gNDP3w1Y0KvlA==
X-Received: by 2002:a05:6214:21ab:b0:4b4:6dc:b94e with SMTP id
 t11-20020a05621421ab00b004b406dcb94emr5087853qvc.107.1665431514736;
        Mon, 10 Oct 2022 12:51:54 -0700 (PDT)
Received: from [192.168.1.33] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05620a298400b006b5c061844fsm11296375qkp.49.2022.10.10.12.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 12:51:54 -0700 (PDT)
Message-ID: <5b09a369-320f-d7ca-022d-ac7675c4264c@mvista.com>
Date: Mon, 10 Oct 2022 12:51:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [OE-core] [master|langdale|kirkstone][PATCH] qemu-native: Add
 PACKAGECONFIG option for jack
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221010192655.3930156-1-jpuhlman@mvista.com>
 <CAMKF1sqgAyRiZiYd2Y+fbQrArgLVZnT8HGx3J0sddOE=O7TamA@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: 
 <CAMKF1sqgAyRiZiYd2Y+fbQrArgLVZnT8HGx3J0sddOE=O7TamA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 19:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171582



On 10/10/2022 12:39 PM, Khem Raj wrote:
> On Mon, Oct 10, 2022 at 12:27 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> Source: MontaVista Software, LLC
>> MR: 122826
>> Type: Defect Fix
>> Disposition:  Needs submitting to poky
> Above seems out of context, since you are submitting it upstream here.
Well it was cherry picked from a bug in our system, and was pushing it 
to upstream, I can change it to something else.
>
>> ChangeID: ecf4ddeb82db6fbb5c6c803e5e80c333587b9c9c
>> Description:
>>
>> With libjack-devel or jack-audio-connection-kit-devel, qemu-native
>> detects the library/header and tries to build with it. Since its
>> missing from the sysroot, it fails to build.
>>
>>   -O2 -fPIE -D_REENTRANT -Wno-undef -MD -MQ libcommon.fa.p/audio_jackaudio.c.o
>> -MF libcommon.fa.p/audio_jackaudio.c.o.d -o libcommon.fa.p/audio_jackaudio.c.o
>> -c ../qemu-6.2.0/audio/jackaudio.c
>> | ../qemu-6.2.0/audio/jackaudio.c:34:10: fatal error: jack/jack.h: No such file
>> or directory
>> |    34 | #include <jack/jack.h>
>> |       |          ^~~~~~~~~~~~~
>> | compilation terminated.
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 612abd240a..711982ba8d 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -198,6 +198,7 @@ PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
>>   PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
>>   PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
>>   PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>> +PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>>
>>   INSANE_SKIP:${PN} = "arch"
>>
>> --
>> 2.35.4
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171580): https://lists.openembedded.org/g/openembedded-core/message/171580
>> Mute This Topic: https://lists.openembedded.org/mt/94244017/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


