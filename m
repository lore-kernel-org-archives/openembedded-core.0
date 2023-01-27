Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F400C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:48:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.102131.1674827280652384424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=3vRbetFo;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso3495267wmq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 05:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lb1pj2p94Lfr4/zdYGaAwJtT4ZaKtYBFUooP+tvvWaM=;
        b=3vRbetFof7ETXDELC3TYgarkbp3lBzv5rHltPGuumHGCzri6qRTAYyBuFg/CLGWrm8
         20pWXDmfxKxE4jdDLD3bvs6e5t0s/MpF2zGquTDK054bAzNU4feSc1/+SEQ/N6nrBlZ7
         NH/HlVjr1v/wXe2/suK7zr/ysUOk+7z1NrAxhMv6PjOPmfo+WIHlUGdvt1UxoMD4pJw0
         YEK4wXbBplMH+TEz55i1i9g5ODcRAA3GOWwLSqh6ftUgXwRsVE22dZAu5KXcPQEGDj1X
         wJBq+nGrAHZCpOGru0AuTaLoQa2jreLV6Rmst4yI1BRanbrwJ/03XspbaR9Pm965220P
         Nd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb1pj2p94Lfr4/zdYGaAwJtT4ZaKtYBFUooP+tvvWaM=;
        b=Evc/pnGlgyQqos4RXK2PitUUJgssHxIrpnWWhnLxMhHmY9gSBFBJU53SIfTQHn7GMu
         k44HK3+3KLhKkRmnnHrY6znhmP0wz0ieiwk5U4oV4v1B74bHqJ5IkdNrZK4S6EdpAQgb
         eIarQq4/y/TkLKs4W+nMricEzZL1dLNKzfWGn+KdzOksAgVX0nA+BYVF1oRoVdctDEN9
         ZJVYhqdICs1905spi8vU3Itc3iSWv/RXZm/0sIct3CAPXrqIgBUDw8f0e6gsHsznk/13
         rBwbwbK/9L1MFj3u8wSrCZKOOxOv61d1OwDRMlUiC6Jzkb0Tbsbrg8X0TB06lpCsU8nX
         uHkQ==
X-Gm-Message-State: AFqh2kpodPflWUYYLHE9aRNfp7tyKbCCAbrBRM6rXCmsMBBSlMhu0luz
	JK1o4oNg15bypV0x3OYtRveN+Q==
X-Google-Smtp-Source: AMrXdXs+7aRl35tNONma81EohbgFHK+Ubzh7rGgVzza2mO8lHivYCgceCRMFBhO6TSZCLmpPjgwyeQ==
X-Received: by 2002:a05:600c:3b1b:b0:3da:11d7:dba3 with SMTP id m27-20020a05600c3b1b00b003da11d7dba3mr38414160wms.5.1674827278943;
        Fri, 27 Jan 2023 05:47:58 -0800 (PST)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b003dc35944b2esm1996751wmf.27.2023.01.27.05.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:47:58 -0800 (PST)
Message-ID: <b8f54a56-9cd2-01bd-2210-a5c361a7ae49@baylibre.com>
Date: Fri, 27 Jan 2023 14:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core] [PATCH] oeqa/selftest/locales: Create selftest for
 locales generation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230125083127.53988-1-lrannou@baylibre.com>
 <f39b351e96ff00039f526290e7ff68c7fa3c7271.camel@linuxfoundation.org>
 <4479c710-1384-dd7b-ad6b-be756025e3bb@baylibre.com>
 <de1cd98004d72f55e48fb4185bc24828e2195820.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <de1cd98004d72f55e48fb4185bc24828e2195820.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 13:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176447



On 26/01/2023 11:15, Richard Purdie wrote:
> On Thu, 2023-01-26 at 11:09 +0100, Louis Rannou wrote:
>> On 26/01/2023 11:02, Richard Purdie wrote:
>>> On Wed, 2023-01-25 at 09:31 +0100, Louis Rannou wrote:
>>>> From: Louis Rannou <lrannou@baylibre.com>
>>>>
>>>> [YOCTO #9070]
>>>>
>>>> Add a new selftest to validate the locales generation. This selftest builds a
>>>> complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
>>>> ENABLE_BINARY_LOCALE_GENERATION set. The locales are tested through a ssh
>>>> connection in three manners: checks if the locales exist in the locale-archive,
>>>> if it does exist for the glibc and if it can be generated.
>>>>
>>>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>>>> ---
>>>>    meta/lib/oeqa/selftest/cases/locales.py | 54 +++++++++++++++++++++++++
>>>>    1 file changed, 54 insertions(+)
>>>>    create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
>>>>
>>>> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
>>>> new file mode 100644
>>>> index 0000000000..089ca594a1
>>>> --- /dev/null
>>>> +++ b/meta/lib/oeqa/selftest/cases/locales.py
>>>> @@ -0,0 +1,54 @@
>>>> +#
>>>> +# SPDX-License-Identifier: MIT
>>>> +#
>>>> +
>>>> +from oeqa.selftest.case import OESelftestTestCase
>>>> +from oeqa.core.decorator import OETestTag
>>>> +from oeqa.utils.commands import bitbake, runqemu
>>>> +from oeqa.utils.sshcontrol import SSHControl
>>>> +
>>>> +class LocalesTest(OESelftestTestCase):
>>>> +
>>>> +    @OETestTag("runqemu")
>>>> +    def test_locales(self):
>>>> +        """
>>>> +        Summary: Test the locales through a ssh connection
>>>> +        Expected: 1. Check the locale exist in the locale-archive
>>>> +                  2. Check it the locale exist for the glibc
>>>> +                  3. Check the locale can be generated
>>>> +        Product: oe-core
>>>> +        Author: Louis Rannou <lrannou@baylibre.com>
>>>> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
>>>> +        """
>>>> +
>>>> +        features = []
>>>> +        features.append('EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password allow-root-login"')
>>>> +        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
>>>> +        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
>>>> +        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
>>>> +        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
>>>> +        self.write_config("\n".join(features))
>>>> +
>>>> +        # Build a core-image-minimal
>>>> +        bitbake('core-image-minimal')
>>>> +
>>>> +        with runqemu("core-image-minimal") as qemu:
>>>> +            # Attempt to ssh with each user into qemu with empty password
>>>> +            ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user='root')
>>>
>>> Thanks for this, in general this looks good and it would be great to
>>> get a test for this enabled so I'm very happy to see the patch.
>>>
>>> I did have one question about the above line. I think you can just use
>>> qemu.run() to run commands over ssh and I suspect the above might
>>> create a second ssh connection which might then have lifecycle issues.
>>> Did you try qemu.run() and have issues? I noticed a lot of our tests
>>> use run_serial() which I hadn't realised until I looked!
>> Hello, I haven't tried qemu as the bugzilla said to use a ssh
>> connection. But I guess this was different in 2013. I agree, it might be
>> better to avoid the ssh connection.

I just noticed that qemu_serial returns 1 on success and 0 on failure 
while the ssh command returns 0 and -N on failure.

> 
> To be clear, qemu.run() should run the command over an ssh connection
> to qemu if I remember the code paths correctly. It is just abstracted
> in the runqemu code so the test doesn't need to worry about it.

Indeed, I found this is correct.

> 
>> Also, the bugzilla asks to make a primary test with
>> ENABLE_BINARY_LOCALE_GENERATION="0" to check the locales are not gener.
>> This means a complete regeneration of the image, so I thought it is not
>> very relevant. Is this fine ?
> 
> Ideally we'd have two tests, one for binary locales enabled and one
> with it not enabled. That will mean a little more build time but would
> completely test the different options so is probably worth doing. I'd
> be happy for *any* automated locale tests at this point though!

Ok, let's do that !

Thank you,
Louis

