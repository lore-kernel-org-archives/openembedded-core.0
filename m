Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6032C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 10:09:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.70384.1674727763427368336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 02:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=mE8WDun0;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id t18so1238615wro.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 02:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ho61kSYC/7O5NN+o9JcGjxJZsj4wBqWO+js/GOp535M=;
        b=mE8WDun0nSTwrEkHpRfjQYOvTDjWWfYWYDIQU6bJfDj2VqIQ0+YhURWVhmvYYvTebu
         5lx0Onlumhx2ApnhkER6PNNVfan3de5PegSgvZSn2zJnv/o/P4l1l+Iby+jWleuVcFq5
         /vxjY8vegxsUCFDQe4blkOUKwx2zV0rq/uSTnD5N75WUDRiEzmxBstNjy6O7ouj7aITO
         YV8Iyscp6GJk2VVoj7XkFvT9S0f/CgJ4+KHKLXinvPKo7Uxoy5NuiyV4jXE0agnBpc7C
         2fauVR+DD7OCZtR/eC86OOviT0AAO21VyM3iMJdhji5bOM5Ac5eSGuLF5FO9pQW8BSgL
         ivcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho61kSYC/7O5NN+o9JcGjxJZsj4wBqWO+js/GOp535M=;
        b=LLr+6rhTAC20/2rjDowRJS8FtvsM56DlWrYaDwHiQmtkYsFRT1CWJkf81SxADce1Hn
         E/d3PSQUhNPLLAPerVGXSky04a4KAm1DXJHOoMtNFRuiesXIBoz6b7vbA+wekIFBBo3m
         H4CdyhGZRhbCD/WXxTJeq2DQBVvEwEL+3xg5UrCypTeA4WJufroTjysQ6nkW0Tvnw8It
         KlEMxzL7kRR837wnj14gIsVTuX4NwXwNlmccZ4EZUVI766sQ6fd185vVWnDzqEATzThR
         nrypGfx0L2pZ1tBNLASrluOcspvM6tm6JQ825UTHbniS95V6mJ0MBLZQyCKQZki2jAO1
         eViw==
X-Gm-Message-State: AFqh2koFRvSbC23kuECnuXaJy8VyrkxjKM3t4ymX0Fa0cdYRRWmlnHOQ
	AWHAyfG+7DbMNpdgRzEl39B3ZA==
X-Google-Smtp-Source: AMrXdXuD14ZzU995woOGkE3dPK8Dfipjka/jzPyLQuvgV9RfrzLKertUIjXRhHyvCKEMPRLD4T+MZA==
X-Received: by 2002:a05:6000:a0a:b0:2be:5d57:ca19 with SMTP id co10-20020a0560000a0a00b002be5d57ca19mr20678471wrb.58.1674727761493;
        Thu, 26 Jan 2023 02:09:21 -0800 (PST)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id d3-20020adfe2c3000000b002bc7fcf08ddsm807741wrj.103.2023.01.26.02.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:09:20 -0800 (PST)
Message-ID: <4479c710-1384-dd7b-ad6b-be756025e3bb@baylibre.com>
Date: Thu, 26 Jan 2023 11:09:20 +0100
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
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <f39b351e96ff00039f526290e7ff68c7fa3c7271.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 10:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176389

On 26/01/2023 11:02, Richard Purdie wrote:
> On Wed, 2023-01-25 at 09:31 +0100, Louis Rannou wrote:
>> From: Louis Rannou <lrannou@baylibre.com>
>>
>> [YOCTO #9070]
>>
>> Add a new selftest to validate the locales generation. This selftest builds a
>> complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
>> ENABLE_BINARY_LOCALE_GENERATION set. The locales are tested through a ssh
>> connection in three manners: checks if the locales exist in the locale-archive,
>> if it does exist for the glibc and if it can be generated.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/locales.py | 54 +++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>   create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
>> new file mode 100644
>> index 0000000000..089ca594a1
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/locales.py
>> @@ -0,0 +1,54 @@
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.core.decorator import OETestTag
>> +from oeqa.utils.commands import bitbake, runqemu
>> +from oeqa.utils.sshcontrol import SSHControl
>> +
>> +class LocalesTest(OESelftestTestCase):
>> +
>> +    @OETestTag("runqemu")
>> +    def test_locales(self):
>> +        """
>> +        Summary: Test the locales through a ssh connection
>> +        Expected: 1. Check the locale exist in the locale-archive
>> +                  2. Check it the locale exist for the glibc
>> +                  3. Check the locale can be generated
>> +        Product: oe-core
>> +        Author: Louis Rannou <lrannou@baylibre.com>
>> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
>> +        """
>> +
>> +        features = []
>> +        features.append('EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password allow-root-login"')
>> +        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
>> +        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
>> +        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
>> +        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
>> +        self.write_config("\n".join(features))
>> +
>> +        # Build a core-image-minimal
>> +        bitbake('core-image-minimal')
>> +
>> +        with runqemu("core-image-minimal") as qemu:
>> +            # Attempt to ssh with each user into qemu with empty password
>> +            ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user='root')
> 
> Thanks for this, in general this looks good and it would be great to
> get a test for this enabled so I'm very happy to see the patch.
> 
> I did have one question about the above line. I think you can just use
> qemu.run() to run commands over ssh and I suspect the above might
> create a second ssh connection which might then have lifecycle issues.
> Did you try qemu.run() and have issues? I noticed a lot of our tests
> use run_serial() which I hadn't realised until I looked!
Hello, I haven't tried qemu as the bugzilla said to use a ssh 
connection. But I guess this was different in 2013. I agree, it might be 
better to avoid the ssh connection.

Also, the bugzilla asks to make a primary test with 
ENABLE_BINARY_LOCALE_GENERATION="0" to check the locales are not gener. 
This means a complete regeneration of the image, so I thought it is not 
very relevant. Is this fine ?

Thanks,
Louis

> 
> Cheers,
> 
> Richard
> 
>> +            cmd = "locale -a"
>> +            status, output = ssh.run(cmd)
>> +            # output must includes fr_FR or fr_FR.UTF-8
>> +            self.assertEqual(status, 0, msg='locale -a test failed: %s' % output)
>> +            self.assertIn("fr_FR", output, msg='Incorrect output: %s' % output)
>> +
>> +            cmd = "localedef --list-archive -v | grep fr_FR.utf8"
>> +            status, output = ssh.run(cmd)
>> +            # output must includes fr_FR.utf8
>> +            self.assertEqual(status, 0, msg='localedef test failed: %s' % output)
>> +
>> +            cmd = "LANG=fr_FR.UTF-8 locale"
>> +            status, output = ssh.run(cmd)
>> +            # output must includes fr_FR.UTF-8
>> +            self.assertEqual(status, 0, msg='locale test failed: %s' % output)
>> +            self.assertIn("LANG=fr_FR.UTF-8", output,
>> +                          msg='Incorrect output: %s' % output)
> 

