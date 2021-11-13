Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A634C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 08:29:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.4019.1636792196439594760
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 00:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aP9J/klt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w29so19649730wra.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 00:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NPvQI7jKMkmHuzsp4KjD1JNqXQcRODL2nGMGuinQpL0=;
        b=aP9J/kltZiEf+nxiEQgNjXKBzmOG/BZmvNdZ2QB3j59lze5jJjOAf+4ZKOcJsSsN3P
         NCLK9aaykhDJGLYc+Fwv/dWBrbgHaUJVS9nuI6eCeKCyLlVWAfMOGOBmSjRvdxNOnFpK
         NL4zqs2PpMb+mM8cub18zo0eg3fyuEH//Sveg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NPvQI7jKMkmHuzsp4KjD1JNqXQcRODL2nGMGuinQpL0=;
        b=pceGmwJfK7+vIcazjS26KyoGOe692/xzxzHQveXU9GSTbf72iRHX98bZ4ZWSqN4aPD
         mOfXg92kZP+lwyU+TgLhJj/nztU88gZaXzcMFzPm8S70PWklNm64TSAvh7sBTHIZ8Qd0
         MEmcx9Rp4kEDr1ldyDQwdjQQjRiZOC6al7+p2LpdoNYIP2VtMCHfEBpnH4W4I8yrcoCI
         9u1gWPB0P4pzcpmKY2ozC0PIaMgrAgAQFyoaG+kvkP2azRi1U8L1oXR7ML8rBDOiS18i
         o6MMmqk9PhQFxVsLv1FofUt4hyJRQGR0dpJ1gaER4qcTjcKv+ymw+H0u8WO2KnXEJPf7
         xpyA==
X-Gm-Message-State: AOAM5303o+1cHLX5Rboe2mFJHF3C2oh2RyVgQZitdEjnl3xKgOhHtbtA
	u2fSsLI+gS4uzE7cmv4KgF66Bw==
X-Google-Smtp-Source: 
 ABdhPJxOmYnkFaXXOSDwnJ1EWXE9MpHNLJ/ciJBzrzwKsDunfhM75AGMcJHn8CW8KChSwhFNOfpunA==
X-Received: by 2002:a5d:4ed1:: with SMTP id
 s17mr26353577wrv.310.1636792194840;
        Sat, 13 Nov 2021 00:29:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5?
 ([2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5])
        by smtp.gmail.com with ESMTPSA id
 f3sm13601042wmb.12.2021.11.13.00.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 00:29:54 -0800 (PST)
Message-ID: 
 <07763608520c7c73364e1938c92a0c4c48f353d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] ncurses: clean up pkgconfig install
 location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 13 Nov 2021 08:29:51 +0000
In-Reply-To: <20211112140237.575404-6-ross.burton@arm.com>
References: <20211112140237.575404-1-ross.burton@arm.com>
	 <20211112140237.575404-6-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 08:29:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158239

On Fri, 2021-11-12 at 14:02 +0000, Ross Burton wrote:
> These is now an option to set the pkg-config install location, instead of
> injecting it into the install to override the detected location (which
> is into the sysroot).
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index a0ecd8a80b..89642ea782 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -86,6 +86,7 @@ ncurses_configure() {
>  	        --with-termlib=${EX_TERMLIB} \
>  	        --enable-sigwinch \
>  	        --enable-pc-files \
> +	        --with-pkg-config-libdir=${libdir}/pkgconfig \
>  	        --disable-rpath-hack \
>  		${EXCONFIG_ARGS} \
>  	        --with-manpage-format=normal \
> @@ -156,10 +157,7 @@ do_test() {
>  
>  _install_opts = " install.libs install.man "
>  
> -_install_cfgs = "\
> -  DESTDIR='${D}' \
> -  PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
> -"
> +_install_cfgs = "DESTDIR='${D}'"
>  
>  do_install() {
>          # Order of installation is important; widec installs a 'curses.h'

I'm afraid this doesn't work:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4347/steps/11/logs/stdio

and many other failures as well. Note the alsa-utils failure looks related too.

Cheers,

Richard


