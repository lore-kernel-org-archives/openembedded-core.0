Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9A5C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.16547.1649592499761893222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 05:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NXx5nmQN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id i20so6021257wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pohd4/BgSADLGRgE1hmQvQRhkcJUxEQ5XIoZEc6fgI0=;
        b=NXx5nmQNY6AHMraHqAFoJhDl3DYQsiRVsKcIWI0hYXUA+Ho4NAnxFQkFk4UlZPQ0j6
         ScfZvzgLnkrO4roT2LuleBQwv2CzoHr5cQtZILP4FmF5xrhNZwZ64kjD4b7nOYzeAfmc
         /CPOwy9r1aIJBtGaCxDmKzGLNL5pPqB/NzkUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pohd4/BgSADLGRgE1hmQvQRhkcJUxEQ5XIoZEc6fgI0=;
        b=upT9V8IARx8QLNDgNzbNTVmRQ5Ho8AvzX270vm5yFUz0kSYeolAIXZJvP++nJEBV46
         8kDBa9eFLB1ult22sQfFIYGgaTcZ9WPsIiYBHLPjMZ+coCgwkdzdigFQcnPczPwC0YBY
         HfpKPWmiDDPXyXaTbQec/N/2T932Eu/Oes0Op++GQd7JJ6yfjuCuis2kvWKVlKQf2us0
         52WvJKrvxVrwhUywo4cBHVk2SwW8Bm2OaahtURYyeJ7XhQfe0OIRNEWg675XwdhTtSFr
         zNZOuYExN+6BfL9A4tdWfQmBh7q762bkJDjH39LiPXcXnmj8x16tUy8N9MZ452ytD3WY
         KkqQ==
X-Gm-Message-State: AOAM533VVVr6kwMFuf1tCZ7IKea1uHgnQS3hyt/LR6pMi36ByH07o8xE
	gll6FZZrJMaF+73HIe44+jhhKw==
X-Google-Smtp-Source: 
 ABdhPJzowMznYz9gG1k6fy+V5SbmhVIjH0F0DQ4nVaNSjM+ycBzuLSKh8spRrZqpLiHW/tG3ACnj6Q==
X-Received: by 2002:a05:6000:1882:b0:205:e697:b51d with SMTP id
 a2-20020a056000188200b00205e697b51dmr20703308wri.643.1649592498221;
        Sun, 10 Apr 2022 05:08:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d9b:707d:8b0b:b1df?
 ([2001:8b0:aba:5f3c:1d9b:707d:8b0b:b1df])
        by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm20886857wmb.36.2022.04.10.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:08:17 -0700 (PDT)
Message-ID: 
 <26975633900900c8af22e9c09754e36a1b16cc7a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] mesa: update to 22.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Oleksandr Kravchuk
	 <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 10 Apr 2022 13:08:15 +0100
In-Reply-To: <85ac6756-1b64-ca49-1e7f-9731668f842a@gmail.com>
References: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
	 <20220409141500.815506-2-open.source@oleksandr-kravchuk.com>
	 <85ac6756-1b64-ca49-1e7f-9731668f842a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164198

On Sat, 2022-04-09 at 07:51 -0700, Khem Raj wrote:
> 
> On 4/9/22 07:15, Oleksandr Kravchuk wrote:
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >   meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
> >   meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.1.bb} | 0
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >   rename meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.1.bb} (100%)
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > index 21fa1a6a9e..20295a0ff0 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >              file://0001-util-format-Check-for-NEON-before-using-it.patch \
> >              "
> >   
> > -SRC_URI[sha256sum] = "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711a647979987601250"
> > +SRC_URI[sha256sum] = "c05f9682c54560b36e0afa70896233fc73f1ed715e10d1a028b0eb84fd04426f"
> >   
> >   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> >   
> > @@ -34,7 +34,7 @@ do_install:append() {
> >       fi
> >   }
> >   
> > -DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
> > +DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pygments-native python3-markupsafe-native"
> 
> could you also describe the reason for these additional dependencies in 
> commit message ?

Are these not needed by python3-mako and perhaps should be there instead?

Cheers,

Richard


