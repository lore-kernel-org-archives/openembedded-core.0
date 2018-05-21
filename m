Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id E180774DAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 06:07:23 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id h8-v6so15639517otb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ecSqfc3M+ekWeNdFiU169avABfU40DI1VGJWlCGF+PY=;
	b=GltkUi2dgmn/9OECZWyDn36xat6z+9h1Y8UIj+OQ1eVFssXcbMRX5eqykm3j7jHDQO
	8zYOqAIF1zK4kMBBiY/Ha69MN95rZSgLIOGHK96H6kaNyX/SM6PQ/PWb6ZR2yjEzeq4Z
	KPGyJLi45OMlVZWe6U9ufahknVGsAdSoo9XbPhWM6U6gO6pVRGdG7NxSjog6uIpl2RiK
	/YIp9uImFThMWBOiGHeX3fYWUGkpiSXuUVM0tFCKl2r7oztjRbXqUnP3cKIE8cmRhgAT
	mcq8RfqJErWRx1DGw9t+rXsryARYUyzi53fyuZC0AxhDquuB1Q65VzaPwIBHlzYQbHxY
	K6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ecSqfc3M+ekWeNdFiU169avABfU40DI1VGJWlCGF+PY=;
	b=m1CdzjlXFFqtY0PFZm+pFBX31M0riF9MgpzIzUJmDmLrJ6l8ta+nwYl4jwH6bT7jXj
	6osN/IAIvsChks4HRpUqPC6ZCJWAzfjejrap5dJLSre2S1X/v306adhERhVgc6bppZU0
	0GRJ6+/zzs+VdSX5YfG+5Cj6F36bsbcuAtR8gpKKk9CC6exix513dF6pijYvnC4O5veI
	RCehaDpoz1DKNIQQ/BIUZofN8pksvuV0N1HUvWSVu6u8NL0CBKi56Xbt0I38/m5A2hOm
	XGucG47UBqHKDt2LuqJBglTYvY+U4Y7l3UErznW7/TihyYQ3v0R+FRjhvG5tScnxC1wK
	LfKA==
X-Gm-Message-State: ALKqPwfETkjuSv8Hdz77L/dz0MyddHUAq3wBSW/tj7otTrp5fr1FGpAZ
	637B13FQr7qCTK4GUwF5+eSX5eXvBaMe6ju1B1A=
X-Google-Smtp-Source: AB8JxZoYmvwv/uk11sCaeb062/+W1S3bNBb/AFoajDsiPkMlpmkyjjoDl7MqwSsnu6ot8nRGEJuxL3l+CEixS7EMxJU=
X-Received: by 2002:a9d:336c:: with SMTP id
	u41-v6mr11684852otd.259.1526882844663; 
	Sun, 20 May 2018 23:07:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.11.23 with HTTP; Sun, 20 May 2018 23:07:24 -0700 (PDT)
In-Reply-To: <20180520220442.16092-2-raj.khem@gmail.com>
References: <20180520220442.16092-1-raj.khem@gmail.com>
	<20180520220442.16092-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 May 2018 09:07:24 +0300
Message-ID: <CANNYZj8nv6EDkp46yJjxqBQs3jRZcTFeP19e5uKA_ye0a0JH6A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Mon, 21 May 2018 06:07:24 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-21 1:04 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
> +Subject: [PATCH] soup: Forward declare URL class
> +
> +This helps getting away with compiler errors seen with clang
> +
> +/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
> +error: unknown type name 'URL'
> +    static std::optional<ResourceError> checkTLSErrors(const URL&,
> +GTlsCertificate*, GTlsCertificateFlags);

Thanks - gcc has the same issue. I'm not sure how upstream is able to build.

> -EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
> +#EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "

This needs a comment or should be removed altogether.

Alex

