Return-Path: <oecore.mailinglist@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 17DCA70057
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 10:01:54 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o15-v6so28797456wro.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=po0cwk0AEOrmEKIoT62/SNQbk+OwMY/D8kc/3SEmJio=;
	b=CIwzmvjsV7abm4Png1u+3KwbXRcV1kmFDaO+eMFfQu89IRbZfvUK3usJsJgYs5zn51
	pBB6gExQxsvO9d53dQs3M2xnqwumnHzn7otTWHcY09nm35wydoBhhHO/uH62nD5/YEU2
	q2M1RGpNndIJ+Y8e8y3dIR/IZ5mRFNo9zdZTM6KemLxQlvCeii/lpAu6nZ7u0ZM7kjI5
	GTULzRmmROM51fM0kq7i7BjQRmZtwF5CzNXn8/NnmCcUWO6eqQf6NFCnyzTFCOw+JXUP
	iVdoC//O9X29w9GEI3gDM5ORAGZbeiRFYrnQg+PQNkfFohFA9fJ9G6wLK0mX4h/cA9hx
	R3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=po0cwk0AEOrmEKIoT62/SNQbk+OwMY/D8kc/3SEmJio=;
	b=kRLtrNwptRm/4Q3NCagm6kTT455ZMN6VFLO8lvWPQGAQlL4PLOHO1uPxeDj28enkfH
	yXSkqCzP5DJYt4WJXW2oAy+z6fFr0ia/vKPvFmRPcCHgPmxJZkwNRiq3YHEdiAbHpews
	8Tpa/5s0waPaqHkbFZpi/Dg8sW/u6OZmOZBjGkir/b1p7ebkwvAJqdeIOCwQPgszgXj4
	ovR07qKmIbx3prA3iKK/a/t0dbIGIMihIE1qZnsxPwXlWqYQa6Uqbq+SgQ+EMKiKfviw
	YHfXjRLqZVe+w7U94StIbhHRmG5jBpjYHrm5SlerBKxtzY4i+oa/EtFeIfvXL1r+GoqC
	Z8ow==
X-Gm-Message-State: ALQs6tAd4Opp4P68Yi0lvTnZIJTMCZugujGPRx9U15x2+YnZPHHR8D/l
	675ucKapNBVorhGBduxfubquxWmR
X-Google-Smtp-Source: AIpwx4/vLzIwUVvhuLB8rc/COPLiOf6a4TqpIfhKmk3Pr7GHqpNAQz3xDxgY23ckBwHpdYyfF+n7eQ==
X-Received: by 2002:adf:cc8c:: with SMTP id
	p12-v6mr7490225wrj.280.1524304915336; 
	Sat, 21 Apr 2018 03:01:55 -0700 (PDT)
Received: from [192.168.42.50] (ppp-2-86-147-190.home.otenet.gr.
	[2.86.147.190]) by smtp.gmail.com with ESMTPSA id
	k11sm4101536wmi.35.2018.04.21.03.01.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Apr 2018 03:01:54 -0700 (PDT)
To: Marek Vasut <marex@denx.de>, "Burton, Ross" <ross.burton@intel.com>
References: <20180408230223.17260-1-marex@denx.de>
	<CAJTo0Lbdrm7y5ZHHSHH980jmZSJE0RbhLQCVY3NtQ1DPz-A3fw@mail.gmail.com>
	<2c318d94-b321-e83a-a5ef-254647b3d35e@denx.de>
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <9c70891a-afc7-9f55-e231-bc1c3eb4dce3@gmail.com>
Date: Sat, 21 Apr 2018 12:01:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <2c318d94-b321-e83a-a5ef-254647b3d35e@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Sat, 21 Apr 2018 10:01:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

Please see my comments below.

On 2018-04-11 16:51, Marek Vasut wrote:
> On 04/11/2018 04:47 PM, Burton, Ross wrote:
>> On 9 April 2018 at 00:02, Marek Vasut <marex@denx.de> wrote:
>>> This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>>> patches accepted upstream, getting the patch count to zero.
>> Are you proposing this for 2.5/Sumo (breaking the freeze) or is it
>> fine to sit in master-next until 2.5 is released?
> master-next, for 2.6 .
>
I think we have also problem with u-boot and rocko 2.4.x

I observed with 2.4.x for i.mx6 and sitara that u-boot 2017.01 does not 
function anymore properly (networking is broken due to compiler upgrade 
with 2.4.x [1]).

So I built u-boot 2017.03 (a pre-release version) with 2.4.1 and 2.4.2 
and it was fixed.

Please note, that I did not do this via bitbake, but using the SDK.

So I think it would be a good idea to get u-boot 2017.03 to build with a 
recent version of rocko as well.

[1] https://www.mail-archive.com/yocto@yoctoproject.org/msg39605.html

Regards,

Robert


