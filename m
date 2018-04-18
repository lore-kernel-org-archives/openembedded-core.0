Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC4537451C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 07:45:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j11so469247pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 00:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HN5Ys2XYWCwinCRThW6d4jXcG62kp5n+I746gON2tD0=;
	b=F4c7WhPEhY/eBi4SQuSk1sxLCsXE0DgZpqh5W9U4nmIBmLHQpC0swVGXXyRq/BjHfh
	loXMdrpuQBjWCHp1oqjgu95zx3lU5Jz/XWDatzeXg9/pJSx65VKpESw06ia7XgLAI6oI
	I65Gfgia0umwPUp+V3CRwdANcilS0vvsrXeO3XotERo6rQCWRcpH1nJRDDXlIilwtvLe
	JM23rzB2roSexapNTfC0N3mIlEAkjEwwOTTgfrhPadohbBcdeUh1APJBJEN2tkWquuH/
	jusGY/xTZ8jME/BSYhoxBj4Wzt7/p8kyOrvIZiaUvlYziP1AsKnUlHL379DkyzipnWG+
	A57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=HN5Ys2XYWCwinCRThW6d4jXcG62kp5n+I746gON2tD0=;
	b=sbzzjtgoChCI72E1UQU+XxpqrGOWvjMNADDqz90tozOemU4MD7tzIoOucEJy7JTE0P
	3Ovo7WZPDNPwM+RVoa0QlGuiWbcmSC9Iaakc4jg3n69czZEw+KJ1N6BeWUKcbjZfoqaE
	LNnBCU4/WrkU9yFfRjjIHI/g4iivB/ywpxbH5UU3TusZ/L+DQGP8ArDPNQ2aaRgbqjg5
	JjWNK5q2pkQVjhO5m0eioiKbXK5izqRYoVbZ5qWrIsudR4ypLpaZqSgixAjbTVJvyKhH
	USnF2S+WUPea+79HLab3vUc1eVxxn95wzTzWnkP8SI7X+jJVAmGVaoyNUN97A0zF5Ffk
	y2aw==
X-Gm-Message-State: ALQs6tDvcF3YCJ1vXmBusVyShG5ZflFTtY2YbDW2zcBxRCnXroNXI9LX
	BiON7ccURxmAPAmnmrcoUg5S1hSr
X-Google-Smtp-Source: AIpwx4/WUACYzIVQogXPOyWSD/tdYd2lVHvF0yzO3ijhbjE3OMZ34alZx5WN93AjP2Y1OmJ26nrZ9g==
X-Received: by 10.99.149.87 with SMTP id t23mr879951pgn.77.1524037557807;
	Wed, 18 Apr 2018 00:45:57 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:68e6:e447:164c:d4e7])
	by smtp.gmail.com with ESMTPSA id k9sm1296051pgo.62.2018.04.18.00.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 00:45:57 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
References: <1523908979-32369-1-git-send-email-alistair.francis@wdc.com>
	<CAJ86T=VRts8m1QJb-hui1ievJhX-J9ngLUffTotLuzf-Z9dinw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a98cead2-4187-9c21-d5be-352c296e633f@gmail.com>
Date: Wed, 18 Apr 2018 00:45:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VRts8m1QJb-hui1ievJhX-J9ngLUffTotLuzf-Z9dinw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2018 07:45:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/17/18 1:52 PM, Andre McCurdy wrote:
> On Mon, Apr 16, 2018 at 1:02 PM, Alistair Francis
> <alistair.francis@wdc.com> wrote:
>> If the user has set numa as a distro feature enable NUMA support in the
>> kernel config.
> 
> Isn't NUMA something which would be machine specific rather than
> distro specific?

Yes, I think MACHINE_FEATURE seems a better fit


