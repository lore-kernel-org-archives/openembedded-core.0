Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 43F307971C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 04:54:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id l14-v6so6355054iob.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 21:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Iy2g5Mp08PD2p0ZFfzpMZfgHkQ0wjJRrARMxTaYvU1U=;
	b=hQbIKDtKmV5ofYdQQ25pGnS+ag+yfh3VtxNI5t+6EGNv89i7jDm/ik1qirDol60NNa
	5B/KKNR98oU4L28XBVaBmg6Zd5GWsZ0DZ6l94WDrMXRgFuDWWOh0/7Bis6t/0HQsQFEr
	HPA+z7XNhkZuNoLTXGs8SBUTDaKgcZQp6sujE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Iy2g5Mp08PD2p0ZFfzpMZfgHkQ0wjJRrARMxTaYvU1U=;
	b=oy8GjyLT8F+wWKu8VqsAtb0+0Gj91uGdsxaefMzQQS46i3LIFXWHRLoDSAGryHVxoE
	n19ye7UlqbswuocOrV/EBZ4kW2V5VrH9/B5c+5lK2twcdlU2mKuXyCWy5weyQZvey67D
	aGPEQp0ybI6AmAcKneyasAU6JVxxM9ORZ0tXRIsrxmOlrKddP+9uAsyPdqf51yo2WjBZ
	KKlAvNmZ5/+io8Ez3o0av7Gt1/4REQJOJQ7YIPHBv+7QPS4UBjwANLWxiiXHVvPGbwAy
	ZGf/EZQskUfHZ+9qfZpr2PaZZKi0LfPneqGy2/g4ePalO7HqFGyLr9WiCP4RFxM5v/hO
	l+bw==
X-Gm-Message-State: APzg51AQ3v9vgrxyxZX9HQmfX6fM11howU19Xc3t7cwM88ykm9kMFkpC
	pi+euTHdmG8vBFDil7ae0kEWlA==
X-Google-Smtp-Source: ANB0VdbM09VZWRFRqCh6+3tNC5cYR1/eckGbHdOAo7w0bOg4QjBKxvwRsF8IRhjeC1hHW8kLxizl0g==
X-Received: by 2002:a6b:5f03:: with SMTP id
	t3-v6mr34377584iob.242.1537419269228; 
	Wed, 19 Sep 2018 21:54:29 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	i129-v6sm452313ita.12.2018.09.19.21.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Sep 2018 21:54:28 -0700 (PDT)
Message-ID: <3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 21:54:25 -0700
In-Reply-To: <526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 04:54:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
> I will fix it as my top priority today.
> 
> Reproduce steps:
> 
> - Build core-image-sato-sdk on qemuarm64
> - Run qemu
> - Log over ssh (openssh) failed
> 

I did have a little bit of a look at this. It seems to hang during key
generation before starting the server during boot.

I had a suspicion that the problem could be a lack of entropy. We're
supposed to have the virtio entropy generation being passed through
from the host to avoid problems with entropy starvation but I'm not
sure its running for arm64.

I noticed the .config shows CONFIG_CRYPTO_DEV_VIRTIO=m but setting that
to =y didn't help. The virtio rng connects via pci bus iirc and
CONFIG_PCI isn't set so I'm now looking into that...

To update, adding this config to the kernel:

CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_PCI=y
CONFIG_PCI_HOST_GENERIC=y

appears to solve the problem and lets my simple tests work. I'll have
to run some better tests but I think this is the problem, lack pci
support in the kernel meaning the rng virtio passthrough doesn't work.

Cheers,

Richard







