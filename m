Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6065778AA4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 10:51:37 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w77so12524035wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 02:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=NCmk47kz9WqwwuQtMtRvSVDdWgpDPaqdCYPwqGs2bik=;
	b=vG853MCmtZu1v1t45n6yh4lTbrZqeZFqaTK14B5ntgZNX8YcOGglfrhTxR/83UY12i
	Hovp0d9DHXfrT8dipdEiwZJA+AZ+S7D26WdjWk5ZxkXdsBGbFwk42Q5ku1gN8RHpmWF8
	yu5h+XKsDWDZeJCeY2aAeolXkTHedueTRVxPg9Hi4MfVYJeFt+2T8QKKGzRVRYi8o6/t
	FPng4HJ5JAYtr8P25fPrGMip6iVn/DPL+OCJq021Jntov77mOKC44I7EcT5x5SE7tFLm
	iKErywrW6b3W4q3jPUsEsN0qiMOKyGK7MpMPIWEKpf3iVpBqWtPRqSlTVuOcb64EsUnp
	Xo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NCmk47kz9WqwwuQtMtRvSVDdWgpDPaqdCYPwqGs2bik=;
	b=eCtMACaXEQgoJAiHk7hmys88ce6oMb7Ny9M7a7I3TR6vQKNeTKX0ENv+x8j5kMDnqA
	jbIGPprLYhYsFczumyMtMVqNN7M86FPpPkeNk2LRl43f1CoNhmnqTIjop+fVx8xIRo9k
	1Y87+9k0gazcFYY5arYXTOgTzUEeYVfzv7WZX0D6LVZsdsOckJ/SAupB4DI7vNe1vpf6
	3IzA/lPI6pL/XPe8dUJW1UIId18dLm/mOm0Jf8tG+FQZLKJOKsfOzThnaHmJopekoyM2
	NjkXC+PV86rC/RJOYj2GyadJ0jmcwt0cq657cAmDVtgawHTnICA9oVqJV5UhM0Q4WI9t
	JjBg==
X-Gm-Message-State: APf1xPA9AleQxUiKkAjLu+xU8NHYRRhsgL4Mb3JkRmmBtdYXPE+GY36R
	sbXs5X+ujdnJHvkCQwQC8GsNXXrh
X-Google-Smtp-Source: AG47ELvz7qTPiZ6yP2ROkBSVwcLgK1JeDBA7tERgxb9Vm7ivtEGsp+V3LMFKNfXo/ooZZkkhEP5Qog==
X-Received: by 10.223.184.147 with SMTP id i19mr7180672wrf.102.1520074298631; 
	Sat, 03 Mar 2018 02:51:38 -0800 (PST)
Received: from [192.168.19.11] ([2.28.103.57])
	by smtp.googlemail.com with ESMTPSA id
	t135sm2635287wmt.44.2018.03.03.02.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 02:51:38 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1520067650.3436.41.camel@linuxfoundation.org>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <91616f15-f805-22db-6073-8698f49bab86@gmail.com>
Date: Sat, 3 Mar 2018 10:51:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520067650.3436.41.camel@linuxfoundation.org>
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Sat, 03 Mar 2018 10:51:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 03/03/18 09:00, Richard Purdie wrote:
> Hi,
> 
> I need some help with a problem we keep seeing:
> 
> https://autobuilder.yocto.io/builders/nightly-arm64/builds/798
> 
> Basically, now and again, for reasons we don't understand, all the
> sanity tests fail for qemuarm64.
> 
> I've poked at this a bit and if I go in onto the failed machine and run
> this again, they work, using the same image, kernel and qemu binaries.
> We've seen this on two different autobuilder infrastructure on varying
> host OSs. They always seem to fail all three at once.
> 
> Whilst this was a mut build, I saw this repeat three builds in a row on
> the new autobuilder we're setting up with master.
> 
> The kernels always seem to hang somewhere around the:
> 
> | [    0.766079] raid6: int64x1  xor()   302 MB/s
> | [    0.844597] raid6: int64x2  gen()   675 MB/s

I believe this is related to btrfs and comes from having btrfs compiled 
in to the kernel. You could maybe side-step the problem (and hence leave 
it lurking) by changing btrfs to a module.

Regards,
Ian

> raid timing measurements.
> 
> In the past we've dived in and handled these kinds of things but I've
> run out of people to lean on and I need help from the wider community.
> 
> Can anyone help look into and fix this?
> 
> This is serious as if nobody cares, I'll have to simply stop boot
> testing qemuarm64.
> 
> Not sure if there is an open bug yet either :/.
> 
> Cheers,
> 
> Richard
> 

