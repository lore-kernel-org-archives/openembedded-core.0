Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E22507F35A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 09:13:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k2so7966881wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EvkpVLVKI5vglHGFD2EDEow+Id8J4HCEsWXgpzHj7qo=;
	b=O4bL0Y4O7rt/AoLKLq3iArNwfMNBY5I3ArGkgVRUOLVZzA8YLnTPpiG44i9C+6XJB9
	kQ78En28bDlRfuHrZoJIQsntCykWgP4ZWQK8knIvSD/guQalnFTqSwjzgAOoybpa3EvB
	uZIVD6opzAfza9RDYibuMI/R5IpbaIwkAbns8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EvkpVLVKI5vglHGFD2EDEow+Id8J4HCEsWXgpzHj7qo=;
	b=eDG2D5EYstQeSXO168PoueAhWgk3eQBH5JFuqm81Cq3BSC4lmTcVxOfie9Nki6maJE
	/9q43vhVqzTjrMwJX4xNXFtzJ5OupT0TptMarWgMrrUXRAow0ly3TkCq5PhzOy++rstH
	sooh7G7yZ0Fatwwdub7YpLjK+mZJqqjDKRbbN8o2XYY1DvlySvoI104PNJTYz7mf7rR9
	axfrRDcyrsrb/NSKQubPaJlHf5tYxXk1Gu0s9kYNYwaFUNar/b+6qOjvIt3bGOG2Q0Ew
	PolyJI80Z7LlN8VYM/60an5y1jIrsX3aOUiz9a4S/MnDrXqTCMRlPuhp6Jhf3Qt+BMta
	5J0Q==
X-Gm-Message-State: APjAAAX1O0tC13aLGrh8CTjkJR98HXinBoepH2BfzKp5GgNBiWA/v/Lv
	+oQF6hD5X4BLSB50tnB2tfkjUQ==
X-Google-Smtp-Source: APXvYqyPXncLUe01E9xWjCiWAtxHJFkt1Rb6k19rF1tbg5Ax64WydO7idMXkYWf3wAekaMd51uvYHg==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr3483018wrm.295.1566551603481; 
	Fri, 23 Aug 2019 02:13:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a23sm2827788wma.24.2019.08.23.02.13.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 23 Aug 2019 02:13:22 -0700 (PDT)
Message-ID: <a1afd589e5a20fa0fa780b2290e75caedbbf17d8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 10:13:21 +0100
In-Reply-To: <20190820153219.62435-2-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
	<20190820153219.62435-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 02/12] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Fri, 23 Aug 2019 09:13:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-20 at 17:32 +0200, Alexander Kanavin wrote:
> This is the qemu default since qemu 2.2, is generally supported
> better,
> and is recommended by upstream. It also has already been in use for
> arm/risc
> and ovmf.
> 
> Additional information:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466
> https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
> 
> '-vga virtio' emulated hardware remains in use when virgl is enabled
> via a runqemu override.
> 
> Also, adjust the error whitelist, as there is a number of new
> messages
> coming from the drivers that are not actual errors.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/machine/include/qemuboot-mips.inc | 2 +-
>  meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
>  meta/conf/machine/qemux86-64.conf           | 1 +
>  meta/conf/machine/qemux86.conf              | 1 +
>  meta/lib/oeqa/runtime/cases/parselogs.py    | 5 ++++-
>  scripts/runqemu                             | 6 ------
>  6 files changed, 8 insertions(+), 9 deletions(-)

The patches in master-next had some failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/636

I think but am not 100% sure it could from this patch?

Cheers,

Richard


