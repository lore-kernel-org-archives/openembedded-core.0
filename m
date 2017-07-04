Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 62F3477BC8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 22:08:01 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 62so206590381wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=CEfqNCz/sfjzcrHwhYWfiXt7g+YyC5oV6F43gSYL4ik=;
	b=vkcacmpDpMpFk10NQl1Fm0O2NTPIWhDcwebD58qlYFYRTvpT+rtLyJHVQdU9LXjPC3
	IJGd5ebVWNC9aoU/zFMJG0TWdMbiqE7gnYar7NshBYky8h0xAKQDP2ftOvvdqy9SjiGR
	1MAqX4Cs1kNdG9+g9j8h3DpAIMbGySgxq62vOajVucNYpeL2xAK4EiO7+QbJAluf70Y3
	2cjwNAsWZccw2jkENArbDuTltLETJi/VmSAtp3f/LykVZNvhE9N5VJraiD0S2W+vT4H6
	B2jJI8NoNVFi9lRABiPpQ0R8sVWZ8ucF8wjT7GuhmfyuLSvI5O/36EAN8jQfpFihY3Bm
	rh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=CEfqNCz/sfjzcrHwhYWfiXt7g+YyC5oV6F43gSYL4ik=;
	b=uFF/yztgrCrqErTvC9VWm8d0x0iuka6UkRTKVr1VNa+3A2rfPvnqpszFWQohTPGSS3
	Rakk4m7YMjqSJxuEhG7wtgJN+LBxHWSwTYL11CUeSpYjAR13peh7ACYaHOeo6nX4B1UV
	AOnRMFm3fsx9n0eRcr4bA0gEG93pDxWmAp5dyPKQX8woz6V8eeSLNhpr8L1E6eY+NBX7
	qncizD5YM7Cy1LcSkPXLkRGtpzbF9ge2Sie73Sj/rZoX+QRpRtwg9ySCvEd9Z35zzck0
	MxH7KMKMOmU2Q0OBDajqLQTyQQhZTX73qObb5MTSviynev00fp4KGQgEz9ztJeES0/Sr
	NuFw==
X-Gm-Message-State: AIVw112HI7rrC9BcVcQ+nC7dP3cCzcEbzwRmz3ZDorIPhKhnLKdy+7Ce
	pnVhbGOW0l6KxwWQvxw=
X-Received: by 10.28.186.65 with SMTP id k62mr6817513wmf.34.1499206082145;
	Tue, 04 Jul 2017 15:08:02 -0700 (PDT)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com.
	[209.85.128.180]) by smtp.gmail.com with ESMTPSA id
	t204sm12510062wme.2.2017.07.04.15.08.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 15:08:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f180.google.com with SMTP id k67so253816040wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:08:01 -0700 (PDT)
X-Received: by 10.223.163.197 with SMTP id m5mr36402389wrb.128.1499206080912; 
	Tue, 04 Jul 2017 15:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Tue, 4 Jul 2017 15:08:00 -0700 (PDT)
In-Reply-To: <20170704153229.6628-1-sledz@dresearch-fe.de>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
Date: Tue, 4 Jul 2017 19:08:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
Message-ID: <CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Tue, 04 Jul 2017 22:08:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2017 at 12:32 PM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> From: Max Krummenacher <max.oss.09@gmail.com>
>
> If building for nativesdk the wrong rss sysroot is used leading the
> following error message.
>
> | ERROR: oe_runmake failed
> | In file included from tools/imximage.c:13:0:
> | include/image.h:1024:27: fatal error: openssl/evp.h: No such file or directory
> |  # include  <openssl/evp.h>
>
> Tools needed on the build host (script/basic/fixdep) and code compiled
> for the SDK machine are both built with the build host's compiler,
> leading to additinal errors.
>
> Adding CROSS_COMPILE="${HOST_PREFIX}" and using the cross-compiler for
> the SDK_ARCH fixes the build error.
> The resulting binary in the SDK is working.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross, please apply it as it has been causing problems for many users.
It is applied in master
OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

