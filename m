Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CCD256C149
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 15:24:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r24so6362373wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 07:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zD2s8v/9f8pySkn8lGtrJ8c8DbBTNHp9aeXh2Aoh05I=;
	b=gWMQbbGB2p1LvRqO2Ioeft/BuifaBWPvzLrqnnBsF2KyBBvWdCbfSWoRAvV5mkKHdm
	4tNfbQ0X/2OkArJUSG7Pn6wiu+jwuL139jdI+rRbFBEFq91z6WcxMCoDDXrwogTgc/jx
	ywrMEcTbFi/GjuVybv0dd/hUFDSPbuTqXQ13k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zD2s8v/9f8pySkn8lGtrJ8c8DbBTNHp9aeXh2Aoh05I=;
	b=byZqjsaCkA5poVCM2f13PoMNBn6EogqqyWKfqJvAxLGauP3UjpMsloXqDANeOc29oc
	6r31ugDazw0e2W0wxRX+vzsOuFfrVsAbFd88//B7fgucPmjMWRJ0k6tX9sBubIjLgT6M
	Q8/8HZlNnzJRNYo44aah0kxbfPpEtsOUr0xXwA3nDuoNa/UBdksZ+77CFI52+AGWPDGv
	Ocfh9C0irzo6n6DUUEY1x5cd48BNc0laflOhO0t3ga3FHOqQfOA/hghQC4wC075F3IIn
	+Weehs+XEo5RfFQP5APYY9U6KxQyjaj4muEbSjiD6J1AYy/0Pkn9eajToRp5K1mT048d
	aUkg==
X-Gm-Message-State: AJcUukfrSnZBJvkfkAsn3kH/tKLapIBO6Z/BArHgR9ts6+zNPnQWbIc+
	B2EINrr2masSHaPuC0qYVjyfJQ==
X-Google-Smtp-Source: ALg8bN7dr3v3TRIFS7IIzbPxUGYbLImjgBBy6cxEGDy+uiB3miI4m5UUJnVEQQ4ti0Z1xZIjXgpHiA==
X-Received: by 2002:a1c:8791:: with SMTP id j139mr8716619wmd.86.1546874642176; 
	Mon, 07 Jan 2019 07:24:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e27sm56579642wra.67.2019.01.07.07.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Jan 2019 07:24:01 -0800 (PST)
Message-ID: <036334051f2c318eb35e0983ffb3df3931757747.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Jan 2019 15:24:00 +0000
In-Reply-To: <f20642eb8822150fa43d2c9fada6c5c36c1d08e7.1546585931.git.liezhi.yang@windriver.com>
References: <cover.1546585931.git.liezhi.yang@windriver.com>
	<f20642eb8822150fa43d2c9fada6c5c36c1d08e7.1546585931.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Jon Mason <Jon.Mason@arm.com>
Subject: Re: [PATCH v2 1/3] oeqa: Fix for QEMU_USE_KVM
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
X-List-Received-Date: Mon, 07 Jan 2019 15:24:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-04 at 15:15 +0800, Robert Yang wrote:
> Fixed:
> MACHINE = "qemux86"
> QEMU_USE_KVM = "qemux86"
> IMAGE_CLASSES += "testimage"
> 
> $ oe-selftest -r runqemu.RunqemuTests.test_boot_rootfs
> 
> [snip]
>   File "/buildarea1/lyang1/poky/meta/lib/oe/types.py", line 122, in
> boolean
>     raise ValueError("Invalid boolean value '%s'" % value)
> ValueError: Invalid boolean value 'qemux86'
> 
> Now QEMU_USE_KVM can only be boolean, can not contain MACHINE any
> more, kvm
> will be enabled if target_arch == build_arch or both of them are x86
> archs.
> 
[...]
> +def is_x86(arch):
> +    """
> +    Check whether arch is x86 or x86_64
> +    """
> +    if arch.startswith('x86_') or re.match('i.*86', arch) or arch ==
> 'ia64':
> +        return True

Thanks, I've queued this for testing. I did remove the ia64 test here
as ia64 is itanium which can't do x86 KVM from what I know.

We may also need to add something for arm == aarch64 comparisons, I'm
not 100% sure what is supproted. I've cc'd Jon on that...

Cheers,

Richard


