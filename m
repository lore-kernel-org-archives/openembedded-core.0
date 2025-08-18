Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E34CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1875.1755538694625039440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 10:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FE+MI8dq;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so23472795e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755538693; x=1756143493; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPLlOT7edRQFAqqYgm7p2VchQGgvynnWitnAAx2UWdE=;
        b=FE+MI8dqUI3IcgYz97JoE1Vzv7eyzlzar/+HzThjZV+Ky+grtG+dJPjM3q5W6+444i
         jMoIeHYdJeHDyY6fOgZTslGKUxt20VZTIex2fXCHXXX5qdLXmFyyKuQj/b2jqZ4KHX53
         cOL/JY7QBSarpBjVosUtW1+R9DEMjqDOM3rD/nKvavV6EclYlywMMbHcNxpYF8DW74Ow
         yyrDDDoDOSrE+Eaeqcj6h66MROWZHuVlBy2CnjixNlK7NaSkC5Oduyy50MQ6xrxBe2NZ
         WoE315Hj+wVbtmUemrLERyBYu6mF5V/nDmzPrCcb50ESRkZ10uh++TW7/GdLYvj4UvlL
         geiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755538693; x=1756143493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPLlOT7edRQFAqqYgm7p2VchQGgvynnWitnAAx2UWdE=;
        b=YDokK9+P15RShm57cKr8hv5dh+h7cRfeJvvlScvhJCTAgXvYikjWD5jwNqGvma8y5B
         q9+88HwyZmApBezkc8VV9Fu68GFs3w3sOstHPv4UY6JT4KmwRDcV8ByoMPG1u3ZDiTlq
         Re/OuXr5ojVCWbBRlK5VYeTApyJ1+LtfPSg1Wfp8jt7GnJSDI2flN80/sK5qkbNKZIDw
         grdtnLb/pN0mfe7Zx1jjJ0pXP7HlKIEnn8MQVM2OXXxX8PoQ7+X3RLNbaAAtHJVqk1a7
         wOczpxlnlNK/vmnMjhDL9ybfe2zxMKnvbi1cpfxa1Pz8J503nHlbcEu+1DKRTHKYNdIf
         AJTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQRaH/l5jhnHphmLETkyx+MytVJAdhcM2PkNDOctNwiglHmivtzSXZLnxVw6566CCAWx5ZpSJSzHiRMDkfDmwprQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzuTrUo223vqbsVfsJvIXjYOKBx1thOTS2oMeKfXMkhtUu85t59
	oGcXCEGl+JgmjNBhb75KQpXeSLJY4ODBB9/2a5eYG9AKP1WfJcqqS5J3
X-Gm-Gg: ASbGncsbn0c3PEig7TLjJigwOuE9Kwg1WQDkQzvMTYTVnfOM23qQlFzsGmaOqt75Cui
	p9pgyNLAc1KuUd16McNxIvLN2SWDIBbOHfpPV5yaE0UjWg4BuhoWgWcbQQoyA8eD8mnVmPapsfV
	1VepnEqIY7h7QR/XsLkno7GOm/6QKMeFnKA0ydQHtScuGDu435xTUw5a8pbJcaTI2cuW26QZHPO
	ENbNN2ggLBHE+eHpzGMdNQb5aiXJat3scIng1CirBvaHgdIEAy8RvJ3Q0CkeZSfWoVeCX5jzD+K
	kV6FIno/8aGv9P7HIWLWCh1QBK6Kfk04G0D8ZzwTnhl9Mku0cqdxcOS/sCFuutD94NUn2MaCJ9Z
	r+TxsppMcuxe0O7moZNB6G569WlcXk4nx/5mRpJP/Hg==
X-Google-Smtp-Source: AGHT+IF4Vh8GJOX+O6oP7Vvb5RY3EmccgHfYhgZt0oeU//Yce49I4jff+xNGzFQjYc6Xuisx8dzHBA==
X-Received: by 2002:a05:6000:4a1e:b0:3c0:7e30:a962 with SMTP id ffacd0b85a97d-3c07e30acd8mr258904f8f.63.1755538692734;
        Mon, 18 Aug 2025 10:38:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b7ed5edsm107250155e9.3.2025.08.18.10.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 10:38:12 -0700 (PDT)
Message-ID: <154c9823-5637-4b77-8488-a4f218e68f2c@gmail.com>
Date: Mon, 18 Aug 2025 19:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] boost-build-native: upgrade 1.87 -> 1.89
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250816102229.55627-1-skandigraun@gmail.com>
 <DC5BU6ME8H5L.1TRS1N5LYWRWN@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DC5BU6ME8H5L.1TRS1N5LYWRWN@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 17:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222044



On 8/18/25 08:07, Mathieu Dubois-Briand wrote:
> On Sat Aug 16, 2025 at 12:22 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> Changelog: https://www.boost.org/releases/1.89.0/
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
> Hi Gyorgy,
>
> Thanks for your patch.
>
> It looks like this is breaking the build of kea:
>
> ERROR: kea-2.6.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/core2-64-poky-linux/kea/2.6.3/temp/run.do_configure.25537' failed with exit code 1
> ...
> | checking for Boost system library... no
> | configure: error: Linking with -lboost_system -lboost_system is not enough: please make sure libboost_system is installed in an expected location; Check config.log for details, you may be missing other libraries.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2074
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2231
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2253
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2288
>
> Can you fix it please?
>
> Best regards,
> Mathieu
>
>
>

Thanks for the note and the logs - maybe updating boost wasn't a good
idea from me.

Boost has switched the system module to headers-only, which makes kea
unhappy. While kea can also compile with headers only, there is a scary
warning about it causing runtime errors, in general saying it "is NOT
recommended".

kea 3.0 still tries to link with this module. I wanted to submit a bug
upstream, however unfortunately they don't accept gmail addresses for
registration. 

For now I will drop this - but maybe someone else will have better luck.


