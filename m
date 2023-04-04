Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A635AC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 08:31:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.96311.1680597079719309723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 01:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WCci0oit;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id fi11so3835379edb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680597078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBaN4X+zDilgBTveis1vdXlVYfD6lfYCrAB+ur1cv2M=;
        b=WCci0oitWJXCGatIKzg9q7jAznrx9T9G0gBrL5Mn/YOx4MvqzVCYmgRtG92v9m2LC0
         2syKu9K4V8hm81B6FxcHkVl/ju7IcKLXnQ26H52izyE1kejVNEXMkgafREGoIp5h/TOn
         A2ux52AWlfIP+ywO+5cVDhibHgEmaIJ9y3aTcCB+ZGS4V9/rUa5+Hw7lsYL6Q9Bs+etU
         A10aDsec4qNrej6bIatUZMfAD26Fs24QMqhhSs6LX6L9lCwn69CxhtrAgnG59wEtRB5Y
         9qIckiW+TMOrZJFqT3aOxINI6WW9YpiyQz/4DRL0HGLkKZIcT/6n6FLPzbQ6LM2sNMbj
         zRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680597078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBaN4X+zDilgBTveis1vdXlVYfD6lfYCrAB+ur1cv2M=;
        b=EkUUKBsO8pSgEt5xPGv1AyOzk3uKilT0UPMIcZH6oOO+8PPBkKw/NSXGI8RwD5We+o
         dVzaH5eUpUk5Xyn7NGTIUyI9E6FgTSh0z6ezgG2pCuRy9Oq6pFrxz4V7JycGNu1Mv8VV
         X2sDdMs6Enio4JvCA1Y75IWzcVtkLLx5fhLvVmkdc5wcUJFR6W0UAdqD27NnzTFI2Vi/
         qKnbxlk8q2Gr2Z8WCLuRNNcXvPOa5vHAUS3QuZZljaJOX10L2lQCr3yuxdu4lRZDxgdR
         jxPeRXap+/V+g1yYH9YigmEwOEO+B6hWa/1g541F1ebm4DxEgAfW8o/XY1SX7Jm9f+u7
         hwTQ==
X-Gm-Message-State: AAQBX9fygopqswCTBNkzYO7Ukpq+uW7B+FrRP6j0WUVHl52jPPwxLz/X
	06q+G/5Ixbvp5/YpaL968gk=
X-Google-Smtp-Source: AKy350bWrHTVSuKfLWeTWokDIU1d/MS/7/hv8IoxWfmsbLsjRaDPIbfwdPFYymnhkeSD1eMZmmahVg==
X-Received: by 2002:a17:906:859:b0:8b1:7e23:5041 with SMTP id f25-20020a170906085900b008b17e235041mr1434470ejd.39.1680597078066;
        Tue, 04 Apr 2023 01:31:18 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906541400b009442efdaf20sm5668134ejo.156.2023.04.04.01.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 01:31:17 -0700 (PDT)
Message-ID: <a465afbf-b085-b02d-b0a8-3cc9b4f7f9ee@gmail.com>
Date: Tue, 4 Apr 2023 10:31:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
 <1751778F66ADC2DD.27612@lists.openembedded.org>
 <27b6f2b6-5e7f-8be6-32fc-2aa7cbd1402f@gmail.com>
 <3ADE60F3-FF7C-4022-AB82-9D992AAD1405@arm.com>
 <6f3a27c7-a8be-4430-b66f-a0d2c53ddf7f@gmail.com>
 <3C4EAC0F-C717-4FFC-9885-808BAB334616@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <3C4EAC0F-C717-4FFC-9885-808BAB334616@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179675

2023. 04. 03. 21:52 keltezéssel, Ross Burton írta:
>
>> On 3 Apr 2023, at 14:00, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>
>> 2023. 04. 03. 12:59 keltezéssel, Ross Burton írta:
>>> On 31 Mar 2023, at 10:46, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>> Regarding my attempts to fix this: I have looked into
>>>> making these executables use "native: true" but it
>>>> would need duplicating all the driver and library targets
>>>> with "native: true", too, and it seemed to be too intrusive.
>>>> Also, it doesn't eliminate the native dependency chain,
>>>> building these executables would still need systemd-native,
>>>> libgudev-native and libgusb-native.
>>> I’d say this is still the correct solution, although the ‘native’ libfprint would be as lean as possible and not the entire library.
>> Hopefully someone can solve this bug soon:
>> https://github.com/mesonbuild/meson/issues/11029
>> FWIW, I commented about the problem but the meson
>> codebase is over my head so I can't fix it.
>>
>> Then libfrint (and probably other meson bases recipes
>> in Yocto) won't need a native part.
> FWIW I just took a stripped down copy of your libfprint recipe and it happily built using qemu’s exe wrapper in oe-core master.

After a fresh "repo sync" my libfprint build still fails with the
stripped down copy that doesn't want the native dependency.

Please share the changes of yours against the libfprint recipe
because clearly I am doing something wrong which is not
obvious to me.

Or there is something subtle going on. For example, does
this stripped down copy of the libfprint recipe still build
for you if meta-clang is also used?

> So, yes, it would be good if the build used native instead of relying on qemu, but it’s not a hard blocker.  We should definitely be doing AB runs of poky with the exe wrapper disabled to exercise those codepaths.
>
> Ross


