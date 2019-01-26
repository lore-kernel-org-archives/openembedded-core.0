Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 233987C423
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 23:27:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r10so13996243wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 15:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=DH5lY7V8wAsXWxIId8avQG3IzZHuKIz+3dgH+FT8dhA=;
	b=a4oo0nBjYDKYTkcoHgACDPwBgbQHI+bQNT3PkACC2v8ZFqx70mzThBi5cC5xmK4hwW
	fZt8c8MadY4MEDy4Kc3/8pGOhjFb4o1quU7riHKsUXjvqb3t9k4PmJOHoyNx1ACQajQ8
	eLOA39Id3yaumVSLX1SwmYwlYhj9a3+t60Lws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DH5lY7V8wAsXWxIId8avQG3IzZHuKIz+3dgH+FT8dhA=;
	b=RmIJNfU7JhZXQLOfy61yTTbGLgx/JKxVmp1UUEEFjrJ4j92LiDa+rV5BhguB6ERQT1
	IiDYbrXDGB5Gla3xa1JVpMDfiL+5s4x9zIvEfKDH1YehjjJlX5B0rL4vfNa/kuS+E6Oq
	2xHQZV7Ux9I0yjRoNh1yk3PhN64Y8EvV1vBbdeqxxnIr1qz4nNzfxJQX6Gr3qJo5KH6L
	U/n4BIfixGfcx60GGrHvA+ERXKRm7HGBDv5BTqYzwSxXaSVKS0IVeylbsElBzXN6hsnK
	VmM+CXsDuac5GVnpz6SVnmnWmPtU3qPO6nitostk4ycXDI3PWMX+opXYWQkwlvd/lHoj
	FF5w==
X-Gm-Message-State: AJcUukcVKmjnN2ms24F0VV2R2TYyEjVeP8tqmnhWpX7BLY/WcVRDIxug
	yCkgDi9gPWqlLUbRdiphfSrKYw==
X-Google-Smtp-Source: ALg8bN70LBo5STZgXr59ULIdTvvbPw7MPKrdZzKmubeG/MaEKMq02i+8+6PeDzIy3gnKDquOwOHluQ==
X-Received: by 2002:a05:6000:1287:: with SMTP id
	f7mr17018479wrx.302.1548545245418; 
	Sat, 26 Jan 2019 15:27:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	198sm122234248wmt.36.2019.01.26.15.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 26 Jan 2019 15:27:24 -0800 (PST)
Message-ID: <30ebcccb5a7b406952657c5c6d031640e5f60a0a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 26 Jan 2019 23:27:23 +0000
In-Reply-To: <20190124223528.17455-1-alistair.francis@wdc.com>
References: <20190124223528.17455-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] lubusb1: Add udev support
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
X-List-Received-Date: Sat, 26 Jan 2019 23:27:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 22:35 +0000, Alistair Francis wrote:
> I don't see circular dependencies anymore between libusb1 and udev,
> so
> enable udev support for libusb1.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> index 0c6e116dd7..35c1d705b6 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> @@ -20,9 +20,10 @@ S = "${WORKDIR}/libusb-${PV}"
>  
>  inherit autotools pkgconfig ptest
>  
> -# Don't configure udev by default since it will cause a circular
> -# dependecy with udev package, which depends on libusb
> -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> +PACKAGECONFIG ??= "udev"
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> +
> +EXTRA_OECONF = "--libdir=${base_libdir}"

Fails in testing with:

WARNING: Nothing PROVIDES 'nativesdk-udev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'udev-native' (but virtual:native:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing RPROVIDES 'nativesdk-libusb1-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-libusb1' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb RDEPENDS on or otherwise requires it)

Before someone sends a patch creating a nativesdk-udev please think
very carefully about whether a nativesdk-udev makes sense and what it
may need to look like.

Cheers,

Richard



