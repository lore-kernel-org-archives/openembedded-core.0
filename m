Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id D343C600BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 21:31:49 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f55so46769402qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l9vRq+8NgWY61gpd/wMAoWdyzvCRSvPEQN0PqLIRxRk=;
	b=VhrNNXs2RLCGvT/vQMG6JylMQWlN4qtoz7tPdZwFu+M5tg9T9hxaWTH2ytm9AHq6jJ
	WShXmhRJSVs39sqEkWaR+noqZy5SjQ8FVbJaj7TW5INYADqgBYHHJWck0iD+DtM9HvBG
	gnRMk3LkshKf3sN5NxFERULYQuUMiVcIoTZIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l9vRq+8NgWY61gpd/wMAoWdyzvCRSvPEQN0PqLIRxRk=;
	b=TzPDYnyjMlO/D8At8h2eiigJgh5efcUjVmBuYRQr6iX0YZY2bLhLeDg4BajZPDbh6O
	jR5FadKLGs/xvwhiheFohvkwWKDFLm1+JJcC/pSUGlEEGTY1r2rPfpehj5W7Y7Hjes+E
	mX7sq9tjsICVGNjRKgYBiJWHqfkms3F/nMfa78SlZDJfx3/5H9NpjhpJ71fDODKQs0Hv
	bJAjcrFMnmHyA0n/d9BGEGI2Qm1KgcroUiCuIgTfd43bvLwmCCfPcTNYdj3fCOrP6Cj1
	mGV998dSf1zDWDsLZa2fJMCAlSY6M5rZhZaixbnSx9J4j/GDuPchrHEFU8E30zIuC+xz
	nrUQ==
X-Gm-Message-State: AODbwcAHGPi8GNgZ6oyL4Wcw8GlSG6782UvAIQmg0x9CWkw/qQ2rmYaA
	EnpR6LZhWMWHWwpt3q+1xxrsj6D6q9RE
X-Received: by 10.200.34.132 with SMTP id f4mr4529560qta.183.1496352710813;
	Thu, 01 Jun 2017 14:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Thu, 1 Jun 2017 14:31:30 -0700 (PDT)
In-Reply-To: <CAJ86T=VpTJSAcHdwGC04AsF8hKexk8VRV8LPCQdTaEo=2c1d7g@mail.gmail.com>
References: <20170601092108.9544-1-nicolas.dechesne@linaro.org>
	<CAJ86T=VpTJSAcHdwGC04AsF8hKexk8VRV8LPCQdTaEo=2c1d7g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 1 Jun 2017 23:31:30 +0200
Message-ID: <CAP71Wjy6Yf4e0xGsXSwpyQuc1w=RnJktkY9n0HJGjjE8OFzocg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
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
X-List-Received-Date: Thu, 01 Jun 2017 21:31:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> You could use types.replace('vmlinux.gz', 'vmlinux') here (and then
> drop the "import re"). Also, if vmlinux.gz is the only special case
> being supported, then the kernel_do_compile() can be simplified too
> (see the patch I sent yesterday).

yes, you're right. that change seems like an improvement. i will test
it out and resend..

