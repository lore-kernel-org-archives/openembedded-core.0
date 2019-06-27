Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 83D627E3B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 22:11:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p184so1895609pfp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Qi4hQL+3yK6hkkl1oEJhyuR4GY5tFyoxjVo+XnXTHw0=;
	b=a9K05Mq1Oi33IZ1u2/658rr3XwqunjoYlD4yYi1KqE+UUpAob2Edkb9AeJZgC5jAyR
	kKNZ+QGdKK0ibxsH4qsnGqVgrV/8CA6bEI74p/owYtEQHlijsac3zRuuQDsvl5sktLwB
	81PPh7ajbLWFbnEDqNwRC8z8EAH0iLmyT3YnQ7vzD67wyQunJVK1hRLKaUHCs9nNtVp+
	OLs/u0mnX67mprGy3KrPTMbez/yj1Sbcm/9ewRyiW8lcGlXIWzUKbrE9KqFUAu16+L+0
	sUJX7lTQ8Cz8Ly0PV0cRf/q75hBcTWUHGJaxamsNjqSuJHAG5HoaBjyC+v3KIrI9fojg
	xHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Qi4hQL+3yK6hkkl1oEJhyuR4GY5tFyoxjVo+XnXTHw0=;
	b=SD+U+xPV0Lh99qREud5rmVyMYQhzr97ho0MokSexZxfuMX1TKgLxken3bFwqi0T0xq
	PUBg6OyvbAYXZemdzSIw6uaVQhe+k3RxrAPkxcTxC6vZbd39dKHBgKB2mv5NofOkiMhk
	R4r09n2uS488mMWxyyTMHXWp8lmdaHboHgmr2zGo6kKkhVfXaQKUF0yvXqI5CBQnU9X5
	Oz/gEqkdLRczmjUKmZnMJl/34Dl07nGTuNSMif4v4CirbebkimToVgcqJml/f/xJZ2kI
	vM+lH+KYe57gi2PIer0w25A6dklBV170oNykLnMyPZny9naGg7/4EHVZNEuO3lzpBMd1
	6QWw==
X-Gm-Message-State: APjAAAU9bGqt9CIXpy4oen/ncG1xa/ZXjL0bZBAsj/ORsHWu/mJh1wDW
	O8v/vrCr5UPS8InlI/0Gkc+eHR7EX4s=
X-Google-Smtp-Source: APXvYqzpAqc8QCwT7JZJSYqfK1ba03JwnN4ccOw78ed3zvETdnzW9+adtSpkcezV3lOSapvC5ZZInQ==
X-Received: by 2002:a63:6ecf:: with SMTP id j198mr5922250pgc.437.1561673483264;
	Thu, 27 Jun 2019 15:11:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5ce7:5767:f5ab:b281?
	([2601:202:4180:c33:5ce7:5767:f5ab:b281])
	by smtp.gmail.com with ESMTPSA id j16sm174715pjz.31.2019.06.27.15.11.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 15:11:22 -0700 (PDT)
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
References: <20190627195523.6629-1-fabio.berton@ossystems.com.br>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1a56bb3a-172a-fefd-64c4-30089214b0fd@gmail.com>
Date: Thu, 27 Jun 2019 15:11:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627195523.6629-1-fabio.berton@ossystems.com.br>
Subject: Re: [warrior][PATCH] mesa: Update 19.0.1 -> 19.0.8
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
X-List-Received-Date: Thu, 27 Jun 2019 22:11:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/27/19 12:55 PM, Fabio Berton wrote:
> This commit adds the following changes:
>
> Updates from 19.0.8:
>
>   - Mesa 19.0.8 is an emergency bug fix release which fixes a critical
>     bug found in the 19.0.7 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.8.html
>
> Updates from 19.0.7:
>
>   - Mesa 19.0.7 is a bug fix release which fixes bugs found since the
>     19.0.6 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.7.html
>
> Updates from 19.0.6:
>
>   - Mesa 19.0.6 is a bug fix release which fixes bugs found since the
>     19.0.5 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.6.html
>
> Updates from 19.0.5:
>
>   - Mesa 19.0.5 is a bug fix release which fixes bugs found since the
>     19.0.4 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.5.html
>
> Updates from 19.0.4:
>
>   - Mesa 19.0.4 is a bug fix release which fixes bugs found since the
>     19.0.3 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.4.html
>
> Updates from 19.0.3:
>
>   - Mesa 19.0.3 is a bug fix release which fixes bugs found since the
>     19.0.2 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.3.html
>
> Updates from 19.0.2:
>
>   - Mesa 19.0.2 is a bug fix release which fixes bugs found since the
>     19.0.1 release.
>
>   Full log:
>   https://www.mesa3d.org/relnotes/19.0.2.html

Thanks for the bug fix details.  Help me with the decision making for
including in Warrior.

- Armin
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb}             | 0
>  meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb} | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb} (85%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.8.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_19.0.8.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.8.bb
> similarity index 85%
> rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa_19.0.8.bb
> index d90be8a074..8cb80b541e 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.0.8.bb
> @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
>  "
>  
> -SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
> -SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
> +SRC_URI[md5sum] = "9634964d87f1ce8d0230493e43f34c50"
> +SRC_URI[sha256sum] = "d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862"
>  
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER


