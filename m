Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DD2C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 23:19:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.31316.1638659985117671403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 15:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KwCpRv49;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u17so6580662wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 15:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oIq6/MDlgtZcWR5JV424xVp7tkdg7EiBOFMxr8R/t3c=;
        b=KwCpRv49GiV92uOIjQQxCN+z8jbHJs74GAO9+5JJ8aTlg7IeaK4HZhW217EYGCqi3R
         r8ADyhcnP1ChnBWsa41YPg2XiqsY8I9jfFZeS3t/yY1x02+LvigR+pc+lib/KlZNWGT2
         HM7bmaE2nb+yTA4O2r341ZM96uRyF47VQJvIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oIq6/MDlgtZcWR5JV424xVp7tkdg7EiBOFMxr8R/t3c=;
        b=JJxY2g2zqrWOGw6tXvzl+e5fJgZvNMMvbzh+MqjyOxfhIy+1B/4toz8LjSWmeS93z5
         tiEMV+JXMsLFAxQyYsPBsGjlqVkMfyz3gbV4wc061BpiR2Zmf7cSbLgWth7JEe986STE
         5NdaaCLGIxMe4zSOdkKOKJjPsh1Q/p1aT6P2hsb9cWRzXu0mIUr9Q0yThQiG9Eh0OuwG
         /2gNKDrXswyLGn5RGJBKM3laXWagQygszqGsUF8jIuHTulr1z82p627qoXkVmEzZu0uh
         c16Rqy0zCgSXH1JOsswK2ExTT86s725Ye30ka6LTFCO+fjJ/4sGOxGuIwtkHj2vPSGfV
         Wung==
X-Gm-Message-State: AOAM532zn1NblnNBjiuxr/H3alCjbFQT0LjH1mnm9lFFRULVWsPQj2pr
	s08fgxU3Au0w514Xhqh8KC9IwQ==
X-Google-Smtp-Source: 
 ABdhPJw+88MXUckk4eHoCbss4IrpQLYVkNQCYq96fmnq1PeSUN2O3ca3itOmL3oj+SYGMYrlbHObnQ==
X-Received: by 2002:a5d:456e:: with SMTP id
 a14mr31284974wrc.256.1638659983429;
        Sat, 04 Dec 2021 15:19:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:685e:e95e:8e62:a31c?
 ([2001:8b0:aba:5f3c:685e:e95e:8e62:a31c])
        by smtp.gmail.com with ESMTPSA id
 g13sm6427904wmk.37.2021.12.04.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 15:19:43 -0800 (PST)
Message-ID: 
 <505b640190d97b7dbcfc306de4c5a357008978a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] libxkbcommon: allow building of API
 documentation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 04 Dec 2021 23:19:42 +0000
In-Reply-To: <20211203164340.2963235-3-ross.burton@arm.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
	 <20211203164340.2963235-3-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 23:19:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159186

On Fri, 2021-12-03 at 16:43 +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> index 95accfc184..725fcf009e 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> @@ -15,11 +15,14 @@ UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
>  
>  inherit meson pkgconfig
>  
> -EXTRA_OEMESON = "-Denable-docs=false -Denable-xkbregistry=false"
> +EXTRA_OEMESON = "-Denable-xkbregistry=false"
>  
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
> -PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb xkeyboard-config,"
> +PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'docs', '', d)}"
> +
> +PACKAGECONFIG[docs] = "-Denable-docs=true,-Denable-docs=false,doxygen-native"
>  PACKAGECONFIG[wayland] = "-Denable-wayland=true,-Denable-wayland=false,wayland-native wayland wayland-protocols,"
> +PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb xkeyboard-config,"
>  

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2396/steps/11/logs/errors

stdio: ERROR: Nothing PROVIDES 'doxygen-native' (but /home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb, virtual:multilib:lib32:/home/pokybuild/yocto-worker/qemux86-world-alt/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb DEPENDS on or otherwise requires it). Close matches:

Not quite sure what is going on there yet, seems a little strange.

Cheers,

Richard



