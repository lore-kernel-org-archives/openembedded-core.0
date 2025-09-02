Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFFBCA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 09:40:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.73128.1756806044313541388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 02:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3Gu2H39;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b042cc3953cso226439866b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756806043; x=1757410843; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xj0hFePn9+A+pzawSuB9jza0dzOI6zO/NTpBktz1q78=;
        b=X3Gu2H39g0hTE/3V0Ht5KlSibinp4xcOnNurIW3fc3ilvBBx2YbpSqXPxABwoTHZQu
         Fdp7WSi3QVvuhg4ovTioWWBDiIlejYpzVwTOZx/t4IBFeG2JUqrl35u9lh4EQQquKTlR
         ROU7/NSIZv/hQ3yOAUUKYZl/50NuMx5FlVcQ6wwu9h0qsaYp25hYTRVGbo9xDIcGcffi
         uFARcQ3y/6gwxp0A4dg8XXIhnC5C3ll/mB4EJzwVCj+tXvg/0fP69Q3unBMsM3CYv+EI
         Jorhfd/Z0cA207Tef9uHNhIZ33Vwx2YAxLndcp4ShHssrgkWCdmPYd+LviIV/W2mobcd
         HZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806043; x=1757410843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xj0hFePn9+A+pzawSuB9jza0dzOI6zO/NTpBktz1q78=;
        b=iX8QYbx8Tdc0PRHvLxEAwhoteRwT+oZyY9H/O/7w80dtdFfiU7H0G93ECSNODIRpPd
         6xGxhLMGg+EErmINoFZOVshzGN20KLmhfbN1FRDr5KJPm0k7CbVu6kuqmgWG1ub6T4qn
         Tih71pyW+MU7aLc0Aq9uhVi2QTKOjqtSjCwTX7MXk7l2FVRf4bEHaYSlyr8gZqwbd5CS
         yxuk10U2431DNSyMoOZyFkK4uQTz+JG7IL5EZHLolg2GdtOKtU4BY8YEpjAVtWd8IP1J
         zBeTESLg3sRSIHq65GYPQQZTYl/O4K/Ay22VRBDVcNQ/5Zpj6b8ZDjOn+d4qZ5zEtXUh
         /pDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjz75y96y1CGRrANOxcW5/sJNSXxrc/8eTiZIfxhrSL1XdlvJomc6z+3M8569WRYjw5biPt8MHQvRquHbOTeHzLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxxqsT5m8owSxS5ZfTk0tIgUMI3tJVoRWnZbJyka02VZVOYKF4
	6CusMcpuFwsQqt5vFtibQCim7gKf3FQdHR3Ii2SLQQOZSVSAh3AUodxa
X-Gm-Gg: ASbGncu6G5DySmbVCnRszx4WMmOYp121v6WyczsU6SHil79CpUkNX1hke5pww+pqHKM
	eocDEa+KQUmJ2V4wonl3gp97Wmhg3lOuVmUBBrjTxU9j4zMQpF2yQ418AWJvzjp+o0p6snV+flS
	+i9wmC3gGNzAnkN2338Jmc2SUWids0nVin9kyYy9qi7ioQyGtwvEJS/EJ82F+nIaf5+1/c8OzoT
	QoA6LsyDsxvh0hOkt4g8tf2S48cGcw2GIYt33Qj1Ruf/ToVBOs/+0QfDbBcDnbql+2hhHF+WJhp
	GaQ31XNktfTPCG7KzZX7IeqQfLa9sUlUwGNoi5gamSjx3vpYRQ1XnSlx9nO958l4TWiMAe54KVa
	Nvrpwezu4YhCSJu4Vx8cA67arDihY5/k=
X-Google-Smtp-Source: AGHT+IFiqb9Wkes7chCPLP/obUXF8FUi55BA6LZAOn3cGT3aaPHPy02hrYexST5Iwmo/EfSnUgdOFA==
X-Received: by 2002:a17:907:3e84:b0:afe:b818:a6bc with SMTP id a640c23a62f3a-b01f20ca2a4mr1029641566b.56.1756806042339;
        Tue, 02 Sep 2025 02:40:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff054b7fffsm1033925466b.0.2025.09.02.02.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:40:41 -0700 (PDT)
Message-ID: <e94aaf59-3aa0-4346-8e76-5bda6efcbbcf@gmail.com>
Date: Tue, 2 Sep 2025 11:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <1860A6DF185EFE18.24627@lists.openembedded.org>
 <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
 <DCHBGQL11HQA.3CX7LVLO254VT@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DCHBGQL11HQA.3CX7LVLO254VT@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 09:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222720



On 9/1/25 10:21, Mathieu Dubois-Briand wrote:
> On Sat Aug 30, 2025 at 10:58 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> On 8/30/25 22:55, Gyorgy Sarvari via lists.openembedded.org wrote:
>> In principle I think that it's about as I can make it on my own (sans AB
>> failures[1]), but there would be a few question marks on my end:
>>
>> 1. If you have a better idea for relevant Makefile.in.in heurestics in
>> autotools.bbclass, I'm listening
>> 2. I *think* that the Makevars concatenation makes actual sense, and the
>> build success is not only an accident - but I'm not 100% sure if that's
>> the best way to handle this. If you know gettext, I'd like to hear your
>> opinion. (This was inspired by gettextize's behavior. Upon running it,
>> it copies the Makevars.template with default values in the po folder,
>> and asks you to set up all the variables from it in your Makevars file)
>>
>> [1]: I did build recipes and multiple images successfully, but not
>> "bitbake world" on multiple configs
> Hi Gyorgy,
>
> I took a bit of time to launch a build on the autobuilder. It looks like
> this is breaking build of several components: glib, e2fsprogs, iso-codes
> and so on. I saw two types of errors so far:
> - undefined symbol: getfilecon
> - missing files: t-ca.gmo, t-bg.gmo... I'm not sure where this comes
>   from.
>
> ERROR: glib-2.0-initial-1_2.84.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/glib-2.0-initial/2.84.4/temp/run.do_compile.3022462' failed with exit code 127
> ...
> | /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/glib-2.0-initial/2.84.4/recipe-sysroot-native/usr/bin/msgfmt: symbol lookup error: /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/glib-2.0-initial/2.84.4/recipe-sysroot-native/usr/bin/../lib/libgettextlib-0.26.so: undefined symbol: getfilecon
>
> ERROR: e2fsprogs-1.47.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/e2fsprogs/1.47.3/temp/run.do_compile.3185668' failed with exit code 1
> ...
> | mv: cannot stat 't-ca.gmo': No such file or directory
>
> ERROR: iso-codes-4.18.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/all-poky-linux/iso-codes/4.18.0/temp/run.do_compile.3458421' failed with exit code 1
> ...
> | /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/all-poky-linux/iso-codes/4.18.0/recipe-sysroot-native/usr/bin/msgfmt: symbol lookup error: /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/all-poky-linux/iso-codes/4.18.0/recipe-sysroot-native/usr/bin/../lib/libgettextlib-0.26.so: undefined symbol: getfilecon
>
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/psmisc/23.7/temp/log.do_compile.3498395
> ...
> | mv: cannot stat 't-bg.gmo': No such file or directory
>
> You can get all logs here:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2220
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2285
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2330
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2308
>
> We can have more failure logs in all a-full subbuilders, but they all
> look the same as far as I can see.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2299

Thanks for taking it for a spin.

This is just a keep-alive ping from my end for now.
It is not being ignored, but reproduction is doesn't seem to be
straightforward - will report back.

> Thanks,
> Mathieu
>


