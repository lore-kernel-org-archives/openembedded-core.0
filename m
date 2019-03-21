Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id CADB86067C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 11:44:14 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id q16so2364138wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=wsqZ+Gkt41x6fPT/Ahb2+hnzALIY/979ZuVBgEPfP00=;
	b=Mo5e4ORj62AVCKaGNddiHLYR4Q73bBpbDEffhoLOBcbbpi+H9gD3uBkDIjmQ7R52C1
	EYyyzw9WREPU/SlhmqWCMoX3KuCBswSLOgK8o0wJNloHU1wmyB9xRZ2iQIK/64Ejrmo1
	KkC2u8Ih0BIPfsJt3Wce5d/mRY1DiMY5CXVns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wsqZ+Gkt41x6fPT/Ahb2+hnzALIY/979ZuVBgEPfP00=;
	b=sMg4HfS9+NIaqnzbSwQS5s/MCbvzI0BiQuLln6JheAILWGVDAAoJjb/yASL/epe1Ia
	+Wmoh3dZ9rPuwvrihGyWUMobOf6dle1jbwz8M3Ia4hLjW3SGzGoprk42Ah14fFUtZbL8
	2ar9zvhD+5QNWKiZbACR2xN5MwvdJtvSy7sJeDgPGt21JG3GfbeusDDbc98mtUjEp0ZL
	JXGCYuBnJfM9kqiLdoZ/ZP9azg2V+shkhARN8m1/bZ9EgUNKFVT8UqDFduuC285CUq/c
	qocANlfgx2jDhsRK1iM//v71Vk148MH40azGHZGCgYvtErZ2Y1AxL9s4rE9GK2EkHncf
	k5eg==
X-Gm-Message-State: APjAAAVqvoEbstqxDjC/QmxHQWGxdJGCF7mnS7at8TFD3W4U4hsfrSQs
	L5JBwoDpozXHSwmpDm40xtfQHg==
X-Google-Smtp-Source: APXvYqwQvmvKiqaCYdwq7fM3DI42AbPh2KGQKMZscpr82CJ8rVFs5Pm1VtuBtaK0kv6rfXitHIdy5Q==
X-Received: by 2002:a1c:d189:: with SMTP id i131mr2206459wmg.151.1553168655473;
	Thu, 21 Mar 2019 04:44:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a130sm6660064wma.14.2019.03.21.04.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 04:44:14 -0700 (PDT)
Message-ID: <6b2ad2e463f5ba0f3513e6d9755aa755828686e4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 11:44:13 +0000
In-Reply-To: <20190319181544.314-1-luca.boccassi@gmail.com>
References: <20190319181544.314-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Thu, 21 Mar 2019 11:44:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-19 at 18:15 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Dumpimage and fit_check_sign can be used to extract kernel and
> ramdisk from
> a FIT file, verify them and kexec for a faster reboot.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> index ff26e32482..c487849bb2 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> @@ -45,6 +45,14 @@ do_install () {
>  	# mkenvimage
>  	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
>  	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> +
> +	# dumpimage
> +	install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
> +	ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
> +
> +	# fit_check_sign
> +	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-
> fit_check_sign
> +	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
>  }
>  
>  ALLOW_EMPTY_${PN} = "1"


Fails on musl:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/420
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/421
no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/419
qemux86-world:
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/412

so basically it looks like any world build fails with this.

Cheers,

Richard



