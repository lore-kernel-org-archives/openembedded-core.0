Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.24409.1593330857471779755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 00:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QRcT8k8K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f139so13051501wmf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1WRhxlXhUoHvT8H+0A3e7ADqLt9pYzEXhf0moCadHkE=;
        b=QRcT8k8KntEWywC2OIwJxRQUQEHerJEDW0+d9zEW1ijMTd2Me8EBVIsHMWlYT+nb3D
         3acGLJAUezgGKnQwPDDUJXX2EcXIIudqb1moZbFy8UiUKbUkPhUcVrKv5zzKviKKBPd9
         DGJimOjY5praB6PlGyKwlXEGpfTNktjvSb/kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1WRhxlXhUoHvT8H+0A3e7ADqLt9pYzEXhf0moCadHkE=;
        b=iB5nCoG22vZrr314avIeDb1sIJFJsZxXqprI84mBBf0tHl/Xfo74TBX+qkFbb3sY3w
         xeM9+wIkOhL4zidDb6gSbQljVQ5Mtq2jC4v8Vpmgnirc8JseeDJu0m4SgQV6AlQyidh5
         Fwwjvo/U3O8hdxHL3hrs2/QE+w6ZIeScrVwNpynL2LeHCgsXrCi1mVb1RX8mizRAZluM
         MwMiF8rAlYeZzBQng3jM3FIvtYTMMmJoVLRE/ML8Ey5VV30I5wAwjwtZBA9R0y2tyq+E
         W/j1w4giK9kQ+LJ/JywAf7iaJ31l8TF6yYHT2nFfH5mhh0cpdMEBx83atdZWQYxbPoYB
         +Kog==
X-Gm-Message-State: AOAM5327hWAzZ4OYG/KmXonhDKPzq9H5NhSrjOHLAFTsvmdK9+Z4erqb
	EjCrVP2hNca6XOmncBcOoIA5Fw==
X-Google-Smtp-Source: ABdhPJyNMEGiZOHKXkNEsLMZk3ziMNOfqleFIX2d+Nt1g2w13+VOwK/h6kvbCXYM3jnfl1S5ZHp2KQ==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr11429504wmf.146.1593330856160;
        Sun, 28 Jun 2020 00:54:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r12sm43359615wrc.22.2020.06.28.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 00:54:15 -0700 (PDT)
Message-ID: <27f412b9914cfc57e36f34fd6e4e7d3119db4b76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-bad: don't select vulkan if directfb enabled.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chenxi Mao <maochenxi@eswin.com>, 
	openembedded-core@lists.openembedded.org
Cc: chenxi.mao2013@gmail.com
Date: Sun, 28 Jun 2020 08:54:14 +0100
In-Reply-To: <20200628053943.906548-2-maochenxi@eswin.com>
References: <20200628053943.906548-1-maochenxi@eswin.com>
	 <20200628053943.906548-2-maochenxi@eswin.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-06-28 at 13:39 +0800, Chenxi Mao wrote:
> vulkan didn't support directfb at all.
> So remove this configuration if directfb enabled.
> 
> Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0
> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
> index 7a227fed51..aee001e641 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
> @@ -24,7 +24,7 @@ inherit gobject-introspection
>  PACKAGECONFIG ??= " \
>      ${GSTREAMER_ORC} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>      bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \

This doesn't look right since what if DISTRO_FEATURES contains just
vulkan? This patch would stop vulkan being enabled when directfb isn't
enabled if I read it correctly?

Cheers,

Richard

