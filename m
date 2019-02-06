Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6AFD60229
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 20:23:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y8so4277951wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ofbDaDJBX1OB6LaBw5XKEowi/gBlj84hGvbsMrP9up8=;
	b=STHo4n0o7saLyVSPIGrnrR1rLM56+5bQeEhUQ54FlkFr3rsjiYHRnEQw8oCVcyFxiD
	aTeuKphMkfuvEGoGOOakwspjSDEUAViKJo1hJn+H149XrD4TogXnjeSGHvmQzdl6+n17
	vt1pZdbqgw9ddR55Hbcn+A4fCO14sXviYg5gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ofbDaDJBX1OB6LaBw5XKEowi/gBlj84hGvbsMrP9up8=;
	b=U4thFjMHX0J7Oj8l4dsMrewBWWnyf/OGz2FZ7+Epa5ncyYovmSncCt0kzbiP/NFZZ7
	G8DRh2IdLr5Nq+ACirWVxziU96HvLuFNiME8hlhAnyYVz7+T3oikYnHMENEyYH0IDgZL
	6mUxfBQgM+uf1LZUtWMHNdo8T5sBoZBBSpx5PTgNiaVbtjLxXBKCWZ2pFUxo98MYyLNk
	Jn2OtScOM8EeN13PvkZrsNqwF4n7Sfi4jR7ub/Ua8Pr2X1P02uZqlaq1wHUoDkM9lOQi
	xT//SlaoasOJrb3UgEI4Jnmse6jg+tPnfbVDV6XOWYjboJMntXhq56RvsRhIjk26nbNB
	Aa1A==
X-Gm-Message-State: AHQUAub+JZJzmrmwgGp42bAB8PuVBNQYyOKQyG2tNcl38vArwvLOEDoj
	egXmCE2mbk3JFLCpUe4XF/zqtA==
X-Google-Smtp-Source: AHgI3IbrSQK66rZFKW/BchDF2zcEu692jOutg395U+E7L/eOx+QfrZFg6WBRfNmYDbI3U7dZeBZDzA==
X-Received: by 2002:a1c:e242:: with SMTP id z63mr4390455wmg.2.1549484634494;
	Wed, 06 Feb 2019 12:23:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	133sm27326413wme.9.2019.02.06.12.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Feb 2019 12:23:53 -0800 (PST)
Message-ID: <9aec20825c1b3b664ee9662ad10915994e4b2cd8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 06 Feb 2019 20:23:52 +0000
In-Reply-To: <20190206084444.16250-1-raj.khem@gmail.com>
References: <20190206084444.16250-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] grub2: Disable address-of-packed-member warnings
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
X-List-Received-Date: Wed, 06 Feb 2019 20:23:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-06 at 00:44 -0800, Khem Raj wrote:
> gcc9 has turned this warning into error when -Werror is used, lets
> paper
> it over by turning it into a warning for now
> 
> Fixes
> error: taking address of packed member of 'struct head' may result in
> an unaligned pointer value [-Werror=address-of-packed-member]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-
> bsp/grub/grub2.inc
> index 8e0f86217c..28e1c210e8 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -60,7 +60,7 @@ BUILD_CPPFLAGS = ""
>  BUILD_CFLAGS = ""
>  BUILD_CXXFLAGS = ""
>  BUILD_LDFLAGS = ""
> -
> +CPPFLAGS += "-Wno-error=address-of-packed-member"
>  do_configure_prepend() {
>  	# The grub2 configure script uses variables such as
> TARGET_CFLAGS etc
>  	# for its own purposes. Remove the OE versions from the
> environment to

This failed all over the place, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/264

Cheers,

Richard




