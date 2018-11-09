Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB37E6C239
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:50:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y3-v6so3442872wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 14:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YT7M28SJ76KuB81VeyosxG4446xZmpM6ordSHzBGqJA=;
	b=f8ypY5TkNpHVQkE8aUl3bneqlyJArPrrfroNkHduBm3r0G5We05yocVsZWasbjVw+d
	lm3rs71XoVvRXs106bPSiH2am4MrLSI7Pcy/vvV0TKLZbCwitX77gOpeHJS0JQ1i432d
	ZswXDpDk41lwEgk+C+H0TxmyYJYOkK1jlGwXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YT7M28SJ76KuB81VeyosxG4446xZmpM6ordSHzBGqJA=;
	b=mQ8wssiMcs4OQWv2dx+svPMjZ74/GX+vwL2yDEqer3NOuySJfYO03+fHi3HVBUPR5i
	3VlaZBwzW67vXtsyL18D30MJ0zMwIX0qta9w1t6U5z/INhCY7p1PgFimhveuqAlF9JMz
	t8hNhB8ZbNMSdOmJtyFfcYn1lfiZeCByJXV0PFvmnLuJctbn5MTbmmDMsr1rEmORHHVG
	sKZPL4TZif8mFwRtNG75aVUEyi0m5zq6+bsUe3UWVTqZeT7nqdiDuvrHJ1kRAQVaHPvK
	S64uGElteKI6fIVsNxXmHI8tsUoUhI51+8BWY9ZeysacYktUtYQILjZm8rSaQPQrBoy+
	6Uug==
X-Gm-Message-State: AGRZ1gJ1N/OuR3TQwX/j1qYwy++igwFn6W21eEiITDTqMxMghu0NNv1T
	qrDFq3w7Zcd76EntkhB3plq0rg==
X-Google-Smtp-Source: AJdET5cHuLGsnrAyeEDK4qRVgygSmQNo9dk0MIqNg0yqxs/FzTTLniaVHqY+4TlujKRKs+MltvinUw==
X-Received: by 2002:adf:fe05:: with SMTP id
	n5-v6mr9475586wrr.116.1541803822272; 
	Fri, 09 Nov 2018 14:50:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o81-v6sm3051197wmo.38.2018.11.09.14.50.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Nov 2018 14:50:21 -0800 (PST)
Message-ID: <5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Nov 2018 22:50:19 +0000
In-Reply-To: <c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Fri, 09 Nov 2018 22:50:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-09 at 17:12 +0800, Hongxu Jia wrote:
> -PACKAGECONFIG = "libgcrypt"
> +PACKAGECONFIG ??= "libgcrypt libjitterentropy"
>  PACKAGECONFIG_libc-musl = "libargp"
>  PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
>  PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
> +PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterntropy,libjitterentropy"
> +
> +# Refer autogen.sh in rng-tools
> +do_configure_prepend() {
> +    cp ${S}/README.md ${S}/README
> +}
>  
>  do_install_append() {
>      # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.

This fails on musl, likely as the libc-musl override wasn't tweaked. It
also means that the no libjitterentropy case wasn't tested as there is
a typo likely causing this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/11/builds/190/steps/7/logs/step1b

There are also other weird hangs being observed on the autobuilder
after these changes. I can't prove its this patchset but I am
suspicious and its something in master-next as things were working just
fine until we started poking around all this again :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio


Cheers,

Richard




