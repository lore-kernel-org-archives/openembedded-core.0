Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3ADC0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 08:44:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.60864.1738485856090926856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 00:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uc33Q0Os;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1781867f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738485854; x=1739090654; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wahoqsfJHxGBP4nW5K1M7p6SJfMcnnIXsdQ9fF9ayu0=;
        b=Uc33Q0OsjT+x6eZ0mH1fWsqvq9pNlPpvqNrDIdHQbwkD0NPtQwU9jy7tUToIpvPRRK
         fOPNlT73Loxa4nYi9CSm8A5TGbf9pMyAFyirMs9/RrUxLrlYcgmkgFO+NZ4Ok1rA1OEb
         FqJbiHFl3fvXjwAXCQpD3XU3B5ERgI1taQyY7PYu151ASpX2gpY3qIfUttpSB11RlimJ
         NS8t4smtWG/5sZy5kbE/k/DQtoCLMLaHTaauYueXpZiEbtiTfT1fH4VQBUotVkBM1jUd
         atvbgm8sebYyKuQ/yNAKrIbo+utLP2zGfABx+PsOg9Fnfh5uC6eCMxVhJ9KiUpnef68x
         lKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738485854; x=1739090654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wahoqsfJHxGBP4nW5K1M7p6SJfMcnnIXsdQ9fF9ayu0=;
        b=rEdmZE7BS82yMqYj7kVjBOTlMLPB2cf3AY0ohTJI88k2iVNzhbeoJI1AY1uKEUuSee
         LGFL+JyjsJtqzo7uYaD/ZWd0xtDa4rlojpqFb9490pioNYaPW4I1wqLy3RVB05EAAKDY
         oY33j9Has+ynVtsXr9rcnvCBEz7F35SeE0t6X9AqZSGUQMasAugiKHxpRbkisZYXYsHO
         N8fNH9M9p+ROYgdoXrd7hS5kC7pfbbBGWus5ZAU+IwsACUpY3D3alTErlM+vLltw5X5j
         RUkdmPOMaBOHyVyujSdCyFOtOqtkp5+9G5gLMXjp/CTXuKIp7R6xbxgzF8GimSFuQQ7w
         qy0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3PBIQloOeksIWfV2aXHFeJnlER1tqPfi6Z1YmJMqENj58oN6Whkne4WZzijeuSw7fd6w7N5AI6VEBkv5ghd5c+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhxOdR982EEvuxxjSvirfpfNecWFIzq07gcSHNtcWfv/NB3elG
	ScT46vnIMlrMShyZvzfViS4rNVn2YR8PjcZxezpMH+DZzHwfDvZV
X-Gm-Gg: ASbGncuCA9ABmXCT7JV99rNza+EWiQTDJr1bPDwHX0bF6Y093y3fIywT5igFLwGbXSD
	w3TNMyAC48TF6VMcBIjnDqUwtOkmmHekK0PZGqBRByxniuaUrYpneMPHrEa1S2+V6xZagZ5HaHQ
	Uhb2pRZj0AbpbcKz2BkMJCFV4ftpxyAItITVTI+gwkdm+rxxSM35zy9xmwv12nbOJbdfmuyTfYd
	M6BoZacdC8juROsyDxG6WW5PlGbyC2rOgGmlFIBDEJnrsgWLniEirvbMO1TZq8RvCKKoiihGLxB
	2lYDDwBkLlxLeWi7nFm/o6otJxImG7+zCRiSx4uwqONQ1MyN
X-Google-Smtp-Source: AGHT+IGGmcEloft0r+D9y+heb1z85kUPNqYCQXRbniyFmEhNo6pMVvFoE4PQmqnNc/lnbawmlcCioA==
X-Received: by 2002:a5d:47c8:0:b0:385:e1a8:e28e with SMTP id ffacd0b85a97d-38c51931ef0mr13273183f8f.10.1738485854118;
        Sun, 02 Feb 2025 00:44:14 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec80esm9541259f8f.10.2025.02.02.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 00:44:13 -0800 (PST)
Message-ID: <582ae918-5ef4-4689-a812-6c4b6c72950b@gmail.com>
Date: Sun, 2 Feb 2025 09:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <20250131064352.2613105-1-zboszor@gmail.com>
 <20250131064352.2613105-2-zboszor@gmail.com>
 <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 08:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210615

2025. 02. 01. 15:37 keltezéssel, Mathieu Dubois-Briand írta:
> On Fri Jan 31, 2025 at 7:43 AM CET, Zoltán Böszörményi wrote:
>> Enable building rpm with rpm-seqouia for the test.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
> Sorry, I still get some errors while building:
>
> 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618 (56.20s) (0 failed) (signing.Signing.test_signing_packages)
> 2025-02-01 14:28:32,979 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/signing.py", line 113, in test_signing_packages
>      runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
>    File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
>      raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native/usr/bin/rpmkeys --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-selftest/files/signing/key.pub' returned non-zero exit status 1:
> error: Certificate 7B31316B5D64AD52:
>    Policy rejects 7B31316B5D64AD52: No binding signature at time 2025-02-01T14:28:26Z
> error: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-selftest/files/signing/key.pub: key 1 import failed.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893/steps/14/logs/stdio
>
> Do you mind having a look at this ?

I have run the self test on a Fedora 41 host and it succeeded there.

Probably you need to fix the crypto policy to allow such a cert with a
"no binding signature" or replace the cert.

This github issue may have some useful pointers:
https://github.com/rpm-software-management/rpm-sequoia/issues/46


