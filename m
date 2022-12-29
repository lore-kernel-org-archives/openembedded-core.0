Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F1AC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 17:30:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.210494.1672335011974846190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 09:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d5Fg4hy+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so16813989wma.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 09:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ZmoFk0eI6MsMvKwTS5NjD3HIacHgDgroyQmxeOj44c=;
        b=d5Fg4hy+mXrM+Uyl3JlcPF7O583xhGOnCiFiHQAOuAkAsUayjIltPfYcIu3MrpU/3O
         4Z79UF46v5xPDEO+DoUejMGkRUEuAuFj4mH+Yce17UxqZMCDYQbGXG45soRXidYUh1z0
         6XO1JLoH2005dpMFFHPGZjZ5o91UfjZTkEZk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZmoFk0eI6MsMvKwTS5NjD3HIacHgDgroyQmxeOj44c=;
        b=AguKAODjV9g5SoJ28pDPuw6dfZgB0np/W9hg/QPYVXHEiGjfKHiUdAV8V9pREmn/Ek
         u3DdbL0j2p1od3sTRF7VwzkO8+gF3DyPfGCAAygwaHt9HUhpxojwh9hm0VQAUxJDd5/S
         tGjuaeJNXVUzJLBtvi5bgvyJCfuK1mM5r4/iiNF9XWtt5b+g3BZe0zedUS9IN+sPKr5V
         4EPQXiuUr5cM0ykfbd3f+XaPYTp7I9HN2GTyobU4lKGVIbI2GkyU3z8bnX30YU6cPAN9
         YpZWeTxbPPnJuA7jrlWtxFWFmS1nFl0BBMI98ConF4bJgWsZefiezcVPNUagBc3eFWzI
         ZCSg==
X-Gm-Message-State: AFqh2kqxKOAMu90zmBsGWBSVky764kLvhV8Inhl1BG8WG/5mbUK7ripK
	Uwkod0+QFh5EjYbJ2/iYTNfsQw==
X-Google-Smtp-Source: AMrXdXsYvlXWTLxLvDk7KRkezcvHGYUAh7y/GbFGIVwzsF3sCPb1g2WYLZaue9zpvOWEeWACbaMH1A==
X-Received: by 2002:a05:600c:3596:b0:3cf:497c:c4f5 with SMTP id p22-20020a05600c359600b003cf497cc4f5mr21503965wmq.13.1672335010422;
        Thu, 29 Dec 2022 09:30:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:43af:59a1:5bcf:54fb? ([2001:8b0:aba:5f3c:43af:59a1:5bcf:54fb])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b003d973d4fb28sm19362046wms.4.2022.12.29.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 09:30:10 -0800 (PST)
Message-ID: <17a0bc0fedaa85a2d6efebf6145d0e4dc77c0cc5.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2022 17:30:09 +0000
In-Reply-To: <Y62wQ3gdqXEFTB+/@nuoska>
References: <20221229151110.224320-1-f_l_k@t-online.de>
	 <Y62wQ3gdqXEFTB+/@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 17:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175124

On Thu, 2022-12-29 at 17:20 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Dec 29, 2022 at 04:11:10PM +0100, Markus Volk wrote:
> > While updating gnome-control-center I encountered an issue where
> > gtk-update-icon-cache could not be found and do_configure failed:
> >=20
> > > Program glib-compile-schemas found: YES (glib-compile-schemas)
> > > Program gtk4-update-icon-cache found: NO
> > > Program gtk-update-icon-cache found: NO
> > >=20
> > > ../gnome-control-center-43.2/meson.build:298:6: ERROR: Program 'gtk-u=
pdate-icon-cache' not found or not executable
> >=20
> > This can be fixed by using DEPENDS:append instead of DEPENDS +=3D
>=20
> Why? +=3D and :append are applied differently and it is crucial to
> understand why this is a problem in your case.
>=20
> IMO it's bad design to use :append everywhere because the changes can't
> be overwritten in a bbappend without explicitly removing all added
> things with :remove. In upstream and intermediate layers it's best to
> use +=3D where ever possible since these can then easily be overwritten i=
n
> product specific layers with a simple assignment.

I would much prefer to keep the +=3D and tweak the other place this is
being set to use +=3D as well so that :append isn't needed.

Replacing all +=3D with DEPENDS (which is where this path leads) creates
different and likely harder problems.

Cheers,

Richard


