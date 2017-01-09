Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0F7171ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:43:07 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id 23so1099495vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2RPHUbNA5O+NSFB7OzQ/g2NkdDcI0KLHUDCg1WhYVok=;
	b=aDCFdTQegKBZM1OGsJIBN22HAN215w5HUz/XmIKco2KQWCAtRjByV8/7qQa3EmPwxY
	+bH1LdWwEYFdu6d5NN9rIN3brJ7VwD6iIr29z5WxaI6sryujzWc5zglXMjrdUAP1uEYg
	cYvVRcXL2CgY/JtCioMnIh6jPF4Z65PvMlre7jQMsJIzRmWN7Po+zCPPHhesLLXmVATW
	PFE2VG/X4FwHtLGDS95hQqzrgDrMISGprzTmLkHAeNdXBoCQJUl8HNStagRqnEPsMFph
	g0JLjqHxwdbwxYsCVg83bW/WmgPRV/2Dm4xCPjVGM6ZoxR7R2B1yP/fZmRUx15f3Hkd3
	QzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2RPHUbNA5O+NSFB7OzQ/g2NkdDcI0KLHUDCg1WhYVok=;
	b=oU/vwg3Gi10O7PTg5kBLAzaa6IS8pMk+J5ilPzP2hc+05LTfSVp+o6OqNSAUczsXD1
	UG4DTQXcPlU1iRzpEHIKxMcnX7cPe7RX2uAsX90ltNwVRs4DrE84ZoqHLmLwVsRiKH4+
	EcTkGKUJHvlojprYvpadJ577HXlaC3ASo3rMIhYqTp5hKd62mDxvQOeMsrvFnm1bCnUJ
	zD9glGkEsZjADaISrcXWo2Z2XNdfuReJHpL81oezLTqGuou6fLI1imADIKQDfPVG0iDl
	lU6gH8ugfzkEZjaoOGf2glXR4aOqivlZq+9lCb0TwrhUkgpt+gmQNVz4ehn5u/VWzatg
	Ch+w==
X-Gm-Message-State: AIkVDXIpPPfk+tSH2BawD8qght84teVG3psqcy6wkkTNRdQeyp6i71uINle83+0D8Jtkzscc6SZ08Ggg1KSl3Q==
X-Received: by 10.31.28.193 with SMTP id c184mr5190053vkc.173.1483987388086;
	Mon, 09 Jan 2017 10:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 9 Jan 2017 10:42:37 -0800 (PST)
In-Reply-To: <CAB2FcVAqq6UeLXu-=9fR+pO2MYSamLXmUSSbSO6==9dMf9BKMw@mail.gmail.com>
References: <CAB2FcVAqq6UeLXu-=9fR+pO2MYSamLXmUSSbSO6==9dMf9BKMw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2017 10:42:37 -0800
Message-ID: <CAMKF1sqOXmxZRvFWzCW_JeBHZvO6svsDCNvt--dRmoLrbU=J0w@mail.gmail.com>
To: Kiran Pradeep <kiran.happy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: enabling gccgo( not gc )
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
X-List-Received-Date: Mon, 09 Jan 2017 18:43:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2017 at 10:49 AM, Kiran Pradeep <kiran.happy@gmail.com> wrote:
> Hi,
>
> I uses recipes for gcc 4.9.1 and need to enable support for gccgo compiler.
> To layers/oe-core/meta/recipes-devtools/gcc/gcc-configure-common.inc, I
> added
> LANGUAGES ?= "c,go,c++${FORTRAN}${JAVA}"
>
> That helps me build the gccgo compiler. The resulting toolchain contains
> cross compilers for c and c++. But gccgo is *not* shipped as part of
> resulting toolchain.  I also get a warning as below
>
> WARNING: QA Issue: gcc: Files/directories were installed but not shipped
> /usr/lib/gcc/gcc/i586-unknown-linux/4.9.1/go1 [installed-vs-shipped]
>

This needs to be added to some package

> There is a patch for enabling gccgo in
> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078606.html.
> But that is mentioned not to support gcc 4.8 and got ignored for reasons
> unknown. How to enable cross compiled gccgo( *not* gc compiler ) in
> toolchain ?

We dont support 4.8 anymore. Could you refresh that patch for current
master and repost ?

>
> Thanks,
> Kiran.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

