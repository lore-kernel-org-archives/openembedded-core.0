Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7C2C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 08:52:14 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.17560.1754383926565228170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 01:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVzEZYUJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so1079750466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754383925; x=1754988725; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L87+48rHVwJ6mf96F0y3gFyZRVgkbsGhrRJ5LkfTHEU=;
        b=aVzEZYUJwtkHPcd501u4RAUw+CdfswSFTldrN0iCYPp73xasX4shieB+BSbJN11f8Y
         YOra2gnDZ88ETWSc/MxeWL7cxAZ8OvnyIkh+Ho6FOfRWEPSIEhLX7cJ64UqOJzrnWpk7
         8F5GmlqnvvxbLYPR7cCyloxDxFGBxo0o53//yLKh8JHX35aiboF5x8DRkDeMxqBcIp+c
         57NbuNtXF1TFGC6A5pqhoIds/tb9qoz4BcsS5eZvfSJS/WY4OhUchfUCqNqZh+LtJ0I6
         woCBEqgJqPqTiQF9aHxqFOa1PkUK8BpibwYbKykcdzlahxpdUAd9NqUth1WeTOeTyTnd
         PlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383925; x=1754988725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L87+48rHVwJ6mf96F0y3gFyZRVgkbsGhrRJ5LkfTHEU=;
        b=vzC4sUVP/mZ5qClASjbRbey1gGIq4lG2Ta9LZSeWLpsooWYIh5aavhsJeCD+b/mJcz
         7EeNgm5M8Cl3Hl/gqNVDDEEeeQR9Xg1HBPI/paI2Q6D8ll+YZDsb8PbBY1TJwRRzeXF4
         NBj4LiMNUUdL2ClnZleZO6jYPEmmV0WwmITXaSoMoeWNp60hrh6CGiVYOecLTnCF4Tu9
         yYgqHNXn1ZhC6MQis/nkO6omYNsqHlhX/M7pqltzmYvrj06aeJ2fSSwT6HL4bb/8wKBj
         BQLSPo25cylvzctiGMDrKjKIbyoGgSovEGiKjpHLi97HU98BK/wr07gByddi3BJpGmXQ
         BTvg==
X-Forwarded-Encrypted: i=1; AJvYcCWTaQwXpMHaAI3hpVhjcisXy9djP+ykGD7YJmlub6Je2MUX+s9xk8wqPYMLorVNCfyKp92m9U7MX0NlhFoUV3LHUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQf3ZDimi8hWd/z0fbUEq3bEVEWnAbcq0/9u++cZ7j9FG2E9er
	jdBh+xWyQUGvl59TxVuFnvKSCGFZXmr6yWkdo0hGF/tfHDKfAaNYCtLY
X-Gm-Gg: ASbGncup5NhImRDsnO5JE+vFQ0B1N2xpPcQGbGPSCOr0xs82yzYagcHmBrgJZbh4orB
	VCzUFudbS2lbO+X/C+80Wqtzs1miH+zh/XDTOwbZwiDrf6neKjH2jyumoCdt5GB3GfwXYIEEY0U
	VrdwU9KHUYJXsueP1WsoADj/3tES0wmjjwmOJxMNv7o37xsKOp3Xx5jlhr7x5AJmSrmiELJ3JhO
	5mxMih7yVlpQum2ty5OVRXjLd+0lSRprAHmn6KdIaAbuSXVUg7s5kHxUU3Ooi56pwWMFevxqMri
	y5pky5iNsgfdfrR5hjLdcmNteIlraeoTHuexRDTdoUJGwdHIJv+FbwHYWfnOuP42NlJaawtR8Um
	Gu0OeVlPzsdD3inl2MJl4lPnUBxql7w==
X-Google-Smtp-Source: AGHT+IHN1bZI6TkZ/MlyKVP62frKoJxlrtw4jQfd5YhfHx6FTI+n+3ehF6jEnrCVYVpnrGXpIJjW2g==
X-Received: by 2002:a17:907:944f:b0:ad5:7bc4:84be with SMTP id a640c23a62f3a-af94021d61cmr1309216566b.52.1754383924516;
        Tue, 05 Aug 2025 01:52:04 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffbc39sm8138786a12.51.2025.08.05.01.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:52:04 -0700 (PDT)
Message-ID: <9e734e6d-fd12-4ac6-a51c-b422d8d024b2@gmail.com>
Date: Tue, 5 Aug 2025 10:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] dpkg: add ptest support
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250802131227.677594-1-skandigraun@gmail.com>
 <20250802131227.677594-2-skandigraun@gmail.com>
 <DBUCE9OCATK0.3SAJACOFJ2I7Z@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DBUCE9OCATK0.3SAJACOFJ2I7Z@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 08:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221464

On 8/5/25 10:14, Mathieu Dubois-Briand wrote:
> On Sat Aug 2, 2025 at 3:12 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> Added it to slow tests, as it takes betwen 165 and 190 seconds on my
>> machine to execute (qemux86-64 + kvm).
>>
>> The test folder's Makefile contains a list of passing, failing and manual
>> tests. By default, only the expected-to-pass tests are executed by the
>> Makefile (unless magic environment variable is set).
>>
>> The run-ptest script mimics the default behavior of executing the
>> expected-to-pass tests, however they are executed one by one, instead of
>> running them as one batch - that way it is easier to determine exactly
>> which tests pass and which fail.
>>
>> One other thing that might worth a note, is that the tests folder that needs to be
>> installed contains a number of subfolders called "DEBIAN". When packaging them
>> at least with rpm, these folders are omitted from the package. 
>> However these are essential for the tests, as they contain test data. As a 
>> workaround, these folders are renamed during installation to DEBIAN-ptest, 
>> and before execution the run-ptest script restores their names.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
> Hi Gyorgy,
>
> Thanks for your patch.
>
> It looks like some of these ptests are failing:
>
> WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: There were failing ptests.
> ...
> AssertionError:
> ptests which had no test results:
> ['dpkg']
>
> Cannot run ptests without @expectedFailure as ptests are expected to fail
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3164697/raw_inline
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3164752/raw_inline
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3164788/raw_inline
>
> Ptest results can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20250805-32/testresults/qemuarm64-ptest/core-image-ptest-dpkg/
> https://valkyrie.yocto.io/pub/non-release/20250805-32/testresults/qemuriscv64-ptest/core-image-ptest-dpkg/
> https://valkyrie.yocto.io/pub/non-release/20250805-32/testresults/qemux86-64-ptest/core-image-ptest-dpkg/
>
> Best regards,
> Mathieu
>
I think I see the problem, the output format of the run-ptest seems to
be incorrect. I'm afraid I made the same mistake with librsvg ptests
too. Thanks for the heads up, will send a v2 for both dpkg and librsvg
ptest patches.

