Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AC4C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 22:42:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.28006.1639262531874110843
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 14:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NRobhUna;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d24so21041841wra.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 14:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YiTthEFvk8q5DpAMQH6syRhZ+lmjFi+eU9Iq+h71pPk=;
        b=NRobhUnao4uqTnkQiHiHbfcS5NuqQDzLOwahobi17TiO96jR2X8YtpKea5XYySuF8F
         SkR3dqFLd83XaNJzBwgMQenlS/e8808tiDWyKJucXOQJuiiUxbWmh/l6fZ2X+UQ+j1KW
         n43zTaPWGGRrWhh2Bs2MbY9+Sco61RMtv42YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YiTthEFvk8q5DpAMQH6syRhZ+lmjFi+eU9Iq+h71pPk=;
        b=r/f+xfe5+AeHOJngxqzcS+YYSEf1A6dJZSen1NpOkDQynZdLo6qJIAKpcHkskByF7D
         56TwN8wwCOa9mpuu4U3t8WfVok7uDkfdQyOvr/XxSA4kc7/c4eqFLDN8RYIO389JDeQ7
         ficyBw/qPoHI5xih/QV9fEkG/NJaXvAIBlV3Aw0ayE/69FgjqFDV4u6+NoafeOo+pDtB
         ZijkzYls48ogG59ODDfYU78Zu0q+9fJ2+TBWARsI3Vv18dFovKfjwZgaVbFkbYK6E9wj
         JS2nVsQRaijlhYVkBAQiAXAmEYOXiFa8ZdbdU/MydrsO7oE6hrxt11jnM0r6Wogd0eX4
         5MsA==
X-Gm-Message-State: AOAM531Ze9PALxa4n45muCW8tCC/2zh9SwXz7v4Ur0ojV9eV8j5sd4pv
	UzfVe1I3UtBgoOf5uq3JJ49+VQ==
X-Google-Smtp-Source: 
 ABdhPJwYv6861YB3QPHRNRL4smzoOyr37Iv6X28Zo5n3eUWT5IxeoRm6s2+9SB1Oywci1q5E0mJflg==
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr22672926wrz.471.1639262530293;
        Sat, 11 Dec 2021 14:42:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dd:524c:81ce:484c?
 ([2001:8b0:aba:5f3c:dd:524c:81ce:484c])
        by smtp.gmail.com with ESMTPSA id
 g18sm2807945wmq.4.2021.12.11.14.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 14:42:09 -0800 (PST)
Message-ID: 
 <1eb02e48ddd4178aae55cb18bc84151b6ffd56e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] wayland: upgrade 1.19.0 -> 1.20.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Dec 2021 22:42:08 +0000
In-Reply-To: <1639249951-9342-1-git-send-email-denis@denix.org>
References: <1639249951-9342-1-git-send-email-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 22:42:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159575

On Sat, 2021-12-11 at 14:12 -0500, Denys Dmytriyenko wrote:
> Wayland 1.20.0 is released!
> 
> This release contains the following major changes:
> 
> - FreeBSD support has been entirely upstreamed and has been added to
>   our continuous integration system.
> - The autotools build system has been dropped. Meson has replaced it.
> - A few protocol additions: wl_surface.offset allows clients to update
>   a surface's buffer offset independently from the buffer,
>   wl_output.name and description allow clients to identify outputs
>   without depending on xdg-output-unstable-v1.
> - In protocol definitions, events have a new "type" attribute and can
>   now be marked as destructors.
> - A number of bug fixes, including a race condition when destroying
>   proxies in multi-threaded clients.
> 
> Drop patch to fix strndup detection on MinGW that no longer applies, as
> meson claims to had that fixed since version 0.54.2
> 
> Also backport libsdl2 patch to fix building against wayland-1.20.0
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
> v2 - fix libsdl2 breakage

Thanks, does the v2 also address the mingw failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4469

?

Cheers,

Richard


