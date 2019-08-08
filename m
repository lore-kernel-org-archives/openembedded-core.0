Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC52F7F3BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 22:01:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r3so2624510wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ICMGwD0ZHmGWewTzDOMqrhdaX03UewejcksuNxt7BTo=;
	b=XSkTlm8mHzxMaQyag/3uDeqq/PHb1Y6OFZdtDZoeTlF9/vVjarNEkPwJieN5GNUNnD
	GjChkMkii4SFJtGqVa1JHA0Shwahj8uolVdJwevpwPHc48IWPif9PCAJmktzHnhaeWiW
	lNjGc4SqN8Sy+cUcfP50sdLkWtsP1GJvRTMBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ICMGwD0ZHmGWewTzDOMqrhdaX03UewejcksuNxt7BTo=;
	b=GWVA0s/zoSpZMRazAajNBB/irMQQCW1Yu4DlJszIBmyjCkNg9/EC8HB1WVLq1PYl9H
	IXjzEWZ/rC6uvJua4YY2FhJtu1g/F4rYEwDgGHDfJurCEIMh5RhrAcoB+2qhY/THXKlN
	Eo7Ahhfzxoimn2NA0Jqq3TpTKXAaf52VFz8C9MUC3XOx63AQyMk/uByn9x1ZS+h1jk6l
	4ETRU3cN4GgNYqCYrkbzAIfulU1KvsLmlsVveFuOKijD/f9JSHM9BHVI53S2YU7HUIkt
	I/1dsp8LRwT7fVsSavZyKnGmBYxhp39JSrVvE1fgA1G66MASGtkrh7Rl69Kc6qnbYOfm
	Kg/Q==
X-Gm-Message-State: APjAAAW1da0hlNeGtC4vsKRIXRD6K+cgzwouGhJljGHEQmHkVZk5m4zu
	Y1f4Qh4hpv0jy1WTPi84ZQRZlw==
X-Google-Smtp-Source: APXvYqz/WdChSv7z8t7rqscTjdkXtEms/uTp995u4Or7peRaWVA/VLBb+smIVEG3zMAntfJOkpvH1w==
X-Received: by 2002:adf:e483:: with SMTP id i3mr19831350wrm.210.1565301706465; 
	Thu, 08 Aug 2019 15:01:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o3sm84124989wrs.59.2019.08.08.15.01.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 15:01:45 -0700 (PDT)
Message-ID: <44406cccd7869fa9f6fb54577c87f31b1eedd3a6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Aug 2019 23:01:44 +0100
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] gcc-cross-canadian: add missing runtime dependencies
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
X-List-Received-Date: Thu, 08 Aug 2019 22:01:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-08 at 18:11 +0200, Alexander Kanavin wrote:
> The recipe is special in that it does not auto-detect them
> at packaging step (via EXCLUDE_FROM_SHLIBS). With the recursive
> RDEPENDS qa check gone they need to be listed explicitly.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 807e47e0ee2..44d8ea87be1 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -152,7 +152,7 @@ do_install () {
>  
>  ELFUTILS = "nativesdk-elfutils"
>  DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
> -RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
> +RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-glibc nativesdk-libgcc nativesdk-libstdc++ nativesdk-zlib nativesdk-gmp"
>  
>  SYSTEMHEADERS = "${target_includedir}/"
>  SYSTEMLIBS = "${target_base_libdir}/"

This unfortunately breaks mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/908

I'm kind of curious why we can't use shlibs but I'm also not sure I
want to know :/

Cheers,

Richard


