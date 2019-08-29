Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 592E97F2A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:41:53 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id x3so2885899lji.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LxjByv6LzIbD5vzOifvhOQCSnuNXRIldlnj2H9CQRD4=;
	b=WrPOk1ZbmE5uCdqKN16qgXMX/vq610BWcpcthCAHNh5pxBspf/WEFdwHu3PlO7ZU19
	5mIVnnYdWk95OH26pmHey2YO+t7yHKqb9tSESAExR2mCncUTtu4SJ7JzSSKcURkKCdUI
	5Ws0IEmQ87W5mgnxXXcuK2MOUzX85jvjp7IDvaonOAYa0yGGFkD4t8Xe3qGEBeCXGtJk
	bABwUH3309ELHvmZnlwQyeh9BMcVylzVk7B13YngMOchzF+0UDwLrEMCKIdDUWWflFQf
	7DbpZa7BamqRtT8JQCc6R/lh9hAqKxeO9woET9tb4ZteQH0PCKSuHnq+mW291ah6zIFG
	zRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LxjByv6LzIbD5vzOifvhOQCSnuNXRIldlnj2H9CQRD4=;
	b=l/v+pU8/4YVsxdsQU7QPHN+bBhhO9fK1VnLR79HdcyGW6kGx/BCvv1lWe3jocg4B1T
	frl0CXBGXhBqW/8BHqrrhWCfnOCF7R68qipv4ESrleNUT2wWq584MYiDD56wk3AFDlj2
	nHeaKqlhZZFgQyJf0hl9CuUbYKcCLZeM0B9uijZ8X8Tl65IkD3B5d+ALIYHa3rAhBLSo
	Rq0poKItXXpetRQ8f4t2bNUPU0GzZbh4bjattUfnAVGHzI/mz6vY1OiDsV9K1CkOplVb
	qdIeNtyZg6Wa/REPErLFX3hB7y6fOdO6taRcJ75GcikuTECiUEy2m63SBZAxMTKMAshK
	Ning==
X-Gm-Message-State: APjAAAX3HK0b8Ljx+qpC5Tyu2akdRfZBhodS6S8yYVCuByW4RI7MDpRb
	wG2vy7oocCSeSuaDxvk8MLdowojrkoltqmrZb9Y=
X-Google-Smtp-Source: APXvYqz/gGqSVoMI35GpwOgZGhJXFUV/UsBPsyimBT16f7e6FansXSXbyZcFkhwnJNypJmjg2Pbm8i+/uq7dOQvOAUQ=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr5135038ljo.87.1567082513818; 
	Thu, 29 Aug 2019 05:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190828201025.35999-1-bruce.ashfield@gmail.com>
	<CANNYZj-tU58835fwd0+YXMY=nfjo-AqbU+M4MCA=odJMm2+xKA@mail.gmail.com>
In-Reply-To: <CANNYZj-tU58835fwd0+YXMY=nfjo-AqbU+M4MCA=odJMm2+xKA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 08:41:42 -0400
Message-ID: <CADkTA4PmwZ_Vb4SKn_aBKhZkjj=vp72O+WgRVmq5h+kL8FZ0yw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Thu, 29 Aug 2019 12:41:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 8:39 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 28 Aug 2019 at 22:10, <bruce.ashfield@gmail.com> wrote:
>>
>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>
>
> The new kernels are missing the drm-bochs tweaks done recently to previous kernels:
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master&id=0e0589f81a66f92519e1fbb0d0ab6db22e0e591e
>
> Perhaps we should put them into a common include?

We could, but I just made my new recipes and completely forgot (human
error). That was the only window that it could happen and there's no
way it would happen again.

Thanks for pointing that out, I'll update the recipes and send them
out with my next version. After everything settled, I can look into
moving them to a feature include.

Bruce

>
> Alex



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

