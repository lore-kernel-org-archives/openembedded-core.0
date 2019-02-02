Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6247C48B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 08:43:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g67so8418025wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=v+0LrVKovM/HewP9NJli9xTH8581D0CNjIbdd8jylZw=;
	b=NJbF/YKIKF4LNxQY2NlJw2qoJpyPdklL3S5WQNMqhyD/C7Rxuh4mdoGoV94kHyabsd
	TzUiEPRle2+QAB9xhXSUVg67V4K2ITvj8tZyODsYJudMD0iYumXpL2Y7dMfC5BL0HZNN
	FMglMhRwqD+f34u2W1/sagbavojolehqp5u80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=v+0LrVKovM/HewP9NJli9xTH8581D0CNjIbdd8jylZw=;
	b=elnMJ+CbjolQZuLxNN4PDIBv2uHsh7U1AyGuuyTG6TJ85q3EVlYIMFP47gKyTR8qjj
	N1SH3HE8I86CWwaikEs59kr8w7LzCpjRtHZKrAfGcu+y4/cgCD0ide/gobWd9nrBPguY
	lOvuLRBv8pLbdagNLOI6LuWRF84+P0bktm1UJUTL4vI/BBzFr8a7MJrlP2dGo1pC6yyN
	mkwPsoWkJVjjn+ldJC7Qv/212Y07Bg07Xj0rdQPUdlT2tp+r+WyzjNml3J9Z3U5NYVUo
	tSNUMcCzP5/Kug5u1vFa+Ab4Kzn8K6ElF5O5slWSyBF7O7zX0VNJOCHkVNFVYFyWdoqJ
	5V4A==
X-Gm-Message-State: AHQUAuZwUF3yTfPdUXv+YNuszFS0ogKmPpzmeywtp4dlIaIGmlHX2aiP
	pWPHo+ewAonP0UxVoL7nzutfvA==
X-Google-Smtp-Source: AHgI3IYHFdk4APQF5jO1939kX4Gp37TI9Ikp8epAu7u+tEEsejh+iBkD3vaXuMZz7I9luYc5V7qUtw==
X-Received: by 2002:a1c:a6c2:: with SMTP id p185mr5070680wme.133.1549096990029;
	Sat, 02 Feb 2019 00:43:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c9sm276044wrs.84.2019.02.02.00.43.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Feb 2019 00:43:09 -0800 (PST)
Message-ID: <5823863d849da95bcc1368b60a64ca8f39cff3eb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 02 Feb 2019 08:43:07 +0000
In-Reply-To: <20190201151929.27893-1-raj.khem@gmail.com>
References: <20190201151929.27893-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] mesa: Up the llvm release to 8.0
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
X-List-Received-Date: Sat, 02 Feb 2019 08:43:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-01 at 07:19 -0800, Khem Raj wrote:
> Needs to happen along with llvm upgrade always
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index e96a12c1b9..66ed649efe 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -105,7 +105,7 @@ GALLIUMDRIVERS_append = ",virgl"
>  
>  # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
>  PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
> -MESA_LLVM_RELEASE ?= "6.0"
> +MESA_LLVM_RELEASE ?= "8.0"
>  PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>  export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"

There is something still not right with llvm/mesa:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/251/steps/7/logs/step8b

Cheers,

Richard


