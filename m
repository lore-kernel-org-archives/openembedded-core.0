Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFE460807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 12:47:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q15so6508256wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=mH8YcU+bYpPH/CkfyuT+UXTaQHe4rBFTth9XeuIgv58=;
	b=IH7Axx3BYd5fu6bSrS4HAWyGH6meAOayMuJ6MHLAQhUkkFbQluF7Ep/Uf8MXZV1Usp
	ooqMV6KYL274QT0IzXL0pi/yrci6DgStlyE4CydzSCCEXqODp+2oy3JLbFkTJAh2/nyg
	Rr2ZRwW3IIt4WUrGdxhjFf6b06zKY4LCWq2YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mH8YcU+bYpPH/CkfyuT+UXTaQHe4rBFTth9XeuIgv58=;
	b=bOM07vabULK70Vh2Wm6Ynbj1QUIyFErW1SfXnszk6P5n+lprtFGV9wzUbx8+YKwOx5
	7K7OyhpNa88FEF9uxYxennnj9cBSPYNEbwWGMzdt+D2DeiNOi4U6pBwTHrcVdYB0V3YI
	RenuFEGhpHLIGlzv8GMjp9Xa81yQE43U4uZeZw3vnt6SVzTFG4C4P3Rax5QDHLIWVGhW
	ncB1BmQnXtuznTw6BlSkluQLs8zA8O1JFBrC1Zphg9ze8sVk0dzupxbVlgPbj3klA9aF
	hK///EC1NlZMcnYyhRI7wz1vZeGu7DvPlfaWfyWgGY20vMmNHGJFglQHxnmwH5JiWB0r
	O20Q==
X-Gm-Message-State: APjAAAXRDk3FLdOBYQnbwdsWNDOWKoKYcWLNvprH4l0uAsa/316SZKtl
	qGt0WkXwvklSebTM9tmvCvQHNw==
X-Google-Smtp-Source: APXvYqzccFAu9tqaYWqSXixa5ZhYSVe3ZyeUoQdszg8I50JOWjq5Cp3NYsrSur7M3jTqDRFqLQJL0w==
X-Received: by 2002:a5d:6a8c:: with SMTP id s12mr24054544wru.353.1574081257081;
	Mon, 18 Nov 2019 04:47:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y8sm19265754wmi.9.2019.11.18.04.47.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 04:47:36 -0800 (PST)
Message-ID: <bdfd84b9e6a9171b4a8eb9b3e81e4f5b96f0b83f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hs@denx.de, openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 12:47:34 +0000
In-Reply-To: <140626d6-0890-c2e1-0425-9e7e7a1a5fc3@denx.de>
References: <20190920042112.14832-1-hs@denx.de>
	<09ae8961-2b77-b38f-374b-a1f1c9ee8d5e@denx.de>
	<140626d6-0890-c2e1-0425-9e7e7a1a5fc3@denx.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v2] kernel.fitimage.bbclass: remove ramdisk_ctype
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
X-List-Received-Date: Mon, 18 Nov 2019 12:47:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-18 at 09:51 +0100, Heiko Schocher wrote:
> Hello all,
> 
> Am 07.10.2019 um 15:42 schrieb Heiko Schocher:
> > Hello all,
> > 
> > Am 20.09.2019 um 06:21 schrieb Heiko Schocher:
> > > set in the ramdisk node the compression property
> > > always to "none", as U-Boot nowadays since commit:
> > > 
> > > b1307f884a91 ("fit: Support compression for non-kernel components
> > > (e.g. FDT)")
> > > 
> > > decompress non kernel components. Setting compression
> > > to the used comression algorithm now, will end in
> > > fail of your kernel boot with the ramdisk.
> > > 
> > > This issue is fixed since commit:
> > > 
> > > bddd98573465 ("fit: Do not automatically decompress ramdisk
> > > images")
> > > 
> > > which now prints a warning in U-Boot, instead of decompressing
> > > the ramdisk, but we should setup compression property correct.
> > > 
> > > Signed-off-by: Heiko Schocher <hs@denx.de>
> > > ---
> > > 
> > > Changes in v2:
> > > - resend patch to  openembedded-core@lists.openembedded.org
> > > instead
> > >    to Yocto Project <yocto@yoctoproject.org> as Ross suggested.
> > > No
> > >    changes in code.
> > 
> > gentle ping. Any comments?
> 
> gentle ping ...

It merged 7 days after you sent it back in September:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2c58079222310443f08df51e9fd6ce234e7e0019

Cheers,

Richard



